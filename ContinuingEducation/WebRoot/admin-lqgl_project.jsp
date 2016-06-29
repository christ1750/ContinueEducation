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
			src="js/lqgl/lqgl_project.js"></script>
		<script type="text/javascript">
	function clearAll() {
		$("#searchName").val("");
	}
</script>
	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src='<c:url value="/styles/img/icons/user.png"/>' />
				报名审核
			</h1>
			<c:if test="${Notification!=null}">
				<div class="notif ${Notification.classType}">
					<strong>${Notification.title} :</strong> ${Notification.message}.
					<a href="#" class="close"></a>
					<%
						session.removeAttribute("Notification");
					%>
				</div>
			</c:if>
			<div class="bloc">
				<div class="title">
					项目报名列表
					<div class="fr" style="margin-right:20px">
					<a href="myProjectActionForMgr!listProjectForPage?page=${param.page }">返回</a>
					<a href="projectRegisterActionForMgr!signUpListExportExcel?searchId=${param.searchId }">导出</a>
					</div>
				</div>
				<!--<div class="content">
					<form
						action="projectRegisterActionForMgr!findByNameAndProjectId?projectId=${pageBean.list[0].project.projectID}"
						method="post">
						<div class="fl">
							<div class="input">
								姓名:
								<s:textfield name="searchName" id="searchName"
									placeholder="请输入姓名" />
							</div>
						</div>
						<div class="submit">
							&nbsp; &nbsp;
							<input type="submit" id="btnSearch" value="查询" />
							<input type="button" value="重置" onclick="clearAll();" />
						</div>
					</form>
				</div>
				--><div class="content">
					<table>
						<tr>
							<td>
								<strong>项目类别：${pageBean.list[0].project.projectCategory.pjCategoryName}</strong>
							</td>
							<td>
								<strong>项目编号：${pageBean.list[0].project.projectOrder}</strong>
							</td>
							<td>
								<strong>项目名称：${pageBean.list[0].project.projectName}</strong>
							</td>
							<td>
								<strong>报名情况：${fn:length(pageBean.list)}/${pageBean.list[0].project.volume}
									<c:if
										test="${fn:length(pageBean.list) == pageBean.list[0].project.volume}">
										<span style="color: Red">(已满员) </span>
									</c:if> <c:if
										test="${fn:length(pageBean.list) < pageBean.list[0].project.volume}">
								(已报名/上限)
								</c:if> </strong>
							</td>
						</tr>
					</table>
				</div>
				<div class="content">
					<c:set var="checkAll1">
						<input type="checkbox" id="checkAll1" />
					</c:set>
					<c:set var="checkAll2">
						<input type="checkbox" id="checkAll2" />
					</c:set>
					<form name="signupForm"
						action="projectRegisterActionForMgr!batchCheck" id="signupForm">
						<display:table name="pageBean.list" id="list"
							requestURI="projectRegisterActionForMgr!findByNameAndReportNum"
							export="false">

							<display:column title="序号">${list_rowNum}</display:column>
							<display:column property="userInfo.realName" title="姓名" />
							<c:url var="reporturl"
								value="/projectRegisterActionForMgr!findByCondition">
								<c:param name="projectId" value="${list.project.projectID}" />
								<c:param name="userId" value="${list.userInfo.userId}" />
								<c:param name="page" value="${pageBean.currentPage }" />
							</c:url>
							<display:column title="报名信息">
								<a href="<c:out value="${reporturl}"/>">报名信息 </a>
							</display:column>
							<display:column property="signupTime" title="报名时间"
								sortable="true" headerClass="sortable" />
							<display:column property="checkStatus.checkName" title="审核状态" />

							<display:column title="${checkAll1}&nbsp;通过">
								<c:if test="${list.checkStatus.checkId == 0}">
									<input name="checkPass" type="checkbox"
										value="${list.applyId }" />
								</c:if>
								<c:if test="${list.checkStatus.checkId == 1}">
									<input type="checkbox" checked="checked" disabled="disabled" />
								</c:if>
								<c:if test="${list.checkStatus.checkId == 2}">
									<input type="checkbox" disabled="disabled" />
								</c:if>
							</display:column>
							<display:column title="${checkAll2}&nbsp;未通过">
								<c:if test="${list.checkStatus.checkId == 0}">
									<input name="checkRefuse" type="checkbox"
										value="${list.applyId }" />
								</c:if>
								<c:if test="${list.checkStatus.checkId == 2}">
									<input type="checkbox" checked="checked" disabled="disabled" />
								</c:if>
								<c:if test="${list.checkStatus.checkId == 1}">
									<input type="checkbox" disabled="disabled" />
								</c:if>
							</display:column>
							<display:column property="reportNum" title="预约码" />
						</display:table>
						<table>
							<tr>
								<td>
									<input type="submit" value="提交" id="checkbtn" />
								</td>
							</tr>
						</table>
					</form>
					<form action="projectRegisterActionForMgr!listPjRegisterForPage"
						method="post">
						<table>
							<tr>
								<td>
									共
									<s:property value="pageBean.allRow" />
									条记录 共
									<s:property value="pageBean.totalPage" />
									页 当前第
									<s:property value="pageBean.currentPage" />
									页
								</td>
							</tr>
							<tr>
								<td>
									<s:if test="%{pageBean.currentPage == 1}">第一页 上一页</s:if>
									<s:else>
										<a
											href="projectRegisterActionForMgr!listPjRegisterForPage?page=1">第一页</a>
										<a
											href="projectRegisterActionForMgr!listPjRegisterForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
									</s:else>
									<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="projectRegisterActionForMgr!listPjRegisterForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a
											href="projectRegisterActionForMgr!listPjRegisterForPage?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
									</s:if>
									<s:else>下一页      最后一页</s:else>
									跳转到
									<s:textfield name="page" size="10" maxLength="10"
										onkeyup="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" />
									页
									<s:submit value="跳转" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- CONTENT  END-->
		</div>
	</body>
</html>