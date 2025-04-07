<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
    <style type="text/css">
    	
      #form-container {
        padding: 60px 0; 
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #form-inner-container {
        background-color: white;
        width: 1200px; 
        border-radius: 10px;
        box-shadow: 0 0 20px gainsboro;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
      }

      #sign-up-container,
      #sign-in-container {
        padding: 30px 50px; 
        width: 300px;
      }

		#sign-up-container form input:not(:last-of-type),
		#sign-in-container form input:not(:last-of-type) {
		  display: block;
		  margin-bottom: 20px;
		  border: 1px solid #e5e9f5;
		  background-color: #f6f7fa;
		  padding: 20px;
		  margin-top: 10px;
		  border-radius: 10px;
		  width: 150%;
		}

      #form-controls {
        margin-bottom: 20px;
      }

      h3 {
        color: red;
        font-size: 150%;
        font-weight: 500;
      }
 
      label {
        color: #7369ab;
      }

    
       #form-controls button {
        border: none;
        font-size: 120%;
      }

      #form-controls button:hover {
        cursor: pointer;
      }

      button[type="submit"] {
        padding: 16px 75px;
        background-color: #ed4b5e;
        border-radius: 10px;
        color: white;
      }

      button[type="submit"]:hover {
        background-color: #ff6678;
      }

      button[type="button"] {
        padding: 16px 0 16px 35px;
        background-color: transparent;
        color: #ed4b5e;
      }

      #terms {
        width: 30px;
        height: 30px;
        appearance: none;
        border: 2px solid #7369ab;
        border-radius: 4px;
        position: relative;
      }

      label[for="terms"] {
        display: inline-block;
        width: 80%;
        margin-left: 10px;
      }

      .termsLink {
        color: #ef7886;
        text-decoration: none;
      }

      .hide {
        display: none !important;
      }

      #animation-container {
        display: inline-block;
      }

      /* responsive display */

      @media (max-width: 1438px) {
        lottie-player {
          width: 300px !important;
        }
      }

      @media (max-width: 1124px) {
        #animation-container {
          display: none;
        }

        #form-inner-container {
          display: flex;
          justify-content: center;
        }
      }
		.error,.red{ 
			color : red; 
			font-size: 12px;
		 	margin-top: 5px;
		}
		.green{ 
			color : green; 
			font-size: 12px;
			margin-top: 5px;
		}
    </style>

  </head>

  <body>
    <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>Get Started</h3>
          <form id="f1" action="<c:url value="/signup"/>" method="post">
          	
       		<label for="name">Name</label>
          	<input type="text" name="me_name" id="name" placeholder="Name" />
            <br>
            <label for="name">ID</label>
            <input type="text" name="me_id" id="id" placeholder="아이디를 입력하세요" />
			<label id="checkId" class="error"></label>
			
			<br>
			
			<label for="password">Password</label>
            <input
              type="password"
              name="me_pw"
              id="me_pw"
              placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"
            />
			<br>
			<label for="name">닉네임</label>
            <input type="text" name="me_nick" id="nick" placeholder="닉네임을 입력하세요"/>
            <br>
            <label for="email">Email</label>
            <input type="text" name="me_email" id="email" placeholder="Email" />
            <br>	
            <label for="name">전화번호</label>
            <input type="text" name="me_number" id="number" placeholder="-를 제외한 전화번호를 입력하세요"/>
			<br>
            <div id="form-controls">
              <button type="submit">Sign Up</button>
              <button type="button" id="toggleSignIn">Login</button>
            </div>

            <input type="checkbox" name="terms" id="terms" />
            
          </form>
        </div>

        <!-- Sign in form -->
        <div id="sign-in-container" class="hide">
          <h3>Welcome Back</h3>
          <form  id="f2" action="<c:url value="/login"/>" method="post">
            <label for="username">ID</label>
            <input
              type="text"
              name="me_id"
              id="username"
              placeholder="user@example.com"
            />

            <label for="password">Password</label>
            <input
              type="password"
              name="me_pw"
              id="password"
              placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"
            />
           
         
            <div id="form-controls">
              <div>
                <button type="submit">Login</button>
              </div>
              <div>
                <button type="button" id="toggleSignUp">Sign Up</button>
              </div>
              <div>
                <a class="p-2" href="<c:url value="/kakao/login"/>">
                	<img src="<c:url value='/resources/static/kakao_login_medium_narrow.png' />" alt="카카오 로그인" style="height:35px">
              	</a>
              </div>                 
            </div>
         
            <input type="checkbox" name="terms" id="terms" />
            <label for="terms"
              >I agree to the
              <a href="#" class="termsLink">Terms of service</a> and
              <a href="#" class="termsLink">Privacy Policy</a>.</label
            > 
          </form>
        </div>

        <!-- Lottie animation -->
        <div id="animation-container">
          <lottie-player
            src="https://assets3.lottiefiles.com/packages/lf20_aesgckiv.json"
            background="transparent"
            speed="1"
            style="width: 520px; height: 520px"
            loop
            autoplay
          ></lottie-player>
        </div>
      </div>
    </div>

    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    <script type="text/javascript">
      const signInBtn = document.querySelector("#toggleSignIn");
      const signUpBtn = document.querySelector("#toggleSignUp");

      const signUpForm = document.querySelector("#sign-up-container");
      const signInForm = document.querySelector("#sign-in-container");

      // Change form when clicking on button
      const changeForm = (form1, form2) => {
        form1.classList.toggle("hide");
        form2.classList.toggle("hide");
      };

      // Show the Sign In form
      signInBtn.addEventListener("click", () => {
        changeForm(signUpForm, signInForm);
      });

      // Show the Sign Up form
      signUpBtn.addEventListener("click", () => {
        changeForm(signUpForm, signInForm);
      });
    </script>
    <!-- 정규 표현식 -->
    <script type="text/javascript">
		//아이디
		$("#id").on("input",function(e){
			checkId();
		});
		function checkId(){
			//입력한 아이디를 가져옴
			$("#checkId").text("");
			let id = $("#id").val();

			if(!/^[a-zA-Z0-9]{3,13}$/.test(id)){
				return false;
			}
			
			let res = false;
			//비동기 통신으로 아이디를 전송하고, 서버에서 보낸 결과를 이용하여 처리
			$.ajax({
				async : false, 
				url : '<c:url value="/check/id"/>', 
				type : 'post', 
				data : { id : id }, 
				success : function (data){
					if(data){
						res = true;	
					}
				}, 
				error : function(jqXHR, textStatus, errorThrown){

				}
			});
			let str;
			if(res){
				str = "사용 가능한 아이디입니다.";
				$("#checkId").addClass("green");
				$("#checkId").removeClass("red");
			}else{
				str = "이미 사용중인 아이디입니다.";
				$("#checkId").addClass("red");
				$("#checkId").removeClass("green");
			}
			$("#checkId").text(str);
			return res;
		}
		
		$("#f1").validate({
			rules : {
				me_id : {
					required : true,
					regex : /^[a-zA-Z0-9]{3,13}$/
				},
				me_name : {
					required : true,
					regex : /^(?!\s*$).+/ 
				},
				me_pw : {
					required : true,
					regex : /^[a-zA-Z0-9!@#$]{3,15}$/
				},
				me_nick : {
					required : true,
					regex : /^[a-zA-Z0-9가-힣]{2,10}$/
				},
				me_email : {
					required : true,
					email : true
				},
				me_number : {
					required : true,
					regex : /^010-\d{4}-\d{4}$/
				}
			},
			messages : {
				me_id : {
					required : "필수 항목입니다.",
					regex : "아이디는 영문, 숫자만 가능하며, 3~13자입니다."
				},
				me_name : {
					required : "필수 항목입니다.",
					regex : "이름이 비어있습니다"
				},
				me_pw : {
					required : "필수 항목입니다.",
					regex : "비번은 영문, 숫자,특수문자(!@#$)만 가능하며, 3~15자입니다."
				},
				me_nick : {
					required : "필수 항목입니다.",
					regex : "닉네임은 특수문자를 제외한 두글자 이상입니다"
				},
				me_email : {
					required : "필수 항목입니다.",
					email : "이메일 형식이 아닙니다."
				},
				me_number : {
					required : "필수 항목입니다.",
					regex : "전화번호를 올바르게 적어주세요"
				}
			},
			//유효성 검사 체크 후 전송하기 직전에 확인하고 싶을 때 사용. return true 전송
			submitHandler : function(){
				return checkId();
			}
		})
		$.validator.addMethod("regex", function(value, element, regex){
			var re = new RegExp(regex);
			return this.optional(element) || re.test(value);
		}, "정규표현식을 확인하세요.");
	</script>
  </body>
</html>