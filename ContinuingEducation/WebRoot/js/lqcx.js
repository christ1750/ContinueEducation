$(document).ready(function() {

	// 网站根目录
		var webSitePath = GetWebRoot();

		$("#btnSearch").click(function() {
			var zjh = $("#txtZjh").val();
			searchInfo(zjh);
		});

		/***********************************************************************
		 * 函数部分
		 **********************************************************************/
		
		/*function searchInfo(zjh) {
			var WebServiceUrl = webSitePath
					+ "/userInfoAction!findUserInfoByID?num=" + zjh;
			var table = $("div.sticky-wrap table");
			var style1="<strong class="+"black"+">";
			var style2="<strong class="+"orange"+">";
			table.children().remove();
			var option = "<thead><tr><th colspan ="+"2"+"align="+">录取结果详情</th></tr></thead>";
			table.append(option);
			if (zjh.length == 0) {				
				$("div.sticky-wrap table").append("<tr><td>"+ style1 +"请输入证件号！</td><tr>");
			} else {
				$.ajax( {
					type : "POST",
					url : WebServiceUrl,
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					// data:{"num":zjh},
					success : function(result) {
						if (result.length > 0) {
							var option = "<tr><td>您的姓名：</td><td>"+ style1 + result[0].realName + "</td></tr>";
							table.append(option);
							var option = "<tr><td>录取状态：</td><td>"+ style2 + result[0].states + "</td></tr>";
							table.append(option);
							//if (result.userID != null)
								var option = "<tr><td>报名序号：</td><td>"+ style1 + result[0].userId + "</td></tr>";
							//else
							//	var option = "<tr><td>报名序号：</td><td>"+ style1 +  "暂无" + "</td></tr>";
							table.append(option);
						} else {
							var option = "<tr><td>"+ style1 +"对不起，不存在该证件号的报名录取信息！</td></tr>";
							table.append(option);
						}
					},
					error : function Error(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
			}
		}*/
	});


// 获取网站的根路劲
function GetWebRoot() {
	var strFullPath = window.document.location.href;
	var strPath = window.document.location.pathname;
	var pos = strFullPath.indexOf(strPath);
	var prePath = strFullPath.substring(0, pos);
	var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
	return (prePath + postPath);
}
