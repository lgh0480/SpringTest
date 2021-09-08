package com.yedam.app.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.app.sample.mapper.Sample1Mapper;
import com.yedam.app.sample.mapper.Sample2Mapper;

import lombok.extern.java.Log;

@Log
@Service
public class SampleServiceImpl implements SampleService {

	@Autowired Sample1Mapper sample1;
	@Autowired Sample2Mapper sample2;
	
	@Override

	//@Transactional //오토커밋 해제 하고 둘다 조건 맞으면 커밋 안그러면 롤백
	public void addData(String value) {

		sample1.insert(value);
		log.info("sample1 등록");
		
		sample2.insert(value);
		log.info("sample2 등록");
		
	}

}
