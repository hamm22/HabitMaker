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
				<c:if test="${param.groupId == group.id}"><!-- 가입한 그룹만 조회 -->
				<div class="post-group">
					<i class="bi bi-arrow-left-short" onclick="list()"></i>
							<div class="post-group-box">
								<h5 class="group-name">${group.name}</h5>
								<div class="notice mt-3">
									<div class="group-title">목표 : ${group.title}</div>
									<div class="mt-3 group-description">설명 : ${group.description}</div>
								</div>
							</div>
					
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
				</c:if>
				</c:forEach>
				
				<c:forEach var="post" items="${postList }">
					<div class="post-card">
						<div class="post-card-list">
							<div class="mt-3">${post.userLoginId }</div>
							<div class="post-image">
								<img src="${post.imagePath }" id="contnentImage">
							</div>
							<div class="post-card-contents mt-2">
								${post.contents }
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			
			<!-- /메인 -->
			
			<div class="right-box text-center">
				<div>
				<div id="dueDate"> ${param.dueDate }</div>
				<div class="mt-3">오늘 그룹의 완성도</div>
					<div class="complete-box mt-2">
						<c:forEach var="groupTodo" items="${groupTodoList }">
							<c:if test="${userLoginId eq groupTodo.userLoginId}">
								<div class="d-flex justify-content-between mt-2">
									<div>${groupTodo.userLoginId}</div>
									<div class="btn-box" data-todo-group-id="${groupTodo.groupId}"> 
										<button type="button" class="btn btn-primary btn-sm mr-2 success-btn" data-todo-id="${groupTodo.id}">성공</button>
										<button type="button" class="btn btn-light btn-sm fail-btn" data-todo-id="${groupTodo.id}">실패</button>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				
				
				<div class="goal mt-5">
					<h5>오늘의 팀원</h5>

					<table class="table table-bordered border-warining">
						<thead>
							<tr>
								<th scope="col">아이디</th>
								<th scope="col">성공여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="groupTodo" items="${groupTodoList }">
								<tr>
									<th scope="row">${groupTodo.userLoginId }</th>
									<td>${groupTodo.completed ? '성공' : '실패'}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		
					<c:forEach var="member" items="${memberList }">
						<c:if test="${param.groupId eq member.groupId}">
							<button type="button" class="btn btn-secondary" id="delete-btn" data-member-id="${member.id }">그룹 탈퇴하기</button>
						</c:if>
					</c:forEach>
			</div>
		</section>
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	
	// 현재 날짜 가쟈오기
	var today = new Date();
	
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	
	var dateString = year + '-' + month  + '-' + day;
	
	
	// 페이지 이동
	function list() {
		  window.location.href = "/group/list-view";
		}
	
	$(document).ready(function() {
		
		// 날짜
		$("#dueDate").text(dateString);
		
		
		$(".success-btn").on("click", function() {
			
			let completed = true;
		 	let id = $(this).data("todo-id");
		 	let groupId = $(".btn-box").data("todo-group-id");
		 	let dueDate = dateString;
		 	
			$.ajax({
				type : "put",
				url : "/group/todo/validate",
				data : {
					"id" : id,
					"groupId" : groupId,
					"dueDate" : dueDate,
					"completed" : completed
				},
				success : function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
						alert("인증 실패");
					}
				},
				error : function() {
					alert("인증 에러");
				}
			});
		});
		
		
		$(".fail-btn").on("click", function() {
			
		 	let id = $(this).data("todo-id");
		 	let groupId = $(".btn-box").data("todo-group-id");
		 	let dueDate = dateString;
		 	
			$.ajax({
				type : "put",
				url : "/group/todo/validate",
				data : {
					"id" : id,
					"groupId" : groupId,
					"dueDate" : dueDate,
					"completed" : false
				},
				success : function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
						alert("실패버튼 인증 실패");
					}
				},
				error : function() {
					alert("실패버튼 인증 에러");
				}
			});
		});

		// 그룹 탈퇴
		$("#delete-btn").on("click", function() {
		 	
			let id = $(this).data("member-id");

			alert(id);
			$.ajax({
				type : "delete",
				url : "/group/delete",
				data : {"id" : id},
				success : function(data) {
					if (data.result == "success") {
						alert("성공");
						location.href="/group/list-view";
					} else {
						alert("탈퇴 실패");
					}
				},
				error : function() {
					alert("탈퇴 에러");
				}
			});
		});

		// 게시하기
		$(".post-btn").on("click", function() {
			
			let id = $(this).data("group-id");

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
				type:"post"
				, url:"/post/create"
				, data:formData 
				, enctype:"multipart/form-data" 
				, processData: false			
				, contentType: false			
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("게시글 작성 실패");
					}
				}
				, error:function() {
					alert("게시글 작성 에러");
				}
			});
			
		});
		
	});
</script>
</body>
</html>