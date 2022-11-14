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

public class BCommFormWriteCtrl implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int buy_seq = Integer.parseInt(request.getParameter("buy_seq"));
		String login_id = request.getParameter("login_id");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		String user_addr = request.getParameter("u_addr")+request.getParameter("u_addr1")+request.getParameter("u_addr2");
		int user_amount = Integer.parseInt(request.getParameter("user_amount"));
		System.out.println(user_addr);
		System.out.println(login_id);
		String goods_name = request.getParameter("prd1")+request.getParameter("prd2")+request.getParameter("prd3")+request.getParameter("prd4");
		
	
		BCommForm cb = new BCommForm();
		cb.setLogin_id(login_id);
		cb.setBuy_seq(buy_seq);
		cb.setUser_phone(user_phone);
		cb.setUser_name(user_name);
		cb.setUser_addr(user_addr);
		cb.setUser_amount(user_amount);
		cb.setGoods_name(goods_name);
		
		System.out.println("cb : "+cb);
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
		dao.BCommFormWrite(cb);
		
		return null;
	}

}
