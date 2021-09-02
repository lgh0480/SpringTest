package com.geon.app.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository //DAO 
public interface EmpMapper {
	List<Map> getEmp(String deptid);
	List<Map> getDept();
	
	@Select("select sysdate from dual")
	public String getTime();
	
}
