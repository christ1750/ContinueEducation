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

   function clearAll(){
	   $("#ddlPjCategory").val("");
	   $("#ddlPjName").val("");
   }
</script>
	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="/styles/img/icons/document-2.png"/>" />
				项目管理
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
					项目列表
				</div>
				<div class="content">
						<form action="myProjectActionForMgr!queryProjectForPage?page=1"
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
					<form action="myProjectActionForMgr!queryProjectForPage?page=1"
						id="newsandnoticeForm">
						<display:table name="pageBean.list" id="list" export="false">
							<display:column title="序号">${list_rowNum + (pageBean.currentPage-1)*pageBean.pageSize}</display:column>
							<display:column property="projectCategory.pjCategoryName" title="项目类别 " />
							<display:column property="projectOrder" title="项目编号 " />
							<display:column property="projectName" title="项目名" />
							<display:column property="createTime" title="创建时间" />

							<display:column title="操作">
								<div id="actionBtnId">
									<a class="white delButton"
										href="myProjectActionForMgr!deleteProject?searchProjectID=${list.projectID}"
										onclick="javascript: return confirm('确认删除该项目吗？');">删除</a>
									<a class="white editButton"
										href="admin-saveormodi_project.jsp?searchProjectID=${list.projectID}">修改</a>
									<a class="white editButton"
										href="courseteacherAction!listselectedForPage?searchProjectID=${list.projectID}&page=1">任课教师</a>
								</div>
							</display:column>
						</display:table>

					</form>
					<form action="myProjectActionForMgr!queryProjectForPage"
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
										<a href="myProjectActionForMgr!queryProjectForPage?page=1">&nbsp;第一页&nbsp;</a>
										<a
											href="myProjectActionForMgr!queryProjectForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">&nbsp;上一页&nbsp;</a>
									</s:else>
									<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="myProjectActionForMgr!queryProjectForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">&nbsp;下一页&nbsp;</a>
										<a
											href="myProjectActionForMgr!queryProjectForPage?page=<s:property value="pageBean.totalPage"/>">&nbsp;最后一页&nbsp;</a>
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