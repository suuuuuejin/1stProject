package kr.map.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.login.controller.Controller;
import kr.login.dao.MemberMyBatisDAO;
import kr.map.entity.Mapvo;

public class MapSearchController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = Integer.parseInt(request.getParameter("page"));
		String search = request.getParameter("search");
		String option = request.getParameter("option");
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		List<Mapvo> list = new ArrayList<Mapvo>();
		if(option.equals("가게명")) {
			 list = dao.t_SearchPage(page, search);
		}else {
			 list = dao.a_SearchPage(page, search);
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(json);
		
		
		return null;
	}
	

}
