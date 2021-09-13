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
		// TODO 전체조회
		return departmentsMapper.getDeptList();
	}
	@Override
	public DepartmentsVO getOneDept(DepartmentsVO vo) {
		// TODO 한건조회
		return departmentsMapper.getOneDept(vo);
	}
	@Override
	public int deptInsert(DepartmentsVO vo) {
		// TODO 부서 생성 
		return departmentsMapper.deptInsert(vo);
	}
	@Override
	public int deptDelete(DepartmentsVO vo) {
		// TODO 부서 삭제
		return departmentsMapper.deptDelete(vo);
	}
	@Override
	public int deptUpdate(DepartmentsVO vo) {
		// TODO 부서 수정
		return departmentsMapper.deptUpdate(vo);
	}

	

}
