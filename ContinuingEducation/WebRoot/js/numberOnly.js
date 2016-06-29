//注意：火狐使用event时，  
function inputNum(evt) {
	//火狐使用evt.which获取键盘按键值，IE使用window.event.keyCode获取键盘按键值
	var ev = evt.which ? evt.which : window.event.keyCode;
	//数字键; 13=enter; 46=delete; 45=insert; 8=backspace;
	if (((ev >= 48) && (ev <= 57)) || (ev == 13) || (ev == 46) || (ev == 45) || (ev == 8)) {
		return true;
	} else {
		return false;
	}
}
