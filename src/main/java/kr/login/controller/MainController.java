package kr.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.buy_board.entity.Buy_Board;
import kr.imgboard.dao.ImgBoardMyBatisDAO;
import kr.imgboard.entity.Img_Board;
import kr.login.dao.MemberMyBatisDAO;
import kr.toBoard.entity.ToBoard;
import kr.zw_board.entity.Zw_Board;

public class MainController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		Map<String,Object> m = new HashMap<String,Object>();
		m = dao.BoardBest();
		ImgBoardMyBatisDAO idao = new ImgBoardMyBatisDAO();
		List<Img_Board> mainimg = idao.mainImg();
		Zw_Board zw =  (Zw_Board) m.get("zw");
		Img_Board img =  (Img_Board) m.get("img");
		ToBoard to = (ToBoard) m.get("to");
		Buy_Board buy = (Buy_Board) m.get("buy");
		request.setAttribute("mainimg", mainimg);
		request.setAttribute("zw", zw);
		request.setAttribute("img", img);
		request.setAttribute("to", to);
		request.setAttribute("buy", buy);
		
		return "main/main";
	}

}
