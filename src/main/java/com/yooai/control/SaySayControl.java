package com.yooai.control;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.dto.PageData;
import com.yooai.dto.SayCommentDTO;
import com.yooai.dto.TypeSayDTO;
import com.yooai.service.SayService;

@Controller
public class SaySayControl {
	private static final int  pageSize = 3;//分页显示，每页显示的大小
	@Autowired
	private SayService sayService;
	
	/**
	 * 查询所有说说的内容
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("index/{userId}/saies/all/{pageNo}")
	@ResponseBody
	public PageData<SayCommentDTO> getSaiesDataByPage(@PathVariable("userId")Integer userId,@PathVariable("pageNo")Integer pageNo){
		return sayService.querySayCommentDTOByPage(userId,pageNo, pageSize, null, null);
	}
	/**
	 * 查询所有说说的内容
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("user/{userId}/saies/all/{pageNo}")
	@ResponseBody
	public PageData<SayCommentDTO> getOneUserAllSayByPageSay(@PathVariable("userId")Integer userId,@PathVariable("pageNo")Integer pageNo){
		return sayService.queryOneUserByPageSay(userId, pageNo, pageSize, null, null);
	}
	
	
	/**
	 * 查询所有 “用户名” 的说说信息
	 * @param pageNo
	 * @param userName
	 * @return
	 */
	@RequestMapping("index/{userId}/saies/{pageNo}/byName/{userName}")
	@ResponseBody
	public PageData<SayCommentDTO> getSaiesDataByName(@PathVariable("userId")Integer userId,@PathVariable("pageNo")int pageNo,@PathVariable("userName")String userName){
		return sayService.querySayCommentDTOByPage(userId,pageNo, pageSize, userName,null);
	}
	/**
	 * 查询所有按照 “说说内容” 的说说信息
	 * @param pageNo
	 * @param sayContent
	 * @return
	 */
	@RequestMapping("index/{userId}/saies/{pageNo}/byContent/{sayContent}")
	@ResponseBody
	public PageData<SayCommentDTO> getSaiesDataByContent(@PathVariable("userId")Integer userId,@PathVariable("pageNo")int pageNo,@PathVariable("sayContent")String sayContent){
		return sayService.querySayCommentDTOByPage(userId,pageNo, pageSize, null, sayContent);
	}
	
	@RequestMapping("index/{userId}/saies/{pageNo}/byTypeId/{typeId}")
	@ResponseBody
	public PageData<TypeSayDTO> getSaySayOnderTypeId(@PathVariable("userId")Integer userId,@PathVariable("pageNo")int pageNo,@PathVariable("typeId")int typeId){
		return sayService.getSaySayByTypeId(userId,typeId, pageNo, pageSize);
	}
	
	/**
	 * 按照说说id查询该id下的所有评论
	 * @param sayId
	 * @return
	 */
	@RequestMapping("index/say/{sayId}/comments")
	@ResponseBody
	public SayCommentDTO querySayComments(@PathVariable("sayId")int sayId){
		return sayService.querySayCommentDTOBySayIdByPage(sayId);
	}
	
}
