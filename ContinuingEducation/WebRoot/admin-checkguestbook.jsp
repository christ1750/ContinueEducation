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
    if(confirm("确认删除该记录吗？")){
     return true;
    }
    return false;
   }
   function pass(){
    if(confirm("确认通过审核吗？")){
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
				<img src="<c:url value="/styles/img/icons/document-2.png"/>" />
				留言审核
			</h1>
			
			<div class="bloc">
				<div class="title">
					待审核留言
				</div>
				<div class="content">
						
						<div class="clear"></div>
				</div>
				<div class="content">
					<form action="guestbookAction!checkForPage?page=1"
						id="newsandnoticeForm">
						<display:table name="pageBean.list" id="list" export="false">
							
						 	<display:column property="CComment" title="留言内容" />
							<display:column property="uwUsername" title="真实姓名 " />
							<display:column property="username" title="用户名" />
							<display:column property="CTime" title="提交时间" />
							<display:column title="操作">
								<div id="actionBtnId">
									<a class="white delButton"
										href="guestbookAction!deleteGuestbook?searchGuestbookID=${list.CId}&deletetype=1"
										onclick="return del()">删除</a>
									<a class="white editButton"
										href="guestbookAction!passStatus?searchGuestbookID=${list.CId}" onclick="return pass()">通过审核</a>
									
								</div>
							</display:column>
						</display:table>

					</form>
					<form action="guestbookAction!checkForPage"
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
										<a href="guestbookAction!checkForPage?page=1">&nbsp;第一页&nbsp;</a>
										<a
											href="guestbookAction!checkForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">&nbsp;上一页&nbsp;</a>
									</s:else>
									<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="guestbookAction!checkForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">&nbsp;下一页&nbsp;</a>
										<a
											href="guestbookAction!checkForPage?page=<s:property value="pageBean.totalPage"/>">&nbsp;最后一页&nbsp;</a>
									</s:if>
									<s:else>&nbsp;下一页&nbsp;最后一页&nbsp;</s:else>
									跳转到
									<s:textfield name="page" size="10" maxLength="10"
										onkeyup="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" />
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