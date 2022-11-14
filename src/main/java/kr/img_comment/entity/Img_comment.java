package kr.img_comment.entity;

public class Img_comment {
	private int img_cmt_seq;
	private int img_seq;
	private String img_cmt_content;
	private String img_cmt_date;
	private String login_id;
	private String u_grade;
	
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getImg_cmt_seq() {
		return img_cmt_seq;
	}
	public void setImg_cmt_seq(int img_cmt_seq) {
		this.img_cmt_seq = img_cmt_seq;
	}
	public int getImg_seq() {
		return img_seq;
	}
	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}
	public String getImg_cmt_content() {
		return img_cmt_content;
	}
	public void setImg_cmt_content(String img_cmt_content) {
		this.img_cmt_content = img_cmt_content;
	}
	public String getImg_cmt_date() {
		return img_cmt_date;
	}
	public void setImg_cmt_date(String img_cmt_date) {
		this.img_cmt_date = img_cmt_date;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	
	
}
