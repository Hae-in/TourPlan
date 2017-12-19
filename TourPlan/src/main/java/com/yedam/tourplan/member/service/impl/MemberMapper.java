package com.yedam.tourplan.member.service.impl;

	import java.util.List;
	import java.util.Map;

	import org.mybatis.spring.annotation.MapperScan;

import com.yedam.tourplan.member.service.MemberVO;


	@MapperScan
	public interface MemberMapper { 
		public void insertMember(MemberVO vo);
		public void updateMember(MemberVO vo);
		public void memberProfileUpdate(MemberVO vo);
		public void updateRejectMember(MemberVO vo);
		public void updateLastConnection(MemberVO vo);
		public void deleteMember(MemberVO vo);
		public MemberVO getMember(MemberVO vo);
		public List<Map<String,Object>> getNewMemberList();
		public List<Map<String,Object>> getMemberList();
		public List<Map<String,Object>> getBestMemberList(MemberVO vo);
		public List<MemberVO> getMemberListVO(MemberVO vo);
		public List<Map<String,Object>> getMemberId();
		//user-mapper.xml의 내용 확인해서 return값, 클래스 이름 같게하기.
	}

