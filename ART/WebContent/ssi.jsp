<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
   <meta name="description" content="html5">
   <meta name="author" content="author">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>  </title>
   <style type="text/css">
	  *{font-size:20pt; font-weight:bold;  font-family: Comic Sans MS ;  }
	  a{font-size:20pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
	  a:hover{font-size:24pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
</head>
<body>
 <%!
   Connection CN; //CN필드 DB서버정보, 명령어생성할때 참조
   Statement ST; //ST=CN.createStateme()명령어생성
   PreparedStatement PST; //PST=CN.prePareStatement("쿼리문")    
   ResultSet RS; //RS=ST.executeQuery("select~"); 조회한결과를 RS기억
   
   int Gsabun, Gpay ;//전역변수=필드=filed=멤버변수 
   String Gname, Gtitle ;
   java.util.Date Gnalja ; 
   int Gtotal=27, Stotal=27; //전체데이터갯수, 조회데이터갯수
   String msg ; //msg="insert~"  msg="select~" msg="delete~" msg="update~"
   
   //06-03-월요일댓글에 필요한 전역변수
   int Rrn, Rnum, Rsabun; //댓글rownum, 댓글번호, 댓글사번
   String Rwriter, Rcontent; //댓글저자, 댓글내용
   int Rtotal=27 ; // 댓글갯수 
 %>	
 
<%
 try{
 //순서1 오라클드라이브 라이브러리 로드, database마다 기술하는 방법달라요
 Class.forName("oracle.jdbc.driver.OracleDriver");
 
 //순서2 Database서버정보,계정id,비밀번호를 CN에게 기억시켜서 나중에 명령어생성
 String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
 CN=DriverManager.getConnection(url,"system", "oracle");
 System.out.println("db연결성공 db작업가능 05-28-화요일 "); //나중에주석처리
 }catch(Exception ex){System.out.println("db연결실패:" +ex); }
%>
 
 
</body>
</html>







