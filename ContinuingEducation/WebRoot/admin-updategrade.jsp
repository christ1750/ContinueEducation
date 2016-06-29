<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content") != null ? request
			.getParameter("content") : "";
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>成绩修改</title>
		<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
<script>
	function checkpost() 
{ 
   
   if(example.title.value.replace(/(^[\s\u3000]*)|([\s\u3000]*$)/g, "")==""){alert("请输入名称"); 
    example.title.focus(); 
    return false; 
    
    } 
    alert("您已成功修改成绩！");
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
			<s:form name="example" method="post" action="courseteacherAction!updateGrade">
				<h4>
					成绩修改
				</h4>
		        <input type="hidden" name="id" value="${ProjectRegister.applyId}"></input>
				<input type="hidden" name="issue" value='1'></input>
				<table>
					<tr>
						<td>
							用户名：
						</td>
						<td>
							${ProjectRegister.userInfo.userName}
						</td>
						<td>
							真实姓名：
						</td>
						<td>
							${ProjectRegister.userInfo.realName}
						</td>
						<td>
							邮件地址：
						</td>
						<td>
							${ProjectRegister.userInfo.email}
						</td>
						<td>
							联系电话：
						</td>
						<td>
							${ProjectRegister.userInfo.mobile}
						</td>
                         <td>
							成绩：
						</td>
						<td>
							<input type="text" name="grade" value="${ProjectRegister.grade}"/>
						</td>
					
					<td>
						
						</td>
                   </tr>
				</table>
				
				<br />
				
				<s:submit value="确认修改" />
				        
			</s:form>
		</div>
	</body>
</html>
