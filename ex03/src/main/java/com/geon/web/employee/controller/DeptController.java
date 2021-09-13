package com.geon.web.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geon.web.employee.domain.DepartmentsVO;
import com.geon.web.employee.service.DepartmentsService;

@Controller
public class DeptController {

	@Autowired DepartmentsService departmentsService;
	
	//부서관리 페이지
	@GetMapping("dept")
	public String dept() {
		return "employee/dept";
	}
	
	//ajax : 목록, 등록, 수정, 삭제 < 전부 아작스 @ResponseBody가 다들어가있어야됨.
	@GetMapping("deptList")
	@ResponseBody
	public List<DepartmentsVO> deptList(){
		
		return departmentsService.getDeptList();
	}
	
	//부서 등록
	@PostMapping("deptInsert")
	@ResponseBody
	public DepartmentsVO deptInsert(@RequestBody DepartmentsVO vo, Model model) {
			departmentsService.deptInsert(vo);
		return vo;
	}
	@GetMapping("deptOndSelect/{deptmentId}")
	@ResponseBody
	public DepartmentsVO oneSelect(@PathVariable String deptmentId, DepartmentsVO vo, Model model) {
		vo.setDepartmentId(deptmentId);
		return departmentsService.getOneDept(vo);
	}
	//부서 수정
	@PutMapping("deptUpdate")
	@ResponseBody
	public DepartmentsVO deptUpdate(@RequestBody DepartmentsVO vo, Model model) {
			departmentsService.deptUpdate(vo);
		return vo;

	}
}
