package com.itbank.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate template;

	public List<MemberVO> selectMemberAll() { // 모든 회원 목록
		return template.selectList("memberList");
	}

	public MemberVO selectMember(String userid) { // 개별 회원 
		return template.selectOne("memberById", userid);
	}

	public int joinMember(MemberVO vo) throws Exception { // 회원가입
		return template.insert("join", vo);
	}

	public void modifyMember(MemberRequest joinRequest) { // 회원정보 수정
		template.update("modify", joinRequest);
	}

	public void deleteMember(String userid) { // 회원탈퇴시 db는 유지하고 withdrawal update
		template.update("delete", userid);
	}

	// 관리자를 제외한 검색에 해당하는 회원수
	public int getCountMember(Map<String, String> map) {
		return template.selectOne("getCountMember", map);
	}

	// 관리자를 제외한 모든 회원 수
	public int getCountMember() {
		return template.selectOne("getCountMember1");
	}

	// 관리자를 제외한 모든 회원들의 vo를 list로 만듦
	public List<MemberVO> selectMember(Map<String, String> map) {
		return template.selectList("selectMember", map);
	}

	// 관리자를 제외한 모든 회원들의 vo를 list로 만듦
	public List<MemberVO> selectMember1(Map<String, String> map) {
		return template.selectList("selectMember1", map);
	}
}