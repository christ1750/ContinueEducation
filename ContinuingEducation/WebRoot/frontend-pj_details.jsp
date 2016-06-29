<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- css style -->
<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
<!-- 基本标签样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
<!-- 二级页面样式按钮 -->
<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
<!-- 表单样式 -->
<!-- JS 库 -->
<script type="text/javascript" language="javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/pjReg.js"></script>
<style>

.login a {
	display: block;
	color: #fff;
	font-size: 14px;
	margin: 0;
	text-align: center;
	cursor: pointer;
	width: 66px;
	padding: 6px 3px 6px 3px;
	background: #26C1F3;
	border-radius: 1px;
	position: relative;
	float: left;
	margin-left: 10px;
}

.login a:hover {
	background: #4C9ED9;
	transition: background 0.15s linear;
}

.login a:active {
	background: #888;
}
</style>
</head>

<body>
	<input type="hidden" id="userId" value="${session.userInfo.userId}" />
	<input type="hidden" id="projectId" value="${myProject.projectID}" />
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
					<h2 class="pages_title float_l">项目信息</h2>
					<!-- 标题 -->
					<div class="jxjy_path float_r">
						<!-- 位置导航条 -->
						<ul>
							<li>当前位置：</li>
							<li>首页</li>
							<li>&gt;</li>
							<li>培训专栏</li>
							<li>&gt;</li>
							<li class="cr">项目信息</li>
						</ul>
					</div>
					<div class="cleaner"></div>
					<div class="divider divider_30"></div>
					<!-- 分割线 -->

					<h2 class="news_title">${myProject.projectName}</h2>
					<!-- 课程名称 -->
					<div class="cleaner"></div>
					<div class="formular">
						<fieldset>
							<legend>
								<div class="login">
									<a title="在线报名" href="javascript:void(0)"
										onclick="checkLogin();">在线报名</a>&nbsp;&nbsp;&nbsp;&nbsp;<a title="打印该页" onclick="window.print()" href="javascript:void(0)">打印该页</a>
								</div>
								

							</legend>
							<label>
								<div class="jxjy_course_info float_l">
									<!-- 位置导航条 -->
									<ul>
										<li><strong>审批编号：</strong>${myProject.projectOrder}</li>
										<li><strong>办班单位：</strong>${myProject.projectSponsor.pjSponsorName}
										</li>
										<li><strong>办班状态：</strong><strong class="orange">${myProject.projectStatus.pjStatusName}</strong>
										</li>
										<li><strong>招生范围：</strong>${myProject.projectScope.pjScopeName}
										</li>
										<li><strong>上课地点：</strong>${myProject.site}</li>
										<li><strong>计划办班时间：</strong>${myProject.beginTime} -
											${myProject.endTime}</li>
										<li><strong>课程费用：</strong>${myProject.cost} 元/人</li>
										<li><strong>开班规模：</strong>${myProject.volume}人</li>
									</ul>
								</div> </label>
						</fieldset>
					</div>

					<div class="cleaner"></div>
					<div class="jxjy_article">
						<!-- 文章正文 -->
						${myProject.introStr}
					</div>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- 侧边栏目，25%宽度，靠左 -->
			<%@include file="frontend-pj_leftnav.jsp"%>
			<!-- end of jxjy_page_sidebar -->
		</div>
		<!-- end of jxjy_page_body -->
	</div>
	<!-- end of jxjy_page_body_wrapper -->
	<!-- 尾部 -->
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
