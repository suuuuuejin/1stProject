package kr.imgboard.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.board.dao.BoardMyBatisDAO;
import kr.imgboard.dao.ImgBoardMyBatisDAO;




public class ImgBoardDeleteController implements kr.login.controller.Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		kr.imgboard.entity.Img_Board vo = new kr.imgboard.entity.Img_Board();
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		int img_seq = Integer.parseInt(request.getParameter("num"));
		vo =dao.imgboardView(img_seq);
		String filename = vo.getImg_file1();
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename;
		
		File uploadfile = new File(uploadFileName);
		if(uploadfile.exists()&& uploadfile.isFile()) {
			uploadfile.delete();
		}
		dao.imgboardDelete(img_seq);
		return "redirect:/imgList.do";
	}

}
