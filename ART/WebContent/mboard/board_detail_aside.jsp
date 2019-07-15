<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        
    <script type="text/javascript">
   	 function changeclear() {
	  	document.myform.keyword.value="";
	  	document.myform.keyword.focus();
	 }//end
   </script>  
   <style>
		.rect {display:block; width:100%; position:relative;}
		.rect::before {content:""; display:block; padding-top:66%;}
		.rect > *:first-child{position:absolute; width:100%; height:100%; left:0; top:0;
			backround-repeat:no-repeat; background-size:cover; background-position:center;
		}
	</style>
   <% 
    String userid = (String)session.getAttribute("userid");
    String idfile = (String)session.getAttribute("idfile");
    System.out.println("넘어온세션아이디: "+userid);
    System.out.println("넘어온세션아이디얼굴: "+idfile);
    %>
       
  </head>

        <aside class="col-lg-4">
        <!-- Widget [Tags Cloud Widget]-->
      	<%	if ( userid != null ) { %>
      		<div class="widget tags">       
            <header>
              <h3 class="h6">Tags</h3>
            </header>
            <ul class="list-inline">
              <li class="list-inline-item"><a href="#" class="tag" id="write_btn">글쓰기</a></li>
            </ul>
		        <script>
					(function(){
						var myform = document.getElementById("write-form");
						var detail = document.getElementById("detail");
				     	var btn = document.getElementById("write_btn");
				     	btn.addEventListener("click",function(){
				     		var state = this.innerHTML;
				     		if (state == "글쓰기") {
				     			detail.style.display="none";
					     		myform.style.display="";
					     		this.innerHTML="목록보기";
				     		} else {
				     			detail.style.display="flex";
					     		myform.style.display="none";
					     		this.innerHTML="글쓰기";
				     		}
				     	},false);
					})();
				</script>   
          </div>
      	<% } else { %>
      		<div class="widget tags">       
            <header>
              <h3 class="h6">Tags</h3>
            </header>
            <ul class="list-inline">
              <li class="list-inline-item"><a href="/ART/login/login.jsp" class="tag" id="write_btn">글쓰기위해 로그인하세요</a></li>
            </ul>
          </div>
      	<% } %>
      
          
          <!-- Widget [Search Bar Widget]-->
          <div class="widget search">
            <header>
              <h3 class="h6">Search the blog</h3>
            </header>
            <form action="m_list.do" class="search-form">
              <div class="form-group" style="padding-bottom:20px;">
              <div style="float:left;" >
              <select name="keyfield"  style="margin-right:10px; border: 0px solid #999; color:#444; font-size:14px;" onchange="changeclear();" >
	        	<option value="m_title" <c:if test="${skey=='m_title'}">selected</c:if> >제목</option>
	        	<option value="m_con"  <c:if test="${skey=='m_con'}">selected</c:if> >내용</option>
		      </select>
		      </div>
		        <div style="float:left; margin-top:-10px;">
                <input type="search" name="keyword" style="font-size:13px; min-width:200px;" value="${sval}" placeholder="검색하세요">
                </div>
                <button style="float:left; margin-top:-10px; type="submit" class="submit">검색</button>
              </div>
            </form>
          </div>
	          <!-- Widget [Latest Posts Widget]        -->
	          <div class="widget latest-posts">
	            <header>
	              <h3 class="h6">Latest Replies</h3>
	            </header>
	            <div class="blog-posts">
				<c:forEach var="rdto" items="${rLG1}">
	              <a href="g_detail.do?Gidx=${rdto.getUserid()}&Mnum=${rdto.getM_num()}">
	                <div class="item d-flex align-items-center">
	                	<div class="circle detailImg" style="display:inline-block;">
			      			<div style="background-image:url(/ART/storage/${rdto.r_idfile})"></div>
			      		</div>
	                 
	                  <div class="title"><strong>${rdto.r_userid}</strong>
	                    <div class="d-flex align-items-center">
	                      <div class="views" style=" height:23px; overflow:hidden;">
	                        <i class="icon-comment"></i>
	                        ${rdto.r_con}
	                      </div>
	                    </div>
	                  </div>
	                </div>
	            </a>
	            </c:forEach>
	          </div>
	          </div>
	        
          <!-- Widget [Categories Widget]-->
          <div class="widget categories">
            <header>
              <h3 class="h6">Categories</h3>
            </header>
            <div class="item d-flex justify-content-between">
               <a href="/ART/m_list.do?kind=해외작품">해외작품</a>
               <span>${kindA}</span>
            </div>
            <div class="item d-flex justify-content-between">
            <a href="/ART/m_list.do?kind=국내작품">국내작품</a>
            <span>${kindB}</span>
            </div>
            <div class="item d-flex justify-content-between">
            <a href="/ART/m_list.do?kind=국내전시">국내전시</a>
            <span>${kindC}</span>
            </div>
            <div class="item d-flex justify-content-between">
            <a href="/ART/m_list.do?kind=인원모집">인원모집</a>
            <span>${kindD}</span>
            </div>
            <!-- <div class="item d-flex justify-content-between">
            <a href="/ART/m_list.do?kind=">기타</a>
            <span>${kindE}</span>
            </div> -->
          </div>
          <!-- Widget [Tags Cloud Widget]-->
          <div class="widget tags">       
            <header>
              <h3 class="h6">Tags</h3>
            </header>
            <ul class="list-inline">
              <li class="list-inline-item"><a href="#" class="tag">#Business</a></li>
              <li class="list-inline-item"><a href="#" class="tag">#Technology</a></li>
              <li class="list-inline-item"><a href="#" class="tag">#Fashion</a></li>
              <li class="list-inline-item"><a href="#" class="tag">#Sports</a></li>
              <li class="list-inline-item"><a href="#" class="tag">#Economy</a></li>
            </ul>
          </div>
        </aside>
