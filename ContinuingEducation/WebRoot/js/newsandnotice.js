$(document).ready(function() {
			$.post("loadCategory", function(data) {
				var $option = $("<option></option>");
				$option.attr("value", "-1");
				$option.text("");
				var jsonObj = data;
				for ( var i = 0; i < jsonObj.length; i++) {
					var $option = $("<option></option>");
					$option.attr("value", jsonObj[i].categoryId);
					$option.text(jsonObj[i].categoryName);
					$("#category").append($option);
				}
			});

			var searchNewsAndNoticeID = getUrlParam("searchNewsAndNoticeID"); // 编号

				if (searchNewsAndNoticeID != null) {
					// 修改页面

					$("#searchNewsAndNoticeID").val(searchNewsAndNoticeID);

					FillBackNewAndNotice(searchNewsAndNoticeID);
				}

				// 根据编号取得新闻、通告内容
				function GetNewsAndNoticeByID(searchNewsAndNoticeID) {

					var WebServiceUrl = "newsAndNoticeActionForMgr!getNewsAndNoticeByID?searchNewsAndNoticeID="
							+ searchNewsAndNoticeID;
					var newsAndNotice;
					$.ajax( {
						type : "POST",
						url : WebServiceUrl,
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						async : false,
						success : function(result) {
							newsAndNotice = result;
						},
						error : function(msg) {
							alert(msg);
						}
					});

					return newsAndNotice[0];
				}

				function FillBackNewAndNotice(searchNewsAndNoticeID) {

					var newsAndNotice = GetNewsAndNoticeByID(searchNewsAndNoticeID);

					if (newsAndNotice != null) {
						$("#title").val(newsAndNotice.title);
						$("#author").val(newsAndNotice.author);					 
						$("#category").val(newsAndNotice.category.categoryId);
						$("#content1").val(newsAndNotice.contentStr);
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
