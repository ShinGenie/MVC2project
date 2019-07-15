package net.itbank.MVC;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;// application 객체
import com.oreilly.servlet.MultipartRequest; //객체를 위해서 임포트함
import com.oreilly.servlet.multipart.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.File;

import net.itbank.db.GuestDAO;
import net.itbank.db.GuestDTO;

	@WebServlet("/g_insert.do")
	public class G_insertController extends HttpServlet {
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doUser(request,response);//필수호출
		}//end

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doUser(request,response);//필수호출
		}//end
		
		public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			PrintWriter out = response.getWriter(); // 웹으로 출력
			out.println("<font size=7 color=blue><b>G_insertController.java</b></font><br>");
			System.out.println("g_insertController.java");
			out.println("<img src=images/last.png width=300 height=200><p>");
			RequestDispatcher dis = null; // 여기가서 확인하세요 확인의미 dispacher
			HttpSession session = null;
			ServletContext sct = getServletContext();
			
		 	String path = sct.getRealPath("storage");//공유폴더 개념
			System.out.println("경로" + path);
			int size = 1024 * 1024 *7;
			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8",dfr);
			
			GuestDAO dao = new GuestDAO();
			GuestDTO dto = new GuestDTO();
						
			String a = mr.getParameter("userid");
			String b = mr.getParameter("title");
			String c = mr.getParameter("content");
			String d = mr.getFilesystemName("file1");
			File ff = mr.getFile("file1");
			int fsize = (int)ff.length();
			String e = mr.getParameter("kind");
			String f = mr.getParameter("idfile");
			dto.setUserid(a);
			dto.setM_title(b);
			dto.setM_con(c);
			dto.setM_file(d);
			dto.setM_fsize(fsize);
			dto.setM_kind(e);
			dto.setIdfile(f);
			
			dao.dbInsert(dto);
			System.out.println("dao 타고왔음!!" );
			response.sendRedirect("m_list.do"); 
			
			
		}
	}//class END