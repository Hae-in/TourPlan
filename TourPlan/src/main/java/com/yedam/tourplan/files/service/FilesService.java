package com.yedam.tourplan.files.service;

import java.util.List;

public interface FilesService {
	public boolean insert(FilesVO vo);
	public int update(FilesVO vo);
	public int delete(FilesVO vo);
	public FilesVO select(FilesVO vo);
	public List<FilesVO> selectAll(FilesVO vo);
}
