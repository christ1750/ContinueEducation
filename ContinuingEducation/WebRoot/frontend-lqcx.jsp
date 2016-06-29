<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="js/jquery/jquery-1.8.3-min.js"></script>
		<script src="js/jquery/jquery-1.8.9-ui.min.js"></script>
		<!-- css style -->
		<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
		<!-- 顶部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
		<!-- 按钮样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />

		<!-- 表单样式 -->
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<link href="js/jquery/jquery-ui.css" rel="stylesheet" type="text/css" />
		<link href="css/signup/Registration.css" rel="stylesheet"
			type="text/css" />
		<script src="js/signup/jquery.ui.datepicker-zh-CN.js"
			type="text/javascript"></script>
		<script type="text/javascript" language="javascript"
			src="js/pj_list/sticky-head.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/numberOnly.js"></script>
			
		<script>
			$(document).ready(function (){
				$("#beginTime").datepicker( {
					changeYear : true,
					changeMonth : true,
					yearRange : 'c-40:c'
				});
		
				$("#endTime").datepicker( {
					changeYear : true,
					changeMonth : true,
					yearRange : 'c-40:c'
				});
			});
		</script>
	</head>
	<body> 
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
							项目列表
						</h2>
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
									高端培训
								</li>
								<li>
									&gt;
								</li>
								<li class="cr">
									全部项目
								</li>
							</ul>
						</div>
						<div class="cleaner"></div>
						<div class="divider"></div>
						<!-- 分割线 -->
						<!-- 项目基本搜索页 -->
						<div class="cleaner"></div>

						<div class="jxjy_project_search_bar">
							<!-- 项目搜索栏 -->
							<form action="projectRegisterAction!findByUserId?page=1"
								method="post">
								<input type="hidden" name="userId"
									value="${session.userInfo.userId}" />
								<fieldset>
									<div class="form_item">
										<span>名称/编号</span>
										<s:textfield name="nameOrder" placeholder="请输入项目名称或审批编号"
											type="text" />
										<span>审核状态</span>
									</div>
									<label>
										<input class="radio" type="radio" name="status" value="-1" checked="checked"/>
										<i>全部</i>
										<input class="radio" type="radio" name="status" value="0" />
										<i>待审</i>
										<input class="radio" type="radio" name="status" value="1" />
										<i>通过</i>
										<input class="radio" type="radio" name="status" value="2" />
										<i>拒绝</i>
									</label>
									<div class="form_item">
										<span>时间区间</span>
										<s:textfield name="beginTime" id="beginTime"
											placeholder="请输入开始时间" type="text" cssStyle="width: 140px" />
										<span style="width: 20px">--</span>
										<s:textfield name="endTime" id="endTime" placeholder="请输入结束时间"
											type="text" cssStyle="width: 140px" />
										<button type="submit">
											查询
										</button>
										<button type="reset" class="reset">
											重置
										</button>
									</div>
								</fieldset>
							</form>
						</div>
						<table>
							<tr>
								<td>
									<font size="3px" style="color: #B28850; font-weight: bold">报名结果详情</font>
								</td>
								<td>
									<font size="2px" style="font-weight: bold">姓名：${session.userInfo.realName}</font>
								</td>
								<td>
									<font size="2px" style="font-weight: bold">报名项目共：${fn:length(pageBean.list)}&nbsp;项</font>
								</td>
								<%
									int i = 0;
									int j = 0;
									int k = 0;
								%>
								<c:forEach items="${pageBean.list}" var="x">
									<c:if test="${x.checkStatus.checkId == 0}">
										<%
											i++;
										%>
									</c:if>
									<c:if test="${x.checkStatus.checkId == 1}">
										<%
											j++;
										%>
									</c:if>
									<c:if test="${x.checkStatus.checkId == 2}">
										<%
											k++;
										%>
									</c:if>
								</c:forEach>
								<td>
									<font size="2px" style="font-weight: bold">待审： <span
										style="color: #ffbb4b;"><%=i%></span>&nbsp;项</font>
								</td>
								<td>
									<font size="2px" style="font-weight: bold">通过： <span
										style="color: green;"><%=j%></span>&nbsp;项</font>
								</td>
								<td>
									<font size="2px" style="font-weight: bold"> 拒绝： <span
										style="color: red;"><%=k%></span>&nbsp;项</font>
								</td>
							</tr>
						</table>
						<div class="form_item">
							<div class="jxjy_table">
								<table style="margin: auto auto auto 10px;">
									<thead>
										<tr>
											<th style="width:40px">
												序号
											</th>
											<th style="width:150px">
												审批编号
											</th>
											<th style="width:200px">
												项目名称
											</th>
											<th style="width:30px">
												审核<br/>状态
											</th>
											<th >
												预约码
											</th>
											<th >
												报名时间
											</th>
										</tr>
									</thead>
									<c:forEach items="${pageBean.list}" var="x" varStatus="status">
										<tr>
											<td>
												${status.count}
											</td>
											<td>
												${x.project.projectOrder}
											</td>
											<td>
												${x.project.projectName}
											</td>
											<td>
												${x.checkStatus.checkName}
											</td>
											<c:if test="${x.checkStatus.checkId == 0}">
												<td>
													请耐心等待...
												</td>
											</c:if>
											<c:if test="${x.checkStatus.checkId == 1}">
												<td>
													${x.reportNum}
												</td>
											</c:if>
											<c:if test="${x.checkStatus.checkId == 2}">
												<td>
													&nbsp;
												</td>
											</c:if>

											<td>
												${x.signupTime}
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>

						</div>
						<div class="jxjy_paging">
							<!-- 文章列表分页 -->
							<form action="projectRegisterAction!findByUserId" method="post">
								<!-- 项目列表分页 -->
								<ul>
									<li class="cr paging_tall">
										第
										<span style="color: #e54040; font-weight: bold;"><s:property
												value="pageBean.currentPage" /> </span>页/总
										<span><s:property value="pageBean.totalPage" /> </span>页 总
										<span style="color: #e54040; font-weight: bold;"><s:property
												value="pageBean.allRow" /> </span> 条&nbsp;&nbsp;&nbsp;&nbsp;
									</li>
									<c:if test="${pageBean.allRow != 0 }">
										<li class="c1">
											<a href="projectRegisterAction!findByUserId?page=1"
												target="_self"><span id="first">首页</span> </a>&nbsp;
										</li>
										<li class="c2">
											<s:if test="%{pageBean.currentPage != 1}">
												<a
													href="projectRegisterAction!findByUserId?page=<s:property value="%{pageBean.currentPage-1}"/>"
													target="_self"><span>上一页</span> </a>&nbsp;
									</s:if>
											<s:else>
												<a
													href="projectRegisterAction!findByUserId?page=<s:property value="pageBean.currentPage"/>"
													target="_self"><span>上一页</span> </a>
											</s:else>
										</li>
										<li class="c3">
											<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
												<a
													href="projectRegisterAction!findByUserId?page=<s:property value="%{pageBean.currentPage+1}"/>"
													target="_self"><span>下一页</span> </a>&nbsp;
									</s:if>
											<s:else>
												<a
													href="projectRegisterAction!findByUserId?page=<s:property value="pageBean.currentPage"/>"
													target="_self"><span>下一页</span> </a>
											</s:else>
										</li>
										<li class="c4">
											<a
												href="projectRegisterAction!findByUserId?page=<s:property value="pageBean.totalPage"/>"
												target="_self"><span>末页</span> </a>&nbsp;
										</li>
										<li class="c2">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>跳转到：</span>
											<s:textfield name="page" size="5" maxLength="10" id="jump"
												onkeypress="return inputNum(event);"
												cssStyle="width:50px;height:20px;" />
											<span>页</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<s:submit value="跳转"
												cssStyle="width:55px;height:24px;cursor:pointer;" />
										</li>
									</c:if>
								</ul>
							</form>
						</div>
						<div class="cleaner"></div>
					</div>
				</div>
				<!-- 侧边栏目，25%宽度，靠左 -->
				<%@include file="frontend-pj_leftnav.jsp"%>
				<!-- end of jxjy_page_sidebar -->
			</div>
			<!-- end of jxjy_page_body -->
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<jsp:include page="footer.jsp" flush="true" />
	</body>
</html>