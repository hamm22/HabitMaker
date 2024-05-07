<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹목록 페이지</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/groupFindStyle.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<section class="d-flex">
		
			<!--메뉴바 -->
			<c:import url="/WEB-INF/jsp/include/nav.jsp" />
	
			<!-- 메인 -->
			<div class="main-box">
				<div class="join-box">
					<h4 class="text-center"> ${userLoginId }님이 가입한 그룹</h4>

					<c:forEach var="group" items="${groupList}">
					<div class="d-flex justify-content-between mt-5 group-room">
						<div class="group-element">
							<h4>${group.name}</h4>
							<div class="leader">그룹장 : ${group.userLoginId}</div>
							<div class="mt-2">목표 : ${group.title}</div>
							<div class="mt-2">설명 : ${group.description}</div>
						</div>
						<div>
							<a href="/post/groupboard-view?groupId=${group.id }"><button type="button" id="MoveBtn">페이지로 이동</button></a>
						</div>
					</div>
					</c:forEach>

				</div>
				
			</div>

			<div class="right-box"></div>
		</section>
	</div>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</body>
</html>