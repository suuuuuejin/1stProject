package kr.imgboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class ImgBoardWriteFormController implements kr.login.controller.Controller{
	
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "imgboard/imgBoardWrite";
	}

}
