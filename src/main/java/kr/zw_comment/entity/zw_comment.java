package kr.zw_comment.entity;

public class zw_comment {
	private int zw_cmt_seq;
	private int zw_seq;
	private String zw_cmt_content;
	private String zw_cmt_date;
	private String login_id;
	private String u_grade;
	
	
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getZw_cmt_seq() {
		return zw_cmt_seq;
	}
	public void setZw_cmt_seq(int zw_cmt_seq) {
		this.zw_cmt_seq = zw_cmt_seq;
	}
	public int getZw_seq() {
		return zw_seq;
	}
	public void setZw_seq(int zw_seq) {
		this.zw_seq = zw_seq;
	}
	public String getZw_cmt_content() {
		return zw_cmt_content;
	}
	public void setZw_cmt_content(String zw_cmt_content) {
		this.zw_cmt_content = zw_cmt_content;
	}
	public String getZw_cmt_date() {
		return zw_cmt_date;
	}
	public void setZw_cmt_date(String zw_cmt_date) {
		this.zw_cmt_date = zw_cmt_date;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	
	
	
}
