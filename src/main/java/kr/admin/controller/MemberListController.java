package kr.admin.controller;

import java.io.IOException;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.admin.entity.AdminPaging;
import kr.login.controller.Controller;
import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;


public class MemberListController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num;
		if(request.getParameter("num") == null) {
			num = 1;
		}else {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		// user_id, user_nick
		String option = request.getParameter("option");
		String search = request.getParameter("search");
		
		AdminPaging paging = new AdminPaging();
		
		paging.setOption(option);
		paging.setSearch(search);
		
		//유저 목록
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		System.out.println("option "+paging.getOption());
		System.out.println("search "+paging.getSearch());
		List<Member> list;
		System.out.println(paging.getSearch()==null);
		if(paging.getSearch()==null) {
			list = dao.adminPageList(num);
		}else {
			System.out.println(paging);
			list = dao.searching(num, paging);
		}
		
		//페이징
		paging.setCurrent_page(num);
		paging.startPage();
		paging.lastPage();


		
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		
		
		
		return "admin/user_manage";
	}
	

}
