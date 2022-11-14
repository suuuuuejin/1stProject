package kr.login.controller;

import java.io.IOException;

import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;

public class LoginController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");

		String login_id = request.getParameter("login_id");
		String u_pw = request.getParameter("u_pw");
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		Member vo = new Member();
		vo.setLogin_id(login_id);
		vo.setU_pw(u_pw);
//		Member mvo = dao.login(vo);
		Member vo2 = dao.findMember(login_id);
		System.out.println(vo2);
		
		String nextpage;
		if ( vo2!=null && Objects.equals(vo2.getU_pw(),u_pw)) {
			Member mb = dao.memberView(login_id);
			String gd = mb.getU_grade();
			int pt = mb.getU_point();

			System.out.println(gd);
			String grade = "";
			MemberMyBatisDAO m = new MemberMyBatisDAO();
			Member v = new Member();
			if (pt >= 100 && gd.equals("지구프랜즈")) {
				gd = "지구지킴단";
				v.setU_grade(gd);
				v.setLogin_id(login_id);
				v.setU_point(pt - 100);
				m.gradeUp(v);
			} else if (pt >= 100 && gd.equals("지구지킴단")) {
				gd = "지구특공대";
				v.setU_grade(gd);
				v.setLogin_id(login_id);
				v.setU_point(pt - 100);
				m.gradeUp(v);
			} else if (pt >= 100 && gd.equals("지구특공대")) {
				gd = "지구어벤져스";
				v.setU_grade(gd);
				v.setLogin_id(login_id);
				v.setU_point(pt - 100);
				m.gradeUp(v);
			}

			if (gd.equals("지구프랜즈")) {
				grade = "/img/my/11.png";
			}
			if (gd.equals("지구지킴단")) {
				grade = "/img/my/22.png";
			}
			if (gd.equals("지구특공대")) {
				grade = "/img/my/33.png";
			}
			if (gd.equals("지구어벤져스")) {
				grade = "/img/my/44.png";
			}
			if (gd.equals("admin")) {
				grade = "/img/my/55.png";
			}
			Member mvo = dao.login(vo);
			
				// 로그인 성공
				// 쿠키를 활용한 로그인 처리
				// Cookie cookie = new Cookie("user_id","user_id");
				// response.addCookie(cookie);

				// JSP는 session이 내장객체로 지정되어있지만
				// Servlet은 내장객체라는 개념이 없음

				HttpSession session = request.getSession();
				session.setAttribute("mvo", mvo);
				session.setAttribute("grade", grade);

				// 로그인 성공하면 메인페이지로
				nextpage = "redirect:/main.do";
			
		} else {
			String alt = "alert('아이디나 비밀번호가 틀렸습니다');";
			request.setAttribute("alt", alt);
			nextpage = "login/loginHTML";
		}

		return nextpage;
	}

}