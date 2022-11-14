package kr.buy_comment.entity;

public class buy_comment {
	private int buy_cmt_seq;
	private int buy_seq;
	private String buy_cmt_content;
	private String buy_cmt_date;
	private String login_id;
	private String u_grade;
	
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getBuy_cmt_seq() {
		return buy_cmt_seq;
	}
	public void setBuy_cmt_seq(int buy_cmt_seq) {
		this.buy_cmt_seq = buy_cmt_seq;
	}
	public int getBuy_seq() {
		return buy_seq;
	}
	public void setBuy_seq(int buy_seq) {
		this.buy_seq = buy_seq;
	}
	public String getBuy_cmt_content() {
		return buy_cmt_content;
	}
	public void setBuy_cmt_content(String buy_cmt_content) {
		this.buy_cmt_content = buy_cmt_content;
	}
	public String getBuy_cmt_date() {
		return buy_cmt_date;
	}
	public void setBuy_cmt_date(String buy_cmt_date) {
		this.buy_cmt_date = buy_cmt_date;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	
	
	
	
}
