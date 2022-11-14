package kr.to_board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;

public class ToNoticeController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		dao.toUpdateNotice(num);
		System.out.println("notcie update");
		
		return "redirect:/tolist.do";
	}
	
}
