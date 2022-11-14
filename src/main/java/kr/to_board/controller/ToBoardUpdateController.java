package kr.to_board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.board.dao.BoardMyBatisDAO;
import kr.login.controller.Controller;
import kr.login.entity.Member;
import kr.toBoard.entity.ToBoard;
import kr.toBoard.entity.to_comment;


public class ToBoardUpdateController implements Controller {
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
		ToBoard vo = new ToBoard();
		ToBoard vo2= new ToBoard();
		
		int tb_seq = Integer.parseInt(multi.getParameter("tb_seq"));
		String tb_title = multi.getParameter("tb_title");
		String tb_headline = multi.getParameter("tb_headline");
		String tb_content = multi.getParameter("tb_content");
		String filename = multi.getFilesystemName("filename");
		System.out.println(tb_seq+tb_title+tb_content+filename);
		vo2 = dao.toboardView(tb_seq);
		
		
		if (filename == "" || filename == null) {
			
			vo.setTb_seq(tb_seq);
			vo.setTb_title(tb_title);
			vo.setTb_content(tb_content); 
			vo.setTb_headline(tb_headline);
			dao.toboardUpdate2(vo);
		}else {
			String filename1 = vo2.getTb_file();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename1;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setTb_file(filename);
			vo.setTb_seq(tb_seq);
			vo.setTb_headline(tb_headline);
			vo.setTb_title(tb_title);
			vo.setTb_content(tb_content); 
			
			dao.toboardUpdate(vo);
		}
		
		
		
		List<to_comment> list = dao.toallComment(tb_seq);
		
		request.setAttribute("comlist", list);
		vo = dao.toboardView(tb_seq);
		
		request.setAttribute("vo", vo);
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		String login_id =mo.getLogin_id();
		return "redirect:/toBoardView.do?num="+tb_seq+"&login_id="+login_id;
	}

}
