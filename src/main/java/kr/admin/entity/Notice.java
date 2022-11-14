package kr.admin.entity;


public class Notice {
	
	private int seq;
	private String title;
	private String content;
	private String files;
	private String day;
	private String login_id;
	private int cnt;
	private int likes;
	private int cmtcnt; 
	private int notice;
	private String headline;
	private String u_grade;
	
//	private int zw_seq;
//	private String zw_title;
//	private String zw_content;
//	private String zw_file;
//	private String zw_date;
//	private String login_id;
//	private int zw_cnt;
//	private int zw_likes;
//	private int zw_cmtcnt;  //댓글수
	
	public String getU_grade() {
		return u_grade;
	}
	@Override
	public String toString() {
		return "Notice [seq=" + seq + ", title=" + title + ", content=" + content + ", files=" + files + ", day=" + day
				+ ", login_id=" + login_id + ", cnt=" + cnt + ", likes=" + likes + ", cmtcnt=" + cmtcnt + ", notice="
				+ notice + ", headline=" + headline + ", u_grade=" + u_grade + "]";
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getCmtcnt() {
		return cmtcnt;
	}
	public void setCmtcnt(int cmtcnt) {
		this.cmtcnt = cmtcnt;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}

}
