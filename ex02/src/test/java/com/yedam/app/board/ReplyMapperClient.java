package com.yedam.app.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.ReplyMapper;
import com.yedam.app.board.service.ReplyService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class ReplyMapperClient {

	@Autowired ReplyMapper replyMapper;
	@Autowired ReplyService replyService;
	
	//@Test
	public void replyList() {
		Criteria cri = new Criteria(1,20);
		log.info(replyService.replyList(cri, 524295L).toString());
	}
	
	@Test
	public void replyRead() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(524295);
		
		vo = replyService.replyRead(vo);
		log.info(vo.toString());
	}
}
