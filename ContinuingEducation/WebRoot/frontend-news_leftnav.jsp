<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<!-- 侧边栏目，25%宽度，靠左 -->
<div class="jxjy_page_sidebar float_l">
	<!-- 侧边导航标题 -->
	<div class="lanrenzhijia">
		<h2 class="title">新闻中心</h2>
		<ul>
			<li class="on"><a
				href="newsAndNoticeAction!queryForPage?page=1&categoryId=1">新闻动态</a>
			</li>
			<li><a
				href="newsAndNoticeAction!queryForPage?page=1&categoryId=2">通知公告</a>
			</li>
		</ul>
		<div class="hover"></div>
	</div>
</div>
<div class="cleaner"></div>


