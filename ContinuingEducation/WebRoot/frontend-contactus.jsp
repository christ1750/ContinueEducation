<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- css style -->
<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
<!-- 基本标签样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
<!-- 按钮样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
<!-- 表单样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
<link rel="stylesheet" type="text/css" href="css/frame/head.css" />
<link rel="stylesheet" type="text/css" href="css/index/main.css" />

<!-- JS 库 -->
<script type="text/javascript" language="javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script src="js/baidumap.js" type="text/javascript"></script>
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
					<h2 class="pages_title float_l">联系我们</h2>
					<!-- 标题 -->
					<div class="jxjy_path float_r">
						<!-- 位置导航条 -->
						<ul>
							<li>当前位置：</li>
							<li>首页</li>
							<li>&gt;</li>
							<li class="cr">联系我们</li>
						</ul>
					</div>
					<div class="cleaner"></div>
					<div class="divider divider_30"></div>
					<!-- 分割线 -->
					<div class="jxjy_article">
						<!--百度地图容器-->
						<div style="width: 680px; height: 550px; border: #ccc solid 1px;"
							id="dituContent"></div>
					</div>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- 侧边栏目，25%宽度，靠左 -->
			<div class="jxjy_page_sidebar float_l">
				<div class="lanrenzhijia">
					<h2 class="title">联系我们</h2>
					<div class="jxjy_nav_section_1">
						<div class="jxjy_nav_list_box">
							<table>
								<tr>
									<td><strong>详细地址(参见右侧地图):</strong></td>
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
				</div>

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

