<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		<!-- JS 库 -->
				<!-- JS 库 -->
		<script type="text/javascript" language="javascript"
			src="js/jquery.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/jquery.easing.1.3.js"></script>

<style >

#menu{width:700px;overflow:hidden; margin:15px auto;}
#menu #nav {display:block;width:100%;padding:0;margin:0;list-style:none;}
#menu #nav li {float:left;width:165px;padding-right: 5px;height: 35px}
#menu #nav li a {display:block;height:35px;line-height:35px;  text-decoration:none;padding:0 0 0 5px; text-align:center; color:#111; background: #96ca6b; }
#menu #nav li a:hover {color:#fff; background-color: #636871;}
</style>
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
						<h2 class="pages_title float_l">
							课件下载
						</h2>
						<!-- 标题 -->
						<div class="jxjy_path float_r">
							<!-- 位置导航条 -->
							<ul>
								<li>
									当前位置：
								</li>
								<li>
									<a href="index.jsp" target="_self" title="首页">首页</a>
								</li>
								<li>
									&gt;
								</li>
								<li class="cr">
									下载中心
								</li>
								<li>
									&gt;
								</li>
								<li class="cr">
									课件下载
								</li>
							</ul>
						</div>
						<div class="cleaner"></div>
						<div class="divider"></div>
						<!-- 分割线 -->
	<!-- 					<h1>
						    课件下载
						</h1><br /><br /><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listjxjyForPage?page=1'">下载继续教育课件</button><br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listhsjyForPage?page=1'">下载函授教育课件</button><br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listaqscpxForPage?page=1'">下载安全生产培训课件</button><br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listzyjnpxForPage?page=1'">下载职业技能培训课件</button><br /><br /><br /><br /><br /> -->
<div id="menu">
<!--tag标题-->
    <ul id="nav">
        <li><a href="coursewareAction!listjxjyForPage?page=1" target="_self" >继续教育课件</a></li>
        <li><a href="coursewareAction!listhsjyForPage?page=1" target="_self">函授教育课件</a></li>
        <li><a href="coursewareAction!listaqscpxForPage?page=1" target="_self">安全生产培训课件</a></li>
         <li><a href="coursewareAction!listzyjnpxForPage?page=1" target="_self">职业技能培训课件</a></li>
    </ul>
 <!--     <div>
    <iframe class="" name="downLoadFrame" width="670px" height="650px" style="border: 1px solid #999;margin-top: 5px;"></iframe>
    </div> -->


</div>
						<div class="cleaner"></div>
					</div>
					<div class="cleaner"></div>
				</div>
				<!-- 侧边栏目，25%宽度，靠左 -->
				<div class="jxjy_page_sidebar float_l">

					<!-- 侧边导航标题 -->
					<h2 class="jxjy_page_sidebar_title"> 
					</h2>
					<!-- 侧边导航菜单 -->
					<jsp:include page="left.jsp" flush="true" />
				</div>
				<!-- end of jxjy_page_sidebar -->
				<div class="cleaner"></div>
			</div>
			<!-- end of jxjy_page_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<!-- 尾部 -->
		<jsp:include page="footer.jsp" flush="true" />
	</body>
</html>
