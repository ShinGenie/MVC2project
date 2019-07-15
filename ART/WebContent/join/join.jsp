<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    
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
    <link rel="stylesheet" href="vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
    
    <!-- 여기 쓰인 스크립트  -->
    <script type="text/javascript" src="../script/member.js"></script>
   
</head>

<body >
	<jsp:include page="/include/header.jsp"></jsp:include>
	
    <div class="page-wrapperp-t-150 p-b-100 font-poppins" 
                style="background-image:url('/ART/img/bg1.jpg');  min-height: 100%;
                background-position: center; background-size: cover; position:relative;">
                <div class="card-body" style=" position:relative; top:100px; width:680px; min-height:500px; margin:0 auto; background-color: #fff; padding:50px;">
                    <h4 style="color:#FF5733; margin-bottom:30px;">회원가입</h4>
                    <form method="POST" name="frm"  enctype="multipart/form-data" action="/ART/join.do" onsubmit="return joinCheck();">
                        <div class="row row-space" >
                        	<div class="col-6">
                                <div class="input-group">
                                    <label class="label">이름</label>
                                    <input class="input--style-4" type="text" name="name"  autofocus="autofocus" required > <!-- [\w]{4,20} pattern="^[가-힣]{2,4}$"-->
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">등록사진</label>
                                    <input class="input--style-4" type="file" name="idfile"  required >
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">ID</label>
                                    <input class="input--style-4" type="text" name="userid" required >
                                    <input class="input--style-4" type="hidden" name="reid" readonly >
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                            		<input class="btn" style="background-color:#FF5733; width:100px; color:#fff; margin-top:35px;" type="button" value="중복체크" onclick="idCheck();" >
                                </div>
                            </div>
                            
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">암호입력</label>
                                    <input class="input--style-4" type="password" name="pwd" required >
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">암호확인</label>
                                    <input class="input--style-4" type="password" name="pwd1"  >
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">생일</label>
                                    <div class="input-group">
                                        <input class="input--style-4 js-datepicker" type="text" name="birth" id="birth" required >
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">성별</label>
                                    <div class="input-group">
                                        <label class="radio-container m-r-45" style="margin-top:15px;">남자
                                            <input type="radio" name="gender" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container" style="margin-top:15px;">여자
                                            <input type="radio" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">이메일</label>
                                    <input class="input--style-4" type="email"  name="email" required >
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">전화번호</label>
                                    <input class="input--style-4" type="tel" name="phone" placeholder="" required pattern="^\d{3}-\d{3,4}-\d{4}$">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">주소</label>
                                    <input class="input--style-4" style="width:100%;" type="text" name="post1" onclick="goPopup();" >
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <input class="btn" style="background-color:#FF5733; width:100px; color:#fff; margin-top:35px;" type="button" onclick="goPopup();" value="검색">
                                </div>
                            </div>
                        </div>
                      <div class="row row-space">
                       <div class="col-6">
                            <label class="label" style="display:block;">Subject</label><p>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="subject" required >
                                    <option disabled="disabled">관심분야</option>
                                    <option>해외작품</option>
                                    <option>국내작품</option>
                                    <option>작품전시</option>
                                    <option>멤버모임</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                      </div>
                        <div class="col-6">
                             <label class="label">등급</label>
                             <div class="input-group">
                                 <label class="radio-container m-r-45" style="margin-top:25px;">일반회원
                                     <input type="radio" name="admin" value="0" checked disabled>
                                     <span class="checkmark"></span>
                                 </label>
                                 <label class="radio-container" style="margin-top:25px;">관리자
                                     <input type="radio" name="admin" value="1" disabled>
                                     <span class="checkmark"></span>
                                 </label>
                             </div>
                     </div>
                   </div>
                   
                      <div style="margin-top:35px; text-align:center;">
                          <input class="btn" type="submit" name="btn-sumit" style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block;" value="확인" >
                          <input class="btn" type="reset" style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block;" value="취소" >
                          
                      </div>
                      
                            
                     </div>
                  </form>
                </div>
            </div>
   


    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->