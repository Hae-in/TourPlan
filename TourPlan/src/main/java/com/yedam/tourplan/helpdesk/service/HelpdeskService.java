package com.yedam.tourplan.helpdesk.service;

import java.util.List;

public interface HelpdeskService {
	public boolean insert(HelpdeskVO vo);
	public int update(HelpdeskVO vo);
	public int delete(HelpdeskVO vo);
	public HelpdeskVO select(HelpdeskVO vo);
	public List<HelpdeskVO> selectAll(HelpdeskSearchVO vo);
	

}
