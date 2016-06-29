<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="/inc/head.jsp"></jsp:include>
		<script type="text/javascript" language="javascript"
			src="js/lqgl/lqgl.js"></script>
		<script type="text/javascript">
	function clearAll() {
		$("#searchName").val("");
		$("#searchReportNum").val("");
	}
</script>
	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="/styles/img/icons/user.png"/>" /> 
				报到确认 
			</h1>
			<div class="bloc">
				<div class="title">
					项目报名列表
				</div>
				<div class="content">
					<form action="projectRegisterActionForMgr!findByNameAndReportNum"
						method="post">
						<div class="fl">
							<div class="input">
								姓名:
								<s:textfield name="searchName" id="searchName"
									placeholder="请输入姓名" />
								预约码:
								<s:textfield name="searchReportNum" id="searchReportNum"
									placeholder="请输入预约号" />
							</div>
						</div>
						<div class="submit">
							&nbsp; &nbsp;
							<input type="submit" id="btnSearch" value="查询" />
							<input type="button" value="重置" onclick=clearAll();;; />
						</div>
					</form>
				</div>

				<div class="content">
					<c:set var="reportAll1">
						<input type="checkbox" id="reportAll1" />
					</c:set>
					<form name="signupForm"
						action="projectRegisterActionForMgr!checkReported" id="signupForm">
						<display:table name="nameAndRepNumList" id="list"
							requestURI="projectRegisterActionForMgr!findByNameAndReportNum"
							export="false">
							<display:column title="序号">${list_rowNum}</display:column>
							<display:column property="userInfo.realName" title="姓名" />
							<c:url var="reporturl"
								value="/projectRegisterActionForMgr!findByCondition">
								<c:param name="projectId" value="${list.project.projectID}" />
								<c:param name="userId" value="${list.userInfo.userId}" />
							</c:url>
							<!--  
							<1display:column title="报名信息">
								<a href="<c:out value="${reporturl}"/>" />报名信息 
							</1display:column>
							--> 
							<display:column property="signupTime" title="报名时间"
								sortable="true" headerClass="sortable" />
							<display:column property="checkStatus.checkName" title="审核状态" />

							<display:column title="${reportAll1}&nbsp;报到状态">
								<c:if test="${list.checkStatus.checkId==1}">
									<c:if test="${list.reportStatus.reportId == 0 }">
										<input name="reported" type="checkbox"
											value="${list.applyId }" />
									</c:if>

									<c:if test="${list.reportStatus.reportId == 1}"> 
									${list.reportStatus.reportName} 
									</c:if>
								</c:if>

							</display:column>
							<display:column property="reportNum" title="预约码" />

							<c:if test="${fn:length(nameAndRepNumList) == 1}">
								<display:column title="操作">
									<input type="submit" id="reportbtn" value="提交" />
								</display:column>
							</c:if>
						</display:table>
					</form>
				</div>

				<c:if test="${fn:length(nameAndRepNumList) == 1}">
				<style>
				#barcode {
					width: 300px;
					height: 300px;
					background: url("images/loading.gif") no-repeat center;
				}
				</style>
					<div class="title">
						缴费通知单
					</div>
					<div class="content">
						<table>
							<c:forEach items="${nameAndRepNumList}" var="x"
								varStatus="status">
								<tr>
									<td rowspan="8" id="barcode">
										<center>
											<img src="barcodeAction?barcode=${x.reportNum},${x.userInfo.certificateID}" />
										</center>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<img src="images/signup_item/t_11.png" />
									</td>

								</tr>
								<tr>
									<td>
										姓名
									</td>
									<td>
										${x.userInfo.realName}
									</td>
									<td>
										性别
									</td>
									<td>
										${x.userInfo.sex}
									</td>
								</tr>
								<tr>
									<td>
										年龄
									</td>
									<td>
										${x.userInfo.age}
									</td>
									<td>
										身份证
									</td>
									<td>
										${x.userInfo.certificateID}
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<img src="images/signup_item/r_12.png" width="161" height="37" />
									</td>
								</tr>
								<tr>
									<td>
										审批编号
									</td>
									<td>
										${x.project.projectOrder}
									</td>
									<td>
										项目类别
									</td>
									<td>
										${x.project.projectCategory.pjCategoryName}
									</td>
								</tr>
								<tr>
									<td>
										项目名称
									</td>
									<td>
										${x.project.projectName}
									</td>
									<td>
										报名时间
									</td>
									<td>
										${x.signupTime}
									</td>
								</tr>
								<tr>
									<td>
										开课时间
									</td>
									<td>
										${x.project.beginTime}-${x.project.endTime}
									</td>
									<td>
										应缴费用
									</td>
									<td>
										${x.project.cost}
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:if>
			</div>
			<!-- CONTENT  END-->
		</div>
	</body>
</html>