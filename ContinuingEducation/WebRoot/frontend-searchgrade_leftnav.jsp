<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/frame/left_nav.css" />
<script type="text/javascript">
	$(function() {
		var Height = 40; //li的高度
		var pTop = 10; // .lanrenzhijia 的paddding-top的值
		$('.lanrenzhijia li').mouseover(function() {
			$(this).addClass('on').siblings().removeClass('on');
			var index = $(this).index();
			var distance = 40 + (index) * (Height ) + pTop + 'px'; //如果你的li有个border-bottom为1px高度的话，这里需要加1
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
<div class="jxjy_page_sidebar float_l">
	<div class="lanrenzhijia">
		<h2 class="title">
			个人中心
		</h2>
		<ul>
			<li class="on">
				<a href="frontend-register.jsp">个人信息注册</a>
			</li>
			<c:if test="${sessionScope.userInfo != null}">
				<li>
					<a href="frontend-personalinfo.jsp?bh=2c91dd814cc73ec0014cc7401ddf0003">查询个人信息</a>
				</li>

				<li>
					<a href="frontend-register.jsp?bh=${session.userInfo.userId}">修改个人信息</a>
				</li>
			</c:if>
		</ul>
		<div class="hover"></div>


		<!-- 投诉咨询电话 -->
		<div class="jxjy_nav_section_1">
			<div class="jxjy_nav_list_box">
				<table>
					<tr>
						<td>
							<strong style="color: red">温馨提示！</strong>
						</td>
					</tr>
					<tr>
						<td>
							1.标有“
							<span style="color: red">*</span>”的字段必填
						</td>
					</tr>
					<tr>
						<td>
							2.真实姓名必须与身份证上的姓名保存一致
						</td>
					</tr>
					<tr>
						<td>
							3.填写最高学历时，如果毕业学校名称为“无”，请在备注中填写毕业学校全称。
						</td>
					</tr>
					<tr>
						<td>
							4.请认真填写本人电话、邮箱等联系方式，以便学校及时与您取得联系。
						</td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</div>
<div class="cleaner"></div>

