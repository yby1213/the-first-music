<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>商品列表</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/template.css" media="all">
</head>
<body>


<div class="layui-fluid layadmin-cmdlist-fluid">
  <div class="layui-row layui-col-space30" style="width: 100%;">
	<p id="model"></p>
  </div>
</div>


	<script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index']);
  layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer
  ,newHeml="";
  
  $.ajax({
  	type:"get",
  	url: 'http://localhost:8181/getuserlistbypage?defaultRole=1&page=1&limit=100'
  	,success: function(req){
  		console.log(req);
  		for(var i=0;i<req.data.length;i++){
  			
  			newHeml+="<div class=\"layui-col-md2 layui-col-sm3\" style=\"padding:auto;\"><div class=\"cmdlist-container\"><img src='"+req.data[i].userPic+"' style=\"width: 200px;height: 200px;\" ><div class=\"cmdlist-text\"><p class=\"info\">"+req.data[i].userName+"</p><b>"+req.data[i].phone+"</b></div></div></div>";

  			//alert(req.data[i].userPic);
  		}
  		$("#model").append(newHeml);
  	}
  	
  });
  //总页数低于页码总数
  laypage.render({
    elem: 'demo0'
    ,count: 50 //数据总数
  });
});
  </script>

</body>
</html>