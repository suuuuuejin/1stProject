package kr.zw_comment.controller;

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
import kr.zw_comment.entity.zw_comment;




public class CommentWriteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int zw_seq = Integer.parseInt(request.getParameter("zw_seq"));
		String login_id = request.getParameter("login_id");
		String zw_cmt_content = request.getParameter("zw_cmt_content");
	
		zw_comment cb = new zw_comment();
		cb.setZw_seq(zw_seq);
		cb.setLogin_id(login_id);
		cb.setZw_cmt_content(zw_cmt_content);
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		System.out.println(cb.getZw_seq());
		dao.commentWrite(cb);
		
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
