package com.yedam.app.board.service;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.domain.ReplyPageVO;

public interface ReplyService {

	// 댓글 전체 조회
	public ReplyPageVO replyList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	// 댓글 부분 조회
	public ReplyVO replyRead(ReplyVO vo);
	// 댓글 입력
	public int replyInsert(ReplyVO vo);
	// 댓글 수정
	public int replyUpdate(ReplyVO vo);
	// 댓글 삭제
	public int replyDelete(ReplyVO vo);
}
