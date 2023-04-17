function inputCheck(){
	if(document.regFrm.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.pwd.focus();
		return;
	}
	if(document.regFrm.repwd.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.pwd.value != document.regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.snsid.value==""){
		alert("SNS 아이디를 입력해 주세요.");
		document.regFrm.snsid.focus();
		return;
	}
	if(document.regFrm.team.value==""){
		alert("소속을 입력해 주세요.");
		document.regFrm.team.focus();
		return;
	}
	document.regFrm.submit();
}

function win_close(){
	self.close();
}