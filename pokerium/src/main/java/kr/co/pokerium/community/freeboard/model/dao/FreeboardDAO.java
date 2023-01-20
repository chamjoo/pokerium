package kr.co.pokerium.community.freeboard.model.dao;



import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.pokerium.community.freeboard.model.vo.FreeboardInfo;


@Repository
public class FreeboardDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public ArrayList<FreeboardInfo> freeboardList(HashMap<String, Object> map) {
		// 자유게시판 목록(첫 화면 : 전체목록, + 페이징처리 및 검색필터 (쿼리문))
		
		return new ArrayList<FreeboardInfo> (sqlSession.selectList("freeboard.selectAllList", map));
		
		
	}

	public String getPageNavi(HashMap<String, Object> map) {
		// 자유게시판 목록에 페이징네비게이션 처리
		
			int pageNo = (int)map.get("pageNo");
			String type = (String)map.get("type");
			String keyword = (String)map.get("keyword");
					
		
			int selectRecordAllCount = (int)map.get("selectRecordAllCount");
			int recordCountPerPage = (int)map.get("recordCountPerPage");
			int naviCountPerPage = (int)map.get("naviCountPerPage");
			
			
			int pageTotalCount = (int)Math.ceil((double)selectRecordAllCount/ recordCountPerPage );
			int startNavi = ((pageNo - 1) / naviCountPerPage * naviCountPerPage + 1);
			
			int endNavi = startNavi + naviCountPerPage - 1;
			
			
			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			
			StringBuilder sb = new StringBuilder();
			if (startNavi != 1) {
				if(map.get("keyword").equals("")) {
					sb.append("<a href='/community/freeboard?pageNo=" + (startNavi - 1) + "'>< </a>");
				} else {
					sb.append("<a href='/community/freeboard?pageNo=" + (startNavi - 1) +"&type="+ type +"&keyword="+ keyword +"'>< </a>");
				}
			}
			for (int i = startNavi; i <= endNavi; i++) {
				
				if(i == (int)map.get("pageNo")) {
					if(map.get("keyword").equals("")) {
						sb.append("<a href='/community/freeboard?pageNo=" + i + "'><B>" + i + "</B></a> ");
					} else {
						sb.append("<a href='/community/freeboard?pageNo=" + i + "&type="+ type +"&keyword="+ keyword +"'><B>" + i + "</B></a> ");
					}
				} else {
					if(map.get("keyword").equals("")) {
						sb.append("<a href='/community/freeboard?pageNo=" + i + "'>" + i + "</a> ");
					} else {
						sb.append("<a href='/community/freeboard?pageNo=" + i + "&type="+ type +"&keyword="+ keyword +"'>" + i + "</a> ");
					}
				}
			}
			if (endNavi != pageTotalCount) {
				if(map.get("keyword").equals("")) {
					sb.append("<a href='/community/freeboard?pageNo=" + (endNavi + 1) + "'>></a>");
				} else {
					sb.append("<a href='/community/freeboard?pageNo=" + (endNavi + 1) + "&type="+ type +"&keyword="+ keyword +"'>></a>");
				}
			}
			return sb.toString();
	}

	public int selectRecordAllCount(HashMap<String, Object> map) {
		// 검색된 레코드 개수
		
			return sqlSession.selectOne("freeboard.selectRecordAllCount", map);
		
	}

	public int fbiRecordAllCount() {
		// 자유게시판 전체 레코드 개수
		
		return sqlSession.selectOne("freeboard.fbiRecordAllCount");
		
	}

	public int insertFBI(HashMap<String, Object> map) {
		
		return sqlSession.insert("freeboard.insertFbi", map);
		
	}

	public FreeboardInfo selectFbiView(String no) {

		return sqlSession.selectOne("freeboard.selectFbiView", no);
		
	}

	public int updateFbiReadcnt(String no) {

		return sqlSession.update("freeboard.updateFbiReadcnt", no);
		
	}

	public int updateFbi(FreeboardInfo fbi) {
		
		return sqlSession.update("freeboard.updateFbi", fbi);
		
	}

	public int deleteFbi(FreeboardInfo checkFbi) {
		
		return sqlSession.update("freeboard.deleteFbi", checkFbi);
		
	}
	
	
	
}
