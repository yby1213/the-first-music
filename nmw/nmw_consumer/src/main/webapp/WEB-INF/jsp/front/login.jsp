<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" %>
<link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../../../statics/layuiadmin/style/admin.css" media="all">
<link rel="stylesheet" href="../../../statics/layuiadmin/style/login.css" media="all">
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
	</head>
	<body>
	<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
		<div class="layadmin-user-login-main">
			<div class="layadmin-user-login-box layadmin-user-login-header">
				<h2>第一音乐</h2>
				<p>用户登录</p>
			</div>
			<div class="layadmin-user-login-box layadmin-user-login-body "><!--layui-form-->
		<form type="post" action="${pageContext.request.contextPath}/login.html">

			<div class="layui-form-item">
			<label class="layadmin-user-login-icon layui-icon layui-icon-username" ></label>
			<input type="text" name="userName" id="userName" class="layui-input">
				<p><span id="spanUserName"></span></p>
			</div>

			<div class="layui-form-item">
			<label class="layadmin-user-login-icon layui-icon layui-icon-password" ></label>
			<input type="text" name="userPwd" id="userPwd" class="layui-input">
				<p><span id="spanUserPwd"></span></p>
			</div>

			<div class="layui-form-item">
				<div class="layui-row">
					<div class="layui-col-xs7">
						<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
						<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
					</div>
					<div class="layui-col-xs5">
						<div style="margin-left: 10px;">
							<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 20px;">
				<input type="checkbox" name="remember" lay-skin="primary" title="记住密码">记住密码
			</div>
<%--			<a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>--%>
				<input class="layui-btn layui-btn-fluid" type="submit" id="login_btn" value="登入">
				<c:if test="${error_login}">
					<p><span id="spanLogin">${error_login}</span></p>
				</c:if>
		</form>
				<div class="layui-trans layui-form-item layadmin-user-login-other">
					<label>社交账号登入</label>
					<a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
					<a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
					<a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

					<a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
				</div>
		</div>
	</div>
		<div class="layui-trans layadmin-user-login-footer">
			<p>© 2020 <a href="http://www.layui.com/" target="_blank">kirin9000.com</a></p>
		</div>
	</div>
	</body>
</html>
<script src="../../../statics/layuiadmin/layui/layui.js"></script>
<script src="../../../statics/js/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$("#userName").blur(function(){
			if($("#userName").val() == ""){
				$("#spanUserName").html("请输入账号");
			}
		});
        $("#userPwd").blur(function(){
            if($("#userPwd").val() == ""){
                $("#spanUserPwd").html("请输入密码");
            }
        });
	})
</script>
