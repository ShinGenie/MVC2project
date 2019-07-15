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
  
  <body>
     <!-- head Section-->
    <jsp:include page="/include/header.jsp"></jsp:include>
    
    <div class="container">
      <div class="row">
        <!-- Latest Posts -->
        <main class="posts-listing col-lg-8"> 
          <div class="container">
            <div class="row">
             <!-- writer.jsp -->
           	<div id="write-form" class="col-lg-12" style="display:none;">
    			<jsp:include page="boardWrite.jsp"></jsp:include>
    		</div>
              <!-- post -->
            <div id="list" style="display:flex; flex-wrap:wrap; width:100%;">
            <c:forEach var="dto" items="${LG}">
              <div class="post col-xl-6">
                <div class="post-meta d-flex frame">
                	<a href="g_detail.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}" class="rect">
                		<div style="background-image:url(../ART/storage/${dto.getM_file()});">
                		</div>
                	</a>
               	</div>
                <div class="post-details">
                  <div class="post-meta d-flex justify-content-between">
                    <div class="date meta-last">${dto.getMdate()}</div>
                    <div class="category">
	                    <a href="g_detail.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}">
	                    ${dto.getM_kind()}
	                    </a>
                    </div>
                  </div>
                  <div class="post-meta d-flex justify-content-between" style="overflow:hidden; height:30px;">
                  <a href="g_detail.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}">
                    <h3 class="h4">${dto.getM_title()}</h3>
                    </a>
                  </div>
                  <div class="d-flex justify-content-between text-muted" style="overflow:hidden; height:25px; margin-bottom:10px;">
                  <p>${dto.getM_con()}</p>
                  </div>
                  <div class="post-footer d-flex align-items-center"><a href="g_detail.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}" class="author d-flex align-items-center flex-wrap">
                      <div class="avatar circle" >
			      		<div style="background-image:url(/ART/storage/${dto.getIdfile()})"></div>
                      </div>
                      
                      <div class="title"><span>${dto.getUserid()}</span></div></a>
                    <div class="comments" ><i class="icon-comment"></i>${dto.getM_replynum()}</div>
                    <div class="views" ><i class="icon-eye"></i> ${dto.m_hit}</div>
	                	<div style="align:right; position:absolute; right:14px;">

				                	<c:if test="${sessionScope.userid eq dto.getUserid()}">
					                	<span style="margin-right:10px;">
					                		<a href="/ART/g_preEdit.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}" class="tag">
					                		[수정]
					                		</a>
					                	</span>
					                    <span style="margin-right:10px;">
					                    	<a href="g_delete.do?Gidx=${dto.getUserid()}&Mnum=${dto.getM_num()}" class="tag">[삭제]</a>
					                    </span>
				                    </c:if>
				                    <c:if test="${sessionScope.userid ne dto.getUserid()}">
					                    <span>
					                    	<a href="/ART/m_list.do" class="tag">[전체리스트]</a>
					                    </span>
			                    	</c:if>
	                    </div>
                  </div>
                </div>
              </div>
             </c:forEach>
             </div>
            </div>
            
            <!-- Pagination -->           
           <nav id="pagination" aria-label="Page navigation example">
              <ul class="pagination pagination-template d-flex justify-content-center">
                <li class="page-item">
	                <c:if test="${startpage>10}">
		                <a href="/ART/m_list.do?Gnum=${startpage-10}" class="page-link">
		                	<i class="fa fa-angle-left"></i>
		                </a>
	                </c:if>
                </li>
	            <c:forEach var="i" begin="${startpage}" end="${endpage}">
		            <c:choose>
			            <c:when test="${i==pageNUM}">
		            		<li class="page-item"><span class="page-link">${i}</span></li>
			            </c:when>
			            <c:otherwise>
			            	<li class="page-item">
			            	<a href="/ART/m_list.do?Gnum=${i}${returnpage}" class="page-link active">${i}</a>
			            	</li>          
			            </c:otherwise>
		            </c:choose>
	            </c:forEach>
            	<li class="page-item">
            		<c:if test="${endpage<pagecount}">
		            	<a href="/ART/m_list.do?Gnum=${startpage+10}" class="page-link"> 
		            		<i class="fa fa-angle-right"></i>
		            	</a>
	            	</c:if>
            	</li>
            </ul>
            </nav>
           
            <!-- <nav aria-label="Page navigation example">
              <ul class="pagination pagination-template d-flex justify-content-center">
                <li class="page-item"><a href="#" class="page-link"> <i class="fa fa-angle-left"></i></a></li>
               
                <li class="page-item"><a href="#" class="page-link"> <i class="fa fa-angle-right"></i></a></li>
              </ul>
            </nav>    -->

          </div><!-- 컨테이너 -->
        </main>
        <jsp:include page="board_list_aside.jsp"></jsp:include>
      </div>
    </div>
    <!-- Page Footer-->
    <footer class="main-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="logo">
              <h6 class="text-white">Bootstrap Blog</h6>
            </div>
            <div class="contact-details">
              <p>53 Broadway, Broklyn, NY 11249</p>
              <p>Phone: (020) 123 456 789</p>
              <p>Email: <a href="mailto:info@company.com">Info@Company.com</a></p>
              <ul class="social-menu">
                <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-instagram"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-behance"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
            <div class="menus d-flex">
              <ul class="list-unstyled">
                <li> <a href="#">My Account</a></li>
                <li> <a href="#">Add Listing</a></li>
                <li> <a href="#">Pricing</a></li>
                <li> <a href="#">Privacy &amp; Policy</a></li>
              </ul>
              <ul class="list-unstyled">
                <li> <a href="#">Our Partners</a></li>
                <li> <a href="#">FAQ</a></li>
                <li> <a href="#">How It Works</a></li>
                <li> <a href="#">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
            <div class="latest-posts"><a href="#">
                <div class="post d-flex align-items-center">
                  <div class="image"><img src="img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>Hotels for all budgets</strong><span class="date last-meta">October 26, 2016</span></div>
                </div></a><a href="#">
                <div class="post d-flex align-items-center">
                  <div class="image"><img src="img/small-thumbnail-2.jpg" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>Great street atrs in London</strong><span class="date last-meta">October 26, 2016</span></div>
                </div></a><a href="#">
                <div class="post d-flex align-items-center">
                  <div class="image"><img src="img/small-thumbnail-3.jpg" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>Best coffee shops in Sydney</strong><span class="date last-meta">October 26, 2016</span></div>
                </div></a></div>
          </div>
        </div>
      </div>
      <div class="copyrights">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <p>&copy; 2017. All rights reserved. Your great site.</p>
            </div>
            <div class="col-md-6 text-right">
              <p>Template By <a href="https://bootstrapious.com/p/bootstrap-carousel" class="text-white">Bootstrapious</a>
                <!-- Please do not remove the backlink to Bootstrap Temple unless you purchase an attribution-free license @ Bootstrap Temple or support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :)                         -->
              </p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>