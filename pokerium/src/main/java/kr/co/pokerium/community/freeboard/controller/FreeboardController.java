package kr.co.pokerium.community.freeboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pokerium.community.freeboard.model.service.FreeboardService;
import kr.co.pokerium.community.freeboard.model.vo.FreeboardInfo;
import kr.co.pokerium.member.model.vo.MemberInfo;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService fbService;
	
	
	@RequestMapping(value="/community/freeboard", method = RequestMethod.GET)
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
	
	@RequestMapping(value="/community/freeboard/write", method = RequestMethod.GET)
	public String freeboardWritePage() {
		
		return "community/freeBoard/writePage";
		
	}
	
	@RequestMapping(value="/community/freeboard/insertFbi",method = RequestMethod.POST)
	public ModelAndView insertFbi(	@SessionAttribute MemberInfo member,
							FreeboardInfo fbi,
							ModelAndView mav						) {
		
			String fbiContent = fbi.getFbiContent().replace("\r\n", "<br>");
			fbi.setFbiContent(fbiContent);
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			
			if(member!=null) {
				
				map.put("member", member);
				map.put("fbi", fbi);
				
				int result = fbService.insertFbi(map);
				
				if(result>0) {
					mav.addObject("msg", "게시물이 작성되었습니다.");
					mav.addObject("location", "/community/freeboard");
				} else {
					
					mav.addObject("msg", "게시물이 작성에 실패하였습니다.\n지속적인 오류가 발생한다면 관리자에게 문의해주세요");
					mav.addObject("location", "/community/freeboard");
					
				}
				
			} else {
				
				mav.addObject("msg", "세션이 만료되었습니다. 다시 로그인해주세요.");
				mav.addObject("location", "/");
			}
		
			mav.setViewName("/common/msg");
			
			return mav;
	}
	
	@RequestMapping(value="/community/freeboard/write", method = RequestMethod.GET)
	public String freeboardViewPage() {
		
		return "community/freeBoard/writePage";
		
	}
	
}
