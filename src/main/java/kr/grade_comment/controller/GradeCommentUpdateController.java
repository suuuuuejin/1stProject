package kr.grade_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.grade_comment.entity.Grade_comment;

public class GradeCommentUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int grade_cmt_seq = Integer.parseInt(request.getParameter("grade_cmt_seq"));
		String grade_cmt_content = request.getParameter("grade_cmt_content");
		Grade_comment gcom = new Grade_comment();
		gcom.setGrade_cmt_seq(grade_cmt_seq);
		gcom.setGrade_cmt_content(grade_cmt_content);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.gradeCommentUpdate(gcom);
		

		return null;
	}

}
