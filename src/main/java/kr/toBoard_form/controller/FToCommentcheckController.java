package kr.toBoard_form.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.to_form;

public class FToCommentcheckController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int tb_seq = Integer.parseInt(request.getParameter("tb_seq"));
		String login_id=request.getParameter("login_id");
		char attedancy_check =request.getParameter("attedancy_check").charAt(0);
		System.out.println(tb_seq);
		System.out.println(login_id);
		System.out.println(attedancy_check);
		
		to_form tf=new to_form();
		tf.setLogin_id(login_id);
		tf.setTb_seq(tb_seq);
		tf.setAttedancy_check(attedancy_check);
		
		BoardMyBatisDAO dao= new BoardMyBatisDAO();
		dao.ftoCommentCheck(tf);
		int cnt=0;
		if(attedancy_check=='o') {
			cnt=dao.ftoCommentPoint(login_id);
		}
		PrintWriter out = response.getWriter();
		out.println(cnt);
		
		
		return null;
	}

}
