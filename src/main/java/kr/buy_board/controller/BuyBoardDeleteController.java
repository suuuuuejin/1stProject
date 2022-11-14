package kr.buy_board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.board.dao.BoardMyBatisDAO;
import kr.buy_board.entity.Buy_Board;
import kr.login.controller.Controller;


public class BuyBoardDeleteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Buy_Board vo = new Buy_Board();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int buy_seq = Integer.parseInt(request.getParameter("num"));
		vo =dao.buyboardView(buy_seq);
		String filename = vo.getImg_file1();
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename;
		
		File uploadfile = new File(uploadFileName);
		if(uploadfile.exists()&& uploadfile.isFile()) {
			uploadfile.delete();
		}
		dao.buyboardDelete(buy_seq);
		return "redirect:/buylist.do";
	}

}
