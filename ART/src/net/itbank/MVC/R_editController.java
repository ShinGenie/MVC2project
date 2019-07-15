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

	@WebServlet("/r_edit.do")
	public class R_editController extends HttpServlet {

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
			System.out.println("R_editController.java");
			out.println("<img src=images/hydran.png width=300 height=200><p>");
			RequestDispatcher dis = null; // 여기가서 확인하세요 확인의미 dispacher
			HttpSession session = null;
			
			
			
			GuestReplyDAO rdao = new GuestReplyDAO();
			GuestReplyDTO rdto = new GuestReplyDTO();
			
			int rnum=Integer.parseInt(request.getParameter("Rnum")); //댓글게시넘버
			String r_email=request.getParameter("r_email"); 
			String r_con=request.getParameter("r_con"); 
			//////////////////디테일에 보낼 값 2가지
			String userid = request.getParameter("b_userid"); //게시 아이디
			int m_num = Integer.parseInt(request.getParameter("m_num")); //게시넘버
			
			rdto.setRnum(rnum);
			rdto.setR_email(r_email);
			rdto.setR_con(r_con);
			
			System.out.println("한글확인:"+rdto.getRnum());
			System.out.println("한글확인:"+rdto.getR_email());
			System.out.println("한글확인:"+rdto.getR_con());
		
			rdao.dbReplyUpdate(rdto);
			
			response.sendRedirect("/ART/g_detail.do?Gidx="+userid+"&Mnum="+m_num);
			System.out.println("g_detail.do에 보낸 아이디: "+userid + "게시고유번호: "+m_num);
			
		}
	}//class END
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	