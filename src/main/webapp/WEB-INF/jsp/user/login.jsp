<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/joinStyle.css" type="text/css">
</head>
<body>
	<div class="container" id="container">
	  <div class="form-container sign-in-container">
	    <form action="#">
	      <h1>HabitMaker</h1>
	      <div class="mt-2">
<!-- 	      <div class="social-container"> -->
<!-- 	        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a> -->
<!-- 	        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a> -->
<!-- 	        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a> -->
<!-- 	      </div> -->
<!-- 	      <span>or use your account</span> -->
	      <input type="text" placeholder="아이디" />
	      <input type="password" placeholder="비밀번호" />
	      </div>
	      <button class="mt-3">로그인</button>
	      <a href="#">비밀번호를 잊으셨나요?</a>
	    </form>
	  </div>
	  <div class="overlay-container">
	    <div class="overlay">
	      <div class="overlay-panel overlay-right">
	        <h1>Hello, Friend!</h1>
	        <p>광고 문구</p>
	         <a href="/user/join-view"><button class="ghost" id="signUp">회원가입하기</button></a>
	      </div>
	    </div>
	  </div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>