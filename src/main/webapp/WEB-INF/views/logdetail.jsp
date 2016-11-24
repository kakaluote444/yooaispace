<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title>日志发表页面</title>
<meta charset="utf-8" />
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.min.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		

</script>
<!-- bootstrap -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'
	media="all" />
<!-- //bootstrap -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<link href="css/pagination.css" rel='stylesheet' type='text/css'
	media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<!-- <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'> -->
<!-- //fonts -->
<link rel="stylesheet" href="css/index.css" />
</head>
<script type="text/javascript">
</script>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index"><h1>
						<img src="images/logo.png" alt="" />
					</h1></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<div class="top-search">
					<form class="navbar-form navbar-right">
						<input type="text" class="form-control" placeholder="好友查询....">
						<input type="submit" value=" ">
					</form>
				</div>
				<div class="header-top-right">
					<div class="file" id="userLogo">
						<!-- <span>卡卡罗特444</span>
							<a href="#"><img src="images/head.jpg" class="img-circle" /></a> -->
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</nav>
	<div class="col-sm-3 col-md-2 sidebar">
		<div class="top-navigation">
			<div class="t-menu">MENU</div>
			<div class="t-img">
				<img src="images/lines.png" alt="" />
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="drop-navigation drop-navigation">
			<ul class="nav nav-sidebar">
				<li><a href="index/${sessionScope.loginUser.userId}"
					class="home-icon"><span class="glyphicon glyphicon-home"
						aria-hidden="true"></span>首页</a></li>
				<li><a href="gerenzx" class="sub-icon"><span
						class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;&nbsp;个人中心</a></li>
				<li><a href="yuwoxg" class="sub-icon"><span
						class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;&nbsp;与我相关</a></li>
				<li class="active"><a href="rizhi" class="sub-icon"><span
						class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp日志</a></li>
				<li><a href="index/${sessionScope.loginUser.userId}/#"
					class="menu"><span class="glyphicon glyphicon-th-list"
						aria-hidden="true"></span>&nbsp;&nbsp;分类浏览<span
						class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
				<ul class="cl-effect-1">
					<li><a href="index">幽默</a></li>
					<li><a href="index">生活</a></li>
					<li><a href="index">情感</a></li>
					<li><a href="index">知识</a></li>
					<li><a href="index">广告</a></li>
				</ul>
				<li><a href="album" class="sub-icon "><span
						class="glyphicon glyphicon-picture" aria-hidden="true"></span>&nbsp;&nbsp;相册</a></li>
				<li><a href="liuyan" class="sub-icon"><span
						class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;留言</a></li>
				<li><a href="gerenzl" class="sub-icon"><span
						class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;&nbsp;个人资料</a></li>
				<!-- script-for-menu -->
				<script>
					$("li a.menu").click(function() {
						$("ul.cl-effect-1").slideToggle(300, function() {
							// Animation complete.
						});
					});
				</script>
			</ul>
		</div>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="show-top-grids row">
	
			<!--自定义界面开始-->
			<div class="col-md-10 col-md-push-1">
					<div class="panel panel-default panel-default">
						<div class="panel-heading" style="text-align: center;font-size: 25px">日志详情</div>
						<div class="panel-body">
						<h3 style="text-align: center;color: maroon;">标题:${detailLog.logTitle}</h3>
						</div>
						<div class="list-group" id="logBox">
							<!--存放日志item BEGIN  -->
							"${detailLog.logContent}"
							<!--存放日志item END  -->
						</div>
						<div class="panel-footer"  style="text-align: right;font-size: 15px">发表时间<fmt:formatDate value="${detailLog.logDatetime}" pattern="yyyy-MM-dd HH:mm"/></div>
					</div>
				</div>
			<!--自定义部分结束-->
		</div>
		<!-- footer -->
		<div class="footer">
			<div class="footer-grids">
				<div class="footer-top">
					<div class="footer-top-nav">
						<ul>
							<li><a href="about">About</a></li>
							<li><a href="press">Press</a></li>
							<li><a href="copyright">Copyright</a></li>
							<li><a href="creators">Creators</a></li>
							<li><a href="#">Advertise</a></li>
							<li><a href="developers">Developers</a></li>
						</ul>
					</div>
					<div class="footer-bottom-nav">
						<ul>
							<li><a href="terms">Terms</a></li>
							<li><a href="privacy">Privacy</a></li>
							<li><a href="#small-dialog4"
								class="play-icon popup-with-zoom-anim">Send feedback</a></li>
							<li><a href="privacy">Policy & Safety </a></li>
							<li><a href="try">Try something new!</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- //footer -->
	</div>
	<div class="clearfix"></div>
	<div class="drop-menu">
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">Regular link</a></li>
			<li role="presentation" class="disabled"><a role="menuitem"
				tabindex="-1" href="#">Disabled link</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1"
				href="#">Another link</a></li>
		</ul>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script>
		var ue = UE.getEditor('editor', {
			toolbars : [ ['fontfamily', 'fontsize','forecolor', 'backcolor', 'emotion' ,'undo', 'redo', 'bold', 'italic', 'underline','simpleupload', 'insertimage'] ],
			autoHeightEnabled : true,
			autoFloatEnabled : true
		});
	</script>
</body>
</html>
