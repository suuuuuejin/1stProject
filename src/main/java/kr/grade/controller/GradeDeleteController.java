package kr.grade.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.board.dao.BoardMyBatisDAO;
import kr.grade.entity.grade_Board;
import kr.login.controller.Controller;


public class GradeDeleteController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		grade_Board vo = new grade_Board();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int grade_seq = Integer.parseInt(request.getParameter("num"));
		vo =dao.gradeBoardView(grade_seq);
		String filename = vo.getGrade_file();
		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename;
		
		File uploadfile = new File(uploadFileName);
		if(uploadfile.exists()&& uploadfile.isFile()) {
			uploadfile.delete();
		}
		dao.boardDelete(grade_seq);
		
		return "redirect:/gradeList.do";
	}

}
