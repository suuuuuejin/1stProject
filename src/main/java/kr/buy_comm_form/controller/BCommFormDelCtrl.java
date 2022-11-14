package kr.buy_comm_form.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.dao.BoardMyBatisDAO;
import kr.buy_comm_form.entity.BCommForm;
import kr.login.controller.Controller;
import kr.login.entity.Member;

public class BCommFormDelCtrl implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int buy_seq= Integer.parseInt(request.getParameter("buy_seq")) ;
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		String login_id =mo.getLogin_id();
		System.out.println(login_id);
		
		BCommForm vo=new BCommForm();
		vo.setBuy_seq(buy_seq);
		vo.setLogin_id(login_id);
		BoardMyBatisDAO dao= new BoardMyBatisDAO();
		int cnt =dao.BCommFormDelete(vo);
		
		return null;
		
	}
}
