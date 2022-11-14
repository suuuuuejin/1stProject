package kr.grade.entity;

public class grade_Board {
	private int grade_seq;
	private String grade_title;
	private String grade_headline;
	private String grade_content;
	private String grade_file;
	private String grade_regdate;
	private String login_id;
	private int grade_cnt;
	private int grade_likes;
	private int grade_cmtcnt;  //댓글수
	private int notice;
	private String u_grade;
	
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public int getGrade_seq() {
		return grade_seq;
	}
	public void setGrade_seq(int grade_seq) {
		this.grade_seq = grade_seq;
	}
	public String getGrade_title() {
		return grade_title;
	}
	public void setGrade_title(String grade_title) {
		this.grade_title = grade_title;
	}
	public String getGrade_content() {
		return grade_content;
	}
	public void setGrade_content(String grade_content) {
		this.grade_content = grade_content;
	}
	public String getGrade_file() {
		return grade_file;
	}
	public void setGrade_file(String grade_file) {
		this.grade_file = grade_file;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public int getGrade_cnt() {
		return grade_cnt;
	}
	public void setGrade_cnt(int grade_cnt) {
		this.grade_cnt = grade_cnt;
	}
	public int getGrade_likes() {
		return grade_likes;
	}
	public void setGrade_likes(int grade_likes) {
		this.grade_likes = grade_likes;
	}
	public int getGrade_cmtcnt() {
		return grade_cmtcnt;
	}
	public void setGrade_cmtcnt(int grade_cmtcnt) {
		this.grade_cmtcnt = grade_cmtcnt;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public String getGrade_regdate() {
		return grade_regdate;
	}
	public void setGrade_regdate(String grade_regdate) {
		this.grade_regdate = grade_regdate;
	}
	public String getGrade_headline() {
		return grade_headline;
	}
	public void setGrade_headline(String grade_headline) {
		this.grade_headline = grade_headline;
	}
	
	
}

