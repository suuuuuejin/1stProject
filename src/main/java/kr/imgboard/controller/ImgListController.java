package kr.imgboard.controller;


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
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.imgboard.entity.ImgBoardPaging;
import kr.imgboard.entity.Img_Board;
import kr.toBoard.entity.ToBoard;
import kr.zw_board.entity.BoardPaging;
import kr.zw_board.entity.Member;
import kr.zw_board.entity.Zw_Board;

public class ImgListController implements kr.login.controller.Controller {
	// pojo(프론트컨트롤러가 할일을 대신해주는 클래스)
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		
		String p = request.getParameter("p");
		if(p == null) {
			p = "1";
		}
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		// 로그인 
//		Member mb = dao.memberLogin("login_id@naver.com");
//		if(mb!=null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("mb", mb);
//		}
		//페이징 처리
		ImgBoardPaging board = new ImgBoardPaging(); 
		board.setAllPageCount(dao.imgallListCount());
		
		board.calculatePageCount();
		board.startCount(Integer.parseInt(p));
		board.endCount(Integer.parseInt(p));
		board.start_Page(Integer.parseInt(p));
		board.end_Page(Integer.parseInt(p));
		board.setCurrentPage(Integer.parseInt(p));
		List<Img_Board> list=dao.imgsomeList(board);
		System.out.println(board.getEnd_page());
		List<Img_Board> notice_list =dao.imgNoticeList();
		
		
		
		
		request.setAttribute("notice", notice_list);
		request.setAttribute("imglist", list);
		request.setAttribute("board", board);
		
		
		
		
//		String nextPage = "boardList";
		return "imgboard/imgBoardList";
		
		
		
		
		//Member mb = new Member();
		
		// controller ----forward---> view
		// 객체(request)바인딩
		// foward :jsp로갈때 (view)
		
		// view 에 forward
		
		
		
	}
}