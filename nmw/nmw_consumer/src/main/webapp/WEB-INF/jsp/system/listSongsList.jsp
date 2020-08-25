<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 内容系统 - 评论管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/admin.css" media="all">
</head>
<body>

  <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-form layui-card-header layuiadmin-card-header-auto">
        <div class="layui-form-item">
          <div class="layui-card-header">请搜索歌单</div>
          <div class="layui-inline">
            <label class="layui-form-label">歌单id</label>
            <div class="layui-input-inline">
              <input type="text" name="keyword" id="keyword" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
          
          <div class="layui-inline">
            <button class="layui-btn songListAA-del" data-type="reload" lay-submit lay-filter="songListAA-search">
              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
            </button>
          </div>
        </div>
      </div>
      <div class="layui-card-body">
        <div style="padding-bottom: 10px;">
          <button class="layui-btn songListAA-del layui-btn-danger" data-type="batchde2">批量删除</button>
        </div>
        <table id="songListAA" lay-filter="songListAA"></table>  
        
      </div>
    </div>
  </div>
  
  
<div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-form layui-card-header layuiadmin-card-header-auto">
        <div class="layui-form-item">
          <div class="layui-card-header">全部歌曲</div>
          <div class="layui-inline">
            <label class="layui-form-label">关键字</label>
            <div class="layui-input-inline">
              <input type="text" name="keyword" id="keyword2" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
          
          <div class="layui-inline">
            <button class="layui-btn layuiadmin-btn-comm" data-type="reload" lay-submit lay-filter="LAY-app-contcomm-search">
              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
            </button>
          </div>
        </div>
      </div>
      <div class="layui-card-body">
        <div style="padding-bottom: 10px;">
          <button class="layui-btn layuiadmin-btn-comm" data-type="batchdel">添加</button>
        </div>
        <table id="LAY-app-content-comm" lay-filter="LAY-app-content-comm"></table>  

      </div>
    </div>
  </div>
  <script type="text/html" id="imgTpl"> 
          <img style="height: 80px;"  src= {{ d.song_pic }}>
        </script> 
				<style type="text/css">
		    .layui-table-cell{
			    text-align:center;
			    height: 40px;
			    white-space: normal;
				    }
				</style>
	<script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'contlist', 'table'], function(){
    var $ = layui.$
    ,form = layui.form
    ,admin = layui.admin
    ,table = layui.table;
    
    
        //----------------------单个歌单---------------------------------
       //监听删除
       $('.layui-btn.songListAA-del').on('click', function(data){
      var type = $(this).data('type');
     
      active[type] ? active[type].call(this) : '';
       var field = data.field;
            //执行重载
      table.reload('songListAA', {
        where: field
      });

    });
   
   //监听搜索
    form.on('submit(songListAA-search)', function(data){
      var field = data.field;
      
      //执行重载
      table.reload('songListAA', {
        where: field
      });
      
      
    });
    

    $('.layui-btn.songListAA-del').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
    

    //---------------------全部歌曲----------------------------------
    //监听添加
       $('.layui-btn.layuiadmin-btn-comm').on('click', function(data){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
       var field = data.field;
            //执行重载
      table.reload('songListAA', {
        where: field
      });

    });
    
        //监听搜索
    form.on('submit(LAY-app-contcomm-search)', function(data){
      var field = data.field;
      
      //执行重载
      table.reload('LAY-app-content-comm', {
      	
        where: field
      });
    });
    //点击事件
    var active = {
       batchdel: function(){
        var checkStatus = table.checkStatus('LAY-app-content-comm')
        ,checkData = checkStatus.data; //得到选中的数据

        if(checkData.length === 0){
          return layer.msg('请选择数据');
        }
      
        layer.confirm('确定添加吗？', function(index) {
          var checkData = table.checkStatus('LAY-app-content-comm');
          var data=checkData.data;
          var ids=[];
          for(i=0;i<data.length;i++){
          	ids.push(data[i].id);
          }
          //执行 Ajax 后重载
          admin.req({
           url: 'http://localhost:8181/addsonglistbyid?keyword='+$("#keyword").val()
           ,traditional: true
		        ,data:{ids:ids}
		        ,type:'get'
		        ,success:function(res){
		        	  table.reload('songListAA');
		        	  if(res.status){
		        	  	layer.msg('成功');
		        	  }else{
		        	  	layer.msg("失败");
		        	  }  			
		        }
          });

        });
      },
      batchde2: function(){
        var checkStatus = table.checkStatus('songListAA')
        ,checkData = checkStatus.data; //得到选中的数据

        if(checkData.length === 0){
          return layer.msg('请选择数据');
        }
      	console.log(checkData);

        layer.confirm('确定删除吗？', function(index) {

          var ids=[];
          for(i=0;i<checkData.length;i++){
          	ids.push(checkData[i].id);
          }
          //执行 Ajax 后重载
          admin.req({
           url: 'http://localhost:8181/delsonglistbyid?keyword='+$("#keyword").val()
           ,traditional: true
		        ,data:{ids:ids}
		        ,type:'get'
		        ,success:function(res){
		        	  table.reload('songListAA');
		        	  if(res.status){
		        	  	layer.msg('成功');
		        	  }else{
		        	  	layer.msg("失败");
		        	  }  			
		        }
          });

        });
      }
    }  


    
    
    
  });
  </script>
</body>
</html>

