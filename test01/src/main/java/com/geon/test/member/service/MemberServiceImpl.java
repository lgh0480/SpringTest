package com.geon.test.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geon.test.member.domain.MemberVO;
import com.geon.test.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return memberMapper.memberList();
	}

	@Override
	public MemberVO memberOneSelect() {
		// TODO Auto-generated method stub
		return memberMapper.memberOneSelect();
	}

	@Override
	public int memberInsert() {
		// TODO Auto-generated method stub
		return memberMapper.memberInsert();
	}

	@Override
	public int memberDelete() {
		// TODO Auto-generated method stub
		return memberMapper.memberDelete();
	}

	@Override
	public int memberUpdate() {
		// TODO Auto-generated method stub
		return memberMapper.memberUpdate();
	}

}
