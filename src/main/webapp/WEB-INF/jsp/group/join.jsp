<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹찾기 페이지</title>

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
				<i class="bi bi-arrow-left-short" onclick="find()"></i>
				
				<h3 class="text-center">그룹 만들기</h3>
				<input type="text" placeholder="그룹명을 적어주세요." class="form-control mt-4" id="join nameInput">
				<input type="text" placeholder="목표를 적어주세요." class="form-control mt-3" id="join titleInput">
				<textarea rows="4" class="form-control mt-3" id="join2 descriptionInput"
				placeholder="설명(선택사항)
어떤 그룹인지 설명해주세요. (가입 규칙 또는 응원 문구등!)"></textarea>

				 <button type="button" class="mt-4" id="JoinBtn">그룹 등록하기</button>
				</div>
			</div>
			
			<div class="right-box"></div>
		</section>
	</div>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script type="text/javascript">

	function find() {
		  window.location.href = "/group/find-view";
		}
	
	$(document).ready(function() {
		
		$("#JoinBtn").on("click", function() {
			let name = $("#nameInput").val();
			let title = $("titleInput").val();
			let description = $("descriptionInput").val();
			
			if(name == "") {
				alert("그룹명을 입력하세요");
				return 0;
			}
			
			if(title == "") {
				alert("목표를 입력하세요");
				return ;
			}
			
			$.ajax({
				type : "post"
				, url :"/group/join"
				, data:{"name":name, "title": title, "description": description}
				, success:function(data) {
					if(data.result == "success") {
						alert("그룹 만들기 성공");
					} else {
						alert("그룹 만들기 실패");
					}
					}
				, error:function() {
					alert("그룹 만들기 에러!!");
				}
			});			
		});
		
	});
</script>
</body>
</html>