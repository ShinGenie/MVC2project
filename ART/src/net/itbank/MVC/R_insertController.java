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

	@WebServlet("/r_insert.do")
	public class R_insertController extends HttpServlet {

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
			
			System.out.println("인서트 도착:!!!!!!!!!!!!");

			GuestReplyDAO rdao = new GuestReplyDAO();
			GuestReplyDTO rdto = new GuestReplyDTO();
			
			String r_userid = request.getParameter("r_userid"); 
			String r_email = request.getParameter("r_email");
			String r_con = request.getParameter("r_con");
			String r_idfile = request.getParameter("r_idfile");
			String userid = request.getParameter("b_userid");
			int m_num = Integer.parseInt(request.getParameter("m_num")); //게시넘버
			System.out.println("인서트 타는중:!!!!!!!!!!!!");

			rdto.setR_userid(r_userid);
			rdto.setR_email(r_email);
			rdto.setR_con(r_con);
			rdto.setR_idfile(r_idfile);
			rdto.setUserid(userid);
			rdto.setM_num(m_num);
		
			rdao.dbReplyInsert(rdto);
			response.sendRedirect("/ART/g_detail.do?Gidx="+userid+"&Mnum="+m_num);
			System.out.println("g_detail.do에 보낸 사본: "+userid);
		}
	}//class END
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	