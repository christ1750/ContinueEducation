$(document).ready(function () {
	$("#checkAll1").click(function() {
		$('input[name="checkPass"]').attr("checked", this.checked);
	});
	var $checkPass = $("input[name='checkPass']");
	$checkPass
			.click(function() {
				$("#checkAll1")
						.attr(
								"checked",
								$checkPass.length == $("input[name='checkPass']:checked").length ? true
										: false);

			});

	$("#checkAll2").click(function() {
		$('input[name="checkRefuse"]').attr("checked", this.checked);
	});
	var $checkRefuse = $("input[name='checkRefuse']");
	$checkRefuse
			.click(function() {
				$("#checkAll2")
						.attr(
								"checked",
								$checkRefuse.length == $("input[name='checkRefuse']:checked").length ? true
										: false);
			});

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

	$("#checkbtn").click(function() {
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
		var checkPass = document.getElementsByName("checkPass");    
		var checkRefuse = document.getElementsByName("checkRefuse");
		var flag = false;
		for ( var i = 0; i < checkPass.length; i++) {
			if (checkPass[i].checked || checkRefuse[i].checked) {
				flag = true;
				break;
			}
		}

		if (!flag) {
			alert("请至少选择审核一人！");
			return false;
		} else {
			cSubmit();
			return true;
		}
	}
});
