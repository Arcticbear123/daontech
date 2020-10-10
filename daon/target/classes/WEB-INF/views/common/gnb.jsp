<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
				<!-- <span class="gnbDropMenu" onclick="goMenu('SUPPORT', 0)">QnA</span> -->
				<span class="gnbDropMenu" onclick="goMenu('SUPPORT', 0)">NEWS</span>
				<span class="gnbDropMenu" onclick="goMenu('SUPPORT', 1)">홍보자료</span>					
			</span>
		</span>
	</div>
	<c:choose>
	<c:when test="${empty sessionScope.user_id}">
		<span class="gnbLoginBtn" onclick="openLoginForm()">관리자 로그인</span>
	</c:when>
	<c:otherwise>
		<span class="gnbLoginBtn" onclick="logOut()">로그아웃</span>
	</c:otherwise>
	</c:choose>
</div>
<div class="loginForm">
	<i class="loginCloseBtn far fa-times" onclick="closeLoginForm()"></i>
	<div class="loginLabel">관리자 로그인</div>
	<form id ="LoginUserForm" class="LoginUserForm" action="/LoginCheck" method="POST">
		<div class="loginRow">
			<span class="loginRowLabel">ID :&nbsp;</span>
			<input id="user_id" name="user_id" class="loginInput" type="text"/>
		</div>
		<div class="loginRow">
			<span class="loginRowLabel">PW :&nbsp;</span>
			<input id="user_pwd" name="user_pwd" class="loginInput" type="password"/>
		</div>
	</form>	
		<div class="" style="text-align:center;">
			<button class="loginSubmit submitBtn" onclick="LoginCheck()">로그인</button>
		</div>		
</div>

	
<script type=text/javascript>
//엔터키로 로그인 키입력 이벤트
$(document).keydown(function(e){	
	if($('.loginForm').is(':visible')){		
		if(e.keyCode == 13){
			$('.loginSubmit').trigger('click');
		}
	}
});
	function openLoginForm(){
		$('.loginForm').show();
	}
	
	function closeLoginForm(){
		$('.loginForm').hide();
	}

function LoginCheck(){
	 
    var user_id = $("#user_id").val();
    var user_pwd = $("#user_pwd").val();
        
    if (user_id == ""){            
        alert("ID를 입력해주세요.");
        $("#user_id").focus();
    }
    
    if (user_pwd == ""){            
        alert("비밀번호를 입력해주세요.");
        $("#user_pwd").focus();
    }
    
    	$.ajax({
    		url		: "/CheckLogin",
    		type	: "POST",
	        data    : $("#LoginUserForm").serialize(),
            cache   : false,
            async   : true,
	        success : function(obj) {
	        	getUserInfoCallBack(obj);
	        },
	        error : function(xhr, status, error) {}
	     });
		}
		
	function getUserInfoCallBack(obj){
    
    if(obj != null){        
        
        var result = obj.result

        if(result == "SUCCESS"){                
            alert("로그인에 성공하였습니다."); 
            goMenu('/')
        } else {                
            alert("등록되지 않은 사용자 입니다.");    
            return;
        }
    }
}
	
	function logOut(){
		var logOutText = confirm("로그아웃 하시겠습니까?");
		if(logOutText == true){
			location.href ="/logout";	
		}		
	}


</script>