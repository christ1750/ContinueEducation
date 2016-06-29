$(document).ready(function () {
	
	$("#reportAll1").click(function() {
		$('input[name="reported"]').attr("checked", this.checked);
	});
	var $reported = $("input[name='reported']");
	$reported
			.click(function() {
				$("#reportAll1")
						.attr(
								"checked",
								$reported.length == $("input[name='reported']:checked").length ? true
										: false);
			});

	$("#reportbtn").click(function() {
		cCheckBox();
	});
	
	//确认提交?
	function cSubmit() {
		if (confirm("确认提交审核结果吗？提交后不能修改！")) {
			return true;
		}
		return false;
	}

	//表单验证 
	function cCheckBox() {
		var reported = document.getElementsByName("reported");    
		var flag = false;
		for ( var i = 0; i < reported.length; i++) {
			if (reported[i].checked) {
				flag = true;
				break;
			}
		}

		if (!flag) {
			alert("请先选择报道状态！");
			return false;
		} else {
			cSubmit();
			return true;
		}
	}
});
