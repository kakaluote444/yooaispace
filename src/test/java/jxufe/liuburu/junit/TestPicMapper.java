package jxufe.liuburu.junit;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yooai.dao.PictureMapper;
import com.yooai.dao.TypeMapper;
import com.yooai.modal.Type;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class TestPicMapper {
	@Autowired
	private PictureMapper pictureDao;
	
	@Test
	public void testQueryPicURls(){
		List<String> picUrls  = pictureDao.selectImgesBySayId(19);
		for (String pic : picUrls) {
			System.out.println(pic);
		}
	}
}
