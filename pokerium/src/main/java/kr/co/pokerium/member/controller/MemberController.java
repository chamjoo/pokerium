package kr.co.pokerium.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	
	@RequestMapping(value="/member/loginPage.do", method = RequestMethod.GET)
	public String loginPage() {
		return "member/loginPage";
		
	}
	
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request,
					MemberInfo member) 
	{
		
		MemberInfo m = mService.selectLoginMember(member);
		
		
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			return "redirect:/";
			
		} else {
			return "/member/loginFail"; 
		}
		
	}
	
	
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
			mav.addObject("msg", "회원 가입이 완료되었습니다.");
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "회원 가입 실패하였습니다. 지속적인 문제 발생 시 관리자에게 문의해주세요.");
			mav.addObject("location", "/member/joinPage.do");
		}
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	
}
