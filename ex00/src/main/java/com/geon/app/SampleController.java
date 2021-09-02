package com.geon.app;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.java.Log;

// pojo : 상속 받을 필요없음
@Controller     //->  @Component 상속해서 @Controller, @Service, @Repository(마이바티스가 인터페이스 받아서 자동으로 구현해줌!)
@RequestMapping("/sample/*")
@Log
public class SampleController {
	
	@RequestMapping("/ex09")
	@ResponseBody
	public SampleVO ex09(SampleVO sample) {
		//SampleVO sample = new SampleVO();
		sample.setName("이건희");
		sample.setAge(29);
		//http://localhost/sample/ex07
		return sample ;
	}
	
	@RequestMapping("/ex06/{name}/{age}")
	public void ex06(@PathVariable String name,
					 @PathVariable int age) {
		//http://localhost/sample/ex06/chichi/20  
		log.info("name= "+name);
		log.info("age" + age);
	}
	
	@RequestMapping("/ex05")
	public void ex05(SampleVoList list) {
		log.info(list.toString());
	}
	@RequestMapping("/ex04")
	public void ex04(@RequestParam List<String> ids) {
		//String[] ids = request.getParameterValues("ids");
		log.info(ids.toString());
		
	}
	
	@RequestMapping("/ex03")
	public void ex03(@RequestParam String[] ids) {
		//String[] ids = request.getParameterValues("ids");
		log.info(Arrays.toString(ids));
		
	}
	//이름이 같다면 생략 다르면 name ="paramname"적어주면 됨.
	@GetMapping("/ex02")
	public void ex02(@RequestParam(name = "username") String name,
					 @RequestParam(required = false, defaultValue = "10") int age
												) { //
		//Stirng name = request.getParameter("username"); 
		log.info("name="+name + " age=" + age);
	}
	
	@GetMapping("/ex01")
	public String ex01(@ModelAttribute("sam") SampleVO vo, 
								Model model) { //dtd = vo = do 같은 말 임
		log.info(vo.toString());
		//model.addAttribute("sampleVO", vo);
		model.addAttribute("sam", "10");
		return "sample/ex01";
		// http://localhost/sample/ex01?name=geonhui&age=29&dueDate=2020-10-10
	}
	
	//@RequestMapping(value ="/a", method = RequestMethod.POST )
	@GetMapping("/a") //spring 4 부터는 이것이 추가가 되었음
	public String basic1( ) {
		log.info("basic1......a");
		return "sample/basica"; //Jsp 뷰페이지 리턴
	}
	
	@RequestMapping("/b")
	public void basic2( ) { //리턴 타입이 void 인 경우 URL과 일치하는 뷰페이지로 Forword함
		log.info("basic2......b");
	}
}
