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
<link  href="css/frame/left_nav.css" rel="stylesheet" type="text/css"/>
<!-- 表单样式 -->
<!-- JS 库 -->
<script type="text/javascript" language="javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var Height = 40; //li的高度
		var pTop = 10; // .lanrenzhijia 的paddding-top的值
		$('.lanrenzhijia li').mouseover(function() {
			$(this).addClass('on').siblings().removeClass('on');
			var index = $(this).index();
			var distance = 40 + (index) * (Height ) + pTop + 'px'; //如果你的li有个border-bottom为1px高度的话，这里需要加1
			$('.lanrenzhijia .hover').stop().animate({
				top : distance
			}, 150); //默认动画时间为150毫秒，懒人们可根据需要修改
		});
		
	});
	$(function(){
		$("a,input[type=submit],button").focus(function(){this.blur()});	
	});
</script>
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
					<c:if test="${newsAndNotice != null}">
						<!-- 文章列表页 -->
						<h2 class="pages_title float_l">
							${newsAndNotice.category.categoryName}</h2>
						<!-- 标题 -->
						<div class="jxjy_path float_r">
							<!-- 位置导航条 -->
							<ul>
								<li>当前位置：</li>
								<li>首页
								</li>
								<li>&gt;</li>
								<li>学院概况
								</li>
								<li>&gt;</li>
								<li class="cr">${newsAndNotice.category.categoryName }</li>
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
								发布时间：${newsAndNotice.time }
								<!-- 发布时间 -->
							</p>
							<div class="cleaner"></div>
						</div>
						<div class="dividertest"></div>
						<div class="jxjy_article">
							<!-- 文章正文 -->
							${newsAndNotice.contentStr}
						</div>
					</c:if>
				</div>
				<c:if test="${newsAndNotice == null}">
					<h5 class="news_title" style="color: red;">暂无内容</h5>
				</c:if>
				<div class="cleaner"></div>
			</div>
			<!-- 侧边栏目，25%宽度，靠左 -->
			<div class="jxjy_page_sidebar float_l">
				<div class="lanrenzhijia">
					<h2 class="title">学院概况</h2>
					<ul>
						<li class="on"><a href="newsAndNoticeAction!showAcademyIntroduction?categoryId=4">学院简介</a>
						</li>
						<li><a href="newsAndNoticeAction!showAcademyIntroduction?categoryId=5">机构设置</a>
						</li>
						<li><a href="newsAndNoticeAction!showAcademyIntroduction?categoryId=6">规章制度</a>
						</li>
					</ul>
					<div class="hover"></div>
				</div>
			</div>
			<div class="cleaner"></div>
		</div>
	</div>
	<!-- 尾部 -->
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
