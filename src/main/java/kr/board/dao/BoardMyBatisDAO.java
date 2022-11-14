package kr.board.dao;


import java.io.InputStream;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.grade.entity.grade_Board;
import kr.grade_comment.entity.Grade_comment;
import kr.youtube.entity.Youtube;
import kr.youtube.entity.YoutubePaging;
import kr.buy_board.entity.Buy_Board;
import kr.buy_comm_form.entity.BCommForm;
import kr.buy_comment.entity.buy_comment;
import kr.toBoard.entity.ToBoard;
import kr.toBoard.entity.to_comment;
import kr.toBoard.entity.to_form;
import kr.zw_board.entity.BoardPaging;
import kr.zw_board.entity.Zw_Board;
import kr.zw_comment.entity.zw_comment;

// MyBatis FrameWork : java <----- SQL Mapping ----> SQL(XML파일)
// http://mybatis.org
public class BoardMyBatisDAO {
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
	//제로웨이스트
		public List<Zw_Board> allList() {
			SqlSession session =sqlSessionFactory.openSession();
			List<Zw_Board> list =session.selectList("allList");
			session.close();
			return list;
			
	}
		
		public int allListCount() {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("allListCount");
			session.close();//반납
			return cnt;
		}
	
		public List<Zw_Board> someList(BoardPaging page) {
			SqlSession session = sqlSessionFactory.openSession();
			List<Zw_Board> list=session.selectList("someList",page);
			session .close();//반납
			return list;
	}
		
		public List<Zw_Board> searchList(Map<String,Object> m ){
			
			SqlSession session = sqlSessionFactory.openSession();
			List<Zw_Board> list=session.selectList("searchList",m);
			session.close();//반납
			return list;
			
			
		}
		
		public List<Zw_Board> HdSearchList(Map<String,Object> m ){
			
			SqlSession session = sqlSessionFactory.openSession();
			List<Zw_Board> list=session.selectList("HdSearchList",m);
			session.close();//반납
			return list;
			
			
		}
		
