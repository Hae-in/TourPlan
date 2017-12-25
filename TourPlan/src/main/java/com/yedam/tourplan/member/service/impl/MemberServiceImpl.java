package com.yedam.tourplan.member.service.impl;//실질적 기능

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;


@Service 

public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> selectAll(MemberSearchVO vo) {
		return memberDAO.selectAll(vo);
	}
	
	@Override
	public List<MemberVO> selectShare(Map<String, String> map) {
		return memberDAO.selectShare(map);
	}

	@Override
	public MemberVO select(MemberSearchVO vo) {
		return memberDAO.select(vo);
	}
	
	@Override
	public boolean insert(MemberVO vo) {
		int r=memberDAO.insert(vo);
		if(r>0) {
			return true;//성공
		}
		else {
			return false;
		}
	}

	@Override
	public boolean update(MemberVO vo) {
		int r=memberDAO.update(vo);
		if(r>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean delete(MemberVO vo) {
		int r=memberDAO.delete(vo);
		if(r>0) {
			return true;
		}
		else {
			return false;
		}
	}

}
// sp(view) controller가 호출되면 service 호출, service에서 dao호출하여 db랑 연동(mapper이용해서) 출력은 역순