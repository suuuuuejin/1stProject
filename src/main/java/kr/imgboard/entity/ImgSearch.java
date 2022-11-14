package kr.imgboard.entity;

import kr.board.dao.BoardMyBatisDAO;

public class ImgSearch {
	
	private static final int display_page = 5;
	private static final int view_list = 2;
	private int start_page;
	private int end_page;
	private int current_page = 1;
	private int list_start;
	private int list_end;
	private String val;
	private String text;
	
	
	
	public String getVal() {
		return val;
	}
	public void setVal(String val) {
		this.val = val;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getList_start() {
		return list_start;
	}
	public void setList_start(int list_start) {
		this.list_start = list_start;
	}
	public int getList_end() {
		return list_end;
	}
	public void setList_end(int list_end) {
		this.list_end = list_end;
	}


	
	
	public int getStart_page() {
		return start_page;
	}
	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}
	public int getEnd_page() {
		return end_page;
	}
	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}
	public int getCurrent_page() {
		return current_page;
	}
	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}
	
	
	public void list_Start(int page) {
		list_start = (page-1)*view_list+1;
	}
	public void list_End(int page) {
		list_end = page*view_list;
	}
	
	
	public void startPage() {
		int display = 0;
		
		display = (int)Math.ceil((current_page-1)/display_page);
		start_page = (display_page * display) + 1;
	}
	
	public void lastPage(int num) {
		int display = 0;
		
		//샵의 개수 구하기
		
		int page_len = num;
		
		
		display = (int)Math.ceil((current_page-1)/display_page);
		
		//목록 수를 15로 나눴을때의 값이 마지막 페이지보다 적으면 목록수/15값이 된다.
		if(page_len/view_list <((display_page * display) + 5)) {
			end_page = (int) Math.ceil(page_len/view_list)+1;
		}else {
			end_page = (display_page * display) + 5;
		}
		
		
		
	}
	
	
	@Override
	public String toString() {
		return "paging [start_page=" + start_page + ", end_page=" + end_page + ", current_page=" + current_page
				+ ", list_start=" + list_start + ", list_end=" + list_end + "]";
	}
	
	
	
}
