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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
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
	
	//전체조회
	@RequestMapping("selectAll")
	@ResponseBody
	public List<PlanVO> selectAll(PlanSearchVO vo) {
		List<PlanVO> planList = planService.selectAll(vo); 
		return planList;
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

						// FileVO에 업로드한 파일명과 파일크기 등을 저장
						FilesVO fileVo = new FilesVO();
						fileVo.setTablename("plan");
						fileVo.setTablenum(vo.getPlannum());
						fileVo.setFilename(uploadFile.getOriginalFilename());
						fileVo.setRealfilename(realFileName);
						fileVo.setFilesize(Long.toString(uploadFile.getSize()));
						
						if(vo.getPlanname() == null) {
							filesService.insert(fileVo);
						} else {
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
