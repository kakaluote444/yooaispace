package com.yooai.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.dao.PictureMapper;
import com.yooai.dao.SayMapper;
import com.yooai.dao.SayTypeMapper;
import com.yooai.dto.PageData;
import com.yooai.dto.SayCommentDTO;
import com.yooai.dto.TypeSayDTO;
import com.yooai.modal.Picture;
import com.yooai.modal.Say;
import com.yooai.modal.SayTypeKey;

@Service
public class SayService {
		@Autowired
		private SayMapper sayDao;
		
		@Autowired
		private SayTypeMapper sayTypeDao;
		
		@Autowired
		private PictureMapper pictureDao;
		
		/**
		 * 查询说说的全部信息（用户信息，说说信息，分类信息，评论信息）
		 * @param pageNo 页码
		 * @param pageSize 页码大小
		 * @param userName 用户名
		 * @param typeName 说说类型
		 * @param sayContent 说说内容
		 * @return
		 */
		public PageData<SayCommentDTO> querySayCommentDTOByPage(int userId,int pageNo,int pageSize,String userName,String sayContent){
			int total = sayDao.getAllCount();
			int beginIndex =pageSize*pageNo;
			List<SayCommentDTO> pageData = sayDao.selectUserAndSayByPage(userId,beginIndex, pageSize, userName, sayContent);
			PageData<SayCommentDTO> data = new PageData<SayCommentDTO>(pageData, pageNo, pageSize, total);
			return data;
		}
		
		/**
		 * 查询个人的所有的说说（按分页查询）
		 * @param userId
		 * @param pageNo
		 * @param pageSize
		 * @param userName
		 * @param sayContent
		 * @return
		 */
		public PageData<SayCommentDTO> queryOneUserByPageSay(int userId,int pageNo,int pageSize,String userName,String sayContent){
			int total = sayDao.getAllCount();
			int beginIndex =pageSize*pageNo;
			List<SayCommentDTO> pageData = sayDao.selectOneUserSay(userId,beginIndex, pageSize, userName, sayContent);
			PageData<SayCommentDTO> data = new PageData<SayCommentDTO>(pageData, pageNo, pageSize, total);
			return data;
		}
		
		public SayCommentDTO selectUserSayDetail(int sayId){
			return sayDao.selectUserSayDetail(sayId);
		}
		
		/**
		 * 说说按照条件查询
		 * @param pageNo
		 * @param pageSize
		 * @param userName
		 * @param typeName
		 * @param sayContent
		 * @return
		 */
		public PageData<SayCommentDTO> queryByCondition(int pageNo,int pageSize,String userName,String typeName,String sayContent){
			int total = sayDao.getAllCount();
			int beginIndex =pageSize*pageNo;
			List<SayCommentDTO> pageData = sayDao.selectSayByPage(beginIndex, pageSize, userName, typeName, sayContent);
			PageData<SayCommentDTO> data = new PageData<SayCommentDTO>(pageData, pageNo, pageSize, total);
			return data;
		}
		/**
		 * 根据说说id查询说说的所有评论
		 * @param sayId
		 * @param pageNo
		 * @param pageSize
		 * @param userName
		 * @param typeName
		 * @param sayContent
		 * @return
		 */
		public SayCommentDTO querySayCommentDTOBySayIdByPage(int sayId){
			return sayDao.selectCommentBySayPrimaryKey(sayId);
		}
		
		
		/**
		 * 通过分类id 查询说说信息
		 * @param typId
		 * @return
		 */
		public PageData<TypeSayDTO>  getSaySayByTypeId(int userId,int typeId,int pageNo,int pageSize){
			int beginIndex =pageSize*pageNo;
			List<TypeSayDTO> data = sayDao.selectSayByTypeId(userId,typeId, beginIndex, pageSize);
			int total = sayDao.getCountUnderTypeId(typeId);
			PageData<TypeSayDTO> pageData = new PageData<TypeSayDTO>(data, pageNo, pageSize, total);
			return pageData;
		}
		
		/**
		 * 把个人发表的说说进行保存
		 * @param types
		 * @param sayContent
		 * @param userId
		 */
		@Transactional
		public void sendSaySay(Say say,List<Integer> types,List<String>picUrls){
			//1.插入说说(之前say没有sayId)
			sayDao.insertSelective(say);
			//2.插入关联表say_type(之后say有sayId)
			for (Integer typeId : types) {
				SayTypeKey sayTypeKey = new SayTypeKey(say.getSayId(),typeId);
				sayTypeDao.insertSelective(sayTypeKey);
			}
			//3.插入说说相册表
			if(picUrls!=null){
				for (String picUrl : picUrls) {
					Picture pictrue = new Picture(say.getSayId(),picUrl);
					pictureDao.insertSelective(pictrue);
				}
			}
		}
		/**
		 * 设置置顶说说
		 * @param userId
		 * @param sayId
		 */
		@Transactional
		public boolean setTopSay(int userId,int sayId){
			int result1 = sayDao.setTopSay(userId, sayId);
			int result2= sayDao.updateOtherSayTop(userId, sayId);
			return (result1>0)&&(result2>0);
		}
		
		public boolean cancelTopSay(int userId,int sayId){
			int result = sayDao.cancelTopSay(userId, sayId);
			return result>0;
		}
		
		public SayCommentDTO getTopSay(int userId){
			return sayDao.selectTopSay(userId);
		}
		
		public int getSayLovers(int userId){
			return sayDao.selectSayLovers(userId);
		}
		
		public int deleteSay(int userId,int sayId){
			return sayDao.deleteSayByUserId(userId, sayId);
		}
}
