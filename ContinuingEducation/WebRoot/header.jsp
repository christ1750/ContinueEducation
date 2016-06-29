<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>宁夏理工继续教育学院</title>
		<meta name="keywords" content="宁夏理工   继续教育  培训  研修" />
		<meta name="description" content="宁夏理工继续教育学院" />
		<link rel="shortcut icon" href="images/favicon.ico" />
		<!-- 基本标签样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/head.css" />
		<link rel="stylesheet" type="text/css" href="css/index/main.css" />
		<script type="text/javascript" src="js/work.js"></script>
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
			$("#time").html(
				y + "年" + (m > 9 ? m : ("0" + m)) + "月"
						+ (d > 9 ? d : ("0" + d)) + "日 "
						+ (h > 9 ? h : ("0" + h)) + ":"
						+ (i > 9 ? i : ("0" + i)) + ":"
						+ (s > 9 ? s : ("0" + s)) + " 星期"
						+ "日一二三四五六".charAt(w));
				}
		setInterval("updateDate();", 1000);
		</script>
		<style>
		.header_top {
			height: 24px !important;
			line-height: 24px;
			border-bottom: 1px solid #DBDBDB;
			color: #103667;
			overflow: hidden;
			background: transparent url("images/green_skin.png") repeat-x scroll 0px -188px;
		}
		
		.header_top .time {
			float: left;
		}
		
		.header_top .toplinks {
			float: right;
		}
		</style>
	</head>
	<body>
		<div class="header_top">
			<div style="width: 50%; margin: auto;">
				<div id="time" class="time">
					<script>
						updateDate();
					</script>
				</div>
				<div class="toplinks">
					<c:if test="${session.userInfo==null}">
						<a href="frontend-register.jsp" target="_self"> <span>注册</span> </a>&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${session.userInfo!=null}">
						<a href="frontend-personalinfo.jsp?bh=${session.userInfo.userId}">欢迎您，${session.userInfo.userName}！</a>
						<a href="logout" target="_self" class="rss">&nbsp;&nbsp;退出</a>
					</c:if>
					</div>
			</div>
		</div>
		<!-- 头部 -->
		<div class="jxjy_head_wrapper">
			<div class="jxjy_pic_show">
				<img src="images/top.jpg" width="1000px" />
			</div>
			<div class="navbg">
				<div class="col960">
					<ul id="navul" class="cl">
						<li>
							<a href="index.jsp" target="_self">首页</a>
						</li>
						<li>
							<a
								href="newsAndNoticeAction!showAcademyIntroduction?categoryId=4"
								target="_self">学院概况</a>
							<ul id="subNews" class="second-menu">

							</ul>
						</li>
						<li>
							<a href="newsAndNoticeAction!queryForPage?page=1&categoryId=1"
								target="_self">新闻中心</a>
						</li>
						<li>
							<a href="newsAndNoticeAction!queryForPage?page=1&categoryId=3"
								target="_self">培训专栏</a>
						</li>
						<li>
							<a href="#" target="_self">&nbsp;继续教育 </a>
							<ul id="subNews" class="second-menu">
							</ul>
						</li>
						<li>
							<a href="#" target="_self">&nbsp;成人教育 </a>
							<ul id="subNews" class="second-menu">
							</ul>
						</li>
						<li>
							<a
								href="fileUploadActionForMgr!queryFileForPage?page=1&categoryId=1"
								target="_self">资源下载</a>
							<ul id="subNews" class="second-menu">
							</ul>
						</li>
						<li>
							<a href="guestbookAction!listForPage?page=1" target="_self">留言板</a>
						</li>
						<li>
							<a href="frontend-contactus.jsp" target="_self">联系我们</a>
						</li>

					</ul>
				</div>
			</div>
			<!-- end of jxjy_banner -->
		</div>
	</body>
</html>