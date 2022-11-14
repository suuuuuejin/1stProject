package kr.zw_board.controller;

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
import kr.login.controller.Controller;
import kr.login.entity.Member;
import kr.zw_board.entity.Zw_Board;
import kr.zw_comment.entity.zw_comment;


public class BoardUpdateController implements Controller {
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
		Zw_Board vo = new Zw_Board();
		Zw_Board vo2= new Zw_Board();
		
		int zw_seq = Integer.parseInt(multi.getParameter("zw_seq"));
		String zw_title = multi.getParameter("zw_title");
		String zw_content = multi.getParameter("zw_content");
		String filename = multi.getFilesystemName("filename");
		String headval = multi.getParameter("headval");
		System.out.println(zw_seq+zw_title+zw_content+filename);
		vo2 = dao.boardView(zw_seq);
		
		
		if (filename == "" || filename == null) {
			vo.setZw_headline(headval);
			vo.setZw_seq(zw_seq);
			vo.setZw_title(zw_title);
			vo.setZw_content(zw_content); 
			dao.boardUpdate2(vo);
		}else {
			String filename1 = vo2.getZw_file();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename1;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setZw_file(filename);
			vo.setZw_seq(zw_seq);
			vo.setZw_title(zw_title);
			vo.setZw_content(zw_content); 
			
			dao.boardUpdate(vo);
		}
		
		
		
//		List<zw_comment> list = dao.allComment(zw_seq);
//		
//		request.setAttribute("comlist", list);
		vo = dao.boardView(zw_seq);
		
		request.setAttribute("vo", vo);
		
		return "redirect:/boardView.do?num="+zw_seq;
	}

}
