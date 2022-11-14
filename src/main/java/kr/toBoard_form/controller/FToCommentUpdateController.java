package kr.toBoard_form.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.login.entity.Member;
import kr.toBoard.entity.to_form;

public class FToCommentUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int tb_seq = Integer.parseInt(request.getParameter("tb_seq"));
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("mvo");
		String login_id=vo.getLogin_id();
		
		System.out.println(tb_seq);
		System.out.println(user_name);
		System.out.println(user_phone);
		to_form zcom = new to_form();
		zcom.setTb_seq(tb_seq);
		zcom.setUser_phone(user_phone);
		zcom.setUser_name(user_name);
		zcom.setLogin_id(login_id);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int cnt=dao.ftocommentUpdate(zcom);
		/*
		 * PrintWriter out =response.getWriter(); out.println(cnt);
		 */

		return null;
	}

}
