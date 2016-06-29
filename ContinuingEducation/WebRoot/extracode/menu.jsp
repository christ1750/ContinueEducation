<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String bh = request.getParameter("bh");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>实用jQuery可折叠收缩导航菜单特效代码 - JS代码网</title>
		<link href="css/jscss.css" type="text/css" rel="stylesheet"/>
			<script src="js/jquery-1.3.2.js" type="text/javascript"></script>
			<script type="text/javascript">
	$(function() {
		$(".subNav").click(function() {
			// 修改数字控制速度， slideUp(200)控制卷起速度
				$(this).toggleClass("currentDt").siblings(".subNav")
						.removeClass("currentDt")
				// 修改数字控制速度， slideUp(200)控制卷起速度
				$(this).next(".navContent").slideToggle(200).siblings(
						".navContent").slideUp(200);
			})
	})
</script>
	</head>
	<body>
		<!-- 代码 开始 -->
		<div class="subNavBox">
		<c:if test="${session.userInfo.role=='2'}">
			<div class="subNav">
				用户管理（管理员）
			</div>
			<ul class="navContent">
				<li>
					<a href="../adduser.jsp" target="MainFrame">新增用户用户</a>
				</li>
				<li>
					<a href="../userManageAction!liststuForPage?page=1" target="MainFrame">管理学生</a>
				</li>
				<li>
					<a href="../userManageAction!listmanagerForPage?page=1" target="MainFrame">管理管理员</a>
				</li>
				<li>
					<a href="../userManageAction!listteacherForPage?page=1" target="MainFrame">管理教师</a>
				</li>
				<li>
					<a href="../userManageAction!listteacherTempForPage?page=1" target="MainFrame">管理临时教师</a>
				</li>
				<li>
					<a href="../userManageAction!listdeletedForPage?page=1" target="MainFrame">管理已删除用户</a>
				</li>
			</ul>
			
			<div class="subNav">
				新闻通告管理
			</div>
			<ul class="navContent ">
				<li>
					<a href="../saveormodi_newsandnotice.jsp" target="MainFrame">发布新闻（通告）</a>
				</li>
				<li>
					<a href="../newsAndNoticeActionForMgr!listNewsForPage?page=1" target="MainFrame">新闻（通告）管理</a>
				</li>
			</ul>
			<div class="subNav">
				培训项目管理
			</div>
			<ul class="navContent">
				<li>
					<a href="../saveormodi_project.jsp" target="MainFrame">添加项目</a>
				</li>
				<li>
					<a href="../myProjectActionForMgr!queryProjectForPage?page=1" target="MainFrame">项目管理</a>
				</li>
			</ul>
			<div class="subNav">
				项目报名管理
			</div>
			<ul class="navContent">
				<li>
					<a href="../myProjectActionForMgr!listProjectForPage?page=1" target="MainFrame">报名审核</a>
				</li>
			</ul>
			<div class="subNav">
				资源管理
			</div>
			<ul class="navContent">
				<li>
					<a href="#">添加资源</a>
				</li>
				<li>
					<a href="#">删除资源</a>
				</li>
				<li>
					<a href="#">修改资源</a>
				</li>
			</ul>
			<div class="subNav">
				邮件服务
			</div>
			<ul class="navContent">
				<li>
					<a href="../saveormodi_mailinfo.jsp" target="MainFrame">添加邮箱信息</a>
				</li>
				<li>
					<a href="../emailVerifyAction!findMailInfoAll" target="MainFrame">邮箱信息管理</a>
				</li>
			</ul>
			
			
			<div class="subNav">
				留言管理(管理员)
			</div>
			<ul class="navContent">
				<li>
					<a href="../guestbookAction!showForPage?page=1"target="MainFrame">查看留言</a>
				</li>
				<li>
					<a href="../guestbookAction!checkForPage?page=1"target="MainFrame">审核留言</a>
				</li>
				
			</ul>
			</c:if>
			
			<c:if test="${session.userInfo.role=='2'}">
			<div class="subNav">
				课件管理（管理员）
			</div>
			<ul class="navContent">
				<li>
					<a href="../addcourseware.jsp"target="MainFrame">上传课件</a>
				</li>
				<li>
					<a href="../coursewareAction!listjxjyForPage1?page=1"target="MainFrame">管理继续教育课件</a>
				</li>
				<li>
					<a href="../coursewareAction!listhsjyForPage1?page=1"target="MainFrame">管理函授教育课件</a>
				</li>
				<li>
					<a href="../coursewareAction!listaqscpxForPage1?page=1"target="MainFrame">管理安全生产培训课件</a>
				</li>
				<li>
					<a href="../coursewareAction!listzyjnpxForPage1?page=1"target="MainFrame">管理职业技能培训课件</a>
				</li>
				
			</ul>
			</c:if>
			
		
			
			
			<c:if test="${session.userInfo.role!='2'}">
			
			<div class="subNav">
				课件上传（教师）
			</div>
			<ul class="navContent">
				<li>
					<a href="../addcourseware.jsp"target="MainFrame">上传课件</a>
				</li>
				
			</ul>
			
			<div class="subNav">
				留言板（教师）
			</div>
			<ul class="navContent">
				<li>
					<a href="../guestbookAction!showForPage?page=1"target="MainFrame">查看留言</a>
				</li>
				
			</ul>
			</c:if>
		</div>
	</body>
</html>