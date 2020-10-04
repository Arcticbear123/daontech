<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<span class="content-header">NEWS</span>
	<div class="content-body">
		<table class="table newsTable">			
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>글쓴이</th>
			</tr>
			<tr>
				<td>3</td>
				<td>8월 다온기술 새소식</td>
				<td>2020.03.29</td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>2</td>
				<td>2020년 다온기술 연간 계획</td>
				<td>2019.12.13</td>
				<td>관리자</td>
			</tr>						
		</table>
		<button class="submitBtn newsBtn" onclick="editNews()">글쓰기</button>	
	</div>
</div>

<script>
$('.newsTable tr').not(':first').click(function(){
	location.href = "supportNewsView";
});

function editNews(){
	location.href = "supportNewsEdit";
}
</script>