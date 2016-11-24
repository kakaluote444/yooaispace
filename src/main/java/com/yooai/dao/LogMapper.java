package com.yooai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yooai.modal.Log;

public interface LogMapper {
    int deleteByPrimaryKey(Integer logId);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKeyWithBLOBs(Log record);

    int updateByPrimaryKey(Log record);
    
    List<Log> selectLogByPage(
    		@Param("userId")int userId,
    		@Param("beginIndex")int beginIndex,
    		@Param("pageSize")int pageSize);
    
    int selectAllCount();
}