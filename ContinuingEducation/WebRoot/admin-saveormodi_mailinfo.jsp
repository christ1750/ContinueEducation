<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content") != null ? request
			.getParameter("content") : "";
	String searchMailInfoID = request.getParameter("searchMailInfoID");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>发布新闻</title>
		<jsp:include page="/inc/head.jsp"></jsp:include>
		<script type="text/javascript" src="js/mailinfo.js"></script>
		<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>

		<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content"]', {
			cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath()%>/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath()%>/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['MailInfo'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['MailInfo'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>
		<script type="text/javascript">
	$(document).ready(function() {
		$("#fromm").blur(function() {
			$.ajax( {
				url : "emailVerifyAction!getSmtpHost",
				data : {
					from : $("#fromm").val()
				},
				dataType : "json",
				success : function(data) {
					$("#host").val(data['host']);
				}
			});
		});
	});
</script>
	</head>
	<body>
		<s:form name="MailInfo" method="post" action="emailVerifyAction">
			<input type="hidden" name="Id" id="searchMailInfoID"
				value="${param.searchMailInfoID}" />
			<div id="content" class="white">
				<h1>
					<img src="<c:url value="/styles/img/icons/mail-add.png"/>" />
					<%
						if (searchMailInfoID == null) {
					%>
					添加邮箱信息
					<%
						} else {
					%>
					修改邮箱信息
					<%
						}
					%>
				</h1>

				<div class="bloc">
					<div class="title">
						基本信息
					</div>
					<div class="content">
						<div class="input">
							<strong>邮件服务器域名或IP:</strong>
							<input id="host" name="host" readonly="readonly" />
							<strong>发件人from:</strong>
							<input id="fromm" name="fromm" />
						</div>
						<div class="input">
							<strong>发件人邮箱的用户名:</strong>
							<input id="username" name="username" />
							<strong>发件人邮箱的密码:</strong>
							<input id="password" type="password" name="password" />
						</div>
						<div class="input">
							<strong>邮件主题title</strong>
							<input id="title" name="title" />
							<strong>抄送:</strong>
							<input id="cc" name="cc" />
						</div>
					</div>
					<div class="title">
						邮件模板
					</div>
					<div class="content">
						<div class="input">
							<textarea name="content" id="content1" cols="100" rows="12"
								style="width: 100%; height: 500px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea>
						</div>
					</div>
				</div>
				<table>
					<tr>
						<td>
							<%
								if (searchMailInfoID == null) {
							%>
							<s:submit method="saveMailInfo" value="提交" />
							<%
								} else {
							%>
							<s:submit method="updateMailInfo" value="修改" />
							<%
								}
							%>
							(提交快捷键: Ctrl + Enter)
						</td>
					</tr>
				</table>
			</div>
		</s:form>
	</body>
</html>
<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}%>
