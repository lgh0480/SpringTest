package com.yedam.app.member.service;

import java.util.List;

import com.yedam.app.member.domain.MemberVO;

public interface MemberService {
	
	//회원 전체 조회
	public List<MemberVO> memberList();
	
	//회원 단건 조회
	public MemberVO memberOneSelect(MemberVO vo);
	
	//회원 추가
	public int memberInsert(MemberVO vo);
	
	//회원 삭제
	public int memberDelete(MemberVO vo);
	
	//회원 수정 
	public int memberUpdate(MemberVO vo);
}
