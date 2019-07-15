package join;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;// application 객체
import com.oreilly.servlet.MultipartRequest; //객체를 위해서 임포트함
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



	@WebServlet("/j_insert.do")
	public class JoinInsertController extends HttpServlet {
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doUser(request,response);//필수호출
		}//end

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doUser(request,response);//필수호출
		}//end
		
		@SuppressWarnings("null")
		public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter(); // 웹으로 출력
			out.println("<font size=7 color=blue><b>G_insertController.java</b></font><br>");
			System.out.println("JoinInsertController.java");
			out.println("<img src=images/last.png width=300 height=200><p>");
			
			ServletContext sct = getServletContext();

			String path=sct.getRealPath("storage");
			   //String path=application.getRealPath("storage");
			   System.out.println("경로 " + path );
			   int size=1024*1024*7 ; 
			   
			   DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
			   MultipartRequest mr=new MultipartRequest(request,path,size,"UTF-8",dfr);
			  
			   String userid=mr.getParameter("userid");
			   String pwd=mr.getParameter("pwd");
			   String name=mr.getParameter("name");
			   String phone=mr.getParameter("phone");
			   String birth=mr.getParameter("birth");
			   String catagory=mr.getParameter("catagory");
			   String gender=mr.getParameter("gender");
			   String post1=mr.getParameter("post1");
			   String email=mr.getParameter("email");
			   String idfile=mr.getFilesystemName("idfile");
			   File ff=mr.getFile("idfile");
			   int fsize = (int)ff.length(); // file크기
			   
			   System.out.println("파일의 크기=" + fsize);
			   out.println("파일의 크기=" + fsize + "<br>"); 
			 
			   JoinDAO dao = new JoinDAO();
			   JoinDTO dto = new JoinDTO();
			   
			   dto.setUserid(userid);	dto.setPwd(pwd);
			   dto.setName(name);		dto.setPhone(phone);
			   System.out.println("확인!5:08");
			   dto.setBirth(birth);		dto.setCatagory(catagory);
			   dto.setGender(gender);	dto.setPost1(post1);
			   dto.setEmail(email); 	dto.setIdfile(idfile);	
			   dto.setFsize(fsize);
			   
			   dao.dbInsert(dto);
			   ArrayList<JoinDTO> GS = dao.dbSelect();
			   request.setAttribute("GS", GS);
			
				//controll에서 controll로 이동
				//response.sendRedirect(".do?Gidx="+); //userid값 가져가야함.
			   
				RequestDispatcher dis = request.getRequestDispatcher("/login/loginAct.jsp");
				dis.forward(request, response);
				System.out.println("확인!5:18");
		
		   
		}
	}//class END