var curNo = 1;//当前页码
var pageUserId = 0;
var pageReplyerId=0;
var pageReplyerName="";

//加载置顶说说
function loadTopSay(userId){
	$.ajax({
		type : "get",
		url : "topsay",
		data : {
			"userId":userId
		},
		success : function(data) {
			$("#userTopSay").append(""+
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
					"<small class='pull-right'><span class='glyphicon glyphicon-eye-open' style='margin-left:30px'></span>浏览量 "+data.sayMsgDTO.sayViews+"<img src='images/0x1f4cc.png'/></small>"+
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
					"		<div class='btn btn-default' onclick='cancelTopSayEvent("+userId+","+data.sayId+")'><span class='glyphicon glyphicon-pushpin tool'>取消置顶</span></div>"+
					"		<div class='btn btn-default'><span class='glyphicon glyphicon-pushpin tool'>查看详情</span></div>"+
					"	</div>"+
					"	<div class='collapse' id='collapseExample"+data.sayId+"'>"+
					"		<div class ='well'>"+
					"<textarea placeholder='填写举报内容' id='reportContent"+data.sayId+"' cols='100' rows='2' ></textarea><span id='reportBtn' class='btn btn-default' style='margin-bottom:31px' onclick='reportEvent("+userId+","+data.userMsgDTO.userId+","+data.sayId+")'>举报</span>"+
					"		</div>"+
					"	</div>"+
					"<div id='commentsDiv"+data.sayId+"'></div>"+
					"	<textarea id='commentArea"+data.sayId+"' rows='2' cols='90' placeholder='对"+data.userMsgDTO.userName+"的评论：' style='resize: none; margin-top: 5px;'></textarea>"+
					"	<div class='btn btn-default' style='margin-bottom: 35px;' onclick='commentEvent("+data.sayId+","+userId+","+data.userMsgDTO.userId+")'><span class='glyphicon glyphicon-hand-left'></span>发送</div>"+
					"</div>"+
					"</div>"+
					"</div>"
			);
		}
	});
}

function loadUserInfo(userId){
	pageUserId = userId;
	$.ajax({
		type : "get",
		url : "getUser/"+userId,
		data : {},
		success : function(data) {
//			console.log("加载个人信息");
			$("#userLogo").append(
					" <span>"+data.userName+"</span>"+
					" <a target=‘_blank’ href='user?uid="+data.userId+"'><img src='"+data.headIcon+"' class='img-circle'></a>"+
					"");
			$("#userMsg").append(
					" <img src='"+data.headIcon+"' class=img-circle>"+
					" <ul>"+
					" <li class=h5>用户名：<span>"+data.userName+"</span></li>"+
					" <li class=h5>空间等级：<span>"+data.level+"</span></li>"+
					" <li class=h5>"+
					" <button class='btn btn-default' type='button'>"+
					" 	<span class='glyphicon glyphicon-thumbs-up'></span> <span class='badge'>"+data.vistors+"</span>"+
					" 	</button>"+
					" </li>"+
					" </ul>"+
					"");
			
		}
	});
}

function sendSayAction(userId){
	$("#sendBtn").bind("click",function(){
		//获取复选框说说类型
		var sayTypes = "";
		$("[name='sayType']:checked").each(function(){
			sayTypes  += $(this).val()+",";
		});
		console.log("类型标签:"+sayTypes);
		if(sayTypes.length==0){
			alert("必须为您的说说选择分类才可以发送喔~");
			return ;
		}
		//获取文本编辑器中的内容
		var sayContent = UE.getEditor('editor').getPlainTxt();
		$.ajax({
			type : "post",
			url : "index/say/send",
			data : {
				"userId":userId,
				"sayTypes":sayTypes,
				"sayContent":sayContent
			},
			success : function(data) {
				if(data=="true"){
					alert("说说发表成功!");
				}else{
					alert("说说发表失败!");
				}
				//清空发送框
				clearSendArea();
			}
		});
	})
}

