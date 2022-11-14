package kr.map.crawling;


import java.util.ArrayList;



import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import kr.login.dao.MemberMyBatisDAO;
import kr.map.entity.Mapvo;



public class vegan {

  public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; // 드라이버 ID
  public static final String WEB_DRIVER_PATH = "C:\\eGovFrame-4.0.0\\workspace.edu\\chromedriver.exe"; // 드라이버 경로

  
  
  public static void main(String[] args) throws InterruptedException {
	  
    System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
    List<String> store_title = new ArrayList<String>();
    List<String> store_addr = new ArrayList<String>();
    List<String> store_homepages = new ArrayList<String>();
    ChromeOptions options = new ChromeOptions();
    
    // 브라우저 보이지 않기
    options.addArguments("headless");

    WebDriver driver = new ChromeDriver(options);
    
    
    driver.get("https://map.kakao.com/");
    
    
    
    driver.findElement(By.id("search.keyword.query")).sendKeys("비건");
    driver.findElement(By.id("search.keyword.submit")).sendKeys(Keys.ENTER);
    driver.findElement(By.id("dimmedLayer")).click();
    Thread.sleep(2000);
    
    
    
    List<WebElement> store_titles = driver.findElements(By.className("link_name"));
    List<WebElement> store_addrs = driver.findElements(By.className("addr"));
    List<WebElement> store_homepage = driver.findElements(By.cssSelector("[data-id='homepage']"));
    
    
    for(WebElement el : store_homepage) {
    	store_homepages.add(el.getAttribute("href").replaceAll("https://map.kakao.com/#none", "없음"));
    }
    for(WebElement el : store_titles) {
    	store_title.add(el.getText());
    }
    for(WebElement el : store_addrs) {
    	store_addr.add(el.getText().split("\n")[0]);
    }
    
    
    driver.findElement(By.id("info.search.place.more")).click();
    Thread.sleep(2000);
    
    int page = 2;
    do {
    	store_titles = driver.findElements(By.className("link_name"));
        store_addrs = driver.findElements(By.className("addr"));
    	store_homepage = driver.findElements(By.cssSelector("[data-id='homepage']"));
    	
    	System.out.println(store_title.size());
    	
    	
    	
    	
    	
        for(WebElement el : store_titles) {
        	store_title.add(el.getText());
        }
        for(WebElement el : store_addrs) {
        	store_addr.add(el.getText().split("\n")[0]);
        }
        
        for(WebElement el : store_homepage) {
        	store_homepages.add(el.getAttribute("href").replaceAll("https://map.kakao.com/#none", "없음"));
        }
        
        
        if(store_titles.size()<15) {
    		break;
        }
        
        if(page==5) {
        	page=1;
        	driver.findElement(By.id("info.search.page.next")).click();
        }else {
        	page+=1;
        	driver.findElement(By.id("info.search.page.no"+page)).click();
        }
        
        
        Thread.sleep(2000);
    }while(store_titles.size()>=15);
    

    // 브라우저 닫기
    if (driver != null) {
      driver.close();
      // driver.quit();
    }
    
    MemberMyBatisDAO dao = new MemberMyBatisDAO();
    Mapvo vo = new Mapvo();
    System.out.println(store_title.size());
    
    
    for(int i=0; i<store_title.size();i++) {
    	vo.setStore_name(store_title.get(i));
    	vo.setStore_addr(store_addr.get(i));
    	vo.setHomepage(store_homepages.get(i));
    	System.out.println(vo);
    	dao.MapVData(vo);
    	
    }

    
  }
}