package net.itbank.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class GuestDAO extends GlobalVariable { //DAO == Data Access Object

	public GuestDAO(){
		CN=DB.getConnection();
		System.out.println("GuestDAO 생성자 DB연결 성공07-5");
	}//end

	public void dbInsert(GuestDTO dto)  {
	
		msg="insert into mboard values(mboard_seq.nextval, ?, ?, ?, ?, ?, 0, ?, sysdate, 0, ?)";
		try {
			PST=CN.prepareStatement(msg);
//			
			PST.setString(1, dto.getUserid());
			PST.setString(2, dto.getM_title());
			PST.setString(3, dto.getM_con());
			PST.setString(4, dto.getM_file());
			PST.setInt(5, dto.getM_fsize());
			PST.setString(6, dto.getM_kind());
			PST.setString(7, dto.getIdfile());
			PST.executeUpdate();
		} catch (Exception e) {System.out.print(e); }
	}//end
	
	public ArrayList<GuestDTO> dbLatestPost(int latestFirst, int latestThird) { 
		ArrayList<GuestDTO> list = new ArrayList<GuestDTO>();
		try {
			msg=" select * from ( select rownum rn, m.* from mboard m order by mdate desc) where rn between " + latestFirst + " and " + latestThird;
			System.out.println("dbSelect 쿼리 탐");
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			while(RS.next()==true) {
				GuestDTO dto = new GuestDTO();
				dto.setRn(RS.getInt("rn"));
				dto.setM_num(RS.getInt("m_num"));
				dto.setUserid(RS.getString("userid"));
				dto.setM_title(RS.getString("m_title"));
				dto.setM_con(RS.getString("m_con"));
				dto.setM_file(RS.getString("m_file"));
				dto.setM_fsize(RS.getInt("m_fsize"));
				dto.setMdate(RS.getDate("mdate"));
				dto.setM_kind(RS.getString("m_kind"));
				dto.setM_hit(RS.getInt("m_hit")); // 조회수
				String msg1 = "select count(*) as cnt from mbreply where userid="+"'"+RS.getString("userid")+"' and m_num="+RS.getInt("m_num");
				Statement ST1=CN.createStatement();
				ResultSet RS1=ST1.executeQuery(msg1);
				if(RS1.next()==true) {dto.setM_replynum(RS1.getInt("cnt"));} // 댓글수
				dto.setIdfile(RS.getString("idfile"));
				list.add(dto); // 필수항목, 기술안하면 데이터 출력안됨!!
			}//while end
		}catch(Exception e) {
			System.out.println("예외발생?: "+e);
		}
		return list;
	}//end
	
	public ArrayList<GuestDTO> dbSelect( int start, int end, String skey, String sval, String kind){ //[21]~~[27클릭]~[30]
		 ArrayList<GuestDTO> list=new ArrayList<GuestDTO>();
		 try {
			
			 String x="select * from ( " ;
			 String y=" select rownum rn, m_num, userid, m_title, m_con, m_file, m_fsize, mdate, m_kind, m_hit, m_replynum, idfile from ";
			 String m="( select * from mboard ";
			 
			 boolean bool_skey = !skey.equals("");
			 boolean bool_kind = !kind.equals("");
			 
			 if( bool_kind || bool_skey ) {
				 m+= " where ";
				 if (bool_skey) {
					 m += skey +" like '%" + sval + "%' ";
				 }
				 if ( bool_kind ) {
					 if (bool_skey) {
						 m += " and ";
					 }
					 m+= " m_kind like '%" + kind + "%'";
				 }
			 }
			 
			 m += " order by mdate desc)"; //검색할때 사용
			 
			 String z=" ) where rn between " + start+ " and  "+ end;
			 msg = x + y + m + z ;
			 ST=CN.createStatement();
			 RS=ST.executeQuery(msg);
			while(RS.next()==true) {
				GuestDTO dto = new GuestDTO();
				dto.setRn(RS.getInt("rn"));
				dto.setM_num(RS.getInt("m_num"));
				dto.setUserid(RS.getString("userid"));
				dto.setM_title(RS.getString("m_title"));
				dto.setM_con(RS.getString("m_con"));
				dto.setM_file(RS.getString("m_file"));
				dto.setM_fsize(RS.getInt("m_fsize"));
				dto.setMdate(RS.getDate("mdate"));
				dto.setM_kind(RS.getString("m_kind"));
				dto.setM_hit(RS.getInt("m_hit")); // 조회수
				String msg1 = "select count(*) as cnt from mbreply where userid="+"'"+RS.getString("userid")+"' and m_num="+RS.getInt("m_num");
				Statement ST1=CN.createStatement();
				ResultSet RS1=ST1.executeQuery(msg1);
				if(RS1.next()==true) {dto.setM_replynum(RS1.getInt("cnt"));} // 조회수 
				dto.setIdfile(RS.getString("idfile"));
				list.add(dto); // 필수항목, 기술안하면 데이터 출력안됨!!
			}//while end
		}catch(Exception e) {}
		return list;
	}//end
	
	public GuestDTO dbDetail(String data, int m_num){
		msg=" select rownum rn, m.* from mboard m where userid="+"'"+data+"' and m_num="+m_num;
		GuestDTO dto = new GuestDTO();
		try {
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) {
				dto.setRn(RS.getInt("rn"));
				dto.setM_num(RS.getInt("m_num"));
				dto.setM_title(RS.getString("m_title"));
				dto.setM_con(RS.getString("m_con"));
				dto.setM_file(RS.getString("m_file"));
				dto.setM_fsize(RS.getInt("m_fsize"));
				dto.setM_hit(RS.getInt("m_hit")); // 조회수 //
				dto.setM_kind(RS.getString("m_kind"));
				dto.setMdate(RS.getDate("mdate"));
				dto.setUserid(RS.getString("userid"));
				String msg1 = "select count(*) as cnt from mbreply where userid="+"'"+RS.getString("userid")+"' and m_num="+RS.getInt("m_num");
				Statement ST1=CN.createStatement();
				ResultSet RS1=ST1.executeQuery(msg1);
				if(RS1.next()==true) {dto.setM_replynum(RS1.getInt("cnt"));} // 조회수 
				dto.setIdfile(RS.getString("idfile"));
				System.out.println("dbDetaildbDetail <==============전체확인================>");
				System.out.println("select rn: "+RS.getInt("rn"));
				System.out.println("select m_num: "+RS.getString("m_num"));
				System.out.println("select userid: "+RS.getString("userid"));
				System.out.println("select m_title: "+RS.getString("m_title"));
				System.out.println("select m_con: "+RS.getString("m_con"));
				System.out.println("select m_file: "+RS.getString("m_file"));
				System.out.println("select m_fsize: "+RS.getInt("m_fsize"));
				System.out.println("select m_hit: "+RS.getInt("m_hit"));
				System.out.println("select m_kind: "+RS.getString("m_kind"));
				System.out.println("select mdate: "+RS.getDate("mdate"));
				System.out.println("select m_replynum: "+RS.getString("m_replynum"));
				System.out.println("select Idfile: "+RS.getString("idfile"));
				System.out.println("dbDetaildbDetail <==============전체확인================>");
			}
			System.out.println(data+"detail 한건처리성공");
		} catch (Exception e) {System.out.println("detail오류: " + e);}
		return dto;
	}//end

	public void dbDelete(String data, int m_num){
		try {
			msg="delete from mboard where userid= "+"'"+data+"' and m_num= " + m_num;
			ST=CN.createStatement();
			ST.executeUpdate(msg);
			System.out.print(data+" 삭제처리 성공!!!");
		}catch(Exception e) {System.out.println("delete오류: " + e);}
	}//end

	public void dbUpdate(GuestDTO dto)  {
		try {
			msg="update mboard set m_title=?, m_con=?, m_file=?, m_fsize=?, m_kind=?, mdate=sysdate where userid=? and m_num=?";
			PST=CN.prepareStatement(msg);
			PST.setString(1,dto.getM_title());
			PST.setString(2,dto.getM_con());
			PST.setString(3,dto.getM_file());
			PST.setInt(4,dto.getM_fsize());
			PST.setString(5,dto.getM_kind());
			PST.setString(6,dto.getUserid());
			PST.setInt(7,dto.getM_num());
			PST.executeUpdate();
		}catch(Exception e) {System.out.println("update오류: " + e);}
	}//end

	public int dbCount() {
		int Vtotal=0;
		try {
		msg="select count(*) as cnt from mboard";
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		if(RS.next()==true) { Vtotal=RS.getInt("cnt");}
		}catch(Exception e) {System.out.println("dbcount오류0709: " + e);}
		return Vtotal; 
}//end
	
	public int dbCountKind(String kind) {
		int Atotal=0;
		try {
			msg="select count(*) as cnt from mboard where m_kind=  '" + kind + "'";
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) Atotal=RS.getInt("cnt");
		}catch(Exception e) {System.out.println("dbCountKind오류: " + e);}
		return Atotal; 
	}//end
	public int dbCountKindEtc(String kind) {
		int Btotal=0;
		try {
			msg="select count(*) as cnt from mboard where m_kind "+kind;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);
			if(RS.next()==true) Btotal=RS.getInt("cnt");
		}catch(Exception e) {System.out.println("dbcount오류00000000000000000: " + e);}
		return Btotal; 
	}//end
	
	public int dbCountSearch(String skey, String sval, String kind) {
		int Stotal=0;
		try {
		msg ="select count(*) as cnt from mboard";
		
		 boolean bool_skey = !skey.equals("");
		 boolean bool_kind = !kind.equals("");
		 
		 if( bool_kind || bool_skey ) {
			 msg += " where ";
			
			 if (bool_skey) {
				 msg += skey +" like '%" + sval + "%' ";
			 }
			 
			 if ( bool_kind ) {
				 if (bool_skey) {
					 msg += " and ";
				 }
				 msg += " m_kind like '%" + kind + "%'";
			 }
		 }
		
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		if(RS.next()==true) Stotal=RS.getInt("cnt");
		}catch(Exception e) {System.out.println("dbcount오류: 12212212112" + e);}
		return Stotal; 
}//end
	
public void dbAddHit(int m_num, String data){
		try {
			GuestDTO dto = new GuestDTO();
			msg="update mboard set m_hit=m_hit+1 where userid="+"'"+data+"' and m_num= " + m_num;
			PST=CN.prepareStatement(msg);
			PST.executeUpdate();
		}catch(Exception e) {System.out.println("dbAddHit오류: " + e);}
	}//end
}//class end
