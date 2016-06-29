<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(document).ready(function() {
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
	
		function checkLogin2() {
			var userId = $("#userId").val();
			if (userId == "" || userId == null) {
				alert('您还没登陆，请先登录!');
				window.location.href = "index.jsp";
			}else
				window.location.href = "projectRegisterAction!findByUserId?userId=${session.userInfo.userId}&page=1&status=-1";
		};
</script>

<div class="jxjy_page_sidebar float_l">
	<input type="hidden" id="userId" value="${sessionScope.userInfo.userId}"/>
		<div class="lanrenzhijia">
		<h2 class="title">培训专栏</h2>
		<ul>
			<li class="on"><a
				href="newsAndNoticeAction!queryForPage?page=1&categoryId=3">开课通知</a>
			</li>
			<li><a
				href="myProjectAction!searchProjectForPage?page=1">项目列表</a>
			</li>
			<li>
				<a href="javascript:void(0)" onclick="javascript:checkLogin2();">报名情况</a>
			</li>
		</ul>
		<div class="hover"></div>
</div>
</div>


<div class="cleaner"></div>