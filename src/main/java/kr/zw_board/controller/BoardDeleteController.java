package kr.zw_board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.zw_board.entity.Zw_Board;


public class BoardDeleteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Zw_Board vo = new Zw_Board();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int zw_seq = Integer.parseInt(request.getParameter("num"));
		vo =dao.boardView(zw_seq);
		String filename = vo.getZw_file();
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename;
		
		File uploadfile = new File(uploadFileName);
		if(uploadfile.exists()&& uploadfile.isFile()) {
			uploadfile.delete();
		}
		dao.boardDelete(zw_seq);
		return "redirect:/zwlist.do";
	}

}
