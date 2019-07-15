<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<% request.setCharacterEncoding("UTF-8"); %>
<script type="text/javascript" src="/ART/script/member.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

     <form method="get" action="idCheck.do"name="frm">
            아이디<input type="text" name="userid" value="${userid}" />
     <input type="submit" value="중복체크"/><br>
     <c:if test="${result==1}">
     	<script type="text/javascript">
     	opener.document.frm.userid.value="";
     	</script>
     	${userid}는 이미 사용중인 아이디입니다.
        <input type="button" value="확인" onclick="idcancle()">
     </c:if>
     <c:if test="${result==0}">
     	${userid}는 사용 가능한 아이디입니다.<!-- 자바스크립트로 가자 -->
     	<input type="button" value="사용" onclick="idok('${userid}')">
     	<input type="button" value="취소" onclick="idcancle()">
     </c:if>
     </form>
     <!-- 
     window창에서 실제 보이는 화면이다.
     result == 1이면 존재하는 경우 
     result == 0이면 해당아이디 존재하지않아서 사용할수 있다.
     	해당폼은 idcheckServlet.java의 doGet()
     	으로 다시 전송하여 반복 중복 확인할수 있게 설계했다.
     	해당아이디를 사용하려고 결정했으면 사용버튼을 클릭한다. 
     	이때 member.js의 idok()메서드가 실행된다.
      -->
</body>
</html>