function clearSendArea(){
	$("[name='sayType']:checked").each(function(){
		$(this).attr("checked", false);
	});
	//$(".view").children().remove();
	$("#fileQueue").children().remove();
}

function loadTypeNames(){
	$.ajax({
		type : "get",
		url : "type/getAll",
		data : {},
		success : function(data) {
			for(var i=0;i<data.length;i++){
				$("#typeNameBox").append("" +
						"<input type='checkbox' name='sayType'  value='"+data[i].typeId+"'/>"+data[i].typeName+""+
						"");
			}
			$("[name='sayType']").css({"margin-left":"15px"});
		}
	});
}

function initUpload(){
	$("#uploadify").uploadify({
		debug: false,
		swf: 'js/uploadify.swf', //swf文件路径
		method: 'post', // 提交方式
		uploader: 'say/send', // 服务器端处理该上传请求的程序(servlet, struts2-Action)
		preventCaching: true, // 加随机数到URL后,防止缓存
		buttonCursor: 'hand', // 上传按钮Hover时的鼠标形状
		buttonText: '上传图片', //按钮上显示的文字，默认”SELECTFILES”
		height: 30, // 30 px
		width: 120, // 120 px
		fileObjName: 'filedata', //文件对象名称, 即属性名
		fileSizeLimit: 1024*1024*6, // 文件大小限制, 100 KB
		fileTypeDesc: 'any', //文件类型说明 any(*.*)
		fileTypeExts: '*.jpg;*.png；*.zip', // 允许的文件类型,分号分隔
		formData: {
			'id': '1',
			'name': 'myFile'
		}, //指定上传文件附带的其他数据。也动态设置。可通过getParameter()获取
		multi: true, // 多文件上传
		progressData: 'speed', // 进度显示, speed-上传速度,percentage-百分比	
		queueID: 'fileQueue', //上传队列的DOM元素的ID号
		queueSizeLimit: 99, // 队列长度
		removeCompleted: false, // 上传完成后是否删除队列中的对应元素
		removeTimeout: 2, //上传完成后多少秒后删除队列中的进度条, 
		requeueErrors: true, // 上传失败后重新加入队列
		uploadLimit: 20, // 最多上传文件数量
		successTimeout: 30, //表示文件上传完成后等待服务器响应的时间。超过该时间，那么将认为上传成功。
		// 打开文件对话框 关闭时触发
		onDialogClose: function(queueData) {
		},
		// 选择文件对话框打开时触发
		onDialogOpen: function() { /*alert( 'please select files' ) */ },
		// 没有兼容的FLASH时触发
		onFallback: function() {
			alert('Flash was not detected!')
		},
		onUploadError: function(file, errorCode, errorMsg, errorString) {
			 alert(
                            file.name + ' upload failed! ' + 
                            'errorCode: ' + errorCode +
                            'errorMsg:' + errorMsg +
                            'errorString:' + errorString
                        );
		},
		// 在每一个文件上传成功后触发
		onUploadSuccess: function(file, data, response) {
			//上传成功后，把上传队列的第一个删除
		//	$('#uploadify').uploadify('cancel','*');
		}
	});
}
//绑定分页查询事件
function addWindowScrollEvent(userId){
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var docHeight = $(document).height();
		var windowHeight = document.body.clientHeight ;
		if (scrollTop + windowHeight == docHeight) {
			//	console.log("当前页码==="+curNo);
				loadSaySay(userId,curNo);
				curNo++;
		}
	});
}

