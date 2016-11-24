package jxufe.liuburu.junit;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yooai.dao.TypeMapper;
import com.yooai.modal.Type;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class TestTypeMapper {
	@Autowired
	private TypeMapper typeDao;
	
	@Test
	public void testSelectType(){
		List<Type> types = typeDao.selectAll();
		for (Type type : types) {
			System.out.println(type);
		}
	}
	@Test
	public void testSelectTypeName(){
		List<String> typeNames = typeDao.selectTypeNameBySayId(1);
		for (String string : typeNames) {
			System.out.println(string);
		}
	}
}
