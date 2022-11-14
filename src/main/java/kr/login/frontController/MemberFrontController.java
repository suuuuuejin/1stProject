package kr.login.frontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.controller.Controller;


@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//FrontController - 1개(DispatcherServlet) -->spring에서는 제공해줌  pojo는 제공해주지 않아서 만들어줘야함
		//1. 어떤 요청인지 파악하기 (command구하기)
		String reqPath=request.getRequestURI();
		String cpath=request.getContextPath();
		String command=reqPath.substring(cpath.length());
		System.out.println(command);
		//2. command에 따른 분기작업(if~else if~)
		String nextPage=null;
		//HandlerMapping(핸들러매핑)
		Controller controller=null;
		HandlerMapping mapping=new HandlerMapping();
		controller=mapping.getController(command);
		nextPage=controller.requestProcessor(request, response);
		//3. View(JSP=forword) or 다른 컨트롤러(redirect)로 경로를 변경하는 작업
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")==-1) {
				//forword
				//frontController 수정안하기 위해 경로설정은 따로 클래스(ViewResolver)로 만듬
				RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeView(nextPage));  
				rd.forward(request, response);
			}else {
				//redirect
				response.sendRedirect(cpath+nextPage.split(":")[1]);
			}
				
		}
	}

}
