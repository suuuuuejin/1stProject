package kr.grade.controller;

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
import kr.grade.entity.grade_Board;
import kr.grade_comment.entity.Grade_comment;
import kr.login.controller.Controller;
import kr.login.entity.Member;


public class GradeUpdateController implements Controller {
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
		grade_Board vo = new grade_Board();
		grade_Board vo2= new grade_Board();
		
		int grade_seq = Integer.parseInt(multi.getParameter("grade_seq"));
		String grade_title = multi.getParameter("grade_title");
		String grade_content = multi.getParameter("grade_content");
		String filename = multi.getFilesystemName("filename");
		System.out.println(grade_seq+grade_title+grade_content+filename);
		vo2 = dao.gradeBoardView(grade_seq);
		
		
		if (filename == "" || filename == null) {
			
			vo.setGrade_seq(grade_seq);
			vo.setGrade_title(grade_title);
			vo.setGrade_content(grade_content); 
			dao.gradeBoardUpdate2(vo);
		}else {
			String filename1 = vo2.getGrade_file();
			String uploadFileName = request.getSession().getServletContext().getRealPath("/upload")+"/"+filename1;
			
			File uploadfile = new File(uploadFileName);
			if(uploadfile.exists()&& uploadfile.isFile()) {
				uploadfile.delete();
			}
			
			vo.setGrade_file(filename);
			vo.setGrade_seq(grade_seq);
			vo.setGrade_title(grade_title);
			vo.setGrade_content(grade_content); 
			
			dao.gradeBoardUpdate(vo);
		}
		
		
		
		List<Grade_comment> list = dao.gradeAllComment(grade_seq);
		
		request.setAttribute("comlist", list);
		vo = dao.gradeBoardView(grade_seq);
		
		request.setAttribute("vo", vo);
		HttpSession session = request.getSession();
		Member mo = (Member)session.getAttribute("mvo");
		String login_id =mo.getLogin_id();
		return "redirect:/gradeView.do?num="+grade_seq+"&p=&login_id="+login_id;
	}

}
