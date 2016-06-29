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
<script type="text/javascript">
	$(function() {
		var Height = 40; //li的高度
		var pTop = 10; // .lanrenzhijia 的paddding-top的值
		$('.lanrenzhijia li').mouseover(function() {
			$(this).addClass('on').siblings().removeClass('on');
			var index = $(this).index();
			var distance = 40 + (index) * (Height) + pTop + 'px'; //如果你的li有个border-bottom为1px高度的话，这里需要加1
			$('.lanrenzhijia .hover').stop().animate({
				top : distance
			}, 150); //默认动画时间为150毫秒，懒人们可根据需要修改
		});

	});
	$(function() {
		$("a,input[type=submit],button").focus(function() {
			this.blur()
		});
	});
</script>
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

					<c:if test="${fn:length(pageBean.list) != 0 }">
						<!-- 文章列表页 -->
						<h2 class="pages_title float_l">
							${pageBean.list[0].fileCategory.categoryName}</h2>
						<!-- 标题 -->
						<div class="jxjy_path float_r">
							<!-- 位置导航条 -->
							<ul>
								<li>当前位置：</li>
								<li>首页</li>
								<li>&gt;</li>
								<li>资源下载</li>
								<li>&gt;</li>
								<li class="cr">
									${pageBean.list[0].fileCategory.categoryName}</li>
							</ul>
						</div>
						<div class="cleaner"></div>
						<div class="divider"></div>
						<!-- 分割线 -->
						<div class="jxjy_article_catalogue">
							<!-- 文章列表目录 -->
							<ul id="list1">
								<c:forEach items="${pageBean.list}" var="file">
									<li><i class="icon-arrow2">●</i> <a
										href="fileDownloadActionForMgr!download?id=${file.fileId}"
										title="${file.fileName}"><span style="color: #0387BF">
												[ ${fn:substring(file.time, 0, 10)} ]</span>&nbsp;&nbsp;${file.fileName}
											<span style="float: right">点击下载</span> </a></li>
									<!--${fn:substring(news.time, 0, 10)}实现字符串的截取-->
								</c:forEach>
							</ul>
							<div class="cleaner"></div>
						</div>
						<div class="jxjy_paging">
							<!-- 文章列表分页 -->
							<form action="fileUploadActionForMgr!queryFileForPage"
								method="post">
								<!-- 项目列表分页 -->
								<ul>
									<li class="cr paging_tall">第 <span
										style="color: #e54040; font-weight: bold;"><s:property
												value="pageBean.currentPage" /> </span>页/总 <span><s:property
												value="pageBean.totalPage" /> </span>页 总 <span
										style="color: #e54040; font-weight: bold;"><s:property
												value="pageBean.allRow" /> </span> 条&nbsp;&nbsp;&nbsp;&nbsp;</li>

									<li class="c1"><a
										href="fileUploadActionForMgr!queryFileForPage?page=1"
										target="_self"><span id="first">首页</span> </a>&nbsp;</li>
									<li class="c2"><s:if test="%{pageBean.currentPage != 1}">
											<a
												href="fileUploadActionForMgr!queryFileForPage?page=<s:property value="%{pageBean.currentPage-1}"/>"
												target="_self"><span>上一页</span> </a>&nbsp;
									</s:if> <s:else>
											<a
												href="fileUploadActionForMgr!queryFileForPage?page=<s:property value="pageBean.currentPage"/>"
												target="_self"><span>上一页</span> </a>
										</s:else></li>
									<li class="c3"><s:if
											test="%{pageBean.currentPage != pageBean.totalPage}">
											<a
												href="fileUploadActionForMgr!queryFileForPage?page=<s:property value="%{pageBean.currentPage+1}"/>"
												target="_self"><span>下一页</span> </a>&nbsp;
									</s:if> <s:else>
											<a
												href="fileUploadActionForMgr!queryFileForPage?page=<s:property value="pageBean.currentPage"/>"
												target="_self"><span>下一页</span> </a>
										</s:else></li>
									<li class="c4"><a
										href="fileUploadActionForMgr!queryFileForPage?page=<s:property value="pageBean.totalPage"/>"
										target="_self"><span>末页</span> </a>&nbsp;</li>
									<li class="c2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>跳转到：</span>
										<input name="page" size="5" id="jump"
										value="<s:property value="%{pageBean.currentPage}"/>"
										onkeyup="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
										style="width: 50px; height: 20px;" style="ime-mode:disabled;" />
										<span>页</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:submit
											value="跳转" cssStyle="width:55px;height:24px;cursor:pointer;" />
									</li>
								</ul>
							</form>
						</div>
					</c:if>
					<c:if test="${fn:length(pageBean.list) == 0 }">
						<h5 class="news_title" style="color: red;">暂无内容</h5>
					</c:if>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- 侧边栏目，25%宽度，靠左 -->
			<div class="jxjy_page_sidebar float_l">
				<div class="lanrenzhijia">
					<h2 class="title">资源下载</h2>
					<ul>
						<c:forEach items="${tabList}" var="x" varStatus="status">
							<c:if test="${status.count==1}">
								<li class="on"><a
									href="fileUploadActionForMgr!queryFileForPage?page=1&categoryId=${x.categoryId}">
										${x.categoryName}</a>
								</li>
							</c:if>
							<c:if test="${status.count!=1}">
								<li><a
									href="fileUploadActionForMgr!queryFileForPage?page=1&categoryId=${x.categoryId}">
										${x.categoryName}</a></li>
							</c:if>
						</c:forEach>
					</ul>
					<div class="hover"></div>
				</div>
			</div>
			<div class="cleaner"></div>
			<!-- end of jxjy_page_body -->
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
