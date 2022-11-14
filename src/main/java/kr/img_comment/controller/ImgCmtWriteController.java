package kr.img_comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.board.dao.BoardMyBatisDAO;
import kr.img_comment.entity.Img_comment;
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.login.entity.Member;
import kr.zw_comment.entity.zw_comment;
import kr.board.dao.BoardMyBatisDAO;



public class ImgCmtWriteController implements kr.login.controller.Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int img_seq = Integer.parseInt(request.getParameter("img_seq"));
		HttpSession session = request.getSession();
		Member mb = (Member)session.getAttribute("mvo");
		String login_id = mb.getLogin_id();
		String img_cmt_content = request.getParameter("img_cmt_content");
	
		Img_comment cb = new Img_comment();
		cb.setImg_seq(img_seq);
		cb.setLogin_id(login_id);
		cb.setImg_cmt_content(img_cmt_content);
		
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		System.out.println(cb.getImg_seq());
		dao.imgcommentWrite(cb);
		
//		List<zw_comment> list = dao.allComment(zw_seq);
//		
//		request.setAttribute("comlist", list);
//		Gson gson = new Gson();
//		String json = gson.toJson(list);
//		response.setContentType("text/json;charset=utf-8");
//		PrintWriter out =response.getWriter();
//		out.println(json); // data만 callback함수로 전달 ㅔ
//		System.out.println(json);
		return null;
	}
	

}
