package kr.zw_comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.to_comment;
import kr.zw_comment.entity.zw_comment;


public class CommentListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int zw_seq = Integer.parseInt(request.getParameter("zw_seq"));
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		List<zw_comment> list = dao.allComment(zw_seq);
		
		for (zw_comment to : list) {
			if(to.getU_grade()==null) {
				continue;
			}
			if(to.getU_grade().equals("지구프랜즈")) {
				to.setU_grade("/img/my/11.png");
			}
			if(to.getU_grade().equals("지구지킴단")) {
				to.setU_grade("/img/my/22.png");
			}
			if(to.getU_grade().equals("지구특공대")) {
				to.setU_grade("/img/my/33.png");
			}
			if(to.getU_grade().equals("지구어벤져스")) {
				to.setU_grade("/img/my/44.png");
			}
			if(to.getU_grade().equals("admin")) {
				to.setU_grade("/img/my/55.png");
			}
		
		}
		
		request.setAttribute("comlist", list);
		
		Gson gson = new Gson();
		// [{  },{  }]
		String json = gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.println(json); // data만 callback함수로 전달 ㅔ
		System.out.println(json);
		return null;
	}

}
