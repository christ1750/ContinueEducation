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
	   $("#queryTime1").datepicker( {
			changeYear : true,
			changeMonth : true,
			yearRange : 'c-40:c'
		});

		$("#queryTime2").datepicker( {
			changeYear : true,
			changeMonth : true,
			yearRange : 'c-40:c'
		});	
   });
      
   function clearAll(){
	   $("#queryNewsTitle").val("");
	   $("#queryNewsAuthor").val("");
	   $("#queryTime1").val("");
	   $("#queryTime2").val("");
   }
   
   $(function(){
	   var categoryId= "tab" + <%=request.getAttribute("categoryId")%> ;
	   var a = document.getElementById(categoryId);
	   $(a).parent().attr("id","current");
	});
</script>

	</head>
	<body> 
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="/styles/img/icons/folder.png"/>" />
				内容信息管理
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
				<ul id="tabs">
					<c:forEach items="${tabList}" var="x" varStatus="status">
						<li>
							<a
								href="newsAndNoticeActionForMgr!queryForPage?page=1&categoryId=${x.categoryId }"
								id="tab${x.categoryId }">${x.categoryName }</a>
						</li>
					</c:forEach>
				</ul>

				<div class="title">
					<c:if test="${fn:length(pageBean.list) == 0}">
					暂无
					</c:if>
					<c:if test="${fn:length(pageBean.list) != 0}">
					${pageBean.list[0].category.categoryName}管理
					</c:if>
				</div>
				<div class="content">
					<form action="newsAndNoticeActionForMgr!queryForPage?page=1"
						method="post">
						<div class="fl">
							<div class="input">
								&nbsp; 标题:
								<s:textfield id="queryNewsTitle" name="queryNewsTitle"
									placeholder="请输入标题" />
								作者:
								<s:textfield id="queryNewsAuthor" name="queryNewsAuthor"
									placeholder="请输入作者" />

								时间区间:
								<s:textfield cssStyle="width:100px" id="queryTime1"
									name="queryTime1" placeholder="请选择开始时间" />
								-
								<s:textfield cssStyle="width:100px" id="queryTime2"
									name="queryTime2" placeholder="请选择结束时间" />
								&nbsp;&nbsp;
								<button type="submit" class="button">
									查询
								</button>
								<button class="button" onclick="clearAll();">
									重置
								</button>
							</div>
						</div>	
					</form>
					<div class="clear"></div>
				</div>
				<div class="content">
					<form action="newsAndNoticeActionForMgr!queryForPage?page=1"
						id="newsandnoticeForm">
						<display:table name="pageBean.list" id="list" export="false">
							<display:column title="编号">${list_rowNum + (pageBean.currentPage-1)*pageBean.pageSize}</display:column>
							<display:column property="category.categoryName" title="类别" />
							<display:column property="title" title="标题" />
							<display:column property="author" title="作者" />
							<display:column property="time" title="最后修改时间" />
							<display:column title="操作">
								<div id="actionBtnId">
									<a class="white delButton"
										href="newsAndNoticeActionForMgr!deleteNewsAndNotice?searchNewsAndNoticeID=${list.id}"
										onclick="javascript: return confirm('确认删除该记录吗？');">删除</a>
									<a class="white editButton"
										href="admin-saveormodi_newsandnotice.jsp?searchNewsAndNoticeID=${list.id}">修改</a>
								</div>
							</display:column>
						</display:table>

					</form>
					<form action="newsAndNoticeActionForMgr!queryForPage" method="post">
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
											<a href="newsAndNoticeActionForMgr!queryForPage?page=1">&nbsp;第一页&nbsp;</a>
											<a
												href="newsAndNoticeActionForMgr!queryForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">&nbsp;上一页&nbsp;</a>
										</s:else>
										<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
											<a
												href="newsAndNoticeActionForMgr!queryForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">&nbsp;下一页&nbsp;</a>
											<a
												href="newsAndNoticeActionForMgr!queryForPage?page=<s:property value="pageBean.totalPage"/>">&nbsp;最后一页&nbsp;</a>
										</s:if>
										<s:else>&nbsp;下一页&nbsp;最后一页&nbsp;</s:else>
										跳转到
										<s:textfield name="page" size="10" maxLength="10" onkeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;"
										/>
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