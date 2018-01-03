package com.yedam.tourplan.place.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hamcrest.core.IsEqual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.tourplan.category.service.CategoryService;
import com.yedam.tourplan.category.service.CategoryVO;
import com.yedam.tourplan.common.Paging;
import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;
import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceService;
import com.yedam.tourplan.place.service.PlaceVO;

@Controller
@SessionAttributes("place")
@RequestMapping("place/")
public class PlaceController {
	@Autowired PlaceService placeService;
	@Autowired FilesService filesService;
	@Autowired MemberService memberService;
	@Autowired CategoryService categoryService;
	
	//등록&수정 폼
	@RequestMapping(value="form.do", method=RequestMethod.GET)
	public String form(@RequestParam(value="num", required=false) String num, Model model) {
		if(num == null || num == "") {
			model.addAttribute("place", new PlaceVO());
		} else {
			FilesVO files = new FilesVO();
			files.setTablename("place");
			files.setTablenum(num);
			model.addAttribute("files", filesService.selectAll(files));
		}
		return "popup/place/form";
	}	
	
	//등록&수정 처리
	@RequestMapping(value="form.do", method=RequestMethod.POST)
	public String formProcess(PlaceVO vo
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
		) throws IllegalStateException, IOException {
		
		if(request.getParameter("action").equals("insert")) {
			vo.setMembernum((String)session.getAttribute("membernum"));
			placeService.insert(vo);
		} else {
			placeService.update(vo);			
		}

		//첨부파일 삭제
		String[] deleteFiles = request.getParameterValues("deleteFile");
		if(deleteFiles != null) {			
			for(int i=0;i<deleteFiles.length;i++) {		
				FilesVO fileVo = new FilesVO();
				fileVo.setFilenum(deleteFiles[i]);
				filesService.delete(fileVo);
			}			
		}		
		
		//첨부파일 등록
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		List<MultipartFile> uploadFiles = multipartRequest.getFiles("uploadFile");				
		String UPLOAD_LOCATION = request.getSession().getServletContext().getRealPath("/resources/images/");
		
		if(uploadFiles != null) {
			for(int i=0;i<uploadFiles.size();i++) {
				MultipartFile uploadFile = uploadFiles.get(i);
				if(!uploadFile.isEmpty() && uploadFile.getSize() > 0) {
					System.out.println("파일명 : " + uploadFile.getOriginalFilename());
					System.out.println("파일크기 : " + uploadFile.getSize());
					String realFileName = System.currentTimeMillis() + uploadFile.getOriginalFilename();
					uploadFile.transferTo(new File(UPLOAD_LOCATION, realFileName));
					
					//FileVO에 업로드한 파일명과 파일크기 등을 저장
					FilesVO fileVo = new FilesVO();
					fileVo.setTablename("place");
					fileVo.setTablenum(vo.getPlacenum());
					fileVo.setFilename(uploadFile.getOriginalFilename());
					fileVo.setRealfilename(realFileName);
					fileVo.setFilesize(Long.toString(uploadFile.getSize()));
					filesService.insert(fileVo);
				}	
			}
		}				
		
		session.setAttribute("placenum", vo.getPlacenum());	
		return "place/select";
	}	
	
	//삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam(value="num", required=false) String num) {		
		//첨부파일 삭제		
		FilesVO files = new FilesVO();		
		files.setTablename("place");
		files.setTablenum(num);				
		List<FilesVO> files1 = filesService.selectAll(files);
		if(files1 != null) {			
			for(int i=0;i<files1.size();i++) {				
				filesService.delete(files1.get(i));
			}			
		}		
		
		//삭제
		PlaceVO place = new PlaceVO();
		place.setPlacenum(num);
		placeService.delete(place);		
		
		return "forward:selectAll.do";
	}
	
	//단건조회
	@RequestMapping("select.do")
	public ModelAndView select(@RequestParam(value="num", required=false) String num, ModelAndView mv) {
		PlaceVO place = new PlaceVO();
		place.setPlacenum(num);
		PlaceVO placeRs  = placeService.select(place);
		
		MemberSearchVO member = new MemberSearchVO();
		member.setMembernum(placeRs.getMembernum());
		
		CategoryVO category = new CategoryVO();
		category.setCategorynum(placeRs.getCategorynum());

		FilesVO files = new FilesVO();
		files.setTablename("place");
		files.setTablenum(num);
		
		mv.addObject("place", placeRs);
		mv.addObject("placeMember", memberService.select(member));
		mv.addObject("placeCategory", categoryService.select(category));
		mv.addObject("files", filesService.selectAll(files));
		
		//place 같은 도시
		PlaceSearchVO placelist = new PlaceSearchVO();
		placelist.setFirst(1);
		placelist.setLast(4);
		placelist.setSort("likecnt");
		placelist.setCity(placeRs.getCity());
		mv.addObject("placeList", placeService.selectAll(placelist));
		
		mv.setViewName("place/select");
		return mv;
	}
	
	//조회
	@RequestMapping("selectAll.do")
	public String selectAll(PlaceSearchVO vo, Model model, HttpSession session, Paging paging) {
		//전체 건수
		int total = placeService.selectListTotCnt(vo);
		paging.setTotalRecord(total);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());	
		vo.setMembernum((String)session.getAttribute("membernum"));
		model.addAttribute("placeList", placeService.selectAll(vo));
		model.addAttribute("paging", paging);
		return "place/selectAll";
	}	
	
	//마이페이지 > 내가 등록한 명소
	@RequestMapping("selectAllMypage.do")
	public String selectAllMypage(PlaceSearchVO vo, Model model, HttpSession session, Paging paging) {
		//전체 건수
		int total = placeService.selectListTotCnt(vo);
		paging.setTotalRecord(total);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());	
		vo.setMode("mypage");
		vo.setMembernum((String)session.getAttribute("membernum"));
		model.addAttribute("placeList", placeService.selectAll(vo));
		model.addAttribute("paging", paging);
		return "member/myPage/myPlace";
	}	
}
