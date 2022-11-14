package kr.grade.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.dao.BoardMyBatisDAO;
import kr.grade.entity.grade_Board;
import kr.grade_comment.entity.Grade_comment;
import kr.login.controller.Controller;
import kr.login.entity.Member;


public class GradeViewController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		grade_Board vo = new grade_Board();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		
		if(mo!=null) {
			String login_id =mo.getLogin_id();
			Map<String,Object> m = new HashMap<>();
			m.put("no",num);
			m.put("id",login_id);
			int result = dao.likeCheck(m);
			request.setAttribute("likecheck", result);
		}
		
		String p = request.getParameter("p");
		
		if (p.equals("") || p.equals("0")) {
			p = "1";
		}
		
		List<Grade_comment> list = dao.gradeAllComment(num);
		
		request.setAttribute("comlist", list);
		vo = dao.gradeBoardView(num);
		dao.gradeCountUpdate(num);
		request.setAttribute("vo", vo);
		int likes = dao.gradeLikeCount(num);
		
		request.setAttribute("likes", likes);
		request.setAttribute("p", Integer.parseInt(p));
		return "grade_board/grade_boardView";
	}

}