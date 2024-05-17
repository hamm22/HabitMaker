<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %> 
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
		<div class="date d-flex justify-content-center mt-3 dueDate-box">
			<i class="bi bi-chevron-left mr-2"></i>
			<div id="dueDate"> ${param.dueDate }</div>
			<i class="bi bi-chevron-right ml-2"></i>
		</div>

		<form id="todoForm">
			<ul class="todo">
				<div class="todo-box d-flex ml-2 mt-3">
					<div class="new-todo-item">
						<input type="text" placeholder="습관 입력" class="habit-text" id="titleInput">
					</div>
				</div>
			</ul>
		</form>

		<div class="todoList mt-3">
			<c:forEach var="todo" items="${todoList}">
				<div class="d-flex">
					<div class="d-flex mt-2 todo-card">
						<c:choose>
							<c:when test="${todo.completed}">
								<i class="bi bi-check-square-fill check-icon"
									data-checked="true" data-todo-id="${todo.id}"></i>
							</c:when>
							<c:otherwise>
								<i class="bi bi-square check-icon" data-checked="false"
									data-todo-id="${todo.id}"></i>
							</c:otherwise>
						</c:choose>
						<div class="ml-2">${todo.title}</div>
						<i class="bi bi-three-dots ml-2" id="deleteBtn"
							data-todo-id="${todo.id}"></i>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 		설명 -->
		<div class="content-box">
			<c:set var="count" value="0" scope="page" />
			<c:forEach var="todo" items="${todoList}">
				<c:if test="${count eq 0}">
					<textarea class="form-control description-box" rows="7"
						id="descriptionInput" resize="vertical">${todo.description}</textarea>
					<c:set var="count" value="1" scope="page" />
					<div class="btn-box mt-2">
						<button type="button" class="btn btn-warning mr-3"
							id="descriptionBtn">완료</button>
					</div>
				</c:if>
			</c:forEach>
		</div>


	</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">


	$(document).ready(function() {
	
	    // 현재 URL에서 path 확인
	    const currentPath = window.location.pathname;
	
	    // 날짜 버튼
	    $(".bi-chevron-left, .bi-chevron-right").on("click",function() {
	
	        const dueDate = new URLSearchParams(window.location.search)
	            .get('dueDate');
	
	        if (!dueDate) {
	            console.error("URL 매개변수 dueDate가 없습니다.");
	            return;
	        }
	
	        const d = new Date(dueDate);
	
	        let sel_day = 0;
	        if ($(this).hasClass('bi-chevron-left')) {
	            sel_day = -1; // 이전 날짜
	        } else if ($(this).hasClass('bi-chevron-right')) {
	            sel_day = 1; // 다음 날짜
	        }
	
	        // d 객체의 날짜를 sel_day 값만큼 조정
	        d.setDate(d.getDate() + sel_day);
	
	        // year, month, day 변수에 현재 날짜 정보를 문자열 형식으로 저장
	        let year = d.getFullYear();
	        let month = ('0' + (d.getMonth() + 1)).slice(-2);
	        let day = ('0' + d.getDate()).slice(-2);
	
	        dt = year + "-" + month + "-" + day;
	
	        if (!currentPath.includes("/calendar-view")) {
	            location.href = "/todo/main-view?dueDate=" + dt;
	        }
	
	        // 캘린더 뷰인 경우 todo/calendar-view 페이지로 이동
	        if (currentPath.includes("/calendar-view")) {
	            location.href = "/todo/calendar-view?dueDate=" + dt;
	        }
	    });
		
		$("#todoForm").on("submit", function(e) {

			e.preventDefault();

			let title = $("#titleInput").val();
			let dueDate = $("#dueDate").text();

			if (title == "") {
				alert("할일을 입력하세요");
				return;
			}

			if (dueDate == "") {
				alert("날짜를 선택하세요");
				return;
			}

			$.ajax({
				type : "post",
				url : "/todo/create",
				data : {
					"title" : title,
					"dueDate" : dueDate
				},
				success : function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
						alert("할일 작성 실패");
					}
				},
				error : function() {
					alert("할일 작성 에러");
				}
			});
		});
		
		// 투두 체크
		$(".check-icon").on("click", function() {

			let completed = false;
			let id = $(this).data("todo-id");

			let currentChecked = $(this).data("checked");
			if (currentChecked) {
				// 이벤트가 발생된 그 때 체크가 되어있다
				$(this).data("checked", false);
				$(this).attr('class', 'bi bi-square check-icon');
				//체크 해제
				completed = false;

			} else {
				// 이벤트가 발생된 그 때 체크가 안되어 있다
				$(this).data("checked", true);
				$(this).attr('class', 'bi bi-check-square-fill check-icon');
				// 체크
				completed = true;
			}

			$.ajax({
				type : "put",
				url : "/todo/status",
				data : {
					"id" : id,
					"completed" : completed
				},
				success : function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
						alert("체크 작성 실패");
					}
				},
				error : function() {
					alert("체크 작성 에러");
				}
			});
		});

		// 설명 생성
		$("#descriptionBtn").on("click", function() {

			let description = $("#descriptionInput").val();

			if (description == "") {
				alert("설명 입력하세요");
				return;
			}

			$.ajax({
				type : "put",
				url : "/todo/description",
				data : {
					"description" : description
				},
				success : function(data) {
					if (data.result == "success") {
						alert("성공");
					} else {
						alert("설명 작성 실패");
					}
				},
				error : function() {
					alert("설명 작성 에러");
				}
			});
		});

		// 할일 삭제
		$("#deleteBtn").on("click", function() {

			let id = $(this).data("todo-id");

			$.ajax({
				type : "delete",
				url : "/todo/delete",
				data : {
					"id" : id
				},
				success : function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
						alert("할일 삭제 실패");
					}
				},
				error : function() {
					alert("할일 삭제 에러");
				}
			});
		});

	});
</script>

</body>
</html>