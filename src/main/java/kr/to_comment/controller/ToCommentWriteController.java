package kr.to_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.to_comment;




public class ToCommentWriteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int tb_seq = Integer.parseInt(request.getParameter("tb_seq"));
		String login_id = request.getParameter("login_id");
		String tb_cmt_content = request.getParameter("tb_cmt_content");
	
		to_comment cb = new to_comment();
		cb.setTb_seq(tb_seq);
		cb.setLogin_id(login_id);
		cb.setTb_cmt_content(tb_cmt_content);
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		System.out.println(cb.getTb_seq());
		dao.tocommentWrite(cb);
		
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
