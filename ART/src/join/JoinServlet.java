package join;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import join.JoinDAO;
import join.JoinDTO;
import login.LoginDAO;

import java.io.File;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	public JoinServlet() {
        super();
    }
	
	//login.jsp에서 왔다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//join.jsp로 가서 데이터 받아오자.
		request.getRequestDispatcher("/join/join.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		ServletContext sct = getServletContext();
		HttpSession session = request.getSession();

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
		   
		   JoinDAO dao = new JoinDAO();
		   JoinDTO dto = new JoinDTO();
		   dto.setUserid(userid);	
		   dto.setPwd(pwd);
		   dto.setName(name);		dto.setPhone(phone);
		   dto.setBirth(birth);		dto.setCatagory(catagory);
		   dto.setGender(gender);	dto.setPost1(post1);
		   dto.setEmail(email); 	dto.setIdfile(idfile);	
		   dto.setFsize(fsize);
		   
		   String sUserid = dto.getUserid();
		   String sIdfile = dto.getIdfile();
		   
		   LoginDAO ldao = new LoginDAO();
		   
			if (dao.dbInsert(dto)==1) {
				session.setAttribute("userid", sUserid);
				session.setAttribute("pwd", pwd);
				session.setAttribute("idfile", sIdfile);
				session.setAttribute("email", email);
				
				ldao.dbinsert(sUserid, pwd, sIdfile);
			}
			request.getRequestDispatcher("main/main.jsp").forward(request, response);

	}

}
