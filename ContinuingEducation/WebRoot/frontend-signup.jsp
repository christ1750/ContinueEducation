<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>宁夏理工继续教育学院网上报名系统</title>
		<script src="js/jquery/jquery-1.8.3-min.js"></script>
		<script src="js/jquery/jquery-1.8.9-ui.min.js"></script>
		<!-- css style -->
		<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
		<!-- 顶部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
		<!-- 按钮样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />

		<!-- 表单样式 -->
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<link href="js/jquery/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<script src="js/signup/jquery.tooltip.min.js" type="text/javascript"></script>
		<script src="js/signup/json2.js" type="text/javascript"></script>
		<script src="js/signup/jquery.ui.datepicker-zh-CN.js"
			type="text/javascript"></script>
		<script>
		$(function() {
			$("#txtTime").datepicker( {
				changeYear : true,
				changeMonth : true,
				yearRange : 'c-40:c'
			});
			var date = new Date();
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			var time = y + "-" + (m > 9 ? m : ("0" + m)) + "-"
					+ (d > 9 ? d : ("0" + d));
			$("#txtTime").val(time);
		});
	</script>

</style>
	</head>
	<body>
		<jsp:include page="header.jsp" flush="true" />
		<div class="jxjy_page_body_wrapper">
			<div class="jxjy_page_body">
				<!-- 主体内容，75%宽度，靠右 -->
				<div class="jxjy_pages_content float_r">
					<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="font_12b">
						<tr>
							<td>
								<div class="box_2">
									项目报名表
								</div>
							</td>
						</tr>
						<tr>
							<td class="font_bc">
								<br />
							</td>
						</tr>

					</table>
					<!-- 内容区，左右增加边距 -->
					<s:form id="form" method="post"
						action="projectRegisterAction!saveProjectRegister">
						<div class="jxjy_pages_text">
							<input type="hidden" id="txtUserId" name="userInfo.userId"
								value="${session.userInfo.userId}" />
							<input type="hidden" id="txtProjectId" name="project.projectID"
								value="${session.myProject.projectID}" />
							<input type="hidden" id="txtCheckId" name="checkStatus.checkId"
								value='0' />
							<input type="hidden" id="txtReportId"
								name="reportStatus.reportId" value='0' />
							
							<div id="Test">
								<div>
									<img src="images/signup_item/r_1.png" width="161" height="37" />
								</div>

								<table width="700px" border="solid" align="center">
									<tr>
										<td width="9%">
											项目类别
										</td>
										<td width="30%">
											${session.myProject.projectCategory.pjCategoryName}
										</td>
										<td width="9%">
											项目编号
										</td>
										<td width="30%">
											${session.myProject.projectOrder}
										</td>
									</tr>
									<tr>
										<td>
											项目名称
										</td>
										<td>
											${session.myProject.projectName}
										</td>
										<td>
											报名时间
										</td>
										<td>
											<input type="text" id="txtTime" name="signupTime"
												readonly="readonly" class="text" />
										</td>
									</tr>
								</table>

								<!-----------------------------------------个人信息--------------------------------------------------------->

								<div>
									<img src="images/signup_item/r_2.png" width="167" height="42" />
									<table width="700px" border="solid" align="center">
										<tr>
											<td width="9%">
												姓名
											</td>
											<td width="30%">
												${session.userInfo.realName }
											</td>
											<td width="9%">
												性别
											</td>
											<td width="30%">
												${session.userInfo.sex }
											</td>
										</tr>
										<tr>
											<td>
												证件类型
											</td>
											<td>
												${session.userInfo.certificate.certificateName }
											</td>
											<td>
												证件号码
											</td>
											<td>
												${session.userInfo.certificateID }
											</td>
										</tr>
										<tr>
											<td>
												民族
											</td>
											<td>
												${session.userInfo.nation.nationName }
											</td>
											<td>
												出生日期
											</td>
											<td>
												${session.userInfo.birth }
											</td>
										</tr>
									</table>
								</div>
								<br />
								<div class="box_3"
									style="margin-right:100px;">
									<s:submit type="image" src="images/signup_item/queren.gif" />
								</div>
								<br />
							</div>
						</div>
					</s:form>
					<div style="clear: both"></div>
				</div>
				<!-- 侧边栏目，25%宽度，靠左 -->
				<%@include file="frontend-pj_leftnav.jsp"%>
				<!-- end of jxjy_page_sidebar -->
			</div>
			<!-- end of jxjy_page_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<!-- 尾部 -->
		<jsp:include page="footer.jsp" flush="true" />
	</body>
</html>
