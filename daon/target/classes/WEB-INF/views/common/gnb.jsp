<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="gnb">
	<div class="logoArea">
		<img class="logo" src="image/daonLogo.png" onclick="goMenu('HOME')">
	</div>
	<div class="gnbList">
		<span class="gnbBtn" onclick="goMenu('INTRO', 0)">
			회사소개
			<span class="gnbDrop">
				<span class="gnbDropMenu" onclick="goMenu('INTRO', 0)">대표인사말</span>
				<span class="gnbDropMenu" onclick="goMenu('INTRO', 1)">회사연혁</span>
				<span class="gnbDropMenu" onclick="goMenu('INTRO', 2)">조직도</span>					
				<span class="gnbDropMenu" onclick="goMenu('INTRO', 3)">CI</span>
				<span class="gnbDropMenu" onclick="goMenu('INTRO', 4)">찾아오는 길</span>
			</span>
		</span>
		<span class="gnbBtn" onclick="goMenu('BUSINESS', 0)">
			사업분야
			<span class="gnbDrop">
				<span class="gnbDropMenu" onclick="goMenu('BUSINESS', 0)">개발운영부문</span>
				<span class="gnbDropMenu" onclick="goMenu('BUSINESS', 1)">라이브러리부문</span>
				<span class="gnbDropMenu" onclick="goMenu('BUSINESS', 2)">탱크검사부문</span>					
			</span>
		</span>
		<span class="gnbBtn" onclick="goMenu('RECRUIT', 0)">
			채용정보
			<span class="gnbDrop">
				<span class="gnbDropMenu" onclick="goMenu('RECRUIT', 0)">인재상</span>
				<span class="gnbDropMenu" onclick="goMenu('RECRUIT', 1)">채용안내</span>
				<span class="gnbDropMenu" onclick="goMenu('RECRUIT', 2)">채용공고</span>					
			</span>
		</span>
		<span class="gnbBtn" onclick="goMenu('SUPPORT', 0)">
			고객지원
			<span class="gnbDrop">
				<span class="gnbDropMenu" onclick="goMenu('SUPPORT', 0)">QnA</span>
				<span class="gnbDropMenu" onclick="goMenu('SUPPORT', 1)">NEWS</span>
				<span class="gnbDropMenu" onclick="goMenu('SUPPORT', 2)">홍보자료</span>					
			</span>
		</span>
	</div>
	<span class="gnbLoginBtn" onclick="openLoginForm()">로그인</span>
</div>
<div class="loginForm">
	<i class="loginCloseBtn far fa-times" onclick="closeLoginForm()"></i>
	<div class="loginLabel">관리자 로그인</div>
	<div class="loginRow">
		<span class="loginRowLabel">ID :&nbsp;</span>
		<input class="loginInput" type="text"/>
	</div>
	<div class="loginRow">
		<span class="loginRowLabel">PW :&nbsp;</span>
		<input class="loginInput" type="password"/>
	</div>
	<div class="" style="text-align:center;">
		<button class="loginSubmit submitBtn">로그인</button>
	</div>
	
</div>
	
<script>
function openLoginForm(){
	$('.loginForm').show();
}

function closeLoginForm(){
	$('.loginForm').hide();
}
</script>