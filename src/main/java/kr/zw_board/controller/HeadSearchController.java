package kr.zw_board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.zw_board.entity.BoardPaging;
import kr.zw_board.entity.Zw_Board;

public class HeadSearchController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p = request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		
		String headval = request.getParameter("headval");
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		BoardPaging board = new BoardPaging(); 
		
		board.setAllPageCount(dao.searchheadCount(headval));
		
		board.calculatePageCount();
		board.startCount(Integer.parseInt(p));
		board.endCount(Integer.parseInt(p));
		board.start_Page(Integer.parseInt(p));
		board.end_Page(Integer.parseInt(p));
		board.setCurrentPage(Integer.parseInt(p));
		
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("headval", headval);
		m.put("board", board);
		
		List<Zw_Board> list = dao.HdSearchList(m);
		List<Zw_Board> notice_list =dao.noticeList();
		request.setAttribute("notice", notice_list);
		
		request.setAttribute("notice", notice_list);
		request.setAttribute("list2", list);
		request.setAttribute("board2", board);
		request.setAttribute("headval", headval);
		return "board/hlSearchList";
	}

}
