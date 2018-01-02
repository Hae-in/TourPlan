package com.yedam.tourplan.place.service;

import java.util.List;

public interface PlaceService {
	public boolean insert(PlaceVO place);
	public int update(PlaceVO place);
	public int updateState(PlaceVO place);
	public int delete(PlaceVO place);
	public PlaceVO select(PlaceVO place);
	public List<PlaceVO> selectAll(PlaceSearchVO place);
	public List<PlaceVO> selectAllAdmin(PlaceVO place);
	public List<PlaceVO> selectAllKeyword(PlaceSearchVO place);
	public List<PlaceVO> selectPlace(PlaceSearchVO place);
	public int selectListTotCnt(PlaceSearchVO place);
}
