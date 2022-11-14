package kr.login.entity;

public class Kakao_member {
	private String login_id;
	private String user_name;
	private String u_nick;

	public Kakao_member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Kakao_member(String login_id, String user_name, String u_nick) {
		super();
		this.login_id = login_id;
		this.user_name = user_name;
		this.u_nick = u_nick;
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

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	@Override
	public String toString() {
		return "Kakao_member [login_id=" + login_id + ", user_name=" + user_name + ", u_nick=" + u_nick + "]";
	}

	
	
	
	
}
