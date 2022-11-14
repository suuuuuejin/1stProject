package kr.buy_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.board.dao.BoardMyBatisDAO;
import kr.buy_board.entity.Buy_Board;
import kr.login.controller.Controller;

public class BuyBoardUpdateFormController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		Buy_Board vo =dao.buyboardView(num);
		request.setAttribute("vo", vo);
		
		return "buy/buyboardUpdate";
	}

}
