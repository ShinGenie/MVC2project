 //#15 유효성 검증
function joinCheck(){
	/*
	if(document.frm.name.value.length==0||document.frm.name.value.length<4){
		alert("4자리 이상 이름을 입력하세요");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.userid.value.length<4){
		alert("아이디는 4글자 이상 입력하세요");
		document.frm.userid.focus();
		return false;
	}
	*/
	if(document.frm.reid.value.length==0){
		alert("중복체크하지않았습니다");
		document.frm.userid.focus();
		return false;
	}
	/*
	if(document.frm.pwd.value==""){
		alert("비밀번호는 반드시 입력해야합니다");
		document.frm.pwd.focus();
		return false;
	}
	if(document.frm.pwd.value.length<4){
		alert("비밀번호는 5자리 이상입니다");
		document.frm.pwd.focus();
		return false;
	}
	
	if(document.frm.pwd1.value==""){
		alert("비밀번호 한번더 입력해주세요");
		document.frm.pwd1.focus();
		return false;
	}
	*/
	if(document.frm.pwd.value != document.frm.pwd1.value){
		alert("비밀번호가 일치하지 않습니다");
		document.frm.pwd1.focus();
		return false;
	}

	/*
	console.log("Hello");
	var birth = document.getElementById("birth");
	console.log("birth " + birth.tagName);
	
	
	if(birth.value.length  == 0 ){
		alert("생일 입력하세요");
		document.frm.birth.focus();
		return false;
	}
	
	if(document.frm.gender.value == "" ){
		alert("성별 입력하세요");
		birth[0].focus();
		return false;
	}
	*/
	/*
	if(document.frm.email.value.length==0){
		alert("이메일을 입력해주세요");
		document.frm.email.focus();
		return false;
	}
	
	if(document.frm.tel.value.length==0){
		alert("전화번호 입력하세요");
		document.frm.tel.focus();
		return false;
	}
	
	if(document.frm.post1.value==""){
		alert("주소 입력하세요");
		document.frm.post1.focus();
		return false;
	}
	
	if(document.frm.subject.value==false){
		alert("주제 선택하세요");
		subject[0].focus();
		return false;
	}
	*/
}


//#10 아이디 중복체크 - idCheck 서블릿 불러서 db와 userid의 동일여부 확인해아한다.

function idCheck(){
	
	if(document.frm.userid.value==""){
		alert("아이디를 확인해주세요");
		document.frm.userid.focus();
		return;
	}
	
	if(document.frm.userid.value.length<4){
		alert("아이디는 4글자 이상 입력하세요");
		document.frm.userid.focus();
		return false;
	}
	/*else {
		document.frm.pwd.focus();
		return true;
	}
*/

	//var 템플릿 변수   대입되는 변수에 따라서 타입이 결정된다.
	//서블릿을 부르자. 이때 쿼리스트링을 만들어서 값도 같이 가져가자.
	
	var url="/ART/idCheck.do?userid="+document.frm.userid.value;
	var title ="_blank_1";
	var frame = "toolbar=no, menubar=no, scrollbar=yse, resize=no, width=450; height=200";
	
	//창만 열렸다. 창안에 내용은 사용가능/사용불가!
	// db를 통해서만 가능하다.
	// 서블릿에 가서 결과를 가져오자 -idCheck.jsp에 던져주자
	// 여부결과 페이지를 만들어서 창에 끼워넣으면 된다.
	//#11 스크립트에서 ->idCheck 서블릿으로 가자(userid를 들고가자)
	window.open(url, title, frame);

}

//#14 idCheck.jsp에서 "사용"버튼을 눌렀을때 온다.
//이 함수를 부른 모글(document)에서 값을 읽어온 다음 
//join.jsp(==opener)의 userid에 그 값을 넣어줘야한다.
//아이디 중복확인을 위해서 숨겨져있는 reid한테도 값을 넣어주자
//그리고 현재 열려있는 창을 닫자
function idok(userid){
	opener.frm.userid.value = userid ;
	opener.frm.reid.value = document.frm.userid.value;
	opener.frm.pwd.focus();
	self.close();
}

function idcancle(){
	self.close();
}


//주소팝업
function goPopup() {
	var pop = window.open("jusoPopup.jsp", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");

}
function jusoCallBack(roadFullAddr) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	document.frm.post1.value = roadFullAddr;
}

 function research(){
	 search_form.action="UserSearchServlet.do"
 }//end


 
 







