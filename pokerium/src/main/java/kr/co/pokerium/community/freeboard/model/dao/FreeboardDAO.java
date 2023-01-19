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

		return new ArrayList<FreeboardInfo> (sqlSession.selectList("freeboard.selectAllList", map));
		
		
	}

	public String getPageNavi(HashMap<String, Object> map) {
		
			int recordTotalCount = sqlSession.selectOne("freeboard.selectTotalCount", map);
			int pageTotalCount = (int)Math.ceil((double)recordTotalCount/(int)map.get("recordCountPerPage"));
			int startNavi = (((int)map.get("pageNo") - 1) / (int)map.get("naviCountPerPage") * (int)map.get("naviCountPerPage") + 1);
			
			int endNavi = startNavi + (int)map.get("naviCountPerPage") - 1;
			
			
			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			
			StringBuilder sb = new StringBuilder();
			if (startNavi != 1) {
				if(map.get("keyword").equals("")) {
					sb.append("<a href='/community/freeboard?pageNo=" + (startNavi - 1) + "'>< </a>");
				} else {
					sb.append("<a href='/community/freeboard?pageNo=" + (startNavi - 1) +"&type="+map.get("type")+"&keyword="+map.get("keyword")+"'>< </a>");
				}
			}
			for (int i = startNavi; i <= endNavi; i++) {
				
				if(i == (int)map.get("pageNo")) {
					if(map.get("keyword").equals("")) {
						sb.append("<a href='/community/freeboard?pageNo=" + i + "'><B>" + i + "</B></a> ");
					} else {
						sb.append("<a href='/community/freeboard?pageNo=" + i +"&type="+map.get("type")+"&keyword="+map.get("keyword")+"'><B>" + i + "</B></a> ");
					}
				} else {
					if(map.get("keyword").equals("")) {
						sb.append("<a href='/community/freeboard?pageNo=" + i + "'>" + i + "</a> ");
					} else {
						sb.append("<a href='/community/freeboard?pageNo=" + i +"&type="+map.get("type")+"&keyword="+map.get("keyword")+"'>" + i + "</a> ");
					}
				}
			}
			if (endNavi != pageTotalCount) {
				if(map.get("keyword").equals("")) {
					sb.append("<a href='/community/freeboard?pageNo=" + (endNavi + 1) + "'>></a>");
				} else {
					sb.append("<a href='/community/freeboard?pageNo=" + (endNavi + 1) +"&type="+map.get("type")+"&keyword="+map.get("keyword")+"'>></a>");
				}
			}
			return sb.toString();
	}
	
	
	
}
