<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<% String a = (String)session.getAttribute("userid"); %>
<% String b = (String)session.getAttribute("idfile"); %>
<% System.out.println("리플라이어세 세션받은 아이디: "+ a); %>
<% System.out.println("리플라이어세 세션받은 얼굴파일: "+ b); %>

<script type="text/javascript">

var rnum;
function re_edit(num,r_email,r_con){
	rnum=num; // 리플고유번호 ->업데이트할때 필요
	rfmt.r_email.value = r_email;
	rfmt.r_con.value = r_con;
	rfmt.bt_save.value = "댓글수정";
	//document.rfmt.getElementById("btn-reply").value = "댓글수정";
 }//end

function re_save(){
	 
	var r_btn = document.rfmt.bt_save.value;
	var r_email = document.rfmt.r_email.value;
	var r_con =  document.rfmt.r_con.value;
	
	if(r_btn=="저장"){
		
			if(r_email==""||r_email==null){
				alert("이메일을 적어주세요");
				document.rfmt.r_email.focus();
				return false;
			}
			if(r_con==""||r_con==null){
				alert("댓글내용을 적어주세요");
				document.rfmt.r_con.focus();
				return false;
			}
			
			document.rfmt.submit();
		
	}else if(r_btn=="댓글수정"){
		rfmt.bt_save.value="저장";
		document.rfmt.method="post";
		document.rfmt.action="/ART/r_edit.do?Rnum=" + rnum;
		document.rfmt.submit();
		
	}
	
}
 
</script>

<c:if test="${sessionScope.userid ne dto.getUserid()}">
 <!-----------------댓글입력파트-------------------------->
 <div class="add-comment">
  <header>
    <h3 class="h6" id="reply_title" style="display:visible">댓글</h3>
  </header>
  <div id="replyform">
  	  <form action="/ART/r_insert.do" name="rfmt" class="commenting-form" style="display:block;"> <!-- 댓글입력란 -->
     <div class="row">
       <div class="form-group col-md-6">
         <input type="text" name="r_userid" id="r_userid" placeholder="Name" value="${sessionScope.userid}" class="form-control" readonly="readonly">
         <input type="hidden" name="r_idfile" id="r_idfile" value="${sessionScope.idfile}" class="form-control" readonly="readonly">
         <input type="hidden" name="b_userid" id="b_userid" value="${rdata}" class="form-control" readonly="readonly">
         <input type="hidden" name="m_num" id="m_num" value="${m_num}" class="form-control" readonly="readonly">
       </div>
       <div class="form-group col-md-6">
         <input type="email" name="r_email" id="r_email" placeholder="ex)abc@gmail.com" class="form-control" >
       </div>
       <div class="form-group col-md-12">
         <textarea name="r_con" id="r_con" placeholder="내용" class="form-control"></textarea>
       </div>
       <div class="form-group col-md-12" style="text-align:right; margin-top:25px;">
       
          <input type="button" name="bt_save" 
                 class="btn btn-secondary"  style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block; " 
                 onClick="re_save();"  value="저장" id="rsave" >
          <input type="reset" id="btn-reply1" class="btn btn-secondary" 
                 style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block; border:0px" 
                 value="취소">
       </div>
     </div>
   </form>
 </div>
</div>
</c:if>

<c:if test="${sessionScope.userid eq null}">
	<script>
	document.getElementById("reply_title").style.display="none";
	rfmt.style.display="none";
	</script>
</c:if>

<!------------------------- 댓글보여지는 부분------------------------->

 <div class="post-comments">
	  <header>
	    <h3 class="h6">댓글수<span class="no-of-comments">${Gtotal}</span></h3>
	  </header>
	  <c:forEach var="rdto" items="${rLG}">
		  <div class="post-comments">
			<div class="comment">
			  <div class="comment-header d-flex justify-content-between">
			    <div class="user d-flex align-items-center">
			      <div class="image"><img src="../ART/storage/${rdto.r_idfile}" alt="..." class="img-fluid rounded-circle"></div>
			      <div class="title">
			      <strong>${rdto.r_userid}
				      <c:if test="${sessionScope.userid eq rdto.r_userid}">
		                <span class="date" style="position:absolute; right:0; ">
					      <a href="#" onClick="re_edit(${rdto.rnum},'${rdto.r_email}','${rdto.r_con}');">[수정]&nbsp;&nbsp;&nbsp;</a> 
					      <script type="text/javascript">
					      </script>
					      <a href="r_delete.do?Rnum=${rdto.rnum}&Gidx=${rdto.userid}&Mnum=${rdto.m_num}">[삭제]</a>
					    </span>
	                  </c:if>
			      </strong>
			      <span class="date">${rdto.rdate}</span>
			      </div>
			    </div>
			  </div>
			  <div class="comment-body">
			    <p>${rdto.r_con}</p>
			  </div>
			</div>
		</div>
	</c:forEach>
</div>
<!------------------------- 댓글페이징------------------------->
<nav id="pagination" aria-label="Page navigation example">
<ul class="pagination pagination-template d-flex justify-content-center">
	<li class="page-item">
		<c:if test="${startpage>5}">
			<a href="/ART/g_detail.do?Gnum=${startpage-5}&Gidx=${rdata}&Mnum=${m_num}" class="page-link"><i class="fa fa-angle-left"></i>[prev]</a>
		</c:if>
	</li>
	<c:forEach var="i" begin="${startpage}" end="${endpage}">
		<c:choose>
			<c:when test="${i==pageNUM}">
			<li class="page-item"><span class="page-link">${i}</span></li>
			</c:when>
			<c:otherwise>
			<li class="page-item"><a href="/ART/g_detail.do?Gnum=${i}&Gidx=${rdata}&Mnum=${m_num}" class="page-link active">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
		<li class="page-item">
			<c:if test="${endpage<pagecount}">
			<a href="/ART/g_detail.do?Gnum=${startpage+5}&Gidx=${rdata}&Mnum=${m_num}" class="page-link">[next]
				<i class="fa fa-angle-right"></i></a>
			</c:if>
		</li>	
	</ul>
</nav>





