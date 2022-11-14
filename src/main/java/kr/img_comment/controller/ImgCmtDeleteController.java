package kr.img_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.imgboard.dao.ImgBoardMyBatisDAO;

public class ImgCmtDeleteController implements kr.login.controller.Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("img_cmt_seq"));
		System.out.println(num);
		ImgBoardMyBatisDAO dao= new ImgBoardMyBatisDAO();
		dao.imgcommentDelete(num);
		
		
		
		return null;
	}

}
