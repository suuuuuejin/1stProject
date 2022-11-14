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


public class MypageWriteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberMyBatisDAO dao=new MemberMyBatisDAO();
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("mvo");
		System.out.println("vo"+vo);
		List<Board> list=dao.myWriteZero(vo.getLogin_id());
		System.out.println("list"+list);
		request.setAttribute("list", list);
		MemberMyBatisDAO a= new MemberMyBatisDAO();
		int cmw =a.myWriteCount(vo.getLogin_id());
	    session.setAttribute("cmw", cmw);
	    int cmc =a.myCommentCount(vo.getLogin_id());
	    session.setAttribute("cmc", cmc);
		return "mypage/mypageWrite";
	}

}
