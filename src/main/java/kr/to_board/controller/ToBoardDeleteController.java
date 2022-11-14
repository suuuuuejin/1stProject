package kr.to_board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.toBoard.entity.ToBoard;


public class ToBoardDeleteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ToBoard vo = new ToBoard();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int tb_seq = Integer.parseInt(request.getParameter("num"));
		vo =dao.toboardView(tb_seq);
		String filename = vo.getTb_file();
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename;
		
		File uploadfile = new File(uploadFileName);
		if(uploadfile.exists()&& uploadfile.isFile()) {
			uploadfile.delete();
		}
		dao.toboardDelete(tb_seq);
		return "redirect:/tolist.do";
	}

}
