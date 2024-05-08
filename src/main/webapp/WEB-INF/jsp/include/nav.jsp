<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/static/css/navStyle.css" type="text/css">


<%-- <c:set var="now" value="new java.util.Date();"/> --%>
<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate var="dateString" value="${now}" pattern="yyyy-MM-dd"/>
		<div class="left-box" align="center">
				<div class="nav-container">
						<h1>HabitMaker</h1>
					<ul class="menu">
						<li><a href="/todo/main-view?dueDate=${dateString }"><i class="bi bi-house-fill"></i> 홈</a></li>
						<li><a href="/todo/calendar-view?dueDate=${dateString }"><i class="bi bi-calendar"></i> 캘린더</a></li>
						<li><a href="/group/list-view"><i class="bi bi-people-fill"></i> 그룹</a></li>
						<li><a href="/group/find-view"><i class="bi bi-person-plus-fill"></i> 그룹찾기</a></li>
						<li><a href="#"><i class="bi bi-person-fill-gear"></i> 설정</a></li>
					</ul>
					<div class="profile mt-5">${userLoginId }님</div>
					<a href="/user/logout" class="btn btn-secondary mt-3">로그아웃</a>
				</div>
			</div>