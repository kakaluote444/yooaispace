//加载某条说说详情
function loadSayDetail(userId,sayId){
	$.ajax({
		type : "get",
		url : "saydetail",
		data : {
			"sayId":sayId
		},
		success : function(data) {
				$(".sayBox").append(""+
						"<div class='media' id='say"+data.sayId+"'>"+
						"<div class='media-left'>"+
						"<div class='media-object'>"+
						"<img src='"+data.userMsgDTO.headIcon+"' style='height: 80px; width: 80px;' class='img-circle'>"+
						"</div>"+
						"</div>"+
						"<div class='media-body'>"+
						"	<span class='media-heading lead' id='hostName"+data.sayId+"'>"+data.userMsgDTO.userName+"</span><span class='media-heading lead'> "+fromatTime(data.sayMsgDTO.saySendTime,"yyyy-MM-dd HH:mm:ss")+"</span>"+
						"<div class='well'>"+
						"	<p class='row' id='tag"+data.sayId+"'>"+
						"<small class='pull-right'><span class='glyphicon glyphicon-eye-open' style='margin-left:30px'></span>浏览量 "+data.sayMsgDTO.sayViews+"</small>"+
						"	</p>"+
						"	<p class='row'>"+
						""+data.sayMsgDTO.sayContent+""+
						"	</p>"+
						"	<div id='sayPicBox"+data.sayId+"'></div>"+
						"	<div class='row'> "+
						"	</div>"+
						"	</div>"+
						"<div class='commentBox' id='commentBox"+data.sayId+"'>"+
						"	<div class='optionBox row'>"+
						"		<div class='btn btn-default'  id='"+data.sayId+"'  onclick='agreeEvent("+userId+","+data.sayId+");' ><span  class='glyphicon glyphicon-thumbs-up tool agreeBtn'></span><span   id='agree"+data.sayId+"'>"+data.sayMsgDTO.sayLovers+"</span></div>"+
						"		<div class='btn btn-default' onclick='collectEvent("+userId+","+data.sayId+")'><span class='glyphicon glyphicon-star-empty tool' id='collect"+data.sayId+"'>收藏</span></div>"+
						"		<div class='btn btn-default'  data-toggle='collapse' href='#collapseExample"+data.sayId+"' ><span class='glyphicon glyphicon-info-sign tool'>举报</span></div>"+
						"		<div class='btn btn-default' onclick='deleteEvent("+userId+","+data.sayId+")'><span class='glyphicon glyphicon-trash tool'>删除</span></div>"+
						"		<div class='btn btn-default' onclick='setTopSayEvent("+userId+","+data.sayId+")'><span class='glyphicon glyphicon-pushpin tool'>置顶</span></div>"+
						"		<a href='detail?userId="+userId+"&sayId="+data.sayId+"' target='_blank'><div class='btn btn-default' onclick='detailSayEvent("+data.sayId+")'><span class='glyphicon glyphicon-pushpin tool'>查看详情</span></div></a>"+
						"	</div>"+
						"	<div class='collapse' id='collapseExample"+data.sayId+"'>"+
						"		<div class ='well'>"+
						"<textarea placeholder='填写举报内容' id='reportContent"+data.sayId+"' cols='100' rows='2' ></textarea><span id='reportBtn' class='btn btn-default' style='margin-bottom:31px' onclick='reportEvent("+userId+","+data.userMsgDTO.userId+","+data.sayId+")'>举报</span>"+
						"		</div>"+
						"	</div>"+
						"<div id='commentsDiv"+data.sayId+"'></div>"+
						"	<textarea id='commentArea"+data.sayId+"' rows='2' cols='105' placeholder='对"+data.userMsgDTO.userName+"的评论：' style='resize: none; margin-top: 5px;'></textarea>"+
						"	<div class='btn btn-default' style='margin-bottom: 35px;' onclick='commentEvent("+data.sayId+","+userId+","+data.userMsgDTO.userId+")'><span class='glyphicon glyphicon-hand-left'></span>发送</div>"+
						"</div>"+
						"</div>"+
						"</div>"
				);
				loadTagName(data.sayId);//加载标签
				loadSayComments(data.sayId);//加载评论
				loadSayPictures(data.sayId);//加载说说照片
		}
	});

}
