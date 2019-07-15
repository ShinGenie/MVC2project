package net.itbank.db;

public class GuestDTO { // 다리역할 == 전역변수 == Data Transfer Object //
	
	private int m_num, m_hit, m_replynum, rn;
	private int m_fsize;
	private String m_title, m_con, m_file, m_kind, userid, idfile;
	private java.util.Date mdate;
	
	//paging 할때 적용하세요
	private int start,end;
	private String skey, sval;
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getM_hit() {
		return m_hit;
	}
	public void setM_hit(int m_hit) {
		this.m_hit = m_hit;
	}
	public int getM_replynum() {
		return m_replynum;
	}
	public void setM_replynum(int m_replynum) {
		this.m_replynum = m_replynum;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getM_fsize() {
		return m_fsize;
	}
	public void setM_fsize(int m_fsize) {
		this.m_fsize = m_fsize;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_con() {
		return m_con;
	}
	public void setM_con(String m_con) {
		this.m_con = m_con;
	}
	public String getM_file() {
		return m_file;
	}
	public void setM_file(String m_file) {
		this.m_file = m_file;
	}
	public String getM_kind() {
		return m_kind;
	}
	public void setM_kind(String m_kind) {
		this.m_kind = m_kind;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public java.util.Date getMdate() {
		return mdate;
	}
	public void setMdate(java.util.Date mdate) {
		this.mdate = mdate;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	
	public String getIdfile() {
		return idfile;
	}
	public void setIdfile(String idfile) {
		this.idfile = idfile;
	}
	
}//class end
