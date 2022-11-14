package kr.weekly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.controller.Controller;
import kr.login.dao.MemberMyBatisDAO;
import kr.weekly.entity.Weekly;




/**
 * Servlet implementation class WeeklyViewController
 */
//@WebServlet("/WeeklyView.do")
public class ZeroViewController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberMyBatisDAO dao=new MemberMyBatisDAO();
		List<Weekly> zero_list = dao.zero_List();
		List<Weekly> vegan_list = dao.vegan_List();
		List<Weekly> plastic_list = dao.plastic_List();
		
		
		
		return "search/weekly";
	}
	

}
