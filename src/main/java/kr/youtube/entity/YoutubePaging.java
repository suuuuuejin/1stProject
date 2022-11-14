package kr.youtube.entity;

public class YoutubePaging {
	private int pagePerCount = 6;//한 페이지에 나올 게시글 수
	private int pagingPerCount = 3; // 한번에 보여줄 페이징 숫자 갯수 
	private int allPageCount;//전체 게시글 수
	private int numPageCount;// 전체 게시글 수 / 한 페이지=> 모든 페이지의 개수
	private int startCount;
	private int endCount;
	private int start_page;
	private int end_page;
	private int currentPage;
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setPagePerCount(int pagePerCount) {
		this.pagePerCount = pagePerCount;
	}
	public void setAllPageCount(int allPageCount) {
		this.allPageCount = allPageCount;
	}
	public void calculatePageCount() {
		numPageCount = allPageCount/pagePerCount;
		if(allPageCount%pagePerCount!=0) {
			numPageCount+=5;
		}
	}
	public void startCount(int pageNum) {
		startCount=(pageNum-1)*pagePerCount+1;
	}
	public void endCount(int pageNum) {
		endCount=pageNum*pagePerCount;
	}
	public int getNumPageCount() {
		return numPageCount;
	}
	public int getStartCount() {
		return startCount;
	}
	public int getEndCount() {
		return endCount;
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
	
	public void start_Page(int pageNum) {
		int display = 0;
		
		display = (int)Math.ceil((pageNum-1)/pagingPerCount);
		start_page = (pagingPerCount * display) + 1;
	}
	
	public void end_Page(int pageNum) {
		int display = 0;
		
		display = (int)Math.ceil((pageNum-1)/pagingPerCount);
		if(allPageCount/pagePerCount <((pagingPerCount * display) + 3)) {
			end_page = (int) Math.ceil((double)allPageCount/pagePerCount);
		}else {
			end_page = (pagingPerCount * display) + pagingPerCount;

		}
	}
	
	
	public int getPagingPerCount() {
		return pagingPerCount;
	}
	public void setPagingPerCount(int pagingPerCount) {
		this.pagingPerCount = pagingPerCount;
	}
	@Override
	public String toString() {
		return "YoutubePaging [pagePerCount=" + pagePerCount + ", allPageCount=" + allPageCount + ", numPageCount="
				+ numPageCount + ", startCount=" + startCount + ", endCount=" + endCount + ", start_page=" + start_page
				+ ", end_page=" + end_page + "]";
	}
}
