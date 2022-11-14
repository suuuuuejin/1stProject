package kr.buy_board.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.board.dao.BoardMyBatisDAO;
import kr.buy_board.entity.Buy_Board;
import kr.login.controller.Controller;
import kr.toBoard.entity.ToBoard;
import kr.zw_board.entity.BoardPaging;


public class BuyPageListController implements Controller {
	// pojo(프론트컨트롤러가 할일을 대신해주는 클래스)
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		
		String p = request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		// 로그인 
		
		/*
		 * Member mb = dao.memberLogin("login_id@naver.com"); if(mb!=null) { HttpSession
		 * session = request.getSession(); session.setAttribute("mb", mb); }
		 */
		
		//페이징 처리
		BoardPaging board = new BoardPaging(); 
		board.setAllPageCount(dao.buyallListCount());
		board.calculatePageCount();
		board.startCount(Integer.parseInt(p));
		board.endCount(Integer.parseInt(p));
		board.start_Page(Integer.parseInt(p));
		board.end_Page(Integer.parseInt(p));
		board.setCurrentPage(Integer.parseInt(p));
		List<Buy_Board> list=dao.buysomeList(board);
	
		for (Buy_Board to : list) {
			if(to.getU_grade().equals("지구프랜즈")) {
				to.setU_grade("/img/my/1.png");
			}
			if(to.getU_grade().equals("지구지킴단")) {
				to.setU_grade("/img/my/2.png");
			}
			if(to.getU_grade().equals("지구특공대")) {
				to.setU_grade("/img/my/3.png");
			}
			if(to.getU_grade().equals("지구어벤져스")) {
				to.setU_grade("/img/my/4.png");
			}
			if(to.getU_grade().equals("admin")) {
				to.setU_grade("/img/my/5.png");
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("board", board);
		
//		String nextPage = "boardList";
		return "buy/buyList";
		
		
		
		
		//Member mb = new Member();
		
		// controller ----forward---> view
		// 객체(request)바인딩
		// foward :jsp로갈때 (view)
		
		// view 에 forward
		
		
		
	}
}