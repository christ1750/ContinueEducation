rapidsh = {};
/**
 * 选择传入的form列表里所有的checkbox
 * theForm-传入的表单对象
 */
rapidsh.checkAllBox = function(theForm) {
	for (var i=0;i<theForm.elements.length;i++) {
	    var e = theForm.elements[i];
			var eName = e.name;
	    	if (eName != 'allbox' && 
	            (e.type.indexOf("checkbox") == 0)) {
	        	e.checked = theForm.allbox.checked;		
			}
	}; 
};

/**
 * 使用css元素的'display:none' 属性实现隐藏和显示
 * 该方法隐藏后在页面山不会占据元素空间大小的位置
 * targetId-传入的元素id
 * */
rapidsh.toggleDisplay = function(targetId){
    if (document.getElementById) {
        target = document.getElementById(targetId);
    	if (target.style.display == "none"){
    		target.style.display = "";
    	} else {
    		target.style.display = "none";
    	}
    }
};

/**
 * 使用css元素的'visibility:hidden' 属性实现隐藏和显示
 * 该方法隐藏元素后，其元素原来的空间位置不变，只是不能看到该元素，显示为空白
 * */
rapidsh.toggleVisibility = function(targetId) {
	if (document.getElementById) {
		target = document.getElementById(targetId);
		if (target.style.visibility == "hidden"){
			target.style.visibility = "visible";
		} else {
			target.style.visibility = "hidden";
		}
	}
};

/**
 * 对列表的记录进行删除、查看、修改的操作
 * formId-form的ID
 * url-请求URL地址
 * type-操作类型，删除(del)、查看(view)、修改(edit)
 * */
rapidsh.actionPerformance = function(formId, url, type) {
	 if( type =="del" ){
		 if( $("input:checked").length >= 1 ){
			 $('#'+formId+'').attr("action", url);
			 $('#'+formId+'').attr("method", "post");
			 $('#'+formId+'').submit();
		 }else{
			 alert("请勾选要删除的记录!!!");
			 return;
		 }
	 }

	 if( type =="edit" || type =="view" ){
		 if( $("input:checked").length==1 ){
			 $('#'+formId+'').attr("action", url);
			 $('#'+formId+'').attr("method", "get");
			 $('#'+formId+'').submit();
		 }else{
			 alert("[查看]/[修改]只能选择一条记录!!!");
			 return;
		 }
	 }
};
