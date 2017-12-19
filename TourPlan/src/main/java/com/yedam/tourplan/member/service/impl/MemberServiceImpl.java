package com.yedam.tourplan.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.member.MemberMapper;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;


//@Service("memberService") 
public class MemberServiceImpl implements MemberService{
	
	
	//DAO를 호출하는 부분
	@Autowired
	private MemberMapper MemberDAO;

	@Override
	public void insertMember(MemberVO vo) {
		MemberDAO.insertMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		MemberDAO.updateMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		MemberDAO.deleteMember(vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return MemberDAO.getMember(vo);
	}

	@Override 
	public List<Map<String, Object>> getMemberList() {
		return MemberDAO.getMemberList();
	}
	
	@Override
	public List<Map<String, Object>> getNewMemberList() {
		return MemberDAO.getNewMemberList();
	}
	
	@Override
	public List<Map<String, Object>> getBestMemberList(MemberVO vo) {
		return MemberDAO.getBestMemberList(vo);
	}
	

	@Override
	public List<MemberVO> getMemberListVO(MemberVO vo) {
		return MemberDAO.getMemberListVO(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		//1. id로 단건조회
				MemberVO result = MemberDAO.getMember(vo);
				//2. ID 체크하고 
				if( result != null) {
				//3. 패스워드 검사해서 일치하면 UsersVO
					if( result.getMember_password().equals(vo.getMember_password()) ) {
						return result;
					}
				}
				//4. 아니면 null 리턴
		return null;
	}

	@Override
	public void updateLastConnection(MemberVO vo) {
		MemberDAO.updateLastConnection(vo);
	}

	@Override
	public void updateRejectMember(MemberVO vo) {
		MemberDAO.updateRejectMember(vo);
	}

	@Override
	public void memberProfileUpdate(MemberVO vo) {
		MemberDAO.memberProfileUpdate(vo);
	}

	@Override
	public List<Map<String,Object>> getMemberId() {
		return MemberDAO.getMemberId();
	}



	
	

}
