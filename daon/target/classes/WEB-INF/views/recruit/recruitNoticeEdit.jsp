<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>다온기술-채용정보</title>
	<link rel="stylesheet" href="css/fontawesome-pro-5.13.0-web/css/all.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/animation.css">
	<link rel="stylesheet" type="text/css" href="css/recruit.css">
	<script src="js/jquery.min.js"></script>		

</head>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function(){        
    
});
    
/** 게시판 - 목록 페이지 이동 */
function goBoardList(){                
    location.href = "/recruit/recruitNotice";
}

/** 게시판 - 작성  */
function insertBoard(){

    var boardtitle = $("#board_title").val();
    var boardContent = $("#board_content").val();
        
    if (boardtitle == ""){            
        alert("제목을 입력해주세요.");
        $("#board_title").focus();
        return;
    }
    
    if (boardContent == ""){            
        alert("내용을 입력해주세요.");
        $("#board_content").focus();
        return;
    }
    
    var yn = confirm("게시글을 등록하시겠습니까?");        
    if(yn){
            
        $.ajax({    
            
            url        : "/recruit/insertBoard",
            data    : $("#boardForm").serialize(),
            dataType: "JSON",
            cache   : false,
            async   : true,
            type    : "POST",    
            success : function(obj) {
                insertBoardCallback(obj);                
            },           
            error     : function(xhr, status, error) {}
            
        });
    }
}

/** 게시판 - 작성 콜백 함수 */
function insertBoardCallback(obj){

    if(obj != null){        
        
        var result = obj.result;
        
        if(result == "SUCCESS"){                
            alert("게시글 등록을 성공하였습니다.");                
            goBoardList();                 
        } else {                
            alert("게시글 등록을 실패하였습니다.");    
            return;
        }
    }
}

</script>
    
<body>
	<!-- Global Navigation Bar -->
	<jsp:include flush="false" page="../common/gnb.jsp" />
	
	<div id="recruitBg" class="subBg">
		<div class="subBg-text" style="background:none;"><span>채용정보</span></div>
	</div>
	<div class="breadCrumb">
		<div class="breadCrumb-home" onclick="goMenu('HOME')"><i class="fal fa-home"></i></div>
		<div class="breadCrumb-btn" onclick="goMenu('RECRUIT', 0)">인재상</div>
		<div class="breadCrumb-btn" onclick="goMenu('RECRUIT', 1)">채용안내</div>
		<div class="breadCrumb-btn breadCrumb-on" onclick="goMenu('RECRUIT', 2)">채용공고</div>
	</div>
	<div class="container">
		<div class="content">
			<span class="content-header">채용공고</span>
			<form id="boardForm" name="boardForm">
			<div class="content-body">
				<div class="recruitNoticeEdit">											`
					<input id="board_title" name ="board_title" value = "" class="shadowInput" placeholder="제목" style="margin-bottom:10px;"/>
					<textarea id = "board_content" name = "board_content" class="shadowTextarea" style="resize:none;margin-bottom:5px;"></textarea>
				</form>
					<div class="addFileInput" style="margin-bottom:10px;">
						<i class="addFileIcon fas fa-folder-open"></i>
						<button class="addFileButton">파일 선택</button>
					</div>
					<div class="recruitEdit-btnArea">
						<button class="cancelBtn" onclick="javascript:goBoardList();" style="margin-right:10px;">취 소</button>
						<button class="submitBtn" onclick="javascript:insertBoard();">작성완료</button>
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
		$('.gnbBtn').eq(2).addClass('blue');	//메뉴이동시 메뉴버튼 디자인 변경		
		$('.content').show();	//내용 항상 보이게
	});	
	
	
	</script>
</body>
</html>

