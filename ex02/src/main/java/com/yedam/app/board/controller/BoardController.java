package com.yedam.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired BoardService boardService;
	
	// 조회는 GET 등록,수정 = POST
	//전체조회
	@GetMapping("/list") //list 
	public void list(Model model) {
		model.addAttribute("list",boardService.boardList());
	}
	//한건조회(수정페이지)
	@GetMapping("/get")
	public void get(Model model, BoardVO board) { //bno 파라미터 -> 커맨드 객체
		model.addAttribute("board", boardService.read(board));
	}
	
	
	//수정처리
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		int r = boardService.update(vo);
		if(r == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list"; //파라미터 전달 X 
	}

	//등록페이지
	@GetMapping("/register")
	public void registerForm() {
		
	}
	//등록처리
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		boardService.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list"; //파라미터 전달 X 
	}
	//삭제처리 
	@PostMapping("/delete")
	public String delete(BoardVO vo, RedirectAttributes rttr) {
		int r = boardService.delete(vo);
		if(r == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list"; //파라미터 전달 X 
	}

}
