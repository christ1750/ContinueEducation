$(document).ready(function() {
	$("#addProject").click(function() {
		var ddlPjCategory = $("#ddlPjCategory").val();
		var pjName = $("#pjName").val();	 
		var ddlPjSponsor = $("#ddlPjSponsor").val();	
		var pjOrder = $("#pjOrder").val();
		var ddlPjStatus = $("#ddlPjStatus").val();
		var ddlPjScope = $("#ddlPjScope").val();
		var site = $("#site").val();	 
		var volume = $("#volume").val();
		var cost = $("#cost").val();
		var contact=$("#contact").val();
		var beginTime = $("#beginTime").val();
		var endTime = $("#endTime").val();
		var introduction = $("#introduction").val();
		var flag=1;
		if (ddlPjCategory == "---请选择项目类别---") {
			document.getElementById("categorytips").innerHTML = "[请选择项目类别]";
			flag=0;
		} else
			document.getElementById("categorytips").innerHTML = "";
		if (pjName == null || pjName == "") {
			document.getElementById("pjNametips").innerHTML = "[请填项目名称]";
			flag=0;
		} else
			document.getElementById("pjNametips").innerHTML = "";

		if (ddlPjSponsor == "---请选择开课单位---") {
			document.getElementById("ddlPjSponsortips").innerHTML = "[请选择开课单位]";
			flag=0;
		} else
			document.getElementById("ddlPjSponsortips").innerHTML = "";
		if (pjOrder == null || pjOrder == "") {
			document.getElementById("pjOrdertips").innerHTML = "[请填审批编号]";
			flag=0;
		} else
			document.getElementById("pjOrdertips").innerHTML = "";
		if (ddlPjStatus == "---请选择办班状态---") {
			document.getElementById("statustips").innerHTML = "[请选择办班状态]";
			flag=0;
		} else
			document.getElementById("statustips").innerHTML = "";
		if (site== null ||site == "") {
			document.getElementById("sitetips").innerHTML = "[请填写上课地点]";
			flag=0;
		} else
			document.getElementById("sitetips").innerHTML = "";
		if (ddlPjScope == "---请选择招生范围---") {
			document.getElementById("scopetips").innerHTML = "[请选择招生范围]";
			flag=0;
		} else
			document.getElementById("statustips").innerHTML = "";
		if (volume == null || volume == "") {
			document.getElementById("volumetips").innerHTML = "[请填写开班规模]";
			flag=0;
		} else
			document.getElementById("volumetips").innerHTML = "";
		if (cost == null || cost == "") {
			document.getElementById("costtips").innerHTML = "[请填课程费用]";
			flag=0;
		} else
			document.getElementById("costtips").innerHTML = "";
		if (contact == null || contact == "") {
			document.getElementById("contacttips").innerHTML = "[请填写联系方式]";
			flag=0;
		} else
			document.getElementById("contacttips").innerHTML = "";
		if (beginTime == null || beginTime == ""||endTime == null || endTime == "") {
			document.getElementById("timetips").innerHTML = "[请填写开课时间]";
			flag=0;
		} else if(beginTime>=endTime){
			document.getElementById("timetips").innerHTML = "[结束时间必须晚于开始时间]";
			flag=0;
		}else
			document.getElementById("timetips").innerHTML = "";
		
		if (introduction == null || introduction == "") {
			document.getElementById("introtips").innerHTML = "[请填项目简介]";
			flag=0;
		} else
			document.getElementById("introductiontips").innerHTML = "";
		if(flag==0)
			return false;
	});
})
