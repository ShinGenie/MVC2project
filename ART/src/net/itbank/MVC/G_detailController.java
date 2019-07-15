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

	@WebServlet("/g_detail.do")
	public class G_detailController extends HttpServlet {

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
			out.println("<font size=7 color=blue><b>G_detailController.java</b></font><br>");
			System.out.println("g_detailController.java");
			out.println("<img src=images/hydran.png width=300 height=200><p>");
			RequestDispatcher dis = null; // 여기가서 확인하세요 확인의미 dispacher
			
		
			GuestDAO dao = new GuestDAO();
			String data=request.getParameter("Gidx"); //게시 userid
			String pnum=request.getParameter("Gnum"); //리플 페이지넘버
			int m_num=Integer.parseInt(request.getParameter("Mnum")); //게시 넘버
			System.out.println("userid는 디테일로 넘어오나"+data);

			GuestDTO dto = dao.dbDetail(data,m_num);
			dao.dbAddHit(m_num, data);
			request.setAttribute("dto", dto); // 자원을 가지고 넘김!! 그래서 서블릿 request / response
			dis = request.getRequestDispatcher("reply.do");//reply.do 로 변경
			dis.forward(request, response); //요청한 곳에 응답해라!
		}
	}//class END
	
	
	
	
	
	
	
	
	
	
	
	
	