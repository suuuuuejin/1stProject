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
import kr.zw_comment.entity.zw_comment;

public class MyComVgController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberMyBatisDAO dao=new MemberMyBatisDAO();
		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("mvo");
		System.out.println("vo="+vo);
		List<zw_comment> list=dao.myComVg(vo.getLogin_id());
		System.out.println("list="+list);
		for (zw_comment i : list) {
			System.out.println(i.getZw_cmt_content());
		}
		Gson gson = new Gson();
		String json=gson.toJson(list); //array list가 json형태[{},{}]로 변형
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out=response.getWriter(); //빨대만듬
		out.println(json); 
		return null;
		
	}

}
