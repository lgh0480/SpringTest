package com.geon.app;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController //AJAX용 @Controller + @ResponseBody 
public class AjaxController {
	//주의 sample 설정 안했으니깐 sample 넣지마라 알겠냐?
	@RequestMapping("/ex07")
	public SampleVO ex07(SampleVO sample) {
		//SampleVO sample = new SampleVO();
		sample.setName("이건희");
		sample.setAge(29);
		//http://localhost/sample/ex07
		return sample ;
	}
	
	@RequestMapping("/ex08")
	public List<SampleVO> ex08() {
		//SampleVO sample = new SampleVO();
		List<SampleVO> list = new ArrayList<>();
		list.add(new SampleVO("choi",10,new Date()));
		list.add(new SampleVO("park",10,new Date()));
		list.add(new SampleVO("lee",10,new Date()));
		
		//http://localhost/sample/ex07
		return list;
	}

}
