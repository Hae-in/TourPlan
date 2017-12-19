package com.yedam.tourplan.member.service.impl;

import java.util.List;

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
		
		public int insert(MemberVO vo) {
			return mybatis.insert("MemberDAO.insert", vo);//insert는 mybatis에서 정해진 명령어
		}	
		

}
