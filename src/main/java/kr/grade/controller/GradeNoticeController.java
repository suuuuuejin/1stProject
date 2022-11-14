package kr.grade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;

public class GradeNoticeController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		dao.gradeUpdateNotice(num);
		System.out.println("notcie update");
		
		return "redirect:/gradeList.do";
	}
	
}
