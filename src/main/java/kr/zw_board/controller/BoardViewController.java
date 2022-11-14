package kr.zw_board.controller;

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
import kr.login.controller.Controller;
import kr.login.entity.Member;
import kr.zw_board.entity.Zw_Board;
import kr.zw_comment.entity.zw_comment;


public class BoardViewController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Zw_Board vo = new Zw_Board();
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
		if (p==null || p=="0") {
			p = "1";
		}
//		List<zw_comment> list = dao.allComment(num);
//		
//		request.setAttribute("comlist", list);
		vo = dao.boardView(num);
		dao.countUpdate(num);
		System.out.println(vo.getNotice());
		request.setAttribute("vo", vo);
//		int likes = dao.likeCount(num);
//		System.out.println(likes);
//		request.setAttribute("likes", likes);
		
		request.setAttribute("p", Integer.parseInt(p));
		return "board/boardView";
	}

}
