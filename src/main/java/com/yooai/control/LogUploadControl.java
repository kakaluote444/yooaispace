package com.yooai.control;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.modal.Log;
import com.yooai.service.LogService;

@Controller
public class LogUploadControl {
	@Autowired
	private LogService logService;
	

	/**
	 * 更新日志和发表日志
	 * @param userId
	 * @param logTitle
	 * @param logContent
	 * @return
	 */
	@RequestMapping(value="uploadimage",method=RequestMethod.POST)
	public String handlerLogAction(
			@RequestParam(value="logId",required=false) Integer logId,
			@RequestParam(value="userId",required=false)Integer userId,
			@RequestParam(value="logTitle",required=true)String logTitle,
			@RequestParam(value="logContent",required=true)String logContent
			){
		
		if(logId==null&&userId!=null){//没有id表示要发表日志    userId,logTitle,logContent
			Log log = new Log();
			log.setUserId(userId);
			log.setLogTitle(logTitle);
			log.setLogContent(logContent);
			log.setLogDatetime(new Date());
			 logService.sendLog(userId, log);
		}else if(logId!=null){//有id表示要修改日志							logId,logTitle,logContent
			Log log = new Log();
			log.setLogId(logId);
			log.setLogTitle(logTitle);
			log.setLogContent(logContent);
			log.setLogDatetime(new Date());
			boolean result = logService.updateLog(log);
		}
		return "rizhi";
	}
	
	/**
	 * 删除日志
	 */
	@RequestMapping(value="deleteLog",method=RequestMethod.POST)
	@ResponseBody
	public String handlerLogDelete(
			@RequestParam(value="logId",required=true)Integer logId
			){
		boolean result = logService.deleteLog(logId);
		return result?"true":"false";
	}
}
