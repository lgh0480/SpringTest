package com.geon.web.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geon.web.common.domain.Criteria;
import com.geon.web.employee.domain.EmployeeVO;
import com.geon.web.employee.mapper.EmployeeMapper;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired EmployeeMapper employeeMapper;
	
	@Override
	public List<EmployeeVO> employeeList(Criteria cri) {
		// TODO Auto-generated method stub
		return employeeMapper.employeeList(cri);
	}

	@Override
	public EmployeeVO employeeOneSelect(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.employeeOneSelect(vo);
	}

	@Override
	public int employeeInsert(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.employeeInsert(vo);
	}

	@Override
	public int employeeDelete(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.employeeDelete(vo);
	}

	@Override
	public int employeeUpdate(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.employeeUpdate(vo);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return employeeMapper.getTotalCount(cri);
	}

}
