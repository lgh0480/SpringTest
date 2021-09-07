package com.yedam.app.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.member.domain.MemberVO;
import com.yedam.app.member.mapper.MemberMapper;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> memberList(Criteria cri){
		// TODO 전체조회
		return memberMapper.memberList(cri);
	}

	@Override
	public MemberVO memberOneSelect(MemberVO vo) {
		// TODO 회원 한건 조회
		return memberMapper.memberOneSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		// TODO 회원 등록
		return memberMapper.memberInsert(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		// TODO 회원 삭제
		return memberMapper.memberDelete(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO 회원 수정
		return memberMapper.memberUpdate(vo);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return memberMapper.getTotalCount(cri);
	}

	

}
