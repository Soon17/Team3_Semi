<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
   		ul {
		  list-style-type: none;
		  padding-left: 0;
		  margin: 0;
		}
		
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

		.curriculum-item:first-of-type {
		    border-top: none;
		}
		
      	.curriculum-wrapper {
		    margin-top: 20px;
		    padding: 5px;
		    border-radius: 12px;
		    border: 1px solid #e0e0e0;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.03);
		    
		}

       .curriculum-item {
		    font-size: 1.05rem;
		    font-weight: 700;
		    color: #ffffff;
   			background: linear-gradient(to right, #2C3E50, #4A6FA5);
		    padding: 14px 18px;
		    border-radius: 12px;
		    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
		}
		
		.video-wrapper {
		    padding: 10px 14px;
		    transition: all 0.2s ease-in-out;
		    font-size: 0.98rem;
		    color: #444;
		}
		
		.video-wrapper:hover {
		    background-color: #f5f5f5;
		    border-color: #bbb;
		    transform: translateX(5px);
		    cursor: pointer;
		}
		
		.card.p-3 {
		    border-radius: 14px;
		    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
		    border: 1px solid #ddd;
		    background: #fdfdfd;
		    transition: all 0.3s ease-in-out;
		}
		
		.card.p-3:hover {
		    transform: translateY(-4px);
		    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
		}
		
		.card.p-3 h5 {
		    font-size: 1.3rem;
		    font-weight: bold;
		    color: #333;
		    margin-bottom: 8px;
		}
		
		.price-area strong {
		    font-size: 15px;
		}
		
		.btn-warning {
		    background: linear-gradient(to right, #2C3E50, #4A6FA5); 
		    border: none;
		    font-weight: bold;
		    color: white;
		    transition: background 0.3s ease;
		}
		
		.btn-warning:hover {
		    background: linear-gradient(to right, #1C2B3A, #365C9A);
		    color: white; 
		}

    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8">
            <div class="row align-items-center mb-4">
                <div class="col-md-3 text-center">
				    <c:choose>
				        <c:when test="${not empty classDetail.me_profile}">
				            <c:choose>
				                <c:when test="${fn:startsWith(classDetail.me_profile, 'http')}">
				                    <img src="${classDetail.me_profile}" class="img-fluid rounded-circle"
				                         style="width: 120px; height: 120px; object-fit: cover;" />
				                </c:when>
				                <c:otherwise>
				                    <img src="<c:url value='/profile/${classDetail.me_profile}'/>" class="img-fluid rounded-circle"
				                         style="width: 120px; height: 120px; object-fit: cover;" />
				                </c:otherwise>
				            </c:choose>
				        </c:when>
				        <c:otherwise>
				            <img src="<c:url value='/profile/default.png' />" class="img-fluid rounded-circle"
				                 style="width: 120px; height: 120px; object-fit: cover;" />
				        </c:otherwise>
				    </c:choose>
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
                	<c:choose>
					    <c:when test="${checkSubscribed}">
					        <button class="btn btn-secondary btn-block mt-2" disabled>구독 중</button>
					    </c:when>
					    <c:otherwise>
					        <form method="post" action="<c:url value='/subscribe'/>">
					            <input type="hidden" name="cl_num" value="${classDetail.cl_num}" />
					            <button type="submit" class="btn btn-warning btn-block mt-2">구독으로 시작하기</button>
					        </form>
					    </c:otherwise>
					</c:choose>
                <div class="d-flex justify-content-around mt-3">
				    <span>구독 : ${subscribeCount} 명</span>
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
            <a class="nav-link" href="#" data-type="creator">강사 페이지</a>
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

<hr>
<!-- 댓글 영역 시작 -->
<div class="comment-box mt-5">

    <!-- Ajax로 댓글 출력될 곳 -->
    <div id="comment-section">
        <!-- 댓글이 여기에 들어옵니다 -->
    </div>

    <!-- 댓글 작성 폼 -->
    <!-- 로그인 확인 및 구독 확인 후 댓글 작성 띄어지게 -->
    <form id="commentForm" class="d-flex justify-content-between mt-3">
	    <input type="hidden" name="co_cl_num" value="${classDetail.cl_num}" />
	    <textarea name="co_content" class="form-control me-2" placeholder="댓글을 입력해 주세요." required></textarea>
	    <div>
	        <button type="submit" class="btn btn-outline-success btn-reply">등록</button>
	    </div>
	</form>

</div>

<script type="text/javascript">

const cl_num = ${classDetail.cl_num}; // 클래스 번호

// 댓글 목록 불러오기
function loadComments(cl_num) {
    $.ajax({
        url: "<c:url value="/comment/list/"/>" + cl_num,
        type: "GET",
        dataType: "json",
        success: function (comments) {
            let html = "";
            if (comments.length === 0) {
                html = "<p>댓글이 없습니다.</p>";
            } else {
                comments.forEach(function (comment) {
		            console.log(comment)
					let btns = "";
					if('${member.me_num}' == comment.co_me_num){
						btns = `
							<div>
	                            <button class="btn btn-sm btn-outline-success me-1 btn-update" data-id="\${comment.co_num}">수정</button>
	                            <button class="btn btn-sm btn-outline-danger btn-delete" data-id="\${comment.co_num}">삭제</button>
	                        </div>
						`
					}
	                   html += `
	                	   <div class="comment-box comment-item">
	                           <p><strong>\${comment.me_nick}</strong> <small>\${new Date(comment.co_date).toLocaleString()}</small></p>
	                           <p class="comment-content">\${comment.co_content}</p>
	                           
	                           \${btns}
	                           <hr>
	                       </div>
	                   `;
               		});
           		}
           $("#comment-section").html(html);
        },
        error: function () {
            $("#comment-section").html("<p>댓글을 불러오지 못했습니다.</p>");
        }
    });
}
	$(document).ready(function () {
	
	    // 페이지 로드 시 댓글 불러오기
	    loadComments(cl_num);
	});
	//댓글 등록 Ajax
	$("#commentForm").on("submit", function (e) {
	    e.preventDefault(); // 기본 폼 제출 막기
	
	    const formData = $(this).serialize();
		console.log(formData);
	    $.ajax({
	        url: "<c:url value="/comment/insert"/>",
	        type: "POST",
	        data: formData,
	        success: function (data) {
	            // 등록 성공 후 입력창 초기화 & 댓글 목록 새로 불러오기
	            $("#commentForm")[0].reset();
	            if(data){
                    alert("댓글을 등록했습니다.");
                    loadComments(cl_num); // 새로고침
                } else {
                    alert("댓글 등록에 실패했습니다.");
                }
	        },
	        error: function () {
	            //alert("댓글 등록에 실패했습니다.");
	        }
	    });
	});
       $(".btn-reply").click(function(e){
		
    	   if ('${member != null ? member.me_id : ""}' === ''){
			if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하겠습니까?")){
				location.href = "<c:url value="/signup"/>";
			}
			return;
		}
		
		if($(this).parent().next().length != 0){
			return;
		}
		let num = $(this).data("num");
		let str = `
			<form class="comment-insert-form input-group" data-num="\${num}">
				<textarea name="content" class="form-control"></textarea>
				<button type="submit" class="btn btn-outline-success">댓글 등록</button>
			</form>
		`;
		$(this).parent().after(str);
	})
 // 삭제 버튼 동작 (이벤트 위임 사용)
    $(document).on("click", ".btn-delete", function(e){
        e.preventDefault();
        if(!confirm("정말 삭제하시겠습니까?")) return;

        const num = $(this).data("id");

        $.ajax({
            url : '<c:url value="/comment/delete"/>', 
            type : 'post', 
            data : { co_num : num },
            success : function (data){
                if(data){
                    alert("댓글을 삭제했습니다.");
                    loadComments(cl_num); // 새로고침
                } else {
                    alert("댓글 삭제에 실패했습니다.");
                }
            },
            error : function(){
                alert("에러가 발생했습니다.");
            }
        });
    });
  // 댓글 수정 버튼 클릭 시
     $(document).on("click", ".btn-update", function(e){
         e.preventDefault();
         
         var $commentItem = $(this).closest(".comment-item");
         var $content = $commentItem.find(".comment-content");
         var content = $content.text().trim();
         $content.hide();

         // 이미 수정 폼이 있으면 return
         if ($content.next(".comment-update-form").length > 0) return;

         let num = $(this).data("id");
         var str = `
             <form class="comment-update-form input-group mt-2" data-num="\${num}">
                 <textarea name="co_content" class="form-control me-2">\${content}</textarea>
                 <button type="submit" class="btn btn-outline-success">댓글 수정</button>
             </form>
         `;
         $content.after(str);

         // 수정/삭제 버튼 숨기기
         $(this).closest("div").hide();
     });
     $(document).on("submit", ".comment-update-form", function(e){
    	    e.preventDefault();

    	    const $form = $(this);
    	    const num = $form.data("num");  // 댓글 번호
    	    const content = $form.find("textarea[name='co_content']").val().trim();  // 수정된 댓글 내용

    	    if(content === ""){
    	        alert("내용을 입력해주세요.");
    	        return;
    	    }

 	    // Ajax로 댓글 수정 요청 보내기
 	    $.ajax({
 	        url: '<c:url value="/comment/update"/>',  // 서버 URL
 	        type: "POST",
 	        contentType: "application/json",
 	        data: JSON.stringify({
 	            co_num: num,  // 댓글 번호
 	            co_content: content  // 수정된 댓글 내용
 	        }),
 	        success: function(res){
 	            if(res){
 	                alert("댓글이 수정되었습니다.");

 	                // 수정된 댓글 내용을 화면에 반영
 	                const $commentBox = $form.closest(".comment-item");  // 해당 댓글 박스를 찾음
 	                $commentBox.find(".comment-content").text(content).show();  // 댓글 내용 갱신
 	                $form.remove();  // 수정 폼 제거
 	                $commentBox.find(".btn-update").closest("div").show();  // 수정/삭제 버튼 다시 표시
 	            } else {
 	                alert("댓글 수정에 실패했습니다.");
 	            }
 	        },
 	        error: function(){
 	            alert("서버 오류로 댓글 수정에 실패했습니다.");
 	        }
 	    });
 	});
</script>
<script>
	$(function() {
		$("#classTab .nav-link").click(function(e) {
	        e.preventDefault();
	        const type = $(this).data("type");
	        const classNum = "${classDetail.cl_num}";
	        const checkSubscribed = ${checkSubscribed};
	        
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
	                        let count = 1;
	                        let prevTitle = "";
	
	                        for (let cur of res.curriculum) {
	                            if (!printed.has(cur.cr_title)) {
	                                html += "<div class='curriculum-item'>" + cur.cr_title + "</div>";
	                                printed.add(cur.cr_title);
	                                count = 1; // 타이틀 바뀌면 번호 초기화
	                            }
	
	                            if (cur.vd_num) {
	                                if (checkSubscribed) {
	                                	const contextPath = "/team3"; // 또는 동적으로 window.location.pathname에서 추출 가능
	                                	html += "<div class='video-wrapper' onclick='openVideoWindow(\"" + contextPath + "/uploads" + cur.vd_vidoe + "\")'>" 
	                                	        + (count++) + ". " + cur.vd_name + "</div>";
	                                } else {
	                                    html += "<div class='video-wrapper' style='color:gray; cursor: not-allowed;'>" 
	                                          + (count++) + ". " + cur.vd_name + " (구독 필요)</div>";
	                                }
	                            }
	                        }
	                        html += "</div>";
	                    } else {
	                        html = "<p>등록된 커리큘럼이 없습니다</p>";
	                    }
	                }else if (type === "creator") {
	                    const teacherNum = "${classDetail.cl_tc_me_num}";
	                    window.location.href = "/team3/teacher/" + teacherNum;
	                    return;
	                }
	                $("#tabContent").html(html);
	            },
	            error: function() {
	                $("#tabContent").html("<p> 불러오기 실패했습니다 </p>");
	            }
	        });
	    });
	    
	});

    // 새 창에서 비디오 재생
   function openVideoWindow(videoUrl) {
    const popup = window.open('', '_blank', 'width=1000,height=700,resizable=yes,scrollbars=no');
    if (!popup) {
        alert("팝업 차단 해제해주세요!");
        return;
    }

    

    popup.document.write(`
        <html>
        <head>
            <title>강의 영상</title>
            <style>
                body {
                    margin: 0;
                    background-color: black;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                }
                video {
                    width: 90%;
                    max-height: 90vh; 
                }
            </style>
        </head>
        <body>
            <video id="videoPlayer" controls autoplay muted playsinline>
                <source src="` + videoUrl + `" type="video/mp4">
                이 브라우저는 비디오 태그를 지원하지 않습니다.
            </video>
            <script>
                const video = document.getElementById('videoPlayer');
                video.muted = true;
                video.play();
            <\/script>
        </body>
        </html>
    `);

    popup.document.close();
}

</script>


</body>
</html>