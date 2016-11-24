package com.yooai.dao;

import java.util.List;

import com.yooai.modal.Type;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(Type record);
    
    int insertSelective(Type record);

	/**
	 * 通过说说的sayId查询说说的标签
	 * @param sayId
	 * @return
	 */
	List<String> selectTypeNameBySayId(int sayId);
	
    Type selectByPrimaryKey(Integer typeId);
    
    List<Type> selectAll();

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);
}