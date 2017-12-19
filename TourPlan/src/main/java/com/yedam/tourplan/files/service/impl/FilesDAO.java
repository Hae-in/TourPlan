package com.yedam.tourplan.files.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.files.service.FilesVO;

@Repository
public class FilesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(FilesVO place) {
		return mybatis.insert("FilesDAO.insert", place);
	}
	
	public int update(FilesVO place) {
		return mybatis.update("FilesDAO.update", place);
	}
	
	public int delete(FilesVO place) {
		return mybatis.delete("FilesDAO.delete", place);
	}	
	
	public FilesVO select(FilesVO place) {
		return mybatis.selectOne("FilesDAO.select", place);
	}	

	public List<FilesVO> selectAll(FilesVO place) {
		return mybatis.selectList("FilesDAO.selectAll", place);
	}	
}
