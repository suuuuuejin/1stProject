package kr.toBoard.entity;

public class to_form {
	private int tb_seq ;
	private String login_id;
	private String user_name;
	private String user_phone;
	private char attedancy_check;
	private String u_grade;
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getTb_seq() {
		return tb_seq;
	}
	public void setTb_seq(int tb_seq) {
		this.tb_seq = tb_seq;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public char getAttedancy_check() {
		return attedancy_check;
	}
	public void setAttedancy_check(char attedancy_check) {
		this.attedancy_check = attedancy_check;
	}
	
	
}
