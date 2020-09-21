<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<span class="content-header">문의사항</span>
	<div class="content-body">		
		<table class="table inqueryTable">			
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>글쓴이</th>
			</tr>
			<tr>
				<td>3</td>
				<td>문의사항 있습니다.</td>
				<td>2020.03.29</td>
				<td>방문자A</td>
			</tr>
			<tr>
				<td>2</td>
				<td>안녕하세요</td>
				<td>2019.12.13</td>
				<td>방문자B</td>
			</tr>
			<tr>
				<td>1</td>
				<td>위치가 어떻게 되나요?</td>
				<td>2019.07.09</td>
				<td>방문자C</td>
			</tr>			
		</table>
		<button class="submitBtn inqueryBtn" onclick="editInquery()">글쓰기</button>		
	</div>
</div>

<script>
$('.inqueryTable tr').not(':first').click(function(){
	location.href = "supportInqueryView";
});

function editInquery(){
	location.href = "supportInqueryEdit";
}
</script>