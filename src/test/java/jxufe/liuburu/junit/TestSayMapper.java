package jxufe.liuburu.junit;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.yooai.dao.SayMapper;
import com.yooai.dto.PageData;
import com.yooai.dto.SayCommentDTO;
import com.yooai.dto.TypeSayDTO;
import com.yooai.modal.Say;
import com.yooai.service.SayService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class TestSayMapper {
	@Autowired
	private SayService sayService;
	@Autowired
	private SayMapper sayDao;
	
	@Test
	public void testSelectSayCommentsById(){
		SayCommentDTO say = sayDao.selectCommentBySayPrimaryKey(1);
		System.out.println(say);
	}
	@Test
	public void testselectSayByPage(){
		List<SayCommentDTO> saies = sayDao.selectSayByPage(0, 5,null,null,null);
		for (SayCommentDTO sayCommentDTO : saies) {
			System.err.println(sayCommentDTO+"\n");
		}
	}
	@Test
	public void testServiceSelectByPage(){
		PageData<SayCommentDTO>pageData =  sayService.querySayCommentDTOByPage(1,0, 20, null, "小明");
		System.err.println(pageData+"\n");
		System.out.println(JSON.toJSONString(pageData));
		System.err.println(pageData.getPageSize()+"\n");
		System.err.println(pageData.getData().size()+"\n");
	}
	@Test
	public void testselectByPrimaryKey(){
		Say say= sayDao.selectByPrimaryKey(1);
		System.out.println(say);
	}
	@Test
	public void selectUserAndSayByPage(){
		List<SayCommentDTO> say= sayDao.selectUserAndSayByPage(6,0,10,null,null);
		System.out.println(JSON.toJSONString(say));
	}
	@Test
	public void selectOneUserSay(){
		List<SayCommentDTO> say= sayDao.selectOneUserSay(1, null, null, null, null);
		System.out.println(JSON.toJSONString(say));
	}
	@Test
	public void selectUserSayDetail(){
//		SayCommentDTO say= sayDao.selectUserSayDetail(1,1);
//		System.out.println(JSON.toJSONString(say));
	}
	
	@Test
	public void testquerySayByTypeId(){
		List<TypeSayDTO> selectSayByTypeId = sayDao.selectSayByTypeId(2,4,0,3);
		String json = JSON.toJSONString(selectSayByTypeId);
		System.out.println(json);
	}
	
	@Test
	public void testGetCountByTypID(){
		int count = sayDao.getCountUnderTypeId(4);
		System.out.println("count=="+count);
	}
	
	@Test
	public void testSendSay(){
		Say say = new Say();
		say.setSayContent("你好世界");
		say.setSaySendtime(new Date());
		say.setUserId(1);
		int result = sayDao.insertSelective(say);
		System.out.println("结果:"+result);
		
		List<Integer> types = new ArrayList<Integer>();
	}
	
	@Test
	public void testSendSaySay(){
		Say say = new Say();
		say.setUserId(1);
		say.setSayContent("你好世界");
		say.setSaySendtime(new Date());
		List<Integer> types = new ArrayList<Integer>();
		types.add(3);
		types.add(4);
		types.add(5);
		List<String> picUrls = new ArrayList<String>();
		picUrls.add("img1.jpg");
		picUrls.add("img2.jpg");
		picUrls.add("img3.jpg");
		sayService.sendSaySay(say, types,picUrls);
		System.out.println(say);
	}
	
	@Test
	public void testInsertSelective(){
		Say record = new Say();
		record.setUserId(2);
		record.setSayContent("测试说说");
		sayDao.insertSelective(record);
	}
	
	@Test
	public void testUpdataTopSay(){
		Say record = sayDao.selectByPrimaryKey(32);
		record.setSayId(32);
		record.setTop(1);
		sayDao.updateByPrimaryKeySelective(record);
	}
	
	@Test
	public void updateOtherTopSay(){
		//设置置顶
//		sayDao.setTopSay(1, 12);
//		sayDao.updateOtherSayTop(1, 12);
//		
		//查询置顶
//		SayCommentDTO say = sayDao.selectTopSay(1);
//		System.out.println(say);
		//sayService.setTopSay(1, 2);
		SayCommentDTO topSay = sayService.getTopSay(1);
		System.out.println(topSay);
	}
	
	@Test
	public void testDeleteSay(){
		sayDao.deleteSayByUserId(1, 37);
	}
	
}
