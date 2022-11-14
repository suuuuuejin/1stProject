package kr.buy_board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.board.dao.BoardMyBatisDAO;
import kr.buy_board.entity.Buy_Board;
import kr.buy_comment.entity.buy_comment;
import kr.login.controller.Controller;
import kr.login.entity.Member;


public class BuyBoardUpdateController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024;
		
		String savePath = request.getSession().getServletContext().getRealPath("/upload");
		
		try{
			multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//수정할때 기존에 있던 첨부파일 삭제 
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		Buy_Board vo = new Buy_Board();
		Buy_Board vo2= new Buy_Board();
		
		int buy_seq = Integer.parseInt(multi.getParameter("buy_seq"));
		String buy_title = multi.getParameter("buy_title");
		String buy_content = multi.getParameter("buy_content");
		String filename = multi.getFilesystemName("filename");
		System.out.println(buy_seq+buy_title+buy_content+filename);
		vo2 = dao.buyboardView(buy_seq);
		
		
		if (filename == "" || filename == null) {
			
			vo.setBuy_seq(buy_seq);
			vo.setBuy_title(buy_title);
			vo.setBuy_content(buy_content); 
			dao.buyboardUpdate2(vo);
		}else {
			String filename1 = vo2.getImg_file1();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename1;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setImg_file1(filename);
			vo.setBuy_seq(buy_seq);
			vo.setBuy_title(buy_title);
			vo.setBuy_content(buy_content); 
			
			dao.buyboardUpdate(vo);
		}
		
		
		
		List<buy_comment> list = dao.buyallComment(buy_seq);
		
		request.setAttribute("comlist", list);
		vo = dao.buyboardView(buy_seq);
		
		request.setAttribute("vo", vo);
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		String login_id =mo.getLogin_id();
		return "redirect:/buyboardView.do?num="+buy_seq+"&login_id="+login_id;
	}

}
