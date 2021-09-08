package com.yedam.app.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component //스트링 컨테이너에 빈 등록하는 어노테이션
//@Aspect

public class LogAdvice {
													//인수가 한개있든 없든 상관 x
	@Pointcut("execution( * com.yedam.app..*ServiceImpl.*(..) )")
	public void allPointCut() {
		
	}
	
	//@Before("execution( * com.yedam.app..*ServiceImpl.*(..) )")
	//public void logBefore() {
		
		//log.info("[Before]===================================");
	//}
	@Before("allPointCut()")
	public void logBefore(JoinPoint jp) {
		log.info("[Before]===================================");
		String methodName = jp.getSignature().getName();
		Object[] arg = jp.getArgs(); //오브젝트 배열 
		String str = methodName +":arg=" +( arg != null && arg.length > 0? arg[0] : "" );
		log.info(str);
	}
	
	@AfterReturning(pointcut = "allPointCut()", returning = "obj")
	public void logAfter(JoinPoint jp, Object obj) {
		log.info("[after]==================================");
		String methodName = jp.getSignature().getName();
		String str = methodName +":return=" + (obj != null? obj : "");
	    log.info(str);
	}
}
