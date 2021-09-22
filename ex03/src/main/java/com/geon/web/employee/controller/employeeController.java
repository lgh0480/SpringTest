package com.geon.web.employee.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.geon.web.common.domain.Criteria;
import com.geon.web.common.domain.PageVO;
import com.geon.web.employee.domain.EmployeeVO;
import com.geon.web.employee.service.DepartmentsService;
import com.geon.web.employee.service.EmployeeService;
import com.geon.web.employee.service.JobsService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/employee/*")
public class employeeController {
	
	@Autowired EmployeeService employeeService;
	@Autowired JobsService jobsService;
	@Autowired DepartmentsService departmentsService;
	
	//전체조회
	@GetMapping("/empList")
	public void employeeList(Model model, Criteria cri) {
		int total = employeeService.getTotalCount(cri);
		log.info("empList: " + cri);
		model.addAttribute("empList", employeeService.employeeList(cri));
		
		
		model.addAttribute("pageMaker", new PageVO(cri, total));	
	}
	
	
		
	@GetMapping("/empSearch")
	public String employeeSearch(Model model,EmployeeVO vo,Criteria cri) {
		cri.setAmount(100);
		model.addAttribute("empList", employeeService.employeeList(cri));
		return "employee/empSearch";
		
		
	}
	@RequestMapping("ajaxEmp")
	@ResponseBody
	public EmployeeVO ajaxEmp(EmployeeVO vo) {
		
		return employeeService.employeeOneSelect(vo);
	}
	/*
	 * @RequestMapping("ajaxEmail")
	 * 
	 * @ResponseBody public EmployeeVO ajaxEmail(EmployeeVO vo,Criteria cri) {
	 * 
	 * return employeeService.employeeList(cri); }
	 */
	
	//등록페이지
	@GetMapping("/empInsertForm")
	public String empInsertForm(EmployeeVO vo, Model model) {
	
			return "employee/empInsertForm";
	}

	/*
	 * //등록
	 * 
	 * @ModelAttribute("jobs") public List<JobsVO> jobs(){ 
	 * return jobsService.getJobsList(); 
	 * }
	 */
	//등록
		@ModelAttribute("jobs")
		public Map<String,Object> jobs(){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("jobs",jobsService.getJobsList());
			map.put("depts",departmentsService.getDeptList());
			return map;
		}
	@PostMapping("/empInsert")
	public String employddInsert(EmployeeVO vo,RedirectAttributes rttr) {
		
		employeeService.employeeInsert(vo);
		rttr.addFlashAttribute("result", vo);
		return "redirect:/employee/empList";
	}
	//수정폼
	@GetMapping("/updateEmp")
		public String updateFormEmp(EmployeeVO vo, Model model,@ModelAttribute("cri") Criteria cri) {
		model.addAttribute("emp", employeeService.employeeOneSelect(vo));
		return "no/employee/empInsertForm";
	}
	//수정
	@PostMapping("updateEmp")
		public String updateEmp(EmployeeVO vo , 
								@ModelAttribute("cri") Criteria cri,
								RedirectAttributes rttr) {
		
		int r = employeeService.employeeUpdate(vo);
		if(r == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:empList";
	}
	//삭제
	@PostMapping("/deleteEmp")
		public String deleteEmp(EmployeeVO vo , 
								@ModelAttribute("cri") Criteria cri,
								RedirectAttributes rttr) {
		int r = employeeService.employeeDelete(vo);
		if(r == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
			
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
		return "redirect:empList";
	}
}
