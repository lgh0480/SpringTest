package com.yedam.app.member;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.member.domain.MemberVO;
import com.yedam.app.member.mapper.MemberMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class MemberMapperClient {

	@Autowired MemberMapper memberMapper;
	
	//@Test
	public void memberList() {
		log.info(memberMapper.memberList().toString());
	}
	//@Test
	public void memberOneSelect() {
		MemberVO vo = new MemberVO();
		vo.setEmployeeId("888");
		vo = memberMapper.memberOneSelect(vo);
		log.info(vo.toString());
	}
	//@Test
	public void memberInsert() {
		MemberVO vo = new MemberVO();
		vo.setFirstName("이");
		vo.setLastName("건희");
		vo.setEmail("lgh0480@samsung.com");
		vo.setPhoneNumber("010654878978");
		vo.setJobId("AD_VP");
		vo.setSalary(123456);
		vo.setManagerId(101);
		vo.setDepartmentId(60);
		
		int r =memberMapper.memberInsert(vo);
		assertEquals(r, 1);
		log.info(vo.toString());
		log.info(vo.getEmployeeId());
	}
	//@Test
	public void memberUpdate() {
		MemberVO vo = new MemberVO();
		vo.setEmployeeId("210");
		vo.setFirstName("이");
		vo.setLastName("준희");
		vo.setEmail("lgh0481@samsung.com");
		vo.setPhoneNumber("0104454878978");
		vo.setJobId("SA_REP");
		vo.setSalary(100002);
		vo.setManagerId(101);
		vo.setDepartmentId(60);
		
		int r =memberMapper.memberUpdate(vo);
		assertEquals(r, 1);
		log.info(vo.toString());
		log.info("바뀐 번호"+vo.getEmployeeId());
	}
	@Test
	public void memberDelete() {
		MemberVO vo = new MemberVO();
		vo.setEmployeeId("210");
		
		int r = memberMapper.memberDelete(vo);
		assertEquals(r, 1);
		log.info(vo.toString());
		log.info("삭제한 번호"+vo.getEmployeeId());
	}
}
