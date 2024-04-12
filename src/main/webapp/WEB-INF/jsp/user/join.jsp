<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
<!-- 	      <span>or use your email for registration</span> -->
	      <input type="text" placeholder="성명" />
	      <div class = "d-flex">
		      <input type="text" placeholder="아이디" id="idInput"/>
		      <button type="button" class="ml-2" >중복확인</button>
	      </div>
	      <input type="text" placeholder="이메일주소" />
	      <input type="password" placeholder="비밀번호" />
		<input type="password" placeholder="비밀번호확인" />
		</div>
	      <button class="mt-3" id="joinBtn">가입하기</button>
	    </form>
	  </div>

	<div class="overlay-container">
	    <div class="overlay">
	      <div class="overlay-panel overlay-left">
	        <h1>Welcome Back!</h1>
	        <p>광고 문구</p>
	       <a href="/user/login-view"><button class="ghost">로그인하기</button></a>
	      </div>
	      <div class="overlay-panel overlay-right">
	        <h1>Hello, Friend!</h1>
	        <p>광고 문구</p>
	        <a href="/user/login-view"><button class="ghost" id="signIn">로그인하기</button></a>
	      </div>
	    </div>
	  </div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 가입 버튼
		$("#joinBtn").on("click", function() {
			let id = $()
		});
		
	});
</script>
</body>
</html>