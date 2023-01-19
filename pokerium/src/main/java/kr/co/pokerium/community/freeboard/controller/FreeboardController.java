package kr.co.pokerium.community.freeboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pokerium.community.freeboard.model.service.FreeboardService;
import kr.co.pokerium.community.freeboard.model.vo.FreeboardInfo;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService fbService;
	
	
	@RequestMapping(value="community/freeboard", method = RequestMethod.GET)
	public ModelAndView freeboardList( 	@RequestParam(value="type", defaultValue="") String type,
										@RequestParam(value="keyword", defaultValue="") String keyword,
										@RequestParam(value="pageNo", defaultValue="1") int pageNo,
										@RequestParam(value="recordCountPerPage", defaultValue="5") int recordCountPerPage,
										ModelAndView mav	) {
		
		
		int startPage = pageNo * recordCountPerPage - (recordCountPerPage - 1);
		int endPage = pageNo * recordCountPerPage;
		int naviCountPerPage = 5;
		
		
				
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("naviCountPerPage", naviCountPerPage);
		map.put("pageNo", pageNo);
		map.put("recordCountPerPage", recordCountPerPage);
		
		int selectRecordAllCount = fbService.selectRecordAllCount(map); 
		int fbiRecordAllCount = fbService.fbiRecordAllCount();
		
		map.put("selectRecordAllCount", selectRecordAllCount);
		map.put("fbiRecordAllCount", fbiRecordAllCount);
		
		
		String pageNavi = fbService.getPageNavi(map);
		ArrayList<FreeboardInfo> fbi = fbService.freeboardList(map);
		
		mav.addObject("pageNavi", pageNavi);
		mav.addObject("keyword", keyword);
		mav.addObject("fbi", fbi);
		mav.setViewName("community/freeBoard/freeBoard");
		
		return mav;
		
	}
}
