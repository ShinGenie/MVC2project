<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>

<%@ page import="login.LoginDAO" %>
<%@ page import="login.LoginDTO" %>
<%@ include file="../ssi.jsp" %>

<%@ page import="javax.servlet.ServletContext"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.File"%>
	
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
	  String l_userid=request.getParameter("l_userid");
	  String l_pwd=request.getParameter("l_pwd");
	  
	  PrintWriter script = response.getWriter();
	  LoginDAO ldao = new LoginDAO();
	  LoginDTO ldto = new LoginDTO();
	  ldto.setL_userid(l_userid);
	  ldto.setL_pwd(l_pwd);

	  String userid ="a";
	  if(session.getAttribute("userid")!=null) {
		  userid=(String)session.getAttribute("userid");
		  System.out.println("저장된 세션이름: " + userid);
	  }
	  if(userid != "a") {
		  script.println("<script>");
		  script.println("location.href='../main/main.jsp'");
		  script.println("</script>");
	  }
	  String getUserid = ldto.getL_userid();
	  String getPwd = ldto.getL_pwd();
	  //입력된 내용과 디비저장비교
	  int result=ldao.dbselect(getUserid, getPwd);
	  if(result==1) { //
		  session.setAttribute("userid", ldto.getL_userid());
		  script.println("<script>");
		  script.println("alert('로그인되었습니다')");
		  script.println("location.href='../main/main.jsp?Gidx="+ getUserid +"'");
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
		  script.println("alert('데이터베이스오류입니다')");
		  script.println("history.back();");
		  script.println("</script>");
	  }
	%>

</body>
</html>