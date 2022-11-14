package kr.join.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.login.controller.Controller;

public class MemberViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		// 상세보기처리->jsp
		/*
		 * String login_id=request.getParameter("login_id"); 
		 * Member vo = dao.memberView(login_id);
		 */
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("mvo");
		System.out.println(mvo.getLogin_id());
		Member vo = dao.memberView(mvo.getLogin_id());
		request.setAttribute("vo", vo);
		System.out.println("view vo="+vo);
		return "join/memberView";
	}

}
