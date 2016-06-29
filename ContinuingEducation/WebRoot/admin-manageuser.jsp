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

   $(function(){
	   $("#time1").datepicker( {
			changeYear : true,
			changeMonth : true,
			yearRange : 'c-40:c'
		});

		$("#time2").datepicker( {
			changeYear : true,
			changeMonth : true,
			yearRange : 'c-40:c'
		});
		
   });
   
   function clearAll(){
   $("#queryUserName").val("");
   $("#queryRealName").val("");
   $("#time1").val("");
   $("#time2").val("");
   }
</script>
	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="styles/img/icons/users.png"/>" />
				用户管理
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
					用户列表
				</div>
				<div class="content">
					<form action="userInfoActionForMgr!queryUserForPage?page=1"
						method="post">
						<div class="fl">
							<div class="input">
								&nbsp;账户名称:
								<s:textfield id="queryUserName" name="queryUserName"
									placeholder="请输入用户标题" />
								&nbsp;真实姓名:
								<s:textfield id="queryRealName" name="queryRealName"
									placeholder="请输入用户标题" />

								时间区间:
								<s:textfield id="time1" cssStyle="width:100px" name="time1"
									placeholder="请选择开始时间" />
								-
								<s:textfield cssStyle="width:100px" id="time2" name="time2"
									placeholder="请选择结束时间" />
							</div>
						</div>
						<div class="submit">
							&nbsp; &nbsp;
							<input type="submit" value="搜索" class="button" />
							<input type="button" value="重置" onclick="clearAll();" />
						</div>
					</form>
					<div class="clear"></div>
				</div>
				<div class="content">
					<form action="userInfoActionForMgr!queryUserForPage?page=1"
						id="userInfoForm">
						<display:table name="pageBean.list" id="list" export="false">
							<display:column title="用户编号">${list_rowNum + (pageBean.currentPage-1)*pageBean.pageSize}</display:column>
							<display:column property="userName" title="账户名称" />
							<display:column property="realName" title="真实姓名" />
							<display:column property="sex" title="性别" />
							<display:column property="mobile" title="手机号码" />
							<display:column property="email" title="电子邮箱" />
							<display:column property="time" title="注册时间" />
							<display:column title="操作">
								<div id="actionBtnId">
									<a class="white delButton"
										href="userInfoActionForMgr!deleteUserInfo?searchUserId=${list.userId}"
										onclick="javascript:return confirm('确认删除该用户?')">删除</a>
									<a class="white editButton"
										href="admin-saveormodi_userInfo.jsp?searchuserInfoID=${list.userId}">修改</a>
								</div>
							</display:column>
						</display:table>

					</form>
					<form action="userInfoActionForMgr!queryUserForPage"
						method="post">
						<table width="800" style="table-layout: fixed" border="0"
							align="center">
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
							<s:if test="%{pageBean.allRow != 0}">
								<tr>
									<td>
										<s:if test="%{pageBean.currentPage == 1}">&nbsp;第一页&nbsp;上一页&nbsp;</s:if>
										<s:else>
											<a href="userInfoActionForMgr!queryUserForPage?page=1">&nbsp;第一页&nbsp;</a>
											<a
												href="userInfoActionForMgr!queryUserForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">&nbsp;上一页&nbsp;</a>
										</s:else>
										<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
											<a
												href="userInfoActionForMgr!queryUserForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">&nbsp;下一页&nbsp;</a>
											<a
												href="userInfoActionForMgr!queryUserForPage?page=<s:property value="pageBean.totalPage"/>">&nbsp;最后一页&nbsp;</a>
										</s:if>
										<s:else>&nbsp;下一页&nbsp;最后一页&nbsp;</s:else>
										跳转到
										<s:textfield name="page" size="10" maxLength="10" />
										页
										<s:submit value="跳转" />
									</td>
								</tr>
							</s:if>
						</table>
					</form>
				</div>
			</div>
			<!-- CONTENT  END-->
		</div>
	</body>
</html>