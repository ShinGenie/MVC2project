<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>

<%@ page import="login.LoginDAO" %>
<%@ page import="login.LoginDTO" %>
<%@ page import="join.JoinDAO" %>
<%@ page import="join.JoinDTO" %>
<%@ include file="../ssi.jsp" %>

<%@ page import="javax.servlet.ServletContext"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.ArrayList" %>
	
<%
	request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
	  LoginDAO ldao = new LoginDAO();
	  LoginDTO ldto = new LoginDTO();
	 	
	  String l_userid=request.getParameter("l_userid");
	  String l_pwd=request.getParameter("l_pwd");
	  
	  ldto.setL_userid(l_userid);
	  ldto.setL_pwd(l_pwd);
	  System.out.println("입력된 아이디 패스워드 : " + ldto.getL_userid()+" / "+ ldto.getL_pwd() );
	  
	  PrintWriter script = response.getWriter();

	  //String userid ="a";
	  //if(session.getAttribute("userid")!=null) {
		//  userid=(String)session.getAttribute("userid");
		//  System.out.println("저장된 세션이름: " + userid);
	  //}
	  //if(userid != "a") {
	//	  script.println("<script>");
		 // 	  script.println("location.href='../main/main.jsp'");
		  	//  script.println("</script>");
	  //}
	 
	  //입력된 내용과 디비저장비교
	  int result=ldao.dbselect(ldto.getL_userid(), ldto.getL_pwd());
	  System.out.println("디비 셀렉트 입력된 아이디 패스워드 : " + ldto.getL_userid()+" / "+ ldto.getL_pwd() );
	  System.out.println("결과 : " + result );
	  
	    
	  if(result==1) { //
		  session.setAttribute("userid", ldto.getL_userid());
	  	  System.out.println("세션에 저장된 유저아이디"+ldto.getL_userid());
	  	  JoinDAO dao = new JoinDAO();
  	      JoinDTO dto = new JoinDTO();
  	      String idfile1 = dao.dbIdfile((String)session.getAttribute("userid"));
  	      session.setAttribute("idfile", idfile1);
    	  System.out.println("세션에 저장된 유저얼굴"+idfile1);
		  script.println("<script>");
		  script.println("alert('로그인되었습니다')");
		  script.println("location.href='/ART/main/main.jsp'");
		  script.println("</script>");
	  }else if(result==0) {
		  script.println("<script>");
		  script.println("alert('비밀번호가 일치하지않습니다')");
		  script.println("history.back();");
		  script.println("</script>");
	  }else if(result==-1) {
		  script.println("<script>");
		  script.println("alert('존재하지않는 아이디입니다')");
		  script.println("history.back();");
		  script.println("</script>");
	  }else if(result==-2){
		  script.println("<script>");
		  script.println("alert('데이터베이스 오류입니다')");
		  script.println("history.back();");//history.back();
		  script.println("</script>");
	  }
	%>

</body>
</html>