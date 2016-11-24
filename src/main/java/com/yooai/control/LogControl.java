package com.yooai.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.dto.PageData;
import com.yooai.modal.Log;
import com.yooai.service.LogService;
@Controller
public class LogControl {
	@Autowired
	private LogService logService;
	
	@RequestMapping(value="log/{userId}",method=RequestMethod.GET)
	@ResponseBody
	public PageData<Log> getLogPageData(
			@PathVariable(value="userId")Integer userId,
			@RequestParam(value="pageNo",required=true)Integer pageNo,
			@RequestParam(value="pageSize",required=false)Integer pageSize){
		if(pageSize==null){
			pageSize = 10;//默认大小
		}
		PageData<Log> pageData = logService.queryLogByPage(userId, pageNo, pageSize);
		return pageData;
	}
	
	
}
