package com.yedam.app.board.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.app.board.domain.BoardVO;

@RestController
public class AjaxTestcontroller {

	@GetMapping("/ajax1")
	@ResponseBody
	public BoardVO test1(BoardVO vo) {
		vo.setContent("content test");
		return vo;
	}
	
	@PostMapping("/ajax2")
	@ResponseBody
	//json으로 보냄 무조껀 POST로 보내야됨!
	public BoardVO test2(@RequestBody BoardVO vo) {
		vo.setContent("테스트를 해보자");
		return vo;
	}
}
