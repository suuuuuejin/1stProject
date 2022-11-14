package kr.login.dao;

import java.io.InputStream;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.admin.entity.AdminPaging;
import kr.admin.entity.Notice;
import kr.buy_board.entity.Buy_Board;
import kr.buy_comm_form.entity.BCommForm;
import kr.grade.entity.grade_Board;
import kr.imgboard.entity.Img_Board;
import kr.login.entity.Cal;
import kr.login.entity.Kakao_member;
import kr.login.entity.Member;
import kr.map.entity.MapPaging;
import kr.map.entity.Mapvo;
import kr.toBoard.entity.ToBoard;
import kr.weekly.entity.Weekly;
import kr.zw_board.entity.Board;
import kr.zw_board.entity.BoardPaging;
import kr.zw_board.entity.Zw_Board;
import kr.zw_comment.entity.zw_comment;

public class MemberMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;
	//초기화 블럭(프로그램 실행시 딱 한번만 실행)
	static {
		try {
		String resource = "kr/login/dao/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource); //빨대를 만들어줌
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream); //build에 빨대를 넘겨주고 connection pool를 가리킴
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 카카오 로그인
	/*
	 * public Member loginWithKakao(Member user) { User savedUser =
	 * userMapper.getUserByEmail(user.getEmail()); if(savedUser == null) {
	 * userMapper.addUser(user); } return savedUser; }
	 */
	public Member findMember(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		Member vo = session.selectOne("memberView", login_id);
		
		session.close();
		return vo;
	}
	
	public Map<String,Object> BoardBest() {
		SqlSession session =sqlSessionFactory.openSession();
		Map<String,Object> m = new HashMap<String,Object>();
		Zw_Board zw = session.selectOne("zwBoardBest");
		Img_Board img = session.selectOne("imgBoardBest");
		ToBoard to =  session.selectOne("toBoardBest");
		Buy_Board buy = session.selectOne("buyBoardBest");
		m.put("zw", zw);
		m.put("img", img);
		m.put("to", to);
		m.put("buy", buy);
		session.close();
		return m;
	}	
	
		
		//게시판
		public List<Member> adminList() {
			AdminPaging paging = new AdminPaging();
			
			List<Member> list;
			SqlSession session = sqlSessionFactory.openSession();
			
			if(Objects.equals(paging.getOption(), "user_id") && (paging.getSearch() != null)) {
				list = session.selectList("idList", paging );
			}else if(Objects.equals(paging.getOption(), "user_nick") && (paging.getSearch() != null)){
				list = session.selectList("nickList", paging );
			}else {
				list = session.selectList("allList");
			}
			
			session.close();
			return list;
			
		}
		
		public List<Member> adminPageList(int num){
			
			AdminPaging pagelist = new AdminPaging();
			pagelist.list_Start(num);
			pagelist.list_End(num);
			System.out.println(pagelist);
			SqlSession session = sqlSessionFactory.openSession();
			List<Member> list = session.selectList("adminpageList", pagelist);
			session.close();
			return list;
			
		}
		
		public List<Member> searching(int num, AdminPaging searchlist){
			
			SqlSession session = sqlSessionFactory.openSession();
			
			searchlist.list_Start(num);
			searchlist.list_End(num);
			
			System.out.println(searchlist);
			List<Member> list;
			if(Objects.equals(searchlist.getOption(), "user_id")) {
				list = session.selectList("idSearchList", searchlist );
			}else {
				list = session.selectList("nickSearchList", searchlist );
			}
			session.close();
			return list;
		}
		
		
		
		public int noticeList() {
			SqlSession session = sqlSessionFactory.openSession();
			int count = session.selectOne("adminnoticeList");
			session.close();
			return count;
			
		}
		
		
		public List<Zw_Board> zwNoticePageList(int num){
			AdminPaging pagelist = new AdminPaging();
			pagelist.list_Start(num);
			pagelist.list_End(num);
			System.out.println(pagelist);
			SqlSession session = sqlSessionFactory.openSession();
			List<Zw_Board> list = session.selectList("zwnoticepageList", pagelist);
			session.close();
			return list;
			
		}
		
		public List<ToBoard> toNoticePageList(int num){
			AdminPaging pagelist = new AdminPaging();
			pagelist.list_Start(num);
			pagelist.list_End(num);
			System.out.println(pagelist);
			SqlSession session = sqlSessionFactory.openSession();
			List<ToBoard> list = session.selectList("tonoticepageList", pagelist);
			session.close();
			return list;
			
		}
		
		
		public List<grade_Board> gradeNoticePageList(int num){
			AdminPaging pagelist = new AdminPaging();
			pagelist.list_Start(num);
			pagelist.list_End(num);
			System.out.println(pagelist);
			SqlSession session = sqlSessionFactory.openSession();
			List<grade_Board> list = session.selectList("gradenoticepageList", pagelist);
			session.close();
			return list;
			
		}
		
		


	//로그인
	public Member login(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		Member mvo=session.selectOne("login", vo);
		session.close();
		return mvo;
	}

	public int join(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt1 = session.insert("join1", vo);
		int cnt2 = session.insert("join2", vo);
		session.commit();
		session.close();
		return cnt1 + cnt2;

	}

	// 카카오 로그인
	
	public Member KakaoLogin(Kakao_member vo) {
		SqlSession session = sqlSessionFactory.openSession(); // connection pool에서 SQLSession을 꺼내옴
		Member mvo = session.selectOne("KakaoLogin", vo);
		System.out.println(mvo);
		session.close(); // SQLSession반납
		return mvo;
	}

	public int KakaoJoin(Kakao_member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt1 = session.insert("KakaoJoin1", vo);
		int cnt2 = session.insert("KakaoJoin2", vo);
		session.commit();
		session.close();
		return cnt1 + cnt2;

	}

	// 등업
	public int gradeUp(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt1 = session.update("gradeUp", vo);
		session.commit();
		session.close();
		return cnt1;

	}
	// 게시판

	// 마이페이지
	public List<Board> myWriteZero(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> list = session.selectList("myWriteZero", login_id);
		session.close();
		return list;

	}

	public List<Board> myWriteVg(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> list = session.selectList("myWriteVg", login_id);
		session.close();
		return list;

	}

	public List<Board> myWriteTo(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> list = session.selectList("myWriteTo", login_id);
		session.close();
		return list;
	}

	public List<Board> myWriteImg(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> list = session.selectList("myWriteImg", login_id);
		session.close();
		return list;
	}

	public List<Board> myWriteComment(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> list = session.selectList("myWriteImg", login_id);
		session.close();
		return list;
	}

	public List<zw_comment> myComment(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<zw_comment> list = session.selectList("myComment", login_id);
		session.close();
		return list;
	}

	public List<zw_comment> myComVg(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<zw_comment> list = session.selectList("myComVg", login_id);
		session.close();
		return list;
	}

	public List<zw_comment> myComTo(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<zw_comment> list = session.selectList("myComTo", login_id);
		session.close();
		return list;
	}

	public List<zw_comment> myComImg(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<zw_comment> list = session.selectList("myComImg", login_id);
		session.close();
		return list;
	}

	// 회원가입
	// ID검색
	public int getById(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.selectOne("getById", login_id);
		session.close();
		return cnt;

	}

	// 닉네임 검색
	public int getByNic(String u_nick) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.selectOne("getByNic", u_nick);
		session.close();
		return cnt;
	}

	// 회원정보 수정
	public int memberUpdate(Member vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt1 = session.update("memberUpdate1", vo);
		int cnt2 = session.update("memberUpdate2", vo);
		session.commit();
		session.close();
		return cnt1 + cnt2;

	}

	// 회원 정보 리스트
	public Member memberView(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		Member vo = session.selectOne("memberView", login_id);
		session.close();
		return vo;
	}

	// 회원정보 삭제(탈퇴)
	public int memberDelete(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.delete("memberDelete", login_id);
		session.commit();
		session.close();
		return cnt;
	}

	// 칼럼
	public List<Cal> allCal() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Cal> list = session.selectList("allCal");
		session.close();
		return list;
	}

	public int allListCount() {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.selectOne("allCalListCount");
		session.close();// 반납
		return cnt;
	}

	public List<Cal> someList(BoardPaging page) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Cal> list = session.selectList("someCalList", page);
		session.close();// 반납
		return list;
	}

	// 주간인기검색어
	public List<Weekly> zero_List() {
		SqlSession session = sqlSessionFactory.openSession(); // connection pool에서 SQLSession을 꺼내옴
		List<Weekly> list = session.selectList("zero_List"); // select * from boarder order by num
		session.close(); // SQLSession반납
		return list;
	}

	public List<Weekly> vegan_List() {
		SqlSession session = sqlSessionFactory.openSession(); // connection pool에서 SQLSession을 꺼내옴
		List<Weekly> list = session.selectList("vegan_List"); // select * from boarder order by num
		session.close(); // SQLSession반납
		return list;
	}

	public List<Weekly> plastic_List() {
		SqlSession session = sqlSessionFactory.openSession(); // connection pool에서 SQLSession을 꺼내옴
		List<Weekly> list = session.selectList("plastic_List"); // select * from boarder order by num
		session.close(); // SQLSession반납
		return list;
	}

	// 지도 페이지
	public List<Mapvo> mapAllList() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Mapvo> list = session.selectList("mapList");
		session.close();
		return list;
	}

	public int mapCount() {
		SqlSession session = sqlSessionFactory.openSession();
		int count = session.selectOne("mapCount");
		session.close();
		return count;
	}

	public List<Mapvo> mapSearchList(String search) {
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println(search);
		List<Mapvo> list = session.selectList("m_searchList", search);
		session.close();
		return list;
	}

	public int MapData(Mapvo vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("map", vo);
		session.commit();
		session.close();
		return cnt;
	}

	public int MapVData(Mapvo vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("vmap", vo);
		session.commit();
		session.close();
		return cnt;
	}

	public List<Mapvo> PageList(int page) {

		MapPaging pagelist = new MapPaging();
		pagelist.list_Start(page);
		pagelist.list_End(page);
		SqlSession session = sqlSessionFactory.openSession();
		List<Mapvo> list = session.selectList("pageList", pagelist);
		session.close();
		return list;
	}

	public List<Mapvo> MSearchList(String search) {
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println(search);
		List<Mapvo> list = session.selectList("m_searchList", search);
		session.close();
		return list;
	}

	public List<Mapvo> t_SearchPage(int page, String search) {
		MapPaging pagelist = new MapPaging();
		pagelist.s_startPage();
		pagelist.s_endPage(search);
		pagelist.setStore_search(search);
		pagelist.list_Start(page);
		pagelist.list_End(page);
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("search page : " + pagelist);
		List<Mapvo> list = session.selectList("t_searchPage", pagelist);
		session.close();
		return list;
	}

	public List<Mapvo> a_SearchPage(int page, String search) {
		MapPaging pagelist = new MapPaging();
		pagelist.s_startPage();
		pagelist.s_endPage(search);
		pagelist.setStore_search(search);
		pagelist.list_Start(page);
		pagelist.list_End(page);
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("search page : " + pagelist);
		List<Mapvo> list = session.selectList("a_searchPage", pagelist);
		session.close();
		return list;
	}

	public int myWriteCount(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.selectOne("myWriteCount", login_id);
		session.close();
		return cnt;

	}

	public int myCommentCount(String login_id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.selectOne("myCommentCount", login_id);
		session.close();
		return cnt;

	}

	// 게시판

	

}
