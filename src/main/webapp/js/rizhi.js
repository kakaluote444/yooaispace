var pageUserId;
var curNo = 0;
//加载个人信息
function loadPersonInfo(userId){
	$.ajax({
		type : "get",
		url : "getUser/"+userId,
		data : {},
		success : function(data) {
			$("#userLogo").append(
					" <span>"+data.userName+"</span>"+
					" <a target=‘_blank’ href='user?uid="+data.userId+"'><img src='"+data.headIcon+"' class='img-circle'></a>"+
					"");
		}
	});

}
//初始化分页组件
function initPagePlugin(total,pageSize){
	$("#pagePluginBox").pagination(total, {
        items_per_page:pageSize,
        num_display_entries:6,
        num_edge_entries:3,
        prev_text:"前一页",
        next_text:"后一页",
        callback:handlePaginationClick
});
}
//分页回调函数
function handlePaginationClick(new_page_index, pagination_container) {
	console.log("分页-->"+new_page_index);
	loadLogByPage(new_page_index);
    return false;
}
//第一次日志数据加载
function FirstTimeLoadLogData(userId,pageNo){
	pageUserId = userId;
	$.ajax({
		type : "get",
		url : "log/"+userId,
		data : {
			"pageNo":pageNo
		},
		success : function(data) {
			var total = data.total;
			var pageSize = data.pageSize;
			initPagePlugin(total,pageSize);
			addLogHtml(data);
			curNo++;
		}
	});
}
//分页ajax操作
function loadLogByPage(pageNo){
	$.ajax({
		type : "get",
		url : "log/"+pageUserId,
		data : {
			"pageNo":pageNo
		},
		success : function(data) {
			addLogHtml(data);
			curNo++;
		}
	});
}

//添加dom操作
function addLogHtml(data){
	$("#logBox").children().remove();
	for(var i=0;i<data.data.length;i++){
		$("#logBox").append("" +
				"<div id='logDiv"+data.data[i].logId+"'  class='lead list-group-item list-group-item-heading'>"+data.data[i].logTitle+""+
				"<span class='btn btn-default pull-right riziBtn' onclick='deleteLogEvent("+data.data[i].logId+")'><span class='glyphicon glyphicon-trash'></span>删除</span>"+
				"<a href='logUpdate/"+data.data[i].logId+"'><span class='btn btn-default pull-right riziBtn'><span class='glyphicon glyphicon-pencil'></span>修改</span></a>"+
				"<a href='logDetail/"+data.data[i].logId+"'><span class='btn btn-default pull-right riziBtn'><span class='glyphicon glyphicon-search'></span>查看详情</span></a>"+
				"</div>"+
				"");
	}
}


//删除日志事件
function deleteLogEvent(logId){
	var flag = confirm("是否真的要删除?");
	if(flag){
		$.ajax({
			type : "post",
			url : "deleteLog",
			data : {
				"logId":logId
			},
			success : function(data) {
				if(data=="true"){
					alert("日志删除成功");
				}else{
					alert("日志删除失败");
				}
				//清楚dom元素
				$("#logDiv"+logId).remove();
			}
		});
	}
	
}