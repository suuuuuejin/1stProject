package kr.zw_board.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;

public class BoardDeleteNoticeController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("notice delete1");
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		dao.deleteNotice(num);
		System.out.println("notice delete2");
		
		return "redirect:/zwlist.do";

	}

	
}
