$(document).ready(function() {
	
	function login() {//登录
		$.ajax({
			type : "post",
			async : false,
			url : "loginAction!login",
			data : {
				userRole : $("input[name='userRole']:checked").val(),
				userName : $.trim($("#userName").val()),
				userPassword : $.trim($("#userPassword").val())
			},
			dataType : "json",
			success : function(data) {
				var result = data;
				if (result == "0") {
					window.location.href = "admin-mainmanager.jsp";
				} else if (result == "1") {

					window.location.href = "index.jsp";
				} else if (result == "5") {

					window.location.href = "admin-mainmanager.jsp";
				} else if (result == "6") {

					window.location.href = "admin-mainmanager.jsp";
				} else if (result == "7") {

					alert("您的账户已过期，有疑问请联系管理员！");
				} else if (result == "2") {
					alert("用户不存在!");
					$("#userName").focus();
				} else if (result == "3") {
					alert("密码不正确!");
					$("#userPassword").focus();
				} else if (result == "4")
					alert("您选择的权限与账户权限不符，请重新选择！");
			},
			error : function() {
				alert("登陆失败，账号或密码错误！");
				$("#userName").val("");
				$("#userPassword").val("");
			}
		});
	}

	//表单验证成功后登陆
	function validate(){
		var name =$.trim($("#userName").val());
		var password=$.trim($("#userPassword").val());
		if(name=="") {
			alert("账号不能为空");
			$("#userName").focus();
			return false;
		} 
		if(password=="") {
			alert("密码不能为空");
			$("#userPassword").focus();
			return false;
		} 
		login();
		return false;
	}
	
	//页面回车事件
	document.onkeydown=function(event){            
		var e = event || window.event || arguments.callee.caller.arguments[0];            
		  	if(e && e.keyCode==27){ 
			  // 按 Esc                 //要做的事情              
		  	}            
		  	if(e && e.keyCode==113){ 
			  // 按 F2                  //要做的事情               
		  	}                         
		  	if(e && e.keyCode==13){ 
			  // enter 键                 //要做的事情      
			validate();
		}        
	}; 
		
		$("#login").click(function(){	
			return validate();
		});
				
/*------------------------------------------------------------------------*/	
	
    // 获取项目类型
    $.post("loadPjCategory", function (data) {  
		var $option = $("<option></option>");  
        $option.attr("value", "-1");  
        $option.text("");  
        var jsonObj =data;  
        for (var i = 0; i < jsonObj.length; i++) {  
            var $option = $("<option></option>");  
            $option.attr("value", jsonObj[i].pjCategoryId);  
            $option.text(jsonObj[i].pjCategoryName);  
            $("#projectCategory").append($option); 
        }
        }); 

    $.ajax( {
			type: "POST",
			url: "newsAndNoticeAction!listForPage?page=1&categoryId=1",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function(news) {
			if (news.length > 0) {
					for(i=0;i< Math.min(news.length,10);i++){
						title=news[i].title;
						if(title.length>18)
							title=title.substring(0,18)+"...";
						var li="<li><span>"+ news[i].time.substring(0,10)
						+"</span><a href='newsAndNoticeAction!showOneNewsAndNotice?searchNewsAndNoticeID="+news[i].id
						+"' title='"+news[i].title+"' target='_self'>"+title
						+"</a>";
						if(i<3)
							li=li+"<img src='images/index/new.gif'/>";
						li=li+"</li>";
						$("#list1").append(li);				
					}
				} else {
					var li="<li>暂无数据<li>"
						$("#list1").append(li);
				}			
			},
			error : function Error() {
				alert("系统异常，请稍后重试");
			}
		});
		$.ajax( {
			type: "POST",
			url: "newsAndNoticeAction!listForPage?page=1&categoryId=2",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function(news) {
			if (news.length > 0) {
					for(i=0;i< Math.min(news.length,10);i++){
						title=news[i].title;
						if(title.length>18)
							title=title.substring(0,18)+"...";
						var li="<li><span>"+ news[i].time.substring(0,10)
						+"</span><a href="+"newsAndNoticeAction!showOneNewsAndNotice?searchNewsAndNoticeID="+news[i].id
						+" title="+news[i].title+" target=_self>"+title
						+"</a>";
						if(i<3)
							li=li+"<img src='images/index/new.gif'/>";
						li=li+"</li>";
						$("#list2").append(li);	
					}
				} else {
					var li="<li>暂无数据<li>"
						$("#list2").append(li);
				}
				
			},
			error : function Error() {
				alert("系统异常，请稍后重试");
			}
		});
		
		$.ajax( {
			type: "POST",
			url: "newsAndNoticeAction!listForPage?page=1&categoryId=3",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function(news) {
			if (news.length > 0) {
					for(i=0;i< Math.min(news.length,10);i++){
						title=news[i].title;
						if(title.length>18)
							title=title.substring(0,18)+"...";
						var li="<li><span>"+ news[i].time.substring(0,10)
						+"</span><a href="+"newsAndNoticeAction!showOneNewsAndNotice?searchNewsAndNoticeID="+news[i].id
						+" title="+news[i].title+" target=_self>"+title
						+"</a>";
						if(i<3)
							li=li+"<img src='images/index/new.gif'/>";
						li=li+"</li>";
						$("#list3").append(li);	
					}
				} else {
					var li="<li>暂无数据<li>"
						$("#list3").append(li);
				}
				
			},
			error : function Error() {
				alert("系统异常，请稍后重试");
			}
		});

		
/*------------------------------------------------------------------------*/
			$(".slideTxtBox").slide({
				effect : "fold",
				autoPlay : true,
				easing : "easeOutCirc",
				delayTime : 200
			});
							
/*------------------------------------------------------------------------*/	
		$(window).load(function() {
			$('#featured').orbit({
				bullets : true,
				startClockOnMouseOut : false,
			});
		});
		function GoToBottom() {
			$('html,body').animate({
				scrollTop : document.body.clientHeight + 'px'
			}, 300);
		};
		function GoTop() {
			$('html,body').animate({
				scrollTop : '0px'
			}, 300);
		};
		
		$("#top").click(function(){
			GoTop();
		});
		$("#bottom").click(function(){
			GoToBottom();
		});
/*------------------------------------------------------------------------*/	
		var timerId = null;
		function itemShow() {
			if (timerId)
				return;
			timerId = setInterval(function() {
				$("#feature li.current a span").animate({
					top : "-55px"
				}, "fast");
				$("#feature li.current a p").animate({
					top : "-55px"
				}, "fast");
			}, 200);
		}
		function itemHide() {
			if (!timerId)
				return;
			$("#feature li.current a span").animate({
				top : "0px"
			}, "fast");
			$("#feature li.current a p").animate({
				top : "0px"
			}, "fast");
			$("#feature li.current").removeClass("current");
			clearInterval(timerId);
			timerId = null;
		}
		$("#feature li").hover(function() {
			$(this).addClass("current");
			itemShow();
		}, itemHide);
	
})
