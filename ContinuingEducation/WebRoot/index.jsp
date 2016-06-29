<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=11" />
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- css style -->
<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
<!-- 基本标签样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
<!-- 按钮样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
<!-- 表单样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/main_body.css" />
<link rel="stylesheet" type="text/css" href="css/index/tab.css" />
<!-- tab的样式 -->
<link rel="stylesheet" type="text/css" href="css/index/slideshow.css" />
<!--焦点图的样式 -->
<link rel="stylesheet" type="text/css" href="css/index/drop-down.css" />
<!-- JS 库 -->
<script type="text/javascript" language="javascript"
	src="js/jquery/jquery.js"></script>
<script type="text/javascript" language="javascript" src="js/index.js"></script>
<script type="text/javascript" language="javascript"
	src="js/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/select-widget-min.js"></script>
<script type="text/javascript" language="javascript"
	src="js/slideshow.js"></script>
<!--焦点图js -->
<script type="text/javascript" language="javascript"
	src="js/superslide.2.1.js"></script>
<!-- tab的js-->
<%
	String error = (String) request.getAttribute("error");
%>
<script type="text/javascript">
        function error(){  
            var error = '<%=error%>
	';
		if (error != "null") {
			alert(error);
		}
	}
</script>
</head>
<body id="index.jsp" onload="error();">

	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true" />
	<!-- 主体 -->

	<div class="jxjy_main_body">
		<div class="jxjy_main_content_wrapper">
			<div class="jxjy_main_content float_l">
				<div class="cleaner"></div>
				<div class="jxjy_news_section_0">
					<div class="comiis_wrapad" id="slideContainer">
						<div id="frameHlicAe" class="frame cl">
							<div class="temp"></div>
							<div class="block">
								<ul class="slideshow" id="slidesImgs">
									<li><a href="#"> <img src="images/t_17183850202.jpg"
											width="465" height="275" alt="" /> </a><span class="title">王子健在宁夏宣讲党的十八届三中全会</span>
									</li>
									<li><a href="#"> <img src="images/t_2183446679.jpg"
											width="465" height="275" alt="" /> </a><span class="title">李长春在重庆调研</span>
									</li>
									<li><a href="#"> <img src="images/t_101815920.jpg"
											width="465" height="275" alt="" /> </a><span class="title">李长春新书《文化强国之路》在北京发布</span>
									</li>
									<li><a href="#"> <img src="images/t_518235381.jpg"
											width="465" height="275" alt="" /> </a><span class="title">王露露会见英国知识产权局局长约翰·奥</span>
									</li>
								</ul>

								<div class="slidebar" id="slideBar">
									<ul>
										<li class="on">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
									</ul>
								</div>
							</div>
						</div>
						</div>
						<div class="slideTxtBox">
							<div class="hd">
								<ul>
									<li>学院动态</li>
									<li>通知公告</li>
								</ul>
							</div>
							<div class="bd">
								<ul id="list1" class="list_01">

								</ul>

								<ul id="list2" class="list_01">
								</ul>
							</div>
						</div>
					
				</div>


				<script>
					SlideShow(3000);
				</script>

				<div class="cleaner"></div>

				<div class="jxjy_news_section_2">
					<h2>
						<span>项目搜索</span>
					</h2>

					<div class="jxjy_project_search_bar">
						<div class="form_item">
							<form id="project_search" name="project_search" method="post"
								action="myProjectAction!searchProjectForPage?page=1">
								<fieldset>
									<s:textfield name="searchProjectName" id="title"
										placeholder="请输入项目关键词" type="text" />

									<select name="searchProjectCategory" id="projectCategory"
										style="width: 180px;">
										<option value="0">全部项目</option>
									</select>
									<button id="send" type="submit" style="width: 120px;">
										查询</button>
								</fieldset>
							</form>
						</div>
						<!-- <div style="margin-top:5px;height:1px;width:700px;border-bottom: 1px dashed #f59701;"></div> -->
					</div>
					<div class="cleaner"></div>
				</div>
				<div class="cleaner"></div>

				<div class="jxjy_notice_section_1 float_l">
					<h2>
						<span>开课公告</span><a href="new_list.php?optionid=444"
							target="_blank">更多&gt;&gt;</a>
					</h2>
					<ul id="list3" class="list_01">

					</ul>
					<div class="cleaner"></div>
				</div>
				<div class="jxjy_notice_section_1 float_l">
					<h2>
						<span>招生信息</span><a href="#" target="_blank">更多&gt;&gt;</a>
					</h2>
					<ul class="list_01">
						<li><span> 2015-04-16 </span><a href="#" target="_self"
							title="关于冒用北京大学名义进行地铁“募捐”活动的声明"> 关于冒用大学名义进行地铁“募捐”活 </a></li>
						<li><span> 2014-05-26 </span><a href="#" target="_self"
							title="关于发布“假冒北京大学名义的教育培训网站公示”的通知"> 关于发布“假冒大学名义的教育培训网 </a></li>
						<li><span> 2011-05-24 </span><a href="#" target="_self"
							title="关于新中华培训网假冒北京大学名义发布“工商管理（EMBA）课程”的声明">
								关于新中华培训网假冒北京大学名义发布“ </a></li>
						<li><span> 2011-03-09 </span><a href="#" target="_blank"
							title="关于“全国百名地产界领军人物”冒用北京大学名义招生的声明"> 关于“全国百名地产界领军人物”冒用 </a></li>
						<li><span> 2010-07-14 </span><a href="#" target="_self"
							title="关于对“华夏儒商”使用北大名义举办培训项目的声明"> 关于对“华夏儒商”使用名义举办培训 </a></li>
						<li><span> 2014-05-13 </span><a href="#" target="_self"
							title="2014--2015年北京大学进修教师、访问学者接受办法">
								2014--2015年北京大学进修教师、访问学者 </a></li>
						<li><span> 2009-05-12 </span><a href="#" target="_self"
							title="进修教师、访问学者游香山"> 进修教师、访问学者游香山 </a></li>
						<li><span> 2009-05-12 </span><a href="#" target="_self"
							title="中组部、教育部领导到北大考察“西部之光”访问学者工作"> 中组部、教育部领导到北大考察“西部之光 </a></li>
						<li><span> 2015-02-26 </span><a href="#" target="_self"
							title="2015--2016年北京大学进修教师、访问学者接受办法"> 2015--2016年大学进修教师、访问学者
						</a></li>
						<li><span> 2014-05-13 </span><a href="#" target="_self"
							title="2014--2015年北京大学进修教师、访问学者接受办法"> 2014--2015年大学进修教师、访问学者
						</a></li>
					</ul>
					<div class="cleaner"></div>
				</div>
				<div class="cleaner"></div>

				<div class="cleaner"></div>
			</div>
			<!-- end of jxjy_main_content -->
			<div class="jxjy_main_sidebar float_l">
				<div class="jxjy_nav_section_1">
					<c:if test="${session.userInfo==null}">
						<div class="formal" id="loginform" style="margin-top: 0px;">
							<div class="notice_section_1">
								<h3>
									<span>登录入口</span>
								</h3>
							</div>
							<form style="padding: 10px 10px; border: 1px solid #ccc">
								<div class="form_indexlogin">
									<span>用户名</span>
									<!-- 网站登录用户名 -->
									<input name="userName" id="userName"
										class="validate[required,minSize[6],maxSize[20]] text-input"
										type="text" placeholder="请输入用户名" />

								</div>
								<div class="form_indexlogin">
									<span>密&nbsp;&nbsp;&nbsp;码</span>
									<!-- 网站登录密码 -->
									<input name="userPassword" id="userPassword"
										class="validate[required,minSize[6],maxSize[20]] text-input"
										type="password" placeholder="请输入密码" />

								</div>
								<div class="form_indexlogin">
									<span>身&nbsp;&nbsp;&nbsp;份</span>
									<!-- 登录身份 -->
									<input name="userRole" type="radio" id="role1" value="1" /> <span>学员</span>
									<input type="radio" name="userRole" id="role2" value="2"
										checked="checked" /> <span>管理员</span> <br/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<input
										name="userRole" type="radio" id="role3" value="3" /> <span>教师</span>
									<input name="userRole" type="radio" id="role4" value="4" /> <span>临时教师</span>
								</div>
								<br /> <br />
								<table align="center" style="margin-bottom: 12px;">
									<tr>
										<td>
											<button id='login'
												style="background: #093e89; color: #fff; font-size: 12px; border: 0px; margin-right: 10px">
												登录</button>
											<button id="reset" type="reset"
												style="background: #fdc256; color: #444; font-size: 12px; border: 0px;">
												重置</button></td>
									</tr>
								</table>
							</form>
						</div>
					</c:if>
					<c:if test="${session.userInfo!=null}"></c:if>

					<div class="formal" style="margin-top: 2px;">
						
							<div class="notice_section_1"
								style="width: 176px; margin-left: 0px;">
								<h3>
									<span>快捷入口</span>
								</h3>
							</div>
							<ul id="feature">
								<li id="f1"><a href="frontend-register.jsp" target="_self"><span>在线注册</span>
										<p>加入我们</p> </a></li>
								<li id="f2"><a
									href="myProjectAction!searchProjectForPage?page=1"
									target="_self" title=""><span>项目检索</span>
										<p>了解项目信息</p> </a></li>
								<li id="f3"><a
									href="fileUploadActionForMgr!queryFileForPage?page=1&categoryId=1"
									target="_self"><span>课件下载</span>
										<p>知识的海洋</p> </a></li>
								<li id="f4"><a href="#" target="_self" title=""><span>学院日历</span>
										<p>工作计划</p> </a></li>
								<li id="f5"><a href="#" target="_self" title=""><span>查询成绩</span>
										<p>祝您好运</p> </a></li>
								<li id="f6"><a href="guestbookAction!listForPage?page=1"
									target="_self"><span>快速留言</span>
										<p>留下你的建议</p> </a></li>
							</ul>
						<div class="cleaner"></div>
					</div>
					<%-- <div class="formal" style="margin-top: 5px;">
						<div class="notice_section_1"
							style="width: 176px; margin-left: 4px;">
							<h3>
								<span>友情链接</span>
							</h3>
						</div>
						<div class="jxjy_nav_list_box">
							<ul>
								<li>
									<div id="tm2008style">
										<select class="shortselect"
											onChange="if(value!=''){window.open(this.options[this.selectedIndex].value);}else{return(false);}">
											<option value="">-----校内专线-----</option>
											<option value=http://192.168.0.9/jwweb>教务处</option>
											<option value=http://nxist.com/kyc/index.aspx>科研处</option>
											<option value=http://nxist.com/xsc>学生处</option>
											<option value=http://nxist.com/renshichu/index.asp>
												人事处</option>
											<option value=http://nxist.com/jyxx>就业指导中心</option>
											<option value=http://nxist.com/xcb>宣传部</option>
											<option value=http://nxist.com/zhaosheng>招生宣传</option>
											<option value=http://nxist.com/xsc/xljk/index.aspx>
												心理协会</option>
											<option value=http://nxist.com/zyz>志愿者协会</option>
											<option value=http://nxist.com/hszh>院红十字会</option>
											<option value=http://nxist.com/sl>社团联合会</option>
											<option value=http://nxist.com/root.asp>快速入口</option>
										</select>
								</li>
								<li><select class="shortselect"
									onChange="if(value!=''){window.open(this.options[this.selectedIndex].value);}else{return(false);}">
										<option value="">-----友情链接-----</option>
										<option value="http://202.107.127.117/dbdx/index0.jsp">
											东北大学继续教育学院</option>
										<option value=http://www.nxedu.gov.cn/main/index.html>
											自治区教育厅</option>
										<option value=http://www.nxu.edu.cn>宁夏大学</option>
										<option value=http://www.nwsni.edu.cn>北方民族大学</option>
										<option value=http://www.nxmu.edu.cn>宁夏医科大学</option>
										<option value=http://www.nxtu.cn>宁夏师范学院</option>
										<option value=http://szsrsrc.szsnews.com>石嘴山人才网</option>
										<option value=http://www.szsnews.com>石嘴山新闻网</option>
										<option value=http://www.nxnews.net>宁夏新闻网</option>
										<option value=http://www.0951job.com>宁夏英才网</option>
										<option value=http://www.people.com.cn>人民网</option>
										<option value=http://www.xinhuanet.com>新华网</option>
								</select></li>
								<li><select class="shortselect"
									onChange="if(value!=''){window.open(this.options[this.selectedIndex].value);}else{return(false);}">
										<option value="">-----教育链接------</option>
										<option value=http://www.moe.edu.cn>教育部</option>
										<option value=http://www.edu.cn>教育科研网</option>
										<option value=http://www.eol.cn>教育在线</option>
										<option value=http://www.10ms.edu.cn>教育网高速资源</option>
										<option value=http://isc.chinainfo.gov.cn>中文学位论文</option>
										<option value=http://www.sinoss.net>人文社科信息中心</option>
										<option value=http://www.cern.net.cn>中国教育资源网</option>
										<option value=http://yz.chsi.com.cn>研究生招生信息</option>
										<option value=http://www.chsi.com.cn>高等教育学生信息</option>
								</select></li>
								<li><select class="shortselect"
									onChange="if(value!=''){window.open(this.options[this.selectedIndex].value);}else{return(false);}">
										<option value="">-----快捷查询------</option>
										<option value=http://weather.news.sina.com.cn>天气预报</option>
										<option value=http://www.12306.cn/mormhweb>网上购票</option>
										<option value=http://www.ip138.com/post>号码查询</option>
										<option value=http://www.chsi.com.cn/xlcx>学历查询</option>
										<option value=http://app.baidu.com/ip138_id/index.asp>
											身份核查</option>
										<option value=http://bus.mapbar.com/shizuishan>公交查询</option>
										<option value=http://www.hao123.com/haoserver/tefudh.htm>
											常用电话</option>
										<option value=http://www.hao123.com/ss/fy.htm>在线翻译</option>
										<option value=http://www.hao123.com/haoserver/kuaidi.htm>
											快递查询</option>
										<option value=http://xue.baidu.com>新手上网</option>
										<option value=http://www.hao123.com/kszy.htm>考试查询</option>
										<option value=http://www.hao123.com/rili>万年历</option>
										<option value=http://cctv.cntv.cn>央视网</option>
								</select>
						</div>
						</li>
						</ul>
					</div> --%>
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
	<div class="cleaner"></div>

	<div class="jxjy_footer_wrapper">
	<p><a href="http://www.nxist.com" target="_blank">校园网主页</a>|<a href="http://192.168.0.9/jwweb" target="_blank">教务处</a>|<a href="http://szsrsrc.szsnews.com" target="_blank">石嘴山人才网</a>|<a href="http://www.szsnews.com" target="_blank">石嘴山新闻网</a>|<a href="http://www.xinhuanet.com" target="_blank">新华网</a>|<a href="http://www.moe.edu.cn" target="_blank">教育部</a>|<a href="http://www.cern.net.cn" target="_blank">中国教育资源网</a>|<a href="http://www.chsi.com.cn/xlcx" target="_blank">学历查询</a>|<a href="http://www.hao123.com/ss/fy.htm" target="_blank">在线翻译</a></p>
		<p>Copyright &copy;2015 宁夏理工学院继续教育学院版权所有</p>
	</div>

</body>
</html>