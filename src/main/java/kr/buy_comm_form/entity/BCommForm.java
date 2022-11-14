package kr.buy_comm_form.entity;

public class BCommForm {
	private String login_id;
	private String user_name;
	private String user_addr;
	private String user_phone;
	private int user_amount;
	private int buy_seq;
	
	private int goods_seq;
	private String goods_name;
	private int goods_cnt;
	private int bf_seq;
	
	public int getGoods_seq() {
		return goods_seq;
	}
	public void setGoods_seq(int goods_seq) {
		this.goods_seq = goods_seq;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getGoods_cnt() {
		return goods_cnt;
	}
	public void setGoods_cnt(int goods_cnt) {
		this.goods_cnt = goods_cnt;
	}
	public int getBf_seq() {
		return bf_seq;
	}
	public void setBf_seq(int bf_seq) {
		this.bf_seq = bf_seq;
	}
	
	
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
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
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public int getUser_amount() {
		return user_amount;
	}
	public void setUser_amount(int user_amount) {
		this.user_amount = user_amount;
	}
	public int getBuy_seq() {
		return buy_seq;
	}
	public void setBuy_seq(int buy_seq) {
		this.buy_seq = buy_seq;
	}
	
	@Override
	public String toString() {
		return "BCommForm [login_id=" + login_id + ", user_name=" + user_name + ", user_addr=" + user_addr
				+ ", user_phone=" + user_phone + ", user_amount=" + user_amount + ", buy_seq=" + buy_seq
				+ ", goods_seq=" + goods_seq + ", goods_name=" + goods_name + ", goods_cnt=" + goods_cnt + ", bf_seq="
				+ bf_seq + "]";
	}
	
	
	
}
