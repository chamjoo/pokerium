package kr.co.pokerium.community.freeboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pokerium.community.freeboard.model.service.FreeboardService;
import kr.co.pokerium.community.freeboard.model.vo.FreeboardInfo;
import kr.co.pokerium.community.freeboard.model.vo.FreeboardReply;
import kr.co.pokerium.member.model.vo.MemberInfo;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService fbService;
	
	
	@RequestMapping(value="/community/freeboard", method = RequestMethod.GET)
	public ModelAndView freeboardList( 	@RequestParam(value="type", defaultValue="") String type,
										@RequestParam(value="keyword", defaultValue="") String keyword,
										@RequestParam(value="pageNo", defaultValue="1") int pageNo,
										@RequestParam(value="recordCountPerPage", defaultValue="10") int recordCountPerPage,
										ModelAndView mav	) {
	// 자유게시판 목록 페이지
		
		
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
		
		int selectRecordAllCount = fbService.selectRecordAllCount(map); 	// 조건을 통해 조회된 게시물 수
		int fbiRecordAllCount = fbService.fbiRecordAllCount();				// 자유게시판 총 게시물 수
		
		map.put("selectRecordAllCount", selectRecordAllCount);
		map.put("fbiRecordAllCount", fbiRecordAllCount);
		
		
		String pageNavi = fbService.getPageNavi(map);
		ArrayList<FreeboardInfo> fbi = fbService.freeboardList(map);
		
		mav.addObject("map", map);
		mav.addObject("pageNavi", pageNavi);
		mav.addObject("keyword", keyword);
		mav.addObject("fbi", fbi);
		mav.setViewName("/community/freeBoard/freeBoard");
		
		return mav;
		
	}
	
	@RequestMapping(value="/community/freeboard/write", method = RequestMethod.GET)
	public String freeboardWritePage() {
		// 자유게시판 게시물 작성 페이지
		
		return "/community/freeBoard/writePage";
		
	}
	
	@RequestMapping(value="/community/freeboard/insertFbi",method = RequestMethod.POST)
	public ModelAndView insertFbi(	@SessionAttribute MemberInfo member,
									FreeboardInfo fbi,
									ModelAndView mav						) {
			// 자유게시판 게시물 작성 메소드
		
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
					
					mav.addObject("msg", "게시물 작성에 실패하였습니다.\n지속적인 오류가 발생한다면 관리자에게 문의해주세요");
					mav.addObject("location", "/community/freeboard");
					
				}
				
			} else {
				
				mav.addObject("msg", "세션이 만료되었습니다. 다시 로그인해주세요.");
				mav.addObject("location", "/");
			}
		
			mav.setViewName("/common/msg");
			
			return mav;
	}
	
	@RequestMapping(value="/community/freeboard/view", method = RequestMethod.GET)
	public ModelAndView freeboardViewPage(	@RequestParam String no,
											ModelAndView mav			) {
			// 자유게시판 게시물 상세정보 페이지 + 조회수 증가
			
			int readCnt = fbService.updateFbiReadcnt(no);
			FreeboardInfo fbi = fbService.selectFbiView(no);
			
			String fbiContent = fbi.getFbiContent().replace("<br>", "&#10;");
			fbi.setFbiContent(fbiContent);
			
			ArrayList<FreeboardReply> fbr = fbService.selectFreeboardReply(no);
			String fbrCount = Integer.toString(fbr.size());
			
			
			mav.addObject("fbi", fbi);
			mav.addObject("fbr", fbr);
			mav.addObject("fbrCount", fbrCount);
			mav.setViewName("/community/freeBoard/viewPage");
		
		return mav;
		
	}
	
	@RequestMapping(value="/community/freeboard/view/edit", method = RequestMethod.POST)
	public ModelAndView freeboardEditPage(	@RequestParam String no,
									@SessionAttribute MemberInfo member,
									ModelAndView mav				) {
		
		// 자유게시판 수정페이지 이동
		
		
		FreeboardInfo fbi = fbService.selectFbiView(no);
		String fbiContent = fbi.getFbiContent().replace("<br>", "&#10;");
		fbi.setFbiContent(fbiContent);
		
		if(fbi.getMiId().equals(member.getMiId())) {
			
			mav.addObject("fbi", fbi);
			mav.setViewName("/community/freeBoard/editPage");

		} else {
			mav.addObject("msg", "잘못된 경로로 들어오셨습니다.");
			mav.addObject("location", "/");
			mav.setViewName("/common/msg");
			
		}
		
		return mav;
		
	}
	
	@RequestMapping(value="/community/freeboard/view/editFbi", method = RequestMethod.POST)
	public ModelAndView updateFbi( 	FreeboardInfo fbi,
							@SessionAttribute MemberInfo member,
							ModelAndView mav
			) {
		
			// 자유게시판 수정 메소드
		
			String fbiContent = fbi.getFbiContent().replace("\r\n", "<br>");
			fbi.setFbiContent(fbiContent);
			
			FreeboardInfo checkFbi = fbService.selectFbiView(Integer.toString(fbi.getFbiIdx()));
			
			if(checkFbi.getMiId().equals(member.getMiId())) {
				fbi.setMiId(member.getMiId());
				int result = fbService.updateFbi(fbi);
				
				if(result>0) {
					
					mav.addObject("msg", "게시물이 수정되었습니다.");
					mav.addObject("location", "/community/freeboard/view?no=" + fbi.getFbiIdx());
					mav.setViewName("/common/msg");
					
				} else {
					mav.addObject("msg", "게시물 수정에 실패하였습니다.\n지속적인 오류가 발생한다면 관리자에게 문의해주세요");
					mav.addObject("location", "/community/freeboard");
					mav.setViewName("/common/msg");
				}
			} else {
				mav.addObject("msg", "잘못된 경로로 들어오셨습니다.");
				mav.addObject("location", "/");
				mav.setViewName("/common/msg");
			}
			
			return mav;
		
		
	}
	
	@RequestMapping(value="/community/freeboard/view/delete", method = RequestMethod.GET)
	public ModelAndView deleteFbi(	@RequestParam String no,
							@SessionAttribute MemberInfo member,
							ModelAndView mav					) {
		
		//	게시물을 삭제하는 메소드
		
		FreeboardInfo checkFbi = fbService.selectFbiView(no);
		
		if(checkFbi.getMiId().equals(member.getMiId())) {
			
			int result = fbService.deleteFbi(checkFbi);
			
			if(result>0) {
				mav.addObject("msg", "게시물이 삭제되었습니다.");
				mav.addObject("location", "/community/freeboard");
				mav.setViewName("/common/msg");
				
			} else {
				mav.addObject("msg", "게시물 삭제에 실패하였습니다.\n지속적인 오류가 발생한다면 관리자에게 문의해주세요");
				mav.addObject("location", "/community/freeboard/view?no="+no);
				mav.setViewName("/common/msg");
			}

		} else {
			mav.addObject("msg", "잘못된 경로로 들어오셨습니다.");
			mav.addObject("location", "/");
			mav.setViewName("/common/msg");
			
		}
		
		return mav;
		
		
	}
	
	@RequestMapping(value="/community/freeboard/view/insertComment", method = RequestMethod.POST)
	public void insertCommentAjax(	@RequestParam String fbrComment,
									@RequestParam String fbiIdx,
									@SessionAttribute MemberInfo member,
									HttpServletResponse response
																		) throws IOException {
		// 자유게시판 댓글달기 메소드(ajax)
		
		String miId = member.getMiId();
		int result = 0;
		String fbrComment_re = fbrComment.replace("\r\n", "<br>");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fbrComment", fbrComment_re);
		map.put("fbiIdx", fbiIdx);
		map.put("miId", miId);
		
		result = fbService.insertCommentAjax(map);
		
		if(result>0) {
			response.getWriter().print(true); 
		} else {
			response.getWriter().print(false);
		}
		
		
	}
	
	@RequestMapping(value="/community/freeboard/view/updateComment" ,method = RequestMethod.POST)
	public void updateCommentAjax(	@RequestParam String fbrComment,
									@RequestParam String fbiIdx,
									@RequestParam String fbrIdx,
									@RequestParam String miId,
									@RequestParam String fbrStep,
									@RequestParam String fbrLevel,
									@SessionAttribute MemberInfo member,
									HttpServletResponse response
																) throws IOException {
		
		// 자유게시판 댓글수정 메소드(ajax)
				int result = 0;
				
				if(miId.equals(member.getMiId())) {
					miId = member.getMiId();
					
					String fbrComment_re = fbrComment.replace("\r\n", "<br>");
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("fbrComment", fbrComment_re);
					map.put("fbiIdx", fbiIdx);
					map.put("fbrIdx", fbrIdx);
					map.put("miId", miId);
					map.put("fbrStep", fbrStep);
					map.put("fbrLevel", fbrLevel);

					result = fbService.updateCommentAjax(map);
					}
				
				if(result>0) {
					response.getWriter().print(true); 
				} else {
					response.getWriter().print(false);
				}
		
		
	}
	
	@RequestMapping(value="/community/freeboard/view/deleteComment", method = RequestMethod.POST)
	public void deleteCommentAjax(
									@RequestParam String fbiIdx,
									@RequestParam String fbrIdx,
									@RequestParam String miId,
									@RequestParam String fbrStep,
									@RequestParam String fbrLevel,
									@SessionAttribute MemberInfo member,
									HttpServletResponse response
																) throws IOException {
		// 자유게시판 댓글삭제 메소드(ajax)
			int result = 0;

			if(miId.equals(member.getMiId())) {
				miId = member.getMiId();
				
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fbiIdx", fbiIdx);
				map.put("fbrIdx", fbrIdx);
				map.put("miId", miId);
				map.put("fbrStep", fbrStep);
				map.put("fbrLevel", fbrLevel);
				
				result = fbService.deleteCommentAjax(map);
				}
			
			if(result>0) {
				response.getWriter().print(true); 
			} else {
				response.getWriter().print(false);
			}
		
	}
	
	@RequestMapping(value="/community/freeboard/view/insertReComment", method = RequestMethod.POST)
	public void insertReCommentAjax(	@RequestParam String fbrComment,
									@RequestParam String fbiIdx,
									@RequestParam String fbrIdx,
									@RequestParam String fbrStep,
									@RequestParam String fbrLevel,
									@RequestParam String fbrParent,
									@RequestParam String fbrNum,
									@SessionAttribute MemberInfo member,
									HttpServletResponse response) throws IOException {
			
		// 대댓글 등록 메소드
			
		int result = 0;
		
		String miId = member.getMiId();
		
		String fbrComment_re = fbrComment.replace("\r\n", "<br>");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fbrComment", fbrComment_re);
		map.put("fbiIdx", fbiIdx);
		map.put("fbrIdx", fbrIdx);
		map.put("miId", miId);
		map.put("fbrStep", fbrStep);
		map.put("fbrLevel", fbrLevel);
		map.put("fbrParent", fbrParent);
		map.put("fbrNum", fbrNum);

		result = fbService.insertReCommentAjax(map);

		if(result>0) {
			response.getWriter().print(true); 
		} else {
			response.getWriter().print(false);
		}


		
		
	}
	
}
