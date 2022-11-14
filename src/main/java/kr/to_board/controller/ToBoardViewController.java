package kr.to_board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.login.entity.Member;
import kr.toBoard.entity.ToBoard;
import kr.toBoard.entity.to_comment;


public class ToBoardViewController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ToBoard vo = new ToBoard();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int num;
		if(request.getParameter("num")==null) {
		num = 1;
		}else {
			num=Integer.parseInt(request.getParameter("num"));
		}
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		
		if(mo!=null) {
			String login_id =mo.getLogin_id();
			Map<String,Object> m = new HashMap<>();
			m.put("no",num);
			m.put("id",login_id);
			int result = dao.tolikeCheck(m);
			request.setAttribute("likecheck", result);
		}
		
		String p = request.getParameter("p");
		if (p==null || p=="0") {
			p = "1";
		}
		List<to_comment> list = dao.toallComment(num);
		
		request.setAttribute("comlist", list);
		vo = dao.toboardView(num);
		dao.tocountUpdate(num);
		request.setAttribute("vo", vo); //글쓴사람의 정보
		int likes = dao.tolikeCount(num);
		System.out.println(likes);
		request.setAttribute("likes", likes);
		request.setAttribute("p", Integer.parseInt(p));
		return "toBoard/toBoardView";
	}

}