<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'accessdeny.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#id1 {
	width: 621px;
	height: 288px;
	position: absolute;
	top: 190px;
	left: 439px;
}
</style>


</head>

<body>
	<img src="images/12.jpg" class="img-responsive center-block"
		alt="Responsive image"
		style="width:100%; height:100%; background-repeat:no-repeat" />
	<div id="id1">
		<form>
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<img src="${friendUser.headIcon }" style="width: 100px;height: 100px" class="img-circle">
				</div>
				<div class="col-xs-6 col-sm-3">
					<font color="#003399">${friendUser.userName }</font>
				</div>

				<!-- Add the extra clearfix for only the required viewport -->
				<div class="clearfix visible-xs-block"></div>
				<div class="col-xs-6 col-sm-3"></div>
				<div class="col-xs-6 col-sm-3">
					<a href="#">${loginUser.userName }</a>&nbsp;&nbsp;<a href="#">退出</a>
				</div>
			</div>
			<br /> <br />
			<div class="row">
				<div class="col-md-6 col-sm-3">主人设置了权限，您可通过以下方式访问</div>
			</div>
			<br />
			<div class="row">
				&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-info" role="button"
					data-toggle="collapse" href="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample"> 申请访问 </a>
				<div class="collapse" id="collapseExample">
					<div class="well">
						<div class="form-group">
							<label for="exampleInputleavemsg">您将访问<font
								color="#003399">昵称</font>的空间
							</label><br /> <label>留言：</label><br /> <input type="text"
								class="form-control" id="exampleleavemsg" placeholder="留言"><br />
							<div class="col-md-offset-11">
								<button class="btn btn-primary" type="button">
									添加<span class="glyphicon glyphicon-plus"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
