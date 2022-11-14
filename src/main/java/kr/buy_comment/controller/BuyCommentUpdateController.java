package kr.buy_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.buy_comment.entity.buy_comment;
import kr.login.controller.Controller;

public class BuyCommentUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int buy_cmt_seq = Integer.parseInt(request.getParameter("buy_cmt_seq"));
		String buy_cmt_content = request.getParameter("buy_cmt_content");
		buy_comment zcom = new buy_comment();
		zcom.setBuy_cmt_seq(buy_cmt_seq);
		zcom.setBuy_cmt_content(buy_cmt_content);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.buycommentUpdate(zcom);
		

		return null;
	}

}
