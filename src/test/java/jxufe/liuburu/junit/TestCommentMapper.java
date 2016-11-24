package jxufe.liuburu.junit;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.yooai.dao.AgreeMapper;
import com.yooai.dao.CollectionMapper;
import com.yooai.dao.CommentMapper;
import com.yooai.dao.PictureMapper;
import com.yooai.dao.TypeMapper;
import com.yooai.modal.AgreeKey;
import com.yooai.modal.CollectionKey;
import com.yooai.modal.Comment;
import com.yooai.modal.Type;
import com.yooai.service.ReportService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class TestCommentMapper {
	@Autowired
	private CommentMapper comment;
	@Autowired
	private AgreeMapper agreeDao;
	@Autowired 
	private CollectionMapper collectionDao;
	
	@Autowired
	private ReportService reportService;
	
	@Test
	public void testQueryPicURls(){
		Comment record = new Comment();
		record.setSayId(29);
		record.setCommenterId(1);
		record.setCommenteredId(29);
		record.setCommentConent("卜铷也觉得你是最棒的（重复）");
		int result = comment.insertSelective(record);
		System.out.println("result="+result);
	}
	
	/**
	 * 点赞测试
	 */
	@Test
	public void testAgree(){
		AgreeKey agree = new AgreeKey(1,2);
		try {
			int result = agreeDao.insertSelective(agree );
			System.err.println("结果:"+result+"\n");
		} catch (Exception e) {
			System.out.println("异常了");
			agreeDao.deleteByPrimaryKey(agree);
			e.printStackTrace();
		}
	}
	
	/**
	 * 收藏测试
	 */
	@Test
	public void testCollectSayMethod(){
		CollectionKey collection = new CollectionKey();
		//情景：徐佳乐收藏刘卜铷的1号说说
		collection.setCollectorId(2);
		collection.setSayId(1);
		int result = collectionDao.insertSelective(collection );
		System.out.println("result="+result);
	}
	/**
	 * 举报测试
	 */
	@Test
	public void testReportSay(){
		reportService.makeSayReport(1, 1	, 11, "太黄太暴力了");
	}
	/**
	 * 查看收藏
	 */
	@Test
	public void findCollect(){
		CollectionKey collectKey = new CollectionKey(1, 2);
		int result = collectionDao.selectCollectRecord(collectKey );
		System.out.println(result);
	}
}
