$(document).ready(function () {

    // 网站根目录
    var webSitePath = GetWebRoot();
    
    
    // 获取证件类型
    $.post("loadCertificate", function (data) {  
		var $option = $("<option></option>");  
        $option.attr("value", "-1");  
        $option.text("");  
        var jsonObj =data;  
        for (var i = 0; i < jsonObj.length; i++) {  
            var $option = $("<option></option>");  
            $option.attr("value", jsonObj[i][0]);  
            $option.text(jsonObj[i][1]);  
            $("#ddlzjlx").append($option);  
        }
        });    
    
    // 获取学历
    $.post("loadDegree", function (data) {  
		var $option = $("<option></option>");  
        $option.attr("value", "-1");  
        $option.text("");  
        var jsonObj =data;  
        for (var i = 0; i < jsonObj.length; i++) {  
            var $option = $("<option></option>");  
            $option.attr("value", jsonObj[i][0]);  
            $option.text(jsonObj[i][1]);  
            $("#ddlXl").append($option);  
        }
        });
    
    // 获取民族
    $.post("loadNation", function (data) {  
		var $option = $("<option></option>");  
        $option.attr("value", "-1");  
        $option.text("");  
        var jsonObj =data;  
        for (var i = 0; i < jsonObj.length; i++) {  
            var $option = $("<option></option>");  
            $option.attr("value", jsonObj[i][0]);  
            $option.text(jsonObj[i][1]);  
            $("#ddlMz").append($option);  
        }
        }); 
    
    // 获取政治面貌
    $.post("loadParty", function (data) {  
		var $option = $("<option></option>");  
        $option.attr("value", "-1");  
        $option.text("");  
        var jsonObj =data;  
        for (var i = 0; i < jsonObj.length; i++) {  
            var $option = $("<option></option>");  
            $option.attr("value", jsonObj[i][0]);  
            $option.text(jsonObj[i][1]);  
            $("#ddlzzmm").append($option);  
        }
        });
    
    var bh = getUrlParam("bh"); // 报名编号

    if (bh != null) {
        // 修改页面

        $("#bh").val(bh);
        FillBackUserInfo(bh);
    }
  
    $("#txtBirth").datepicker({ changeYear:true, changeMonth:true, yearRange:'c-40:c' });
    $("#txtGraduateDate").datepicker({ changeYear:true, changeMonth:true, yearRange:'c-40:c' });
    $("#txtWorkDate").datepicker({ changeYear:true, changeMonth:true, yearRange:'c-40:c' });
    $(".ui-datepicker").css('font-size', '1em'); // 改变大小
    $(".ui-datepicker select.ui-datepicker-month-year").css("width", "38%");

    $("#txtPwd").tooltip({
        track:true,
        delay:0,
        showURL:false,
        showBody:" - ",
        fade:250
    });

    
    // 根据证件号码取得报名信息
    function GetRegInfoByZjh(num) {
        var WebServiceUrl = webSitePath + "/userInfoAction!findUserInfoByID?num="+num;
        var RegInfo;
        $.ajax({     	
            type:"POST",
            url:WebServiceUrl,
            contentType:"application/json; charset=utf-8",
           // data:"{'num':'" + num + "'}",
            dataType:"json",
            async:false,
            success:function (result) {
                RegInfo = result;
            },
            error:function (msg) {
                alert(msg);
            }
        });
        return RegInfo;
    }
    
    
    // 证件种类选择事件，每换一次证件类型，证件号都要对应清空
    $("#ddlzjlx").change(function () { $("#txtZjhm").val(""); });
    
        $("#btnConfirm").hide();

        $("#xxmc").focus(function () {
            $("#Mask").width($(document).width());
            $("#Mask").height($(document).height());
            var Width = window.screen.availWidth; 	// $(document).offset();
            var Height = window.screen.availHeight; // $(document)
            var divWidth = $("#SearchSchoolDiv").width();
            var divHeight = $("#SearchSchoolDiv").height();
            var left = (Width - divWidth) / 2 + "px";
            var top = (Height - divWidth) / 2 + $(document).scrollTop() + "px";
            $("#SearchSchoolDiv").css("left", left).css("top", top);
            $("#Mask").show();
            $("#SearchSchoolDiv").fadeIn("slow");
            $("#school").focus();
        });

        $("#closeButton").click(function () {
            $("#SearchSchoolDiv").hide();
            $("#Mask").hide();
        });

        $("#SearchSchool").click(function () {
            var xxmc = $("#school").val();
            LoadSchool(xxmc);
        });
        $("#school").keydown(function (event) {
            var xxmc = $(this).val();
            if (event.keyCode == 13) {
                LoadSchool(xxmc);
                return false;
            }
        });

        $("#btnConfirm").click(function () {
            var checkedRadio = $("table input[type=radio]:checked");
            var xxdm = checkedRadio.parent().next().text();
            var xxmc = $.trim(checkedRadio.parent().next().next().text());
            $("#xxmc").val(xxmc);
            $("#xxdm").val(xxdm);
            // window.close();
            $("#SearchSchoolDiv").hide();
            $("body").removeClass("disableScroll")
            $("#Mask").hide();
        });


        // 按下Backspace键时，禁止页面返回
        $(document).keydown(function (e) {
            var code;
            if (!e) var e = window.event;
            if (e.keyCode) code = e.keyCode;
            else if (e.which) code = e.which;
            if (((event.keyCode == 8) &&                                                    // BackSpace
             ((event.srcElement.type != "text" &&
             event.srcElement.type != "textarea" &&
             event.srcElement.type != "password") ||
             event.srcElement.readOnly == true)) ||
            ((event.ctrlKey) && ((event.keyCode == 78) || (event.keyCode == 82))) ||    // CtrlN,CtrlR
            (event.keyCode == 116)) {                                                   // F5
                event.keyCode = 0;
                event.returnValue = false;
            }
            return true;
        });
   
        function LoadSchool(xxmc) {
            var WebServiceUrl = webSitePath + "/loadSchool?input="+encodeURI(encodeURI(xxmc));
            var table = $("#SearchSchoolDiv table");              
            table.children().remove();
            if (xxmc.length == 0) {
                $("#SearchSchoolDiv table").append("<tr><th></th><th>学校代码</th><th>学校名称</th><th>历史沿革</th></tr>");
                $("#SearchSchoolDiv table").append("<tr><td><input type='radio' name='rdoSchool'/></td><td>00000</td><td>无</td><td>无</td><tr>");
            }
            else {
                $.ajax({        	
                    type:"POST",
                    url:WebServiceUrl,
                    contentType:"application/json; charset=utf-8",
                    dataType:"json",
                   // data:{input:$("#school").val()},
                    success:function (result) { 
                        table.append("<tr><th></th><th>学校代码</th><th>学校名称</th><th>历史沿革</th></tr>");
						if (result.length > 0) { 
						for(var i=0;i<result.length;i++){
							var lsyg=result[i].schoolHistory;
							if(lsyg==null){
								lsyg="无";
								}
			                var option = "<tr><td><input type='radio' name='rdoSchool'/></td><td>" + result[i].schoolID + "</td><td>" + result[i].schoolName + "</td><td>" + lsyg + "</td><tr>";
			                table.append(option);                      	 
						 }	
						}
                       else
                        {
                            var option = "<tr><td><input type='radio' name='rdoSchool'/></td><td>000000</td><td>无</td><td>无</td><tr>";
                            table.append(option);
                        }
                    },
                    error:function Error(msg) {
                        alert(msg.response.Text);
                    }
                });
            }
            $("#btnConfirm").fadeIn();
        }
    /***************************************************************************
	 * 函数部分
	 **************************************************************************/
    // 检查备注，如果学校代码为00000，备注一定要填写
    function CheckRemark() {
        var remark = $("#textareaBZ").val();
        var xxdm = $("#xxdm").val();
        if (xxdm == 0 && remark == "") {
            return false;
        }
        return true;
    }

    // 身份证重复检查
    function isMultipleIdCardNumber(num) {
        var checkResult = true; // false:证件号重复;true证件号不重复

        // 判断是报名还是修改报名信息，如果是修改报名信息，则身份证可以重复
        var bh = $("#bh").val();
        if (bh.toString().length > 0) {
            return checkResult;
        }

        // 根据证件号查找报名信息
        var RegInfo = GetRegInfoByZjh(num);
        if (RegInfo == null||RegInfo=="") {
            checkResult = true;
        }
        else {
            checkResult = false;
        }
        return checkResult;
    }

   

    // 根据编号取得个人注册信息
    function GetUserInfoByBh(bh) {
        var WebServiceUrl = webSitePath + "/userInfoAction!getUserInfoBybh?bh="+bh;
        var userInfo;
        $.ajax({
            type:"POST",
            url:WebServiceUrl,
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            async:false,
            success:function (result) {
        	userInfo = result;
            },
            error:function (msg) {
                alert(msg);
            }
        });
        return userInfo[0];
    }

    
    // 修改报名信息时，向页面回填报名信息
    function FillBackUserInfo(bh) {
    	var UserInfo =GetUserInfoByBh(bh);

        if (UserInfo != null) {
            $("#textfieldzhxm").val(UserInfo.userName);                                   // 账户姓名
            $("#textfieldzsxm").val(UserInfo.realName);                                   // 真实姓名
            $("#txtPwd").val(UserInfo.userPassword);                                      // 登录密码
            $("input[name='sex'][value=" + UserInfo.sex+ "]").attr("checked", true);      // 姓别
            $("#ddlXm").val(UserInfo.projectName);                                        // 项目
            $("#ddlMz").val(UserInfo.nation.nationID);                                    // 民族
            $("#ddlzzmm").val(UserInfo.party.partyID);                                    // 政治面貌
            $("#txtBirth").val(UserInfo.birth);               							  // 生日
            $("#txtAge").val(UserInfo.age);                                      		  // 年龄
            $("#ddlzjlx").val(UserInfo.certificate.certificateKind);                      // 证件类型
            $("#txtZjhm").val($.trim(UserInfo.certificateID));                            // 证件号码
            $("#textareaBZ").val(UserInfo.remarks);                                       // 备注
            $("#xxdm").val(UserInfo.school.schoolID);                                	  // 学校代码
            $("#xxmc").val(UserInfo.school.schoolName);                                   // 学校名称
            $("#ddlXl").val(UserInfo.degree.degreeID);                                	  // 学历
            $("#txtGraduateDate").val(UserInfo.graduateTime);  							  // 毕业时间
            $("#txtLxdz").val(UserInfo.address);                                          // 联系地址
            $("#txtZipCode").val(UserInfo.postCode);                                      // 邮政编码
            $("#txtmobile").val($.trim(UserInfo.mobile));                                 // 手机号码
            $("#email").val(UserInfo.email);                                              // 电子邮件
        }
    }


    // 身份证号码校验
    function CheckIdCard(num) {
    	if($("#ddlzjlx").val())
    		
        if ($("#ddlzjlx").val() != "1") {
            return true;
        }

        var area = [null, null, null, null, null, null, null, null, null, null, null, "北京", "天津", "河北", "山西", "内蒙古"
    , null, null, null, null, null, "辽宁", "吉林", "黑龙江", null, null, null, null, null, null, null, "上海"
    , "江苏", "浙江", "安微", "福建", "江西", "山东", null, null, null, "河南", "湖北", "湖南", "广东", "广西", "海南"
    , null, null, null, "重庆", "四川", "贵州", "云南", "西藏", null, null, null, null, null, null, "陕西", "甘肃"
    , "青海", "宁夏", "XJ", null, null, null, null, null, "台湾", null, null, null, null, null, null, null, null
    , null, "香港", "澳门", null, null, null, null, null, null, null, null, "国外"];

        var prov;
        var len = num.length;
        var re;
        var StringNum = String(num);

        // 长度验证
        if ((len != 15) && (len != 18)) {
            return false;
        }

        // 地区验证
        prov = area[StringNum.substr(0, 2)];
        if ((typeof (prov) == "undefined") || prov == null) {
            return false;
        }

        // 正则表达式验证
        if (len == 15)
            re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/);
        else if (len == 18)
            re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d)$/);
        else {
            return false;
        }

        // 日期验证
        var a = num.match(re);
        if (a != null) {
            if (len == 15) {
                var D = new Date("19" + a[3] + "/" + a[4] + "/" + a[5]);
                var B = D.getYear() == a[3] && (D.getMonth() + 1) == a[4] && D.getDate() == a[5];
            } else {
                var D = new Date(a[3] + "/" + a[4] + "/" + a[5]);
                var B = D.getFullYear() == a[3] && (D.getMonth() + 1) == a[4] && D.getDate() == a[5];
            }
            if (!B) {
                return false;
            }
        }

        // 校验码验证
        if (len == 18) {
            var wi = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
            var sum = 0;
            for (var i = 0; i < 17; i++) {
                sum += wi[i] * Number(StringNum[i]);
            }
            var mod = sum % 11;
            var checkCode = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2];
            var lastCode = StringNum[17].toUpperCase();
            if (lastCode != checkCode[mod]) {
                return false;
            }
        }
        return true;
        
    }


    // 根据身份证取  生日，性别,年龄
    function GetInfoByIDCard(num) {
    	if(num!=null&&num!=""){
	        var array = String(num);
	        var sex = array.slice(14, 17) % 2 ? "男" :"女";
	        var birthday = "";
	        var age = "";
	        var len = array.length;
	        if (len == 15) {
	            birthday = "19" + array.slice(6, 8) + "-" + array.slice(10, 12) - 1 + "-" + array.slice(12, 14);
	        }
	        else {
	            birthday = array.slice(6, 10) + "-" + array.slice(10, 12) + "-" + array.slice(12, 14);
	        }
	
	        var dt1 = new Date(birthday);
	        var dt2 = new Date();
	        var age = dt2.getFullYear() - dt1.getFullYear();
	        var m = dt2.getMonth() - dt1.getMonth();
	        if (m < 0) {
	            age--;
	        }

	      
	        return {   
	            birth:birthday,
	            sex:sex,
	            age:age
	        };
    	}
    	return null;
    }
    
    $("#txtZjhm").blur(function() {
    	var num=$("#txtZjhm").val();
		var kind=$("#ddlzjlx").val();
		if(num!=null&&num!=""&&kind=="1"){ 
			var Info = GetInfoByIDCard(num);
    	  $("input[name='sex'][value=" + Info.sex+ "]").attr("checked", true);// 性别
          $("#txtBirth").val(Info.birth);       // 生日
          $("#txtAge").val(Info.age);           // 年龄
		}
    });  
    
  // 根据身份证号，校验 性别，生日，年龄
	function CheckAge(age)
	{
		 // 获取身份证信息、校验
		var num=$("#txtZjhm").val();
		var kind=$("#ddlzjlx").val();
		if(num!=null&&num!=""&&kind=="1"){ 
			var Info = GetInfoByIDCard(num);
		    if(age!=Info.age)
		    	return false;
		    }
	    return true;
	
	}
	function CheckSex(sex)
	{
		 // 获取身份证信息、校验
		var num=$("#txtZjhm").val();
		var kind=$("#ddlzjlx").val();
		if(num!=null&&num!=""&&kind=="1"){ 
			var Info = GetInfoByIDCard(num);
		    if(sex!=Info.sex)
		    	return false;
		    }
	    return true;
	
	}
	function CheckBirth(birth)
	{
		 // 获取身份证信息、校验
		var num=$("#txtZjhm").val();
		var kind=$("#ddlzjlx").val();
		if(num!=null&&num!=""&&kind=="1"){ 
			var Info = GetInfoByIDCard(num);	   
		    if(birth!=Info.birth)
		    	return false;
		    }
	    return true;
	}
    /***************************************************************************
	 * 页面验证
	 **************************************************************************/
	
    $.validator.setDefaults({
        submitHandle:function (form) { form.submit(); }
    });

   $.validator.addMethod("checkAge", function (value, element) {
   	 return this.optional(element) || (CheckAge(value));
   }, "年龄与证件信息冲突");
   
   $.validator.addMethod("checkSex", function (value, element) {
   	return this.optional(element) || (CheckSex(value));
   }, "性别与证件信息冲突");
   
   $.validator.addMethod("checkBirth", function (value, element) {
   	return this.optional(element) || (CheckBirth(value));
   }, "生日与证件信息冲突");
    
    $.validator.addMethod("isMobile", function (value, element) {
        return this.optional(element) || (value.length == 11 && /(^13\d{9}$)|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^18\d{9}$)|(^147\d{8}$)/g.test(value));
    }, "格式错误");

    $.validator.addMethod("isIDCard", function (value, element) {
        return this.optional(element) || (CheckIdCard(value));
    }, "格式错误");

    $.validator.addMethod("isZipCode", function (value, element) {
        var tel = /^[0-9]{6}$/;
        return this.optional(element) || (tel.test(value));
    }, "格式错误");

    $.validator.addMethod("isRemarkNotNull", function (value, element) {
        return (CheckRemark(value));
    }, "请输入学校名称");

    $.validator.addMethod("isMultipleID", function (value, element) {
        // return isMultipleIdCardNumber(value);
        var checkResult = isMultipleIdCardNumber(value);
        return checkResult;
    }, "已被注册");


  $("#form").validate( { 
	  rules:{
	  		  userName:{ required:true }, 
	  		  userPassword:{ required:true }, 
			  realName:{ required:true }, 
			  sex:{ required:true ,checkSex:true}, 
			  birth:{ required:true,checkBirth:true },
			  age:{ required:true,checkAge:true },
			  certificateID:{ required:true, isMultipleID:true,isIDCard:true },
			  schoolID:{ required:true }, 
			  schoolName:{ required:true }, 
			  degree:{required:true }, 	 
			  graduateTime:{required:true },
			  Address:{ required:true }, 
			  Email:{ email:true, required:true }, 
			  mobile:{isMobile:true, required:true }, 
			  postCode:{ isZipCode:true, required:true },	
			  remarks:{isRemarkNotNull:true },
  }, 
  messages:{
			  userName:{ required:"请输入账户名" },
			  userPassword:{ required:"请输入密码" },
			  realName:{ required:"请输入真实姓名" }, 
			  sex:{ required:"请选择性别" }, 
			  age:{required:"请输入年龄"},
			  birth:{ required:"请选择生日" }, 
			  certificateID:{ required:"请输入证件号码" },
			  schoolID:{ required:"请输入学校代码" }, 
			  schoolName:{ required:"请输入学校名称" },
			  degree:{ required:"请输入学历名称" }, 
			  graduateTime:{ required:"请输入毕业时间" },
			  Address:{ required:"请输入联系地址" }, 
			  Email:{ required:"请输入Email地址",email:"Email地址无效" }, 
			  mobile:{ required:"请输入手机号码" }, 
			  postCode:{ required:"请输入邮政编码" }, 
	
   }, 
  errorPlacement:function (error, element) {
  error.appendTo(element.parent()); 
  }, 
  focusInvalid:false, 
  onkeyup:false 
  });
	
});

