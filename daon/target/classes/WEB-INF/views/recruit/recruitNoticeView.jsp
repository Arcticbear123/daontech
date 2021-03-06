<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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

<%    
    String boardno = request.getParameter("boardno");        
%>
 
<c:set var="boardno" value="<%=boardno%>"/> <!-- 게시글 번호 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<script type="text/javascript">
		$(document).ready(function(){        
		    getBoardDetail();        
		});
		
		/** 게시판 - 목록 페이지 이동 */
		function goBack(){                
		    location.href = "/recruit/recruitNotice";
		}
		
		/** 게시판 - 수정 페이지 이동 */
		/**function goBoardUpdate(){
		    
		    var boardSeq = $("#board_no").val();
		    
		    location.href = "/recruit/boardUpdate?boardno="+ boardno;
		}*/
		
		/** 게시판 - 상세 조회  */
	    function getBoardDetail(boardno){
	        
	        var boardno = $("#board_no").val();
	 
	        if(boardno != ""){
	            
	            $.ajax({    
	                
	                url        : "/recruit/getBoardDetail",
	                data    : $("#boardForm").serialize(),
	                dataType: "JSON",
	                cache   : false,
	                async   : true,
	                type    : "POST",    
	                success : function(obj) {
	                    getBoardDetailCallback(obj);                
	                },           
	                error     : function(xhr, status, error) {}
	                
	             });
	        } else {
	            alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
	        }            
	    }
		 /** 게시판 - 상세 조회  콜백 함수 */
	    function getBoardDetailCallback(obj){
	        
	        var str = "";
	        
	        if(obj != null){                                
	                            
	            var boardno        = obj.board_no; 
	            var boardtitle     = obj.board_title; 
	            var boardContent   = obj.board_content; 
	            var regdate		   = obj.reg_date;
	            var boardwriter    = obj.board_writer;
	                    
	            $("#board_title").val(boardSubject);            
	            $("#board_content").val(boardContent);
	            
	        } else {
	            
	            alert("등록된 글이 존재하지 않습니다.");
	            return;
	        }        
	    }
		 
	    /** 게시판 - 삭제  */
	    function deleteBoard(){
	 
	        var boardno = $("#board_no").val();
	        
	        var yn = confirm("게시글을 삭제하시겠습니까?");        
	        if(yn){
	            
	            $.ajax({    
	                
	                url        : "/recruit/deleteBoard",
	                data    : $("#boardForm").serialize(),
	                dataType: "JSON",
	                cache   : false,
	                async   : true,
	                type    : "POST",    
	                success : function(obj) {
	                    deleteBoardCallback(obj);                
	                },           
	                error     : function(xhr, status, error) {}
	                
	             });
	        }        
	    }
	    
	    /** 게시판 - 삭제 콜백 함수 */
	    function deleteBoardCallback(obj){
	    
	        if(obj != null){        
	            
	            var result = obj.result;
	            
	            if(result == "SUCCESS"){                
	                alert("게시글 삭제를 성공하였습니다.");                
	                goBack();                
	            } else {                
	                alert("게시글 삭제를 실패하였습니다.");    
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
			<div class="content-body">
						<form id="boardForm" name="boardForm">
				<div class="recruitNoticeView">
					<div class="viewHeader">
						<span id = "board_title" class="viewTitle"></span>
						<span id = "reg_date" class="viewDate"></span>
					</div>
					<div class="viewBody">
						<span id = "board_content" class="viewContent">
							
						</span>
					</div>
					<div class="viewFooter">						
						<div class="recruitViewFile">
							<i class="addFileIcon fas fa-folder-open"></i>
							<a href="#">입사지원서 양식.hwp</a>
						</div>
						<div class="recruitViewFile">
							<i class="addFileIcon fas fa-folder-open"></i>
							<a href="#">다온기술 회사소개서.pptx</a>
						</div>
					</div>
					</form>
					<div class="viewBtnList">
						<button type="button" class="normalBtn" onclick="javascript:goBack()">목 록</button>
						<button type="button" class="btn black" onclick="javascript:deleteBoard();">삭제</button>
						<button class="normalBtn" onclick="goTop()">TOP</button>
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

