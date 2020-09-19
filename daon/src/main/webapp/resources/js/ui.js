/*gnb 드랍다운 메뉴 스크립트*/
$('.gnbBtn').hover(function(){
	$(this).children('.gnbDrop').show();
}, function(){
	$(this).children('.gnbDrop').hide();
});

/*파라미터 get 스크립트*/
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

/*카테고리 변경 스크립트*/
function chgCate(button, num){
	if($(button).hasClass('breadCrumb-on')){
		return;
	}else{
		$('.content').hide();
		$('.content').eq(num).show();	
		$('.breadCrumb-on').removeClass('breadCrumb-on');
		$('.breadCrumb-btn').eq(num).addClass('breadCrumb-on');
	}		
}

/*페이지 이동 스크립트*/
function goMenu(page, num){
	event.stopPropagation();
	var str = '';
	if(page == 'HOME'){
		str = './home';
	}else if(page == 'INTRO'){
		str = './intro?cate=' + num;
	}else if(page == 'BUSINESS'){
		str = './business?cate=' + num;
	}else if(page == 'RECRUIT'){
		str = './recruit?cate=' + num;
	}else if(page == 'SUPPORT'){
		str = './support?cate=' + num;
	}	
	location.href = str;	
}

/*뒤로가기 스크립트*/
function goBack(){
	history.back();
}

/*최상단가기 스크립트*/
function goTop(){
	$('html, body').animate({scrollTop: 0}, 200);
}



