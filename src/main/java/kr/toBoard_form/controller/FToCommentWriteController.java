package kr.toBoard_form.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.to_form;




public class FToCommentWriteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int tb_seq = Integer.parseInt(request.getParameter("tb_seq"));
		String login_id = request.getParameter("login_id");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
	
		to_form cb = new to_form();
		cb.setUser_phone(user_phone);
		cb.setLogin_id(login_id);
		cb.setUser_name(user_name);
		cb.setTb_seq(tb_seq);
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.ftocommentWrite(cb);
		
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
