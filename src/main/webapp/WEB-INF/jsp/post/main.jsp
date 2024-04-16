<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/mainStyle.css" type="text/css">
</head>
<body>



	<div id="wrap">
		<section class="d-flex">
	
			<!--메뉴바 -->
			<c:import url="/WEB-INF/jsp/include/nav.jsp" />
			
			<!-- 메인 -->
			<div class="main-box">
			
			</div>
			
			<!-- /메인 -->

			<div class="right-box" align="center">

				<div class="date d-flex">
					<i class="bi bi-chevron-left"></i>
					<div>오늘날짜</div>
					<i class="bi bi-chevron-right"></i>
				</div>
				<ul class="todo">
					<li><label class="chk_box"> <input type="checkbox" checked="checked" /> <span class="on"></span>
					습관1 </label></li>
					<li><label class="chk_box"> <input type="checkbox" checked="checked" /> <span class="on"></span>
					습관1 </label></li>
					<li><label class="chk_box"> <input type="checkbox" checked="checked" /> <span class="on"></span>
					습관1 </label></li>

				</ul>

				<div class="content-box">
					<textarea class="form-control mt-3" rows="7" id="contentsInput"></textarea>
				</div>
				
				<i class="bi bi-plus-circle-fill"></i>
			</div>

		</section>
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>


</body>
</html>