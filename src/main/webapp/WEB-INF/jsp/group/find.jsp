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

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>

</head>
<body>
	<div id="wrap">
		<section class="d-flex">

			<!--메뉴바 -->
			<c:import url="/WEB-INF/jsp/include/nav.jsp" />

			<!-- 메인 -->
			<div class="main-box">

				<div id="wrapper">
					<div id="slider-wrap">
						<ul id="slider">
							<li>
								<div>
								</div> <img src="https://cdn.pixabay.com/photo/2018/02/03/09/51/bulletin-board-3127287_1280.jpg">
							</li>

							<li>
								<div>
								</div> <img src="https://cdn.pixabay.com/photo/2016/09/14/08/18/road-1668916_1280.jpg">
							</li>

							<li>
								<div>
								</div> <img src="https://cdn.pixabay.com/photo/2014/11/17/03/15/business-idea-534228_1280.jpg">
							</li>

							<li>
								<div>
								</div> <img src="https://cdn.pixabay.com/photo/2019/03/12/20/27/business-4051773_1280.jpg">
							</li>

							<li>
								<div>
								</div> <img src="https://cdn.pixabay.com/photo/2016/03/27/20/55/arm-1284248_1280.jpg">
							</li>

						</ul>

						<!--controls-->
						<div class="btns" id="next">
							<i class="fa fa-arrow-right"></i>
						</div>
						<div class="btns" id="previous">
							<i class="fa fa-arrow-left"></i>
						</div>
						<div id="counter"></div>

						<div id="pagination-wrap">
							<ul>
							</ul>
						</div>
						<!--controls-->
					</div>
				</div>

				<div class="group-main d-flex justify-content-between">
				<input id="searchInput" type="search" class="input-search" placeholder="검색">
				<button type="button" id="CreateBtn">그룹 새로 만들기</button>
				</div>
				
				<div class="d-flex">
					<c:forEach var="group" items="${groupList }">
					<div class="group-card mr-2">
						<div>그룹명 : ${group.name }</div>
						<div class="mt-2">그룹장 : ${group.userLoginId }</div>
						<div class="mt-2">목표 : ${group.title }</div>
						<div class="mt-2">설명 : ${group.description }</div>
						<button type="button" class="mt-2 group-join-btn" data-group-id="${group.id }">가입하기</button>
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
<script>

	var pos = 0;
	var totalSlides = $('#slider-wrap ul li').length;
	var sliderWidth = $('#slider-wrap').width();

	
	$(document).ready(function() {

		$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

		$('#next').click(function() {
			slideRight();
		});

		$('#previous').click(function() {
			slideLeft();
		});

		var autoSlider = setInterval(slideRight, 3000);

		$.each($('#slider-wrap ul li'), function() {

			var li = document.createElement('li');
			$('#pagination-wrap ul').append(li);
		});

		countSlides();

		pagination();

		$('#slider-wrap').hover(function() {
			$(this).addClass('active');
			clearInterval(autoSlider);
		}, function() {
			$(this).removeClass('active');
			autoSlider = setInterval(slideRight, 3000);
		});
		
		
		$(".group-join-btn").on("click", function() {
		
			let id = $(this).data("group-id");
			alert(id);
			$.ajax({
				type:"post"
				, url:"/group/sign-up"
				, data:{"groupId":id}
				, success:function(data) {
					if(data.result == "success") {
						alert("그룹가입 성공");
					} else {
						alert("그룹가입 실패");
					}
				}
				, error:function() {
					alert("그룹가입 에러");
				}
			});
		});

	});
	
	// 왼쪽 슬라이드
	function slideLeft() {
		pos--;
		if (pos == -1) {
			pos = totalSlides - 1;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		countSlides();
		pagination();
	}

	// 오른쪽 슬라이드
	function slideRight() {
		pos++;
		if (pos == totalSlides) {
			pos = 0;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		countSlides();
		pagination();
	}

	function countSlides() {
		$('#counter').html(pos + 1 + ' / ' + totalSlides);
	}

	function pagination() {
		$('#pagination-wrap ul li').removeClass('active');
		$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
	}
</script>	
</body>
</html>