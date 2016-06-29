<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String bh = request.getParameter("bh");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>修改用户</title>
		<script src="http://lib.sinaapp.com/js/jquery/1.8.3/jquery.min.js"></script>
		<script
			src="http://lib.sinaapp.com/js/jquery-ui/1.8.9/jquery-ui.min.js"></script>
		<!-- css style -->
		<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
		<!-- 顶部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/foot.css" />
		<!-- 底部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
		<!-- 按钮样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<!-- 表单样式 -->
		<link
			href="http://lib.sinaapp.com/js/jquery-ui/1.8.9/themes/cupertino/jquery-ui.css"
			rel="stylesheet" type="text/css" />
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<script src="js/signup/jquery.tooltip.min.js" type="text/javascript"></script>
		<script src="js/signup/json2.js" type="text/javascript"></script>
		<script src="js/signup/jquery.ui.datepicker-zh-CN.js"
			type="text/javascript"></script>
		<script src="js/signup/AddUser.js" type="text/javascript"></script>
		<script language="JavaScript" type="text/javascript">
        $(function() {
            $('#role').change(function() {
                if (this.value == "4") {
                    $('#txtBirth').show();
                } else {
                    $('#txtBirth').hide();
                }
            });
        });
    </script>
    <script>
            function initradio(rName,rValue){
                var rObj = document.getElementsByName(rName);

                for(var i = 0;i < rObj.length;i++){
                    if(rObj[i].value == rValue){
                        rObj[i].checked =  'checked';
                    }
                }
            }
        </script>
 	<script>
            initradio('sex',${currentObject.sex});
        </script>	
 
		
		<style type="text/css">
#textareaBZ {
	width: 514px;
}
</style>
	</head>
	<body>
		
		
			<div class="jxjy_page_body">
				<!-- 主体内容，75%宽度，靠右 -->
				<div class="jxjy_pages_content float_r">
					<table width="95%" border="0" align="center" cellpadding="0"
										cellspacing="0" class="font_12b">
										<tr>
											<td>
												<div class="box_2">
													用户信息表
												</div>
											</td>
										</tr>
								</table>
					<!-- 内容区，左右增加边距 -->
					<div class="jxjy_pages_text">

						<s:form name="example" method="post" enctype="multipart/form-data" action="userManageAction">
						<input type="hidden" name="hide" value="${currentObject.hide}" />
							<input type="hidden" name="userId" id="bh" value="${bh}" />
							<div class="box_right">
								
								<div id="Test">
									<!-----------------------------------------个人信息--------------------------------------------------------->
									<div class="">
										<br />
									</div>
									<div class="left">
										<label for="textfieldzhm" class="label">
											帐户名
											<span class="RedStar">*</span>
										</label>
										<input name="userName" type="text" class="text"
											id="textfieldzhxm" maxlength="10" value="${currentObject.userName}" />
									</div>
									<div class="right">
										<label for="textfieldzsxm" class="label">
											真实姓名
											<span class="RedStar">*</span>
										</label>
										<input name="realName" type="text" class="text"
											id="textfieldzsxm" maxlength="10" value="${currentObject.realName}" />
									</div>

									<div class="left">
										<label for="txtPwd" class="label">
											登录密码
											<span class="RedStar">*</span>
										</label>
										<input name="userPassword" type="password" class="text"
											id="txtPwd" size="21" maxlength="20" value="${currentObject.userPassword}"/>
									</div>


									<div class="right">
										<label class="label" for="UserPwd">
											修改性别
											<span class="RedStar">*</span>
										</label>
										<div>
										
											男
											<input type="radio" name="sex" id="radio1" value="男"/>
											女
											<input type="radio" name="sex" id="radio2" value="女" />
											
											
											
										</div>
										当前性别：
										${currentObject.sex}
										
									</div>
									<div style="clear: both"></div>
									
									
									<div class="left">
										<label class="label" for="txtZjhm">
											身份证号
											<span class="RedStar">*</span>
										</label>
										<input name="certificateID" type="text" class="text"
											id="txtZjhm" maxlength="18" value="${currentObject.certificateID}" />
									</div>

									
									
									
									<div class="right">
										<label for="ddlMz" class="label">
											类别
											
										</label>
										<select name="role" size="1"
											class="dropdownlist" id="role" >
											<option value="${currentObject.role}" selected="selected">
									
								</option>
									
								<option value="2">
									管理员
								</option>
								<option value="3">
									教师
								</option>
								<option value="4">
									临时教师
								</option>
										</select>
										<br/>
							  当前类别：<c:if test="${currentObject.role=='2'}">管理员</c:if>  
									<c:if test="${currentObject.role=='3'}">教师</c:if>
									<c:if test="${currentObject.role=='4'}">临时教师</c:if>
									</div>
									<div class="left">
										<label class="label" >
											设置过期时间
											
										</label>
										<input name="deadline" type="text" id="txtBirth" style="display:none;" placeholder="例如20160101" value="${currentObject.deadline}" />
										<br/>
					                  当前过期时间 <c:if test="${currentObject.role=='4'}">"${currentObject.deadline}"</c:if>								
					                  </div>


									
									<!-----------------------------------------联系方式--------------------------------------------------------->
									<div class="left">
										<br />
									</div>
									
									<div class="left">
										<label class="label" for="UserPwd">
											Email
											<span class="RedStar">*</span>
										</label>
										<input name="Email" type="text" class="text" id="email"
											size="35" maxlength="35" value="${currentObject.email}" />
									</div>
									<div class="right">
										<label class="label" for="txtmobile">
											手机
											<span class="RedStar">*</span>
										</label>
										<input name="mobile" type="text" class="text" id="txtmobile"
											maxlength="11" value="${currentObject.mobile}" />
									</div>
									

									<!-----------------------------------------备注--------------------------------------------------------->
									<div class="left">
										<br />备注：
									</div>

									<div class="left">

										<textarea name="remarks" rows="5" id="tex" cols="80"
											style="margin-left: 20px; margin-bottom: 20px" >${currentObject.remarks}</textarea>
									</div>
									<div class="box_3"
										style="clear: both; margin-left: 60px; margin-bottom: 10px;">

									

										<s:submit method="updateUserInfo" type="image"
											src="images/signup_item/queren.gif" id="btnSubmitRegInfo" />

										
									</div>
								</div>
							</div>
						</s:form>
					</div>
				</div>
				<div class="clean:both"></div>
				<!-- 侧边栏目，25%宽度，靠左 --><!-- end of jxjy_page_sidebar -->
				<div class="cleaner"></div>
			
			<!-- end of jxjy_page_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<!-- 尾部 -->
		

		<div id="Mask">
		</div>
		<div id="SearchSchoolDiv" class="hidden">
			<div id="PopTitle"
				style="width: 160px; margin: auto; font-weight: bold; font-size: 16px; float: left; margin-top: 10px; margin-left: 240px">
				毕业学校查询
			</div>
			<div id="closeButton" style="cursor: pointer">
				关闭
			</div>
			<br style="clear: both" />
			<ul>
				<li>
					请输入学校当前名称或历史名称来查询。
				</li>
				<li>
					如未能查询到学校名称，请选择学校名称为“无”的项。
				</li>
				<li>
					支持模糊查询。
				</li>
			</ul>
			学校名称&nbsp;&nbsp;
			<input type="text" id="school" />
			&nbsp;&nbsp;
			<input type="button" value="查询" id="SearchSchool" />
			<div style="height: 280px; overflow: auto;">
				<table cellpadding="0">
					<caption>
					</caption>
				</table>
			</div>
			<input type="button" id="btnConfirm" value="确定" />
		</div>
	</body>
</html>
