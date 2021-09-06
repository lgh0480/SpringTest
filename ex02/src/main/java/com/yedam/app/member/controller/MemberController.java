package com.yedam.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.app.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired MemberService memberService;
	
	// 조회는 GET 등록,수정 = POST
	//전체조회
	@GetMapping("/memberList")
	public void memberList(Model model) {
		model.addAttribute("memberList", memberService.memberList());
	}
}
