package kr.to_board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.Member;
import kr.toBoard.entity.ToBoard;


public class ToBoardWriteController implements Controller{
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
		String filename = multi.getFilesystemName("filename1");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String headline = multi.getParameter("headline");
		System.out.println(writer);
		int count = 0;
		String content = multi.getParameter("content");
		int likes=0;
		System.out.println(filename);
		if(title == "" ||title == null) System.out.println("title is null");
		
//		if(writer == "" ||writer == null) System.out.println("writer is null");	
//		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))System. out.println("no e-mail.");
		
		if(content == "" ||content == null)System. out.println("content is null");
		
		if(filename =="" || filename == null) filename = " ";
		ToBoard vo = new ToBoard();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		MemberMyBatisDAO d=new MemberMyBatisDAO();
		Member m=d.memberView(writer);
		String u_grade=m.getU_grade();
		vo.setTb_file(filename);
		vo.setTb_title(title);
		vo.setTb_content(content);
		vo.setLogin_id(writer);
		vo.setTb_cnt(count);
		vo.setTb_likes(likes);
		vo.setTb_headline(headline);
		Member mb=d.memberView(writer);
		String gd=mb.getU_grade();
		if(gd.equals("지구프랜즈")) {
			u_grade="/img/my/1.png";
		}
		if(gd.equals("지구지킴단")) {
			u_grade="/img/my/2.png";
		}
		if(gd.equals("지구특공대")) {
			u_grade="/img/my/3.png";
		}
		if(gd.equals("지구어벤져스")) {
			u_grade="/img/my/4.png";
		}
		if(gd.equals("admin")) {
			u_grade="/img/my/5.png";
		}
		vo.setU_grade(u_grade);
		dao.toboardWrite(vo);
		
		return "redirect:/tolist.do";
	}

}
