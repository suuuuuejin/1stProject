package kr.zw_board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.zw_board.entity.BoardPaging;
import kr.zw_board.entity.Member;
import kr.zw_board.entity.Zw_Board;

public class SearchListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p = request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		String val = request.getParameter("val");
		String text = request.getParameter("text");
		
		Map<String,Object> m = new HashMap<>();
		m.put("val",val);
		m.put("text",text);
		System.out.println(m.get("val"));

		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		BoardPaging board = new BoardPaging(); 
		
		board.setAllPageCount(dao.searchListCount(m));
		
		board.calculatePageCount();
		board.startCount(Integer.parseInt(p));
		board.endCount(Integer.parseInt(p));
		board.start_Page(Integer.parseInt(p));
		board.end_Page(Integer.parseInt(p));
		board.setCurrentPage(Integer.parseInt(p));
		m.put("board", board);
		
		List<Zw_Board> list=dao.searchList(m);
		List<Zw_Board> notice_list =dao.noticeList();
		request.setAttribute("notice", notice_list);
		request.setAttribute("list2", list);
		request.setAttribute("board2", board);
		request.setAttribute("val", val);
		request.setAttribute("text", text);
//		String nextPage = "boardList";
		return "board/SearchList";
		
		
		
		
		//Member mb = new Member();
		
		// controller ----forward---> view
		// 객체(request)바인딩
		// foward :jsp로갈때 (view)
		
		// view 에 forward
		
	}

}
