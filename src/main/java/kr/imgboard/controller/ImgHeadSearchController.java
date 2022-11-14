package kr.imgboard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.imgboard.entity.ImgBoardPaging;
import kr.imgboard.entity.Img_Board;
import kr.login.controller.Controller;

public class ImgHeadSearchController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p = request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		
		String headval = request.getParameter("headval");
		Map<String,Object> m = new HashMap<>();
		m.put("headval",headval);

		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		
		ImgBoardPaging board = new ImgBoardPaging(); 
		
		board.setAllPageCount(dao.imgHlsearchListCount(m));
		
		board.calculatePageCount();
		board.startCount(Integer.parseInt(p));
		board.endCount(Integer.parseInt(p));
		board.start_Page(Integer.parseInt(p));
		board.end_Page(Integer.parseInt(p));
		board.setCurrentPage(Integer.parseInt(p));
		m.put("board", board);
		
		List<Img_Board> list=dao.imgHlSearchList(m);
		System.out.println(list.size());
		request.setAttribute("imglist2", list);
		request.setAttribute("board2", board);
		request.setAttribute("headval", headval);
		
		return "imgboard/imgHlSearch";
	}

}
