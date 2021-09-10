package com.geon.web.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
}
