package com.yedam.tourplan.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	FilesService filesService;

	@RequestMapping("selectAll.do")
	public String selectAll(MemberSearchVO vo, Model model) {
		model.addAttribute("list", memberService.selectAll(vo));
		return "member/test";
	}
	
	@RequestMapping("select.do")
	public String Mypage(MemberSearchVO vo, Model model, HttpSession session) {
		String mem_num = (String) session.getAttribute("membernum");
		
		FilesVO f_vo = new FilesVO();
		f_vo.setTablename("member");
		f_vo.setTablenum(mem_num);
		model.addAttribute("m_picture", filesService.selectAll(f_vo));
		
		vo.setMembernum(mem_num);
		model.addAttribute("member", memberService.select(vo));
		return "member/myPage/myPage";
	}
	
	@RequestMapping("needLogin.do")
	public String needLogin() {
		return "main/needLogin";
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
