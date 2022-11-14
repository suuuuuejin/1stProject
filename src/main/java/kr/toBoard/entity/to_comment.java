package kr.toBoard.entity;

public class to_comment {
private int tb_cmt_seq ;
private int tb_seq ;
private String tb_cmt_content ; 
private String tb_cmt_date ;
private String login_id ;
private String u_grade;

public String getU_grade() {
	return u_grade;
}
public void setU_grade(String u_grade) {
	this.u_grade = u_grade;
}
public int getTb_cmt_seq() {
	return tb_cmt_seq;
}
public void setTb_cmt_seq(int tb_cmt_seq) {
	this.tb_cmt_seq = tb_cmt_seq;
}
public int getTb_seq() {
	return tb_seq;
}
public void setTb_seq(int tb_seq) {
	this.tb_seq = tb_seq;
}
public String getTb_cmt_content() {
	return tb_cmt_content;
}
public void setTb_cmt_content(String tb_cmt_content) {
	this.tb_cmt_content = tb_cmt_content;
}
public String getTb_cmt_date() {
	return tb_cmt_date;
}
public void setTb_cmt_date(String tb_cmt_date) {
	this.tb_cmt_date = tb_cmt_date;
}
public String getLogin_id() {
	return login_id;
}
public void setLogin_id(String login_id) {
	this.login_id = login_id;
}

}
