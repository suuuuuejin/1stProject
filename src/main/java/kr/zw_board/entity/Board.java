package kr.zw_board.entity;

public class Board {
	private int zw_seq;
	private String zw_title;
	private String zw_content;
	private String zw_file;
	private String zw_date;
	private String login_id;
	private int zw_cnt;
	private int zw_likes;
	private int notice;
	private int zw_cmtcnt;  //댓글수
	private String u_grade;
	
	
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public int getZw_seq() {
		return zw_seq;
	}
	public int getZw_cmtcnt() {
		return zw_cmtcnt;
	}
	public void setZw_cmtcnt(int zw_cmtcnt) {
		this.zw_cmtcnt = zw_cmtcnt;
	}
	public void setZw_seq(int zw_seq) {
		this.zw_seq = zw_seq;
	}
	public String getZw_title() {
		return zw_title;
	}
	public void setZw_title(String zw_title) {
		this.zw_title = zw_title;
	}
	public String getZw_content() {
		return zw_content;
	}
	public void setZw_content(String zw_content) {
		this.zw_content = zw_content;
	}
	public String getZw_file() {
		return zw_file;
	}
	public void setZw_file(String zw_file) {
		this.zw_file = zw_file;
	}
	public String getZw_date() {
		return zw_date;
	}
	public void setZw_date(String zw_date) {
		this.zw_date = zw_date;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public int getZw_cnt() {
		return zw_cnt;
	}
	public void setZw_cnt(int zw_cnt) {
		this.zw_cnt = zw_cnt;
	}
	public int getZw_likes() {
		return zw_likes;
	}
	public void setZw_likes(int zw_likes) {
		this.zw_likes = zw_likes;
	}

	
	
	
}

