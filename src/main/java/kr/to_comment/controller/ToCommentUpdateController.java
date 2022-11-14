package kr.to_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.to_comment;

public class ToCommentUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int tb_cmt_seq = Integer.parseInt(request.getParameter("tb_cmt_seq"));
		String tb_cmt_content = request.getParameter("tb_cmt_content");
		to_comment zcom = new to_comment();
		zcom.setTb_cmt_seq(tb_cmt_seq);
		zcom.setTb_cmt_content(tb_cmt_content);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.tocommentUpdate(zcom);
		

		return null;
	}

}
