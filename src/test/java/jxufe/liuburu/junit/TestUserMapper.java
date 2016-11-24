package jxufe.liuburu.junit;


import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yooai.dao.UserMapper;
import com.yooai.modal.User;
import com.yooai.service.LoginService;
import com.yooai.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class TestUserMapper {
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private UserMapper userDao;
	@Autowired
	private LoginService loginService;
	
	@Test
	public void testDatasource() throws SQLException, InterruptedException {
			System.err.print("数据源--->"+dataSource.getConnection()+"\n");
	}
	
	/**
	 * 注册用户
	 */
	@Test
	public void testInsertUser(){
		User user = new User();
		user.setUserName("whose1");
		user.setUserPassword("1234560");
		user.setUserEmail("1099501218com");
		int result = userDao.insertSelective(user);
		System.out.println("result row="+result+" userId="+user.getUserId());
	}
	
	@Test
	public void testGetAllUser(){
		List<User> users = userDao.selectAll();
		for (User user : users) {
			System.out.println(user);
		}
	}
	@Test
	public void testSelectByName(){
//		User user1 = userDao.selectByUserName("刘卜铷");
//		System.out.println(user1);
//		
//		User user2 = userDao.selectByUserEmail("1099501218@qq.com");
//		System.out.println(user2);
		
	}
	@Test
	public void testDeleteUser(){
		userDao.deleteByPrimaryKey(11);
	}
	
	@Test
	public void testLoginService(){
		User user = new User();
		//user.setUserName("刘卜铷");
		user.setUserEmail("1099501218@qq.com");
		user.setUserPassword("123456");
		String statis = loginService.canLogin(user);
		System.out.println("登陆状态====》"+statis);
	}

	@Test
	public void testGetUserByNameAndEamil(){
		User result = userDao.selectByNameAndEmail("1099501218@qq.com","123456");
//		int result = userDao.selectByNameAndEmail("1099501218@qq.com","123456");
		System.err.println("reuslt="+result+"\n");
	}
	
	@Test
	public void testUpdateSelective(){
		User user = new User();
		user.setUserId(10);
		user.setUserEmail("liuburu@qq.com");
		user.setEmailEable(1);
		userDao.updateByPrimaryKeySelective(user);
	}
	@Autowired
	UserService userService;
	@Test
	public void testSelectByID(){
		User user = userService.getUserInfo(1);
		System.out.println(user);
	}
	@Test
	public void testFuzzyQuery(){
		List<User> users = userDao.selectfuzzyByUserName("刘");
		for (User user : users) {
			System.out.println(user);
		}
	}
	
}
