package com.yedam.app.board.service;

import java.util.List;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardService {
		//CRUD
	
		//등록 
		public int insert(BoardVO vo);
		
		//수정
		public int update(BoardVO vo);
		
		//삭제
		public int delete(BoardVO vo);
		
		//단건조회
		public BoardVO read(BoardVO vo);
		
		//전체조회
		public List<BoardVO> boardList(Criteria cri);
		
		//전체데이터 건수
		public int getTotalCount(Criteria cri);
		
		//단건조회
		public BoardAttachVO attacRead(String uuid);
}
