package join;

public class JoinDTO {


	private String userid, pwd, phone, birth, name, catagory, gender, post1, post2, email, idfile;
	private java.util.Date jdate;
	private int fsize;
	
	

	public int getFsize() { return fsize; }
	public void setFsize(int fsize) { this.fsize = fsize; }
	
	public String getIdfile() { return idfile; }
	public void setIdfile(String idfile) { this.idfile = idfile; }
	
	public String getUserid() { return userid; }
	public void setUserid(String userid) { this.userid = userid; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getCatagory() { return catagory; }
	public void setCatagory(String catagory) { this.catagory = catagory; }
	
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	
	public String getPost1() { return post1; }
	public void setPost1(String post1) { this.post1 = post1; }
	
	public String getPost2() { return post2; }
	public void setPost2(String post2) { this.post2 = post2; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getPwd() { return pwd; }
	public void setPwd(String pwd) { this.pwd = pwd; }
	
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	
	public String getBirth() { return birth; }
	public void setBirth(String birth) { this.birth = birth; }
	
	public java.util.Date getJdate() { return jdate; }
	public void setJdate(java.util.Date jdate) { this.jdate = jdate; }

	
}
