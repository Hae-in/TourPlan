package com.yedam.tourplan.member.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;
@Controller
@RequestMapping("/member/")

public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping("selectAll.do")
	public String selectAll(MemberSearchVO vo, Model model) {
		model.addAttribute("list", memberService.selectAll(vo));
		return "member/test";
	}
	
	@RequestMapping("insert.do")//jsp에서 폼에서 입력받은 것을 파라미터 형태로 전송, 이 파라미터가 MemberVO필드 명과 동일하므로 MemberVO에 담긴다(자동으로 변환)
	public String insert(MemberVO vo, Model model) {
		memberService.insert(vo); 
		return "member/test";
	}
	
	
	
	
	
	/*//로그인
		@RequestMapping(value="/login.do", 
		                method = RequestMethod.POST )
		public String login(
				 MemberVO member,
				 Model model,
				 HttpSession session) {

			MemberVO result = memberService.login(member);
			
			if ( result != null ) {
				
				memberService.updateLastConnection(result); //마지막 접속시간 저장
				
				if ( result.getMember_state().equals("0")){
					session.setAttribute("login", result);	
					return "redirect:/goAdminMain.do";  	
				}else if( result.getMember_state().equals("1") ){
					return "member/memberBeforeJoin";
				}else if( result.getMember_state().equals("3") ){
					model.addAttribute("member",result);
					return "redirect:member/memberRejectJoin.do";
				}else if( result.getMember_state().equals("6") ){
					model.addAttribute("msg","회원님께서는신고횟수초과로인해영구블럭되었음을알려드립니다."); 
					model.addAttribute("url", "/"); 
					return "/popup/alert";
				}
				
				
				session.setAttribute("login", result);

				return "redirect:/?language="+result.getMember_country();
				
			} else {

				model.addAttribute("msg", "로그인실패"); 
				model.addAttribute("url", "/"); 
				
				return "/popup/alert";
			}
		}
		
		@RequestMapping(value="/loginOK.do")
			public String loginOK(HttpSession session) {
				return "login";
			}

		//로그아웃
		@RequestMapping("/logout.do")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}	

	}*/
}
