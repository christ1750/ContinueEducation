$(document).ready(function() {
	
	

    $.ajax( {
			type: "POST",
			url: "diagramAction!showForPage?page=1",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function(diagram) {
			if (diagram.length > 0) {
					for(i=0;i< Math.min(diagram.length,5);i++){
						title=diagram[i].title;
						if(title.length>18)
							title=title.substring(0,18)+"...";
						var li="<li><a href="+"diagramAction!linknews?linknewsNO="+diagram[i].id+">"+"<img src='images/diagram/"+diagram[i].id+".jpg' "
						+"width='415'"+"height='342' alt=''/>"+"</a><span class='title'>"+title+"</span></li>"
							
								
							
							
							
						$("#slidesImgs").append(li);				
					}
				} else {
					var li="<li>暂无数据<li>"
						$("#slidesImgs").append(li);
				}			
			},
			error : function Error() {
				alert("系统异常，请稍后重试");
			}
		});
	
		

	
})
