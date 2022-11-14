package kr.join.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.login.controller.Controller;

public class MemberUpdateFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 수정데이터를 가져오기 -> 수정화면(memberUpdateForm.jsp)
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		String login_id=request.getParameter("login_id");
		System.out.println(login_id);
		Member vo=dao.memberView(login_id);
		request.setAttribute("vo", vo);
		return "join/memberUpdate";
	}

}
