

var r_btn = document.rfmt.getElementById("btn-reply").value;
var r_email = document.rfmt.r_email.value;
var r_con =  document.rfmt.r_con.value;

function re_edit(r_email,r_con){
	r_email = r_email;
	r_con = r_con;
	r_btn.value = "댓글수정";
 }//end

function re_save(){
	if(r_btn=="저장"){
		
		if(r_email==""||r_email==null){
			alert("이메일을 적어주세요");
			document.rfmt.r_email.focus();
			return false;
		}
		if(r_con==""||r_con==null){
			alert("댓글내용을 적어주세요");
			document.rfmt.r_con.focus();
			return false;
		}
		
		document.rfmt.submit();
		
	}else if(r_btn=="댓글수정"){
		r_btn="저장";
		document.rfmt.method="post";
		document.rfmt.action="/ART/r_edit.do";
		document.rfmt.submit();
		
	}
	
}
 
 