//加载pageNo编号的3条说说
function loadSaySay(userId,pageNo){
	$.ajax({
		type : "get",
		url : "index/"+userId+"/saies/all/"+pageNo,
		data : {},
		success : function(data) {
			for(var i=0;i<data.data.length;i++){
				$(".sayBox").append(""+
						"<div class='media' id='say"+data.data[i].sayId+"'>"+
						"<div class='media-left'>"+
						"<div class='media-object'>"+
						"<a href='user?uid="+data.data[i].userMsgDTO.userId+"' target='_blank'><img src='"+data.data[i].userMsgDTO.headIcon+"' style='height: 70px; width: 70px;' class='img-circle'></a>"+
						"</div>"+
						"</div>"+
						"<div class='media-body'>"+
						"	<span class='media-heading lead' id='hostName"+data.data[i].sayId+"'>"+data.data[i].userMsgDTO.userName+"</span><span class='media-heading lead'> "+fromatTime(data.data[i].sayMsgDTO.saySendTime,"yyyy-MM-dd HH:mm:ss")+"</span>"+
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
						"		<div class='btn btn-default'  id='"+data.data[i].sayId+"'  onclick='agreeEvent("+userId+","+data.data[i].sayId+");' ><span  class='glyphicon glyphicon-thumbs-up tool agreeBtn'></span><span   id='agree"+data.data[i].sayId+"'>"+data.data[i].sayMsgDTO.sayLovers+"</span></div>"+
						"		<div class='btn btn-default' onclick='collectEvent("+userId+","+data.data[i].sayId+")'><span class='glyphicon glyphicon-star-empty tool' id='collect"+data.data[i].sayId+"'>收藏</span></div>"+
						"		<div class='btn btn-default'  data-toggle='collapse' href='#collapseExample"+data.data[i].sayId+"' ><span class='glyphicon glyphicon-info-sign tool'>举报</span></div>"+
						"		<div class='btn btn-default' onclick='deleteEvent("+userId+","+data.data[i].sayId+")'><span class='glyphicon glyphicon-trash tool'>删除</span></div>"+
						"		<div class='btn btn-default' onclick='setTopSayEvent("+userId+","+data.data[i].sayId+")'><span class='glyphicon glyphicon-pushpin tool'>置顶</span></div>"+
						"		<a href='detail?sayId="+data.data[i].sayId+"&userId="+userId+"' target='_blank'><div class='btn btn-default' ><span class='glyphicon glyphicon-pushpin tool'>查看详情</span></div></a>"+
						"	</div>"+
						"	<div class='collapse' id='collapseExample"+data.data[i].sayId+"'>"+
						"		<div class ='well'>"+
						"<textarea placeholder='填写举报内容' id='reportContent"+data.data[i].sayId+"' cols='100' rows='2' ></textarea><span id='reportBtn' class='btn btn-default' style='margin-bottom:31px' onclick='reportEvent("+userId+","+data.data[i].userMsgDTO.userId+","+data.data[i].sayId+")'>举报</span>"+
						"		</div>"+
						"	</div>"+
						"<div id='commentsDiv"+data.data[i].sayId+"'></div>"+
						"	<textarea id='commentArea"+data.data[i].sayId+"' rows='2' cols='105' placeholder='对"+data.data[i].userMsgDTO.userName+"的评论：' style='resize: none; margin-top: 5px;'></textarea>"+
						"	<div class='btn btn-default' style='margin-bottom: 35px;' onclick='commentEvent("+data.data[i].sayId+","+userId+","+data.data[i].userMsgDTO.userId+")'><span class='glyphicon glyphicon-hand-left'></span>发送</div>"+
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


//取消置顶说说
function cancelTopSayEvent(userId,sayId){
	$.ajax({
		type : "post",
		url : "topsay/cancel",
		data : {
			"userId":userId,
			"sayId":sayId
		},
		success : function(data) {
			if(data=="true"){
				alert("取消成功");
			}else if(data=="false"){
				alert("取消失败");
			}
		}
	});
}

//设置说说置顶
function setTopSayEvent(userId,sayId){
	$.ajax({
		type : "post",
		url : "topsay",
		data : {
			"userId":userId,
			"sayId":sayId
		},
		success : function(data) {
			if(data=="true"){
				alert("设置置顶说说成功");
			}else if(data=="false"){
				alert("设置置顶说说失败");
			}
		}
	});
}

//说说删除事件
function deleteEvent(userId,sayId){
	var op = confirm("确认删除？");
	if(op==true){
		console.log("确认操作");
		$.ajax({
			type : "post",
			url : "delete",
			data : {
				"userId":userId,
				"sayId":sayId
			},
			success : function(data) {
				if(data=="true"){
					alert("删除成功");
					$("#say"+sayId).remove();
				}else if(data=="false"){
					alert("只能删除自己的说说喔-_-|| ");
				}
			}
		});
	}else{
		console.log("取消操作");
	}
	
}
//评论事件
function commentEvent(sayId,commenterId,commenteredId){
	var commentContent = $("#commentArea"+sayId).val();
	if(commentContent.length==0){
		alert("评论内容不能为空!");
		return ;
	}
	console.log("评论内容:"+commentContent);
	$.ajax({
		type : "post",
		url : "comments",
		data : {
			"sayId":sayId,
			"commenterId":pageUserId,
			"commenteredId":commenteredId,
			"commentContent":commentContent
		},
		success : function(data) {
			//1.清空评论
			$("#commentArea"+sayId).val("");
			//2.追加评论到评论区域
			$("#commentsDiv"+sayId).children(".comments").remove();
		//	$("#commentArea"+commenteredId).collapse('hide');
			loadSayComments(sayId);
			resetComment(sayId);
		}
	});
}
//重置恢复输入框
function resetComment(sayId){
	if(pageReplyerId!=pageUserId){
		var hostName = $("#hostName"+sayId).html();
		$("#commentArea"+sayId).attr({"placeholder":"回复"+hostName});
	}
}
//举报事件
function reportEvent(accuserId,defendantId,sayId){
	var reportContent = $("#reportContent"+sayId).val();
	$.ajax({
		type : "post",
		url : "report",
		data : {
			"accuserId":accuserId,
			"defendantId":defendantId,
			"sayId":sayId,
			"reportContent":reportContent
		},
		success : function(data) {
			if(data=="true"){
				alert("您举报成功，我们将会尽快处理");
			}else if(data=="false"){
				alert("举报失败");
			}else if(data=="repeat"){
				alert("你已经成功举报，不能重复举报喔！");
			}
			//隐藏下拉元素
			$("#collapseExample"+sayId).collapse('hide');
		}
	});
}
//收藏事件
function collectEvent(userId,sayId){
	$.ajax({
		type : "post",
		url : "collect",
		data : {
			"collectorId":userId,
			"sayId":sayId
		},
		success : function(data) {
			if(data=="true"){
				$("#collect"+sayId).attr('class','glyphicon glyphicon-star tool');
			}else{
				$("#collect"+sayId).attr('class','glyphicon glyphicon-star-empty tool');
			}
		}
	});
}

//点赞事件
function agreeEvent(userId,sayId){
	$.ajax({
		type : "post",
		url : "agree",
		data : {
			"userId":userId,
			"sayId":sayId
		},
		success : function(data) {
			//更新点赞数据
			$("#agree"+sayId).html(data);
		}
	});
}



//加载说说图片
function loadSayPictures(sayId){
	$.ajax({
		type : "get",
		url : "say/"+sayId+"/images",
		data : {},
		success : function(data) {
			//加载图片
			for(var i=0;i<data.length;i++){
				$("#sayPicBox"+sayId).append("" +
						"<img src='"+data[i]+"' class='sayImgClass col-md-4' ></img>" +
						"");
			}
		}
	});

}
//加载指定sayId下的所有评论
function loadSayComments(sayId){
	$.ajax({
		type : "get",
		url : "index/say/"+sayId+"/comments",
		data : {},
		success : function(data) {
		//	console.log(data);
			if(data.commentMsgDTO!=undefined){//有评论才遍历评论，否则不进行评论的遍历
				for(var i=0;i<data.commentMsgDTO.length;i++){
					$("#commentsDiv"+sayId).append(""+
							"<div class='comments row well' >"+
							"<span>" +
							"<a id='commentUser"+data.commentMsgDTO[i].commentId+"' target='_blank' href='user?uid="+data.commentMsgDTO[i].commentId+"'>"+data.commentMsgDTO[i].commenterName+"</a>" +
							"</span>"+
							"<span >&nbsp;回复&nbsp;</span>"+
							"<a target='_blank' href='user?uid="+data.commentMsgDTO[i].commenteredId+"'>"+data.commentMsgDTO[i].commenteredName+"</a>" +
							"<span> : "+data.commentMsgDTO[i].commentContent+"</span>"+
							"<span  class='glyphicon glyphicon-comment pull-right btn btn-default' onclick='setReply("+pageUserId+","+data.commentMsgDTO[i].commentId+","+sayId+");'  ></span>"+
							"</div>"+""
					);
				}
			}
		}
	});
}

function setReply(pageUserId,commenterId,sayId){
	$("#commentArea"+sayId).attr({"placeholder":"回复"+$("#commentUser"+commenterId).html()});
	console.log(pageUserId+"--->"+commenterId+",sayId"+sayId);
	commentEvent(sayId,pageUserId,commenterId);
}

//加载说说标签
function loadTagName(sayId){
	$.ajax({
		type : "get",
		url : "type/"+sayId+"/bySayId",
		data : {},
		success : function(data) {
		//	$("#tag"+sayId).children('small').remove();
			for(var i=0;i<data.length;i++){
				$("#tag"+sayId).append(
						"<small class='pull-right sayLabel'><span class='glyphicon glyphicon-tag'></span>"+data[i]+"</small>"		
				);
			}
		}
	});
}
//搜索好友
function fuzzySelectUser(){
	$("#keyWord").bind("keyup",function(){
		$(".searchResultItem").remove();
		var keyWord = $("#keyWord").val();
		$.ajax({
			type : "get",
			url : "findUser",
			data : {
				"userName":keyWord
			},
			success : function(data) {
				$(".searchResultBox").css({"display":"block"});
				//alert("注销成功，刷新下试试吧^_^..");
				for(var i=0;i<data.length;i++){
					$(".searchResultBox").append(""+
							"<div class='searchResultItem'>"+
							"<a href='user?uid="+data[i].userId+"' target='_blank'><img src="+data[i].headIcon+" style='width: 30px;height: 30px;'></a>"+
							"<span>"+data[i].userName+"</span> <span class='glyphicon glyphicon-plus btn btn-primary' style='width: 41px;height: 26px;'></span>"+
							"</div>"
					);
				}
			}
		});
	});
}
//显示指定用户编号的亲密好友列表
function listHoney(userId){
	$.ajax({
		type : "get",
		url : "getHoneyList/"+userId,
		data : {},
		success : function(data) {
			for(var i=0;i<data.length;i++){
			 $(".honeyBox").append("<div class='row'>"+
							"<div class='honeyImag'>"+
								"<a target='_blank' href='user?uid="+data[i].friendId+"'><img  src="+data[i].headIcon+" class='img-circle'/></a>"+
							"</div>"+
							"<div class='honeyMsg'>"+
								"<p class='h5' style='margin-left: 15px;'><span>"+data[i].friendName+"</span></p>"+
								"<p class='glyphicon glyphicon-heart'></p>"+
								"<span class='h4'>"+data[i].honey+"</span>"+
							"</div>"+
						"</div>");
			}
		}
	});
}
//注销用户
function loginout(){
	$("#logoutBtn").bind("click",function(){
		$.ajax({
			type : "get",
			url : "logout",
			data : {},
			success : function() {
				alert("注销成功，刷新下试试吧^_^..");
			}
		});
	});

}
//格式化时间
//fromatTime(new Date().getTime(), 'yyyy-MM-dd HH:mm:ss')
function fromatTime(time, format){
    var t = new Date(time);
    var tf = function(i){return (i < 10 ? '0' : '') + i};
    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
        switch(a){
            case 'yyyy':
                return tf(t.getFullYear());
                break;
            case 'MM':
                return tf(t.getMonth() + 1);
                break;
            case 'mm':
                return tf(t.getMinutes());
                break;
            case 'dd':
                return tf(t.getDate());
                break;
            case 'HH':
                return tf(t.getHours());
                break;
            case 'ss':
                return tf(t.getSeconds());
                break;
        }
    })
}

