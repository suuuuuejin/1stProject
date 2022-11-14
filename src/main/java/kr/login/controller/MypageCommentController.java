package kr.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.zw_board.entity.Board;
import kr.zw_comment.entity.zw_comment;

public class MypageCommentController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberMyBatisDAO dao=new MemberMyBatisDAO();
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("mvo");
		System.out.println("vo"+vo);
		
		List<zw_comment> list=dao.myComment(vo.getLogin_id());
		System.out.println("list"+list);
		request.setAttribute("list", list);
		return "mypage/mypageComment";
	}

}
