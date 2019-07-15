package net.itbank.MVC;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= {"/naver", "/daum"}) //패턴주면 두개 주소줄수 있는데, 하나주는게 좋음 
public class HelloServlet  extends  HttpServlet{
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
  	 request.setCharacterEncoding("utf-8");
  	 response.setContentType("text/html; charset=utf-8"); 
  	 
  	 PrintWriter out = response.getWriter();
  	 
  	 out.println("<html>");
  	 out.println("<head><title>인사</title></head>");
  	 out.println("<body>");
  	 out.println("<h1>HelloServlet.java문서 doPost메소드</h1>");
  	 out.println("<font color=blue><h1>안녕하세요 ");
  	 out.println(request.getParameter("name"));
  	 out.println("님</font></h1>");
  	 out.println("</body>");
  	 out.println("</html>");
   }//end
}//class END
