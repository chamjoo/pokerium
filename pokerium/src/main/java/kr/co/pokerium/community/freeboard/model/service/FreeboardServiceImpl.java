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
		
		return fbDAO.freeboardList(map);
		
		
		
		
		
	}

	@Override
	public String getPageNavi(HashMap<String, Object> map) {


		
		return fbDAO.getPageNavi(map);
		
	
	}

	
}
