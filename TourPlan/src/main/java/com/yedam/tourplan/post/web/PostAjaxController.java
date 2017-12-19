package com.yedam.tourplan.post.web;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostService;
import com.yedam.tourplan.post.service.PostVO;

@Controller
@SessionAttributes("post")
@RequestMapping("/postAjax/")
public class PostAjaxController {
	
	@Autowired
	PostService postService;
	@Autowired
	FilesService filesService;
	
	@RequestMapping("selectPost")
	@ResponseBody
	public List<PostVO> postView(PostVO vo) {
		return postService.selectPost(vo);
	}
	
	@RequestMapping("insert")
	@ResponseBody
	public boolean insert(PostVO vo) {
		return postService.insert(vo);
	}
	
	// 이미지 등록
	@RequestMapping(value = "insertImage.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insert(PostVO vo, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException, IOException {
			
		// 첨부파일
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> uploadFiles = multipartRequest.getFiles("uploadFile");
			
		Map<String, String> map = new HashMap<String, String>();

		String UPLOAD_LOCATION = request.getSession().getServletContext().getRealPath("/resources/images/");
		System.out.println(UPLOAD_LOCATION);
		if (uploadFiles != null) {
			for (int i = 0; i < uploadFiles.size(); i++) {
			MultipartFile uploadFile = uploadFiles.get(i);
			if (!uploadFile.isEmpty() && uploadFile.getSize() > 0) {
				System.out.println("파일명 : " + uploadFile.getOriginalFilename());
				System.out.println("파일크기 : " + uploadFile.getSize());
					String realFileName = System.currentTimeMillis() + uploadFile.getOriginalFilename();
					uploadFile.transferTo(new File(UPLOAD_LOCATION, realFileName));

					// FileVO에 업로드한 파일명과 파일크기 등을 저장
					FilesVO fileVo = new FilesVO();
					fileVo.setTablename("post");
					fileVo.setTablenum(vo.getPlantablenum());
					fileVo.setFilename(uploadFile.getOriginalFilename());
					fileVo.setRealfilename(realFileName);
					fileVo.setFilesize(Long.toString(uploadFile.getSize()));
					filesService.insert(fileVo);

					map.put("code", "success");
					map.put("imageName", realFileName);
				}
			}
		}

		return map;
		}
}
