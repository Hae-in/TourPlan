package com.yedam.tourplan.member.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.category.service.CategoryVO;
import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberVO;
@Repository
public class MemberDAO {
	
		
		@Autowired
		private SqlSessionTemplate mybatis;//db 연동하기 위해 mybatis 사용
		
		public List<MemberVO> selectAll(MemberSearchVO vo) {
			return mybatis.selectList("MemberDAO.selectAll", vo);
		}
		
		public List<MemberVO> selectShare(Map<String, String> map) {
			return mybatis.selectList("MemberDAO.selectShare", map);
		}
		
		public MemberVO select(MemberSearchVO vo) {
			return mybatis.selectOne("MemberDAO.select", vo);
		}
		
		public int insert(MemberVO vo) {
			return mybatis.insert("MemberDAO.insert", vo);//insert는 mybatis에서 정해진 명령어
		}	
		
		public int update(MemberVO vo) {
			return mybatis.update("MemberDAO.update", vo);
		}
		
		public int updatePw(MemberVO vo) {
			return mybatis.update("MemberDAO.updatePw", vo);
		}
		
		public int delete(MemberVO vo) {
			return mybatis.delete("MemberDAO.delete", vo);
		}

}
