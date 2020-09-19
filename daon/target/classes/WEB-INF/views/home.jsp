<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>다온기술</title>
	<link rel="stylesheet" href="css/fontawesome-pro-5.13.0-web/css/all.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/animation.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<script src="js/jquery.min.js"></script>		

</head>
<body>
	<!-- Global Navigation Bar -->
	<jsp:include flush="false" page="./common/gnb.jsp" />
	
	<div class="mainBg">
		<span class="mainBgText">
			<span style="margin-bottom:-35px;">고객사의</span><br>
			<span>경쟁력 향상에 기여하는</span><br>
			<span style="font-size:30px;">
				<span class="orange bold">최고</span>의 
				<span class="sky bold">비즈니스 파트너</span>
			</span>
		</span>
	</div>
	
	<div class="section1">
		<div class="section1-left">
			<img src="image/daonLogoTxt.png">
		</div>
		<div class="section1-right">
			<div class="section1-text">
				<span class="bold blue">다온기술</span>은 모기업의 생산성 및 품질 향상에 기여하는 최고의 업무 파트너로써<br>
				최적화된 CAD 라이브러리 구축 및 고객중심의 어플리케이션 개발/운영 서비스를 <br>
				제공하여 고객사 만족을 위해 노력합니다.
			</div>			
			<button class="section1-btn" onclick="goMenu('INTRO', 0)">
				View more
				<i class="fal fa-arrow-right"></i>
			</button>
		</div>

		
	</div>	
	
	<div class="section2">
		<div class="section2-header">
			<span class="bold">BUSINESS AREA</span>
		</div>
		<div class="section2-list">
			<div class="section2-item">
				<div class="section2-imgHolder" onclick="goMenu('BUSINESS', 0)">
					<img src="image/program.jpg">
				</div>
				<div class="section2-info">
					<span class="section2-infoKo">개발운영부문</span>
					<span class="section2-infoEng">Program & Management</span>
				</div>
				<button class="section2-btn" onclick="goMenu('BUSINESS', 0)"><i class="fal fa-arrow-right"></i></button>
			</div>
			<div class="section2-item">
				<div class="section2-imgHolder" onclick="goMenu('BUSINESS', 1)">
					<img src="image/library.jpg">
				</div>
				<div class="section2-info">
					<span class="section2-infoKo">라이브러리부문</span>
					<span class="section2-infoEng">CAD Library</span>
				</div>
				<button class="section2-btn" onclick="goMenu('BUSINESS', 1)"><i class="fal fa-arrow-right"></i></button>
			</div>
			<div class="section2-item">
				<div class="section2-imgHolder" onclick="goMenu('BUSINESS', 2)">
					<img src="image/tank.jpg">
				</div>
				<div class="section2-info">
					<span class="section2-infoKo">탱크검사부문</span>
					<span class="section2-infoEng">Tank Inspection</span>
				</div>
				<button class="section2-btn" onclick="goMenu('BUSINESS', 2)"><i class="fal fa-arrow-right"></i></button>
			</div>
			
		</div>
	</div>
	
	<div class="section3">
		<div class="section3-bg"></div>
		<div class="secion3-content">
			<div class="section3-header">
				<span class="bold">CONTACT US</span>
			</div>
			<div class="section3-box">
				<div class="section3-item">
					<i class="fal fa-phone-rotary"></i>
					<div class="section3-label">TEL</div>
					<span class="section3-info">061-460-4945</span>
				</div>
				<div class="section3-item">
					<i class="fal fa-fax"></i>
					<div class="section3-label">FAX</div>					
					<span class="section3-info">0504-066-9795</span>
				</div>
				<div class="section3-item">
					<i class="fal fa-map-marked-alt"></i>
					<div class="section3-label">ADDRESS</div>					
					<span class="section3-info">전남 영암군 삼호읍 대불로93<br>현대삼호중공업 본관 4층(58462)</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<img class="footerLogo" src="image/daonLogo.png">
		<div class="footer-info">
			<span>회사명 : 다온기술</span>
			<span>대표 : 박남수</span>
			<span>사업자 등록번호 : 307-21-02942</span>
			<span>주소 : 전남 영암군 삼호읍 대불로93, 현대삼호중공업 본관4층(58462)</span>
			<span>전화 : 061-460-4945</span>
			<span>팩스 : 0504-066-9795</span>
			<span>E-Mail : nspark65@naver.com</span>
		</div>
		<div class="footer-subInfo">
			<span>COPYRIGHTⓒ 다온기술 All rights reserved</span>
		</div>
		
	</div>
	
	<script type="text/javascript" src="js/ui.js"></script>


	<script>

	
	
	$('.section2-imgHolder > img').hover(function(){
		$(this).parent().siblings('.section2-btn').css('background', '#EFA234');
	}, function(){
		$(this).parent().siblings('.section2-btn').css('background', '');		
	});	
	$('.section2-btn').hover(function(){
		$(this).siblings('.section2-imgHolder').children('img').css('transform', 'scale(1.2)');
	}, function(){
		$(this).siblings('.section2-imgHolder').children('img').css('transform', '');
	});	

	
	$(document).ready(function(){
		$(window).scroll(function(){			
			if($(this).scrollTop() > 500){
				$('.section2-item').show();
			}
			if($(this).scrollTop() > 1300){
				$('.section3-label').show();
				$('.section3-info').show();
			}
			
			if($(this).scrollTop() > 100){
				$('.mainBg').css('marginTop', '70px');
				$('.gnb').addClass('stickeyGnb');
			}else{
				$('.mainBg').css('marginTop', '');
				$('.gnb').removeClass('stickeyGnb');
			}
		});
	});
	</script>
</body>
</html>

