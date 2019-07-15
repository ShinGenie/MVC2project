package net.itbank.MVC;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.itbank.db.GuestDAO;
import net.itbank.db.GuestDTO;
import net.itbank.db.GuestReplyDAO;
import net.itbank.db.GuestReplyDTO;

	@WebServlet("/g_Edit.do")
	public class G_EditController extends HttpServlet {

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
						
			String a = mr.getParameter("title");
			String b = mr.getParameter("content");
			String c = mr.getFilesystemName("file1");
			File ff = mr.getFile("file1");
			int fsize = (int)ff.length();
			String d = mr.getParameter("kind");
			String e = mr.getParameter("userid");
			int f = Integer.parseInt(mr.getParameter("m_num"));
			
			dto.setM_title(a);
			dto.setM_con(b);
			dto.setM_file(c);
			dto.setM_fsize(fsize);
			dto.setM_kind(d);
			dto.setUserid(e);
			dto.setM_num(f);
			dao.dbUpdate(dto);
			
			System.out.println("게시글 update 성공!" );

			//controll에서 controll로 이동
			response.sendRedirect("m_list.do"); 
			
			
			
		}
	}//class END
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	