package com.yedam.app.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String employeeId;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private Date hireDate;
	private String jobId;
	private int salary;
	private int commissionPct;
	private int managerId;
	private int departmentId;
}