// /弹出层
var OpenPopDiv = function (Title, Message) {
    var PopDiv = "<div id=\"PopDiv\">" + Message + "</div>";
    // var PopDiv = $("#PopDiv");
    if ($("#PopDiv").length > 0) {
        $("#PopDiv").remove();
    }

    $("form").append(PopDiv);
    $("#PopDiv").dialog({ title:Title });
}

// /关闭层
var ClosePopDiv = function () {
    var PopDiv = $("#PopDiv");
    if (PopDiv.length > 0) {
        $("#PopDiv").dialog("close");
    }
    $("#PopDiv").remove();
}

// 获取网站的根路劲
function GetWebRoot() {
    var strFullPath = window.document.location.href;
    var strPath = window.document.location.pathname;
    var pos = strFullPath.indexOf(strPath);
    var prePath = strFullPath.substring(0, pos);
    var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
    return (prePath + postPath);
}

// 获取地址栏参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); // 构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  // 匹配目标参数
    if (r != null) {
        return unescape(r[2]);
    } else { return null; } // 返回参数值
}
// yyyyMMdd转yyyy-MM-dd
function ConvertStringToDateString(str) {
var Year = 0;
var Month = 0;
var Day = 0;

var CurrentDate = "";
if (str.length > 0) {
var DateIn = new Date(str.substr(0, 4), str.substr(4, 2), str.substr(6, 2));

// 初始化时间
Year = DateIn.getFullYear();
Month = DateIn.getMonth();
Day = DateIn.getDate();

CurrentDate = Year + "-";
if (Month >= 10) {
CurrentDate = CurrentDate + Month + "-";
}
else {
CurrentDate = CurrentDate + "0" + Month + "-";
}
if (Day >= 10) {
CurrentDate = CurrentDate + Day;
}
else {
CurrentDate = CurrentDate + "0" + Day;
}
}
return CurrentDate;
}
