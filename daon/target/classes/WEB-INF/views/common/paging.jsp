<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%
    int row = Integer.parseInt(request.getParameter("row"));
    int maxPage = Integer.parseInt(request.getParameter("maxPage"));
    String target = request.getParameter("target");
    String fnCount = request.getParameter("fnCount");
    String fnList = request.getParameter("fnList");
%>
<c:set var="row" value="<%=row%>"/>
<c:set var="maxPage" value="<%=maxPage%>"/>
<input type="hidden" id="row" name="row" value="${row}"/>
<input type="hidden" id="maxPage" name="maxPage" value="${maxPage}"/>
<input type="hidden" id="target" name ="target" value="${target}"/>
<input type="hidden" id="fnCount" name ="fnCount" value="${fnCount}"/>
<input type="hidden" id="fnList" name ="fnList" value="${fnList}"/>



<div class="paging">
	<!-- <div class="paging-goFirst pagingIcon"><i class="far fa-angle-double-left"></i></div> -->
	<!-- <div class="paging-goPrev pagingIcon"><i class="fas fa-caret-left"></i></div> -->
	<!-- <div class="paging-list">
	</div> -->
	<!-- <div class="paging-goNext pagingIcon"><i class="fas fa-caret-right"></i></div> -->
	<!-- 	<div class="paging-goLast pagingIcon"><i class="far fa-angle-double-right"></i></div>	 -->	
</div>

<script>
$(document).ready(function(){
	getCount();
});

function getCount(){
	var row = <%=row%>;			// 한 페이지당 표시할 페이지의 수
	var maxPage = <%=maxPage%>;	// 한번에 표시할 페이지의 구간
	var currentPage = 1;
	$.ajax({            
        type	:"GET",
        url		:"/<%=fnCount%>",
        dataType:"text",
        cache   : false,
        async   : true,
        success : function(data) {
           calcPaging(data, row, maxPage, currentPage);
        },
        error : function(xhr, status, error) {}
     });
	
}

function calcPaging(count, row, maxPage, currentPage){
	var count = count;	//전체 데이터의 개수
	var row = row;		
	var maxPage = maxPage;
	
	var totalPage = Math.ceil(count/row);
    var pageGroup = Math.ceil(currentPage/maxPage);	
    var lastPage = pageGroup * maxPage;	// 화면에 보여줄 마지막 페이지번호
    if(lastPage > totalPage){
    	lastPage = totalPage;
    }
    var firstPage = lastPage - (maxPage-1);	//화면에 보여줄 첫번째 페이지번호
    if(firstPage < 1){
    	firstPage = 1;
    }
    var prevPage = 	firstPage -1;
    var nextPage = lastPage + 1;
    
    $('#<%=target%> .paging').empty();
    var html = "";
    
    if(prevPage > 0){
    	html += "<div class=\"paging-goPrev pagingIcon\"><i class=\"fas fa-caret-left\"></i></div>";	//prev가능할떄
    }else{
    	html += "<div class=\"paging-goPrev pagingIcon\" style=\"color:#999;pointer-events:none;\"><i class=\"fas fa-caret-left\"></i></div>";
    }
    for(var i=firstPage;i<=lastPage;i++){
    	if(i==currentPage){
    		html += "<div class=\"pagingIcon paging-now\">" + i + "</div>";
    	}else{
    		html += "<div class=\"pagingIcon\">" + i + "</div>";	
    	}    	
    }
    if(lastPage < totalPage){
    	html += "<div class=\"paging-goNext pagingIcon\"><i class=\"fas fa-caret-right\"></i></div>";	//next가능할때
    }else{
    	html += "<div class=\"paging-goNext pagingIcon\" style=\"color:#999;pointer-events:none;\"><i class=\"fas fa-caret-right\"></i></div>";
    }
    
    
    $('.paging').append(html);
    
    var limit = (currentPage-1)*row;	// 건너뛸 게시글의 개수
    var num = row;	// 보여줄 게시글의 개수
    
    <%=fnList%>(limit, num);	//함수 실행
    
       
    $('.pagingIcon').click(function(){
    	var target = $(this);
    	var selectedPage = target.text();
    	
    	if(target.is(".paging-goPrev")){
    		selectedPage = prevPage;
    	}
    	if(target.is(".paging-goNext")){
    		selectedPage = nextPage;
    	}    	
    	calcPaging(count, row, maxPage, selectedPage);    	
    });
   
}
</script>