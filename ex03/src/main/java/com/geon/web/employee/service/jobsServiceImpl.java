package com.geon.web.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geon.web.employee.domain.JobsVO;
import com.geon.web.employee.mapper.JobsMapper;
@Service
public class jobsServiceImpl implements JobsService {
	@Autowired JobsMapper jobsMapper;
	@Override
	public List<JobsVO> getJobsList() {
		// TODO Auto-generated method stub
		return jobsMapper.getJobsList();
	}

}
