package kr.admin.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.admin.entity.AdminPaging;
import kr.admin.entity.Notice;
import kr.grade.entity.grade_Board;
import kr.login.controller.Controller;
import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.toBoard.entity.ToBoard;
import kr.zw_board.entity.Zw_Board;


public class NoticeListController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num;
		if(request.getParameter("num") == null) {
			num = 1;
		}else {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		AdminPaging paging = new AdminPaging();
		paging.setView_list(5);
		
		
		
		//공지 리스트
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		List<Zw_Board> zwlist = dao.zwNoticePageList(num);
		List<ToBoard> tolist = dao.toNoticePageList(num);
		List<grade_Board> gradelist = dao.gradeNoticePageList(num);
		
		for (Zw_Board to : zwlist) {
			if(to.getU_grade()==null) {
				continue;
			}
			else if(to.getU_grade().equals("지구프랜즈")) {
				to.setU_grade("/img/my/1.png");
			}
			else if(to.getU_grade().equals("지구지킴단")) {
				to.setU_grade("/img/my/2.png");
			}
			else if(to.getU_grade().equals("지구특공대")) {
				to.setU_grade("/img/my/3.png");
			}
			else if(to.getU_grade().equals("지구어벤져스")) {
				to.setU_grade("/img/my/4.png");
			}
			else if(to.getU_grade().equals("admin")) {
				to.setU_grade("/img/my/kf.png");
			}
		}
		
		for (ToBoard to : tolist) {
			if(to.getU_grade()==null) {
				continue;
			}
			else if(to.getU_grade().equals("지구프랜즈")) {
				to.setU_grade("/img/my/1.png");
			}
			else if(to.getU_grade().equals("지구지킴단")) {
				to.setU_grade("/img/my/2.png");
			}
			else if(to.getU_grade().equals("지구특공대")) {
				to.setU_grade("/img/my/3.png");
			}
			else if(to.getU_grade().equals("지구어벤져스")) {
				to.setU_grade("/img/my/4.png");
			}
			else if(to.getU_grade().equals("admin")) {
				to.setU_grade("/img/my/kf.png");
			}
		}
		
		for (grade_Board to : gradelist) {
			if(to.getU_grade()==null) {
				continue;
			}
			else if(to.getU_grade().equals("지구프랜즈")) {
				to.setU_grade("/img/my/1.png");
			}
			else if(to.getU_grade().equals("지구지킴단")) {
				to.setU_grade("/img/my/2.png");
			}
			else if(to.getU_grade().equals("지구특공대")) {
				to.setU_grade("/img/my/3.png");
			}
			else if(to.getU_grade().equals("지구어벤져스")) {
				to.setU_grade("/img/my/4.png");
			}
			else if(to.getU_grade().equals("admin")) {
				to.setU_grade("/img/my/kf.png");
			}
		}
		
		
		
		
		
		//페이징
		paging.setCurrent_page(num);
		paging.Notice_startPage();
		paging.Notice_lastPage();

		
		
		request.setAttribute("paging", paging);
		request.setAttribute("zwlist", zwlist);
		request.setAttribute("tolist", tolist);
		request.setAttribute("gradelist", gradelist);
		
		return "admin/notice_manage";
	}
}
