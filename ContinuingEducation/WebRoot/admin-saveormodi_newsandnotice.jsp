<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content") != null ? request
			.getParameter("content") : "";
	String searchNewsAndNoticeID = request
			.getParameter("searchNewsAndNoticeID");
%>
<%
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();
	String time = simpleDateFormat.format(currentTime).toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>发布新闻</title>
		<jsp:include page="/inc/head.jsp"></jsp:include>
		<script type="text/javascript" src="js/newsandnotice.js"></script>
		<script type="text/javascript" src="js/checkNewsAndNotice.js"></script>
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
					document.forms['newsandnotice'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['newsandnotice'].submit();
				});
			},
			//函数sync():就是同步KindEditor的值到textarea文本框
			afterBlur : function(){this.sync();}
		});
		prettyPrint();
	});
</script>
<style>
span.red{color:red;}
</style>
	</head>
	<body>
		<s:form name="newsandnotice" method="post"
			action="newsAndNoticeActionForMgr">
			<input type="hidden" name="time" value="<%=time%>"></input>
			<input type="hidden" name="Id" id="searchNewsAndNoticeID"
				value="${param.searchNewsAndNoticeID}" />
			
			<div id="content" class="white">
				<h1>
					<img src="<c:url value="/styles/img/icons/news-add.png"/>" />
					<%
						if (searchNewsAndNoticeID == null) {
					%> 
 
					发布内容 
					<%
						} else {
					%>
					修改内容
					<%
						}
					%>
				</h1>

				<div class="bloc">
					<div class="title">
						基本信息&nbsp;&nbsp;[注：
						<span class="red">*</span>为必填项]
					</div>
					<div class="content">
						<div class="input" style="display: inline">
							<%
								if (searchNewsAndNoticeID == null) {
							%>
							<strong><span class="red">*</span>类型：</strong>
							<select name="category.categoryId" id="category">
								<option>
									---请选择类型---
								</option>
							</select>
							<span class="red" id="categorytips"></span>
							<%
								}
							%>
							<strong><span class="red">*</span>标题：</strong>
							<input type="text" name="title" id="title" />
							<span class="star" style="color: red" id="titletips"></span>
							<strong><span class="red">*</span>作者：</strong>
							<input type="text" name="author" id="author" />
							<span class="star" style="color: red" id="authortips"></span>
						</div>
						<%
							if (searchNewsAndNoticeID == null) {
						%>
						<s:submit cssClass="button" id="saveNewsAndNotice"
							method="saveNewsAndNotice" value="提交新闻" />
						<%
							} else {
						%>
						<s:submit cssClass="button" id="updateNewsAndNotice"
							method="updateNewsAndNotice" value="保存修改" />
						<%
							}
						%>
					</div>
					<div class="title">
						<span class="red">*</span>正文
						<span class="star" style="color: red" id="contenttips"></span>
					</div>
					<div class="content">
						<div class="input">
							<textarea name="content" id="content1" cols="100" rows="12"
								style="width: 100%; height: 500px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea>
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</body>
</html>
<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll(" ", "&nbsp;");
		return str;
	}%>
