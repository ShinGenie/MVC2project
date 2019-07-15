<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../ssi.jsp" %>
<%@ page import="join.JoinDAO" %>
<%@ page import="join.JoinDTO" %>
<%@ page import="login.LoginDTO" %>
<%@ page import="login.LoginDAO" %>

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
<title>joinACT</title>
</head>
<body>
	<%
	   String path=application.getRealPath("storage");
	   //String path=application.getRealPath("storage");
	   System.out.println("경로 " + path );
	   int size=1024*1024*7 ; 
	   
	   DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
	   MultipartRequest mr=new MultipartRequest(request,path,size,"UTF-8",dfr);
	  
	   String userid=mr.getParameter("userid");
	   String pwd=mr.getParameter("pwd");
	   String name=mr.getParameter("name");
	   String phone=mr.getParameter("phone");
	   String birth=mr.getParameter("birth");
	   String catagory=mr.getParameter("catagory");
	   String gender=mr.getParameter("gender");
	   String post1=mr.getParameter("post1");
	   String email=mr.getParameter("email");
	   String idfile=mr.getFilesystemName("idfile");
	   File ff=mr.getFile("idfile");
	   int fsize = (int)ff.length(); // file크기
	   
	   System.out.println("파일의 크기=" + fsize);
	   out.println("파일의 크기=" + fsize + "<br>"); 
	   
	   JoinDAO dao = new JoinDAO();
	   JoinDTO dto = new JoinDTO();
	   PrintWriter script = response.getWriter();
	   
	   dto.setUserid(userid);	
	   dto.setPwd(pwd);
	   dto.setName(name);		dto.setPhone(phone);
	   dto.setBirth(birth);		dto.setCatagory(catagory);
	   dto.setGender(gender);	dto.setPost1(post1);
	   dto.setEmail(email); 	dto.setIdfile(idfile);	
	   dto.setFsize(fsize);
	   
	   String sUserid = dto.getUserid();
	   String sPwd = dto.getPwd();
	   String sIdfile = dto.getIdfile();
	   
	   String chUserid = "ab";
		if (session.getAttribute("userid") != null) {
			chUserid = (String) session.getAttribute("userid");
			System.out.println("joinAct.jsp 세션 userid=" + chUserid);
		}
		if (chUserid != "ab") {
			script.println("<script>");
			script.println("alert('이미 로그인되어있습니다.')");
			script.println("location.href='../main/main.jsp'");
			script.println("</script>");
		}
 
		if (dao.dbInsert(dto)==1) {
			session.setAttribute("userid", sUserid);
			session.setAttribute("pwd", sPwd);
			session.setAttribute("idfile", sIdfile);
			
			LoginDAO ldao = new LoginDAO();
			LoginDTO ldto = new LoginDTO();
			String a=(String)session.getAttribute("userid");
			String b=(String)session.getAttribute("pwd");
			String c=(String)session.getAttribute("idfile");
			ldao.dbinsert(a, b, c);
			System.out.println("세션갑 저장함 userid/pwd/idfile: "+ a + b + c);
			
			script.println("<script>");
			script.println("location.href='/ART/login/login.jsp'");//history.back();
			script.println("</script>");
		}
		
	%>
</body>
</html>