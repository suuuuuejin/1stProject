package kr.toBoard.entity;

public class ToBoard {
	private int tb_seq;
	private String tb_title;
	private String tb_headline;
	private String tb_content;
	private String tb_file;
	private String tb_regdate;
	private String login_id;
	private int tb_cnt;
	private int tb_likes;
	private int tb_cmtcnt;
	private int tb_formcnt;
	private String u_grade;
	private int notice;
	
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getTb_cmtcnt() {
		return tb_cmtcnt;
	}
	public void setTb_cmtcnt(int tb_cmtcnt) {
		this.tb_cmtcnt = tb_cmtcnt;
	}
	public int getTb_formcnt() {
		return tb_formcnt;
	}
	public void setTb_formcnt(int tb_formcnt) {
		this.tb_formcnt = tb_formcnt;
	}
	public int getTb_seq() {
		return tb_seq;
	}
	public void setTb_seq(int tb_seq) {
		this.tb_seq = tb_seq;
	}
	public String getTb_title() {
		return tb_title;
	}
	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}
	public String getTb_headline() {
		return tb_headline;
	}
	public void setTb_headline(String tb_headline) {
		this.tb_headline = tb_headline;
	}
	public String getTb_content() {
		return tb_content;
	}
	public void setTb_content(String tb_content) {
		this.tb_content = tb_content;
	}
	public String getTb_file() {
		return tb_file;
	}
	public void setTb_file(String tb_file) {
		this.tb_file = tb_file;
	}
	public String getTb_regdate() {
		return tb_regdate;
	}
	public void setTb_regdate(String tb_regdate) {
		this.tb_regdate = tb_regdate;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public int getTb_cnt() {
		return tb_cnt;
	}
	public void setTb_cnt(int tb_cnt) {
		this.tb_cnt = tb_cnt;
	}
	public int getTb_likes() {
		return tb_likes;
	}
	public void setTb_likes(int tb_likes) {
		this.tb_likes = tb_likes;
	}
	
	
	
}
