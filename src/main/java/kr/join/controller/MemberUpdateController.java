package kr.join.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.login.controller.Controller;

public class MemberUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 수정처리 -> 마이페이지 수정페이지로...
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		String login_id = request.getParameter("login_id");
		String u_pw = request.getParameter("u_pw");
		String user_name = request.getParameter("user_name");
		System.out.println("user_name : "+user_name);
		String u_birthdate = request.getParameter("u_birthdate");
		String joindate = request.getParameter("joindate");
		String post = request.getParameter("post");
		String u_addr = request.getParameter("u_addr")+request.getParameter("u_addr1");
		String u_nick = request.getParameter("u_nick");
		System.out.println();
		Member vo = new Member();
		vo.setLogin_id(login_id);
		vo.setU_pw(u_pw);
		vo.setUser_name(user_name);
		vo.setU_birthdate(u_birthdate);	
		vo.setJoindate(joindate);
		vo.setPost(post);
		vo.setU_addr(u_addr);
		vo.setU_nick(u_nick);
		System.out.println(vo);
	    dao.memberUpdate(vo);
	    // nextPage="redirect:/memberView.do";
		/* return "redirect:/memberView.do?login_id="+login_id; */
	    return "redirect:/memberView.do";
	}

}
