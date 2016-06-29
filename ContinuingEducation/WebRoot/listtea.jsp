<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>查询教师信息</title>

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
   function change(){
    if(confirm("确认修改该记录吗？")){
     return true;
    }
    return false;
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
							当前位置：查询教师信息
						</td>
						<td align="right">
							<s:a href=""></s:a>
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
				<s:form name="showSearch"
					action="wagesAction!listteaForPage?page=1" method="post">
					<table>
						<tr height="20px">
							<td>
								<span> <s:label>查询条件      </s:label> </span>
							</td>
						</tr>
						<tr>

							<td>
								<span> <s:label>用户名:</s:label> <s:textfield
										name="searchUserName" /> </span>
								<span> <s:label>真实姓名:</s:label> <s:textfield
										name="searchRealName" /> </span>
								<span> <s:label>身份证号:</s:label> <s:textfield
										name="searchCertificateID" /> </span>
							</td>

							<td width="20px">
							</td>
							<td>
								<span> <s:submit cssClass="button" value="查询" /> </span>
							</td>
						</tr>
					</table>
				</s:form>
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
								教师信息
							</th>
						</tr>

						<tr bgcolor="#CCCCFE" height="30px">

							<th style="WORD-WRAP: break-word" width="15%">
								用户名
							</th>
							<th style="WORD-WRAP: break-word" width="40%">
								真实姓名
							</th>
							<th style="WORD-WRAP: break-word" width="10%">
								身份
							</th>
							<th style="WORD-WRAP: break-word" width="10%">
								身份证号
							</th>
							<th style="WORD-WRAP: break-word" width="15%">
								联系电话
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
									${x.userName}
								</td>
								<td>
									${x.realName}
								</td>
								<td>
									<c:if test="${x.role=='3'}">教师</c:if>
									<c:if test="${x.role=='4'}">临时教师</c:if>
								</td>
								<td>
									${x.certificateID}
								</td>
								<td>
									${x.mobile}
								</td>
								<td>
									<a
										href="userManageAction!deleteUserInfo?searchUserID=${x.userId}&deletetype=3"
										onclick="return del()">删除</a>
									<a
										href="userManageAction!showoneuser?bh=${x.userId}">查看或修改</a>
									
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
						<form action="userManageAction!listteacherForPage" method="post">
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
								<a href="userManageAction!listteacherForPage?page=1">第一页</a>
								<a
									href="userManageAction!listteacherForPage?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
							</s:else>
							<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									href="userManageAction!listteacherForPage?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
								<a
									href="userManageAction!listteacherForPage?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
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
		</div>
	</body>
</html>
