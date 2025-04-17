<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .price-area strong {
            font-size: 18px;
        }

        .tab-bar {
            display: flex;
            border-bottom: 2px solid #eee;
            margin-top: 30px;
        }

        .tab-bar .nav-link {
            font-weight: 600;
            padding: 12px 18px;
            color: #000;
            background: none;
            border-bottom: 3px solid transparent;
            transition: all 0.3s ease;
        }

        .tab-bar .nav-link:hover {
            background-color: #f9f9f9;
        }

        .tab-bar .nav-link.active {
            border-bottom: 3px solid black;
        }

        .curriculum-wrapper {
            margin-top: 15px;
        }

        .curriculum-item {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .video-wrapper {
            margin-top: 10px;
            cursor: pointer
        }
    </style>
    
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8">
            <div class="row align-items-center mb-4">
                <div class="col-md-3 text-center">
                    <img src="<c:url value='/resources/img/anyoujin.jpg'/>" class="img-fluid rounded-circle" style="width: 120px; height: 120px; object-fit: cover;" />
                </div>
                <div class="col-md-9">
                    <h5 class="mb-1" style="font-weight: bold;">${classDetail.me_nick}</h5>
                    <p class="mb-0 text-muted">${classDetail.cl_intro}</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-3">
                <h5>${classDetail.cl_title}</h5>
                <div class="price-area">
                    <strong>${classDetail.cl_money}원</strong>
                </div>
                <button class="btn btn-warning btn-block mt-2">구독으로 시작하기</button>
                <div class="d-flex justify-content-around mt-3">
                    <span>구독수 (추후)</span>
                </div>
            </div>
        </div>
    </div>

    <ul class="nav nav-tabs tab-bar" id="classTab">
        <li class="nav-item">
            <a class="nav-link active" href="#" data-type="intro">클래스 소개</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-type="item">준비물</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-type="curriculum">커리큘럼</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-type="creator">크리에이터</a>
        </li>
    </ul>

    <div id="tabContent" class="mt-4">
        <p>${classDetail.cl_intro}</p>
    </div>
</div>

<div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="videoModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="videoModalLabel">비디오 보기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <video id="videoPlayer" controls style="max-width:100%; margin-top:5px;">
                    <source id="videoSource" src="" type="video/mp4">
                </video>
                <button id="fullscreenButton" class="btn btn-primary mt-3">전체 화면</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $(".nav-link").click(function(e) {
            e.preventDefault();
            const type = $(this).data("type");
            const classNum = "${classDetail.cl_num}";

            $(".nav-link").removeClass("active");
            $(this).addClass("active");

            $.ajax({
                url: "/team3/class/" + classNum + "/tab",
                type: "GET",
                data: { type: type },
                success: function(res) {
                	console.log(res.curriculum);
                    let html = "";
                    if (type === "intro") {
                        html = "<p>" + (res.intro || "소개 내용이 없습니다") + "</p>";
                    } else if (type === "item") {
                        if (res.item && res.item.length > 0) {
                            const items = res.item.split(",");
                            html = "<ul>";
                            for (let item of items) {
                                html += "<li>" + item + "</li>";
                            }
                            html += "</ul>";
                        } else {
                            html = "<p>등록된 준비물이 없습니다</p>";
                        }
                    } else if (type === "curriculum") {
                        if (res.curriculum && Array.isArray(res.curriculum) && res.curriculum.length > 0) {
                            html = "<div class='curriculum-wrapper'>";

                            let printed = new Set();

                            for (let cur of res.curriculum) {
                                // 커리큘럼 제목이 처음인 경우만 출력
                                if (!printed.has(cur.cr_title)) {
                                    html += "<div class='curriculum-item'>" + cur.cr_title + "</div>";
                                    printed.add(cur.cr_title);
                                }

                                // 비디오 번호가 존재할 때만 출력
                                if (cur.vd_num) {
                                    html += "<div class='video-wrapper' onclick='openVideoModal(\"" + cur.vd_vidoe + "\")'>" + cur.vd_name + "</div>";
                                }
                            }
                            html += "</div>";
                        } else {
                            html = "<p>등록된 커리큘럼이 없습니다</p>";
                        }
                    } else if (type === "creator") {
                        html = "<p>크리에이터 정보는 아직 준비 중입니다</p>";
                    }
                    $("#tabContent").html(html);
                },
                error: function() {
                    $("#tabContent").html("<p> 불러오기 실패했습니다 </p>");
                }
            });
        });
    });

    function openVideoModal(videoUrl) {
        const videoElement = document.getElementById("videoPlayer");
        const videoSource = document.getElementById("videoSource");

        videoSource.src = "/resources/video/" + videoUrl;
        videoElement.load();
        $('#videoModal').modal('show');

        document.getElementById("fullscreenButton").onclick = function() {
            if (videoElement.requestFullscreen) {
                videoElement.requestFullscreen();
            } else if (videoElement.mozRequestFullScreen) {
                videoElement.mozRequestFullScreen();
            } else if (videoElement.webkitRequestFullscreen) {
                videoElement.webkitRequestFullscreen();
            } else if (videoElement.msRequestFullscreen) {
                videoElement.msRequestFullscreen();
            }
        };
    }
</script>
</body>
</html>