<%@ page language="java" contentType="text/html; charset=UTF-8"%>


	<div id="fh5co-blog">
		<div class="container">
			<form class="was-validated" method="post" action="g_insert.do" enctype="multipart/form-data">

				<div class="form-row" style="font-size:18pt; color:#DD356E;">
					<div class="col-md-12 mb-3">
				  <% 
					String userid = (String)session.getAttribute("userid");
	                String idfile = (String)session.getAttribute("idfile");
	                System.out.println("로그인창에서 넘어온userid: "+ userid);
	                System.out.println("넘어온세션idfile: "+ idfile);
				    %>
						<div class="circle topImg" style="display:inline-block;">
			      			<div style="background-image:url(/ART/storage/<%=idfile%>)"></div>
			      		</div>
			      		<span style="color:#FF5733; position:relative; top:-20px; margin-left:20px; font-size:13pt;"><%=session.getAttribute("userid")%>님 글올려주세요^^!&nbsp;&nbsp;</span>
			      		<br>
			  			
						
						<span style="margin-right:20px;color:#FF5733; font-size:13pt;"> <input type="radio" name="kind" value="해외작품"> 해외작품</span>
						<span style="margin-right:20px;color:#FF5733; font-size:13pt;"> <input type="radio" name="kind" value="국내작품"> 국내작품</span>
						<span style="margin-right:20px;color:#FF5733; font-size:13pt;"> <input type="radio" name="kind" value="국내전시"> 국내전시</span>
						<span  style="color:#FF5733; font-size:13pt;"> <input type="radio" name="kind" value="인원모집"> 인원모집</span>
						
			  			<input type="hidden" name="userid" value="<%=userid%>">
			  			<input type="hidden" name="idfile" value="<%=idfile%>">
					</div>
					<div class="col-md-12 mb-3" >
						<label for="validationServer04" style="font-size:15pt; color:#FF5733">Title</label> 
						<input type="text"
							class="form-control is-invalid" style="border:1px solid #FF5733" name="title" id="validationServer04"
							placeholder="title" required>
						<div class="invalid-feedback"></div>
					</div>

					<div class="col-md-12 mb-3" style="height:100%;">
						<label for="validationTextarea" style="font-size:15pt; color:#FF5733">Context</label>
						<textarea  class="form-control is-invalid" style="min-height:700px; border:1px solid #FF5733";
							name="content" id="validationTextarea" placeholder="your STORIES" required></textarea>
						<div class="invalid-feedback"></div>
					</div>
					<div class="custom-file col-md-12 mb-3">
						<input type="file" name="file1" class="custom-file-label col-md-12 mb-3" id="validatedCustomFile" required="required">
					</div>
					<!-- <div class="custom-file col-md-12 mb-3">
						<input type="file" name="file1" class="custom-file-input" placeholder="ㅇㅇ"
							id="validatedCustomFile" required> 
							 <label class="custom-file-label" for="validatedCustomFile">
							<!-- Choose file...
							</label>
							</div>-->
					<div class="col-md-12 mb-3" style="text-align:right; margin-top:35px;"> 
					<input class="btn" type="submit" style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block;" value="저장" >
					<input class="btn" type="submit" style="background-color:#FF5733; width:100px; color:#fff;  display:inline-block;" value="취소" >
					</div>
					
				</div>
			</form>
		</div>
	</div>
