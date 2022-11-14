package kr.imgboard.controller;

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
import kr.img_comment.entity.Img_comment;
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.imgboard.entity.Img_Board;
import kr.login.entity.Member;
import kr.zw_board.entity.Zw_Board;
import kr.zw_comment.entity.zw_comment;


public class ImgBoardViewController implements kr.login.controller.Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Img_Board vo = new Img_Board();
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		HttpSession session = request.getSession();
		Member mb = (Member)session.getAttribute("mvo");
		int num = Integer.parseInt(request.getParameter("num"));
		
		if(mb!=null) {
			String login_id = mb.getLogin_id();
			Map<String,Object> m = new HashMap<>();
			m.put("no",num);
			m.put("id",login_id);
			int result = dao.imglikeCheck(m);
			request.setAttribute("imglikecheck", result);
		}
		
		
		
		String p = request.getParameter("p");
		if (p==null || p=="0") {
			p = "1";
		}
		
		
		
		vo = dao.imgboardView(num);
		dao.imgcountUpdate(num);
		request.setAttribute("imgvo", vo);
		
		request.setAttribute("p", Integer.parseInt(p));
		return "imgboard/imgBoardView";
	}

}
