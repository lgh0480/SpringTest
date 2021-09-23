package com.geon.test.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geon.test.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired MemberService memberService;
	
	@GetMapping("/memberList")
	public String memberList(Model model) {
		model.addAttribute("memberList",memberService.memberList());
		
		return "member/memberList";
	}
}
