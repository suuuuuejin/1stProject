package kr.zw_board.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.board.dao.BoardMyBatisDAO;
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.login.entity.Member;

public class LikeController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int zw_seq = Integer.parseInt(request.getParameter("zw_seq"));
		/* String login_id = request.getParameter("login_id"); */
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		String login_id =mo.getLogin_id();
		
		Map<String,Object> m = new HashMap<>();
		m.put("no",zw_seq);
		m.put("id",login_id);
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int result = dao.likeCheck(m);
		System.out.println(result);
		System.out.println(zw_seq+login_id);
		if(result==0) {
			dao.likeUpdate(m);
		}else {
			dao.likeDelete(m);
		}
		
		int likes = dao.likeCount(zw_seq);
		PrintWriter out = response.getWriter();
		result = dao.likeCheck(m);
		Map<String,Object> m2 = new HashMap<>();
		m2.put("likes", likes);
		m2.put("result", result);
		
		List<Map> list = new ArrayList<Map>();
		list.add(m2);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		out.println(json);
		
		return null;
	}

}
