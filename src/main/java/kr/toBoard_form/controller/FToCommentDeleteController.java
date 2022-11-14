package kr.toBoard_form.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.to_form;

public class FToCommentDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login_id= request.getParameter("login_id");
		int tb_seq= Integer.parseInt(request.getParameter("tb_seq")) ;
		to_form vo=new to_form();
		vo.setLogin_id(login_id);
		vo.setTb_seq(tb_seq);
		System.out.println(login_id);
		BoardMyBatisDAO dao= new BoardMyBatisDAO();
		int cnt =dao.ftocommentDelete(vo);
		
		
		
		return null;
	}

}
