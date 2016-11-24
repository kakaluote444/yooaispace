package jxufe.liuburu.junit;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.yooai.dao.FriendMapper;
import com.yooai.dto.HoneyFriendDTO;
import com.yooai.modal.User;
import com.yooai.service.UserService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class TestFriendMapper {
	@Autowired
	private FriendMapper friendDao;
	@Autowired
	private UserService userService;
	@Test
	public void testSelectTopFive() {
		List<HoneyFriendDTO> friends = friendDao.selectTopFiveByUserId(1);
		for (HoneyFriendDTO friend : friends) {
			System.out.println(friend);
		}
	}
	
	@Test
	public void testSelectTopFive1() {
		List<HoneyFriendDTO> friends = userService.getTopFiveHoney(1);
		for (HoneyFriendDTO friend : friends) {
			System.out.println(friend);
		}
	}
	
	@Test
	public void testSelectFriendList(){
		List<Integer> friends = friendDao.selectFriendList(1);
		System.out.println(JSON.toJSONString(friends));
	}

}
