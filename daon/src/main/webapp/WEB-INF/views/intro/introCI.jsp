<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content">
	<span class="content-header">CI</span>
	<div class="content-body">
		<div class="ci-content">
			<div class="ci-introduce">
				<div class="core ci-introduceChild1">
					다온기술 심볼의 육각도형은 매우 안정적이고 효율적인 벌집구조에서 착안하였으며,<br>
					로고 색상에서 주황색은 <span class="orange core bold fs22">열의</span>, 파란색은 <span class="blue core bold fs22">바다</span>, 녹색은 <span class="green core bold fs22">자연과 생명력</span>을 의미하여<br>
					<span class="core bold">상호 융합을 통한 새로운 탄생</span>을 상징합니다.<br><br>
				</div>
				<div class="core ci-introduceChild2">
					열정과 기술력을 바탕으로 다양한 가치를 창출하고,<br>
					조선해양분야에서 고객사의 경영혁신과 발전을 지원하며,<br>
					<span class="core bold fs22">안정적이고 신뢰성 있는 비즈니스 파트너</span>로 자리매김 하고자 하는 기업의 의지를 표현했습니다.
				</div>				
			</div>
			<div class="ci-logo">
				<div>
					<div class="ci-imageHolder">
						<img src="image/logoKorVer.png"/>
					</div>
					<button class="downloadLogoBtn" onclick="downloadCI('KOR')">한글로고 다운로드&nbsp;<i class="fal fa-arrow-to-bottom"></i></button>
				</div>
				<div>
					<div class="ci-imageHolder">
						<img src="image/logoEngVer.png"/>
					</div>
					<button class="downloadLogoBtn" onclick="downloadCI('ENG')">영문로고 다운로드&nbsp;<i class="fal fa-arrow-to-bottom"></i></button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function downloadCI(lang){	
    if(lang=="ENG"){
    	location.href = "common/download?fileName=daonLogo(eng).png";	
    }else if(lang=="KOR"){
    	location.href = "common/download?fileName=daonLogo(kor).png";
    }
    
}
</script>