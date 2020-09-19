<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<span class="content-header">홍보자료</span>
	<div class="content-body">
		<table class="table promotionTable">			
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>글쓴이</th>
			</tr>
			<tr>
				<td>3</td>
				<td>다온기술 홍보자료 입니다.</td>
				<td>2020.03.29</td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>2</td>
				<td>다온기술 모임 사진입니다.</td>
				<td>2019.12.13</td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>1</td>
				<td>다온기술 홍보자료 모음</td>
				<td>2019.07.09</td>
				<td>관리자</td>
			</tr>			
		</table>
		<button class="submitBtn promotionBtn" onclick="editPromotion()">글쓰기</button>	
	</div>
</div>

<script>
$('.promotionTable tr').not(':first').click(function(){
	location.href = "supportPromotionView";
});

function editPromotion(){
	location.href = "supportPromotionEdit";
}
</script>