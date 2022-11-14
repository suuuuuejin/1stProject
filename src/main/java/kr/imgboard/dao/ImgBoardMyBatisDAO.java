package kr.imgboard.dao;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.grade.entity.grade_Board;
import kr.img_comment.entity.Img_comment;
import kr.imgboard.entity.ImgBoardPaging;
import kr.imgboard.entity.Img_Board;
import kr.zw_board.entity.BoardPaging;
import kr.zw_board.entity.Member;

import kr.zw_board.entity.pagingsearch;


// MyBatis FrameWork : java <----- SQL Mapping ----> SQL(XML파일)
// http://mybatis.org
public class ImgBoardMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;
	// 초기화 블럭 ( 프로그램 실행시 딱 한번만 실행이 되는 블럭)
	static {
		try {
			String resource = "kr/login/dao/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
		public List<Img_Board> imgAllList() {
			SqlSession session =sqlSessionFactory.openSession();
			List<Img_Board> list =session.selectList("imgallList");
			session.close();
			return list;
			
	}
		
		public int imgallListCount() {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("imgallListCount");
			session.close();//반납
			return cnt;
		}
	
		public List<Img_Board> imgsomeList(ImgBoardPaging board) {
			SqlSession session = sqlSessionFactory.openSession();
			List<Img_Board> list=session.selectList("imgsomeList",board);
			session .close();//반납
			return list;
	}
		
		public List<Img_Board> imgsearchList(Map<String,Object> m ){
			
			SqlSession session = sqlSessionFactory.openSession();
			List<Img_Board> list=session.selectList("imgsearchList",m);
			session.close();//반납
			return list;
			
			
		}
		
		
		public List<Img_Board> imgHlSearchList(Map<String,Object> m ){
			
			SqlSession session = sqlSessionFactory.openSession();
			List<Img_Board> list=session.selectList("imgHlSearchList",m);
			session.close();//반납
			return list;
			
			
		}
		public List<Img_comment> imgallComment(int num){
			SqlSession session =sqlSessionFactory.openSession();
			List<Img_comment> list =session.selectList("imgallComment",num);
			session.close();
			return list;
		}
		public int imgboardWrite(Img_Board vo) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.insert("imgboardWrite",vo);
			String login_id = vo.getLogin_id();
			session.update("writePoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int imgcommentWrite(Img_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("imgcommentWrite",comm);
			String login_id = comm.getLogin_id();
			session.update("imgcommentPoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int imgboardDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("commentDelete2", num);
			int cnt =session.delete("imgboardDelete",num);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int imgcommentDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.delete("imgcommentDelete",num);
			System.out.println("mbdelete");
			session.commit();
			session.close();
			return cnt;
		}
		
		public Img_Board imgboardView(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			Img_Board vo =session.selectOne("imgboardView", num);
			session.close();
			return vo;
		}
		
		public int imgboardUpdatefile1(Img_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("imgboardUpdatefile1", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int imgboardUpdatefile2(Img_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("imgboardUpdatefile2", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int imgboardUpdatefile3(Img_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("imgboardUpdatefile3", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int imgboardUpdatefile4(Img_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("imgboardUpdatefile4", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int imgboardUpdatefile5(Img_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("imgboardUpdatefile5", vo);
			session.commit();
			session.close();
			return cnt;
		}
		public int imgboardUpdate(Img_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("imgboardUpdate", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public void imgcountUpdate(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt= session.update("imgcountUpdate", num);
			session.commit();
			session.close();
		}
		
//		public Member memberLogin(String id) {
//			SqlSession session = sqlSessionFactory.openSession();
//			Member mvo = session.selectOne("memberLogin",id);
//			session.close();
//			return mvo;
//		}
		
		public void imgcommentUpdate(Img_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			session.update("imgcommentUpdate", comm);
			session.commit();
			session.close();
		}
		
		public int imglikeCheck(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("imglikeCheck",m);
			session.close();
			return cnt;
		}
		
		public void imglikeUpdate(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("imglikeUpdate",m);
			session.commit();
			session.close();
			
			
		}
		
		public void imglikeDelete(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("imglikeDelete",m);
			session.commit();
			session.close();
		}
		
		public int imglikeCount(int img_seq) {
			
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("imglikeCount",img_seq);
			Map<String,Object> m = new HashMap<>();
			m.put("cnt", cnt);
			m.put("img_seq", img_seq);
			session.update("imgupdateLike", m);
			session.commit();
			session.close();
			return cnt;
			
		}

		public int imgsearchListCount(Map<String,Object> m) {
			System.out.println(m.get("text"));
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("imgsearchListCount", m);
			session.close();//반납
			return cnt;
		}

		public void imgdeleteFile(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("imgdeleteFile", m);
			session.commit();
			session.close();
		}
		public int imgHlsearchListCount(Map<String,Object> m) {
			
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("imgHlsearchListCount", m);
			session.close();//반납
			return cnt;
		}
		
		public void imgUpdateNotice(int grade_seq) {
			
			SqlSession session =sqlSessionFactory.openSession();
			session.update("imgUpdateNotice", grade_seq);
			session.commit();
			session.close();
		}
		
		public void imgDeleteNotice(int grade_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("imgDeleteNotice", grade_seq);
			session.commit();
			session.close();
		}
		
		public List<Img_Board> imgNoticeList(){
			SqlSession session = sqlSessionFactory.openSession();
			List<Img_Board> list =session.selectList("imgNoticeList");
			session.close();
			return list;
		}
		
		
		public List<Img_Board> mainImg(){
			SqlSession session = sqlSessionFactory.openSession();
			List<Img_Board> list =session.selectList("mainImg");
			session.close();
			return list;
		}
		
		
		
		
}
