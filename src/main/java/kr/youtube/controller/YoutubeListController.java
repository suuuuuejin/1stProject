package kr.youtube.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.youtube.entity.Youtube;
import kr.youtube.entity.YoutubePaging;

public class YoutubeListController implements Controller{
	
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p =request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		//페이징 처리
		YoutubePaging youtube = new YoutubePaging(); 
		youtube.setAllPageCount(dao.allyoutubecount());
		youtube.calculatePageCount();
		youtube.startCount(Integer.parseInt(p));
		youtube.endCount(Integer.parseInt(p));
		youtube.start_Page(Integer.parseInt(p));
		youtube.end_Page(Integer.parseInt(p));
		
		request.setAttribute("youtube", youtube);
		List<Youtube> list =dao.youtubeSomeList(youtube);
		System.out.println(list.get(0).getLogo());
		request.setAttribute("list", list);
		// 유투브 정보 DAO로 가져오기
		
		
		// request 객체에 넣기

		return "youtube/youtubeList";
	}
}

