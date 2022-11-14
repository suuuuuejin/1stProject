package kr.weekly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.controller.Controller;
import kr.login.dao.MemberMyBatisDAO;
import kr.weekly.entity.Weekly;

public class WeeklyViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberMyBatisDAO dao=new MemberMyBatisDAO();
		List<Weekly> zero_list = dao.zero_List();
		List<Weekly> vegan_list = dao.vegan_List();
		List<Weekly> plastic_list = dao.plastic_List();
//		System.out.println(zero_list);
//		System.out.println(plastic_list);
//		System.out.println(vegan_list);
		
		request.setAttribute("zero_list", zero_list);
		request.setAttribute("vegan_list", vegan_list);
		request.setAttribute("plastic_list", plastic_list);
		
		
		
		return "search/weekly";
	}
	

}
