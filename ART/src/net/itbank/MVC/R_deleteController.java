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

	@WebServlet("/r_delete.do")
	public class R_deleteController extends HttpServlet {

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
			out.println("<font size=7 color=blue><b>G_deleteController.java</b></font><br>");
			System.out.println("r_deleteController.java");
			out.println("<img src=images/hydran.png width=300 height=200><p>");
			RequestDispatcher dis = null; // 여기가서 확인하세요 확인의미 dispacher
			HttpSession session = null;
			
			//int data = request.getParameter(""); //인트형으로 request로 받았을때 무조건 에러
			GuestReplyDAO rdao = new GuestReplyDAO();
			String userid = request.getParameter("Gidx");//게시유저아이디
			int m_num = Integer.parseInt(request.getParameter("Mnum"));//게시넘버
			int rnum = Integer.parseInt(request.getParameter("Rnum"));//댓글번호
				rdao.dbReplyDelete(rnum);
			
			response.sendRedirect("g_detail.do?Mnum="+m_num);
		}
	}//class END
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	