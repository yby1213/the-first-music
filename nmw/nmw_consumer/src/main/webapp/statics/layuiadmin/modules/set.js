/**

 @Name：layuiAdmin（iframe版） 设置
 @Author：贤心
 @Site：http://www.layui.com/admin/
 @License: LPPL
    
 */
 
layui.define(['form', 'upload'], function(exports){
  var $ = layui.$
  ,layer = layui.layer
  ,laytpl = layui.laytpl
  ,setter = layui.setter
  ,view = layui.view
  ,admin = layui.admin
  ,form = layui.form
  ,upload = layui.upload;

  var $body = $('body');
  
  //自定义验证
  form.verify({
    nickname: function(value, item){ //value：表单的值、item：表单的DOM对象
      if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
        return '用户名不能有特殊字符';
      }
      if(/(^\_)|(\__)|(\_+$)/.test(value)){
        return '用户名首尾不能出现下划线\'_\'';
      }
      if(/^\d+\d+\d$/.test(value)){
        return '用户名不能全为数字';
      }
    }
    
    //我们既支持上述函数式的方式，也支持下述数组的形式
    //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    
    //确认密码
    ,repass: function(value){
      if(value !== $('#LAY_password').val()){
        return '两次密码输入不一致';
      }
    }
  });
  
  //网站设置
  form.on('submit(set_website)', function(obj){
    layer.msg(JSON.stringify(obj.field));
    
    //提交修改
    /*
    admin.req({
      url: ''
      ,data: obj.field
      ,success: function(){
        
      }
    });
    */
    return false;
  });
  
  //邮件服务
  form.on('submit(set_system_email)', function(obj){
    layer.msg(JSON.stringify(obj.field));
    
    //提交修改
    /*
    admin.req({
      url: ''
      ,data: obj.field
      ,success: function(){
        
      }
    });
    */
    return false;
  });
  

  
  
  //设置我的资料
  form.on('submit(setmyinfo)', function(obj){
    layer.msg(JSON.stringify(obj.field));
    
    admin.req({
      url: 'http://localhost:8181/modifyuserbyadmin?user_id='+localStorage.getItem("user_id")
      ,data: obj.field
      ,success: function(res){
          console.log(res);
       console.log(obj.field);
       layer.msg("成功");
      },error: function (res) {
        layer.msg("失败了");
      }
    });
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
        window.location.reload();
      }
    });

    $(function () {
      $( "#userName" ).attr("value",localStorage.getItem("userName"));
      $( "#adminPic" ).attr("src",localStorage.getItem("userPic"));
      $( "#LAY_avatarSrc" ).attr("value",localStorage.getItem("userPic"));
      $( "#phone" ).attr("value",localStorage.getItem("phone"));
    })
    return true;
  });

  //上传头像
  var avatarSrc = $('#LAY_avatarSrc');
  upload.render({
    url: 'http://localhost:8181/upload/img?index=img'
    ,elem: '#LAY_avatarUpload'
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
  
  //查看头像
  admin.events.avartatPreview = function(othis){
    var src = avatarSrc.val();
    layer.photos({
      photos: {
        "title": "查看头像" //相册标题
        ,"data": [{
          "src": src //原图地址
        }]
      }
      ,shade: 0.01
      ,closeBtn: 1
      ,anim: 5
    });
  };
  
  
  //设置密码
  form.on('submit(setmypass)', function(obj){
    layer.msg(JSON.stringify(obj.field));
    
    admin.req({
      url: 'http://localhost:8181/modifypasswordbyadmin?phone='+localStorage.getItem("phone")
      ,data: obj.field
      ,success: function(res){
       console.log(res);
       console.log(obj.field);
       if (res.status==1){
           layer.msg("成功");
           //localStorage.setItem("password",obj.field.newPassword);
       }else {
           layer.msg("原密码错误");
       }
      }
    });
        return false;
  });
  
  //对外暴露的接口
  exports('set', {});
});