<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/mainStyle.css" type="text/css">
</head>
<body>

			<div class="right-box">
				<div class="date d-flex justify-content-center">
					<i class="bi bi-chevron-left"></i>
					<div>오늘날짜</div>
					<i class="bi bi-chevron-right"></i>
				</div>

		<div class="todoList mt-3">
			<c:forEach var="todo" items="${todoList}">
				<div class="d-flex ml-2 mt-1">
					<%-- 					<input type="checkbox" data-todo-id="${todo.id}" id="checkbox"> --%>

<%-- 					<c:choose> --%>
<%-- 						<c:when test="${todo.completed }"> --%>
<%-- 							<i class="bi bi-square check-icon" data-post-id="${todo.id }"></i> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<i class="bi bi-check-square-fill check-icon" data-post-id="${todo.id }"></i> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
			 		
			 		<i class="bi bi-square check-icon" id="completedInput"></i>
					<div class="ml-2">${todo.title }</div>
					<i class="bi bi-three-dots ml-2"></i>
				</div>
			</c:forEach>
		</div>

		<form id="todoForm">
					<ul class="todo">
					
					<div class="todo-box d-flex ml-2">
						<div class="new-todo-item">
							<input type="checkbox"> <input type="text" placeholder="습관 입력" id="titleInput">
						</div>
						<i class="bi bi-three-dots ml-2"></i>
					</div>
					</ul>
				</form>
				
				<div class="content-box">
					<textarea class="form-control mt-3" rows="7" id="descriptionInput"></textarea>
				</div>
				<button type="button" id="descriptionBtn">완료</button>
				<i class="bi bi-plus-circle-fill"></i>
			</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">

// 	할일 생성
// 	const plusIcon = document.querySelector('.bi.bi-plus-circle-fill');
// 	const todoList = document.querySelector('.todo');

// 	plusIcon.addEventListener('click', () => {
// 	  const newTodoItem = document.createElement('div');
// 	  newTodoItem.classList.add('todo-box');
// 	  newTodoItem.innerHTML = `
// 	    <input type="checkbox">
// 	    <input type="text" placeholder="습관 입력">
// 	    <i class="bi bi-three-dots ml-2"></i>
// 	  `;
// 	  todoList.appendChild(newTodoItem);

// 	  const newTodoInput = newTodoItem.querySelector('input[type="text"]');
// 	  newTodoInput.focus(); // 입력 칸에 포커스 설정
// 	});
	

	$(document).ready(function() {
		
		$("#todoForm").on("submit", function(e){
			
			e.preventDefault();
		
			let title = $("#titleInput").val();
			
			if(title == "") {
				alert("할일을 입력하세요");
				return ;
			}
			
			$.ajax({
				type : "post"
				, url: "/todo/create"
				, data: {"title" : title}
			, success:function(data) {
				if (data.result == "success") {
					location.reload();
				} else {
				alert("할일 작성 실패");
				}
			} , error:function() {
				alert("할일 작성 에러");
			}
			});
		});
		
		$(".check-icon").on("click", function(){
			
			let completed = false;
			
			let currentChecked = $(this).data("checked");
			if(currentChecked) {
				// 이벤트가 발생된 그 때 체크가 되어있다
				$(this).data("checked", false);
            	$(this).attr('class','bi bi-square check-icon');
            	//체크 해제
            	completed = false;
			} else {
				// 이벤트가 발생된 그 때 체크가 안되어 있다
				$(this).data("checked", true);
				$(this).attr('class','bi bi-check-square-fill check-icon');
				// 체크
				completed = true;
			}
            
			$.ajax({
				type:"put"
				, url: "/todo/status"
			    ,  data: { "id": id,"completed" : completed} 
				, success:function(data) {
					if (data.result == "success") {
						
					} else {
					alert("체크 작성 실패");
					}
				}
				, error:function() {
					alert("체크 작성 에러");
				}
		});
	});
		
		$("#descriptionBtn").on("click", function(){
			
			let description = $("#descriptionInput").val();
			
			if(description == "") {
				alert("할일을 입력하세요");
				return ;
			}
			
			
			$.ajax({
				type : "post"
				, url: "/todo/description"
				, data: {"description" : description}
			, success:function(data) {
				if (data.result == "success") {
					alert("성공");
				} else {
				alert("설명 작성 실패");
				}
			} , error:function() {
				alert("설명 작성 에러");
			}
			});
		});

	});
	
</script>

</body>
</html>