package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import net.itbank.common.*;

public class LoginDAO {
	private Connection CN;
	private Statement ST;
	private PreparedStatement PST;
	private ResultSet RS;
	private String msg;
	private int Gtotal=0;
	
	public LoginDAO(){
		CN = DB.getConnection();
		System.out.println("Login 생성자 DB연결 성공");
	}//end
	
	
	
	
	public void dbinsert(String userid, String pwd, String idfile) { 
		// 아이디판별 구체적으로 
		msg="insert into login values( ?, ?, ? )";
		try {
			PST=CN.prepareStatement(msg);
			PST.setString(1, userid);
			PST.setString(2, pwd);
			PST.setString(3, idfile);
			PST.executeQuery();
			System.out.println("로그인디비 저장된 "+ userid +" / "+ pwd +" / "+ idfile);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
}//class end

public int dbselect(String userid, String pwd) { 
	// 아이디판별 구체적으로 
	System.out.println("디비셀렉트 들어온 값"+userid + pwd);
	msg="select pwd from login where userid=?";
	try {
		PST=CN.prepareStatement(msg);
		PST.setString(1, userid);
		System.out.println("입력된 "+userid);
		RS=PST.executeQuery();
		if(RS.next()) {
			if(RS.getString("pwd").equals(pwd))
				return 1;
			else
				return 0;
		}
		return -1;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return -2;
}

}//class end
















