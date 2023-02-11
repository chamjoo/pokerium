package kr.co.pokerium.community.freeboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import kr.co.pokerium.community.freeboard.model.vo.FreeboardInfo;
import kr.co.pokerium.community.freeboard.model.vo.FreeboardReply;

@Service
public interface FreeboardService {

	ArrayList<FreeboardInfo> freeboardList(HashMap<String, Object> map);

	String getPageNavi(HashMap<String, Object> map);

	int selectRecordAllCount(HashMap<String, Object> map);

	int fbiRecordAllCount();

	int insertFbi(HashMap<String, Object> map);

	FreeboardInfo selectFbiView(String no);

	int updateFbiReadcnt(String no);

	int updateFbi(FreeboardInfo fbi);

	int deleteFbi(FreeboardInfo checkFbi);

	int insertCommentAjax(HashMap<String, Object> map);

	ArrayList<FreeboardReply> selectFreeboardReply(String no);

	int updateCommentAjax(HashMap<String, Object> map);

	int deleteCommentAjax(HashMap<String, Object> map);

	int insertReCommentAjax(HashMap<String, Object> map);

}
