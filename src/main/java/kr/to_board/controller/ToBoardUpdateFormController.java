package kr.to_board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.ToBoard;

public class ToBoardUpdateFormController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		ToBoard vo =dao.toboardView(num);
		request.setAttribute("vo", vo);
		
		return "toBoard/toBoardUpdate";
	}

}
