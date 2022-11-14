package kr.imgboard.controller;

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
import kr.login.entity.Member;

public class ImgLikeController implements kr.login.controller.Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int img_seq = Integer.parseInt(request.getParameter("img_seq"));
		HttpSession session = request.getSession();
		Member mb = (Member) session.getAttribute("mvo");
		String login_id = mb.getLogin_id();
		Map<String, Object> m = new HashMap<>();
		m.put("no", img_seq);
		m.put("id", login_id);
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();

		int result = dao.imglikeCheck(m);

		if (result == 0) {
			dao.imglikeUpdate(m);
		} else {
			dao.imglikeDelete(m);
		}

		int likes = dao.imglikeCount(img_seq);
		PrintWriter out = response.getWriter();
		result = dao.imglikeCheck(m);
		Map<String, Object> m2 = new HashMap<>();
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
