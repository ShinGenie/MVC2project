package net.itbank.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class GVariable extends DB {
	Connection CN; //CN필드 DB서버정보, 명령어생성할때 참조
	Statement ST; //ST=CN.createStateme()명령어생성
	PreparedStatement PST; //PST=CN.prePareStatement("쿼리문")    
	ResultSet RS; //RS=ST.executeQuery("select~"); 조회한결과를 RS기억

	int Gsabun, Gpay ;//전역변수=필드=filed=멤버변수 
	String Gname, Gtitle ;
	java.util.Date Gnalja ; 
	int Gtotal=27, Stotal=27; //전체데이터갯수, 조회데이터갯수
	String msg ; //msg="insert~"  msg="select~" msg="delete~" msg="update~"
	String rmgs;//rmsg 댓글 쿼리문
	
	GVariable(){
		CN=DB.getConnection();
	}
}//GlobalVariable class END
