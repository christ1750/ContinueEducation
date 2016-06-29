<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<!-- css style -->
		<!-- css style -->
		<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<!-- 基本标签样式 -->
		<script src="http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js"></script>
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css" media="screen">
a {
	padding: 5px 25px;
	background: #fbd568; /* Fallback */
	background: -moz-linear-gradient(#fbd568, #ffb347);
	background: -ms-linear-gradient(#fbd568, #ffb347);
	background: -o-linear-gradient(#fbd568, #ffb347);
	background: -webkit-gradient(linear, 0 0, 0 100%, from(#fbd568),
		to(#ffb347) );
	background: -webkit-linear-gradient(#fbd568, #ffb347);
	background: linear-gradient(#fbd568, #ffb347);
	border: 1px solid #f4ab4c;
	color: #996319;
	text-shadow: 0 1px rgba(255, 255, 255, 0.3);
}

.center {
	position: absolute;
	width: 120px;
	height: 120px;
	left: 45%;
	top: 40%;
	margin: -60px 0px 0px -60px;
	border: 1px solid #F00;
}
</style>
	</head>
	<body>
		<div id="MessageBox" class="center">
			<table style="width: 100%" align="center">
				<tr>
					<td style="text-align: center; font-weight: bold; height: 40px">
						报名结果
					</td>
				</tr>
				<tr>
					<td style="text-indent: 2em; height: 80px">
						<div id="lblSubmitMsg" align="center">
							<br />
							恭喜！您的报名信息已经提交
							<br />
							<br />
							请等待审核，注意查询录取结果
						</div>
					</td>
				</tr>
				<tr>
					<td style="text-align: center; height: 100px">
						<a
							href="projectRegisterAction!findByUserId?userId=${session.userInfo.userId}">确定</a>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
