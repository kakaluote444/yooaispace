<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title>留言</title>
<meta charset="utf-8" />
<!--富文本编辑器-->
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.min.js"></script>
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
<script src="js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link
	href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Poiret+One'
	rel='stylesheet' type='text/css'>
<!-- //fonts -->
<link rel="stylesheet" href="css/index.css" />
</head>

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
				<a class="navbar-brand" href="index.html"><h1>
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
					<div class="file">
						<span>卡卡罗特444</span> <a href="#"><img src="images/head.jpg"
							class="img-circle" /></a>
					</div>
					<div class="signin">
						<button class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							退出<span class="glyphicon glyphicon-log-out"></span>
						</button>
						<!-- pop-up-box -->
						<!--//pop-up-box -->
					</div>
					<div class="signin">
						<button class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							设置<span class="glyphicon glyphicon-wrench"></span>
						</button>
						<!--设置操作的下拉菜单-->
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
				<li><a href="index.html" class="home-icon"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li><a href="usercenter" class="sub-icon"><span
						class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人中心</a></li>
				<li><a href="yuwoxg.html" class="sub-icon"><span
						class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;与我相关</a></li>
				<li><a href="rizhi.html" class="sub-icon"><span
						class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日志</a></li>
				<li><a href="#" class="menu"><span
						class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分类浏览<span
						class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
				<ul class="cl-effect-1">
					<li><a href="index.html">幽默</a></li>
					<li><a href="index.html">生活</a></li>
					<li><a href="index.html">情感</a></li>
					<li><a href="index.html">知识</a></li>
					<li><a href="index.html">广告</a></li>
				</ul>
				<li><a href="album.html" class="sub-icon "><span
						class="glyphicon glyphicon-picture" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相册</a></li>
				<li class="active"><a href="liuyan.html" class="sub-icon"><span
						class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;留言</a></li>
				<li><a href="gerenzl.html" class="sub-icon"><span
						class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人资料</a></li>
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
		<div class="show-top-grids">
			<!--自定义界面开始-->
			<div class="col-md-9 col-md-push-1">
				<script id="editor" type="text/plain">说点什么吧</script>
			</div>
			<div style="clear: both;"></div>
			<div class="col-md-3 pull-right">
				<button class="btn btn-default">留言</button>
			</div>
			<div style="clear: both;"></div>
			<!--第一条留言开始-->
			<div class="row">
				<div class="media say col-md-8 col-md-push-1">
					<div class="media-left">
						<div class="media-object">
							<img src="images/sunwukong.jpg"
								style="height: 50px; width: 50px;" class="img-circle">
						</div>
					</div>
					<div class="media-body">
						<span class="media-heading lead">卡卡罗特</span><span
							class="media-heading lead"> 2016-8-20 11:35:35</span>
						<p class="well">晚安，sb</p>

					</div>
				</div>
			</div>
			<!--第一条留言结束-->
			<!--第二条留言开始-->
			<div class="row">
				<div class="media say col-md-8 col-md-push-1">
					<div class="media-left">
						<div class="media-object">
							<img src="images/sunwukong.jpg"
								style="height: 50px; width: 50px;" class="img-circle">
						</div>
					</div>
					<div class="media-body">
						<span class="media-heading lead">卡卡罗特</span><span
							class="media-heading lead"> 2016-8-20 11:35:35</span>
						<p class="well">晚安，sb</p>

					</div>
				</div>
			</div>
			<!--第二条留言结束-->
			<div class="row">
				<div class="media say col-md-8 col-md-push-1">
					<div class="media-left">
						<div class="media-object">
							<img src="images/sunwukong.jpg"
								style="height: 50px; width: 50px;" class="img-circle">
						</div>
					</div>
					<div class="media-body">
						<span class="media-heading lead">卡卡罗特</span><span
							class="media-heading lead"> 2016-8-20 11:35:35</span>
						<p class="well">晚安，sb</p>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="media say col-md-8 col-md-push-1">
					<div class="media-left">
						<div class="media-object">
							<img src="images/sunwukong.jpg"
								style="height: 50px; width: 50px;" class="img-circle">
						</div>
					</div>
					<div class="media-body">
						<span class="media-heading lead">卡卡罗特</span><span
							class="media-heading lead"> 2016-8-20 11:35:35</span>
						<p class="well">晚安，sb</p>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="media say col-md-8 col-md-push-1">
					<div class="media-left">
						<div class="media-object">
							<img src="images/sunwukong.jpg"
								style="height: 50px; width: 50px;" class="img-circle">
						</div>
					</div>
					<div class="media-body">
						<span class="media-heading lead">卡卡罗特</span><span
							class="media-heading lead"> 2016-8-20 11:35:35</span>
						<p class="well">晚安，sb</p>

					</div>
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
							<li><a href="about.html">About</a></li>
							<li><a href="press.html">Press</a></li>
							<li><a href="copyright.html">Copyright</a></li>
							<li><a href="creators.html">Creators</a></li>
							<li><a href="#">Advertise</a></li>
							<li><a href="developers.html">Developers</a></li>
						</ul>
					</div>
					<div class="footer-bottom-nav">
						<ul>
							<li><a href="terms.html">Terms</a></li>
							<li><a href="privacy.html">Privacy</a></li>
							<li><a href="#small-dialog4"
								class="play-icon popup-with-zoom-anim">Send feedback</a></li>
							<li><a href="privacy.html">Policy & Safety </a></li>
							<li><a href="try.html">Try something new!</a></li>
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
				toolbars: [
					['emotion']
				],
				autoHeightEnabled: true,
				autoFloatEnabled: true
			});
		</script>
</body>
</html>
