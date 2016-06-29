<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>成人教育</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/frame/left_nav.css" type="text/css" />
<style>

.navContent li a {
	background: url(images/1.png) no-repeat 10% 50%;
}
</style>
</head>
<body>
	<ul class="navContent">
		<li><a href="#" target="_self">规章制度</a></li>
		<li><a href="#" target="_self">招生信息</a></li>
		<li><a href="#" target="_self">专业介绍</a></li>
		<li><a href="#" target="_self">报到须知</a></li>
	</ul>
	<div class="cleaner"></div>
</html>
