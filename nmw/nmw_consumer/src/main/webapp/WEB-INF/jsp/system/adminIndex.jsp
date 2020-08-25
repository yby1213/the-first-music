<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>后台</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../../statics/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../../statics/layuiadmin/style/admin.css" media="all">
  
</head>
<body class="layui-layout-body">
  
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search" layadmin-event="serach" lay-action="search.html?keywords="> 
          </li>
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          
          <li class="layui-nav-item" lay-unselect>
            <a lay-href="#" layadmin-event="message" lay-text="消息中心">
              <i class="layui-icon layui-icon-notice"></i>  
              
              <!-- 如果有新消息，则显示小圆点 -->
              <span class="layui-badge-dot"></span>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="theme">
              <i class="layui-icon layui-icon-theme"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="note">
              <i class="layui-icon layui-icon-note"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="fullscreen">
              <i class="layui-icon layui-icon-screen-full"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <cite><p id="adminName"></p></cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a lay-href="adminInfo.html">基本资料</a></dd>
              <dd><a lay-href="adminPassword.html">修改密码</a></dd>
              
              <hr>
              <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd>
            </dl>
          </li>
          
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="homepage.html">
            <span>第一音乐</span>
          </div>

          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="homepage" class="layui-this">
                  <a lay-href="homepage.html">主页</a>
                </dd>
                <dd><a lay-href="adminInfo.html">基本资料</a></dd>
              	<dd><a lay-href="adminPassword.html">修改密码</a></dd> 
              </dl>
            </li>
            
            <li data-name="app" class="layui-nav-item">
              <a href="javascript:;" lay-tips="管理" lay-direction="2">
                <i class="layui-icon layui-icon-app"></i>
                <cite>管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="content">
										<dd data-name="listSong"><a lay-href="listSong.html" lay-text="">歌曲列表</a> </dd>
                    <dd data-name="listSong"><a lay-href="listSheet.html">歌单列表</a></dd>
                    <dd data-name="list"><a lay-href="listSongsList.html">歌单管理</a></dd>
                </dd>
              </dl>
            </li>
            
            <li data-name="user" class="layui-nav-item">
              <a href="javascript:;" lay-tips="用户" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>用户</cite>
              </a>
              <dl class="layui-nav-child">
              	<dd><a lay-href="listAdmin.html">管理员列表</a></dd>
                <dd>
                  <a lay-href="listUser.html">网站用户</a>
                </dd>
              </dl>
            </li>
            <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="附加功能" lay-direction="2">
                <i class="layui-icon layui-icon-set"></i>
                <cite>附加功能</cite>
              </a> 
              <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath }/adminReg.html" target="_blank">注册</a></dd>
                <dd><a href="${pageContext.request.contextPath }/adminLogin1.html" target="_blank">登入</a></dd>
                <dd><a href="${pageContext.request.contextPath }/adminForget.html" target="_blank">忘记密码</a></dd>
                <dd><a lay-href="${pageContext.request.contextPath }/404.html">404页面不存在</a></dd>
                <dd><a lay-href="${pageContext.request.contextPath }/error.html">错误提示</a></dd>
            </dl>
            </li>
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="homepage.html" lay-attr="homepage.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="homepage.html" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="../../../statics/layuiadmin/layui/layui.js"></script>
  <script src="../../../statics/js/jquery-3.5.1.js"></script>
  <script>
  layui.config({
    base: '../../../statics/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index');
  </script>

  <script>
  		//localStorage.clear();
  	//localStorage.setItem("phone",13738180192);
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
          $("#adminName").html( localStorage.getItem("userName"));
      }
  });
  </script>
  <script>
  	   if(localStorage.getItem("phone")==null){
        console.log(localStorage.getItem("phone"));
        window.location.href="error.html";
      }else {
        console.log("登录成功");
      }
  </script>
</body>
</html>


