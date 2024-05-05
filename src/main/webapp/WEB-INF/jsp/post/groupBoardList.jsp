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
	
				<c:forEach var="group" items="${groupList}">
				<div class="post-group">
					<i class="bi bi-arrow-left-short" onclick="list()"></i>
						<c:if test="${param.groupId == group.id}"><!-- 가입한 그룹만 조회 -->
							<div class="post-group-box">
								<h5 class="group-name">${group.name}</h5>
								<div class="notice mt-3">
									<div class="group-title">목표 : ${group.title}</div>
									<div class="mt-3 group-description">설명 : ${group.description}</div>
								</div>
							</div>
						</c:if>
					
				</div>

				<!-- 게시글 입력칸 -->
				<div class="post-box mt-3">
					<div class="post-contents mt-3">
						<textarea placeholder="게시글을 남겨 보세요." class="contents-box" id="contentsInput" resize="vertical"></textarea>
						<div class="d-flex post-contents2">
							<label for="fileInput">
								<i class="bi bi-card-image mr-3"></i>
							</label>
							<input type="file" id="fileInput" style="display: none;">
							<button type="button" class="btn btn-primary post-btn" data-group-id="${group.id }">게시하기</button>
						</div>
					</div>
				</div>
				</c:forEach>

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
			
			<div class="right-box text-center">
				
				<div>
				<div class="mt-3">오늘 그룹의 완성도</div>
					<div class="complete-box mt-2">
						<div class="d-flex justify-content-between">
							<div>사용자1</div>
							<div>
								<button type="button" class="btn btn-primary btn-sm mr-2">성공</button>
								<button type="button" class="btn btn-light btn-sm">실패</button>
							</div>
						</div>
					
					</div>
				</div>
				
				<div class="goal mt-5">
					<h5>오늘의 달성도</h5>
					<h2 class="text-center mt-3">80%</h2>
				</div>
				
				<button type="button" class="btn btn-secondary">그룹 탈퇴하기</button>
			</div>
		</section>
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">
	// 페이지 이동
	function list() {
		  window.location.href = "/group/list-view";
		}

	$(document).ready(function() {

		$(".post-btn").on("click", function() {
			
			let id = $(this).data("group-id");
			
			alert(id);
			

			let contents = $("#contentsInput").val();
			let file = $("#fileInput")[0].files[0]; 

			if (contents == "") {
				alert("내용을 입력하세요");
				return;
			}

			if (file == null) {
				alert("파일을 선택하세요.");
				return;
			}

			let formData = new FormData();
			formData.append("contents", contents);
			formData.append("imageFile", file);
			formData.append("groupId", id);

			$.ajax({
				type : "post",
				url : "/post/create",
				data : formData,
				enctype : "multipart/form-data",
				processData : false,
				contentType : false,
				success : function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
						alert("게시글 작성 실패");
					}
				},
				error : function() {
					alert("게시글 작성 에러");
				}
			});

		});
	});
</script>
</body>
</html>