package com.yedam.tourplan.place.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceVO;

@Repository
public class PlaceDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(PlaceVO place) {
		return mybatis.insert("PlaceDAO.insert", place);
	}
	
	public int update(PlaceVO place) {
		return mybatis.update("PlaceDAO.update", place);
	}
	
	public int updateState(PlaceVO place) {
		return mybatis.update("PlaceDAO.updateState", place);
	}
	
	public int delete(PlaceVO place) {
		return mybatis.delete("PlaceDAO.delete", place);
	}	
	
	public PlaceVO select(PlaceVO place) {
		return mybatis.selectOne("PlaceDAO.select", place);
	}	

	public List<PlaceVO> selectAll(PlaceSearchVO place) {
		return mybatis.selectList("PlaceDAO.selectAll", place);
	}
	
	public List<PlaceVO> selectAllAdmin(PlaceVO place) {
		return mybatis.selectList("PlaceDAO.selectAllAdmin", place);
	}		
	
	public List<PlaceVO> selectAllKeyword(PlaceSearchVO place) {
		return mybatis.selectList("PlaceDAO.selectAllKeyword", place);
	}
	
	public List<PlaceVO> selectPlace(PlaceSearchVO place) {
		return mybatis.selectList("PlaceDAO.selectPlace", place);
	}	
	
	public int selectListTotCnt(PlaceSearchVO place) {
		return mybatis.selectOne("PlaceDAO.selectListTotCnt", place);
	}
}
