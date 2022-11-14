package kr.login.entity;

public class Member {
	private String login_id;
	private String login_type;
	private String user_name;
	private String joindate;
	private String u_birthdate;
	private String post;
	private String u_addr;
	private String u_grade;
	private int u_point;
	private String u_type;
	private String u_nick;
	private String u_pw;
		
	public Member() {
		
	}
	public Member(String login_id, String login_type, String user_name, String joindate, String u_birthdate,
			String post, String u_addr, String u_grade, int u_point, String u_type, String u_nick, String u_pw) {
		super();
		this.login_id = login_id;
		this.login_type = login_type;
		this.user_name = user_name;
		this.joindate = joindate;
		this.u_birthdate = u_birthdate;
		this.post = post;
		this.u_addr = u_addr;
		this.u_grade = u_grade;
		this.u_point = u_point;
		this.u_type = u_type;
		this.u_nick = u_nick;
		this.u_pw = u_pw;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_type() {
		return login_type;
	}
	public void setLogin_type(String login_type) {
		this.login_type = login_type;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getU_birthdate() {
		return u_birthdate;
	}
	public void setU_birthdate(String u_birthdate) {
		this.u_birthdate = u_birthdate;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	public String getU_type() {
		return u_type;
	}
	public void setU_type(String u_type) {
		this.u_type = u_type;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	@Override
	public String toString() {
		return "Member [login_id=" + login_id + ", login_type=" + login_type + ", user_name=" + user_name
				+ ", joindate=" + joindate + ", u_birthdate=" + u_birthdate + ", post=" + post + ", u_addr=" + u_addr
				+ ", u_grade=" + u_grade + ", u_point=" + u_point + ", u_type=" + u_type + ", u_nick=" + u_nick
				+ ", u_pw=" + u_pw + "]";
	}

	
	
	
	
}
