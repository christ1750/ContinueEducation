<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>宁夏理工继续教育管理系统后台</title>
		<!-- jQuery AND jQueryUI -->
		<jsp:include page="/inc/head.jsp"></jsp:include>
		<script>
			function setIframeHeight(obj) {
				var height = $(obj).contents().find("body").outerHeight(true);
				var width = $(obj).contents().find("body").outerWidth(true);
				$(obj).height(height);
			}
		</script>
		<script>
			function updateDate() {
				var date = new Date();
				var y = date.getFullYear();
				var m = date.getMonth() + 1;
				var d = date.getDate();
				var h = date.getHours();
				var i = date.getMinutes();
				var s = date.getSeconds();
				var w = date.getDay();
				$("#time")
						.html(
								y + "年" + (m > 9 ? m : ("0" + m)) + "月"
										+ (d > 9 ? d : ("0" + d)) + "日 "
										+ (h > 9 ? h : ("0" + h)) + ":"
										+ (i > 9 ? i : ("0" + i)) + ":"
										+ (s > 9 ? s : ("0" + s)) + " 星期"
										+ "日一二三四五六".charAt(w));
			}
			setInterval("updateDate();", 1000);
		</script>
	</head>
	<body>
		<div id="head">
			<div class="left">
				<img style="width: 84px; height: 84px; padding: 1 0"
					src="images/nxistLogo.png" />
			</div>
			<div>
				<b style="font-size: 30px; padding-left: 110px">继续教育管理系统后台</b>
			</div>

			<div class="right" style="font-size: 15px;">
				<img style="width: 30px; height: 30px;"
					src="styles/img/anonymous.png" />
				<div style="display: inline; padding-right: 30px">
					您好,${sessionScope.userInfo.realName} |
					<a href="<c:url value="logout"/>"><img
							style="width: 30px; height: 30px;"
							src="styles/img/icons/button-white-remove.png" />注销</a>
				</div>
				<span id="time"> <script>
	updateDate();
</script> </span>
			</div>
		</div>

		<div id="sidebar">
		<c:if test="${session.userInfo.role=='2'}">
			<ul>
				<li>
					<a href="javascript:void(0);"> <img
							src="<c:url value="/styles/img/icons/menu/inbox.png"/>" />主菜单 </a>
				</li>

				<li >
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />用户管理</a>
					<ul>
						<li>
							<a href="userManageAction!beforeAdduser" target="contentFrame">新增用户</a>
						</li>
						<li>
							<a href="userManageAction!liststuForPage?page=1" target="contentFrame">管理学生</a>
						</li>
						<li>
							<a href="userManageAction!listmanagerForPage?page=1" target="contentFrame">管理管理员</a>
						</li>
						<li>
							<a href="userManageAction!listteacherForPage?page=1" target="contentFrame">管理教师</a>
						</li>
						<li>
							<a href="userManageAction!listteacherTempForPage?page=1" target="contentFrame">管理临时教师</a>
						</li>
						<li>
							<a href="userManageAction!listdeletedForPage?page=1" target="contentFrame">管理已删除用户</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />图文信息管理</a>
					<ul>
						<li>
							<a href="newsAndNoticeActionForMgr!beforeAddInfo"
								target="contentFrame">图文信息发布</a>
						</li>

						<li>
							<a
								href="newsAndNoticeActionForMgr!queryForPage?page=1&categoryId=1"
								target="contentFrame">图文信息管理</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#"><img
							src=" <c:url value="/styles/img/icons/menu/layout.png"/>" />文件管理</a>
					<ul>
						<li>
							<a href="fileUploadAction!queryFileForPage?page=1"
								target="contentFrame">文件管理</a>
					</ul>
				</li>

				<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />培训项目管理</a>
					<ul>
						<li>
							<a href="myProjectActionForMgr!beforeaddProject" target="contentFrame">添加项目</a>
						</li>
						<li>
							<a href="myProjectActionForMgr!queryProjectForPage?page=1"
								target="contentFrame">项目管理</a>
						</li>
						<li>
							<a href="courseteacherAction!listcourseteacherForPage?page=1"
								target="contentFrame">任课情况查询</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />项目报名管理</a>
					<ul>
						<li>
							<a href="myProjectActionForMgr!listProjectForPage?page=1"
								target="contentFrame">报名审核</a>
						</li>
						<li>
							<a href="myProjectActionForMgr!beforeConfirm" target="contentFrame">报到确认</a>
						</li>
					</ul>
				</li>
				
               <li >
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />课件管理</a>
					<ul>
					   <li>
							<a href="coursewareAction!beforeUpload"
								target="contentFrame">上传课件</a>
						</li>
						<li>
							<a href="coursewareAction!listjxjyForPage1?page=1"
								target="contentFrame">继续教育课件</a>
						</li>
						<li>
							<a href="coursewareAction!listhsjyForPage1?page=1"
								target="contentFrame">函授教育课件</a>
						</li>
						<li>
							<a href="coursewareAction!listaqscpxForPage1?page=1"
								target="contentFrame">安全生产培训课件</a>
						</li>
						<li>
							<a href="coursewareAction!listzyjnpxForPage1?page=1"
								target="contentFrame">职业技能培训课件</a>
						</li>
					</ul>
				</li>
				
				<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />留言管理</a>
					<ul>
						<li>
							<a href="guestbookAction!showForPage?page=1" target="contentFrame">查看留言</a>
						</li>
						<li>
							<a href="guestbookAction!checkForPage?page=1" target="contentFrame">审核留言</a>
						</li>
					</ul>
				</li>
				
				<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />邮件服务</a>
					<ul>
						<li>
							<a href="emailVerifyAction!beforeAddEmail" target="contentFrame">添加邮箱信息</a>
						</li>
						<li>
							<a href="emailVerifyAction!findMailInfoAll" target="contentFrame">邮箱信息管理</a>
						</li>
					</ul>
				</li>
			</ul>
			</c:if>
			<c:if test="${session.userInfo.role!='2'}">
			<ul>
			<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />成绩相关</a>
					<ul>
						<li>
							<a href="courseteacherAction!listteachproject?page=1" target="contentFrame">成绩管理</a>
						</li>
						
					</ul>
				</li>
			<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />课件相关</a>
					<ul>
						<li>
							<a href="coursewareAction!beforeUpload" target="contentFrame">上传课件</a>
						</li>
						
					</ul>
				</li>
			<li>
					<a href="#"><img
							src="<c:url value="/styles/img/icons/menu/layout.png"/>" />留言</a>
					<ul>
						<li>
							<a href="guestbookAction!showForPage?page=1" target="contentFrame">添加留言</a>
						</li>
						
					</ul>
				</li>
				</ul>
			</c:if>
		</div>
		<iframe class="iframeArea" name="contentFrame" id="contentFrame"
			frameborder="0" scrolling="no" onload="setIframeHeight(this);"></iframe>

	</body>
</html>