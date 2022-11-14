package kr.grade_comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.grade_comment.entity.Grade_comment;




public class GradeCommentWriteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int grade_seq = Integer.parseInt(request.getParameter("grade_seq"));
		String login_id = request.getParameter("login_id");
		String grade_cmt_content = request.getParameter("grade_cmt_content");
	
		Grade_comment cb = new Grade_comment();
		cb.setGrade_seq(grade_seq);
		cb.setLogin_id(login_id);
		cb.setGrade_cmt_content(grade_cmt_content);
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		System.out.println(cb.getGrade_seq());
		dao.gradeCommentWrite(cb);
		
//		List<grade_comment> list = dao.allComment(grade_seq);
//		
//		request.setAttribute("comlist", list);
//		Gson gson = new Gson();
//		String json = gson.toJson(list);
//		response.setContentType("text/json;charset=utf-8");
//		PrintWriter out =response.getWriter();
//		out.println(json); // data만 callback함수로 전달 ㅔ
//		System.out.println(json);
		return null;
	}
	

}
