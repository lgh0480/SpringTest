package com.geon.web;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class PasswordTest {
	
	@Test
	public void encodingTest() {
		// Create an encoder with strength 16
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4); //값BCryptPasswordEncoder(16) <시간을 지연 시킴
		String result = encoder.encode("1234");
		String result2 = encoder.encode("1234");
		log.info(result);
		log.info(result2);
		assertTrue(encoder.matches("1234", result)); //2개를 비교해주는 메서드임
		assertTrue(encoder.matches("1234", result2)); //2개를 비교해주는 메서드임
	}
}
