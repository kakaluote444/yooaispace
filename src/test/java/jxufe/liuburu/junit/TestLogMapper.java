package jxufe.liuburu.junit;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.yooai.dao.LogMapper;
import com.yooai.modal.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class TestLogMapper {
	@Autowired
	private LogMapper logDao;
	@Test
	public void testSelectType(){
		List<Log> logs = logDao.selectLogByPage(1, 0, 10);
		System.out.println(JSON.toJSONString(logs));
	}
	@Test
	public void test(){
	}
	
}
