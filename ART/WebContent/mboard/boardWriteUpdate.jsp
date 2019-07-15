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
            <!-- ------------------------게시글 수정시 글쓰는부분 ------------------------------ -->
           	<div id="write-form" class="col-lg-12" >
    			<div id="fh5co-blog">
					<div class="container">
						<form class="was-validated" method="post" action="/ART/g_Edit.do" enctype="multipart/form-data">
			
							<div class="form-row" style="font-size:18pt; color:#DD356E;">
								<div class="col-md-12 mb-3">
										<div class="circle topImg" style="display:inline-block;">
							      			<div style="background-image:url(/ART/storage/${sessionScope.idfile})"></div>
							      		</div>
						      			<span style="color:#FF5733; position:relative; top:-20px; margin-left:20px; font-size:13pt; font-weight:bold;">
						      			${sessionScope.userid}님 내용수정입니다^^!&nbsp;&nbsp;</span>
						      		<br>
									<span style="margin-right:20px;color:#FF5733; font-size:13pt;"> 
										<input type="radio" name="kind" value="해외작품" <c:if test="${dto.m_kind eq '해외작품'}">checked</c:if> > 해외작품
										</span>
									<span style="margin-right:20px;color:#FF5733; font-size:13pt;"> 
										<input type="radio" name="kind" value="국내작품" <c:if test="${dto.m_kind eq '국내작품'}">checked</c:if> > 
										국내작품
									</span>
									<span style="margin-right:20px;color:#FF5733; font-size:13pt;"> 
										<input type="radio" name="kind" value="국내전시" <c:if test="${dto.m_kind eq '국내전시'}">checked</c:if> > 
										국내전시
									</span>
									<span  style="color:#FF5733; font-size:13pt;"> 
										<input type="radio" name="kind" value="인원모집" <c:if test="${dto.m_kind eq '인원모집'}">checked</c:if> > 
										인원모집
									</span>
									
						  			<input type="hidden" name="userid" value="${sessionScope.userid}">
						  			<input type="hidden" name="idfile" value="${sessionScope.idfile}">
						  			<input type="hidden" name="m_num" value="${dto.m_num}">
								</div>
								<div class="col-md-12 mb-3">
									<label for="validationServer04">Title</label> 
									<input type="text"
										class="form-control is-invalid" style="border:1px solid #FF5733" name="title";  
										value="${dto.m_title}" id="validationServer04"
										required>
									<div class="invalid-feedback"></div>
								</div>
			
								<div class="col-md-12 mb-3" style="height:100%;">
									<label for="validationTextarea">Context</label>
									<textarea  class="form-control is-invalid" style="min-height:700px; padding:30px; border:1px solid #FF5733";
										name="content" id="validationTextarea" required>${dto.m_con}</textarea>
									<div class="invalid-feedback"></div>
								</div>
								<div class="custom-file col-md-12 mb-3">
									<input type="file" name="file1" class="custom-file-label col-md-12 mb-3" id="validatedCustomFile"  required="required">
								</div>
								<div class="col-md-12 mb-3" style="text-align:right; margin-top:35px;"> 
									<input class="btn" type="submit" style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block;" value="저장" >
									<input class="btn" type="submit" style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block;" value="취소" >
								</div>
								
							</div>
						</form>
					</div>
				</div>
    		</div>
    		<!-- ------------------------게시글 수정시 글쓰는부분 ------------------------------ -->
         </div>
      </div>
   </main>
        
        <aside class="col-lg-4">
          <!-- Widget [Search Bar Widget]-->
          <div class="widget search">
            <header>
              <h3 class="h6">Search the blog</h3>
            </header>
            <form action="m_list.do" class="search-form">
              <div class="form-group" style="padding-bottom:20px;">
              <div style="float:left;" >
              <select name="keyfield"  style="margin-right:10px; border: 0px solid #999; color:#444; font-size:14px;" onchange="changeclear();" >
	        	<option value="">전체</option>
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
              <h3 class="h6">Latest Posts</h3>
            </header>
            <div class="blog-posts"><a href="#">
                <div class="item d-flex align-items-center">
                  <div class="image"><img src="img/small-thumbnail-1.jpg" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                    <div class="d-flex align-items-center">
                      <div class="views"><i class="icon-eye"></i> 500</div>
                      <div class="comments"><i class="icon-comment"></i>12</div>
                    </div>
                  </div>
                </div></a><a href="#">
                <div class="item d-flex align-items-center">
                  <div class="image"><img src="img/small-thumbnail-2.jpg" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                    <div class="d-flex align-items-center">
                      <div class="views"><i class="icon-eye"></i> 500</div>
                      <div class="comments"><i class="icon-comment"></i>12</div>
                    </div>
                  </div>
                </div></a><a href="#">
                <div class="item d-flex align-items-center">
                  <div class="image"><img src="img/small-thumbnail-3.jpg" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                    <div class="d-flex align-items-center">
                      <div class="views"><i class="icon-eye"></i> 500</div>
                      <div class="comments"><i class="icon-comment"></i>12</div>
                    </div>
                  </div>
                </div></a></div>
          </div>
          <!-- Widget [Categories Widget]-->
          <div class="widget categories">
            <header>
              <h3 class="h6">Categories</h3>
            </header>
            <div class="item d-flex justify-content-between"><a href="#">Growth</a><span>12</span></div>
            <div class="item d-flex justify-content-between"><a href="#">Local</a><span>25</span></div>
            <div class="item d-flex justify-content-between"><a href="#">Sales</a><span>8</span></div>
            <div class="item d-flex justify-content-between"><a href="#">Tips</a><span>17</span></div>
            <div class="item d-flex justify-content-between"><a href="#">Local</a><span>25</span></div>
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