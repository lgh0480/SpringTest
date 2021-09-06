package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {
	
	@Autowired BoardMapper boardMapper;
	
	@Test
	public void boardList() {
		Criteria cri = new Criteria(1, 10);
		cri.setType("L");
		cri.setKeyword("Lee");
		log.info(boardMapper.boardList(cri).toString());
	}
	//@Test
	public void read() {
		BoardVO vo = new BoardVO();
		vo.setBno(5);
		
		vo = boardMapper.read(vo);
		log.info(vo.toString());
	}
	//@Test
	public void insert() {
		//BoardVO 객체 생성하는 이유는 테스트 때문에 Controller에서 VO를 알아서 해주기때문에 할필요 X
		BoardVO vo = new BoardVO();
		vo.setTitle("새로작성하는글");
		vo.setContent("새로운 내용!!");
		vo.setWriter("이건희");
		
		int r = boardMapper.insert(vo);
		assertEquals(r, 1);
		log.info(vo.toString());
		log.info(Long.toString(vo.getBno())); //등록된 번호가 몇번인지 알수 있음.
	}
	//@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(2);
		vo.setTitle("바꿀제목1");
		vo.setContent("바뀐내용");
		vo.setWriter("바꾼사람:이건희");
		
		 int r = boardMapper.update(vo);
		  assertEquals(r, 1);
		  log.info("바뀐 내용 = " +vo.toString());
	
	}
	//@Test
	@Rollback
	public void delete() {
		BoardVO vo = new BoardVO();
		vo.setBno(4);
		int r = boardMapper.delete(vo);
		assertEquals(r, 1);
		
//		log.info(vo.toString());
//		log.info("삭제된 번호="+Long.toString(vo.getBno())); //등록된 번호가 몇번인지 알수 있음.
	}
}
