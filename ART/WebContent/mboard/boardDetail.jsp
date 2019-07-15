<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %> <!-- 2019.05.28.화요일  -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File"%>
<%@ page import="join.JoinDAO" %>
<%@ page import="join.JoinDTO" %>

<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Blog - B4 Template by Bootstrap Temple</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

  </head>
  <body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %> <!-- 2019.05.28.화요일  -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File"%>
<%@ page import="join.JoinDAO" %>
<%@ page import="join.JoinDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>

<% String aUserid=(String)session.getAttribute("userid");
   String bIdfile=(String)session.getAttribute("idfile");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Blog - B4 Template by Bootstrap Temple</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="../css/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="../vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="../img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
  
   <jsp:include page="/include/header.jsp"></jsp:include>
   
   
    <div class="container">
      <div class="row">
        <!-- Latest Posts -->
        <main class="post blog-post col-lg-8" > 
          <div class="container">
          <div id="write-form" class="col-lg-12" style="display:none;">
		   <jsp:include page="boardWrite.jsp"></jsp:include>
		   </div>
            <div class="post-single" id="detail" style="display:flex; flex-wrap:wrap; width:100%;">
              <div class="post-thumbnail"><img src="/ART/storage/${dto.m_file}" alt="..." class="img-fluid"></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="category"><a href="#">${dto.m_kind}</a></div>
                </div>
                <h1>${dto.m_title}<a href="#"><i class="fa fa-bookmark-o"></i></a></h1>
                <div class="post-footer d-flex align-items-center flex-column flex-sm-row"><a href="#" class="author d-flex align-items-center flex-wrap">
                    <div class="avatar"><img src="/ART/storage/${dto.idfile}"  alt="..." class="img-fluid"></div>
                    <div class="title"><span>${dto.userid}</span></div></a>
                  <div class="d-flex align-items-center flex-wrap">       
                    <div class="date"><i class="icon-clock"></i> 2 mon ago</div>
                    <div class="views"><i class="icon-eye"></i> ${dto.m_hit}</div>
                    <div class="comments "><i class="icon-comment"></i>${dto.m_replynum}</div>
                    <div class="comments meta-last" style="position:absolute; right:20px;">
                    	<a href="/ART/mboard/imageDownload.jsp?fname=${dto.m_file}">
                    	<i class="icon-comment"></i>${dto.m_file}&nbsp;&nbsp;file size: ${dto.m_fsize}
                    	</a>
                    </div>
                  </div>
                </div>
                <div class="post-body">
                  <p class="lead">${dto.m_con}</p>
				 </div>
                <div class="post-tags">
                  <c:if test="${sessionScope.userid eq dto.getUserid()}">
	                <a href="/ART/g_preEdit.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}" class="tag">#수정</a>
                   	<a href="g_delete.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}" class="tag">#삭제</a>
                   	<a href="/ART/m_list.do" class="tag">#전체리스트</a>
                   	<a href="/ART/main/main.jsp" class="tag">#홈으로</a>
                  </c:if>
                  <c:if test="${sessionScope.userid ne dto.getUserid()}">
                    <a href="/ART/m_list.do" class="tag">#전체리스트</a>
                   	<a href="/ART/main/main.jsp" class="tag">#홈으로</a>
                  </c:if>
                </div>
               
                    
          <!-----------------댓글파트-------------------------->
		  <jsp:include page="/mboard/board_reply.jsp"></jsp:include>
              </div>
            </div>
          </div>
        </main>
        
       <jsp:include page="board_detail_aside.jsp"></jsp:include>
       
      </div>
    </div>
    <!-- Page Footer-->
   <jsp:include page="../include/footer.jsp"></jsp:include>
    <!-- JavaScript files-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/popper.js/umd/popper.min.js"> </script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="../vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>
