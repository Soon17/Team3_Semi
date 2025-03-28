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
    	
      body {
        background-color: #f3f4f9;
        margin: 0;
        padding: 0;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
      }
      #form-container {
        padding: 60px 0; /* 위아래 여백 */
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #form-inner-container {
        background-color: white;
        width: 1200px; /* 옆으로 넓혀줌 */
        border-radius: 10px;
        box-shadow: 0 0 20px gainsboro;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
      }

      #sign-up-container,
      #sign-in-container {
        padding: 30px 50px; /* 패딩 줄임 */
        width: 300px;
      }

      form input:not(:last-of-type) {
        display: block;
        margin-bottom: 20px;
        border: 1px solid #e5e9f5;
        background-color: #f6f7fa;
        padding: 20px;
        margin-top: 10px;
        border-radius: 10px;
        width: 100%;
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

      #terms:checked:after {
        content: "\2713";
        color: #7369ab;
        font-size: 24px;
        position: absolute;
        top: 0;
        left: 3px;
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

      @media (max-width: 684px) {
        #form-controls {
          text-align: center;
          margin: 0;
          padding: 0;
        }

        button {
          width: 100%;
        }

        form input:not(:last-of-type) {
          width: 85%;
        }

        #toggleSignIn,
        #toggleSignUp {
          padding: 16px 75px;
        }

        #terms {
          width: 20px;
          height: 20px;
        }

        label[for="terms"] {
          display: inline-block;
          font-size: smaller;
        }
      }
    </style>
  </head>

  <body>
    <div id="form-container">
      <div id="form-inner-container">
        <!-- Sign up form -->
        <div id="sign-up-container">
          <h3>Get Started</h3>
          <form>
            <label for="name">Name</label>
            <input type="text" name="name" id="name" placeholder="Name" />

            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="Email" />
			
			<label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="Email" />
            
            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="Email" />
            	
            <label for="password">Password</label>
            <input
              type="password"
              name="password"
              id="password"
              placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"
            />

            <div id="form-controls">
              <button type="submit">Sign Up</button>
              <button type="button" id="toggleSignIn">Sign In</button>
            </div>

            <input type="checkbox" name="terms" id="terms" />
            <label for="terms"
              >I agree to the
              <a href="#" class="termsLink">Terms of service</a> and
              <a href="#" class="termsLink">Privacy Policy</a>.</label
            >
          </form>
        </div>

        <!-- Sign in form -->
        <div id="sign-in-container" class="hide">
          <h3>Welcome Back</h3>
          <form>
            <label for="username">Username</label>
            <input
              type="text"
              name="username"
              id="username"
              placeholder="user@example.com"
            />

            <label for="password">Password</label>
            <input
              type="password"
              name="password"
              id="password"
              placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"
            />

            <div id="form-controls">
              <button type="submit">Sign In</button>
              <button type="button" id="toggleSignUp">Sign Up</button>
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
    <script type="text/JavaScript" src="./my-script.js"></script>
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
  </body>
</html>
