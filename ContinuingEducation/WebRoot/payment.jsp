<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- JS 库 -->
		<script type="text/javascript" language="javascript"
			src="js/jquery/jquery-1.8.2.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/lqgl/lqgl.js"></script>
		<style type="text/css">
table {
	border-collapse: collapse;
}

#layout td {
	text-align: center;
	border: 1px solid #777;
}
</style>
	</head>

	<body>

		<h2 class="pages_title float_l">
			录取查询
		</h2>
		<!-- 项目搜索栏 -->
		<div class="form_item">
			<input type="hidden" value="${param.projectId}" />
			<form action="projectRegisterActionForMgr!listPjRegisterForPage?page=1"
				method="post">
				<fieldset>

					<span>姓名:</span>
					<input name="searchName"
						class="validate[optional,maxSize[30]] text-input" id="txtXm"
						placeholder="请输入姓名" type="text" />
					<span>预约号:</span>
					<input name="searchReportNum"
						class="validate[optional,maxSize[30]] text-input" id="txtYyh"
						placeholder="请输入预约号" type="text" />
					<button type="submit" id="btnSearch">
						提交
					</button>
					<button type="reset" class="B">
						重置
					</button>
				</fieldset>
			</form>
		</div>
		<!-- 项目搜索栏 -->
		<div class="form_item">
			<form method="post" action="projectRegisterActionForMgr!batchCheck">
				<table width="990" border="0" align="center">
					<thead>
					</thead>
					<tr bgcolor="#CCCCFE">
						<td width="5%" align="center">
							序号
						</td>
						<td width="6%" align="center">
							姓名
						</td>
						<td width="6%" align="center">
							报名信息
						</td>
						<td width="6%" align="center">
							报名时间
						</td>

						<td width="5%" align="center">
							<table border="1px" align="center" width="100%">
								<tr>
									<td colspan="2" align="center">
										报到状态
									</td>
								</tr>
								<tr>
									<td align="center">
										已报到
									</td>
								</tr>
							</table>
						</td>
						<td width="15%" align="center">
							报名编号
						</td>
					</tr>
					<c:forEach items="${reportList}" var="x" varStatus="status">
						<tr>
							<td align="center">
								${status.count + (pageBean.currentPage - 1)*15}
							</td>
							<td align="center">
								${x.userInfo.realName}
							</td>
							<td align="center">
								<a
									href="projectRegisterActionForMgr!findByCondition?userId=${x.userInfo.userId}&projectId=${x.project.projectID}&page=${pageBean.currentPage}">报名信息</a>
							</td>
							<td align="center">
								${x.signupTime}
							</td>
							<td width="5%" align="center">
								<input name="reported" type="checkbox" value="${x.applyId }" />
							</td>
							<td width="15%" align="center">
								${x.reportNum }
							</td>
						</tr>

						<tr>
							<td>
								<br />
							</td>
						</tr>

					</c:forEach>


					<tr>
						<td colspan="4" align="center">
							<input type="submit" value="提交" id="checkbtn" />
						</td>

						<td align="center">
							<input id="reportAll1" type="checkbox" />
							全选

						</td>
					</tr>
				</table>
			</form>
			<br />
			<br />
			<table width="800" align="center" id="layout">

				<tr>
					<th align="center" colspan="4">
						项目信息
					</th>
				</tr>

				<c:forEach items="${nameAndRepNumList}" var="x" varStatus="status">
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
							<img style="width: 56mm"
								src="barcodeAction?barcode=${x.reportNum}" />
						</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</body>
</html>