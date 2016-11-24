package com.yooai.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.dto.SayCommentDTO;
import com.yooai.modal.Comment;
import com.yooai.modal.Say;
import com.yooai.service.AgreeService;
import com.yooai.service.CollectionService;
import com.yooai.service.CommentService;
import com.yooai.service.ReportService;
import com.yooai.service.SayService;
/**
 * 包含有评论√，点赞√，收藏√，置顶，举报，查看详情√ 功能的控制
 * @author asusasus
 *
 */
@Controller
public class CommentControl {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private CollectionService collectionService;
	
	@Autowired
	private SayService sayService;
	
	@Autowired
	private AgreeService agreeService;
	
	@Autowired
	private ReportService reportService;
	/**
	 * 发表评论和回复
	 * @param commenterId
	 * @param commenteredId
	 * @param commentContent
	 * @return ture表示：评论成功  false表示评论失败
	 */
	@RequestMapping(value="comments",method=RequestMethod.POST)
	@ResponseBody
	public String makeComment(
			@RequestParam(value="sayId",required=true) Integer sayId,
			@RequestParam(value="commenterId",required=true) Integer commenterId,
			@RequestParam(value="commenteredId",required=true) Integer commenteredId, 
			@RequestParam(value="commentContent",required=true) String commentContent) {
		Comment comment = new Comment();
		comment.setSayId(sayId);
		comment.setCommenterId(commenterId);
		comment.setCommenteredId(commenteredId);
		comment.setCommentConent(commentContent);
		int result = commentService.addComment(comment );
		if(result>0){
			return "true";
		}else{
			return "false";
		}
	}
	/**
	 * 收藏说说，返回是否收藏过信息
	 * @param collectorId
	 * @param sayId
	 * @return
	 */
	@RequestMapping(value="collect",method=RequestMethod.POST)
	@ResponseBody
	public String makeCollection(
			@RequestParam(value="collectorId",required=true)Integer collectorId,
			@RequestParam(value="sayId",required=true) Integer sayId){
		collectionService.makeCollection(collectorId, sayId);
		int result = collectionService.selectCollectRecord(collectorId, sayId);
		return result>0?"true":"false";
	}
	/**
	 * 
	 * @param userId
	 * @param sayId
	 * @return 返回说说当前的点赞个数
	 */
	@RequestMapping(value="agree",method=RequestMethod.POST)
	@ResponseBody
	public String makeAgreeResult(
			@RequestParam(value="userId",required=true)Integer userId,
			@RequestParam(value="sayId",required=true) Integer sayId){
		int result = agreeService.makeAgree(userId,sayId);
		int sayLovers = sayService.getSayLovers(sayId);
		return sayLovers+"";
	}
	/**
	 * 设置置顶说说
	 * @param userId
	 * @param sayId
	 * @return 设置是否成功
	 */
	@RequestMapping(value="topsay",method=RequestMethod.POST)
	@ResponseBody
	public String setTopSay(
			@RequestParam(value="userId",required=true)Integer userId,
			@RequestParam(value="sayId",required=true) Integer sayId){
		boolean result = sayService.setTopSay(userId, sayId);
		return result?"true":"false";
	}
	/**
	 * 设置置顶说说
	 * @param userId
	 * @param sayId
	 * @return 设置是否成功
	 */
	@RequestMapping(value="topsay",method=RequestMethod.GET)
	@ResponseBody
	public SayCommentDTO getTopSay(@RequestParam(value="userId",required=true) Integer userId){
		SayCommentDTO topSay = sayService.getTopSay(userId);
		return topSay;
	}
	/**
	 * 取消置顶说说
	 * @param userId
	 * @param sayId
	 * @return 设置是否成功
	 */
	@RequestMapping(value="topsay/cancel",method=RequestMethod.POST)
	@ResponseBody
	public String cancelTopSayHandler(
			@RequestParam(value="userId",required=true)Integer userId,
			@RequestParam(value="sayId",required=true)Integer sayId){
		boolean result = sayService.cancelTopSay(userId, sayId);
		return result+"";
	}
	
	
	
	@RequestMapping(value="saydetail",method=RequestMethod.GET)
	@ResponseBody
	public SayCommentDTO querySaySayDetail(
			@RequestParam(value="sayId",required=true)Integer sayId){
		return  sayService.selectUserSayDetail( sayId);
	}
	
	/**
	 * 举报控制
	 * @param userId
	 * @param sayId
	 * @return 返回举报状态（是否举报成功）
	 */
	@RequestMapping(value="report",method=RequestMethod.POST)
	@ResponseBody
	public String sayReportHandle(
			@RequestParam(value="accuserId",required=true)Integer accuserId,
			@RequestParam(value="defendantId",required=true)Integer defendantId,
			@RequestParam(value="sayId",required=true)Integer sayId,
			@RequestParam(value="reportContent",required=true)String reportContent){
		String reportStatus=null;
		try {
			reportStatus = reportService.makeSayReport(accuserId, defendantId, sayId, reportContent)>0?"true":"false";
		} catch (Exception e) {
			reportStatus = "repeat";
			return  reportStatus;
		}
		return  reportStatus;
	}
	
	
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public String deleteUserSaySay(
			@RequestParam(value="userId",required=true)Integer userId,
			@RequestParam(value="sayId",required=true)Integer sayId){
		int result = sayService.deleteSay(userId, sayId);
		return result>0?"true":"false";
	}
	
}
