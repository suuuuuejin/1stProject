package kr.imgboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

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
import kr.zw_comment.entity.zw_comment;


public class ImgBoardUpdateController implements kr.login.controller.Controller {
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
		
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		Img_Board vo = new Img_Board();
		Img_Board vo2= new Img_Board();
		
		int img_seq = Integer.parseInt(multi.getParameter("img_seq"));
		String img_title = multi.getParameter("img_title");
		String img_content = multi.getParameter("img_content");
		String imghead = multi.getParameter("imghead");
		String file1 = multi.getFilesystemName("file1");
		String file2 = multi.getFilesystemName("file2");
		String file3 = multi.getFilesystemName("file3");
		String file4 = multi.getFilesystemName("file4");
		String file5 = multi.getFilesystemName("file5");
		
		vo2 = dao.imgboardView(img_seq);
		
		
//		if ((file1 == "" || file1 == null) && (file2 == "" || file2 == null) && (file3 == "" || file3 == null) && (file4 == "" || file4 == null) && (file5 == "" || file5== null) ) {
//			
//			vo.setImg_seq(img_seq);
//			vo.setImg_title(img_title);
//			vo.setImg_content(img_content); 
//			dao.imgboardUpdate(vo);
//		}
		System.out.println(file1+file2+file3+file4+file5);
		if(file1 !=null){
			
			String filename1 = vo2.getImg_file1();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename1;
			System.out.println(filename1);
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setImg_file1(file1);
			vo.setImg_seq(img_seq);
			
			dao.imgboardUpdatefile1(vo);
		}
		if(file2 != null){
			//수정 해야됨
			String filename2 = vo2.getImg_file2();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename2;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setImg_file2(file2);
			vo.setImg_seq(img_seq);
			
			dao.imgboardUpdatefile2(vo);
		} 
		if(file3 != null){
			//수정 해야됨
			String filename3 = vo2.getImg_file3();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename3;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setImg_file3(file3);
			vo.setImg_seq(img_seq);
			
			dao.imgboardUpdatefile3(vo);
		}
		if(file4 != null){
			//수정 해야됨
			String filename4 = vo2.getImg_file4();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename4;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setImg_file4(file4);
			vo.setImg_seq(img_seq);
			
			dao.imgboardUpdatefile4(vo);
		}
		if(file5 != null){
			//수정 해야됨
			String filename5 = vo2.getImg_file5();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename5;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			
			vo.setImg_file5(file5);
			vo.setImg_seq(img_seq);
			
			dao.imgboardUpdatefile5(vo);
		}
		vo.setImg_headline(imghead);
		vo.setImg_seq(img_seq);
		vo.setImg_title(img_title);
		vo.setImg_content(img_content); 
		dao.imgboardUpdate(vo);
		
		
		
//		List<zw_comment> list = dao.imgallComment(img_seq);
//		
//		request.setAttribute("comlist", list);
//		vo = dao.imgboardView(img_seq);
//		
//		request.setAttribute("imgvo", vo);
		
		return "redirect:/imgBoardView.do?num="+img_seq;
	}

}
