package com.geon.web.employee.domain;

import lombok.Data;

@Data
public class JobsVO {
	private String jobId;
	private String jobTitle;
	private String minSalary;
	private String maxSalary;
}
