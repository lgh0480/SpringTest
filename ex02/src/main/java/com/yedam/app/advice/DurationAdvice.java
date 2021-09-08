package com.yedam.app.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component
//@Aspect
public class DurationAdvice {
	
	@Around("LogAdvice.allPointCut()") //
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis(); // 현재 시간은 밀리세컨드로 구해주는 놈
		
		Object obj = null;
		
		try {
			
			// 서비스 메서드 호출 하는 부분
			obj =pjp.proceed();
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		log.info("Time===" + (end-start) );
		return obj;
	}
}
