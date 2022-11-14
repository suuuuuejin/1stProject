package kr.join.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.controller.Controller;

public class MemberDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 삭제처리->메인페이지로
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		String login_id = request.getParameter("login_id");
		dao.memberDelete(login_id);
		// newtPage="redirect:/main.do";
		return "redirect:/main.do";
	}

}
