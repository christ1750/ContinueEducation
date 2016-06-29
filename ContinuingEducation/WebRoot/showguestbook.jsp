<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Integer index=0;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>审核留言</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="basiccss/pagelayout.css" type="text/css">

		<style type="text/css">
.button {
	width: 90px;
	height: 28px;
	background-image: url(images/search.png);
}
</style>
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
		<div class="sharp color3">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="currentlocation">
				<table width="100%">
					<tr>
						<td>
							当前位置：查看已审核留言
						</td>
						<td align="right">
							
						</td>
						<td width="50"></td>
					</tr>
				</table>
			</div>
			<b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>
		</div>
		<div class="sharp color1">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="content">
				
			</div>
			<b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>
		</div>

		<div class="sharp color2">
			<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
			<div class="contentshow">
				<table width="100%" style="table-layout: fixed" border="0"
					align="center">
					<thead>
						<tr bgcolor="#CCCCFE" height="30px">
							<th colspan="6">
								已审核留言
							</th>
						</tr>

						<tr bgcolor="#CCCCFE" height="30px">

							<th style="WORD-WRAP: break-word" width="60%">
								留言内容
							</th>
							<th style="WORD-WRAP: break-word" width="10%">
								真实姓名
							</th>
							<th style="WORD-WRAP: break-word" width="10%">
								用户名
							</th>
							<th style="WORD-WRAP: break-word" width="10%">
								留言者身份
							</th>
							<th style="WORD-WRAP: break-word" width="10%">
								提交时间
							</th>
							<th style="WORD-WRAP: break-word" width="10%">
								操作
							</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach items="${pageBean.list}" var="x">
							<tr>
								<td>
									${x.CComment}
								</td>
								<td>
									${x.uwUsername}
								</td>
								<td>
									${x.username}
								</td>
								<td>
									<c:if test="${x.roletype=='1'}">学员</c:if>
									<c:if test="${x.roletype=='2'}">管理员</c:if>
									<c:if test="${x.roletype=='3'}">教师</c:if>
									<c:if test="${x.roletype=='4'}">临时教师</c:if>
								</td>
								
								<td>
									${x.CTime}
								</td>
								<td>
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
					</tbody>
				</table>
			</div>
			<b class="b5"></b><b class="b6"></b><b class="b7"></b><b class="b8"></b>
		</div>
		<div id="pageing">

			<table width="800" style="table-layout: fixed" border="0"
				align="left">
				<tr>
					<td align="center" style="table-layout: fixed">
						<form action="guestbookAction!showForPage" method="post">
							共
							<s:property value="pageBean.allRow" />
							条记录 共
							<s:property value="pageBean.totalPage" />
							页 当前第
							<s:property value="pageBean.currentPage" />
							页
							<br>
							<s:if test="%{pageBean.currentPage == 1}">  第一页 上一页
			　　　　</s:if>
							<s:else>
								<a href="guestbookAction!showForPage?page=1">第一页</a>
								<a
									href="guestbookAction!showForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
							</s:else>
							<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									href="guestbookAction!showForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
								<a
									href="guestbookAction!showForPage?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
							</s:if>
							<s:else>下一页      最后一页
					
			　　　　</s:else>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>跳转到：</span>
											<s:textfield name="page" size="5" maxLength="10" id="jump"
												onkeyup="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"/>
											<span>页</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<s:submit value="跳转" />
						</form>
					</td>
				</tr>
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
