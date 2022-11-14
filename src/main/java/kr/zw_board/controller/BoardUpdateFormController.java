package kr.zw_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.zw_board.entity.Zw_Board;

public class BoardUpdateFormController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		Zw_Board vo =dao.boardView(num);
		request.setAttribute("vo", vo);
		
		return "board/boardUpdate";
	}

}
