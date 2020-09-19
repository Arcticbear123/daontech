<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<span class="content-header">찾아오는 길</span>
	<div class="content-body">
		<div class="mapAddress">
			상세주소 : 전남 영암군 삼호읍 대불로93, 현대삼호중공업 본관4층 (58462)
		</div>
		<div id="daumRoughmapContainer1598778547739" class="root_daum_roughmap root_daum_roughmap_landing" style="margin:0 auto;"></div>
		<div class="mapHelp">
			<span>클릭 시 길찾기 기능을 사용할 수 있습니다.</span>
			<i class="fal fa-level-up"></i></div>		
	</div>
</div>

<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1598778547739",
		"key" : "2ztm7",
		"mapWidth" : "800",
		"mapHeight" : "400"
	}).render();
</script>

