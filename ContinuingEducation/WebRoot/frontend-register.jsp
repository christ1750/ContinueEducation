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
		<!-- 顶部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/foot.css" />
		<!-- 底部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
		<!-- 按钮样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<!-- 表单样式 -->
			<link
			href="js/jquery/jquery-ui.css"
			rel="stylesheet" type="text/css" />
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<script src="js/signup/jquery.tooltip.min.js" type="text/javascript"></script>
		<script src="js/signup/json2.js" type="text/javascript"></script>

		<script src="js/signup/jquery.validate.min.js" type="text/javascript"></script>

		<script src="js/signup/jquery.ui.datepicker-zh-CN.js"
			type="text/javascript"></script>
		<script src="js/signup/Registration.js" type="text/javascript"></script>
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
									<%
										if (bh == null) {
									%>

									个人信息注册表
									<%
										} else {
									%>
									个人信息表
									<%
										}
									%>
								</div>
							</td>
						</tr>
					</table>
					<!-- 内容区，左右增加边距 -->
					<div class="jxjy_pages_text">

						<s:form id="form" method="post" action="userInfoAction">
							<input type="hidden" name="role" value="1" />
							<input type="hidden" name="userId" id="bh" value="${bh}" />
							<div class="box_right">
								
								<div id="Test">
									<!-----------------------------------------个人信息--------------------------------------------------------->
									<div class="">
										<img src="images/signup_item/t_1.png" width="165" height="38"
											alt="" />
									</div>
									<div class="left">
										<label for="textfieldzhm" class="label">
											帐户名
											<span class="RedStar">*</span>
										</label>
										<input name="userName" type="text" class="text"
											id="textfieldzhxm" maxlength="10" />
									</div>
									<div class="right">
										<label for="textfieldzsxm" class="label">
											真实姓名
											<span class="RedStar">*</span>
										</label>
										<input name="realName" type="text" class="text"
											id="textfieldzsxm" maxlength="10" />
									</div>

									<div class="left">
										<label for="txtPwd" class="label">
											登录密码
											<span class="RedStar">*</span>
										</label>
										<input name="userPassword" type="password" class="text"
											id="txtPwd" size="21" maxlength="20"
											title="请您设置查询密码并牢记，此密码用于登陆报名查询系统。报名查询系统使 用身份证和查询密码进行登陆，用于查询报考信息、录取信息等。" />
									</div>


									<div class="right">
										<label class="label" for="UserPwd">
											性别
											<span class="RedStar">*</span>
										</label>
										<div>
											男
											<input type="radio" name="sex" id="radio1" value="男"
												checked="checked" />
											女
											<input type="radio" name="sex" id="radio2" value="女" />
										</div>
									</div>
									<div style="clear: both"></div>
									<div class="left">
										<label for="ddlzjlx" class="label">
											证件类型
											<span class="RedStar">*</span>
										</label>
										<select name="userInfo.certificate.certificateKind" size="1"
											class="dropdownlist" id="ddlzjlx">
											
										</select>
									</div>
									<div class="right">
										<label for="txtAge" class="label">
											年龄
											<span class="RedStar">*</span>
										</label>
										<input name="age" type="text" class="text" id="txtAge" />
									</div>
									<div class="left">
										<label class="label" for="txtZjhm">
											证件号码
											<span class="RedStar">*</span>
										</label>
										<input name="certificateID" type="text" class="text"
											id="txtZjhm" maxlength="18" />
									</div>

									<div class="right">
										<label class="label" for="txtBirth">
											出生日期
											<span class="RedStar">*</span>
										</label>
										<input name="birth" type="text" class="text" id="txtBirth"
											size="20" maxlength="10" readonly="readonly" />
									</div>
									<div class="left">
										<label for="ddlMz" class="label">
											民族
											<span class="RedStar">*</span>
										</label>
										<select name="userInfo.nation.nationID" size="1"
											class="dropdownlist" id="ddlMz">
											
										</select>
									</div>
									<div class="right">
										<label for="ddlzzmm" class="label">
											政治面貌
											<span class="RedStar">*</span>
										</label>
										<select  name="userInfo.party.partyID" size="1"
											class="dropdownlist" id="ddlzzmm">
											
										</select>
									</div>


									<!-----------------------------------------一学历信息--------------------------------------------------------->
									<div class="left">
										<img src="images/signup_item/t_2.png" width="165" height="38"
											alt="" />
									</div>
									<div class="left" style="width: 700px">
										<label for="xxmc" class="label">
											毕业学校
											<span class="RedStar">*</span>
										</label>
										<input type="text" class="longtext" id="xxmc" size="20"
											readonly="readonly" />
									</div>
									<div class="left">
										<label class="label" for="xxdm">
											毕业学校代码
											<span class="RedStar">*</span>
										</label>
										<input name="userInfo.school.schoolID" type="text"
											class="text" id="xxdm" size="20" readonly="readonly" />
									</div>
									<div class="right">
										<label for="txtGraduateDate" class="label">
											毕业时间
											<span class="RedStar">*</span>
										</label>
										<input name="graduateTime" type="text" class="text"
											id="txtGraduateDate" maxlength="10" readonly="readonly" />
									</div>
									<div class="left">
										<label for="ddlXl" class="label">
											学历
											<span class="RedStar">*</span>
										</label>

										<select name="userInfo.degree.degreeID" size="1"
											class="dropdownlist" id="ddlXl">
											
										</select>
									</div>

									<!-----------------------------------------联系方式--------------------------------------------------------->
									<div class="left">
										<img src="images/signup_item/t_3.png" width="165" height="38"
											alt="" />
									</div>
									<div class="left" style="width: 700px">
										<label for="txtLxdz" class="label">
											联系地址
											<span class="RedStar">*</span>
										</label>
										<input name="Address" type="text" class="longtext"
											id="txtLxdz" />
									</div>
									<div class="left">
										<label class="label" for="UserPwd">
											Email
											<span class="RedStar">*</span>
										</label>
										<input name="Email" type="text" class="text" id="email"
											size="35" maxlength="35" />
									</div>
									<div class="right">
										<label class="label" for="txtmobile">
											手机
											<span class="RedStar">*</span>
										</label>
										<input name="mobile" type="text" class="text" id="txtmobile"
											maxlength="11" />
									</div>
									<div class="left">
										<label for="txtZipCode" class="label">
											邮政编码
											<span class="RedStar">*</span>
										</label>
										<input name="postCode" type="text" class="text"
											id="txtZipCode" maxlength="6" />
									</div>

									<!-----------------------------------------备注--------------------------------------------------------->
									<div class="left">
										<img src="images/signup_item/t_4.png" width="160" height="36"
											alt="" style="width: 160px; height: 36px;" />
									</div>

									<div class="left" style="width:700px">
										<textarea name="remarks" id="textareaBZ"
											style="margin-left: 20px;width:500px"></textarea>
									</div>
									<div class="box_3"
										style="clear: both;float:right; margin:10px 10px 10px;">
										<%
											if (bh == null) {
										%>
										<s:submit method="saveUserInfo" type="image"
											src="images/signup_item/queren.gif" id="btnSubmitRegInfo" />

										<%
											} else {
										%>
										<s:submit method="updateUserInfo" type="image"
											src="images/signup_item/queren.gif" id="btnSubmitRegInfo" />

										<%
											}
										%>
									</div>
								</div>
							</div>
						</s:form>
					</div>
				</div>
				<div class="clean:both"></div>
				<!-- 侧边栏目，25%宽度，靠左 -->
				<div class="jxjy_page_sidebar float_l">
					<!-- 侧边导航菜单 -->
					<jsp:include page="frontend-personalinfo_leftnav.jsp" flush="true" />
				</div>
				<!-- end of jxjy_page_sidebar -->
				<div class="cleaner"></div>
			</div>
			<!-- end of jxjy_page_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<!-- 尾部 -->
		<jsp:include page="footer.jsp" flush="true" />

		<div id="Mask">
		</div>
		<div id="SearchSchoolDiv" class="hidden">
			<div id="PopTitle"
				style="width: 160px; margin: auto; font-weight: bold; font-size: 16px; float: left; margin-top: 10px; margin-left: 240px">
				毕业学校查询
			</div>
			<div id="closeButton" style="cursor: pointer">
				关闭
			</div>
			<br style="clear: both" />
			<ul>
				<li>
					请输入学校当前名称或历史名称来查询。
				</li>
				<li>
					如未能查询到学校名称，请选择学校名称为“无”的项。
				</li>
				<li>
					支持模糊查询。
				</li>
			</ul>
			学校名称&nbsp;&nbsp;
			<input type="text" id="school" />
			&nbsp;&nbsp;
			<input type="button" value="查询" id="SearchSchool" />
			<div style="height: 280px; overflow: auto;">
				<table cellpadding="0">
					<caption>
					</caption>
				</table>
			</div>
			<input type="button" id="btnConfirm" value="确定" />
		</div>
	</body>
</html>
