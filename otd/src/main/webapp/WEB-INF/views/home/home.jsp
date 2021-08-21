<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function buyTicket(n) {
			frm.ticket.value = n;
			frm.submit();
		}
	
		function returnTicket(n) {
			rtf.refund.value = n;
			rtf.submit();
		}
	</script>
	<style>
		.banner {
			background-image: url("img/bikeMain.jpg");
			background-attachment: fixed;
			background-size: cover;
			z-index: -100;
		}
		
		.about {
			background-image: url("img/mainBodyBack.jpg");
			background-attachment: fixed;
			background-size: cover;
			z-index: -100;
		}
		
		.banner .block span,
		.banner .block h1,
		.banner .block p, 
		.feature-item h4, 
		h2.title-color, 
		.about p {
			color: #00B6BC;
		}
		
		
		.btn-main {
			background: #00B6BC;
			color: #fff;
			border-color: #00B6BC;
		}
		
		.feature-item {
		  box-shadow: 0px 0px 30px 0px rgba(0, 42, 106, 0.3);
		}
		
	</style>
</head>
<body>
	여기가 홈이야
	<div id="notice" align="center">
		공지 테스트 좀 하겠습니다 <br> <a href="noticeList.do">공지목록</a>
	</div>
	<div id="review" align="center">
		리뷰 테스트 좀 하겠습니다 <br> <a href="reviewList.do">리뷰목록</a>
	</div>
	<div id="event" align="center">
		이벤트 테스트 좀 하겠습니다 <br> <a href="eventList.do">이벤트목록</a>
	</div>
	<div id="faq" align="center">
		FAQ 테스트 좀 하겠습니다 <br> <a href="faqHome.do">FAQ목록</a>
	</div>

	<c:if test="${empty sessionName}">
		<!-- 로그인 했을때만 이용권 구매 가능 -->
		<input type="button" value="이용권 구매" onclick="location.href='loginForm.do'">
		<input type="button" value="이용권 환불" onclick="location.href='loginForm.do'">
	</c:if>

	<c:if test="${not empty sessionName}">
		<input type="button" value="이용권 구매" onclick="buyTicket('${session}')">
		<input type="button" value="이용권 환불" onclick="returnTicket('${session}')">
		<div>${sessionName }님환영합니다.</div>
		<div>
			<a href="getPayHistory.do">Test 히스토리영역</a> <a href="memberSelect.do">Test
				마이페이지 개인정보</a>
		</div>
	</c:if>

	<!-- 맵기능 구현중 -->
	<div>
		<a href="mapChoiceForm.do">대여 선택 창</a>
		<a href="mapShowBikeList.do">자전거 현황과 맵 보여주기</a>
	</div>

	<div>
		<a href="signUpForm.do">Test 회원가입영역폼</a><br /> <a href="loginForm.do">Test
			로그인</a>
	</div>

	<!-- 이용권 구매 세션 넘기기 -->
	<form id="frm" action="buyTicketForm.do" method="post">
		<input type="hidden" id="ticket" name="ticket">
	</form>

	<!-- 이용권 환불 세션 넘기기 -->
	<form id="rtf" action="returnTicket.do" method="post">
		<input type="hidden" id="refund" name="refund">
	</form>
	
	<section class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-xl-7">
					<div class="block">
						<div class="divider mb-3"></div>
						<span class="text-uppercase text-sm letter-spacing ">새로운 대여의 시작</span>
						<h1 class="mb-3 mt-3">대구에서 시작하는 새로운 자전거</h1>
						
						<p class="mb-4 pr-5">공간을 차지하기만 하는 자전거는 이제 필요가 없습니다. 그렇다고 다른 수단을 이용하기에는 시간과 돈이 소요가 됩니다. 여기에 새로운 해답이 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 대여 버튼 만들기 -->
	<section class="features mb-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="feature-block d-lg-flex">
						<div class="feature-item mb-5 mb-lg-0">
							<span>24시간 서비스</span>
							<h4 class="mb-3">자전거 서비스</h4>
							<p class="mb-4">아직도 자전거를 대여하는 방법을 모르겠다구요? 배달과 직접 픽업 모두 쉽고 빠릅니다!</p>
							<a href="appoinment.html" class="btn btn-main btn-round-full">자전거 대여 방법</a>
						</div>
					
						<div class="feature-item mb-5 mb-lg-0">
							<span>자전거 관련</span>
							<h4 class="mb-3">자전거 수거 시간</h4>
							<ul class="w-hours list-unstyled">
			                    <li class="d-flex justify-content-between">월요일 - 금요일 : <span>5:00</span></li>
			                    <li class="d-flex justify-content-between">토요일 - 일요일 : <span>4:00</span></li>
			                </ul>
			                <a href="mapShowBikeList.do" class="btn btn-main btn-round-full">자전거 대여 현황</a>
						</div>
					
						<div class="feature-item mb-5 mb-lg-0">
							<span>모든 준비가 끝났습니다</span>
							<h4 class="mb-3">자전거 대여</h4>
							<p>이미 대여하는 방법을 알고 있다면 밖으로 나가 자전거를 타고 시원하게 달려보세요!</p>
							<a href="mapChoiceForm.do" class="btn btn-main btn-round-full">자전거 대여 하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 사진들 -->
	
	<section class="section about">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 col-sm-6">
					<div class="about-img">
						<img src="img/bikeMainLow1.jpg" alt="" class="img-fluid">
						<img src="img/bikeMainLow2.jpg" alt="" class="img-fluid mt-4">
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="about-img mt-4 mt-lg-0">
						<img src="img/bikeMainLow3.jpg" alt="" class="img-fluid">
					</div>
				</div>
				<div class="col-lg-4">
					<div class="about-content pl-4 mt-4 mt-lg-0">
						<h2 class="title-color">익숙한 경험을 <br>다시 새롭게.</h2>
						<p class="mt-4 mb-5">이미 알고 있는 경험은 또 다시 새롭게 느껴질겁니다. 또 다시 한번 여러분들도 경험해보세요!</p>
	
						<a href="mapChoiceForm.do" class="btn btn-main btn-round-full">자전거 대여하기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>