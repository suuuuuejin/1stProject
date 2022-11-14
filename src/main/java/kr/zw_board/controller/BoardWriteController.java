package kr.zw_board.controller;

import java.io.File;
import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.zw_board.entity.Zw_Board;


public class BoardWriteController implements Controller{
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024;
		
		String savePath = request.getSession().getServletContext().getRealPath("/upload");

		File Folder = new File(savePath);
		
		if (!Folder.exists()) {
			try {
				Folder.mkdir();
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		try{
			multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String filename = multi.getFilesystemName("filename");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		System.out.println(writer);
		int count = 0;
		String content = multi.getParameter("content");
		String headval= multi.getParameter("headval");
		int likes=0;
		System.out.println(filename);
		if(title == "" ||title == null) System.out.println("title is null");
		
//		if(writer == "" ||writer == null) System.out.println("writer is null");	
//		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))System. out.println("no e-mail.");
		
		if(content == "" ||content == null)System. out.println("content is null");
		
		if(filename =="" || filename == null) filename = " ";
		Zw_Board vo = new Zw_Board();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		vo.setZw_headline(headval);
		vo.setZw_file(filename);
		vo.setZw_title(title);
		vo.setZw_content(content);
		vo.setLogin_id(writer);
		vo.setZw_cnt(count);
		vo.setZw_likes(likes);
		dao.boardWrite(vo);
		
		return "redirect:/zwlist.do";
	}

}
