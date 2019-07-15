package net.itbank.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import net.itbank.common.DB;

public class GuestReplyDAO extends GVariable { //DAO == Data Access Object

	public GuestReplyDAO(){
		CN=DB.getConnection();
		System.out.println("GuestReplyDAO 생성자 DB연결 성공!!0625");
	}//end

	public void dbReplyInsert(GuestReplyDTO rdto)  {
		msg="insert into mbreply values(mbreply_seq.nextval,?,?,?,?,sysdate,?,?)";
		try {
			PST=CN.prepareStatement(msg);
			PST.setString(1,rdto.getR_userid());
			PST.setString(2,rdto.getR_email());
			PST.setString(3,rdto.getR_con());
			PST.setString(4,rdto.getR_idfile());
			PST.setString(5,rdto.getUserid());
			PST.setInt(6,rdto.getM_num());
			PST.executeUpdate();
		} catch (Exception e) {System.out.print(e); }
	}//end
	
	public ArrayList<GuestReplyDTO> dbReplySelect(int m_num, int start, int end){ //사번조건
		 ArrayList<GuestReplyDTO> list=new ArrayList<GuestReplyDTO>();
		 try {
			 StringBuffer sb=new StringBuffer();
			   sb.append(" select * from ( ");
			   sb.append(" select rownum rn, r.* from mbreply r ");
			   sb.append(" inner join mboard m ");
			   sb.append(" on r.m_num = m.m_num ");
			   sb.append(" and m.m_num = " + m_num + " order by r.rdate desc ) ");
			   sb.append(" where  rn between " + start + " and " + end );
			   System.out.println(sb.toString());
			 ST=CN.createStatement();
			 RS=ST.executeQuery(sb.toString());
			 while(RS.next()==true) {
				 GuestReplyDTO rdto=new GuestReplyDTO(); 
				 rdto.setRn(RS.getInt("rn"));
				 rdto.setRnum(RS.getInt("rnum"));
				 rdto.setR_userid(RS.getString("r_userid"));
				 rdto.setR_email(RS.getString("r_email"));
				 rdto.setR_con(RS.getString("r_con"));
				 rdto.setR_idfile(RS.getString("r_idfile"));
				 rdto.setRdate(RS.getDate("rdate"));
				 rdto.setUserid(RS.getString("userid"));
				 rdto.setM_num(RS.getInt("m_num"));
				 list.add(rdto);
			 }//while end
		 }catch(Exception ex) {System.out.println("리플에러:"+ex); }
		 return list;
	 }//end
	
	public ArrayList<GuestReplyDTO> dbReplyLatest(int start, int end){ 
		ArrayList<GuestReplyDTO> list=new ArrayList<GuestReplyDTO>();
		try {
			msg=" select * from ( select rownum rn, r.* from mbreply r order by rdate desc) where rn between " + start + " and " + end ;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			while(RS.next()==true) {
				GuestReplyDTO rdto=new GuestReplyDTO(); 
				rdto.setRn(RS.getInt("rn"));
				rdto.setRnum(RS.getInt("rnum"));
				rdto.setR_userid(RS.getString("r_userid"));
				rdto.setR_email(RS.getString("r_email"));
				rdto.setR_con(RS.getString("r_con"));
				rdto.setR_idfile(RS.getString("r_idfile"));
				rdto.setRdate(RS.getDate("rdate"));
				rdto.setUserid(RS.getString("userid"));
				rdto.setM_num(RS.getInt("m_num"));
				list.add(rdto);
				System.out.println("디비 리플라이 정보 RS.getInt(\"rn\"): "+RS.getInt("rn"));
				System.out.println("디비 리플라이 정보 RS.getInt(\"rnum\"): "+RS.getInt("rnum"));
				System.out.println("디비 리플라이 정보 RS.getString(\"r_userid\"): "+RS.getString("r_userid"));
				System.out.println("디비 리플라이 정보 RS.getString(\"r_email\"): "+RS.getString("r_email"));
				System.out.println("디비 리플라이 정보 RS.getString(\"r_con\"): "+RS.getString("r_con"));
				System.out.println("디비 리플라이 정보 RS.getString(\"r_idfile\"): "+RS.getString("r_idfile"));
				System.out.println("디비 리플라이 정보 RS.getDate(\"rdate\"): "+RS.getDate("rdate"));
				System.out.println("디비 리플라이 정보 RS.getString(\"userid\"): "+RS.getString("userid"));
				System.out.println("디비 리플라이 정보 RS.getInt(\"m_num\"): "+RS.getInt("m_num"));
			}//while end
		}catch(Exception ex) {System.out.println("리플에러:"+ex); }
		return list;
	}//end
	
	public void dbReplyDelete(int rnum){
		try {
			msg="delete from mbreply where rnum="+rnum;
			ST=CN.createStatement();
			ST.executeUpdate(msg);
			System.out.print(rnum +" 삭제처리 성공!!!");
		}catch(Exception e) {System.out.println("delete오류: " + e);}
	}//end

	public void dbReplyUpdate(GuestReplyDTO rdto)  {
		try {
			msg="update mbreply set r_con=?, r_email=?, rdate=sysdate where rnum=?";
			PST=CN.prepareStatement(msg);
			PST.setString(1,rdto.getR_con());
			PST.setString(2,rdto.getR_email());
			PST.setInt(3,rdto.getRnum());
			PST.executeUpdate();
			System.out.println(rdto.getRnum()+" 댓글번호 update성공!!!");
		}catch(Exception e) {System.out.println("리플업데이트오류: " + e);}
	}//end

	public int dbReplyCount(String b_userid, int m_num) {
		int Gtotal=0;
		try {
		msg="select count(*) as cnt from mbreply where userid= '"+b_userid+"' and m_num= " + m_num;
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		if(RS.next()==true) Gtotal=RS.getInt("cnt");
		}catch(Exception e) {System.out.println("dbcount오류: " + e);}
		return Gtotal; 
}//end
	
	public int dbReplyCount() {
		int Gtotal=0;
		try {
			msg="select count(*) as cnt from mbreply";
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) Gtotal=RS.getInt("cnt");
		}catch(Exception e) {System.out.println("dbcount오류: " + e);}
		return Gtotal; 
	}//end
	

}//class end
