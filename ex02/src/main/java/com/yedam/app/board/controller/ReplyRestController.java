package com.yedam.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.service.ReplyService;


@RestController
@RequestMapping("/reply/*") 
public class ReplyRestController {
	
	@Autowired ReplyService replyService;
	@GetMapping("/")
	//해당 게시글 댓글만 조회
	public List<ReplyVO> replyList(Criteria cri, @RequestParam Long bno){
		
		return replyService.replyList(cri, bno);
	}
	//댓글조회
	@GetMapping("/{rno}")
	public ReplyVO replyRead(@PathVariable Long rno, ReplyVO vo) {
		vo.setRno(rno);
		return replyService.replyRead(vo);
	}
	//등록
	@PostMapping("/") // post, get : 파라미터가 질의문자열(query String ) -> ?id=1000&pw=111&name=lee
	public ReplyVO replyInsert(ReplyVO vo) {
		replyService.replyInsert(vo);
			return replyService.replyRead(vo);
		}
	//수정
	@PutMapping("/") // put, delete : 파마리터 json -> { id:1000, pw:"111", name:"lee" } 
	public ReplyVO replyUpdate(@RequestBody ReplyVO vo) {
		replyService.replyUpdate(vo);
			return vo;
		}
	//삭제
	@DeleteMapping("/{rno}")
	public boolean replyDelete(@PathVariable Long rno, ReplyVO vo) {
		vo.setRno(rno);
		int r= replyService.replyDelete(vo);
		return  r ==1 ? true : false;
		}
}
