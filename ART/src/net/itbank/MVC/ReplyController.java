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


import net.itbank.db.GuestReplyDAO;
import net.itbank.db.GuestReplyDTO;
import net.itbank.db.GuestDAO;
import net.itbank.db.GuestDTO;

	@WebServlet("/reply.do")
	public class ReplyController extends HttpServlet {

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
			out.println("<font size=7 color=blue><b>ReplyController.java</b></font><br>");
			System.out.println("replyController.java");
			out.println("<img src=images/hydran.png width=300 height=200><p>");
			RequestDispatcher dis = null; // 여기가서 확인하세요 확인의미 dispacher
			
			GuestReplyDAO rdao = new GuestReplyDAO();
			
//			String data=request.getParameter("Gidx"); //게시 userid
//			String pnum=request.getParameter("Gnum"); //게시 넘버
//			int m_num=Integer.parseInt(request.getParameter("Mnum")); //게시 넘버
//			
			String rdata=request.getParameter("Gidx"); //디테일에서 넘어온 게시 userid
			System.out.println("guestDetailcontroller에서 넘어온 Gidx:"+rdata);
			int m_num=Integer.parseInt(request.getParameter("Mnum")); //게시 넘버
			System.out.println("guestDetailcontroller에서 넘어온 게시자 고유번호 Mnum: "+m_num);


			//////reply paging//////
			//변수선언
			String pnum="";
			int pageNUM=0;
			int start=0;
			int end=0;
			int temp=0;
			int startpage=0;
			int endpage=0;
			int Gtotal=0;
			int pagecount=0;

			pnum=request.getParameter("Gnum");
			if(pnum==null||pnum=="") {pnum="1";}
			pageNUM=Integer.parseInt(pnum);
			start=(pageNUM-1)*5+1; // 1,6,11,16,21...
			System.out.println("start 디비셀렉 시작범위: "+start);

			end=pageNUM*5;//5,10,15,20..
			System.out.println("end 디비셀렉 끝범위: "+end);
			
			Gtotal=rdao.dbReplyCount(rdata,m_num);
			if(Gtotal%5==0) {pagecount=Gtotal/5;}
			else {pagecount=(Gtotal/5)+1;}
			
			// pageNUM=[13] 선택했다면 startpage=11 endpage=15  temp=(pageNUM-1)%5
			temp=(pageNUM-1)%5;
			startpage=(pageNUM-temp);
			endpage=(startpage+4);
			if(endpage>pagecount) {endpage=pagecount;}
			
			int Rtotal=rdao.dbReplyCount();
			
			
			////////DAO단 - kind별 갯수 디테일 어싸이드에 던질것/////
			GuestDAO dao = new GuestDAO();
			String a = "해외작품";
			String b = "국내작품";
			String c = "국내전시";
			String d = "인원모집";
			//String e = " not in ( '해외작품','국내작품','국내전시','인원모집' ) ";
			int kindA=dao.dbCountKind(a);
			int kindB=dao.dbCountKind(b);
			int kindC=dao.dbCountKind(c);
			int kindD=dao.dbCountKind(d);
			//int kindE=dao.dbCountKindEtc(e);
			
			ArrayList<GuestReplyDTO> rLG=rdao.dbReplySelect(m_num, start, end); 
			ArrayList<GuestReplyDTO> rLG1=rdao.dbReplyLatest((Rtotal-4), Rtotal);
			request.setAttribute("rdata", rdata); //게시 유저 아이디
			request.setAttribute("m_num", m_num); //게시 유저 고유번호
			request.setAttribute("Rtotal", Rtotal); // 댓글수
			request.setAttribute("rLG", rLG); // 선택된 범위의 댓글 페이징
			request.setAttribute("rLG1", rLG1); // 선택된 범위의 최신댓글 
			request.setAttribute("pageNUM", pageNUM);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("Gtotal", Gtotal);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("kindA", kindA);
			request.setAttribute("kindB", kindB);
			request.setAttribute("kindC", kindC);
			request.setAttribute("kindD", kindD);
			System.out.println("여기까지왔니?:"+kindD);
		
			dis = request.getRequestDispatcher("mboard/boardDetail.jsp"); 
			dis.forward(request, response);	
			
		}
	}//class END
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	