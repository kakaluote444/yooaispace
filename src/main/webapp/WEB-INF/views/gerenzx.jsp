<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>个人中心</title>
	<meta charset="utf-8" />
		<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"></script>
		<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
		<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
		<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		<!-- bootstrap -->
		<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
		<!-- //bootstrap -->
		<link href="css/dashboard.css" rel="stylesheet">
		<!-- Custom Theme files -->
		<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
		<script src="js/jquery-1.11.1.min.js"></script>
		<!--start-smoth-scrolling-->
		<!-- fonts -->
		<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
		<!-- //fonts -->
		<link rel="stylesheet" href="css/index.css" />


</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
					<a class="navbar-brand" href="index.html"><h1><img src="images/logo.png" alt="" /></h1></a>
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
							<span>卡卡罗特444</span>
							<a href="#"><img src="images/head.jpg" class="img-circle" /></a>
						</div>
						<div class="signin">
							<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							退出<span class="glyphicon glyphicon-log-out"></span>
							</button>
							<!-- pop-up-box -->
							<!--//pop-up-box -->
						</div>
						<div class="signin">
							<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							设置<span class="glyphicon glyphicon-wrench"></span>
							</button>
							<!--设置操作的下拉菜单-->

						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</nav>
		<div class="col-sm-3 col-md-2 sidebar">
			<div class="top-navigation">
				<div class="t-menu">MENU</div>
				<div class="t-img">
					<img src="images/lines.png" alt="" />
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="drop-navigation drop-navigation">
				<ul class="nav nav-sidebar">
					<li><a href="index.html" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
					<li  class="active"><a href="gerenzx.html" class="sub-icon"><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人中心</a></li>
					<li><a href="yuwoxg.html" class="sub-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;与我相关</a></li>
					<li><a href="rizhi.html" class="sub-icon"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日志</a></li>
					<li><a href="#" class="menu"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分类浏览<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
					<ul class="cl-effect-1">
						<li><a href="index.html">幽默</a></li>
						<li><a href="index.html">生活</a></li>
						<li><a href="index.html">情感</a></li>
						<li><a href="index.html">知识</a></li>
						<li><a href="index.html">广告</a></li>
					</ul>
					<li><a href="album.html" class="sub-icon"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相册</a></li>
					<li><a href="liuyan.html" class="sub-icon"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;留言</a></li>
					<li><a href="gerenzl.html" class="sub-icon"><span class="glyphicon glyphicon-th-list" aria-hidden="true" ></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人资料</a></li>
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
				<div class="row">
					<div class="leftBox col-md-9">
						<div class="row">
						</div>
						<div class="row">
							<div class="sayBox">
								<!--放说说的具体地方-->
								<div class="media say">
									<div class="media-left">
										<div class="media-object">
											<img src="images/sunwukong.jpg" style="height: 60px; width: 60px;" class="img-circle">
										</div>
									</div>
									<div class="media-body">
										<span class="media-heading lead">卡卡罗特</span><span class="media-heading lead">   2016-8-20 11:35:35 发表说说</span>
										<p class="well">艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的 艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的 艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的艰苦奋斗萨菲隆的 Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus
											odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
										</p>

									</div>
								</div>
								<!--第一条说说结束-->
								<div class="media say">
									<div class="media-left">
										<div class="media-object">
											<img src="images/sunwukong.jpg" style="height: 60px; width: 60px;" class="img-circle">
										</div>
									</div>
									<div class="media-body">
										<span class="media-heading lead">卡卡罗特</span><span class="media-heading lead">   2016-8-20 11:35:35 发表日志</span>
										<p class="well">
										<a href="#">《如果还有你——日志》</a>
										</p>

									</div>
								</div>
								<!--第二条说说结束-->
								<!--第三条说说开始-->
								<div class="media say">
									<div class="media-left">
										<div class="media-object">
											<img src="images/sunwukong.jpg" style="height: 60px; width: 60px;" class="img-circle">
										</div>
									</div>
									<div class="media-body">
										<span class="media-heading lead"><a href="#">卡卡罗特</a></span><span class="media-heading lead"> 2016-8-22 02:08:27  发表图片 :</span>
										<p class="well">
											<img src="images/c2.jpg" />
										</p>

									</div>
								</div>
								<!--第三条说说结束-->
								<!--第四条说说开始-->
								<div class="media say">
									<div class="media-left">
										<div class="media-object">
											<img src="images/sunwukong.jpg" style="height: 60px; width: 60px;" class="img-circle">
										</div>
									</div>
									<div class="media-body">
										<span class="media-heading lead">给&nbsp;<a href="#">布尔玛</a></span><span class="media-heading lead"> 的留言 </span>
										<p class="well">
											真是日了狗
										</p>

									</div>
								</div>
								<!--第四条说说结束-->
							</div>
						</div>
					</div>
					<div class="rightBox col-md-3">
						<!--个人信息-->
						<div class="row">
							<div class="userBox">
								<img src="images/sunwukong.jpg" class="img-circle" />
								<ul>
									<li class="h5">用户名：<span>卡卡罗特444</span></li>
									<li class="h5">空间等级：<span>L24</span></li>
									<li class="h5">
										<button class="btn btn-default" type="button">
 											 <span class="glyphicon glyphicon-thumbs-up"></span> <span class="badge">48</span>
											</button></li>
								</ul>
							</div>
						</div>
						<!--亲密排行榜-->
						<div class="row">
							<div class="honeyBox">
								<div>
									<div class="honeyImag"><img src="images/sunwukong.jpg" / class="img-circle"></div>
									<div class="honeyMsg">
										<p class="h5" style="margin-left: 15px;"><span>乐极生风</p>
															<p class="glyphicon glyphicon-heart"></p><span class="h4">95</p>
														</div>
											</div>
											<div>
														<div class="honeyImag"><img src="images/sunwukong.jpg"/ class="img-circle"></div>
														<div class="honeyMsg">
															<p class="h5" style="margin-left: 15px;"><span>乐极生风</p>
															<p class="glyphicon glyphicon-heart"></p><span class="h4">95</p>
														</div>
											</div>
											<div>
														<div class="honeyImag"><img src="images/sunwukong.jpg"/ class="img-circle"></div>
														<div class="honeyMsg">
															<p class="h5" style="margin-left: 15px;"><span>乐极生风</p>
															<p class="glyphicon glyphicon-heart"></p><span class="h4">95</p>
														</div>
											</div>
											<div>
														<div class="honeyImag"><img src="images/sunwukong.jpg"/ class="img-circle"></div>
														<div class="honeyMsg">
															<p class="h5" style="margin-left: 15px;"><span>乐极生风</p>
															<p class="glyphicon glyphicon-heart"></p><span class="h4">95</p>
														</div>
											</div>
									</div>
								</div>
						</div>	
				</div>
				<!--第一条说说-->

				<!--第二条说说-->

				<!--第三天说说-->

				<!--第四条说说-->

				<!--第五条说说-->
			
				<!--说说结束-->
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
								<li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Send feedback</a></li>
								<li><a href="privacy.html">Policy & Safety </a></li>
								<li><a href="try.html">Try something new!</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- //footer -->
		</div>
		<div class="clearfix"> </div>
		<div class="drop-menu">
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Regular link</a></li>
				<li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Disabled link</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another link</a></li>
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
