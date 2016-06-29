<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- css style -->
<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
<!-- 基本标签样式 -->
<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
<!-- 二级页面样式按钮 -->
<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
<!-- 表单样式 -->
<!-- JS 库 -->
<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery/jquery.easing.1.3.js"></script>
<script type="text/javascript" language="javascript" src="js/numberOnly.js"></script>
</head>
<body id="news_list.jsp">
	<!-- 头部 -->
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
						${pageBean.list[0].category.categoryName}</h2>
					<!-- 标题 -->
					<div class="jxjy_path float_r">
						<!-- 位置导航条 -->
						<ul>
							<li>当前位置：</li>
							<li>首页</li>
							<li>&gt;</li>
							<li><c:if
									test="${pageBean.list[0].category.categoryName != '开课通知'}">
									新闻中心
								</c:if> <c:if
									test="${pageBean.list[0].category.categoryName == '开课通知'}">
									培训专栏
								</c:if></li>
							<li>&gt;</li>
							<li class="cr">${pageBean.list[0].category.categoryName}</li>
						</ul>
					</div>
					<div class="cleaner"></div>
					<div class="divider"></div>
					<!-- 分割线 -->
					<div class="jxjy_article_catalogue">
						<!-- 文章列表目录 -->
						<ul id="list1">
							<c:forEach items="${pageBean.list}" var="news">
								<li><i class="icon-arrow2">●</i> <a
									href="newsAndNoticeAction!showOneNewsAndNotice?searchNewsAndNoticeID=${news.id}"
									title="${news.title}" target="_self"><span
										style="color: #0387BF"> [ ${fn:substring(news.time, 0,
											10)} ]</span>&nbsp;&nbsp; ${news.title} </a></li>
								<!--${fn:substring(news.time, 0, 10)}实现字符串的截取-->
							</c:forEach>
						</ul>
						<div class="cleaner"></div>
					</div>
					<div class="jxjy_paging">
						<!-- 文章列表分页 -->
						<form action="newsAndNoticeAction!queryForPage" method="post">
							<!-- 项目列表分页 -->
							<ul>
								<li class="cr paging_tall">第 <span
									style="color: #e54040; font-weight: bold;"><s:property
											value="pageBean.currentPage" /> </span>页/总 <span><s:property
											value="pageBean.totalPage" /> </span>页 总 <span
									style="color: #e54040; font-weight: bold;"><s:property
											value="pageBean.allRow" /> </span> 条&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li class="c1"><a
									href="newsAndNoticeAction!queryForPage?page=1" target="_self"><span
										id="first">首页</span> </a>&nbsp;</li>
								<li class="c2"><s:if test="%{pageBean.currentPage != 1}">
										<a
											href="newsAndNoticeAction!queryForPage?page=<s:property value="%{pageBean.currentPage-1}"/>"
											target="_self"><span>上一页</span> </a>&nbsp;
									</s:if> <s:else>
										<a
											href="newsAndNoticeAction!queryForPage?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>上一页</span> </a>
									</s:else></li>
								<li class="c3"><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="newsAndNoticeAction!queryForPage?page=<s:property value="%{pageBean.currentPage+1}"/>"
											target="_self"><span>下一页</span> </a>&nbsp;
									</s:if> <s:else>
										<a
											href="newsAndNoticeAction!queryForPage?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>下一页</span> </a>
									</s:else></li>
								<li class="c4"><a
									href="newsAndNoticeAction!queryForPage?page=<s:property value="pageBean.totalPage"/>"
									target="_self"><span>末页</span> </a>&nbsp;</li>
								<li class="c2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>跳转到：</span>
									<s:textfield name="page" size="5" maxLength="10" id="jump"
										 onkeypress="return inputNum(event);"
										cssStyle="width:50px;height:20px;" /> <span>页</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<s:submit value="跳转"
										cssStyle="width:55px;height:24px;cursor:pointer;" /></li>
							</ul>
						</form>
					</div>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- 侧边栏目，25%宽度，靠左 -->
			<c:if test="${pageBean.list[0].category.categoryName != '开课通知'}">
				<%@include file="frontend-news_leftnav.jsp"%>
			</c:if>
			<c:if test="${pageBean.list[0].category.categoryName == '开课通知'}">
				<%@include file="frontend-pj_leftnav.jsp"%>
			</c:if>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
