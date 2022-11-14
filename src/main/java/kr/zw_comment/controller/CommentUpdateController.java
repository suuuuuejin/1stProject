package kr.zw_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.zw_comment.entity.zw_comment;

public class CommentUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int zw_cmt_seq = Integer.parseInt(request.getParameter("zw_cmt_seq"));
		String zw_cmt_content = request.getParameter("zw_cmt_content");
		zw_comment zcom = new zw_comment();
		zcom.setZw_cmt_seq(zw_cmt_seq);
		zcom.setZw_cmt_content(zw_cmt_content);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.commentUpdate(zcom);
		

		return null;
	}

}
