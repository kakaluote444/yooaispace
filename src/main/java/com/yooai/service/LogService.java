package com.yooai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.LogMapper;
import com.yooai.dto.PageData;
import com.yooai.modal.Log;

@Service
public class LogService {
	@Autowired
	private LogMapper logDao;
	
	/**
	 * 日志的分页查询
	 * @param userId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public PageData<Log> queryLogByPage(int userId,int pageNo,int pageSize){
		int total = logDao.selectAllCount();
		int beginIndex = pageNo*pageSize;
		List<Log> logs = logDao.selectLogByPage(userId, beginIndex, pageSize);
		PageData<Log> pageData = new PageData<Log>(logs, pageNo, pageSize, total);
		return pageData;
	}
	
	/**
	 * 用户发表日志
	 * @param userId
	 * @param log
	 * @return
	 */
	public boolean sendLog(int userId,Log log){
		int result = logDao.insertSelective(log);
		return result>0?true:false;
	}
	/**
	 * 删除日志
	 */
	public boolean deleteLog(int logId){
		int result = logDao.deleteByPrimaryKey(logId);
		return result>0;
	}
	/**
	 *查询日志
	 */
	public Log queryLog(int logId){
		return logDao.selectByPrimaryKey(logId);
	}
	/**
	 * 更新日志
	 */
	public boolean updateLog(Log log){
		int result = logDao.updateByPrimaryKeySelective(log);
		return result>0;
	}
}
