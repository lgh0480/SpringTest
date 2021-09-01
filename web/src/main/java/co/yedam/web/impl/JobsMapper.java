package co.yedam.web.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository //DAO를 불러온다
public interface JobsMapper {
	List<Map> getJobs();
}
