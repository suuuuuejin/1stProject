package kr.map.entity;

public class Mapvo {
	private String store_num;
	private String store_name;
	private String store_addr;
	private String homepage;
	
	public Mapvo() {
		
	}
	
	public Mapvo(String store_num, String store_name, String store_addr, String homepage) {
		super();
		this.store_num = store_num;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.homepage = homepage;
	}
	
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_addr() {
		return store_addr;
	}
	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}
	
	public String getStore_num() {
		return store_num;
	}

	public void setStore_num(String store_num) {
		this.store_num = store_num;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	@Override
	public String toString() {
		return "Map [store_num=" + store_num + ", store_name=" + store_name + ", store_addr=" + store_addr
				+ ", homepage=" + homepage + "]";
	}
	
	
	
	
	
}
