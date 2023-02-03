package kr.co.pokerium.community.freeboard.model.service;




import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pokerium.community.freeboard.model.dao.FreeboardDAO;
import kr.co.pokerium.community.freeboard.model.vo.FreeboardInfo;


@Service
public class FreeboardServiceImpl implements FreeboardService {

	@Autowired
	private FreeboardDAO fbDAO;

	@Override
	public ArrayList<FreeboardInfo> freeboardList(HashMap<String, Object> map) {
		// 게시판 목록
		return fbDAO.freeboardList(map);
		

	}

	@Override
	public String getPageNavi(HashMap<String, Object> map) {
		// 게시판 페이지네비 출력
		return fbDAO.getPageNavi(map);
		
	
	}

	@Override
	public int selectRecordAllCount(HashMap<String, Object> map) {
		// 조회한 게시물 수
		return fbDAO.selectRecordAllCount(map);
		
	}

	@Override
	public int fbiRecordAllCount() {
		// 총 게시물 수
		return fbDAO.fbiRecordAllCount();
		
	}

	@Override
	public int insertFbi(HashMap<String, Object> map) {
		// 게시물 작성
		return fbDAO.insertFBI(map);
		
	}

	@Override
	public FreeboardInfo selectFbiView(String no) {
		// 게시물 상세정보
		return fbDAO.selectFbiView(no);
		
	}

	@Override
	public int updateFbiReadcnt(String no) {
		// 게시물 조회수 증가
		return fbDAO.updateFbiReadcnt(no);
		
	}

	@Override
	public int updateFbi(FreeboardInfo fbi) {
		// 게시물 수정
		return fbDAO.updateFbi(fbi);
		
	}

	@Override
	public int deleteFbi(FreeboardInfo checkFbi) {
		// 게시물 삭제
		return fbDAO.deleteFbi(checkFbi);
		
	}

	@Override
	public int insertCommentAjax(HashMap<String, Object> map) {
		// 게시물에 댓글작성 메소드
		return fbDAO.insertCommentAjax(map);
		
	}

	
}
