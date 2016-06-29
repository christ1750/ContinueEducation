<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<!-- css style -->
		<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
		<!-- 基本标签样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/head.css" />
		<!-- 顶部样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
		<!-- 二级页面样式按钮 -->
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
		<!-- 表单样式 -->
		<!-- JS 库 -->
		<script type="text/javascript" language="javascript"
			src="js/jquery/jquery.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/pj_list/sticky-head.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/numberOnly.js"></script>
		<script type="text/javascript" language="javascript">
			$(document).ready(function() {
				// 获取项目类型
					$.post("loadPjCategory", function(data) {
						var $option = $("<option></option>");
						$option.attr("value", "-1");
						$option.text("");
						var jsonObj = data;
						for ( var i = 0; i < jsonObj.length; i++) {
							var $option = $("<option></option>");
							$option.attr("value", jsonObj[i].pjCategoryId);
							$option.text(jsonObj[i].pjCategoryName);
							$("#projectCategory").append($option);
						}
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
									培训专栏
								</li>
								<li>
									&gt;
								</li>
								<li class="cr">
									项目列表
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
							<div class="form_item">
								<s:form id="project_search" name="project_search" method="post"
									action="myProjectAction!searchProjectForPage?page=1">
									<fieldset>
										<span>项目搜索</span>
										<s:textfield name="searchProjectName" id="title"
											placeholder="请输入项目关键词" type="text" cssStyle="width:300px" />
										<select name="searchProjectCategory" id="projectCategory"
											style="width: 140px;">
											<option value="0">
												全部项目
											</option>
										</select>
										<button id="send" type="submit" style="width: 60px;">
											查询
										</button>
										<button id="reset" class="reset" style="width: 60px;" onclick="document.getElementById('title').value=''">
										 	重置
										</button>
									</fieldset>
								</s:form>
							</div>
						</div>
						<div class="jxjy_table">
							<div class="sticky-wrap">
								<table style="margin: 0px; width: 100%;" class="sticky-enabled">
									<thead>
										<tr>
											<th width="15%">
												培训类别
											</th>
											<th width="22%">
												审批编号
											</th>
											<th width="40%">
												课程名称
											</th>
											<th width="15%">
												办班单位
											</th>
											<th width="14%">
												开班时间
											</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${pageBean.list}" var="pj">
											<tr>
												<td>
													${pj.projectCategory.pjCategoryName}
												</td>
												<td>
													<a
														href="myProjectAction!showOneProject?searchProjectID=${pj.projectID}"
														target="_self"> ${pj.projectOrder}</a>
												</td>
												<td>
													<a
														href="myProjectAction!showOneProject?searchProjectID=${pj.projectID}"
														target="_self"> ${pj.projectName}</a>
												</td>
												<td>
													<a
														href="myProjectAction!showOneProject?searchProjectID=${pj.projectID}"
														target="_self"> ${pj.projectSponsor.pjSponsorName}</a>
												</td>
												<td>
													${pj.beginTime}
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<form class="jxjy_paging"
							action="myProjectAction!searchProjectForPage" method="post">

							<!-- 项目列表分页 -->
							<ul>
								<li class="cr paging_tall">
									第
									<span style="color: #e54040; font-weight: bold;"><s:property
											value="pageBean.currentPage" /> </span>页/总
									<span><s:property value="pageBean.totalPage" /> </span>页
									&nbsp;&nbsp;&nbsp;总
									<span style="color: #e54040; font-weight: bold;"><s:property
											value="pageBean.allRow" /> </span> 条&nbsp;&nbsp;&nbsp;&nbsp;
								</li>
								<c:if test="${pageBean.allRow != 0 }">
								<li class="c1">
									<a href="myProjectAction!searchProjectForPage?page=1"
										target="_self"><span>首页</span> </a>&nbsp;
								</li>
								<li class="c2">
									<s:if test="%{pageBean.currentPage != 1}">
										<a
											href="myProjectAction!searchProjectForPage?page=<s:property value="%{pageBean.currentPage-1}"/>"
											target="_self"><span>上一页</span> </a>&nbsp;
									</s:if>
									<s:else>
										<a
											href="myProjectAction!searchProjectForPage?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>上一页</span> </a>
									</s:else>
								</li>
								<li class="c3">
									<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="myProjectAction!searchProjectForPage?page=<s:property value="%{pageBean.currentPage+1}"/>"
											target="_self"><span>下一页</span> </a>&nbsp;
									</s:if>
									<s:else>
										<a
											href="myProjectAction!searchProjectForPage?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>下一页</span> </a>
									</s:else>
								</li>
								<li class="c4">
									<a
										href="myProjectAction!searchProjectForPage?page=<s:property value="pageBean.totalPage"/>"
										target="_self"><span>末页</span> </a>&nbsp;
								</li>
								<li class="c2">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>跳转到：</span>
									<s:textfield name="page" size="5" maxLength="10" id="jump"
										onkeyup="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
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
				<!-- 侧边栏目，25%宽度，靠左 -->
				<%@include file="frontend-pj_leftnav.jsp"%>
			</div>
		</div>
		<!-- end of jxjy_page_body_wrapper -->
		<jsp:include page="footer.jsp" flush="true" />
	</body>
</html>