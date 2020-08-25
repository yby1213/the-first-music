<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>设置我的资料</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/admin.css" media="all">
</head>
<body>

  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">设置我的资料</div>
          <div class="layui-card-body" pad15>
            
            <div class="layui-form" lay-filter="" >

              <div class="layui-form-item" >
                <label class="layui-form-label">我的角色</label>
                <div class="layui-input-inline">
                  <select name="userRole" lay-verify="">
                    <option value="1" selected>管理员</option>
                    <option value="2" disabled>用户</option>
                    <option value="3" disabled>vip用户</option>
                  </select> 
                </div>
                
              </div>
              
              <div class="layui-form-item" style="display: inline-block;" >
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                  <input type="text" id="userName" name="userName" value="" lay-verify="nickname" autocomplete="off" placeholder="请输入昵称" class="layui-input">
                </div>
              </div>
            
                 <!--头像-->
                  <img id="adminPic" src="" height="100px" style="margin-top: -100px;">
              <div class="layui-form-item">
                <label class="layui-form-label">头像</label>
                <div class="layui-input-inline">
                  <input name="userPic"  lay-verify="required" id="LAY_avatarSrc" placeholder="图片地址" value="" class="layui-input">
                </div>
                <div class="layui-input-inline layui-btn-container" style="width: auto;">
                  <button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                  </button>
                  <button class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
                </div>
             </div>



                  <input type="text"id="phone" hidden="hidden" name="phone" value="" >

              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                </div>
              </div>
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
  }).use(['index', 'set']);
  </script>
  <script>
    $(function () {
      $.ajax({
        type:"get"
        ,url:'http://localhost:8181/getadminone?phone='+localStorage.getItem("phone")
        ,success: function(res){
          console.log(res);
          localStorage.setItem("user_id",res.data[0].id);
          localStorage.setItem("userName",res.data[0].userName);
          localStorage.setItem("userPic",res.data[0].userPic);
          localStorage.setItem("userRole",res.data[0].userRole);
          localStorage.setItem("phone",res.data[0].phone);
        }
      });

      $( "#userName" ).attr("value",localStorage.getItem("userName"));
      $( "#adminPic" ).attr("src",localStorage.getItem("userPic"));
       $( "#LAY_avatarSrc" ).attr("value",localStorage.getItem("userPic"));
      $( "#phone" ).attr("value",localStorage.getItem("phone"));
    })
  </script>
</body>
</html>