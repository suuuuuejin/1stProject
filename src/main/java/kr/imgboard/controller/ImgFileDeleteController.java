package kr.imgboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.imgboard.dao.ImgBoardMyBatisDAO;

public class ImgFileDeleteController implements kr.login.controller.Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int img_seq  = Integer.parseInt(request.getParameter("img_seq"));
		String filename = request.getParameter("file");
		String filenum=request.getParameter("filenum");
		
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename;
		
		File uploadfile = new File(uploadFileName);
		if(uploadfile.exists()&& uploadfile.isFile()) {
			uploadfile.delete();
		}
		System.out.println(filenum);
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("img_seq",img_seq);
		m.put("filenum", filenum);
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		dao.imgdeleteFile(m);
			
		return null;
	}

}
