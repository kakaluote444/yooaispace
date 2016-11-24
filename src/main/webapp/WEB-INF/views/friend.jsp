<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>好友${userName}空间</title>

<meta charset="utf-8" />
<!--导入富文本编辑器引用的js-->
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- bootstrap -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'
	media="all" />
<!-- //bootstrap -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/index.js"></script>
<script src="js/friend.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link
	href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Poiret+One'
	rel='stylesheet' type='text/css'>
<!-- //fonts -->
<link rel="stylesheet" href="css/index.css" />
<!-- 导入uploadify上传组件需要的js和css -->
<script src="./js/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="./css/uploadify.css">

<script type="text/javascript">
	$(function() {
		loginout();//注册注销监听器
		//listHoney("${requestScope.userId}");//显示亲密好友
		fuzzySelectUser();//注册搜索好友监听器
		loadPrivateSaySay("${requestScope.userId}",0);//加载第0页的说说
		addPrivateWindowScrollEvent("${requestScope.userId}");//添加滚动分页事件
		initUpload();	//初始化上传监听器
		loadTypeNames();//加载说说便签
		sendSayAction("${requestScope.userId}");//发表说说动作
		loadUserInfo("${requestScope.userId}");//加载用户个人信息
	})
</script>
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
					<form class="navbar-form navbar-right" action="" method="get"
						onsubmit="return false;">
						<input type="text" class="form-control" placeholder="好友查询...."
							id="keyWord"> <input value=" " type="submit"
							id="searchBtn">
						<!--搜索结果BEGIN  -->
						<div class="searchResultBox"></div>
						<!--搜索结果END  -->
					</form>
				</div>
				<div class="header-top-right">
					<div class="file" id="userLogo">
					<!-- 用户个人信息 -->
						<%-- <span>${loginUser.userName}</span> <a
							href="index/${loginUser.userId}"><img
							src="${loginUser.headIcon }" class="img-circle" /></a> --%>
					</div>
					<div class="signin">
						<button id="logoutBtn" class="btn btn-primary dropdown-toggle"
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
		<div class="drop-navigation drop-navigation"  style="margin-top: 15px">
			<ul class="nav nav-sidebar">
				<li><a href="rizhi.html" class="sub-icon"><span
						class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日志</a></li>
				<li><a href="index/102/#" class="menu"><span
						class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分类浏览<span
						class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
				<ul class="cl-effect-1">
					<li><a href="index.html">幽默</a></li>
					<li><a href="index.html">生活</a></li>
					<li><a href="index.html">情感</a></li>
					<li><a href="index.html">知识</a></li>
					<li><a href="index.html">广告</a></li>
				</ul>
				<li><a href="album.html" class="sub-icon"><span
						class="glyphicon glyphicon-picture" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相册</a></li>
				<li><a href="liuyan.html" class="sub-icon"><span
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
			<div class="row">
				<div class="leftBox col-md-9">
					<div class="row">
						<!-- 说说提交表单BEGIN -->
			</div>
			<div class="row">
				<div class="sayBox">
					<!--放说说的具体地方-->
					<!--第一条说说结束-->
					<!--第二条说说开始  -->
					<!--第二条说说结束-->
				</div>
			</div>
		</div>
		<div class="rightBox col-md-3">
			<!--个人信息-->
			<div class="row">
				<div class="userBox" id="userMsg">
					<!-- 用户个人信息 -->
				</div>
			</div>
			<!--亲密排行榜-->
			<div class="row">
				<div class="honeyBox">
					<!--第一个盒子开始  -->
					<%-- <c:forEach items="${honeies}" var="honey">
								<div class="row">
									<div class="honeyImag">
										<img src="${honey.headIcon }" class="img-circle">
									</div>
									<div class="honeyMsg">
										<p class="h5" style="margin-left: 15px;">
											<span>${honey.friendName}
										</p>
										<p class="glyphicon glyphicon-heart"></p>
										<span class="h4">${honey.honey}</span>
									</div>
								</div>
							</c:forEach> --%>

					<!--第一个盒子结束  -->
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
			toolbars : [ [ 'emotion' ] ],
			autoHeightEnabled : true,
			autoFloatEnabled : true
		});
	</script>
</body>
</html>
