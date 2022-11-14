package kr.join.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.login.controller.Controller;

public class IdCheckController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// dao로 아이디 중복체크
		System.out.println("idCheck 실행");
		request.setCharacterEncoding("utf-8");
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		String login_id=request.getParameter("login_id");
		int cnt=0;
		cnt=dao.getById(login_id);
		System.out.println("cnt값"+cnt);
		request.setAttribute("cnt", cnt);
		
		
		return "join/idcheck2";
	}

}
