package kr.join.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.controller.Controller;

public class NicCheckController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("nicCheck 실행");
		request.setCharacterEncoding("utf-8");
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		String u_nick=request.getParameter("u_nick");
		int cnt=0;
		cnt=dao.getByNic(u_nick);
		System.out.println("cnt값"+cnt);
		request.setAttribute("cnt", cnt);
		
		
		return "join/niccheck";
		
	}

}
