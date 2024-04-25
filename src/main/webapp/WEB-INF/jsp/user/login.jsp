<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Calendar" %>
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
	     <form action="#" id="loginForm">
	      <h1>HabitMaker</h1>
	      <div class="mt-2">
<!-- 	      <div class="social-container"> -->
<!-- 	        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a> -->
<!-- 	        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a> -->
<!-- 	        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a> -->
<!-- 	      </div> -->
<!-- 	      <span>or use your account</span> -->
<!-- 			<form id="loginForm"> -->
		      <input type="text" placeholder="아이디" id="idInput">
		      <input type="password" placeholder="비밀번호" id="passwordInput">
		      </div>
		      <button type="submit" class="mt-3" id="requestBtn">로그인</button>
<!-- 		     </form> -->
		      <a href="#">비밀번호를 잊으셨나요?</a>
		    </form>
		  </div>
		  <div class="overlay-container">
		    <div class="overlay">
		      <div class="overlay-panel overlay-right">
		        <h1>Hello, Friend!</h1>
		        <p>광고 문구</p>
		         <a href="/user/join-view"><button class="ghost">회원가입하기</button></a>
		      </div>
		    </div>
		  </div>
		</div>
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>

	// 현재 날짜 가쟈오기
	var today = new Date();
	
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	
	var dateString = year + '-' + month  + '-' + day;


	$(document).ready(function() {

		$("#loginForm").on("submit", function(e) {

			// submit 이벤트가 가진 고유의 기능을 취소
			e.preventDefault();

			let id = $("#idInput").val();
			let password = $("#passwordInput").val();

			// 유효성 검사
			if (id == "") {
				alert("아이디를 입력하세요");
				return;
			}

			if (password == "") {
				alert("비밀번호를 입력하세요");
				return;
			}

			$.ajax({
				type : "post",
				url : "/user/login",
				data : {
					"loginId" : id,
					"password" : password
				},
				success : function(data) {
					if (data.result == "success") {
						location.href = "/todo/main-view?dueDate=" + dateString;
					} else {
						alert("아이디와 비밀번호를 확인해 주세요");
					}
				},
				error : function() {
					alert("로그인 에러!");
				}
			});

		});

	});
</script>
</body>
</html>