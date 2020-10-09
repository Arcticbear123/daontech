<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<span class="content-header">채용공고</span>
	<div class="content-body">
		<form id = "boardForm" name="BoardForm">
		<table class="table recruitTable">			
			<tr>
				<th style="width:10%;">번호</th>
				<th style="width:55%;">제목</th>
				<th style="width:20%;">등록일</th>
				<th style="width:15%;">글쓴이</th>
			</tr>			   			
		</table>
		</form>
		<div id="recruitPaging" style="text-align:center;">
			<jsp:include flush="false" page="../common/paging.jsp">
				<jsp:param name="row" value="5"/>
	    		<jsp:param name="maxPage" value="5"/>
	    		<jsp:param name="target" value="recruitPaging"/>
	    		<jsp:param name="fnList" value="getBoardList"/>
	    		<jsp:param name="fnCount" value="getBoardCount"/>
	    		<jsp:param name="menu" value="Board"/>	    		
			</jsp:include>
		</div>
		
		<button type="button" class="submitBtn recruitBtn" onclick="goBoardWrite();">글쓰기</button>
		
	</div>
</div>

<script type="text/javascript">  

    function getBoardList(limit, num){        
        $.ajax({            
            type	:"GET",            
            url		:"/getBoardList?limit="+limit+"&num="+num,
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
		$(".recruitTable tr:not(:first-child)").empty();
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
            str += "<tr>";
            str += "<td colspan='4'>등록된 글이 존재하지 않습니다.</td>";
            str += "<tr>";
        }        
        $(".recruitTable").append(str);
    }
    
    /*게시판 - 상세 페이지 이동 */
    function goBoardDetail(boardno){                
        location.href = "/recruitNoticeView?boardno="+ boardno;
    }
    
    /*게시판 - 작성 페이지 이동 */
    function goBoardWrite(mode){
        location.href = "/recruitNoticeEdit";
    }
 
</script>
