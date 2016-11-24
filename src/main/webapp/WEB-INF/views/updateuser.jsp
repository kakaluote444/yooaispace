<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'updateuser.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/regular.css" />
<link rel="stylesheet" href="css/register.css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
/>
<script type="text/javascript"
	src="js/date_plugins/bootstrap-datetimepicker.js"></script>
<!--省市县相关导入-->
<link rel="stylesheet" href="css/city-picker.css" />
<script type="text/javascript" src="js/area_plugins/city-picker.data.js"></script>
<script type="text/javascript" src="js/area_plugins/city-picker.js"></script>
<script type="text/javascript" src="js/area_plugins/main.js"></script>
</head>

<body>
	<div class="container">
		<!--基础资料设置开始-->
		<div class="col-md-5 col-md-push-1" style="margin-top: 20px;">

			<fieldset class="well">
				<form action="" method="post">
					<legend class="lead">基本资料</legend>
					<div class="input-group formDiv">
						<span class="h5 input-group-addon" style="margin-right: 60px;">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
						<input type="radio" value="1" name="sex">男 <input
							type="radio" value="0" name="sex">女
					</div>
					<div class="input-group formDiv">
						<div class="form-group">
							<span class="h5 input-group-addon" style="">出生日期</span>
							<div class="input-group date form_date" data-date=""
								data-date-format="yyyy-MM-dd" data-link-format="yyyy-mm-dd">
								<input class="form-control" size="30" type="text" value=""
									readonly> <span class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="input-group formDiv form-horizontal">

						<div class="input-group">
							<span class="input-group-addon">情感状态</span> <select
								class="form-control">
								<option>单身</option>
								<option>恋爱中</option>
								<option>已婚</option>
								<option>保密</option>
							</select>
						</div>
					</div>
					<div class="formDiv">
						<span class="input-group-addon" style="width: 50px;">现居地址</span>
					</div>
					<div class="formDiv">

						<div class="docs-methods">
							<form class="form-inline">
								<div id="distpicker">
									<div class="form-group">
										<div style="position: relative;">
											<input size="35" id="city-picker3" class="form-control"
												readonly type="text" value="江西省/赣州市/石城县"
												data-toggle="city-picker">
										</div>
									</div>
									<div class="form-group">
										<button class="btn btn-warning" id="reset" type="button">重置</button>
										<button class="btn btn-danger" id="destroy" type="button">确定</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="input-group formDiv">
						<span class="input-group-addon">兴趣爱好</span> <input type="text"
							class="form-control" placeholder="请输入用户名" />
					</div>
					<div class="formDiv">
						<div style="margin-top: 15px;">
							<input type="submit" value="更新"
								class="btn btn-primary col-md-3 col-md-push-9" />
						</div>
					</div>
				</form>
			</fieldset>
		</div>
		<!--基础资料设置结束-->
		<!--密码设置开始-->
		<div class="col-md-5 col-md-push-1" style="margin-top: 20px;">
			<!--用户资料显示模块BEGIN-->
			<div class="well" style="text-align: center;">
				<div class="row">
					<img src="img/head.jpg" style="width: 50px; height: 50px;"
						class="img-circle" />
				</div>
				<div class="row">
					<span style="float: left; margin-left: 60px;">更改头像：</span>
					<form action="" method="post" style="float: left;">
						<input type="file" />
					</form>
				</div>
				<div style="margin-left: 40px;">
					<table cellpadding="0" cellspacing="10" border="1px" class="table">
						<tr>
							<td>用户名:</td>
							<td><span>${detailUser.userName}</span></td>
						</tr>
						<tr>
							<td>个性签名:</td>
							<td><span>${detailUser.userName}</span></td>
						</tr>
						<tr>
							<td>邮箱:</td>
							<td><span>liuburu@outlook.com</span></td>
						</tr>
						<tr>
							<td>性别:</td>
							<td><span>男</span></td>
						</tr>
						<tr>
							<td>出生日期:</td>
							<td><span>男</span></td>
						</tr>
						<tr>
							<td>出生地:</td>
							<td><span>江西 赣州 石城</span></td>
						</tr>
						<tr>
							<td>兴趣爱好:</td>
							<td><span>轮滑 音乐 编程</span></td>
						</tr>
						<tr>
							<td>空间人气:</td>
							<td><span>666</span></td>
						</tr>
					</table>
				</div>
			</div>
			<!--用户资料显示模块END-->
			<div style="margin-top: 40px;">
				<fieldset class="well">
					<form action="#" method="post">
						<legend class="lead">密码修改</legend>
						<div class="input-group formDiv">
							<span class="input-group-addon">原始密码</span> <input type="text"
								class="form-control" placeholder="原来密码" />
						</div>
						<div class="input-group formDiv">
							<span class="input-group-addon">修改密码</span> <input type="text"
								class="form-control" placeholder="设置的新密码" />
						</div>
						<div style="margin-top: 15px;">
							<input type="submit" value="更新"
								class="btn btn-primary col-md-3 col-md-push-9" />
						</div>
				</fieldset>
				</form>
			</div>

		</div>
		<!--密码设置结束-->

	</div>
</body>
</html>
