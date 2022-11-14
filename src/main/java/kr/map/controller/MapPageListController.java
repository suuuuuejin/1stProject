package kr.map.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.login.controller.Controller;
import kr.login.dao.MemberMyBatisDAO;
import kr.map.entity.Mapvo;

public class MapPageListController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int page;
		if (request.getParameter("page")==null) {
			page= 1;
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		
		List<Mapvo> list = dao.PageList(page);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(json);
		
		return null;
	}

}
