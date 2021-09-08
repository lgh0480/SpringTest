package com.yedam.app.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired ReplyMapper replyMapper;
	@Autowired BoardMapper boardMapper;
	
	@Override
	public ReplyPageVO replyList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		ReplyPageVO vo = new ReplyPageVO();
		vo.setReplyCnt(replyMapper.getCountByBno(bno));
		vo.setList(replyMapper.replyList(cri, bno));
		return vo;
	}

	@Override
	public ReplyVO replyRead(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.replyRead(vo);
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		// TODO 입력
		boardMapper.updateReplycnt(vo.getBno(), 1L);
		return replyMapper.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(ReplyVO vo) {
		// TODO Auto-generated method stub
		boardMapper.updateReplycnt(vo.getBno(), -1L);
		return replyMapper.replyDelete(vo);
	}

}
