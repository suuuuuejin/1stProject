package kr.buy_comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.buy_comment.entity.buy_comment;
import kr.login.controller.Controller;




public class BuyCommentWriteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int buy_seq = Integer.parseInt(request.getParameter("buy_seq"));
		String login_id = request.getParameter("login_id");
		String buy_cmt_content = request.getParameter("buy_cmt_content");
	
		buy_comment cb = new buy_comment();
		cb.setBuy_seq(buy_seq);
		cb.setLogin_id(login_id);
		cb.setBuy_cmt_content(buy_cmt_content);
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		System.out.println(cb.getBuy_seq());
		dao.buycommentWrite(cb);
		
//		List<zw_comment> list = dao.allComment(zw_seq);
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
