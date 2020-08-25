<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 文章管理 iframe 框</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
   <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
</head>
<body>

  <div class="layui-form" lay-filter="layuiadmin-app-form-list" id="layuiadmin-app-form-list" style="padding: 20px 30px 0 0;">
    <div class="layui-form-item">
      <label class="layui-form-label">歌单名</label>
      <div class="layui-input-inline">
        <input type="text" name="sheet_name" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
      </div>
    </div>
    <input hidden="hidden" name="sheet_pic" id="sheet_pic" />
     <div class="layui-upload" style="margin-left: 108px;">
            	<div class="layui-upload-list" style="display:inline-block;">
                <img class="layui-upload-img" id="test-upload-normal-img" style="height: 100px;">
                <p id="test-upload-demoText"></p>
              </div>
              <button type="button" class="layui-btn" id="test-upload-normal">上传图片</button>
              
            </div>
    <div class="layui-form-item layui-hide">
      <input type="button" lay-submit lay-filter="layuiadmin-app-form-submit" id="layuiadmin-app-form-submit" value="确认添加">
      <input type="button" lay-submit lay-filter="layuiadmin-app-form-edit" id="layuiadmin-app-form-edit" value="确认编辑">
    </div>
  </div>

	<script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'form','upload'], function(){
    var $ = layui.$
    ,form = layui.form
    ,upload = layui.upload
    ,admin = layui.admin;
    //监听提交
    form.on('submit(layuiadmin-app-form-submit)', function(data){
      var field = data.field; //获取提交的字段
      var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引  

      //提交 Ajax 成功后，关闭当前弹层并重载表格
      $.ajax({
      	url: 'http://localhost:8181/addsheetbyadmin'
      	,data: field
      	,success:function(res){
      		if(res.status==1){
      			layer.msg("成功");
      			parent.layui.table.reload('LAY-app-content-list'); //重载表格
      			parent.layer.close(index); //再执行关闭 
      		}else{
      			layer.msg("失败了");
      		}
      	}
      });

    });
    
        //普通图片上传
    var uploadInst = upload.render({
      elem: '#test-upload-normal'
      ,url: 'http://localhost:8181/upload/img?index=img'
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $('#test-upload-normal-img').attr('src', result); //图片链接（base64）
        });
      }
      ,done: function(res){
        //如果上传失败
        if(res.code > 0){
          return layer.msg('上传失败');
        }
         console.log(res);
        $("#sheet_pic").val(res.msg);
        //上传成功
      }
      ,error: function(){
        //演示失败状态，并实现重传
        var demoText = $('#test-upload-demoText');
        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
        demoText.find('.demo-reload').on('click', function(){
          uploadInst.upload();
        });
      }
    });
  })
  </script>
</body>
</html>