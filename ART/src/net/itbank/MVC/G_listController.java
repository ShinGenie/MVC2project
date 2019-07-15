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
import java.io.Serializable;

import net.itbank.db.GuestDAO;
import net.itbank.db.GuestDTO;

@WebServlet("/m_list.do")
public class G_listController extends HttpServlet implements Serializable{

private static long serialVersionUID = 4418564811963136968L;


public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	serialVersionUID = 3L;
	doUser(request,response);
}//end

public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	serialVersionUID = 3L;
	doUser(request,response);
}//end

public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	PrintWriter out=response.getWriter();
	out.println("<font size=7 color=blue><b>ListController.java </b></font><p>");
	System.out.println("ListController.java ");
	out.println("<img src=images/a1.png width=500 height=300> <p>");
	RequestDispatcher dis = null; // 여기가서 확인하세요 확인의미 dispacher
	HttpSession session = null;
	
	GuestDAO dao=new GuestDAO();
	
	System.out.println("m_list.do로 도착했음");
	
	  String pnum="";
	  int pageNUM=0, pagecount=0; 
	  int start=0, end=0; //[7선택일때]  start=21, end=30
	  int startpage=0, endpage=0; // [21startpage] ~~ [30endpage]
	  int temp=0;  //임시변수 시작페이지구하기 1, 11, 21, 31 
	  
	  //검색할때
	  String skey="", sval="" ;  // 검색필드, 검색어
	  String returnpage="" ;  // 검색해서 페이지번호클릭할때사용
	  
	  //레코드갯수
	  int Gtotal=0, Stotal=0;
	  
	  //검색
	  String kind = request.getParameter("kind"); //게시물 주제별
	  System.out.println("넘어온 카인드 확인:"+kind);
	  if(kind == null) { kind = "";
	  } else {
		  if (kind.equals("모든주제")) { kind = ""; }
	  }
	  skey=request.getParameter("keyfield");  
	  sval=request.getParameter("keyword");
	  if(skey == null) {
		  skey = "";
	  }
	  System.out.println("skey확인: "+skey);
	  System.out.println("sval확인: "+sval);
	  //http://localhost:8081/Web0620/list.do?Gnum=2&keyfield=name&keyword=b
	  returnpage="&keyfield="+skey+"&keyword="+sval; // 리턴페이지로 for문 i랑 넘길값
	  
	  //db 범위 == 이전 [21] ~~ [27클릭] ~~[30]다음
	  pnum=request.getParameter("Gnum");
	  if (pnum==null || pnum=="") {pnum="1";}
	  pageNUM=Integer.parseInt(pnum); //문자 27 클릭
	  System.out.println("넘어온 값: "+pageNUM);
		
	  start=(pageNUM-1)*6+1; //start시작행
	  end=(pageNUM*6);   //end끝행
	  System.out.println("start 값: "+ start);
	  System.out.println("end 값: "+ end);
	    
	  //페이지갯수/검색갯수  pagecount=32
	  Stotal=dao.dbCountSearch(skey,sval,kind);
	  if (Stotal%6==0){ pagecount=(Stotal/6); }
	  else{ pagecount=(Stotal/6)+1;}
	  System.out.println("전체 데이터갯수: "+ Stotal);
//
	  //시작페이지[21] ~ [27클릭] ~ 끝페이지[30]
	  temp=(pageNUM-1)%10;
	  startpage=(pageNUM-temp); //27-6
	  endpage=(startpage+9);
	  if(endpage>pagecount) { endpage=pagecount; }
//		
		
	  ////////////////kind부분//////////////////////
		
	  String a = "해외작품";
	  String b = "국내작품";
	  String c = "국내전시";
	  String d = "인원모집";
	  // 항목별 통계 ";
	  int kindA=dao.dbCountKind(a); 
	  int kindB=dao.dbCountKind(b);
	  int kindC=dao.dbCountKind(c);
	  int kindD=dao.dbCountKind(d);
		
	  Gtotal=dao.dbCount();
	  ArrayList<GuestDTO> LG1 = dao.dbLatestPost((Gtotal-2),Gtotal); //최근게시물 3개만
	 
	  ArrayList<GuestDTO> LG = dao.dbSelect(start,end,skey,sval,kind);

		System.out.println("여기까지 왔니??????????");
		request.setAttribute("LG", LG);
		request.setAttribute("LG1", LG1);
		request.setAttribute("Gtotal", Gtotal);
		request.setAttribute("Stotal", Stotal);
		request.setAttribute("pageNUM", pageNUM);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("returnpage", returnpage);
		request.setAttribute("skey", skey);
		request.setAttribute("sval", sval);
		request.setAttribute("kind", kind);
		request.setAttribute("kindA", kindA);
		request.setAttribute("kindB", kindB);
		request.setAttribute("kindC", kindC);
		request.setAttribute("kindD", kindD);
		//request.setAttribute("kindE", kindE);
		
		dis = request.getRequestDispatcher("/mboard/board_list.jsp");
		dis.forward(request, response);
	}
}//class END