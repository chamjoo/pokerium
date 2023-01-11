package kr.co.pokerium.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pokerium.member.model.service.MemberService;
import kr.co.pokerium.member.model.vo.MemberInfo;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="/member/joinPage.do", method = RequestMethod.GET)
	public String joinPage() {
		return "member/joinPage";
		
	}
	
	@RequestMapping(value="/member/memberJoin.do", method = RequestMethod.POST)
	public ModelAndView memberJoinus(
							MemberInfo m,
							HttpServletRequest request,
							ModelAndView mav
			) {
		String miPhone1 =  request.getParameter("miPhone1");
		String miPhone2 =  request.getParameter("miPhone2");
		String miPhone3 =  request.getParameter("miPhone3");
		
		String miPhone = miPhone1+"-"+miPhone2+"-"+miPhone3;
		m.setMiPhone(miPhone);

		int result = mService.insertMember(m);
		
		if(result>0) {
			mav.addObject("msg", "회원 가입 성공!! - (환영합니다)");
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "회원 가입 실패!! - 지속적인 문제 발생 시 관리자에게 문의");
			mav.addObject("location", "/member/joinPage.do");
		}
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	
}
