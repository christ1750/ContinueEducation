$(document)
		.ready(function() {
			/* 获取项目类别 */
			$.post("loadPjCategory", function(data) {
				var $option = $("<option></option>");
				$option.attr("value", "-1");
				$option.text("");

				var jsonObj = data;

				for ( var i = 0; i < jsonObj.length; i++) {
					var $option = $("<option></option>");
					$option.attr("value", jsonObj[i].pjCategoryId);
					$option.text(jsonObj[i].pjCategoryName);
					$("#ddlPjCategory").append($option);
				}
			});

			$("#ddlPjCategory").change(function() {
				$("#ddlPjName option[value!='']").remove();

				$.post("loadPjName", {
					pjCategoryId : $("#ddlPjCategory").val()
				}, function(data) {

					var $option = $("<option></option>");
					$option.attr("value", "-1");
					$option.text("");
					var jsonObj = data;

					for ( var i = 0; i < jsonObj.length; i++) {
						var $option = $("<option></option>");
						$option.attr("value", jsonObj[i][1]);
						$option.text(jsonObj[i][1]);
						$("#ddlPjName").append($option);
					}
				});
			});
			$.post("loadPjStatus", function(data) {
				var $option = $("<option></option>");
				$option.attr("value", "-1");
				$option.text("");

				var jsonObj = data;

				for ( var i = 0; i < jsonObj.length; i++) {
					var $option = $("<option></option>");
					$option.attr("value", jsonObj[i].pjStatusId);
					$option.text(jsonObj[i].pjStatusName);
					$("#ddlPjStatus").append($option);
				}
			});

			$.post("loadPjSponsor", function(data) {
				var $option = $("<option></option>");
				$option.attr("value", "-1");
				$option.text("");

				var jsonObj = data;

				for ( var i = 0; i < jsonObj.length; i++) {
					var $option = $("<option></option>");
					$option.attr("value", jsonObj[i].pjSponsorId);
					$option.text(jsonObj[i].pjSponsorName);
					$("#ddlPjSponsor").append($option);
				}
			});

			$.post("loadPjScope", function(data) {
				var $option = $("<option></option>");
				$option.attr("value", "-1");
				$option.text("");

				var jsonObj = data;

				for ( var i = 0; i < jsonObj.length; i++) {
					var $option = $("<option></option>");
					$option.attr("value", jsonObj[i].pjScopeId);
					$option.text(jsonObj[i].pjScopeName);
					$("#ddlPjScope").append($option);
				}
			});

			$("#beginTime").datepicker( {
				changeYear : true,
				changeMonth : true,
				yearRange : 'c-40:c'
			});

			$("#endTime").datepicker( {
				changeYear : true,
				changeMonth : true,
				yearRange : 'c-40:c'
			});
			$(".ui-datepicker").css('font-size', '1em'); // 改变大小
				$(".ui-datepicker select.ui-datepicker-month-year").css(
						"width", "38%");

				var searchProjectID = getUrlParam("searchProjectID"); // 编号

				if (searchProjectID != null) {
					// 修改页面

					$("#searchProjectID").val(searchProjectID);

					FillBackProject(searchProjectID);
				}

				// 根据编号取得项目内容
				function GetProjectByID(searchProjectID) {

					var WebServiceUrl = "myProjectActionForMgr!getProjectByID?searchProjectID="
							+ searchProjectID;
					var project;
					$.ajax( {
						type : "POST",
						url : WebServiceUrl,
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						async : false,
						success : function(result) {
							project = result;
						},
						error : function(msg) {
							alert(msg);
						}
					});

					return project[0];
				}

				function FillBackProject(searchProjectID) {

					var project = GetProjectByID(searchProjectID);

					if (project != null) {
						$("#ddlPjCategory").val(
								project.projectCategory.pjCategoryId);
						$("#pjName").val(project.projectName);
						$("#pjOrder").val(project.projectOrder);
						$("#ddlPjSponsor").val(
								project.projectSponsor.pjSponsorId);
						$("#ddlPjStatus").val(project.projectStatus.pjStatusId);
						$("#ddlPjScope").val(project.projectScope.pjScopeId);
						$("#site").val(project.site);
						$("#volume").val(project.volume);
						$("#cost").val(project.cost);
						$("#contact").val(project.contact);
						$("#beginTime").val(project.beginTime);
						$("#endTime").val(project.endTime);
						$("#introduction").val(project.introStr);
					}
				}

				function getUrlParam(name) {
					var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); // 构造一个含有目标参数的正则表达式对象
					var r = window.location.search.substr(1).match(reg); // 匹配目标参数
					if (r != null) {
						return unescape(r[2]);
					} else {
						return null;
					} // 返回参数值
				}
			});
