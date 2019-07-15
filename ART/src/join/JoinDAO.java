package join;

import net.itbank.common.*; // common에 있는 것을 끌고 오면 왜 에러날까?? 못끌고 올까?
import java.sql.*;
import java.util.ArrayList;

public class JoinDAO { //DAO == Data Access Object
	Connection CN;
	PreparedStatement PST;
	Statement ST;
	ResultSet RS; 
	String msg="";
	
	public JoinDAO(){
		CN = DB.getConnection();
		System.out.println("Join 생성자 DB연결 성공0706");
	}//end

	public int dbInsert(JoinDTO dto)  {
		int result=0;
		msg="insert into join values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		try {
			PST=CN.prepareStatement(msg);
			PST.setString(1, dto.getUserid());
			PST.setString(2, dto.getPwd());
			PST.setString(3, dto.getName());
			PST.setString(4, dto.getPhone());
			PST.setString(5, dto.getBirth());
			PST.setString(6, dto.getCatagory());
			PST.setString(7, dto.getGender());
			PST.setString(8, dto.getPost1());
			PST.setString(9, dto.getEmail());
			PST.setString(10, dto.getIdfile());
			PST.setInt(11, dto.getFsize());
			//Date dt= new Date();
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
			//PST.setString(5, sdf.format(dt));
			PST.executeUpdate();
		} catch (Exception e) {System.out.print(e); }
		return result=1;
	}//end
	
	public ArrayList<JoinDTO> dbSelect()  {
		ArrayList<JoinDTO> list = new ArrayList<JoinDTO>();
		try {
			msg="select * from join";
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			while(RS.next()==true) { 
			JoinDTO dto = new JoinDTO();
			dto.setUserid(RS.getString("userid"));
			dto.setPwd(RS.getString("pwd"));
			dto.setName(RS.getString("phone"));
			dto.setPhone(RS.getString("phone"));
			dto.setBirth(RS.getString("birth"));
			dto.setCatagory(RS.getString("catagory"));
			dto.setGender(RS.getString("gender"));
			dto.setPost1(RS.getString("post1"));
			dto.setEmail(RS.getString("email"));
			dto.setIdfile(RS.getString("idfile"));
			dto.setFsize(RS.getInt("fsize"));
			dto.setJdate(RS.getDate("jdate"));
			list.add(dto);
			} 
		} catch (Exception e) {System.out.print(e); }
		return list;
	}//end
	
	public String dbIdfile(String userid)  {
		String idfile="aa";
		System.out.println("아이디파일111: "+ idfile);
		try {
			msg="select idfile from join where userid= '" + userid+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) { 
				idfile=RS.getString("idfile");
			} 
		} catch (Exception e) {System.out.print(e); }
		System.out.println("아이디파일2222: "+ idfile);
		return idfile;
	}//end

	
	public int dbIdCheck(String userid)  {
		int result = 0;
		try {
			msg="select count(*) as cnt from join where userid= '" + userid+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) { 
				result=RS.getInt("cnt");
			} 
		} catch (Exception e) {System.out.print(e); }
		System.out.println("result : "+ result);
		return result;
	}//end
}//class end
