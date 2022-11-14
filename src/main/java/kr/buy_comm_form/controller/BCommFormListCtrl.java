package kr.buy_comm_form.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.board.dao.BoardMyBatisDAO;
import kr.buy_comm_form.entity.BCommForm;
import kr.buy_comm_form_gds.entity.BCommFormGds;
import kr.login.controller.Controller;

public class BCommFormListCtrl implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int buy_seq = Integer.parseInt(request.getParameter("buy_seq"));
		String login_id = request.getParameter("login_id");
		BCommForm bcf = new BCommForm();
		bcf.setBuy_seq(buy_seq);
		bcf.setLogin_id(login_id);
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		List<BCommForm> list;
		if (login_id.equals("admin")) {
			System.out.println("admin");
			list = dao.BCommFormListadmin(bcf);
		}else {
			System.out.println("noooo");
			list = dao.BCommFormList(bcf);
		}
		
		
		request.setAttribute("comlist", list);
		System.out.println();

		Gson gson = new Gson();
		// [{  },{  }]
		String json = gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.println(json); // data만 callback함수로 전달 ㅔ
		System.out.println(json);
		return null;
	}

}
