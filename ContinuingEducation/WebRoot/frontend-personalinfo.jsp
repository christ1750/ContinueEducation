<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String bh = request.getParameter("bh");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>宁夏理工继续教育学院网上报名系统</title>
		<script src="js/jquery/jquery-1.8.3-min.js"></script>
		<script src="js/jquery/jquery-1.8.9-ui.min.js"></script>
		<!-- css style -->
		<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
		<!-- 底部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
		<!-- 按钮样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<!-- 表单样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
		<link
			href="http://lib.sinaapp.com/js/jquery-ui/1.8.9/themes/cupertino/jquery-ui.css"
			rel="stylesheet" type="text/css" />
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
#textareaBZ {
	width: 514px;
}
</style>
	</head>
	<body>
		<jsp:include page="header.jsp" flush="true" />
		<div class="jxjy_page_body_wrapper">
			<div class="jxjy_page_body">
				<!-- 主体内容，75%宽度，靠右 -->
				<div class="jxjy_pages_content float_r">
					<!-- 内容区，左右增加边距 -->
					<div class="jxjy_pages_text">

						<div class="box_right">

							<div id="Test">
								<!-----------------------------------------个人信息--------------------------------------------------------->

								<table width="700px" border="solid" align="center">
									<tr>
										<td colspan="4">
											<img src="images/signup_item/t_1.png" width="165" height="38" />
										</td>
									</tr>
									<tr>
										<td width="9%">
											帐户名
										</td>
										<td width="30%">
											${session.userInfo.userName }
										</td>
										<td width="9%">
											真实姓名
										</td>
										<td width="30%">
											${session.userInfo.realName }
										</td>
									</tr>
									<tr>
										<td>
											登录密码
										</td>
										<td>
											${session.userInfo.userPassword }
										</td>
										<td>
											性别
										</td>
										<td>
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
											年龄
										</td>
										<td>
											${session.userInfo.age }
										</td>
									</tr>
									<tr>
										<td>
											证件号码
										</td>
										<td>
											${session.userInfo.certificateID }
										</td>

										<td>
											出生日期
										</td>
										<td>
											${session.userInfo.birth }
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
											政治面貌
										</td>
										<td>
											${session.userInfo.party.partyName }
										</td>
									</tr>
								</table>

								<!-----------------------------------------一学历信息--------------------------------------------------------->

								<table width="700px" border="solid" align="center">
									<tr>
										<td colspan="4">
											<img src="images/signup_item/t_2.png" width="165" height="38" />
										</td>
									</tr>
									<tr>
										<td width="9%">
											学校代码
										</td>
										<td width="30%">
											${session.userInfo.school.schoolID }
										</td>
										<td width="9%">
											毕业学校
										</td>
										<td width="30%">
											${session.userInfo.school.schoolName }
										</td>
									</tr>
									<tr>
										<td>
											毕业时间
										</td>
										<td>
											${session.userInfo.graduateTime }
										</td>
										<td>
											学历
										</td>
										<td>
											${session.userInfo.degree.degreeName }
										</td>
									</tr>
									<tr>

										<td>
											备注
										</td>
										<td colspan="3">
											${session.userInfo.remarks }
										</td>
									</tr>
								</table>

								<!-----------------------------------------联系方式--------------------------------------------------------->

								<table width="700px" border="solid" align="center">
									<tr>
										<td colspan="4">
											<img src="images/signup_item/t_3.png" width="165" height="38" />
										</td>
									</tr>
									<tr>
										<td width="9%">
											联系地址
										</td>
										<td colspan="3">
											${session.userInfo.address }
										</td>
									</tr>
									<tr>
										<td width="9%">
											手机
										</td>
										<td width="30%">
											${session.userInfo.mobile }
										</td>
										<td width="9%">
											Email
										</td>
										<td width="30%">
											${session.userInfo.email }
										</td>
									</tr>
									<tr>
										<td>
											邮政编码
										</td>
										<td>
											${session.userInfo.postCode }
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="clean:both"></div>
				<!-- 侧边栏目，25%宽度，靠左 -->
				<%@include file="frontend-personalinfo_leftnav.jsp"%>
				<!-- end of jxjy_page_sidebar -->
			</div>
			<!-- end of jxjy_page_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<!-- 尾部 -->
		<jsp:include page="footer.jsp" flush="true" />

	</body>
</html>
