package com.geon.app.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository //DAO 
public interface EmpMapper {
	List<Map> getEmp();
	List<Map> getDept();
}
