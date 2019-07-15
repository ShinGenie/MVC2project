package join;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import join.JoinDAO;


@WebServlet("/idCheck.do")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheckServlet() {
        super();
    }
    //#11 자바스크립트 idCheck함수에서 보냈다. userid가 있다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid=request.getParameter("userid"); 
		JoinDAO dao = new JoinDAO();
		//#12 dao에 가서 userid로 검사하고 오자
		int result = dao.dbIdCheck(userid); // 없으면 0 있으면 1   // 여기 다오단 sqp쿼리타요!!
		//result의 내용과 userid의 내용을 jsp로 가져가야한다.
		request.setAttribute("userid", userid); 
		request.setAttribute("result", result);
		//#13 idcheck.jsp로 가자!
		request.getRequestDispatcher("join/idcheck.jsp")
		.forward(request, response);
	
		// 넘어온 userid값을 저장한 후 dao의 idcheck메서드를 이용 db에 해당 
		// userid를 확인한다.
		//존재여부의 결과값 result와 해당 유저 userid를  idcheck.jsp로 보내준다.
		// window창에 출력
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
