<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("introduction") != null ? request
			.getParameter("introduction")
			: "";
	String searchProjectID = request.getParameter("searchProjectID");
%>
<%
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
	java.util.Date currentTime = new java.util.Date();
	String time = simpleDateFormat.format(currentTime).toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>发布新闻</title>
		<jsp:include page="/inc/head.jsp"></jsp:include>
		<script src="js/project.js" type="text/javascript"></script>
		<script src="js/checkProject.js" type="text/javascript"></script>
		<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>

		<script type="text/javascript">
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="introduction"]', {
			cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath()%>/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath()%>/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['projectInfo'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {

					self.sync();
					document.forms['projectInfo'].submit();
				});
			},
			//函数sync():就是同步KindEditor的值到textarea文本框
			afterBlur : function(){this.sync();}
		});
		prettyPrint();
	});
</script>
		<style>
span.red{
	color: red;
}
</style>
	</head>
	<body>
		<s:form name="projectInfo" action="myProjectActionForMgr"
			method="post">
			<input type="hidden" name="projectID"
				value="${param.searchProjectID}" />
			<input type="hidden" name="createTime" value="<%=time%>" />
			<input type="hidden" name="visible" value="1" />
			<div id="content" class="white">
				<h1>
					<img src="<c:url value="/styles/img/icons/document-2-add.png"/>" />
					<%
						if (searchProjectID == null) {
					%>
					发布项目信息
					<%
						} else {
					%>
					修改项目信息
					<%
						}
					%>
				</h1>

				<div class="bloc">
					<div class="title">
						基本信息&nbsp;[注：
						<span  class="red">*</span>为必填项]
					</div>
					<div class="content">
						<div class="input">
							<strong><span  class="red">*</span>项目类别:</strong>
							<select id="ddlPjCategory"
								name="myProject.projectCategory.pjCategoryId">
								<option>
									---请选择项目类别---
								</option>
							</select>
							<span  class="red" id="categorytips"></span>
							<strong><span  class="red">*</span>项目名称:</strong>
							<input name="projectName" id="pjName" />
							<span  class="red" id="pjNametips"></span>
						</div>
						<div class="input">
							<strong><span class="red">*</span></span>开课单位:</strong>
							<select id="ddlPjSponsor"
								name="myProject.projectSponsor.pjSponsorId">
								<option>
									---请选择开课单位---
								</option>
							</select>
							<span  class="red" id="ddlPjSponsortips"></span>
							<strong><span  class="red">*</span>审批编号:</strong>
							<input name="projectOrder" type="text" id="pjOrder" />
							<span  class="red" id="pjOrdertips"></span>
						</div>
						<div class="input">
							<strong><span  class="red">*</span>办班状态:</strong>
							<select id="ddlPjStatus"
								name="myProject.projectStatus.pjStatusId">
								<option>
									---请选择办班状态---
								</option>
							</select>
							<span  class="red" id="statustips"></span>
							<strong><span  class="red">*</span>上课地点:</strong>
							<input name="site" type="text" id="site" />
							<span  class="red" id="sitetips"></span>
						</div>
						<div class="input">
							<strong><span  class="red">*</span>招生范围:</strong>
							<select id="ddlPjScope" name="myProject.projectScope.pjScopeId">
								<option>
									---请选择招生范围---
								</option>
							</select>
							<span  class="red" id="scopetips"></span>
							<strong><span  class="red">*</span>开班规模:</strong>
							<input name="volume" type="text" id="volume" />
							<span  class="red" id="volumetips"></span>
						</div>
						<div class="input">
							<strong><span  class="red">*</span>课程费用:</strong>
							<input name="cost" type="text" id="cost" />
							<span  class="red" id="costtips"></span>
							<strong><span  class="red">*</span>联系方式:</strong>
							<input name="contact" type="text" id="contact" />
							<span  class="red" id="contacttips"></span>
						</div>
						<div class="input">
							<strong><span  class="red">*</span>开课时间:</strong>
							<input name="beginTime" id="beginTime" />
							-
							<input name="endTime" id="endTime" />
							<span  class="red" id="timetips"></span>
						</div>
						<%
								if (searchProjectID == null) {
							%>
							<s:submit id="addProject" method="addProject" value="提交"></s:submit>
							<%
								} else {
							%>
							<s:submit id="updateProject" method="updateProject" value="修改" />
							<%
								}
							%>
					</div>
					<div class="title">
						<span  class="red">*</span>项目简介
						<span class="red" id="introtips"></span>
					</div>
					<div class="content">
						<div class="input">
							<textarea name="introduction" id="introduction"
								style="width: 100%; height: 400px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea>
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
		return str;
	}%>
