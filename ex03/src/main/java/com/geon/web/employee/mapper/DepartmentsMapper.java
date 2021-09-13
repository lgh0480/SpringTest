package com.geon.web.employee.mapper;

import java.util.List;

import com.geon.web.employee.domain.DepartmentsVO;

public interface DepartmentsMapper {
	public List<DepartmentsVO> getDeptList(); //전체조회
	
	public DepartmentsVO getOneDept(DepartmentsVO vo); //한건조회
	
	public int deptInsert(DepartmentsVO vo); //부서 생성 
	
	public int deptDelete(DepartmentsVO vo); //부서 삭제
	
	public int deptUpdate(DepartmentsVO vo); //부서 수정
	
}
