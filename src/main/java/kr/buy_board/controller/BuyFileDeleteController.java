package kr.buy_board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;

public class BuyFileDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int buy_seq  = Integer.parseInt(request.getParameter("buy_seq"));
		String filename = request.getParameter("getBuy_file");
		
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename;
		
		File uploadfile = new File(uploadFileName);
		if(uploadfile.exists()&& uploadfile.isFile()) {
			uploadfile.delete();
		}
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.buydeleteFile(buy_seq);
			
		return null;
	}

}
