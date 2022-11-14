package kr.imgboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.board.dao.BoardMyBatisDAO;
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.imgboard.entity.Img_Board;
import kr.zw_board.entity.Zw_Board;

public class ImgBoardUpdateFormController implements kr.login.controller.Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		
		Img_Board vo =dao.imgboardView(num);
		request.setAttribute("imgvo", vo);
		
		return "imgboard/imgBoardUpdate";
	}

}
