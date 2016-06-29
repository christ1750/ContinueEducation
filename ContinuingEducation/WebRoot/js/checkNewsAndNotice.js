$(document).ready(function() {
	$("#saveNewsAndNotice").click(function() {
		var category = $("#category").val();
		var title = $("#title").val();
		var author = $("#author").val();
		var source = $("#source").val();
		var content1 = $("#content1").val();
		var flag = 1;
		if (category == "---请选择类型---") {
			document.getElementById("categorytips").innerHTML = "[请选择类别]";
			flag = 0;
		} else
			document.getElementById("categorytips").innerHTML = "";
		if (title == null || title == "") {
			document.getElementById("titletips").innerHTML = "[请填写标题]";
			flag = 0;
		} else
			document.getElementById("titletips").innerHTML = "";
		if (author == null || author == "") {
			document.getElementById("authortips").innerHTML = "[请填写作者]";
			flag = 0;
		} else
			document.getElementById("authortips").innerHTML = "";
		if (content1 == null || content1 == "") {
			document.getElementById("contenttips").innerHTML = "[请填写正文内容]";
			flag = 0;
		} else
			document.getElementById("contenttips").innerHTML = "";
		if (flag == 0)
			return false;
	});
})
