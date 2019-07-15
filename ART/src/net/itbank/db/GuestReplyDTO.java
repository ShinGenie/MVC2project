package net.itbank.db;

public class GuestReplyDTO { // 다리역할 == 전역변수 == Data Transfer Object //
	
	private String r_userid;
	private String r_email;
	private String r_con;
	private String r_idfile;
	private java.util.Date rdate;
	private String userid;
	private int rnum, m_num;
	private int rn;
	
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getR_userid() {
		return r_userid;
	}
	public void setR_userid(String r_userid) {
		this.r_userid = r_userid;
	}
	public String getR_email() {
		return r_email;
	}
	public void setR_email(String r_email) {
		this.r_email = r_email;
	}
	public String getR_con() {
		return r_con;
	}
	public void setR_con(String r_con) {
		this.r_con = r_con;
	}
	public String getR_idfile() {
		return r_idfile;
	}
	public void setR_idfile(String r_idfile) {
		this.r_idfile = r_idfile;
	}
	public java.util.Date getRdate() {
		return rdate;
	}
	public void setRdate(java.util.Date rdate) {
		this.rdate = rdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	 
}//class end
