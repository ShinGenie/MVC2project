package net.itbank.MVC;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.itbank.db.GuestDAO;
import net.itbank.db.GuestDTO;
import net.itbank.db.GuestReplyDAO;
import net.itbank.db.GuestReplyDTO;

	@WebServlet("/g_preEdit.do")
	public class G_preeditController2 extends HttpServlet {

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
			out.println("<font size=7 color=blue><b>G_preEditController.java</b></font><br>");
			System.out.println("G_perEditController.java");
			out.println("<img src=images/hydran.png width=300 height=200><p>");
			HttpSession session = null;
			
			
			String userid=request.getParameter("Gidx"); // 게시 유저아이디
			int m_num=Integer.parseInt(request.getParameter("Mnum")); // 게시 유저아이디
			GuestDAO dao = new GuestDAO();
			GuestDTO dto = dao.dbDetail(userid,m_num);
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("/mboard/boardWriteUpdate.jsp");
			dis.forward(request, response);
			
		}
	}//class END
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	