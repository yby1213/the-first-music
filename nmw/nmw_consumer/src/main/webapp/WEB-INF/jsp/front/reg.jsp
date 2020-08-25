
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>注册 - layuiAdmin</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/login.css" media="all">
</head>
<body>


  <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>第一音乐</h2>
        <p>注册成为用户</p>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">

        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="LAY-user-login-cellphone"></label>
          <input type="text" name="phone" id="LAY-user-login-cellphone" lay-verify="phone" placeholder="手机" class="layui-input">
        </div>
        <input type="text" hidden="hidden" name="userRole" value="2">
        <div class="layui-form-item">
          <div class="layui-row">
            <div class="layui-col-xs7">
              <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
              <input type="text" name="checkSMSCode" id="LAY-user-login-vercode" lay-verify="required" placeholder="验证码" class="layui-input">
            </div>
            
            <div class="layui-col-xs5">
              <div style="margin-left: 10px;">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-fluid" id="LAY-user-getsmscode">获取验证码</button>
              </div>
            </div>
          </div>
        </div>


        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-nickname"></label>
          <input type="text" name="userName" id="LAY-user-login-nickname" lay-verify="nickname" placeholder="昵称" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="userPwd" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
          <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
        </div>
        
        <div class="layui-form-item">
          <input type="checkbox" name="agreement" lay-skin="primary" title="同意用户协议" checked>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit">注 册</button>
        </div>

        <div class="layui-trans layui-form-item layadmin-user-login-other">
          <label>社交账号注册</label>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
          <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>
          
          <a href="enLogin.html" class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>
          <a href="enLogin.html" class="layadmin-user-jump-change layadmin-link layui-hide-sm layui-show-xs-inline-block">登入</a>
        </div>
      </div>
    </div>
  </div>

	<script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'user'], function(){
    var $ = layui.$
    ,setter = layui.setter
    ,admin = layui.admin
    ,form = layui.form
    ,router = layui.router();

    form.render();

    //提交
    form.on('submit(LAY-user-reg-submit)', function(obj){
      var field = obj.field;
      
      //确认密码
      if(field.userPwd !== field.repass){
        return layer.msg('两次密码输入不一致');
      }
      
      //是否同意用户协议
      if(!field.agreement){
        return layer.msg('你必须同意用户协议才能注册');
      }

//请求接口
      admin.req({
        url: 'http://localhost:8181/adduserbyadmin'
        ,data: field
        ,done: function(res){
          if(res.status==1){
            layer.msg('注册成功', {
              offset: '15px'
              ,icon: 1
              ,time: 1000
            }, function(){
              location.href="${pageContext.request.contextPath }/enLogin.html";
            });
          }else{
            layer.msg('注册失败,该名字或者手机号以被占有');
          }
        }
      });

      return false;
    });
  });

  $(function(){
      $("#LAY-user-getsmscode").click(function(){
          $.ajax({
              url:'/SendSMS',
              type:'POST',
              data:{phone:$("#LAY-user-login-cellphone").val()},
              dataType:'json',
              success:function(json){
                  if(json == "true"){
                      alert("发送成功，请注意查收!");
                  }else{
                      alert("发送失败，请重新发送!");
                  }
              },
              error:function(){
                  alert('请求超时或系统出错!');
              }
          })
      })

      $("#LAY-user-login-nickname").click(function(){
          $.ajax({
              url:'/checkSMSCode',
              type:'POST',
              data:{checkSMSCode:$("#LAY-user-login-vercode").val()},
              dataType:'json',
              success:function(json){
                  if(json == "true"){
                      alert("验证成功！");
                  }if(json == "TimeOut"){
                      alert("输入超时");
                  }if(json == "CodeError"){
                      alert("验证码不匹配");
                  }if(json == "CodeError"){
                      alert("验证码不匹配");
                  }
              },
              error:function(){
                  alert('请求超时或系统出错!');
              }
          })
      })
  })
  </script>
</body>
</html>