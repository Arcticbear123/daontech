<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    
    $(document).ready(function(){        
        getBoardList();
    });
    
    /** 게시판 - 상세 페이지 이동 */
    function goBoardDetail(boardno){                
        location.href = "/recruit/recruitNoticeView?boardno="+ boardno;
    }
    
    /** 게시판 - 작성 페이지 이동 */
    function goBoardWrite(){        
        location.href = "/recruit/recruitNoticeEdit";
    }
 
    function getBoardList(){
        
        $.ajax({            
            type:"POST",
            url:"/recruit/getBoardList",
            data    : $("#boardForm").serialize(),
            dataType:"JSON",
            cache   : false,
            async   : true,
            success : function(obj) {
                getBoardListCallback(obj);                
            },           
            error : function(xhr, status, error) {}
         });
    }
    
    function getBoardListCallback(obj){
        
        var list = obj;
        var listLen = obj.length;
        
        console.log(list);
        console.log(listLen);
        
        var str = "";
        
        if(listLen >  0){
            
            for(var a=0; a<listLen; a++){
                
                var boardno        = list[a].board_no; 
                var boardtitle     = list[a].board_title; 
                var regdate        = list[a].reg_date;
                var boardwriter    = list[a].board_writer; 
                
                str += "<tr>";
                str += "<td>" + boardno +"</td>";
                str += "<td onclick='javascript:goBoardDetail("+ boardno +");' style='cursor:Pointer'>"+ boardtitle +"</td>";
                str += "<td>"+ regdate +"</td>"; 
                str += "<td>"+ boardwriter +"</td>";
                str += "</tr>";
                
            } 
            
        } else {
            
            str += "<tr colspan='4'>";
            str += "<td>등록된 글이 존재하지 않습니다.</td>";
            str += "<tr>";
        }
        
        $("#tbody").html(str);
    }
    
</script>

<div class="content">
	<span class="content-header">채용공고</span>
	<div class="content-body">
		<form id = "boardForm" name="BoardForm">
		<table class="table recruitTable">			
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>글쓴이</th>
			</tr>
			<tbody id="tbody">
                    
            </tbody>    			
		</table>
		</form>
		<div class="btn_right mt15">
		<button type="button" class="submitBtn recruitBtn" onclick="javascript:editRecruit();">글쓰기</button>
		</div>
	</div>
</div>

<script>
$('.recruitTable tbody').not(':first').click(function(){
	location.href = "recruitNoticeView";
});

function editRecruit(){
	location.href = "recruitNoticeEdit";
}
</script>