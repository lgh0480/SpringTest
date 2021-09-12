package com.geon.web.employee.service;

import java.util.List;

import com.geon.web.employee.domain.DepartmentsVO;
import com.geon.web.employee.domain.JobsVO;

public interface JobsService {
	public List<JobsVO> getJobsList();
}
