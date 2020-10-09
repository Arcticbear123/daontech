<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<span class="content-header">홍보자료</span>
	<div class="content-body">
		<form id = "promotionForm" name="PromotionForm">
		<table class="table promotionTable">			
			<tr>
				<th style="width:10%;">번호</th>
				<th style="width:55%;">제목</th>
				<th style="width:20%;">등록일</th>
				<th style="width:15%;">글쓴이</th>
			</tr>						
		</table>
		</form>
		<div id="promotionPaging" style="text-align:center;">
			<jsp:include flush="false" page="../common/paging.jsp">
				<jsp:param name="row" value="5"/>
	    		<jsp:param name="maxPage" value="5"/>
	    		<jsp:param name="target" value="promotionPaging"/>
	    		<jsp:param name="fnList" value="getPromotionList"/>
	    		<jsp:param name="fnCount" value="getPromotionCount"/>	 
	    		<jsp:param name="menu" value="Promotion"/>   		
			</jsp:include>
		</div>
		
		<button type="button" class="submitBtn promotionBtn" onclick="goPromotionWrite()">글쓰기</button>	
	</div>
</div>

<script>
function getPromotionList(limit, num){
    $.ajax({            
        type	:"GET",            
        url		:"/getPromotionList?limit="+limit+"&num="+num,
        data    : $("#promotionForm").serialize(),
        dataType:"JSON",
        cache   : false,
        async   : true,
        success : function(obj) {
            getPromotionListCallback(obj);
        },
        error : function(xhr, status, error) {
        	alert('Error:getPromotionList');
        }
     });
}

function getPromotionListCallback(obj){        
	$(".promotionTable tr:not(:first-child)").empty();
	var list = obj;
    var listLen = obj.length;     
    var str = "";
    
    if(listLen >  0){            
        for(var a=0; a<listLen; a++){                
            var boardno        = list[a].board_no; 
            var boardtitle     = list[a].board_title; 
            var regdate        = list[a].reg_date;
            var boardwriter    = list[a].board_writer; 
            
            str += "<tr onclick=\"goPromotionDetail("+boardno+")\">";
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
    $(".promotionTable").append(str);
}

/*게시판 - 상세 페이지 이동 */
function goPromotionDetail(boardno){                
    location.href = "/supportPromotionView?boardno="+ boardno;
}

/*게시판 - 작성 페이지 이동 */
function goPromotionWrite(mode){
    location.href = "/supportPromotionEdit";
}
</script>