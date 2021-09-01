package com.geon.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geon.app.impl.EmpMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class EmpMapperClient {

	@Autowired EmpMapper dao;
	
	@Test
	public void test() {
		log.info(dao.getEmp().toString());
	}
	
	public void dept() {
		log.info(dao.getDept().toString());
	}
}
