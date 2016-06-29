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
<!-- 表单样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
<!-- JS 库 -->
<script type="text/javascript" language="javascript"
	src="js/jquery/jquery.js"></script>

</head>
<body>
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
					<h2 class="pages_title float_l">
						${newsAndNotice.category.categoryName}</h2>
					<!-- 标题 -->
					<div class="jxjy_path float_r">
						<!-- 位置导航条 -->
						<ul>
							<li>当前位置：</li>
							<li>首页</li>
							<li>&gt;</li>

							<li><c:if
									test="${newsAndNotice.category.categoryName != '开课通知'}">
									新闻中心
								</c:if> <c:if test="${newsAndNotice.category.categoryName == '开课通知'}">
									培训专栏
								</c:if></li>
							<li>&gt;</li>
							<li class="cr">${newsAndNotice.category.categoryName}</li>

						</ul>
					</div>
					<div class="cleaner"></div>
					<!-- 分割线 -->
					<div class="divider divider_30"></div>
					<h2 class="news_title">${newsAndNotice.title }</h2>
					<!-- 文章标题 -->
					<div class="news_info">
						<!-- 文章内容页 -->
						<p>
							作者：${newsAndNotice.author }
							<!-- 作者信息 -->
							&nbsp;&nbsp; 时间：${newsAndNotice.time }
							<!-- 发布时间 -->
						</p>
						<div class="cleaner"></div>
					</div>
					<div class="dividertest"></div>
					<div class="jxjy_article">
						<!-- 文章正文 -->
						${newsAndNotice.contentStr}
					</div>

				</div>
				<div class="cleaner"></div>
			</div>
			<!-- 侧边栏目，25%宽度，靠左 -->
			<c:if test="${newsAndNotice.category.categoryName != '开课通知'}">
				<%@include file="frontend-news_leftnav.jsp"%>
			</c:if>
			<c:if test="${newsAndNotice.category.categoryName == '开课通知'}">
				<%@include file="frontend-pj_leftnav.jsp"%>
			</c:if>
			<!-- end of jxjy_page_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
	</div>
	<!-- 尾部 -->
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
