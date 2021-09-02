package com.geon.app;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geon.app.impl.EmpMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmpMapperClient {

	@Autowired EmpMapper dao;
	@Autowired SqlSessionTemplate mybatis;
	
	@Test
	public void mybatisTest() {
		List<Employees> list = mybatis.selectList("com.geon.app.impl.EmpMapper.getEmp", "50");
		//List<Departments>list = mybatis.selectList("com.geon.app.Departments.EmpMapper.getDept");
		//log.info(list.toString());
		log.info(list.get(1).getJobId()); // jsp ${emp.XXXX}
	}
	
	//@Test
	public void test() {
		log.info(dao.getEmp("10").toString());
	}
	
	public void dept() {
		log.info(dao.getDept().toString());
	}
	@Test
	public void getTime() {
		log.info("time==" + dao.getTime().toString());
	}
}
