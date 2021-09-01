package com.geon.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.geon.app.impl.EmpMapper;

import lombok.extern.java.Log;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping("/main")
	public String main() { //이름 값이 넘어가서 스프링
 		return "main";
	}
	@RequestMapping("/login")
	public String login(Member member) { //Member member만 하면 값 다감
		log.info(member.toString()); //error 나면 출력 error>info>warn>debug>traca(제일 상세하게 나옴)
		return "redirect:/"; // 다시 홈으로 가게 해줌 
	}
	@Autowired EmpMapper dao;
	
	@RequestMapping("/dept")
	public String dept(Model model) {
		model.addAttribute("list", dao.getDept());
		return "dept";
		}
}
