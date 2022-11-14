package kr.imgboard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.dao.BoardMyBatisDAO;
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.imgboard.entity.ImgBoardPaging;
import kr.imgboard.entity.Img_Board;
import kr.zw_board.entity.BoardPaging;
import kr.zw_board.entity.Member;
import kr.zw_board.entity.Zw_Board;

public class ImgSearchListController implements kr.login.controller.Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p = request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		String val = request.getParameter("val");
		String text = request.getParameter("text");
		
		Map<String,Object> m = new HashMap<>();
		m.put("val",val);
		m.put("text",text);
		System.out.println(m.get("val"));

		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		
		ImgBoardPaging board = new ImgBoardPaging(); 
		
		board.setAllPageCount(dao.imgsearchListCount(m));
		System.out.println(dao.imgsearchListCount(m));
		board.calculatePageCount();
		board.startCount(Integer.parseInt(p));
		board.endCount(Integer.parseInt(p));
		board.start_Page(Integer.parseInt(p));
		board.end_Page(Integer.parseInt(p));
		board.setCurrentPage(Integer.parseInt(p));
		m.put("board", board);
		
		List<Img_Board> list=dao.imgsearchList(m);
		System.out.println(list.size());
		request.setAttribute("imglist2", list);
		request.setAttribute("board2", board);
		request.setAttribute("val", val);
		request.setAttribute("text", text);
//		String nextPage = "boardList";
		return "imgboard/imgSearchList";
		
	
		
	}

}
