<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 게시판</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/boardStyle.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<section class="d-flex">
	
			<!--메뉴바 -->
			<c:import url="/WEB-INF/jsp/include/nav.jsp" />
			
			<!-- 메인 -->
			<div class="main-box">

				<div class="post-group">
					<i class="bi bi-arrow-left-short" onclick="find()"></i>
					<div class="post-group-box">
						<h5 class="group-name">그룹명</h5>
						<div class="notice mt-3">
							<div class="group-title">목표 :</div>
							<div class="mt-3 group-description">설명 :</div>
						</div>
					</div>
				</div>

				<!-- 게시글 입력칸 -->
				<div class="post-box mt-3">
					<div class="post-contents mt-3">
						<textarea placeholder="게시글을 남겨 보세요." class="contents-box"
							id="contentsInput" resize="vertical"></textarea>
						<div class="d-flex post-contents2">
							<i class="bi bi-card-image mr-3"></i>
							<button type="button" class="btn btn-success" id="post-btn">게시하기</button>
						</div>
					</div>
				</div>

				<div class="post-card">
					<div class="post-card-list">
						<div class="mt-3">사용자아이디</div>
						<div>
							<img class="post-image" alt="고양이"
								src="https://cdn.pixabay.com/photo/2023/08/18/15/02/cat-8198720_1280.jpg">
						</div>
						<div class="post-card-contents mt-2">내용</div>
					</div>
				</div>

			</div>
			
			<!-- /메인 -->
			
			<div class="right-box">
				
				<div>
				<div>오늘 그룹의 완성도</div>
					<div class="complete-box">
						<div class="d-flex">
							<div class="mr-3">사용자1</div>
							<button type="button" class="btn btn-primary btn-sm ml-3">성공</button>
							<button type="button" class="btn btn-light btn-sm ml-2">실패</button>
						</div>
					
					</div>
				</div>
				
				<div class="goal">
					<h5>오늘의 달성도</h5>
					<h2 class="text-center mt-3">80%</h2>
				
				</div>
			</div>
		</section>
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	// 페이지 이동
	function find() {
		  window.location.href = "/group/list-view";
		}

</script>
</body>
</html>