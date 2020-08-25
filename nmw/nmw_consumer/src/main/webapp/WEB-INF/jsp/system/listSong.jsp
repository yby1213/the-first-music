<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>开启单元格编辑 - 数据表格</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/admin.css" media="all">
</head>
<body>

  <div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
      <a lay-href="">主页</a>
      <a><cite>组件</cite></a>
      <a><cite>数据表格</cite></a>
      <a><cite>开启单元格编辑</cite></a>
    </div>
  </div>
  
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">管理歌曲</div>
          <div class="layui-inline">
            <label class="layui-form-label">关键字</label>
            <div class="layui-input-block">
              <input type="text" name="keyword" id="keyword" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <button class="layui-btn layuiadmin-btn-useradmin" lay-submit lay-filter="LAY-user-front-search">
              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
            </button>

			    </div>
          <div class="layui-card-body">
          	<div style="padding-bottom: 10px;">
          <button class="layui-btn layui-btn-danger layuiadmin-btn-comm" data-type="batchdel">批量删除</button>
          <button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
        </div>
            <table class="layui-hide" id="test-table-cellEdit" lay-filter="test-table-cellEdit"></table>
            
            <script type="text/html" id="imgTpl"> 
          <img style="height: 80px;"  src= {{ d.song_pic }}>
        </script> 
				<style type="text/css">
		    .layui-table-cell{
			    text-align:center;
			    height: auto;
			    white-space: normal;
				    }
				</style>
          </div>
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
  }).use(['index', 'table'], function(){
  	var $ = layui.$
    ,form = layui.form
    ,table = layui.table
    ,admin=layui.admin;
    
   

    
        //监听搜索
    form.on('submit(LAY-user-front-search)', function(data){
      var field = data.field;
      //执行重载
       table.render({
      elem: '#test-table-cellEdit'
      ,url: 'http://localhost:8181/getSongsAllByPage?keyword='+$("#keyword").val()
      ,cols: [[
        {type:'checkbox'}
        ,{field:'id', title:'ID', width:80, sort: true}
        ,{field:'song_singer', title:'歌手', width:120, sort: true, edit: 'text'}
        ,{field:'song_name', title:'歌曲名', edit: 'text', minWidth: 150}
        ,{field:'song_role', title:'权限', width:80, edit: 'text'}
        ,{field:'song_collect', title:'收藏量', edit: 'text',sort: true}
        ,{field:'song_pic', title:'海报',width: 100,templet: '#imgTpl'}
      ]]
      ,limit: 30
    })
    });
    
    table.render({
      elem: '#test-table-cellEdit'
      ,url: 'http://localhost:8181/getSongsAllByPage'
      ,cols: [[
        {type:'checkbox'}
        ,{field:'id', title:'ID', width:80, sort: true}
        ,{field:'song_singer', title:'歌手', width:120, sort: true, edit: 'text'}
        ,{field:'song_name', title:'歌曲名', edit: 'text', minWidth: 150}
        ,{field:'song_role', title:'权限', width:80, edit: 'text'}
        ,{field:'song_collect', title:'收藏量', edit: 'text',sort: true}
        ,{field:'song_pic', title:'海报',width: 100,templet: '#imgTpl'}
      ]]
      ,limit: 30
    })
    
    //监听单元格编辑
    table.on('edit(test-table-cellEdit)', function(obj){
      var value = obj.value //得到修改后的值
      ,data = obj.data //得到所在行所有键值
      ,admin = obj.admin
      ,field = obj.field; //得到字段
      
            
      $.ajax({
      	type: 'get'
      	,url:'http://localhost:8181/modifysong'
      	,data:obj.data
				,success :function(res){
					if(res.status=1){
						  layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value, {
					    offset: '15px'
					  });
					}
					else{layer.msg("不知道为什么,失败了!");}
				}
      	
      });
    });
    

        //点击事件
    var active = {
    	 
      batchdel: function(){
        var checkStatus = table.checkStatus('test-table-cellEdit')
        ,checkData = checkStatus.data; //得到选中的数据

        if(checkData.length === 0){
          return layer.msg('请选择数据');
        }
      
        layer.confirm('确定删除吗？', function(index) {
          var checkData = table.checkStatus('test-table-cellEdit');
          var data=checkData.data;
          var ids=[];
          for(i=0;i<data.length;i++){
          	ids.push(data[i].id);
          }
          //执行 Ajax 后重载
          admin.req({
           url: 'http://localhost:8181/delsonglistbyadmin'
           ,traditional: true
		        ,data:{ids:ids}
		        ,type:'get'
		        ,success:function(res){
		        	  table.reload('test-table-cellEdit');
		        	  if(res.status){
		        	  	layer.msg('已删除');
		        	  }else{
		        	  	layer.msg("失败");
		        	  }  			
		        }
          });

        });
      },
      
      
      
            add: function(){
        layer.open({
          type: 2
          ,title: '添加歌曲'
          ,content: 'addSong.html'
          ,maxmin: true
          ,area: ['550px', '550px']
          ,btn: ['取消']
          ,yes: function(index, layero){
            //点击确认触发 iframe 内容中的按钮提交
            var submit = layero.find('iframe').contents().find("#button11");
            submit.click();
            
          }
        }); 
      }
    }  

    $('.layui-btn.layuiadmin-btn-comm').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
        $('.layui-btn.layuiadmin-btn-useradmin').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
    
  });
  </script>
</body>
</html>