		public List<zw_comment> allComment(int num){
			SqlSession session =sqlSessionFactory.openSession();
			List<zw_comment> list =session.selectList("allComment",num);
			session.close();
			return list;
		}
		public int boardWrite(Zw_Board vo) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.insert("boardWrite",vo);
			String login_id = vo.getLogin_id();
			session.update("writePoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int commentWrite(zw_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("commentWrite",comm);
			String login_id = comm.getLogin_id();
			session.update("commentPoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int boardDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("commentDelete2", num);
			int cnt =session.delete("boardDelete",num);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int commentDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.delete("commentDelete",num);
			System.out.println("mbdelete");
			session.commit();
			session.close();
			return cnt;
		}
		
		public Zw_Board boardView(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			Zw_Board vo =session.selectOne("boardView", num);
			session.close();
			return vo;
		}
		
		public int boardUpdate(Zw_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("boardUpdate", vo);
			session.commit();
			session.close();
			return cnt;
		}
		public int boardUpdate2(Zw_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("boardUpdate2", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public void countUpdate(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt= session.update("countUpdate", num);
			session.commit();
			session.close();
		}
		
		
		public void commentUpdate(zw_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			session.update("commentUpdate", comm);
			session.commit();
			session.close();
		}
		
		public int likeCheck(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("likeCheck",m);
			session.close();
			return cnt;
		}
		
		public void likeUpdate(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("likeUpdate",m);
			session.commit();
			session.close();
			
			
		}
		
		public void likeDelete(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("likeDelete",m);
			session.commit();
			session.close();
		}
		
		public int likeCount(int zw_seq) {
			
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("likeCount",zw_seq);
			Map<String,Object> m = new HashMap<>();
			m.put("cnt", cnt);
			m.put("zw_seq", zw_seq);
			session.update("updateLike", m);
			session.commit();
			session.close();
			return cnt;
			
		}

		public int searchListCount(Map<String,Object> m) {
			System.out.println(m.get("text"));
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("searchListCount", m);
			session.close();//반납
			return cnt;
		}

		public void deleteFile(int zw_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("deleteFile", zw_seq);
			session.commit();
			session.close();
		}
		
		//공지
		//제로웨이스트공지
		public void updateNotice(int zw_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("updateNotice", zw_seq);
			session.commit();
			session.close();
		}
		
		public void deleteNotice(int zw_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("deleteNotice", zw_seq);
			session.commit();
			session.close();
		}
		
		public List<Zw_Board> noticeList() {
			SqlSession session =sqlSessionFactory.openSession();
			List<Zw_Board> list =session.selectList("noticeList");
			session.close();
			return list;
		}
		public int searchheadCount(String headval) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("searchHeadCount", headval);
			session.close();//반납
			return cnt;
		}
		// 유튜브
		public int allyoutubecount() {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("allyoutubecount");
			session.close();
			return cnt;
			
		}
		
		
		public List<Youtube> youtubeSomeList(YoutubePaging page) {
			SqlSession session = sqlSessionFactory.openSession();
			List<Youtube> list=session.selectList("youtubeSomeList",page);
			session .close();//반납
			return list;
	}
		
		

		//등급제 게시판
		public int gradeListCount() {
			SqlSession session =sqlSessionFactory.openSession();
			int count =session.selectOne("gradeListCount");
			session.close();
			return count;
		}
		
		public List<grade_Board> gradeList(BoardPaging page){
			SqlSession session = sqlSessionFactory.openSession();
			List<grade_Board> list=session.selectList("gradeList",page);
			session .close();//반납
			return list;
		}
		
		public List<grade_Board> gradeNoticeList(){
			SqlSession session =sqlSessionFactory.openSession();
			List<grade_Board> list =session.selectList("gradeNoticeList");
			session.close();
			return list;
		}
		
		public List<grade_Board> gradeSearchList(Map<String,Object> m ){
			
			SqlSession session = sqlSessionFactory.openSession();
			List<grade_Board> list=session.selectList("gradeSearchList",m);
			session.close();//반납
			return list;
			
			
		}
		public List<Grade_comment> gradeAllComment(int num){
			SqlSession session =sqlSessionFactory.openSession();
			List<Grade_comment> list =session.selectList("gradeAllComment",num);
			session.close();
			return list;
		}
		public int gradeBoardWrite(grade_Board vo) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.insert("gradeBoardWrite",vo);
			String login_id = vo.getLogin_id();
			session.update("writePoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int gradeCommentWrite(Grade_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("gradeCommentWrite",comm);
			String login_id = comm.getLogin_id();
			session.update("commentPoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int gradeBoardDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("gradeCommentDelete2", num);
			int cnt =session.delete("gradeBoardDelete",num);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int gradeCommentDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.delete("gradeCommentDelete",num);
			session.commit();
			session.close();
			return cnt;
		}
		
		public grade_Board gradeBoardView(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			grade_Board vo =session.selectOne("gradeBoardView", num);
			session.close();
			return vo;
		}
		
		public int gradeBoardUpdate(grade_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("gradeBoardUpdate", vo);
			session.close();
			return cnt;
		}
		
		public List<Buy_Board> buyallList() {
			SqlSession session =sqlSessionFactory.openSession();
			List<Buy_Board> list =session.selectList("buyallList");
			session.close();
			return list;
			
	}
		
		public int buyallListCount() {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("buyallListCount");
			session.close();//반납
			return cnt;
		}
	
		public List<Buy_Board> buysomeList(BoardPaging page) {
			SqlSession session = sqlSessionFactory.openSession();
			List<Buy_Board> list=session.selectList("buysomeList",page);
			session .close();//반납
			return list;
	}
		
		public List<Buy_Board> buysearchList(Map<String,Object> m ){
			
			SqlSession session = sqlSessionFactory.openSession();
			List<Buy_Board> list=session.selectList("buysearchList",m);
			session.close();//반납
			return list;
		}
			
		//함께해요 게시판
		public List<ToBoard> toallList() {
			SqlSession session =sqlSessionFactory.openSession();
			List<ToBoard> list =session.selectList("toallList");
			session.close();
			return list;
			
		}
		
		public int toallListCount() {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("toallListCount");
			session.close();//반납
			return cnt;
		}
		
		public List<ToBoard> tosomeList(BoardPaging page) {
			SqlSession session = sqlSessionFactory.openSession();
			List<ToBoard> list=session.selectList("tosomeList",page);
			session .close();//반납
			return list;
		}
		
		public List<ToBoard> tosearchList(Map<String,Object> m ){
			
			SqlSession session = sqlSessionFactory.openSession();
			List<ToBoard> list=session.selectList("tosearchList",m);
			session.close();//반납
			return list;
		}
		
		public void toUpdateNotice(int notice) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("toUpdateNotice", notice);
			session.commit();
			session.close();
		}
		
		public void toDeleteNotice(int notice) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("toDeleteNotice", notice);
			session.commit();
			session.close();
		}
		
		public List<ToBoard> toNoticeList(){
			SqlSession session =sqlSessionFactory.openSession();
			List<ToBoard> list =session.selectList("toNoticeList");
			session.close();
			return list;
		}
		
		public List<buy_comment> buyallComment(int num){
			SqlSession session =sqlSessionFactory.openSession();
			List<buy_comment> list =session.selectList("buyallComment",num);
			session.close();
			return list;
		}
		public int buyboardWrite(Buy_Board vo) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.insert("buyboardWrite",vo);
			String login_id = vo.getLogin_id();
			session.update("buywritePoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public List<to_comment> toallComment(int num){
			SqlSession session =sqlSessionFactory.openSession();
			List<to_comment> list =session.selectList("toallComment",num);
			session.close();
			return list;
		}
		public int toboardWrite(ToBoard vo) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.insert("toboardWrite",vo);
			String login_id = vo.getLogin_id();
			session.update("towritePoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int buycommentWrite(buy_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("buycommentWrite",comm);
			String login_id = comm.getLogin_id();
			session.update("buycommentPoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int tocommentWrite(to_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("tocommentWrite",comm);
			String login_id = comm.getLogin_id();
			session.update("tocommentPoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int buyboardDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("buycommentDelete2", num);
			int cnt =session.delete("buyboardDelete",num);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int toboardDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("tocommentDelete2", num);
			int cnt =session.delete("toboardDelete",num);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int buycommentDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.delete("buycommentDelete",num);
			System.out.println("buymbdelete");
			session.commit();
			session.close();
			return cnt;
		}
		
		
		public int tocommentDelete(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.delete("tocommentDelete",num);
			System.out.println("tombdelete");
			session.commit();
			session.close();
			return cnt;
		}
		
		public Buy_Board buyboardView(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			Buy_Board vo =session.selectOne("buyboardView", num);
			session.close();
			return vo;
		}
		
		public ToBoard toboardView(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			ToBoard vo =session.selectOne("toboardView", num);
			session.close();
			return vo;
		}
		
		public int buyboardUpdate(Buy_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("buyboardUpdate", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		
		public int toboardUpdate(ToBoard vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("toboardUpdate", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		
		public int buyboardUpdate2(Buy_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("buyboardUpdate2", vo);
			session.commit();
			session.close();
			return cnt;
		}

		
		public int toboardUpdate2(ToBoard vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("toboardUpdate2", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public void buycountUpdate(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt= session.update("buycountUpdate", num);
			session.commit();
			session.close();
		}
		
		public void tocountUpdate(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt= session.update("tocountUpdate", num);
			session.commit();
			session.close();
		}
		
		
		public void buycommentUpdate(buy_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			session.update("buycommentUpdate", comm);
			session.commit();
			session.close();
		}
		
		public void tocommentUpdate(to_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			session.update("tocommentUpdate", comm);
			session.commit();
			session.close();
		}
		
		public int buylikeCheck(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("buylikeCheck",m);
			session.close();
			return cnt;
		}

		public int tolikeCheck(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("tolikeCheck",m);
			session.close();
			return cnt;
		}
		
		public void buylikeUpdate(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("buylikeUpdate",m);
			session.commit();
			session.close();
		}

		public void tolikeUpdate(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("tolikeUpdate",m);
			session.commit();
			session.close();
		}
		
		public void buylikeDelete(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("buylikeDelete",m);
			session.commit();
			session.close();
		}
			
		public void tolikeDelete(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("tolikeDelete",m);
			session.commit();
			session.close();
		}
		
		public int buylikeCount(int buy_seq) {
			
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("buylikeCount",buy_seq);
			Map<String,Object> m = new HashMap<>();
			m.put("cnt", cnt);
			m.put("buy_seq", buy_seq);
			session.update("buyupdateLike", m);
			session.commit();
			session.close();
			return cnt;
		}
			
			public int tolikeCount(int tb_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("tolikeCount",tb_seq);
			Map<String,Object> m = new HashMap<>();
			m.put("cnt", cnt);
			m.put("tb_seq", tb_seq);
			session.update("toupdateLike", m);
			session.commit();
			session.close();
			return cnt;
		}

		public int buysearchListCount(Map<String,Object> m) {
			System.out.println(m.get("text"));
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("buysearchListCount", m);
			session.close();//반납
			return cnt;
		}

		public void buydeleteFile(int buy_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("buydeleteFile", buy_seq);
			session.commit();
			session.close();
		}
		
		
		//공지
		public void buyupdateNotice(int buy_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("buyupdateNotice", buy_seq);
			session.commit();
			session.close();
		}
		
		public void buydeleteNotice(int buy_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("buydeleteNotice", buy_seq);
			session.commit();
			session.close();
		}
		
		public int tosearchListCount(Map<String,Object> m) {
			System.out.println(m.get("text"));
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("tosearchListCount", m);
			session.close();//반납
			return cnt;
		}
		
		public void todeleteFile(int tb_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("todeleteFile", tb_seq);
			session.commit();
			session.close();
		}
		
		public List<Buy_Board> buynoticeList() {
			SqlSession session =sqlSessionFactory.openSession();
			List<Buy_Board> list =session.selectList("buynoticeList");
			session.close();
			return list;
		}
		///공동구매 댓글폼
		public List<BCommForm> BCommFormList(BCommForm bcf){
			SqlSession session =sqlSessionFactory.openSession();
			List<BCommForm> list =session.selectList("BCommFormList",bcf);
			session.close();
			return list;
		}
		public List<BCommForm> BCommFormListadmin(BCommForm bcf){
			SqlSession session =sqlSessionFactory.openSession();
			List<BCommForm> list =session.selectList("BCommFormListadmin",bcf);
			session.close();
			return list;
		}
		public int BCommFormWrite(BCommForm comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("BCommFormWrite",comm);
//			int cnt2 = session.insert("BCommFormWriteGds",comm);
			String login_id = comm.getLogin_id();
			session.commit();
			session.close();
			return cnt;
		}
		
		//함께해요 게시판 폼
		public List<to_form> ftoallComment(int tb_seq){
			SqlSession session =sqlSessionFactory.openSession();
			List<to_form> list =session.selectList("ftoallComment",tb_seq);
			session.close();
			return list;
		}
		public int ftocommentDelete(to_form vo) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.delete("ftocommentDelete",vo);
			System.out.println("ftombdelete");
			session.commit();
			session.close();
			return cnt;
		}

		public int BCommFormDelete(BCommForm vo) {
			SqlSession session =sqlSessionFactory.openSession();
			int bf_seq=session.selectOne("selectseq",vo);
			session.delete("BCommFormDelete2",bf_seq);
			int cnt =session.delete("BCommFormDelete1",vo);
			System.out.println("BCommFormDelete");
			session.commit();
			session.close();
			return cnt;
		}
		public int gradeBoardUpdate2(grade_Board vo) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("gradeBoardUpdate2", vo);
			session.commit();
			session.close();
			return cnt;
		}
		
		public int ftocommentUpdate(to_form comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.update("ftocommentUpdate", comm);
			session.commit();
			session.close();
			return cnt;
		}

		public int BCommFormUpdate(BCommForm cb) {
			SqlSession session = sqlSessionFactory.openSession();
			cb.setBf_seq(session.selectOne("selectseq",cb));
			session.update("BCommFormUpdate2",cb);
			int cnt =session.update("BCommFormUpdate1",cb);
			System.out.println("BCommFormUpdate");
			session.commit();
			session.close();
			return cnt;
		}
		
		public int ftocommentWrite(to_form comm) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("ftocommentWrite",comm);
			session.commit();
			session.close();
			return cnt;
		}
		
		public void gradeCountUpdate(int num) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt= session.update("gradeCountUpdate", num);
			session.commit();
			session.close();
		}

		public void gradeCommentUpdate(Grade_comment comm) {
			SqlSession session = sqlSessionFactory.openSession();
			session.update("gradeCommentUpdate", comm);
			session.commit();
			session.close();
		}
		
		public int gradeLikeCheck(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("gradeLikeCheck",m);
			session.close();
			return cnt;
		}
		
		public void gradeLikeUpdate(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("gradeLikeUpdate",m);
			session.commit();
			session.close();
			
			
		}
		
		public void gradeLikeDelete(Map<String,Object> m ) {
			SqlSession session =sqlSessionFactory.openSession();
			session.delete("gradeLikeDelete",m);
			session.commit();
			session.close();
		}
		
		public int gradeLikeCount(int grade_seq) {
			
			SqlSession session =sqlSessionFactory.openSession();
			int cnt =session.selectOne("gradeLikeCount",grade_seq);
			Map<String,Object> m = new HashMap<>();
			m.put("cnt", cnt);
			m.put("grade_seq", grade_seq);
			session.update("gradeUpdateLike", m);
			session.commit();
			session.close();
			return cnt;
			
		}

		public int gradeSearchListCount(Map<String,Object> m) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.selectOne("gradeSearchListCount", m);
			session.close();//반납
			return cnt;
		}

		public void gradeDeleteFile(int grade_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("gradeDeleteFile", grade_seq);
			session.commit();
			session.close();
		}
		
		public void gradeUpdateNotice(int grade_seq) {
			
			SqlSession session =sqlSessionFactory.openSession();
			session.update("gradeUpdateNotice", grade_seq);
			session.commit();
			session.close();
		}
		
		public void gradeDeleteNotice(int grade_seq) {
			SqlSession session =sqlSessionFactory.openSession();
			session.update("gradeDeleteNotice", grade_seq);
			session.commit();
			session.close();
		}
	

		public void ftoCommentCheck(to_form tf) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("ftocommentCheck",tf);
			String login_id = tf.getLogin_id();
			session.update("tocommentPoint", login_id);
			session.commit();
			session.close();
		}
		public int ftoCommentPoint(String login_id) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt=session.update("ftocommentPoint", login_id);
			session.commit();
			session.close();
			return cnt;
		}
		
	
		
}
