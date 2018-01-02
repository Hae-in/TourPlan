package com.yedam.tourplan.member.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;
import com.yedam.tourplan.plan.service.PlanVO;

@Controller
@RequestMapping("/memberAjax/")
public class MemberAjaxController {

	@Autowired
	MemberService memberService;
	@Autowired
	FilesService filesService;
	
	//아이디 중복체크
	@RequestMapping("memberIdCheck")
	@ResponseBody
	public boolean memberIdCheck(MemberSearchVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO m_vo = memberService.select(vo);
		if (m_vo == null) {
			return true;//사용가능 1
		} else {
			return false;//사용불가 0
		}
	}
	
	//닉네임 중복체크
	@RequestMapping("nicknameCheck")
	@ResponseBody
	public boolean nicknameCheck(MemberSearchVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO m_vo = memberService.select(vo);
		if (m_vo == null) {
			return true;//사용가능 1
		} else {
			return false;//사용불가 0
		}
	}
	
	//로그인 체크
	@RequestMapping("select")
	@ResponseBody
	public HashMap<String, Object> select(MemberSearchVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO m_vo = memberService.select(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (m_vo != null) {
			session.setAttribute("memberid", m_vo.getId());
			session.setAttribute("membernum", m_vo.getMembernum());
			session.setAttribute("nickname", m_vo.getNickname());
			session.setAttribute("state", m_vo.getState());
		
			map.put("result", true);
			map.put("nickname",  m_vo.getNickname());
			
		} else {
			map.put("result", false);
		}
		return map;
	}
	
	
	
	@RequestMapping("logout")
	@ResponseBody
	public boolean logout(MemberSearchVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.removeAttribute("memberid");
		session.removeAttribute("membernum");
		session.removeAttribute("nickname");
		session.removeAttribute("state");
		return true;
	}
	
	@RequestMapping("insert")//jsp에서 폼에서 입력받은 것을 파라미터 형태로 전송, 이 파라미터가 MemberVO필드 명과 동일하므로 MemberVO에 담긴다(자동으로 변환)
	@ResponseBody//아작스로 받아온 것을 제이슨 형태로 변환해줌
	public boolean insert(MemberVO vo) {
		return memberService.insert(vo); 
	}

	@RequestMapping("update")
	@ResponseBody
	public boolean update(MemberVO vo) {
		return memberService.update(vo); 
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public boolean delete(MemberVO vo) {
		return memberService.delete(vo); 
	}
	
	// 이미지 등록
	@RequestMapping(value = "insertImage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insert(MemberVO vo, HttpSession session, HttpServletRequest request,
		HttpServletResponse response) throws IllegalStateException, IOException {
			
		// 첨부파일
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> uploadFiles = multipartRequest.getFiles("uploadFile");
				
		Map<String, String> map = new HashMap<String, String>();

		String UPLOAD_LOCATION = request.getSession().getServletContext().getRealPath("/resources/images/");
		if (uploadFiles != null) {
			for (int i = 0; i < uploadFiles.size(); i++) {
			MultipartFile uploadFile = uploadFiles.get(i);
			if (!uploadFile.isEmpty() && uploadFile.getSize() > 0) {
					String realFileName = System.currentTimeMillis() + uploadFile.getOriginalFilename();
					uploadFile.transferTo(new File(UPLOAD_LOCATION, realFileName));

					FilesVO fileVo = new FilesVO();

					if(vo.getNickname() == null) {
						fileVo.setTablename("member");
						fileVo.setTablenum(vo.getMembernum());
						fileVo.setFilename(uploadFile.getOriginalFilename());
						fileVo.setRealfilename(realFileName);
						fileVo.setFilesize(Long.toString(uploadFile.getSize()));
						filesService.insert(fileVo);
					} else {
						fileVo.setRealfilename(realFileName);
						fileVo.setTablename("member");
						fileVo.setTablenum(vo.getMembernum());
						filesService.updateName(fileVo);
					}
						
						map.put("code", "success");
						map.put("imageName", realFileName);
					}
				}
			}

		return map;
	}
	
	@RequestMapping("passwordInit.do")
	@ResponseBody
	public boolean passwordInit(MemberSearchVO vo) {
		System.out.println(getRandomPassword(10));
		vo.setPassword(getRandomPassword(10));
		return memberService.update(vo);
	}
	
	public String getRandomPassword(int len ) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
									  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
									  'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
									  'U', 'V', 'W', 'X', 'Y', 'Z', 
									  '!', '@', '#', '$', '%', '^', '&', '*' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		
		System.out.println("charSet.length :::: "+charSet.length);
		
		for (int i=0; i<len; i++) {
			idx= (int) (charSet.length * Math.random()); //44 * 생성된 난수를  Int로 추출(소수점 제거)
			System.out.println("idx :::: "+idx);
			sb.append(charSet[idx]);
		}

		return sb.toString();
	}
	
	@RequestMapping("selectAll.do")
	@ResponseBody
	public List<MemberVO> selectAll(MemberSearchVO vo) {
		return memberService.selectAll(vo);
	}
	
	@RequestMapping("adminUpdate.do")
	@ResponseBody
	public void adminUpdate(MemberVO vo, HttpServletRequest request) {
		String oper = request.getParameter("oper");
		if(oper.equals("edit")) {
			memberService.update(vo);			
		} else if(oper.equals("add")) {
			memberService.insert(vo);
		} else if(oper.equals("del")) {
			vo.setMembernum(request.getParameter("id"));
			memberService.delete(vo);
		}
	}	
}
