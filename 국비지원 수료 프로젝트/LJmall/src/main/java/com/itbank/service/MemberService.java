package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.common.LoginUtil;
import com.itbank.dao.MemberDAO;
import com.itbank.dao.MemberRequest;
import com.itbank.dao.MemberVO;

@Service
public class MemberService { // 회원 dao와 연동
	@Autowired
	private MemberDAO dao;

	public List<MemberVO> getMemberList() {
		return dao.selectMemberAll();
	}

	public MemberVO getMemberById(String userid) {
		return dao.selectMember(userid);
	}

	public int joinMember(MemberRequest memberRequest) throws Exception { 
		if (memberRequest.isSamePassword() == false) // MemberRequest로 비밀번호 확인 제대로 입력했나 확인 후(잘못 했으면 -1 반환)
			return -1;

		String encode_password = LoginUtil.encryptPassword(memberRequest.getUserid(), memberRequest.getUserpw()); // 비밀번호 sha512로 변경

		MemberVO vo = new MemberVO();
		vo.setUserid(memberRequest.getUserid());
		vo.setUsername(memberRequest.getUsername());
		vo.setUserpw(encode_password);
		vo.setAddress(memberRequest.getAddress());
		vo.setEmail(memberRequest.getEmail());
		vo.setGender(memberRequest.getGender());
		vo.setPhone(memberRequest.getPhone());
		vo.setBirth(memberRequest.getBirth());

		return dao.joinMember(vo);
	}

	public int modifyMember(MemberRequest joinRequest) throws Exception {
		if (joinRequest.isSamePassword() == false) // MemberRequest로 비밀번호 확인 제대로 입력했나 확인 후(잘못 했으면 -1 반환)
			return -1;
		
		String encode_password = LoginUtil.encryptPassword(joinRequest.getUserid(), joinRequest.getUserpw()); // 비밀번호 sha512로 변경
		
		joinRequest.setUserpw(encode_password);
		
		dao.modifyMember(joinRequest);
		
		
		return 1;
	}

	public void deleteMember(String userid) {
		dao.deleteMember(userid);
	}

	// 관리자를 제외한 회원 수 받기
	public int getCountMember(String type, String search) {

		if (type == null || type.equals("")) {
			return dao.getCountMember();
//			검색을 하지 않으면 관리자를 제외한 모든 회원 수
		} else {
			Map<String, String> map = new HashMap<String, String>();

			map.put("type", type);
			map.put("search", search);
//			검색을 했을 경우 해당하는 회원 수
			return dao.getCountMember(map);
		}

	}

	// 관리자를 제외한 페이지당 해당하는 멤버리스트를 받아고기(단, 검색을 하게되면 검색된 회원 리스트가 나오게 함)
	public List<MemberVO> selectMember(int start, int end, String type, String search) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start + "");
		map.put("end", end + "");
//		페이징 기본값으로 페이지에 해당하는 시작 점 과 끝 점을 넣어준다

		if (type == null || type.equals("")) {
			return dao.selectMember1(map);
//		검색을 하지 않았을 경우 모든 제품에 해당하는 vo를 받는다

		} else {
			map.put("type", type);
			map.put("search", search);
		}

		return dao.selectMember(map);
//		검색을 했을 경우(검색에 해당하는 상품을 vo로 받아서 list를 만든다)
	}

	public MemberVO userIdCheck(String userid) {
		return dao.selectMember(userid);
	}
}