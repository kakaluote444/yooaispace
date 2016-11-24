package com.yooai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import com.yooai.modal.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);
    
    User selectByUserName(String userName);
    
    
    User selectByUserEmail(String userEmail);
    /**
     * 更具用户名邮箱进行用户查询
     * @param userName
     * @param userEmail
     * @param userPassword
     * @return  返回结果表示是否查询到登陆用户
     */
    User selectByNameAndEmail(@Param("userName")String userName,@Param("userPassword")String userPassword );
    
    /**
     * 根据用户名模糊查询用户信息
     * @param name
     * @return
     */
    List<User> selectfuzzyByUserName(String name);
    
    List<User> selectAll();

    int updateByPrimaryKeySelective(User record);

}