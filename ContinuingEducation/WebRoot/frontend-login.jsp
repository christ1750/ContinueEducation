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
		<!-- JS 库 -->
		<script type="text/javascript" language="javascript"
			src="js/jquery/jquery.js"></script>
		<script type="text/javascript">
	function login() {//登录
		$.ajax( {
			type : "post",
			async : false,
			url : "loginAction!login",
			data : {
				userRole : $("input[name='userRole']:checked").val(),
				userName : $.trim($("#userName").val()),
				userPassword : $.trim($("#userPassword").val())
			},
			dataType : "json",
			success : function(data) {
				var result = data;
				if (result == "0") {
					window.location.href = "admin-mainmanager.jsp";
				} else if (result == "1") {

					window.location.href = "index.jsp";
				} else if (result == "2") {
					alert("用户不存在!");
					$("#userName").focus();
				} else if (result == "3") {
					alert("密码不正确!");
					$("#userPassword").focus();
				} else if (result == "4")
					alert("您选择的权限与账户权限不符，请重新选择");
			},
			error : function() {
				alert("登陆失败，账号或密码错误！");
				$("#userName").val("");
				$("#userPassword").val("");
			}
		});
	}
	//表单验证成功后登陆
	function validate() {

		var name = $.trim($("#userName").val());
		var password = $.trim($("#userPassword").val());
		document.getElementById("spanUserName").innerHTML = "";
		document.getElementById("spanUserPassword").innerHTML = "";
		if (name == "") {
			document.getElementById("spanUserName").innerHTML = "账号不能为空";
			document.getElementById("userName").focus();
			return false;
		}
		if (password == "") {
			document.getElementById("spanUserPassword").innerHTML = "密码不能为空";
			document.getElementById("userPassword").focus();
			return false;
		}
		login();
		return false;
	}

	//页面回车事件
	document.onkeydown = function(event) {
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if (e && e.keyCode == 27) {
			// 按 Esc                 //要做的事情              
		}
		if (e && e.keyCode == 113) {
			// 按 F2                  //要做的事情               
		}
		if (e && e.keyCode == 13) {
			// enter 键                 //要做的事情      
			validate();
		}
	};
</script>
	</head>
	<body>
		<!-- 头部 -->
		<jsp:include page="header.jsp" flush="true" />
		<!-- 主体 -->
		<div class="login_pages_content">
			<div class="jxjy_page_body">
				<!-- 主体内容>
				<div class="jxjy_pages_content float_r">
					<!-- 内容区，左右增加边距 -->
				<div class="jxjy_pages_text">
					<h2 class="pages_title float_l">
						用户登录
					</h2>
					<!-- 文章列表页 -->
					<h2 class="pages_title float_l"></h2>
					<!-- 标题 -->
					<div class="jxjy_path float_r">
						<!-- 位置导航条 -->
						<ul>
							<li>
								当前位置：
							</li>
							<li>
								首页
							</li>
							<li>
								&gt;
							</li>

							<li>
								用户登录
							</li>
						</ul>
					</div>
					<div class="cleaner"></div>
					<div class="divider divider_30"></div>
					<!-- 分割线 -->
					<div class='jxjy_login_form_bar2'>
						<form id='login_form'>
							<fieldset>
								<div class="form_item">
									<label>
										<span>用户名</span>
										<!-- 网站登录用户名 -->
										<input name="userName" id="userName"
											class="validate[required,minSize[6],maxSize[20]] text-input"
											type="text" placeholder="例如：abel1015" />
										<span id="spanUserName" style="width: 80px; color: Red;"></span>
									</label>
								</div>
								<div class="form_item">
									<label>
										<span>密&nbsp;&nbsp;&nbsp;码</span>
										<!-- 网站登录密码 -->
										<input name="userPassword" id="userPassword"
											class="validate[required,minSize[6],maxSize[20]] text-input"
											type="password" placeholder="6-20位密码" />
										<span id="spanUserPassword" class="formErrorContent"
											style="width: 80px; color: Red;"></span>
									</label>
								</div>
								<div class="form_item">
									<label>
										<span>身&nbsp;&nbsp;&nbsp;份</span>
										<!-- 登录身份 -->
										<input name="userRole" type="radio"
											class="validate[required] radio" id="role1" value="1"
											checked="checked" />
										<i>学员</i>
										<input class="validate[required] radio" type="radio"
											name="userRole" id="role2" value="2" />
										<i>管理员</i>
									</label>
								</div>
							</fieldset>

							<!-- 登录和注册按钮 -->
							<table align="left">
								<tr>
									<td>
										<button id='send' class="log-submit"
											onclick="return validate()">
											登录
										</button>
									</td>
									<td class="registertext">
										没有账号？
										<a href="register.jsp">立即注册</a>
									</td>
								</tr>
							</table>

						</form>
						<div class="cleaner"></div>
					</div>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- end of jxjy_page_sidebar -->
			<div class="cleaner"></div>
		</div>
		<!-- end of jxjy_page_body -->
		<jsp:include page="footer.jsp" flush="true" />
	</body>
</html>