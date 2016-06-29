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

    function del(){
    	if(confirm("确认删除吗？")){
    	return true;
    	}
    	return false;
   }
   
</script>
	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="/styles/img/icons/mail.png"/>" />
				邮件服务管理
			</h1>
			<c:if test="${Notification!=null}">
				<div class="notif ${Notification.classType}">
					<strong>${Notification.title} :</strong> ${Notification.message}.
					<a href="#" class="close"></a>
					 <%session.removeAttribute("Notification");%>
				</div>
			</c:if>
			<div class="bloc">
				<div class="title">
					邮箱信息列表
				</div>
				<div class="content">	
					<form action="emailVerifyAction!changeMailInfo"
						method="post">
						<display:table name="mailInfoList" id="list" export="false">
							<display:column title="选择">
								<input type="radio" name="searchMailInfoID" value="${list.id }" />
							</display:column>
							<display:column title="序号">${list_rowNum }</display:column>
							<display:column property="username" title="邮箱号" />
							<display:column property="password" title="密码" />
							<display:column title="操作">
								<a
									href="emailVerifyAction!deleteMailInfo?searchMailInfoID=${list.id}"
									onclick="return del()">删除</a>
								<a href="saveormodi_mailinfo.jsp?searchMailInfoID=${list.id}">修改</a>
							</display:column>
						</display:table>
						<table>
							<tr>
								<td colspan="5">
									<s:submit value="应用"></s:submit>
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