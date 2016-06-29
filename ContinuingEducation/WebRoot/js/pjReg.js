function checkLogin() {
	var userId = $("#userId").val();
	var projectId = $("#projectId").val();

	if (!userId) {
		alert('您还没登陆，请先登陆!');
		window.location.href = "index.jsp";
	} else {

		$.ajax({  
			type:"post",
			url:"projectRegisterAction!findByUidAndPid?userId=" + userId+ "&projectId=" + projectId,
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success:function(data){
				if (data.length>0)
				{		
					alert('您已经报名过该项目，请去看看其他项目吧~');
					window.location.href = "myProjectAction!searchProjectForPage?page=1";
				}
				else
					window.location.href = "frontend-signup.jsp";
			},
		error:function(){ 
				alert("系统错误!请稍后重试"); 
		}
	});
	}
}
