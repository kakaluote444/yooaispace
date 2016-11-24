<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title>友爱空间登录</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/login2.css" />
</head>

<body>
	<div class="container">
		<div class="col-md-4 col-md-push-2">
			<div class="logoBox">
				<img src="images/link.png"> <label
					style="font-size:36px; font-style:normal">友爱空间</label>
				<center>
					<label style="font-size:18px; font-style:normal">分&nbsp;享&nbsp;生&nbsp;活&nbsp;&nbsp;&nbsp;收&nbsp;获&nbsp;感&nbsp;动</label>
				</center>
			</div>
		</div>
		<div class="col-md-4 col-md-push-4">
			<!--登录界面BEGIN-->
			<div class="login" style="margin-top:80px;">
				<div class="header">
				<div style="text-align: center; color: red;"><span id="login_info">${login_info}</span></div>
					<div class="switch" id="switch">
						
						<a class="switch_btn_focus" id="switch_qlogin"
							href="javascript:void(0);" tabindex="7">快速登录</a> <a
							class="switch_btn" id="switch_login" href="javascript:void(0);"
							tabindex="8">快速注册</a>
						<div class="switch_bottom" id="switch_bottom"
							style="position: absolute; width: 70px; left: 0px ;"></div>
					</div>
				</div>
				<div class="web_qr_login" id="web_qr_login"
					style="display: block; height: 235px;">
					<!--登录-->
				
					<div class="web_login" id="web_login">

						<div class="login-box">

							<div class="login_form">
								<form action="login" name="loginform" accept-charset="utf-8"
									id="login_form" class="loginForm" method="post">
									<input type="hidden" name="did" value="0"> <input
										type="hidden" name="to" value="log">
									<div class="uinArea" id="uinArea">
										<label class="input-tips" for="u">帐号：</label>
										<div class="inputOuter" id="uArea">
											<input type="text" id="u" name="userName" class="inputstyle">
										</div>
									</div>
									<div class="pwdArea" id="pwdArea">
										<label class="input-tips" for="p">密码：</label>
										<div class="inputOuter" id="pArea">

											<input type="password" id="p" name="userPassword"
												class="inputstyle">
										</div>
									</div>
									<div style="padding-left:50px;margin-top:20px;">
										<input type="submit" value="登 录" style="width:150px;"
											class="button_blue">
									</div>
								</form>
							</div>

						</div>

					</div>
					<!--登录end-->
				</div>

				<!--注册-->
				<div class="qlogin" id="qlogin" style="display: none;">

					<div class="web_login">
						<form name="form2" id="regUser" accept-charset="utf-8" action="register"
							method="post">
							<input type="hidden" name="to" value="reg"> <input
								type="hidden" name="did" value="0">
							<ul class="reg_form" id="reg-ul">
								<div id="userCue" class="cue">快速注册请注意格式</div>
								<li><label for="user" class="input-tips2">用户名：</label>
									<div class="inputOuter2">
										<input type="text" id="user" name="userName" maxlength="16"
											class="inputstyle2">
									</div></li>

								<li><label for="passwd" class="input-tips2">密码：</label>
									<div class="inputOuter2">
										<input type="password" id="passwd" name="userPassword"
											maxlength="16" class="inputstyle2">
									</div></li>
								<li><label for="passwd2" class="input-tips2">确认密码：</label>
									<div class="inputOuter2">
										<input type="password" id="passwd2" name="reUserPassword" maxlength="16"
											class="inputstyle2">
									</div></li>

								<li><label for="qq" class="input-tips2">QQ邮箱：</label>
									<div class="inputOuter2">

										<input type="text" id="qq" name="userEmail" maxlength="20"
											class="inputstyle2">
									</div></li>

								<li>
									<div class="inputArea">
										<input type="button" id="reg"
											style="margin-top:10px;margin-left:85px;width: 150px;"
											class="button_blue" value="注册">
									</div>

								</li>
								<div class="cl"></div>
							</ul>
						</form>

					</div>

				</div>
				<!--注册end-->
			</div>
			<!--登录界面END-->
			</fieldset>
		</div>

	</div>

</body>
</html>
