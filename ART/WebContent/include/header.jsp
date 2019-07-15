<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<style>
	.circle {display:block; width:100%; position:relative;}
	.circle::before {content:""; display:block; padding-top:100%;}
	.circle > *:first-child{position:absolute; width:100%; height:100%; left:0; top:0;
		backround-repeat:no-repeat; background-size:cover; background-position:center; border-radius: 50%;
	}
	.circle.topImg {width:60px; height:60px;}
	.circle.avatar {width:40px; height:40px;}
	.circle.sideImg {width:60px; height:60px;}
	.circle.sideImg > *:first-child {border-radius: 0;}
	.circle.detailImg + div,
	.circle.sideImg + div { flex: 1; margin-left: 10px;}
	.circle.detailImg {width:55px; height:55px;}
	
	
	.navbar .navbar-nav .nav-item  {padding-top:12px;}
	.navbar .navbar-nav .nav-item:last-child{padding-top:0;}
</style>

    <header class="header" style=" position: sticky; top: 0px; background-color: #fff; z-index:9;">
      <!-- Main Navbar-->
      <nav class="navbar navbar-expand-lg" >
        <div class="search-area">
          <div class="search-area-inner d-flex align-items-center justify-content-center">
            <div class="close-btn"><i class="icon-close"></i></div>
            <div class="row d-flex justify-content-center">
              <div class="col-md-8">
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <!-- Navbar Brand -->
          <div class="navbar-header d-flex align-items-center justify-content-between">
            <!-- Navbar Brand --><a href="/ART/main/main.jsp" class="navbar-brand" style="font-size:22pt;">GRAFFITI ART</a>
            <!-- Toggle Button-->
            <button type="button" data-toggle="collapse" data-target="#navbarcollapse" aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span></span><span></span><span></span></button>
          </div>
          <!-- Navbar Menu -->
          <div id="navbarcollapse" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
              	<a href="/ART/main/main.jsp" class="nav-link active ">Home</a>
              </li>
              <li class="nav-item">
              	<a href="/ART/m_list.do" class="nav-link ">Blog</a>
              </li>
              <li class="nav-item">
              	<a href="#" class="nav-link " style="margin-right:50px">Contact</a>
              </li>
            
         	
         	<%
            String userid = (String)session.getAttribute("userid");
            String idfile = (String)session.getAttribute("idfile");
            System.out.println("로그인창에서 넘어온userid: "+ userid);
            System.out.println("넘어온세션idfile: "+ idfile);
            
         	if(session.getAttribute("userid")==null){
         		%>
         		
         		   <li class="nav-item active">
         		   	<a href="/ART/join/join.jsp" style="margin-right:20px; margin-top:7px;">&nbsp;&nbsp;Join</a>
         		   </li>
         		  <li class="nav-item active">
         		  	<a href="/ART/login/login.jsp" style="margin-right:20px; margin-top:19px;">Login</a>
         		  </li>
         		         		
         	<%}else{%>
         	
			      <li class="nav-item active">
			        <a href="/ART/logout/logout.jsp" style="margin-right:20px; margin-top:7px;">Logout</a>
			      </li>
			      <li class="nav-item">
			        <a href="/ART/logout/logout.jsp" style="margin-right:20px; margin-top:7px;">Mypage</a>
			      </li>
			      <li class="nav-item">
			        <span style="color:#FF5733; margin-right:20px; margin-top:7px; font-weight:bold;"><%=session.getAttribute("userid")%>님 환영합니다&nbsp;&nbsp;</span>
			      </li>
			      <li class="nav-item  ">
			      	<div class="circle topImg">
			      		<div style="background-image:url(/ART/storage/<%=idfile%>)"></div>
			      	</div>
			       <% // <!-- <img src="/ART/storage/<%=idfile % > " style="align:center; width: auto; height:50px; border-radius:25px; " alt="personid"> -->%>
			      </li>
         	<%}%>
         	</ul>
          </div>
        </div>
      </nav>
    </header>
    
   
 