$(document).ready(function() {
			var searchMailInfoID = getUrlParam("searchMailInfoID"); // 编号
				if (searchMailInfoID != null) {
					// 修改页面
					$("#searchMailInfoID").val(searchMailInfoID);
					FillBackNewAndNotice(searchMailInfoID);
				}
				// 根据编号取得新闻、通告内容
				function GetMailInfoByID(searchMailInfoID) {
					var WebServiceUrl = "emailVerifyAction!getMailInfoByID?searchMailInfoID="
							+ searchMailInfoID;
					var mailInfo;
					$.ajax({
						type : "POST",
						url : WebServiceUrl,
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						async : false,
						success : function(result) {
							mailInfo = result;
						},
						error : function(msg) {
							alert(msg);
						}
					});
					return mailInfo[0];
				}

				function FillBackNewAndNotice(searchMailInfoID) {
					var mailInfo = GetMailInfoByID(searchMailInfoID);
					if (mailInfo != null) {
						$("#host").val(mailInfo.host);						
						$("#fromm").val(mailInfo.fromm);					
						$("#username").val(mailInfo.username);
						$("#password").val(mailInfo.password);
						$("#title").val(mailInfo.title);
						$("#cc").val(mailInfo.cc);						
						$("#content1").val(mailInfo.content);				
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
