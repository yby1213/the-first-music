<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 网站用户 iframe 框</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
   <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
</head>
<body>

  <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
    <div class="layui-form-item">
      <label class="layui-form-label">用户名</label>
      <div class="layui-input-inline">
        <input type="text" name="userName" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">手机号码</label>
      <div class="layui-input-inline">
        <input type="text" name="phone" lay-verify="phone" placeholder="请输入号码" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">密码</label>
      <div class="layui-input-inline">
        <input type="text" name="userPwd" lay-verify="password" placeholder="请输入密码" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">头像</label>
      <div class="layui-input-inline">
        <input type="text" id="userPic" name="userPic" lay-verify="required" placeholder="请上传图片" autocomplete="off" class="layui-input" >
      </div>
      <button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button> 
    </div>
    <div class="layui-inline">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block">
              <select name="userRole">
              	 <option value="2">用户</option>
              	 <option value="1">管理员</option>
                <option value="3">vip用户</option>
              </select>
            </div>
          </div>
    
    <div class="layui-form-item layui-hide">
      <input type="button" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
    </div>
  </div>

	<script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'form', 'upload'], function(){
    var $=layui.$
    ,form = layui.form
    ,upload = layui.upload ;
    
     //监听提交
    form.on('submit(LAY-user-front-submit)', function(data){
      var field = data.field; //获取提交的字段
      var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引  
      //提交 Ajax 成功后，关闭当前弹层并重载表格

      $.ajax({
      	url: 'http://localhost:8181/adduserbyadmin'
      	,data: field
      	,success:function(res){
      		console.log(res);
      	}
      });
      
      parent.layui.table.reload('LAY-user-manage'); //重载表格
      parent.layer.close(index); //再执行关闭 
    });
    
  var avatarSrc = $('#userPic');
      upload.render({
    url: 'http://localhost:8181/upload/img?index=img'
    ,elem: '#layuiadmin-upload-useradmin'
    ,done: function(map){
      if(map.status == 1){
        layer.msg("成功了");
        console.log(map);
        avatarSrc.val(map.msg);
      } else {
        layer.msg("失败了");
      }
    }
  });
  
  
  })
  </script>
</body>
</html>