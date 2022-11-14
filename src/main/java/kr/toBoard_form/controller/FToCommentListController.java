package kr.toBoard_form.controller;

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
import kr.toBoard.entity.ToBoard;
import kr.toBoard.entity.to_form;
import kr.zw_comment.entity.zw_comment;


public class FToCommentListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int tb_seq = Integer.parseInt(request.getParameter("tb_seq"));
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		List<to_form> list = dao.ftoallComment(tb_seq);
		
		
		request.setAttribute("comlist", list);
		
		Gson gson = new Gson();
		// [{  },{  }]
		String json = gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.println(json); // data만 callback함수로 전달 ㅔ
		System.out.println("jsaon===="+json);
		return null;
	}

}
