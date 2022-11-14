package kr.map.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.login.controller.Controller;
import kr.map.entity.MapPaging;

public class MapPageController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		MapPaging paging = new MapPaging();
		
		paging.setCurrent_page(page);
		paging.startPage();
		paging.lastPage();
		
		paging.getStart_page();
		paging.getEnd_page();
		paging.getCurrent_page();
		
		List<MapPaging> list = new ArrayList<MapPaging>();
		list.add(paging);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);

//		request.setAttribute("paging", paged);

		
		
		return null;
	}
}
