/**
 * 10秒后自动关闭提示信息
 */
$(document).ready(function() {
	setTimeout("$('.notif').fadeTo(500,0).slideUp();",10000); 
});

/**
 * 打开/关闭搜索栏
 * openAdvanceSearchImgId-打开/关闭按钮id
 * pageBarSearchDivId-搜索表单DIV id
 * pageActionBarId-整个列表头栏目DIV id
 * */
$(document).ready(function() {
	$('#openAdvanceSearchImgId').click(function() { 
		if ( !$('#pageActionBarId').hasClass('h100') ){
			$('#pageActionBarId').addClass(" h100");
    		$('#pageBarSearchDivId').attr("style","display:block;");
    		$('#openAdvanceSearchImgId').attr('title', '关闭搜索栏');
    		$('#openAdvanceSearchImgId').attr('src', '../../styles/images/expansion.png');
    		var sh = document.body.scrollHeight;
    		parent.document.getElementById("contentFrameId").style.height = sh+"px";
    	} else {
    		$('#pageActionBarId').removeAttr("class");
			$('#pageActionBarId').addClass("pageActionBar");
			$('#pageBarSearchDivId').attr("style","display:none;");
			$('#openAdvanceSearchImgId').attr('title', '打开搜索栏');
			$('#openAdvanceSearchImgId').attr('src', '../../styles/images/fold.png');
			var sh = document.body.scrollHeight;
			parent.document.getElementById("contentFrameId").style.height = sh+"px";
    	}
	});
});

