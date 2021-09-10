package com.geon.web.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geon.web.employee.domain.DepartmentsVO;
import com.geon.web.employee.mapper.DepartmentsMapper;
@Service
public class DepartmentServiceImpl implements DepartmentsService {
	@Autowired DepartmentsMapper departmentsMapper;
	@Override
	public List<DepartmentsVO> getDeptList() {
		// TODO Auto-generated method stub
		return departmentsMapper.getDeptList();
	}

	

}
