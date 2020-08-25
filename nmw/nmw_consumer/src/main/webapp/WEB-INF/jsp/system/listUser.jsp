<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 网站用户</title>
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
          <div class="layui-inline">
            <label class="layui-form-label">关键字</label>
            <div class="layui-input-block">
              <input type="text" name="keyword" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
          </div>
           <div class="layui-inline">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block">
              <select name="userRole">
              	 <option value="2">用户</option>
              	 <option value="1">管理员</option>
                <%--<option value="3">vip用户</option>--%>
              </select>
            </div>
          </div>
          <div class="layui-inline">
            <button class="layui-btn layuiadmin-btn-useradmin" lay-submit lay-filter="LAY-user-front-search">
              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
            </button>

			    </div>
			    <div class="layui-card-body">
        <div style="padding-bottom: 10px;">
          <button class="layui-btn layuiadmin-btn-useradmin layui-btn-danger" data-type="batchdel">批量删除</button>
          <button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
        </div>
        
     
        <table id="LAY-user-manage" lay-filter="LAY-user-manage" ></table>
        
        <script type="text/html" id="imgTpl"> 
          <img style="height: 80px;"  src= {{ d.userPic }}>
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
  </div>
	<script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'useradmin', 'table'], function(){
    var $ = layui.$
    ,form = layui.form
    ,admin = layui.admin
    ,table = layui.table;
    
    //监听搜索
    form.on('submit(LAY-user-front-search)', function(data){
      var field = data.field;
      
      //执行重载
      table.reload('LAY-user-manage', {
        where: field
      });
    });
  
    //事件
    var active = {
      batchdel: function(){
        var checkStatus = table.checkStatus('LAY-user-manage')
        ,checkData = checkStatus.data; //得到选中的数据
 
        if(checkData.length === 0){
          return layer.msg('请选择数据');
        }else{
        	var ids=[];
          for(i=0;i<checkData.length;i++){
          	ids.push(checkData[i].id);
          }
       
          layer.confirm('确定删除吗？', function(index) {
            
            //执行 Ajax 后重载
            admin.req({
              url: 'http://localhost:8181/deluserbyuserid'
              ,data:{ids:ids}
		        ,type:'get'
		        ,traditional: true
		        ,success:function(res){
		        	console.log(res);
		        	table.reload('LAY-user-manage');
            	layer.msg('已删除');
		        }
            });
          });
    
          
        }
        	
        

      }
      ,add: function(){
        layer.open({
          type: 2
          ,title: '添加用户'
          ,content: 'addUser.html'
          ,maxmin: true
          ,area: ['500px', '450px']
          ,btn: ['确定', '取消']
          ,yes: function(index, layero){
            var iframeWindow = window['layui-layer-iframe'+ index]
            ,submitID = 'LAY-user-front-submit'
            ,submit = layero.find('iframe').contents().find('#LAY-user-front-submit');
						submit.click();
/*            //监听提交
            iframeWindow.layui.form.on('LAY-user-front-submit'), function(data){
              var field = data.field; //获取提交的字段
              
              //提交 Ajax 成功后，静态更新表格中的数据
              //$.ajax({});
              table.reload('LAY-user-manage'); //数据刷新
              layer.close(index); //关闭弹层
            });  */
            
            //submit.trigger('click');
          }
        }); 
      }
    };
    
    $('.layui-btn.layuiadmin-btn-useradmin').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
  });
  </script>
</body>
</html>
