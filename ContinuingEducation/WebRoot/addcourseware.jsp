<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content") != null ? request
			.getParameter("content") : "";
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>课件上传</title>
		<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
<script>
function checkpost() 
{ 
   if(example.category.value==""){alert("请选择类别"); 
    example.category.focus(); 
    return false; 
    
   } 
   if(example.title.value.replace(/(^[\s\u3000]*)|([\s\u3000]*$)/g, "")==""){alert("请输入名称"); 
    example.title.focus(); 
    return false; 
    
    } 
    if(example.upload.value==""){alert("请选择课件"); 
    example.upload.focus(); 
    return false; 
    } 
     alert("您已成功添加课件！");
} 

	
</script>
		<%
			java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.util.Date currentTime = new java.util.Date();
			String time = simpleDateFormat.format(currentTime).toString();
		%>
	</head>

	<body>
		<div align="center">
			<s:form name="example" method="post" enctype="multipart/form-data"
				action="coursewareAction!saveCourseware">
				<h4>
					课件上传
				</h4>
				<input type="hidden" name="time" value="<%=time%>"></input>
				<table>
					<tr>
						<td>
							类别
						</td>
						<td>
							<select name="category">
								<option></option>
								<option value="0">
									继续教育
								</option>
								<option value="1">
									函授教育
								</option>
								<option value="2">
									安全生产培训
								</option>
								<option value="3">
									职业技能培训
								</option>
							</select>
						</td>
						<td>
							名称
						</td>
						<td>
							<input type="text" name="title" />
						</td>
						<td>
							作者
						</td>
						<td>
							<input type="text" name="author" value="<s:property value='#session.userInfo.realName'/>" disabled="disabled" />
						</td>
						<td>
							选择课件
						</td>
						<td>
							<input type="file" name="upload"/><br />
						</td>

					</tr>

				</table>
				
					
				<br />
				<s:submit value="提交内容" onclick="return checkpost()"/>
				
			</s:form>
		</div>
	</body>
</html>
<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}%>
