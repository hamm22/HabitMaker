<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/navStyle.css" type="text/css">
</head>
<body>
		<div class="left-box" align="center">
				<div class="nav-container">
					<ul class="menu">
						<h1>HabitMaker</h1>
						<li><a href="/todo/main-view?dueDate=${param.dueDate} ">  <i class="bi bi-house-fill"></i> 홈</a></li>
						<li><a href="/todo/calendar-view?dueDate=${param.dueDate}"><i class="bi bi-calendar"></i> 캘린더</a></li>
						<li><a href="/group/list-view"><i class="bi bi-people-fill"></i> 그룹</a></li>
						<li><a href="/group/find-view"><i class="bi bi-person-plus-fill"></i> 그룹찾기</a></li>
						<li><a href="#"><i class="bi bi-person-fill-gear"></i> 설정</a></li>
						<div class="profile mt-5">${userLoginId }님</div>
						<button type="button" class="btn btn-secondary mt-3" id="logoutBtn" onclick="logout()">로그아웃</button>
					</ul>
				</div>
			</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
	function logout() {
		  window.location.href = "/user/logout";
		}
</script>
</body>
</html>