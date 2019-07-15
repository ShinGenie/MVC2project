<%@page import="java.io.FileInputStream"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>

<!DOCTYPE html>
<html>
<head>
<title> []</title>
</head>
<body>
    BBB.jsp문서 <p>
 	<img src="images/bar.gif"> <br>
 	<img src="images/bar.gif"> <br>
 	<img src="images/bar.gif"> <p>
 	
 	<%//이미지게시판 만들어볼것
 	String path=application.getRealPath("/ART/storage");//공유폴더 개념
 	System.out.println("경로" + path);
 	String data=request.getParameter("fname");//boardDetail의 파일이름을 물고옴
 	
 	int find = data.indexOf(".");
 	String fExtend = data.substring(find,data.length());
 	System.out.println(fExtend);
 	
 	File file = new File(path,data);
 	response.setHeader("Content-Disposition","attachment;filename="+data);
 	try{
 		//추상클래스임 new 사용 금지  인풋스트림 자식중에 fileInputStream으로 사용할것
 		InputStream is = new FileInputStream(file);
 		//Calendar cal = new Calendar()안됨-> 추상 ㄱ까보면 abstract void add(1,2)
 		//해결 -> Calendar cal= Calendar.getInstance();
 		//
 		OutputStream os=response.getOutputStream();
 		byte[] bt=new byte[(int)file.length()];//250
 		is.read(bt, 0, bt.length);
 		os.write(bt);
 		is.close();
 		
 	}catch(Exception ex){}
 	
 %>
</body>
</html>