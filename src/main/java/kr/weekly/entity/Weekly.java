package kr.weekly.entity;

public class Weekly {
	private String title;
	private String day;
	
	public Weekly() {}

	public Weekly(String title, String day) {
		super();
		this.title = title;
		this.day = day;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	
	
}
