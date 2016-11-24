package com.yooai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.CollectionMapper;
import com.yooai.modal.CollectionKey;

@Service
public class CollectionService {
	@Autowired
	private CollectionMapper collectionDao;
	
	
	public int makeCollection(int collectorId,int sayId){
		CollectionKey collect = new CollectionKey(collectorId, sayId);
		int result=0;
		try {
			result = collectionDao.insertSelective(collect);
		} catch (Exception e) {//重复收藏，则取消收藏
			result = collectionDao.deleteByPrimaryKey(collect);
			//e.printStackTrace();
		}
		return result;
	}
	
	public int selectCollectRecord(int collectorId,int sayId){
			return collectionDao.selectCollectRecord(new CollectionKey(collectorId,sayId));
	}
}
