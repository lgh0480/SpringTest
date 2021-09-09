package com.yedam.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardAttachMapper;
import com.yedam.app.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardMapper;
	@Autowired BoardAttachMapper attachMapper;
	
	@Override
	public int insert(BoardVO vo) {
		// TODO 등록
		 boardMapper.insert(vo); //bno
		 //첨부파일 등록
		 if(vo.getAttachList() == null) {
			 return 1;
		 }
		for(BoardAttachVO attach :vo.getAttachList()) {
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		}
		return 1;
	}

	@Override
	public int update(BoardVO vo) {
		// TODO 수정
		return boardMapper.update(vo);
	}

	@Override
	public int delete(BoardVO vo) {
		// TODO 삭제
		return boardMapper.delete(vo);
	}

	@Override
	public BoardVO read(BoardVO vo) {
		// TODO 단건 조회
		vo = boardMapper.read(vo);
		
		//첨부파일 조회
		vo.setAttachList(attachMapper.findByBno(vo.getBno()) );
		return vo;
	}

	@Override
	public List<BoardVO> boardList(Criteria cri) {
		// TODO 전체 조회
		return boardMapper.boardList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO 전체 데이터 건수
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public BoardAttachVO attacRead(String uuid) {
		// TODO 
		return attachMapper.read(uuid);
	}

}
