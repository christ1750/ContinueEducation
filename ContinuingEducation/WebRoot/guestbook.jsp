<%@ page language="java"
	import="java.util.*,edu.neu.nxist.continuingedu.register.model.*,edu.neu.nxist.continuingedu.guestbook.model.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Integer index = 0;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'bwrite.jsp' starting page</title>
	<!-- css style -->
		<link rel="stylesheet" type="text/css" href="css/frame/basic.css" />
		<!-- 基本标签样式 -->
		<link rel="stylesheet" type="text/css" href="css/frame/page_body.css" />
		<!-- 二级页面样式按钮 -->
		<link rel="stylesheet" type="text/css" href="css/frame/form.css" />
		<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
		<!-- 表单样式 -->
		<!-- JS 库 -->
				<!-- JS 库 -->
		<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
<SCRIPT type="text/javascript">
function respond(index)
{
    var cuser=document.getElementById("comment"+index);
    var ctext=document.getElementById("comment");
    ctext.value="回复"+cuser.value+"  :";

}
 function del(){
    if(confirm("确认删除该记录吗？")){
     return true;
    }
    return false;
   }
 function affirm(){
 	if( $.trim($("#comment").val())=='')
 	{
 		alert('请填写评论！！');
 		return false;
 	}
   	else
   	  alert("您的留言将在通过审核后显示");
   }
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
</SCRIPT>

</head>
<body id="news_list.jsp">
	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true" />
	<!-- 主体 -->
	<div class="jxjy_page_body_wrapper">
		<div class="jxjy_page_body">
			<!-- 主体内容，75%宽度，靠右 -->
			<div class="jxjy_pages_content"style="margin: 0 150 0 ">
				<!-- 内容区，左右增加边距 -->
				<div class="jxjy_pages_text">
					<!-- 文章列表页 -->
					<h2 class="pages_title float_l">留言板</h2>
					<!-- 标题 -->
					<div class="jxjy_path float_r">
						<!-- 位置导航条 -->
						<ul>
							<li>当前位置：</li>
							<li>首页</a>
							<li>&gt;</li>
							<li class="cr">留言板</li>
						</ul>
					</div>
					<div class="cleaner"></div>
					<div class="divider"></div>
					<table class="admin" cellspacing="5">
						<thead>
							<tr>
								<td width="80"></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						
							<s:iterator value="#request.guestbooks.list" var="x">
								<tr onmouseover="$(this).addClassName('mouse_over');"
									onmouseout="$(this).removeClassName('mouse_over');"
									id="g_61205">
									<td><a name="61205"></a>
										<div class="logo">
											<a target='_blank'><img alt="" class="logo"
												src="<%=path%>/images/face.jpg" title="" width="48px"
												height="48px" /> </a>
										</div></td>
									<td>
										<div>
											<s:property value="#x.CComment" />
										</div> <br /> <span> <a target='_blank' title='kaixinyufeng'><s:property
													value="#x.uwUsername" />
										</a> <s:property value="#x.CTime" />
									</span><span><a onclick="respond(<%=index%>)">回复</a> <input
											type="hidden" id="comment<%=index++%>"
											value="<s:property value="respre"/>">
									</td>
								</tr>
							</s:iterator>

							</tbody>
					</table>
					<div class="jxjy_paging">
						<!-- 文章列表分页 -->
						<form action="guestbookAction!listForPage" method="post">
							<!-- 项目列表分页 -->
							<ul>
								<li class="cr paging_tall">第 <span
									style="color:#e54040;font-weight:bold;"><s:property
											value="pageBean.currentPage" /> </span>页/总 <span><s:property
											value="pageBean.totalPage" /> </span>页 总 <span
									style="color:#e54040;font-weight:bold;"><s:property
											value="pageBean.allRow" />
								</span> 条&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li class="c1"><a href="guestbookAction!listForPage?page=1"
									target="_self"><span id="first">首页</span> </a>&nbsp;</li>
								<li class="c2"><s:if test="%{pageBean.currentPage != 1}">
										<a
											href="guestbookAction!listForPage?page=<s:property value="%{pageBean.currentPage-1}"/>"
											target="_self"><span>上一页</span> </a>&nbsp;
									</s:if> <s:else>
										<a
											href="guestbookAction!listForPage?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>上一页</span> </a>
									</s:else></li>
								<li class="c3"><s:if
										test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											href="guestbookAction!listForPage?page=<s:property value="%{pageBean.currentPage+1}"/>"
											target="_self"><span>下一页</span> </a>&nbsp;
									</s:if> <s:else>
										<a
											href="guestbookAction!listForPage?page=<s:property value="pageBean.currentPage"/>"
											target="_self"><span>下一页</span> </a>
									</s:else></li>
								<li class="c4"><a
									href="guestbookAction!listForPage?page=<s:property value="pageBean.totalPage"/>"
									target="_self"><span>末页</span> </a>&nbsp;</li>
								<li class="c2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>跳转到：</span>
									<s:textfield name="page" size="5" maxLength="10" id="jump"
										onkeyup="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
										cssStyle="width:50px;height:20px;" /> <span>页</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<s:submit value="跳转"
										cssStyle="width:55px;height:24px;cursor:pointer;" /></li>
							</ul>
						</form>
					</div>
					<br>
					<div class="cleaner"></div>
					<div><h3>添加评论</h3></div>
					<form action="<%=path%>/guestbookAction!addGuestbook"
						class="new_guest_book" id="guest_book_form" method="post">
						<div style="margin:0;padding:0;display:inline">
							<input name="xx" type="hidden"
								value="gv6zHskIk65MVn4AIqmx6juGytMNskTnUYBHvH0cJkA=" />
						</div>
						<div>
							<textarea class="required max-length-150" cols="80" id="comment"
								name="CComment" rows="7" style="resize: none;"
								></textarea>
						</div>
						<INPUT type="submit" value="提交" onclick="affirm()" style="width:55px;height:24px;cursor:pointer;margin-top: 3px;"/>

					</form>
				</div>
				<div class="cleaner"></div>
			</div>
			
			<!-- end of jxjy_page_sidebar -->
			<div class="cleaner"></div>
		</div>
		
			<div class="jxjy_page_sidebar float_l">


			</div>
		<!-- end of jxjy_page_body -->
	</div>
	<div class="cleaner"></div>

	<div class="jxjy_footer_wrapper">
		<p>Copyright &copy;2015 宁夏理工学院继续教育学院版权所有</p>
	</div>
	<!-- end of jxjy_page_body_wrapper -->
	<!-- 尾部 -->
	<%-- <jsp:include page="footer.jsp" flush="true" /> --%>
</body>
</html>
