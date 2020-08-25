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
  	
  	<div class="layui-card">
          <div class="layui-card-header">歌曲图片</div>
          <div class="layui-card-body">
            <div class="layui-upload">
            	<div class="layui-upload-list" style="display:inline-block;">
                <img class="layui-upload-img" id="test-upload-normal-img" style="height: 100px;">
                <p id="test-upload-demoText"></p>
              </div>
              <button type="button" class="layui-btn" id="test-upload-normal">上传图片</button>
              
            </div> 
               <button type="button" class="layui-btn" id="test-upload-type4"><i class="layui-icon"></i>上传音频</button>
          </div>
        </div>
    <div class="layui-form-item">
      <label class="layui-form-label">歌曲名</label>
      <div class="layui-input-inline">
        <input type="text" name="song_name" lay-verify="required" placeholder="请输入歌曲名" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">歌手</label>
      <div class="layui-input-inline">
        <input type="text" name="song_singer" lay-verify="required" placeholder="请输入歌手" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item" lay-filter="sex">
      <label class="layui-form-label">权限</label>
      <div class="layui-input-block">
        <input type="radio" name="song_role" value="0" title="免费" checked>
        <input type="radio" name="song_role" value="1" title="会员">
        
      </div>
      <input hidden="hidden" id="song_pic" name="song_pic" />
      <input hidden="hidden" id="song_url" name="song_url" />
      <button type="button" class="layui-btn" lay-submit lay-filter="button11"style="margin-left: 450px;">确认</button>
    </div>
  </div>

	<script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  </script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'form', 'upload'], function(){
    var $ = layui.jquery
    ,form = layui.form
    ,upload = layui.upload
    ,admin = layui.admin;
      //添加歌曲
  form.on('submit(button11)', function(obj){
    layer.msg(JSON.stringify(obj.field));
    admin.req({
      url: 'http://localhost:8181/addsongs'
      ,data: obj.field
      ,success: function(res){
          console.log(res);
       console.log(obj.field);
       if(res.status=1){
       	layer.msg("成功");
       }else{
       	layer.msg("失败了");
       }
      }
    });
  })

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
        $("#song_pic").val(res.msg);
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
    
    //多图片上传
    upload.render({
      elem: '#test-upload-more'
      ,url: '/upload/'
      ,multiple: true
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $('#test-upload-more-list').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
        });
      }
      ,done: function(res){
        //上传完毕
      }
    });
    
    //指定允许上传的文件类型
    upload.render({
      elem: '#test-upload-type1'
      ,url: '/upload/'
      ,accept: 'file' //普通文件
      ,done: function(res){
        console.log(res)
      }
    });
    upload.render({ //允许上传的文件后缀
      elem: '#test-upload-type2'
      ,url: '/upload/'
      ,accept: 'file' //普通文件
      ,exts: 'zip|rar|7z' //只允许上传压缩文件
      ,done: function(res){
        console.log(res)
      }
    });
    upload.render({
      elem: '#test-upload-type3'
      ,url: '/upload/'
      ,accept: 'video' //视频
      ,done: function(res){
        console.log(res)
      }
    });
    upload.render({
      elem: '#test-upload-type4'
      /*,url: layui.setter.base + 'uploadFile/'*/
      ,url: 'http://localhost:8181/upload/img?index=mp3'
      ,accept: 'audio' //音频
      ,done: function(res){
        console.log(res)
        $("#song_url").val(res.msg);
      }
    });
    
    //设定文件大小限制
    upload.render({
      elem: '#test-upload-size'
      ,url: '/upload/'
      ,size: 10000 //限制文件大小，单位 KB
      ,done: function(res){
        console.log(res)
      }
    });
  
  });
  </script>
</body>
</html>