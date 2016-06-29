<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();
	String time = simpleDateFormat.format(currentTime).toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="/inc/head.jsp"></jsp:include>
		<script type="text/javascript" language="javascript"
			src="js/checkFileUpload.js"></script>
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
 	
    function del(){
    	if(confirm("确认删除该记录吗？")){
    	return true;
    	}
    	return false;
   }
   
   function clearAll(){
	   $("#queryFileName").val("");
	   $("#time1").val("");
	   $("#time2").val("");
   }
   
</script>
	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="/styles/img/icons/folder.png"/>" />
				文件管理
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
					文件列表
				</div>
				<div class="content">
					<form method="post" enctype="multipart/form-data"
						action="fileUploadAction!addFile">
						<input type="hidden" name="time" value="<%=time%>"></input>
						<div class="fl">
							<div class="input">
								<span style="color: red">*</span>文件类别:
								<select name="fileCategory.categoryId" id="category">
								<option>
									---请选择类型---
								</option>
								</select>
								<span style="color: red">*</span>上传文件：
								<input type="file" name="upload" id="file"/>
								<button type="submit" id="upload" class="button">
									上传
								</button>
								<div style="padding: 2px;">
									<span style="color: red">*</span>为必填项，文件大小 &lt; 10M，后缀名只允许  doc,docx,xls,xlsx,txt,jpeg 格式。
									<span style="color: red" id="error"></span>
								</div>
							</div>
						</div>
					</form>

					<form action="fileUploadAction!queryFileForPage" method="post">
						<div class="fl">
							<div class="input">
								&nbsp;&nbsp;&nbsp;&nbsp;文件名:
								<s:textfield id="queryFileName" name="queryFileName"
									placeholder="请输文件名" />

								时间区间:
								<s:textfield id="time1" cssStyle="width:100px"
									name="time1" placeholder="请选择开始时间" />
								-
								<s:textfield cssStyle="width:100px" id="time2"
									name="time2" placeholder="请选择结束时间" />
								&nbsp;
								<button type="submit" class="button">
									搜索
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
					<display:table name="pageBean.list" id="list" export="false">
						<display:column title="文件序号">${list_rowNum + (pageBean.currentPage-1)*pageBean.pageSize}</display:column>
						<display:column property="fileCategory.categoryName" title="文件类别" />
						<display:column property="fileName" title="文件名称" />
						<display:column property="fileSize" title="文件大小" />
						<display:column property="time" title="上传时间" />
						<display:column title="操作">
							<div id="actionBtnId">
								<a class="white viewButton"
									href="fileDownloadAction!download?id=${list.fileId}"
								>查看</a>
								<a class="white delButton"
									href="fileUploadAction!deleteFile?id=${list.fileId}"
									onclick="javascript:return confirm('确认删除该文件?')">删除</a>
							</div>
						</display:column>
					</display:table>
					<form action="fileUploadAction!queryFileForPage" method="post">
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
											<a href="fileUploadAction!queryFileForPage?page=1">&nbsp;第一页&nbsp;</a>
											<a
												href="fileUploadAction!queryFileForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">&nbsp;上一页&nbsp;</a>
										</s:else>
										<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
											<a
												href="fileUploadAction!queryFileForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">&nbsp;下一页&nbsp;</a>
											<a
												href="fileUploadAction!queryFileForPage?page=<s:property value="pageBean.totalPage"/>">&nbsp;最后一页&nbsp;</a>
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