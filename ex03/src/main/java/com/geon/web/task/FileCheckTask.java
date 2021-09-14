package com.geon.web.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component
@Log
public class FileCheckTask {
		//				초 분 시 월
	@Scheduled(cron = "15,30 * * * *") //10초마다
	public void checkFile() {
		log.info("file check..............");
		log.info("================================");
	}
}
