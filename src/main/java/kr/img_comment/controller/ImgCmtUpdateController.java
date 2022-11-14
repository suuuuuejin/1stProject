package kr.img_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.img_comment.entity.Img_comment;
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.zw_comment.entity.zw_comment;

public class ImgCmtUpdateController implements kr.login.controller.Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int img_cmt_seq = Integer.parseInt(request.getParameter("img_cmt_seq"));
		String img_cmt_content = request.getParameter("img_cmt_content");
		Img_comment icom = new Img_comment();
		icom.setImg_cmt_seq(img_cmt_seq);
		icom.setImg_cmt_content(img_cmt_content);
		ImgBoardMyBatisDAO dao = new ImgBoardMyBatisDAO();
		dao.imgcommentUpdate(icom);

		return null;
	}

}
