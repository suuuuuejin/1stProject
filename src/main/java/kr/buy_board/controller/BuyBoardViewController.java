package kr.buy_board.controller;

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
import kr.buy_board.entity.Buy_Board;
import kr.buy_comment.entity.buy_comment;
import kr.login.controller.Controller;
import kr.login.entity.Member;


public class BuyBoardViewController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Buy_Board vo = new Buy_Board();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		
		if(mo!=null) {
			String login_id =mo.getLogin_id();
			Map<String,Object> m = new HashMap<>();
			m.put("no",num);
			m.put("id",login_id);
			int result = dao.buylikeCheck(m);
			request.setAttribute("likecheck", result);
		}
		
		String p = request.getParameter("p");
		if (p==null  || p.equals("0")) {
			p = "1";
		}
//		List<buy_comment> list = dao.buyallComment(num);
//		
//		request.setAttribute("comlist", list);
		vo = dao.buyboardView(num);
		dao.buycountUpdate(num);
		request.setAttribute("vo", vo);
//		int likes = dao.buylikeCount(num);
//		request.setAttribute("likes", likes);
		request.setAttribute("p", Integer.parseInt(p));
		return "buy/buyView";
	}

}