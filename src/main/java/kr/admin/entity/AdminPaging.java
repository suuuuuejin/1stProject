package kr.admin.entity;


import java.util.Objects;

import kr.login.dao.MemberMyBatisDAO;



public class AdminPaging {
	
	//페이지 숫자
	private static final int display_page = 5;
	//한 페이지에 보여지는 게시물 수
	private int view_list = 10;
	private int start_page;
	private int end_page;
	private int current_page = 1;
	private int list_start;
	private int list_end;
	private String search;
	private String option;
	
	
	
	
	
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
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
	
	
	
	public int getView_list() {
		return view_list;
	}
	public void setView_list(int view_list) {
		this.view_list = view_list;
	}
	//view_list = 한 페이지에 보여지는 게시물 수
	public void list_Start(int page) {
		list_start = (page-1)*view_list+1;
	}
	
	public void list_End(int page) {
		list_end = page*view_list;
	}
	
	
	
	
	public void Notice_startPage() {
		int display = 0;
		
		
		// display_page 페이지 숫자 = 5
		display = (int)Math.ceil((current_page-1)/display_page); //1
		start_page = (display_page * display) + 1;
	}
	
	public void Notice_lastPage() {
		int display = 0;
		
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		int page_len;
		
		page_len = dao.noticeList();
		
		display = (int)Math.ceil((current_page-1)/display_page);
		

		if(page_len/view_list <((display_page * display) + 5)) {

			end_page = (int) Math.ceil(page_len/view_list)+1;
			
		}else {
			
			end_page = (display_page * display) + 5;
		}
		
	}
	
	
	public void startPage() {
		int display = 0;
		
		
		// display_page 페이지 숫자 = 5
		display = (int)Math.ceil((current_page-1)/display_page); //1
		start_page = (display_page * display) + 1;
	}
	
	
	public void lastPage() {
		int display = 0;
		
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		int page_len;
		

		if(Objects.equals(option, "user_id") && !(search != null)) {
			page_len = dao.adminList().size();
		}else if(Objects.equals(option, "user_nick") && !(search != null)) {
			page_len = dao.adminList().size();
		}else {
			page_len = dao.adminList().size();
		}
		
		
		
		
		display = (int)Math.ceil((current_page-1)/display_page);
		
		//view_list = 10
		//display_page = 5
		//page_len = 17
		
		//목록 수를 10로 나눴을때의 값이 마지막 페이지보다 적으면 목록수/15값이 된다.
		if(page_len/view_list <((display_page * display) + 5)) {

			end_page = (int) Math.ceil(page_len/view_list)+1;
			
		}else {
			
			end_page = (display_page * display) + 5;
		}
		
	}
	
	
	@Override
	public String toString() {
		return "paging [start_page=" + start_page + ", end_page=" + end_page + ", current_page=" + current_page
				+ ", list_start=" + list_start + ", list_end=" + list_end + ", search=" + search + "]";
	}
	
//	public void s_lastPage(String search) {
//		int display = 0;
//		
//		//샵의 개수 구하기
//		AdminDAO dao = new AdminDAO();
//		int page_len = dao.SearchList(search).size();
//		
//		
//		display = (int)Math.ceil((current_page-1)/display_page);
//		
//		//목록 수를 15로 나눴을때의 값이 마지막 페이지보다 적으면 목록수/15값이 된다.
//		if(page_len/view_list <((display_page * display) + 5)) {
//			end_page = (int) Math.ceil(page_len/view_list)+1;
//		}else {
//			end_page = (display_page * display) + 5;
//		}
//		
//	}
//	
//	
//	public void s_startPage() {
//		int display = 0;
//		
//		display = (int)Math.ceil((current_page-1)/display_page); //1
//		start_page = (display_page * display) + 1;
//	}
//	
//	public void s_endPage(String search) {
//		int display = 0;
//		
//		//샵의 개수 구하기
//		AdminDAO dao = new AdminDAO();
//		int page_len = dao.SearchList(search).size();
//		System.out.println(page_len);
//		
//		display = (int)Math.ceil((current_page-1)/display_page);
//		
//		//목록 수를 15로 나눴을때의 값이 마지막 페이지보다 적으면 목록수/15값이 된다.
//		if(page_len/view_list <((display_page * display) + 5)) {
//			end_page = (int) Math.ceil(page_len/view_list)+1;
//		}else if(page_len<=view_list){
//			end_page = (page_len/view_list)+1;
//		}else {
//			end_page = (display_page * display) + 5;
//		}
//		System.out.println("s_endPage : "+end_page);
//	}
	
	
	

}
