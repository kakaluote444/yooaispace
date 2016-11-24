function addPrivateWindowScrollEvent(userId){
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var docHeight = $(document).height();
		var windowHeight = document.body.clientHeight ;
		if (scrollTop + windowHeight == docHeight) {
				console.log("当前页码==="+curNo);
				loadPrivateSaySay(userId,curNo);
				curNo++;
		}
	});
}

var fistCome=true;
var breakFlag1=true;
var breakFlag2=true;
//加载个人说说
function loadPrivateSaySay(userId,pageNo){
	$.ajax({
		type : "get",
		url : "user/"+userId+"/saies/all/"+pageNo,
		data : {},
		success : function(data) {
			if(data.data.length>0){
				fistCome = false;
			}
			if(data.data.length==0&&fistCome&&breakFlag1){
				$(".sayBox").append("<h3>主人很懒什么也没 留下</h3>");
				breakFlag1 = false;
			}
			if(data.data.length==0&&fistCome == false&&breakFlag2){
				$(".sayBox").append("<h3>没有更多数据了</h3>");
				breakFlag2 = false;
			}
			
			
			for(var i=0;i<data.data.length;i++){
				$(".sayBox").append(""+
						"<div class='media say'>"+
						"<div class='media-left'>"+
						"<div class='media-object'>"+
						"<img src='"+data.data[i].userMsgDTO.headIcon+"' style='height: 80px; width: 80px;' class='img-circle'>"+
						"</div>"+
						"</div>"+
						"<div class='media-body'>"+
						"	<span class='media-heading lead'>"+data.data[i].userMsgDTO.userName+"</span><span class='media-heading lead'> "+fromatTime(data.data[i].sayMsgDTO.saySendTime,"yyyy-MM-dd HH:mm:ss")+"</span>"+
						"<div class='well'>"+
						"	<p class='row' id='tag"+data.data[i].sayId+"'>"+
						"<small class='pull-right'><span class='glyphicon glyphicon-eye-open' style='margin-left:30px'></span>浏览量 "+data.data[i].sayMsgDTO.sayViews+"</small>"+
						"	</p>"+
						"	<p class='row'>"+
						""+data.data[i].sayMsgDTO.sayContent+""+
						"	</p>"+
						"	<div id='sayPicBox"+data.data[i].sayId+"'></div>"+
						"	<div class='row'> "+
						"	</div>"+
						"	</div>"+
						"<div class='commentBox' id='commentBox"+data.data[i].sayId+"'>"+
						"	<div class='optionBox row'>"+
						"		<div class='btn btn-default'><span class='glyphicon glyphicon-thumbs-up tool'></span>"+data.data[i].sayMsgDTO.sayLovers+"</div>"+
						"		<div class='btn btn-default'><span class='glyphicon glyphicon-star-empty tool'>收藏</span></div>"+
						"		<div class='btn btn-default'><span class='glyphicon glyphicon-info-sign tool'>举报</span></div>"+
						"		<div class='btn btn-default'><span class='glyphicon glyphicon-trash tool'>删除</span></div>"+
						"		<div class='btn btn-default'><span class='glyphicon glyphicon-pushpin tool'>置顶</span></div>"+
						"		<div class='btn btn-default'><span class='glyphicon glyphicon-pushpin tool'>查看详情</span></div>"+
						"	</div>"+
						"<div id='commentsDiv"+data.data[i].sayId+"'></div>"+
						"	<textarea rows='2' cols='105' placeholder='对"+data.data[i].userMsgDTO.userName+"的评论：' style='resize: none; margin-top: 5px;'></textarea>"+
						"	<div class='btn btn-default' style='margin-bottom: 35px;'><span class='glyphicon glyphicon-hand-left'></span>发送</div>"+
						"</div>"+
						"</div>"+
						"</div>"
				);
				loadTagName(data.data[i].sayId);//加载标签
				loadSayComments(data.data[i].sayId);//加载评论
				loadSayPictures(data.data[i].sayId);//加载说说照片
			}
		}
	});
}
