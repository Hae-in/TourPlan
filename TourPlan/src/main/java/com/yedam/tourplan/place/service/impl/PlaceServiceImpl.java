package com.yedam.tourplan.place.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceService;
import com.yedam.tourplan.place.service.PlaceVO;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	PlaceDAO placeDAO;
	
	@Override
	public boolean insert(PlaceVO place) {
		int r = placeDAO.insert(place);
		if(r>0) return true;
		else return false;
	}

	@Override
	public int update(PlaceVO place) {
		return placeDAO.update(place);
	}

	@Override
	public int delete(PlaceVO place) {
		return placeDAO.delete(place);
	}

	@Override
	public PlaceVO select(PlaceVO place) {
		return placeDAO.select(place);
	}

	@Override
	public List<PlaceVO> selectAll(PlaceSearchVO place) {
		return placeDAO.selectAll(place);
	}

	@Override
	public List<PlaceVO> selectPlace(PlaceSearchVO place) {
		return placeDAO.selectPlace(place);
	}

	@Override
	public int selectListTotCnt(PlaceSearchVO place) {
		return placeDAO.selectListTotCnt(place);
	}

	@Override
	public List<PlaceVO> selectAllAdmin(PlaceVO place) {
		return placeDAO.selectAllAdmin(place);
	}

	@Override
	public int updateState(PlaceVO place) {
		return placeDAO.updateState(place);
	}

	@Override
	public List<PlaceVO> selectAllKeyword(PlaceSearchVO place) {
		return placeDAO.selectAllKeyword(place);
	}
	
	
}
