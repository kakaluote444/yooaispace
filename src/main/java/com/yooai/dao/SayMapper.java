package com.yooai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yooai.dto.SayCommentDTO;
import com.yooai.dto.TypeSayDTO;
import com.yooai.modal.Say;

public interface SayMapper {
	int deleteByPrimaryKey(Integer sayId);

	int insertSelective(Say record);
	
	int updateByPrimaryKeySelective(Say record);
	
	int deleteSayByUserId(@Param("userId")int userId,@Param("sayId")int sayId);
	
	/*
	 * 查询说说的点赞数目
	 */
	int selectSayLovers(int userId);
	/**
	 * 设置置顶说说
	 * @param userId
	 * @param sayId
	 * @return
	 */
	int setTopSay(@Param("userId")int userId,@Param("sayId")int sayId);
	/**
	 * 取消置顶说说
	 * @param userId
	 * @param sayId
	 * @return
	 */
	int cancelTopSay(@Param("userId")int userId,@Param("sayId")int sayId);
	/**
	 * 更新用户的其他置顶说说
	 * @param userId
	 * @param sayId
	 * @return
	 */
	int updateOtherSayTop(@Param("userId")int userId,@Param("sayId")int sayId);
	
	/**
	 * 查询用户的置顶说说
	 * @param userId
	 * @param sayId
	 * @return
	 */
	SayCommentDTO selectTopSay(@Param("userId")int userId);
	/**
	 * 设置制定后，需要设置其他说说的置顶标志量
	 * @param sayId
	 * @return
	 */

	/**
	 * 获取说说总记录条数
	 * @return
	 */
	int getAllCount();
	
	/**
	 * 通过typeId获取该分类下的说说 
	 * @param typeId
	 * @return
	 */
	int getCountUnderTypeId(int typeId);
	
	
	
	List<TypeSayDTO> selectSayByTypeId(
			@Param("userId")int userId,
			@Param("typeId")int typeId,
			@Param("beginIndex") int beginIndex,
			@Param("pageSize") int pageSize
			);
	
	/**
	 * 只是查询用户信息和说说信息（按分页查询）!important
	 * @param beginIndex
	 * @param pageSize
	 * @param userName
	 * @param typeName
	 * @param sayContent
	 * @return
	 */
	List<SayCommentDTO> selectUserAndSayByPage(
			@Param("userId")int userId,
			@Param("beginIndex") int beginIndex,
			@Param("pageSize") int pageSize,
			@Param("userName") String userName,
			@Param("sayContent") String sayContent);
	
	
	/**
	 * 查询指定用户的所有说说
	 * @param userId
	 * @param beginIndex
	 * @param pageSize
	 * @param userName
	 * @param sayContent
	 * @return
	 */
	List<SayCommentDTO> selectOneUserSay(
			@Param("userId")Integer userId,
			@Param("beginIndex") Integer beginIndex,
			@Param("pageSize") Integer pageSize,
			@Param("userName") String userName,
			@Param("sayContent") String sayContent);
	/**
	 * 查看说说详情
	 * @param userId
	 * @param sayId
	 * @return
	 */
	SayCommentDTO selectUserSayDetail(	
			@Param("sayId") Integer sayId);
	/**
	 * 通过说说的sayId查询说说		!important
	 * @param sayId
	 * @return
	 */
	List<String> selectTypeNameBySayId(int sayId);

	/**
	 * 按说说id查询说说的全部信息（用户信息，说说信息，分类信息，评论信息） !important
	 * @param sayId
	 * @return
	 */
	SayCommentDTO selectCommentBySayPrimaryKey(Integer sayId);

	/**
	 * 按说说id查询说说的全部信息（用户信息，说说信息，分类信息，评论信息）
	 * @param pageNo 页码
	 * @param pageSize 页码大小
	 * @param userName 用户名
	 * @param typeName 说说类型
	 * @param sayContent 说说内容
	 * @return
	 */
	List<SayCommentDTO> selectSayByPage(
			@Param("beginIndex") int beginIndex,
			@Param("pageSize") int pageSize,
			@Param("userName") String userName,
			@Param("typeName") String typeName,
			@Param("sayContent") String sayContent);

	Say selectByPrimaryKey(int sayId);
}