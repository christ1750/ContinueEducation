$(document).ready(function() {
	
	$.post("loadFileCategory", function(data) {
		var $option = $("<option></option>");
		$option.attr("value", "-1");
		$option.text("");
		var jsonObj = data;
		for ( var i = 0; i < jsonObj.length; i++) {
			var $option = $("<option></option>");
			$option.attr("value", jsonObj[i].categoryId);
			$option.text(jsonObj[i].categoryName);
			$("#category").append($option);
		}
	});
	
    var maxsize = 10*1024*1024;// 10M
    var tipMsg = "当前浏览器不支持计算上传文件大小,建议使用IE、FireFox、Chrome浏览器。";  
    var browserCfg = {};  
    var ua = window.navigator.userAgent;  
    if (ua.indexOf("MSIE")>=1){  
        browserCfg.ie = true;  
    }else if(ua.indexOf("Firefox")>=1){  
        browserCfg.firefox = true;  
    }else if(ua.indexOf("Chrome")>=1){  
        browserCfg.chrome = true;  
    }  
    $("#upload").click(function() {	 
    	var category = $("#category").val();   
    	if(category == "---请选择类型---"){
    		document.getElementById("error").innerHTML ="[请先选择文件类别]";
    		return false;
    	}
    	
        try{  
            var obj_file = document.getElementById("file");  
           
            if(obj_file.value==""){  
            	document.getElementById("error").innerHTML ="[请先选择上传文件]";  
                return false;  
            }  

            var strRegex = "(.doc|.docx|.xls|.xlsx|.txt|.jpg|.jpeg)$"; //用于验证图片扩展名的正则表达式
            var re=new RegExp(strRegex);
            if (!re.test(obj_file.value)){
           	 document.getElementById("error").innerHTML ="[文件后缀名不合法]"; 
                return false;
            }
            
            var filesize = 0;  
            if(browserCfg.firefox || browserCfg.chrome ){  
                filesize = obj_file.files[0].size;  
            }else if(browserCfg.ie){  
            	var file = fileSystem.GetFile(obj_file.value);  
                filesize = file.Size;  
            }else{  
            	document.getElementById("error").innerHTML =tipMsg;  
                return false;  
            }  
             
            if(filesize==-1){  
                alert(tipMsg);  
                return false;  
            }else if(filesize>maxsize){  
            	document.getElementById("error").innerHTML ="[上传的附件文件不能超过10M]";  
                return false;  
            }
        }catch(e){  
            alert(e);  
        }  
    });

});