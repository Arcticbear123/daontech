<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>다온기술-채용정보</title>
	<link rel="stylesheet" href="css/fontawesome-pro-5.13.0-web/css/all.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/animation.css">
	<link rel="stylesheet" type="text/css" href="css/support.css">
	<script src="js/jquery.min.js"></script>		

</head>
<body>
	<!-- Global Navigation Bar -->
	<jsp:include flush="false" page="../common/gnb.jsp" />
	
	<div id="supportBg" class="subBg">
		<div class="subBg-text" style="background:rgba(0, 0, 0, 0.2);"><span>고객지원</span></div>
	</div>
	<div class="breadCrumb">
		<div class="breadCrumb-home" onclick="goMenu('HOME')"><i class="fal fa-home"></i></div>
		<div class="breadCrumb-btn breadCrumb-on" onclick="goMenu('SUPPORT', 0)">문의사항</div>		
		<div class="breadCrumb-btn" onclick="goMenu('SUPPORT', 1)">NEWS</div>
		<div class="breadCrumb-btn" onclick="goMenu('SUPPORT', 2)">홍보자료</div>		
	</div>
	<div class="container">
		<div class="content">
			<span class="content-header">문의사항</span>
			<div class="content-body">
				<div class="supportInqueryEdit">											
					<input class="shadowInput" placeholder="제목" style="margin-bottom:10px;"/>
					<textarea class="shadowTextarea" style="resize:none;margin-bottom:5px;"></textarea>
					<div class="addFileInput" style="margin-bottom:10px;">
						<i class="addFileIcon fas fa-folder-open"></i>
						<button class="addFileButton">파일 선택</button>
					</div>
					<div class="inqueryEdit-btnArea">
						<button class="cancelBtn" onclick="goBack()" style="margin-right:10px;">취 소</button>
						<button class="submitBtn">작성완료</button>
					</div>
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
	$(document).ready(function(){
		$('.gnbBtn').eq(3).addClass('blue');	//메뉴이동시 메뉴버튼 디자인 변경		
		$('.content').show();	//내용 항상 보이게
	});	
	
	
	</script>
</body>
</html>

