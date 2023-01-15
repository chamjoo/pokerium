package kr.co.pokerium.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.co.pokerium.member.model.service.MemberService;
import kr.co.pokerium.member.model.vo.MemberAddr;
import kr.co.pokerium.member.model.vo.MemberInfo;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping(value="/member/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "member/loginPage";
		
	}
	
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request,
						MemberInfo member, 
						Model model ) 
	{
		
		MemberInfo m = mService.selectLoginMember(member);
		int result = mService.updateLastlogin(member);
		
		if(m!=null && result>0) {
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			return "redirect:/";
			
		} else {
			model.addAttribute("msg", "로그인에 실패하였습니다. 아이디와 패스워드를 확인해주세요.");
			model.addAttribute("location", "/member/loginPage");
			return "common/msg"; 
		}
		
	}
	
	
	@RequestMapping(value="/member/joinPage", method = RequestMethod.GET)
	public String joinPage() {
		return "member/joinPage";
		
	}
	
	@RequestMapping(value="/member/memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoinus(
							MemberInfo m,
							MemberAddr ma,
							HttpServletRequest request,
							ModelAndView mav
			) {
		String miPhone1 =  request.getParameter("miPhone1");
		String miPhone2 =  request.getParameter("miPhone2");
		String miPhone3 =  request.getParameter("miPhone3");
		
		String miPhone = miPhone1+"-"+miPhone2+"-"+miPhone3;
		m.setMiPhone(miPhone);
		ma.setMiId(m.getMiId());
		ma.setMaName(m.getMiName());
		ma.setMaPhone(miPhone);
		System.out.println(ma);
		int result = mService.insertMember(m);
		
		if(result>0) {
			result=mService.insertMemberAddr(ma);
			if(result>0) {
				mav.addObject("msg", "회원 가입이 완료되었습니다.");
				mav.addObject("location", "/");
			}
		} else {
			mav.addObject("msg", "회원 가입 실패하였습니다. 지속적인 문제 발생 시 관리자에게 문의해주세요.");
			mav.addObject("location", "/member/joinPage");
		}
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping(value="/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, @SessionAttribute MemberInfo member) {

		session.invalidate();
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/member/myPage")
	public String myPagePassCheck(
				@SessionAttribute MemberInfo member,
				HttpSession session
			) {

			if(member!=null) {
				
				session.setAttribute("member", member);
				
				return "member/myPage";
				
			} else {
				
				return "member/myPageLoadFail";
				
			}
	}
	
	@RequestMapping(value="/member/memberDrop")
	public String updateMemberDrop(
						HttpServletRequest request,
						Model model,
						@SessionAttribute MemberInfo member,
						HttpSession session
						) {
	
		
		int result = mService.updateMemberDrop(member);
		if(result>0) {
			session.invalidate();
			model.addAttribute("msg", "정상적으로 탈퇴되었습니다.");
			model.addAttribute("location", "/");
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하였습니다. 지속적인 문제 발생시 관리자에게 문의해주세요.");
			model.addAttribute("location", "member/myPage");
		}
		return "common/msg";
		
	}
	
	@RequestMapping(value="/member/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(
							@RequestParam String miNickname,
							@RequestParam String miEmail,
							@RequestParam String miPwd,
							@RequestParam String new_miPwd,
							@RequestParam String miTeam,
							@RequestParam String maZip,
							@RequestParam String maAddr1,
							@RequestParam String maAddr2,
							@SessionAttribute MemberInfo member,
							HttpSession session,
							HttpServletResponse response,
							Model model
			) throws IOException {

		
		int result = 0;
		int checkResult = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("miId", member.getMiId());
		map.put("miEmail", miEmail);
		map.put("miPwd", miPwd);
		map.put("miNickname", miNickname);
		map.put("miTeam", miTeam);
		map.put("maZip", maZip);
		map.put("maAddr1", maAddr1);
		map.put("maAddr2", maAddr2);
		
		if(!miNickname.equals(member.getMiNickname())) {
			
			checkResult = mService.selectNicknamecheck(miNickname);
		}
			
		if(checkResult>0) {
			
			model.addAttribute("msg", "닉네임을 확인해주세요.");
			model.addAttribute("location", "/member/myPage");
			
		} else {
			
			if(new_miPwd == null || new_miPwd == "" || new_miPwd.equals("") ) {
				map.put("new_miPwd", miPwd);
				
				result = mService.updateMember(map);
				
			} else {
				
				map.put("new_miPwd", new_miPwd);
				result = mService.updateMember(map);
				
			}
		
			if(result>0) {
				result = mService.updateMemberAddr(map);
				
				if(result>0) {
					session.invalidate();
					model.addAttribute("msg", "회원정보 수정 성공. 다시 로그인해주세요.");
					model.addAttribute("location", "/");
				} else {
					
					model.addAttribute("msg", "회원정보 수정에 실패하였습니다. 지속적인 문제 발생시 관리자에게 문의해주세요.");
					model.addAttribute("location", "member/myPage");
					
				}
				
			} else {
				
				model.addAttribute("msg", "기존 비밀번호를 다르게 입력하셨습니다. 확인해주세요.");
				model.addAttribute("location", "/member/myPage");
			}
			
		}
		
	return "common/msg";
	
	}
	
	@RequestMapping(value="/member/memberIdCheck", method = RequestMethod.GET)
	public void memberIdCheckAjax(
									@RequestParam String miId,
									HttpServletResponse response
				) throws IOException {
		int result = 1;
		if(miId.length() >= 4) {
			result = mService.selectIdcheck(miId);
		}
		if(result>0) {
			response.getWriter().print(true); 
		} else {
			response.getWriter().print(false);
		}
		
	}
	
	@RequestMapping(value="/member/memberNicknameCheck", method = RequestMethod.GET)
	public void memberNicknameCheckAjax(
									@RequestParam String miNickname,
									@RequestParam String checkMiNickname,
									HttpServletResponse response
				) throws IOException {
		int result = 0;

		if(miNickname.equals(checkMiNickname)) {
			
			response.getWriter().print("equals");

		
		} else {
			
			result = mService.selectNicknamecheck(miNickname);
			
			if(result>0) {
				response.getWriter().print(true); 

			} else {
				response.getWriter().print(false);

			}
		}

	}
	
}
