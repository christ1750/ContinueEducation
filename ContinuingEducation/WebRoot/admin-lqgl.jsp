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
		<script type="text/javascript">
	$(function() {
		$("#ddlPjCategory").change(function() {
			$("#ddlPjName option[value!='']").remove();

			$.post("loadPjName", {
				pjCategoryId : $("#ddlPjCategory").val()
			}, function(data) {

				var $option = $("<option></option>");
				$option.attr("value", "-1");
				$option.text("");
				var jsonObj = data;

				for ( var i = 0; i < jsonObj.length; i++) {
					var $option = $("<option></option>");
					$option.attr("value", jsonObj[i][1]);
					$option.text(jsonObj[i][1]);
					$("#ddlPjName").append($option);
				}
			});
		});
	});

	function clearAll() {
		$("#ddlPjCategory").val("");
		$("#ddlPjName").val("");
	}
</script>

	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="/styles/img/icons/user.png"/>" />
				项目报名情况
			</h1>
			<c:if test="${Notification!=null}">
				<div class="notif ${Notification.classType}">
					<strong>${Notification.title} :</strong> ${Notification.message}.
					<a href="#" class="close"></a>
				</div>
			</c:if>
			<div class="bloc">
				<div class="title">
					项目报名列表
				</div>
				<div class="content">

					<form action="myProjectActionForMgr!listProjectForPage?page=1"
						method="post">
						<div class="fl">
							<div class="input">
								项目类别:
								<s:select id="ddlPjCategory" name="searchProjectCategory"
									list="pjCategoryList" listValue="pjCategoryName"
									listKey="pjCategoryId" headerKey="0" headerValue="全部项目"></s:select>

								项目名称:
								<select id="ddlPjName" name="searchProjectName">
									<option value="">
										---------------------------请选择项目名称---------------------------
									</option>
								</select>
							</div>
						</div>
						<div class="submit">
							&nbsp; &nbsp;
							<input type="submit" id="btnSearch" value="提交"/>
							
							<input type="button" value="重置" onclick=clearAll();; />
						</div>
					</form>

					<div class="clear"></div>
				</div>
				<div class="content">
					<form action="myProjectActionForMgr!listProjectForPagepage=1"
						method="post">

						<display:table name="pageBean.list" id="list" export="false">
							<display:column title="序号">${list_rowNum + (pageBean.currentPage-1)*pageBean.pageSize}</display:column>
							<display:column property="projectOrder" title="项目编号 " />
							<display:column property="projectName" title="项目名" />
							<display:column title="报名人数(已报名/上限)">${fn:length(list.pjRegister)}/${list.volume}</display:column>
							<display:column title="详情">
								<c:if test="${fn:length(list.pjRegister) != 0}">
									<a
										href="projectRegisterActionForMgr!listPjRegisterForPage?searchId=${list.projectID}&page=${pageBean.currentPage }">查看详情</a>
								</c:if>
								<c:if test="${fn:length(list.pjRegister) == 0}">
							暂无详情
							</c:if>
							</display:column>
						</display:table>
					</form>
					<form action="myProjectActionForMgr!listProjectForPage"
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
									<s:if test="%{pageBean.currentPage == 1}">  第一页 上一页</s:if>
									<s:else>
										<a href="myProjectActionForMgr!listProjectForPage?page=1">第一页</a>
										<a href="myProjectActionForMgr!listProjectForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
									</s:else>
									<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
										<a href="myProjectActionForMgr!listProjectForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
										<a href="myProjectActionForMgr!listProjectForPage?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
									</s:if>
									<s:else>下一页  最后一页</s:else>
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
			<br />
			<br />
			<c:if test="${fn:length(nameAndRepNumList) == 1}">
				<table>
					<c:forEach items="${nameAndRepNumList}" var="x" varStatus="status">
						<tr>
							<td align="center" colspan="4">
								<b>个人信息</b>
							</td>
						</tr>
						<tr>
							<td>
								姓名
							</td>
							<td width="30%">
								${x.userInfo.realName}
							</td>
							<td width="9%">
								性别
							</td>
							<td width="30%">
								${x.userInfo.sex}
							</td>
						</tr>

						<tr>
							<td width="9%">
								年龄
							</td>
							<td width="30%">
								${x.userInfo.age}岁
							</td>
							<td width="9%">
								证件号
							</td>
							<td width="30%">
								${x.userInfo.certificateID}
							</td>
						</tr>
						<tr>
							<td align="center" colspan="4">
								<b>项目信息</b>
							</td>
						</tr>

						<tr>
							<td width="9%">
								项目类别
							</td>
							<td width="30%">
								${x.project.projectCategory.pjCategoryName}
							</td>
							<td width="9%">
								项目编号
							</td>
							<td width="30%">
								${x.project.projectOrder }
							</td>
						</tr>
						<tr>
							<td>
								项目名称
							</td>
							<td colspan="3">
								${x.project.projectName }
							</td>
						</tr>
						<tr>
							<td>
								报名时间
							</td>
							<td>
								${x.signupTime}
							</td>
							<td>
								应付款
							</td>
							<td>
								${x.project.cost}
							</td>
						</tr>

						<tr>
							<td colspan="4">
								<img
									src="barcodeAction?barcode=${x.userInfo.certificateID},${x.reportNum}" />
							</td>
						</tr>
						<!--<tr>
					 <td colspan="4">
							<a href="payment.jsp">去付款</a>
						</td>
					</tr>-->
					</c:forEach>
				</table>
			</c:if>

		</div>
	</body>
</html>