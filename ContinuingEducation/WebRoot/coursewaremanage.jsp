<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		<link rel="stylesheet" type="text/css" href="css/frame/main_body.css" />
		<!-- 主页样式 -->

		<!-- JS 库 -->
		<script type="text/javascript" language="javascript"
			src="js/jquery-1.6.3.min.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/newsandnotice.js"></script>
	</head>
	<body id="index.jsp">
		<!-- 头部 -->
		<jsp:include page="header.jsp" flush="true" />
		<!-- 主体 -->
		<div class="jxjy_main_body_wrapper">
			<div class="jxjy_main_body">
				<div class="jxjy_main_content_wrapper">
					<div class="jxjy_main_content float_r">
						<h1>
						    课件下载
						</h1><br /><br /><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='addcourseware.jsp'">上传课件</button><br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listjxjyForPage1?page=1'">管理继续教育课件</button><br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listhsjyForPage1?page=1'">管理函授教育课件</button><br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listaqscpxForPage1?page=1'">管理安全生产培训课件</button><br /><br /><br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="window.location.href='coursewareAction!listzyjnpxForPage1?page=1'">管理职业技能培训课件</button><br /><br /><br /><br /><br />
						
						<div class="cleaner"></div>

					</div>
					<!-- end of jxjy_main_content -->

					<div class="jxjy_main_sidebar float_l">
						<div class="jxjy_nav_section_1">
							<h2 class="jxjy_nav_list_title_1">
								站内搜索
							</h2>
							<form id="news_search" name="news_search" method="get"
								action="new_search.php" class="jxjy_news_search_bar">
								<input name="keystr" id="keystr"
									class="validate[optional,maxSize[30]] text-input" type="text"
									placeholder="请输入关键词"/>
									<button type="submit" name="news" id="news"
										onClick=returnButton1_onclick();>
										搜索
									</button>
							</form>
							<div class="cleaner"></div>
						</div>
						<div class="jxjy_nav_section_1">
							<h2 class="jxjy_nav_list_title_2">
								快速通道
							</h2>
							<div class="jxjy_nav_list_box">
								<ul>
									<li>
										<a href="/apply" target="_blank" title="">进修访学网上申报</a>
									</li>
									<li>
										<a href="/admin" target="_blank" title="">培训项目申报</a>
									</li>
									<li>
										<a href="project_list.php?optionid=424&search=1"
											target="_blank" title="">培训项目检索</a>
									</li>
									<!--  <li><a href="html/news_info/336.html" target="_blank" title="">违规投诉</a> </li>-->
								</ul>
							</div>
							<div class="cleaner"></div>
						</div>
						<div class="jxjy_nav_section_1">
							<h2 class="jxjy_nav_list_title_3">
								办事指南
							</h2>
							<div class="jxjy_nav_list_box">
								<ul>
									<li>
										<a href="new_list.php?optionid=437&auto_id=357"
											target="_blank" title="">办理英文学历/学位证明</a>
									</li>
									<li>
										<a href="new_list.php?optionid=437&auto_id=350"
											target="_blank" title="">办理中英文成绩单</a>
									</li>
									<li>
										<a href="new_list.php?optionid=437&auto_id=359"
											target="_blank" title="">补办学历/学位证明书</a>
									</li>
									<li>
										<a href="new_list.php?optionid=438&auto_id=351"
											target="_blank" title="">申请非学历培训项目</a>
									</li>
								</ul>
							</div>
							<div class="cleaner"></div>
						</div>
						<div class="jxjy_nav_section_1">
							<h2 class="jxjy_nav_list_title_4">
								咨询投诉
							</h2>
							<div class="jxjy_nav_list_box">
								<ul>
									<li>
										<span><strong>高端培训：</strong> </span>
									</li>
									<li>
										<span>教育培训咨询电话：62757911 </span>
									</li>
									<li>
										<span>违规办学投诉电话：62755911 </span>
									</li>
									<li>
										<span>进修访学咨询电话：62767344 </span>
									</li>
									<li>
										<span><strong>学历教育：</strong> </span>
									</li>
									<li>
										<span>成人教育咨询电话：62751455 </span>
									</li>
									<li>
										<span>网络教育咨询电话：62757270 </span>
									</li>
									<li>
										<span>学历教育投诉电话：62751455 </span>
									</li>
									<li>
										<span>考风考纪监督电话：62751457 </span>
									</li>
									<li>
										<span><strong>自学考试：</strong> </span>
									</li>
									<li>
										<span>北京自考咨询电话：1606688 </span>
									</li>
									<li>
										<span>北京自考报名电话：<a
											style="margin: 0; padding: 0; background: none; display: inline;"
											href="http://www.bjeea.cn/html/zk/fujian/2010/1104/14174.html"
											target="_blank">点击展开</a> </span>
									</li>
									<li>
										<span>北大自考办电话：62753977 </span>
									</li>
								</ul>
							</div>
							<div class="cleaner"></div>
						</div>
						
					</div>
					<!-- end of jxjy_main_sidebar -->
					<div class="cleaner"></div>
				</div>
				<!-- end of jxjy_main_content_wrapper -->
			</div>
			<!-- end of jxjy_main_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<!-- 尾部 -->
		<jsp:include page="footer.jsp" flush="true" />
	</body>
</html>
