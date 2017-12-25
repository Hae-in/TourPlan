package com.yedam.tourplan.plan.web;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
import com.yedam.tourplan.likeplan.service.LikeplanService;
import com.yedam.tourplan.likeplan.service.LikeplanVO;
import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.post.service.PostVO;

@Controller
@RequestMapping("/planAjax/")
public class PlanAjaxContorller {
	
	@Autowired
	FilesService filesService;
	@Autowired
	PlanService planService;
	@Autowired
	LikeplanService likeplanService;
	
	//전체조회
	@RequestMapping("selectAll")
	@ResponseBody
	public List<PlanVO> selectAll(PlanSearchVO vo) {
		List<PlanVO> planList = planService.selectAll(vo); 
		return planList;
	}
	
	//plan등록
	@RequestMapping("insert")
	@ResponseBody
	public String insert(PlanVO vo) {
		String image_num = vo.getImagename();
		planService.insert(vo);

		PlanVO seq_vo = planService.selectSeq(null);
		
		//likecount가 0이되면 들어가지 않아 기본값 1을 줌
		LikeplanVO lp_vo = new LikeplanVO();
		lp_vo.setplannum(seq_vo.getPlannum());
		//lp_vo.setplannum(vo.getPlannum());
		lp_vo.setMembernum("1");
		likeplanService.insert(lp_vo);
		
		FilesVO f_vo = new FilesVO();
		f_vo.setTablenum(seq_vo.getPlannum());
		f_vo.setFilenum(image_num);
		filesService.update(f_vo);
		
		return seq_vo.getPlannum();
	}
	
	//plan 수정
	@RequestMapping("update")
	@ResponseBody
	public String update(PlanVO vo) {
		int r = planService.update(vo);
		if(r>0)
			return vo.getPlannum();
		else
			return null;
		
	}
	
	// 이미지 등록
		@RequestMapping(value = "insertImage", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, String> insert(PlanVO vo, HttpSession session, HttpServletRequest request,
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

						if(vo.getPlanname() == null) {
							fileVo.setTablename("plan");
							fileVo.setTablenum(vo.getPlannum());
							fileVo.setFilename(uploadFile.getOriginalFilename());
							fileVo.setRealfilename(realFileName);
							fileVo.setFilesize(Long.toString(uploadFile.getSize()));
							filesService.insert(fileVo);
						} else if(vo.getPlanname().equals("otherUp")) { 
							fileVo.setRealfilename(realFileName);
							fileVo.setTablenum(vo.getPlannum());
							filesService.updateName(fileVo);
						} else {
							fileVo.setRealfilename(realFileName);
							fileVo.setFilenum(vo.getPlannum());
							filesService.updateName(fileVo);
						}
						
						map.put("code", "success");
						map.put("imageNum", fileVo.getFilenum());
						map.put("imageName", realFileName);
					}
				}
			}

			return map;
		}
}
