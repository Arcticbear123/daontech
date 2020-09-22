<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			<tbody id="recruitTableContent">
            	<!-- 채용공고 리스트가 들어감 -->
            </tbody>    			
		</table>
		</form>
		
		<button type="button" class="submitBtn recruitBtn" onclick="goBoardWrite();">글쓰기</button>
		
	</div>
</div>

<script type="text/javascript">    
    $(document).ready(function(){        
        getBoardList();
    });
    
    function getBoardList(){        
        $.ajax({            
            type	:"POST",
            url		:"/getBoardList",
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
        var str = "";
        
        if(listLen >  0){            
            for(var a=0; a<listLen; a++){                
                var boardno        = list[a].board_no; 
                var boardtitle     = list[a].board_title; 
                var regdate        = list[a].reg_date;
                var boardwriter    = list[a].board_writer; 
                
                str += "<tr onclick=\"goBoardDetail("+boardno+")\">";
                str += 	"<td>" + boardno +"</td>";
                str += 	"<td>"+ boardtitle +"</td>";
                str += 	"<td>"+ regdate +"</td>"; 
                str += 	"<td>"+ boardwriter +"</td>";
                str += "</tr>";                
            }             
        }else{            
            str += "<tr colspan='4'>";
            str += "<td>등록된 글이 존재하지 않습니다.</td>";
            str += "<tr>";
        }        
        $("#recruitTableContent").html(str);
    }
    
    /*게시판 - 상세 페이지 이동 */
    function goBoardDetail(boardno){                
        location.href = "/recruitNoticeView?boardno="+ boardno;
    }
    
    /*게시판 - 작성 페이지 이동 */
    function goBoardWrite(){        
        location.href = "/recruitNoticeEdit";
    }
 
</script>
