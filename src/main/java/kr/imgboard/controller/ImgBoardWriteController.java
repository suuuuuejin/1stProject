package kr.imgboard.controller;

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
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.imgboard.entity.Img_Board;

import kr.zw_board.entity.Zw_Board;


public class ImgBoardWriteController implements kr.login.controller.Controller{
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
		
		try{
			multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String file1 = multi.getFilesystemName("file1");
		String file2 = multi.getFilesystemName("file2");
		String file3 = multi.getFilesystemName("file3");
		String file4 = multi.getFilesystemName("file4");
		String file5 = multi.getFilesystemName("file5");
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String headline = multi.getParameter("headline");
		
		if (file1==null || file1 == "") file1=" ";
		if (file2==null || file1 == "") file2=" ";
		if (file3==null || file1 == "") file3=" ";
		if (file4==null || file1 == "") file4=" ";
		if (file5==null || file1 == "") file5=" ";
		
		int count = 0;
		String content = multi.getParameter("content");
		int likes=0;
		
		if(title == "" ||title == null) System.out.println("title is null");
		
//		if(writer == "" ||writer == null) System.out.println("writer is null");	
//		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))System. out.println("no e-mail.");
		
		if(content == "" ||content == null)System. out.println("content is null");
		
		
		Img_Board vo = new Img_Board();
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		vo.setImg_headline(headline);
		vo.setImg_file1(file1);
		vo.setImg_file2(file2);
		vo.setImg_file3(file3);
		vo.setImg_file4(file4);
		vo.setImg_file5(file5);

		vo.setImg_title(title);
		vo.setImg_content(content);
		vo.setLogin_id(writer);
		vo.setImg_cnt(count);
		vo.setImg_likes(likes);
		dao.imgboardWrite(vo);
		
		return "redirect:/imgList.do";
	}

}
