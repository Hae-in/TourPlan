package com.yedam.tourplan.files.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;

@Service
public class FilesServiceImpl implements FilesService {

	@Autowired
	FilesDAO filesDAO;
	
	@Override
	public boolean insert(FilesVO vo) {
		int r = filesDAO.insert(vo);
		if(r>0) return true;
		else return false;		
	}

	@Override
	public int update(FilesVO vo) {
		return filesDAO.update(vo);
	}

	@Override
	public int updateName(FilesVO vo) {
		return filesDAO.updateName(vo);
	}

	@Override
	public int delete(FilesVO vo) {
		return filesDAO.delete(vo);
	}

	@Override
	public FilesVO select(FilesVO vo) {
		return filesDAO.select(vo);
	}

	@Override
	public List<FilesVO> selectAll(FilesVO vo) {
		return filesDAO.selectAll(vo);
	}

}
