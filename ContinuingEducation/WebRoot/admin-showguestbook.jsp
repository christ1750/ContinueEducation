<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctx = request.getContextPath();
	Integer index=0;
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
   function forbid(){
    if(confirm("确认重新审核")){
     return true;
    }
    return false;
   }
   function respond(index)
{
    var cuser=document.getElementById("comment"+index);
    var ctext=document.getElementById("comment");
    ctext.value="回复"+cuser.value+"  :";

}
 function affirmadmin(){
 	if( $.trim($("#comment").val())=='')
 	{
 		alert("请填写评论！！");
 		return false;
 	}
   }
 function affirmtea(){
 	if( $.trim($("#comment").val())=='')
 	{
 		alert("请填写评论！！");
 		return false;
 	}
   	else
   	  alert("您的留言将在通过审核后显示");
   }
 
</script>
	</head>
	<body>
		<!-- CONTENT  BEGIN-->
		<div id="content" class="white">
			<h1>
				<img src="<c:url value="/styles/img/icons/document-2.png"/>" />
				已审核留言
			</h1>
			
			<div class="bloc">
				<div class="title">
					已审核留言
				</div>
				<div class="content">
						
						<div class="clear"></div>
				</div>
				<div class="content">
					<form action="guestbookAction!showForPage?page=1"
						id="newsandnoticeForm">
						<display:table name="pageBean.list" id="list" export="false">
							
						 	<display:column property="CComment" title="留言内容" />
							<display:column property="uwUsername" title="真实姓名 " />
							<display:column property="username" title="用户名" />
							<display:column property="CTime" title="提交时间" />
							<display:column title="操作">
								<div id="actionBtnId">
								<c:forEach items="${pageBean.list}" var="x">
							
								<c:if test="${session.userInfo.role=='2'}">
									<a
										href="guestbookAction!deleteGuestbook?searchGuestbookID=${x.CId}&deletetype=2"
										onclick="return del()">删除</a>
									<a
										href="guestbookAction!forbidStatus?searchGuestbookID=${x.CId}"
										onclick="return forbid()">重新审核</a>
								</c:if>
									<a  onclick="respond(<%=index%>)">回复</a>
		
									<input type="hidden" id="comment<%=index++%>" value="${x.respre}"></td>
										
								</td>
							</tr>
						</c:forEach>
								</div>
							</display:column>
						</display:table>

					</form>
					<form action="guestbookAction!showForPage"
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
										<a href="guestbookAction!showForPage?page=1">&nbsp;第一页&nbsp;</a>
										<a
											href="guestbookAction!showForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">&nbsp;上一页&nbsp;</a>
									</s:else>
									<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="guestbookAction!showForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">&nbsp;下一页&nbsp;</a>
										<a
											href="guestbookAction!showForPage?page=<s:property value="pageBean.totalPage"/>">&nbsp;最后一页&nbsp;</a>
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
				<div class="clearfix" id="write_guest_book">
  <h4>写留言</h4>
  <c:if test="${session.userInfo.role=='2'}">
  <form action="<%=path %>/guestbookAction!addGuestbookadmin" class="new_guest_book" id="guest_book_form" method="post"><div style="margin:0;padding:0;display:inline"><input name="xx" type="hidden" value="gv6zHskIk65MVn4AIqmx6juGytMNskTnUYBHvH0cJkA=" /></div>      <div><textarea class="required max-length-150" cols="40" id="comment" name="CComment" rows="20" style="width: 550px; height: 80px;"></textarea>
  </div>
  <INPUT  type="submit" value="提交" onclick="affirmadmin()"/>
     
    </form> 
    </c:if>
     <c:if test="${session.userInfo.role!='2'}">
  <form action="<%=path %>/guestbookAction!addGuestbooktea" class="new_guest_book" id="guest_book_form" method="post"><div style="margin:0;padding:0;display:inline"><input name="xx" type="hidden" value="gv6zHskIk65MVn4AIqmx6juGytMNskTnUYBHvH0cJkA=" /></div>      <div><textarea class="required max-length-150" cols="40" id="comment" name="CComment" rows="20" style="width: 550px; height: 80px;"></textarea>
  </div>
  <INPUT  type="submit" value="提交" onclick="affirmtea()" />
     
    </form> 
    </c:if>
    </div>
		</div>
	</body>
</html>