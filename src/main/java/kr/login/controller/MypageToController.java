package kr.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.zw_board.entity.Board;

public class MypageToController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberMyBatisDAO dao=new MemberMyBatisDAO();
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("mvo");
		System.out.println("vo="+vo);
		List<Board> list=dao.myWriteTo(vo.getLogin_id());
		System.out.println("mypagevg="+list);
		Gson gson = new Gson();
		String json=gson.toJson(list); //array list가 json형태[{},{}]로 변형
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out=response.getWriter(); //빨대만듬
		out.println(json); 
		return null;
	}

}
