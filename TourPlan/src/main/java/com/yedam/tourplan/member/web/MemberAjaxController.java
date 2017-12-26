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
	
	//셀렉트
	@RequestMapping("select")
	@ResponseBody
	public boolean select(MemberSearchVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO m_vo = memberService.select(vo);
		if (m_vo != null) {
			session.setAttribute("memberid", m_vo.getId());
			session.setAttribute("membernum", m_vo.getMembernum());
			session.setAttribute("nickname", m_vo.getNickname());
			session.setAttribute("state", m_vo.getState());
			return true;
		} else {
			return false;
		}
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
}
