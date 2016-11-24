package com.yooai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.AgreeMapper;
import com.yooai.modal.AgreeKey;

@Service
public class AgreeService {
		@Autowired
		private AgreeMapper agreeDao;
		
		public int makeAgree(int userId,int sayId){
			AgreeKey agree = new AgreeKey(sayId,userId);
			int result = 0;
			try {
				result = agreeDao.insertSelective(agree);
			} catch (Exception e) {
				result = agreeDao.deleteByPrimaryKey(agree);
			}
			return result;
		}
}
