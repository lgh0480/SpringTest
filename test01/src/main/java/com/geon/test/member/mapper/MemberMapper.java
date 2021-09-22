package com.geon.test.member.mapper;

import java.util.List;

import com.geon.test.member.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> memberList();
	
	public MemberVO memberOneSelect();
	
	public int memberInsert();
	
	public int memberDelete();
	
	public int memberUpdate();
}
