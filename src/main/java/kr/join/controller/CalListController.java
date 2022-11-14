package kr.join.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Cal;
import kr.login.entity.Member;
import kr.zw_board.entity.Board;
import kr.zw_board.entity.BoardPaging;
import kr.login.controller.Controller;

public class CalListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p = request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		System.out.println(p);
		//페이징 처리
		BoardPaging board = new BoardPaging(); 
		board.setAllPageCount(dao.allListCount());
		System.out.println(dao.allListCount());
		board.calculatePageCount();
		board.startCount(Integer.parseInt(p));
		board.endCount(Integer.parseInt(p));
		board.start_Page(Integer.parseInt(p));
		board.end_Page(Integer.parseInt(p));
		board.setCurrentPage(Integer.parseInt(p));
		List<Cal> list=dao.someList(board);
		System.out.println(board.getEnd_page());
		request.setAttribute("list", list);
		request.setAttribute("board", board);
		
//		String nextPage = "boardList";
		return "cal/column";
	}

}
