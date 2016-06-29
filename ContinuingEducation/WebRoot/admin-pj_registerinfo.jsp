<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>宁夏理工继续教育学院网上报名系统</title>
		<jsp:include page="/inc/head.jsp"></jsp:include>
	</head>
	<body>
		<div id="content" class="white">
			<h1>
				<img src="<%=ctx%>/styles/img/icons/document-blueprint.png"/>
				${pjRegInfo[0].userInfo.userName }的报名信息
			</h1>

			<div class="bloc">
				<div class="content">
					<div class="title">
						培训项目报名信息
						<div class="fr" style="margin-right:20px">
						<a href="projectRegisterActionForMgr!listPjRegisterForPage?page=${param.page }">返回</a> 
						</div>
					</div>
					<table width="800px" border="solid" align="center">
						<tr>
							<td colspan="4">
								<img src="images/signup_item/r_1.png" width="161" height="37" />
							</td>
						</tr>
						<tr>
							<td >
								项目类别
							</td>
							<td >
								${pjRegInfo[0].project.projectCategory.pjCategoryName}
							</td>
							<td>
								项目编号
							</td>
							<td>
								${pjRegInfo[0].project.projectOrder }
							</td>
						</tr>
						<tr>
							<td>
								项目名称
							</td>
							<td>
								${pjRegInfo[0].project.projectName }
							</td>
							<td>
								报名时间
							</td>
							<td>
								${pjRegInfo[0].signupTime}
							</td>
						</tr>

						<!-----------------------------------------个人信息--------------------------------------------------------->
						<tr>
							<td colspan="4">
								<img src="images/signup_item/r_2.png" width="167" height="42" />
							</td>
						</tr>
						<tr>
							<td >
								帐户名
							</td>
							<td >
								${pjRegInfo[0].userInfo.userName }
							</td>
							<td >
								真实姓名
							</td>
							<td>
								${pjRegInfo[0].userInfo.realName }
							</td>
						</tr>
						<tr>
							<td>
								登录密码
							</td>
							<td>
								${pjRegInfo[0].userInfo.userPassword }
							</td>
							<td>
								性别
							</td>
							<td>
								${pjRegInfo[0].userInfo.sex }
							</td>
						</tr>
						<tr>
							<td>
								证件类型
							</td>
							<td>
								${pjRegInfo[0].userInfo.certificate.certificateName }
							</td>
							<td>
								年龄
							</td>
							<td>
								${pjRegInfo[0].userInfo.age }
							</td>
						</tr>
						<tr>
							<td>
								证件号码
							</td>
							<td>
								${pjRegInfo[0].userInfo.certificateID }
							</td>

							<td>
								出生日期
							</td>
							<td>
								${pjRegInfo[0].userInfo.birth }
							</td>
						</tr>
						<tr>
							<td>
								民族
							</td>
							<td>
								${pjRegInfo[0].userInfo.nation.nationName }
							</td>
							<td>
								政治面貌
							</td>
							<td>
								${pjRegInfo[0].userInfo.party.partyName }
							</td>
						</tr>

						<!-----------------------------------------一学历信息--------------------------------------------------------->

						<tr>
							<td colspan="4">
								<img src="images/signup_item/t_21.png" width="165" height="38" />
							</td>
						</tr>
						<tr>
							<td width="9%">
								学校代码
							</td>
							<td width="30%">
								${pjRegInfo[0].userInfo.school.schoolID }
							</td>
							<td width="9%">
								毕业学校
							</td>
							<td width="30%">
								${pjRegInfo[0].userInfo.school.schoolName }
							</td>
						</tr>
						<tr>
							<td>
								毕业时间
							</td>
							<td>
								${pjRegInfo[0].userInfo.graduateTime }
							</td>
							<td>
								学历
							</td>
							<td>
								${pjRegInfo[0].userInfo.degree.degreeName }
							</td>
						</tr>
						<tr>
							<td>
								备注
							</td>
							<td colspan="3">
								${pjRegInfo[0].userInfo.remarks }
							</td>
						</tr>

						<!-----------------------------------------联系方式--------------------------------------------------------->

						<tr>
							<td colspan="4">
								<img src="images/signup_item/r_4.png" width="165" height="38" />
							</td>
						</tr>
						<tr>
							<td width="9%">
								联系地址
							</td>
							<td colspan="3">
								${pjRegInfo[0].userInfo.address }
							</td>
						</tr>
						<tr>
							<td width="9%">
								手机
							</td>
							<td width="30%">
								${pjRegInfo[0].userInfo.mobile }
							</td>
							<td width="9%">
								Email
							</td>
							<td width="30%">
								${pjRegInfo[0].userInfo.email }
							</td>
						</tr>
						<tr>
							<td>
								邮政编码
							</td>
							<td colspan="4">
								${pjRegInfo[0].userInfo.postCode }
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
