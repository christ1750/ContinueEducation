<%@ page language="java"
	import="java.util.*,edu.neu.nxist.continuingedu.register.model.*,edu.neu.nxist.continuingedu.guestbook.model.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Integer index = 0;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>成绩查询</title>
<!-- css style -->
<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
<!-- 基本标签样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
<!-- 二级页面样式按钮 -->
<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
<link rel="stylesheet" type="text/css" href="css/frame/main_body.css" />
<!-- 表单样式 -->
<!-- JS 库 -->
<!-- JS 库 -->
<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
<SCRIPT type="text/javascript">
function respond(index)
{
    var cuser=document.getElementById("comment"+index);
    var ctext=document.getElementById("comment");
    ctext.value="回复"+cuser.value+"  :";

}
 function del(){
    if(confirm("确认删除该记录吗？")){
     return true;
    }
    return false;
   }
 function affirm(){
   	var strtemp=$.trim($("#comment").val());
 	var lengthtemp=strtemp.lastIndexOf(":");
 	if( strtemp=='')
 	{
 		alert('请填写评论！！');
 		return false;
 	}
 
 	
 	else if($.trim(strtemp.substr(lengthtemp+1))=='')
 	{
 	alert('请填写评论！！');
 		return false;
 	}
   	else
   	  alert("您的留言将在通过审核后显示");
   	  return true;
   }
	$(function() {
		var Height = 40; //li的高度
		var pTop = 10; // .lanrenzhijia 的paddding-top的值
		$('.lanrenzhijia li').mouseover(function() {
			$(this).addClass('on').siblings().removeClass('on');
			var index = $(this).index();
			var distance = 40 + (index) * (Height) + pTop + 'px'; //如果你的li有个border-bottom为1px高度的话，这里需要加1
			$('.lanrenzhijia .hover').stop().animate({
				top : distance
			}, 150); //默认动画时间为150毫秒，懒人们可根据需要修改
		});

	});
</SCRIPT>

</head>
<body id="news_list.jsp">
	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true" />
	<!-- 主体 -->
	<div class="jxjy_page_body_wrapper">
		<div class="jxjy_page_body">
			<!-- 主体内容，75%宽度，靠右 -->
			<div class="jxjy_pages_content float_r">
				<!-- 内容区，左右增加边距 -->
				<div class="jxjy_pages_text">
					<!-- 文章列表页 -->
					<h2 class="pages_title float_l">成绩查询</h2>
					<!-- 标题 -->
					<div class="jxjy_path float_r">
						<!-- 位置导航条 -->
						<ul>
							<li>当前位置：</li>
							<li>首页</li>
							<li>&gt;</li>
							<li class="cr">成绩查询</li>
						</ul>
					</div>
					<div class="cleaner"></div>
					<div class="divider"></div>
					<table class="admin" cellspacing="5">
						<thead>
							<tr>
								<td width="80"></td>
								<td></td>
							</tr>
						</thead>
						<tbody>

							<table width="696" border='1' cellpadding='2' cellspacing='0'
		style='border-collapse:collapse; margin-top: 4px;'
		bordercolor='red' class="myTableId datalist">
		<thead>
			<tr bgcolor="red" height="30">
				<th colspan="14">学生成绩</th>
			</tr>
			<tr bgcolor="red" height="25">
				<th>课程名称</th>
				<th>培训类别</th>
				<th>审批编号</th>
				<th>报名时间</th>
				<th>成绩</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageBean.list}" var="x" varStatus="status">
				<tr <c:if test="${status.count%2==1}">bgcolor="lightblue"</c:if>
					height="20">
					
					<td>${x.project.projectName}</td>
					<td>${x.project.projectCategory.pjCategoryName}</td>
					<td>${x.project.projectOrder}</td>
					<td>${x.signupTime}</td>
					<td>
					<c:if test="${x.issue==1}">${x.grade}</c:if>
					<c:if test="${x.issue==0}">未公布</c:if>
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			
		</tfoot>
	</table>
						</tbody>
					</table>
					<div class="jxjy_paging">
						<!-- 文章列表分页 -->
						<form action="courseteacherAction!searchgrade" method="post">
							<!-- 项目列表分页 -->
							<ul>
								<li class="cr paging_tall">第 <span
									style="color:#e54040;font-weight:bold;"><s:property
											value="pageBean.currentPage" /> </span>页/总 <span><s:property
											value="pageBean.totalPage" /> </span>页 总 <span
									style="color:#e54040;font-weight:bold;"><s:property
											value="pageBean.allRow" /> </span> 条&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li class="c1"><a href="courseteacherAction!searchgrade?page=1"
									target="_self"><span id="first">首页</span> </a>&nbsp;</li>
								<li class="c2"><s:if test="%{pageBean.currentPage != 1}">
										<a
											href="courseteacherAction!searchgrade?page=<s:property value="%{pageBean.currentPage-1}"/>"
											target="_self"><span>上一页</span> </a>&nbsp;
									</s:if> <s:else>
										<a
											href="courseteacherAction!searchgrade?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>上一页</span> </a>
									</s:else></li>
								<li class="c3"><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="courseteacherAction!searchgrade?page=<s:property value="%{pageBean.currentPage+1}"/>"
											target="_self"><span>下一页</span> </a>&nbsp;
									</s:if> <s:else>
										<a
											href="courseteacherAction!searchgrade?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>下一页</span> </a>
									</s:else></li>
								<li class="c4"><a
									href="courseteacherAction!searchgrade?page=<s:property value="pageBean.totalPage"/>"
									target="_self"><span>末页</span> </a>&nbsp;</li>
								<li class="c2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>跳转到：</span>
									<s:textfield name="page" size="5" maxLength="10" id="jump"
										onkeyup="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
										cssStyle="width:50px;height:20px;" /> <span>页</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<s:submit value="跳转"
										cssStyle="width:55px;height:24px;cursor:pointer;" /></li>
							</ul>
						</form>
					</div>
					<br>
					<div class="cleaner"></div>
					
					
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- 侧边栏目，25%宽度，靠左 -->
			<div class="jxjy_page_sidebar float_l">
			<jsp:include page="frontend-searchgrade_leftnav.jsp" flush="true" />
			<%-- 	<div class="lanrenzhijia">
					<h2 class="title">留言板</h2>
					<div class="jxjy_nav_section_1">
						<div class="jxjy_nav_list_box">
							<table>
								<tr>
									<td><strong>详细地址:</strong></td>
									<td>宁夏石嘴山市大武口区山水大道学院路1号</td>
								</tr>
								<tr>
									<td><strong>邮政编码：</strong>753000</td>
								</tr>
								<tr>
									<td><strong>联系电话：</strong></td>
								</tr>
								<tr>
									<td>0952-2043289</td>
								</tr>
								<tr>
									<td>0952-2042781</td>
								</tr>
								<tr>
									<td>0952-2013520</td>
								</tr>
								<tr>
									<td><strong>联系人：</strong></td>
									<td>许老师、王老师、郗老师、吴老师</td>
								</tr>
								<tr>
									<td><strong>E-mail：</strong></td>
									<td>275501194@qq.com</td>
								</tr>
							</table>
						</div>
						<div class="cleaner"></div>
					</div>
				</div> --%>
			</div>
			<!-- end of jxjy_page_sidebar -->
			<div class="cleaner"></div>
		</div>
		<!-- end of jxjy_page_body -->
	</div>
	<div class="cleaner"></div>

	 <jsp:include page="footer.jsp" flush="true" />
</body>
</html>
