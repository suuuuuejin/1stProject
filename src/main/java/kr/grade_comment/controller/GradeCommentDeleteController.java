package kr.grade_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;

public class GradeCommentDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("grade_cmt_seq"));
		System.out.println(num);
		BoardMyBatisDAO dao= new BoardMyBatisDAO();
		int cnt =dao.commentDelete(num);
		
		
		
		return null;
	}

}
