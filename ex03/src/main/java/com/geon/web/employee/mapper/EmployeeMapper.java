package com.geon.web.employee.mapper;

import java.util.List;

import com.geon.web.common.domain.Criteria;
import com.geon.web.employee.domain.EmployeeVO;

public interface EmployeeMapper {
	//회원 전체 조회
		public List<EmployeeVO> employeeList(Criteria cri);
		
		//회원 단건 조회
		public EmployeeVO employeeOneSelect(EmployeeVO vo);
		
		//회원 추가
		public int employeeInsert(EmployeeVO vo);
		
		//회원 삭제
		public int employeeDelete(EmployeeVO vo);
		
		//회원 수정 
		public int employeeUpdate(EmployeeVO vo);
		
		//전체데이터 건수
		public int getTotalCount(Criteria cri);
	}

