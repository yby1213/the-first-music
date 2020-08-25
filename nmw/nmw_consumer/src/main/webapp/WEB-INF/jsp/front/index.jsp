<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>第一音乐</title>
    <link rel="shortcut icon" href="../../../statics/imgs/logonew.jpg">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/statics/style/font_ncm3bwvbw3vdkj4i/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/style/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/style/main.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/statics/node_modules/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
</head>
<body>
<div class="container">
    <!-- 头部开始 -->
    <header class="clearfix">
        <!-- logo开始 -->
        <div class="logo fl">
            <a href="${pageContext.request.contextPath}/adminIndex.html"><img src="../../../statics/imgs/logonew.jpg"></a>
        </div>
        <!-- 搜索框开始 -->
        <div class="search fl">
            <form class="search-form">
                <input class="search-txt" type="text" placeholder="搜索音乐，歌手">
                <button class="search-bt" type="submit"></button>
            </form>
        </div>
        <!-- 头部右侧开始 -->
        <ul class="head-right fr">
            <!-- 登录开始 -->
            <li class="right-login">
                <a href="#">
                    <span class="username"><img src="${userSession.userPic}"/> ${userSession.userName}</span><i
                        class="triangle"></i>
                </a>
                <!-- 登录面板开始 -->
                <div class="login-panel">
                    <div class="panel-head">
                        <div class="panel-head-top">
                            <a class="user" href="#"><img src="${userSession.userPic}"/> ${userSession.userName}
                            </a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="body-item">
                            <ul>
                                <li>
                                   <%-- <a href="http://localhost:8182/index.html" target="_blank">--%>
                                       <a id="testHref" target="_blank">
                                           <script>
                                               document.getElementById("testHref").href="http://localhost:8182/index.html?user_id="+localStorage.getItem("user_id");
                                           </script>
                                        <i class="iconfont icon-huiyuanfuwu"></i>
                                        <input type="hidden" id="identity" value="${userSession.userRole}"/>
                                        <span>会员中心</span>
                                        <span class="item-right fr"><b>&gt;</b></span>
                                    </a>
                                </li>
                                <!--<li>
                                    <a href="#">
                                        <i class="iconfont icon-level"></i>
                                        <span>等级</span>
                                        <span class="item-right fr"><em>Lv.5 </em><b>&gt;</b></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="iconfont icon-gouwuche"></i>
                                        <span>积分商城</span>
                                        <span class="item-right fr">10积分 <b>&gt;</b></span>
                                    </a>
                                </li>-->
                            </ul>
                        </div>
                        <div class="body-item">
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath }/getUserByName">
                                        <i class="iconfont icon-shezhi"></i>
                                        <span>个人信息设置</span>
                                        <span class="item-right fr"><b>&gt;</b></span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                        <div class="body-item">
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath }/enLogin.html">
                                        <i class="iconfont icon-tuichu"></i>
                                        <span>切换用户</span>
                                        <span class="item-right fr"><b>&gt;</b></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <a href="#"><i class="iconfont icon-shezhi"></i></a>
            </li>
        </ul>
    </header>
    <!-- 主体开始 -->
    <div class="main">
        <div class="main-left-wrap">
            <!-- 左侧列表开始 -->
            <div class="main-left">
                <dl class="left-item">
                    <dt>推荐</dt>
                    <dd class="find active dd-item" data-index="0">发现音乐</dd>
                </dl>

                <dl class="left-item left-create-list">
                    <dt>创建的歌单
                        <img class="add" src="../../../statics/imgs/add.png" alt="添加" title="新建歌单">
                        <img class="down" src="../../../statics/imgs/down.png" alt="下拉" title="展开">
                    </dt>
                    <dd class="likeMusic dd-item" data-index="8" onclick="likeMusic()">我喜欢的音乐</dd>
                    <dd class="create-input">
                        <form><input type="text" placeholder="歌单名称" autofocus autocomplete="off"></form>
                    </dd>
                    <div class="new-create-tit">
                    </div>
                </dl>
                <dl class="left-item" id="sheetItem">
                    <dt>收藏的歌单</dt>
                    <c:forEach var="sheet" items="${sheetList}" varStatus="status">
                        <dd class="songs dd-item" data-index="9"><span class="sheetName"
                          onclick="songList($(this).text())">${sheet.sheet_name }</span>
                        </dd>

                        <%--<dd class="songs dd-item" data-index="10">华语‖一听就忍不住想哭的歌</dd>--%>
                    </c:forEach>

                </dl>
            </div>
            <!-- 右键显示歌单 -->
            <ul class="tit-menu" id="like-menu">
                <li class="play">播放(Enter)</li>
                <li class="next">下一首播放</li>
                <li class="share">分享</li>
                <li class="copy">复制链接</li>
                <li class="loadAll">下载全部</li>
            </ul>
            <ul class="tit-menu" id="new-menu">
                <li class="play">播放(Enter)</li>
                <li class="next">下一首播放</li>
                <li class="share">分享</li>
                <li class="copy">复制链接</li>
                <li class="loadAll">下载全部</li>
                <li class="edit">编辑歌单信息</li>
                <li class="delete">删除歌单</li>
            </ul>
            <!-- 左侧底部播放信息 -->
            <div class="song-play">
                <img class="song-img" id="songImg"
                     src="http://p1.music.126.net/rMMa4M0eSjKpCeBEhA6wBA==/1407374885533603.jpg">
                <p>
                    <span class="song-name" id="songName"></span><br>
                    <span class="song-singer" id="songSinger"></span>
                </p>
            </div>
        </div>
        <!-- 主体右侧开始 -->
        <div class="main-right">
            <!-- 发现音乐 -->
            <div class="right-sup main-right-findMusic" data-index="0">
                <!-- 右侧导航开始 -->
                <div class="right-nav">
                    <ul class="clearfix">
                        <li><a class="active" data-index="0" href="#">个性推荐</a></li>
                        <li><a data-index="1" href="#" id="a1">歌单</a></li>
                        <li><a data-index="2" href="#">排行榜</a></li>
                        <li><a data-index="3" href="#" id="a4">最新音乐</a></li>
                    </ul>
                </div>
                <!-- 个性推荐开始 -->
                <div class="main-right-item personal-recom">
                    <!-- 轮播图开始 -->
                    <div class="poster">
                        <div class="poster-bt poster-bt-prev"></div>
                        <div class="poster-bt poster-bt-next"></div>
                        <ul class="poster-list">
                            <li><a href="#"><img src="../../../statics/imgs/banner/banner1.jpg" alt="广告"></a></li>
                            <li><a href="#"><img src="../../../statics/imgs/banner/banner2.jpg" alt="广告"></a></li>
                            <li><a href="#"><img src="../../../statics/imgs/banner/banner3.jpg" alt="广告"></a></li>
                            <li><a href="#"><img src="../../../statics/imgs/banner/banner4.jpg" alt="广告"></a></li>
                            <li><a href="#"><img src="../../../statics/imgs/banner/banner5.jpg" alt="广告"></a></li>
                            <li><a href="#"><img src="../../../statics/imgs/banner/banner6.jpg" alt="广告"></a></li>
                            <li><a href="#"><img src="../../../statics/imgs/banner/banner7.jpg" alt="广告"></a></li>
                        </ul>
                    </div>
                    <!-- 推荐歌单开始 -->
                    <div class="recommend-item recommend-song">
                        <div class="item-tit clearfix">
                            <h3>推荐歌单</h3>
                            <span><a href="" onclick="changeNav1();return false">更多&gt;</a></span>
                        </div>
                        <div class="item-cont">
                            <ul class="song-list clearfix" id="getSheetList">
                                <li>
                                    <div class="list-item">
                                        <a href="" onclick="changeSonglist();return false">
                                            <p class="list-item-top">根据您的音乐口味生成每日更新</p>
                                            <span class="week"></span>
                                            <span class="day"></span>
                                        </a>
                                    </div>
                                    <p class="list-item-tit">每日歌曲推荐</p>
                                </li>
                                <c:forEach var="sheet" items="${listPartSheet}">
                                    <li>
                                        <div class="list-item">
                                            <p class="list-item-top">根据你喜欢的单曲《富士山下》推荐</p>
                                            <span class="list-item-ic">${sheet.sheet_collect}</span>
                                            <a href="#"><img src="${sheet.sheet_pic}"></a>
                                        </div>
                                        <p class="list-item-tit">${sheet.sheet_name}</p>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>
                    </div>
                    <!-- 最新音乐开始 -->
                    <div class="recommend-item new-song">
                        <div class="item-tit clearfix">
                            <h3>推荐音乐</h3>
                            <span><a href="" onclick="changeNav4();return false">更多&gt;</a></span>
                        </div>
                        <div class="item-cont">
                            <ul class="song-list" id="partSongs">
                            </ul>
                            <ul class="song-list" id="partSongs2">
                            </ul>
                        </div>
                    </div>


                </div>
                <!--歌单导航内容开始-->
                <div class="main-right-item songs-list">
                    <div class="recommend-item recommend-song">
                        <div class="item-cont">
                            <ul class="song-list clearfix">
                                <li>
                                    <div class="list-item">
                                        <a href="#">
                                            <p class="list-item-top">根据您的音乐口味生成每日更新</p>
                                            <span class="week"></span>
                                            <span class="day"></span>
                                        </a>
                                    </div>
                                    <p class="list-item-tit">每日歌曲推荐</p>
                                </li>
                                <c:forEach var="sheet" items="${listSheet}">
                                    <li>
                                        <div class="list-item">
                                            <p class="list-item-top">根据你喜欢的单曲《富士山下》推荐</p>
                                            <span class="list-item-ic">${sheet.sheet_collect}</span>
                                           <img src="${sheet.sheet_pic}" >
                                        </div>
                                        <p class="list-item-tit"><span id="sheetNames" onclick="sheetLike($(this).text())">${sheet.sheet_name}</span></p>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                </div>
                <!--排行榜导航内容开始-->
                <div class="main-right-item ranking-list">
                    <div class="recommend-item new-song">
                        <div class="item-cont">
                            <ul class="song-list" id="orderList">

                            </ul>
                        </div>
                    </div>
                </div>

                <!--最新音乐导航内容开始-->
                <div class="main-right-item newsong-list">
                    <div class="recommend-item new-song">
                        <div class="item-cont">
                            <ul class="song-list" id="allSongs">

                            </ul>
                            <ul class="song-list" id="allSongs2">
                            </ul>
                        </div>
                    </div>



                </div>
            </div>
            <!-- 我喜欢的音乐 -->
            <div class="right-sup main-right-songList like-list hide" data-index="8">
                <div class="songList-top clearfix">
                    <div class="img-left">
                        <img class="girl" src="../../../statics/imgs/song/zb2.jpg" alt="背景">
                        <img class="heart" src="../../../statics/imgs/like2.png" alt="背景">
                    </div>
                    <div class="info-right">
                        <div><span class="info-list">歌单</span>&nbsp;&nbsp;<span class="songListName1">我喜欢的音乐</span></div>
                        <div class="create-info">&nbsp;&nbsp;<span class="userName1">${userSession.userName}</span>&nbsp;<span
                                class="createTime1">2016-12-11创建</span></div>
                    </div>
                    <span class="listNum">7</span>
                </div>
                <div class="song-list-nav">
                    <ul class="clearfix">
                        <li><a class="active" data-index="0" href="#">歌曲列表</a></li>
                        <!--<li><a data-index="1" href="#">评论</a></li>
                        <li><a data-index="2" href="#">收藏者</a></li>-->
                    </ul>
                </div>
                <div class="songList-tb search-result">
                    <table id="show_table">
                        <tr class="result-head">
                            <th class="operate">操作</th>
                            <th class="name">音乐标题</th>
                            <th class="singer">歌手</th>
                            <th class="album">专辑</th>
                        </tr>
                    </table>
                </div>
            </div>
            <!-- 新创建的歌单 -->
            <div class="new-create-list">
            </div>
            <!-- 收藏的歌单1 -->
            <div class="right-sup main-right-songList hide" data-index="9">
                <div class="songList-top clearfix">
                    <div class="img-left">
                        <img class="girl" src="../../../statics/imgs/song/zgr.jpg" alt="背景">
                    </div>
                    <div class="info-right">
                        <div><span class="info-list">歌单</span><span class="songListName"></span></div>
                        <div class="create-info">&nbsp;&nbsp;<span class="userName"></span><span class="createTime"></span></div>
                    </div>
                    <span class="listNum">7</span>
                </div>
                <div class="song-list-nav">
                    <ul class="clearfix">
                        <li><a class="active" data-index="0" href="#">歌曲列表</a></li>
                        <!--<li><a data-index="1" href="#">评论</a></li>
                        <li><a data-index="2" href="#">收藏者</a></li>-->
                    </ul>
                </div>
                <div class="songList-tb search-result">
                    <table class="table1" id="table1">
                        <tr class="result-head">
                            <th class="operate">操作</th>
                            <th class="name">音乐标题</th>
                            <th class="singer">歌手</th>
                            <th class="album">专辑</th>
                        </tr>


                    </table>
                </div>
            </div>
            <!-- 收藏的歌单2 -->
            <div class="right-sup main-right-songList hide" data-index="10">
                <div class="songList-top clearfix">
                    <div class="img-left">
                        <img class="girl" src="../../../statics/imgs/song/mm2.jpg" alt="背景">
                    </div>
                    <div class="info-right">
                        <div><span class="info-list">歌单</span><span class="songListName"></span></div>
                        <div class="create-info"><span class="userName"></span><span class="createTime"></span></div>
                    </div>
                    <span class="listNum">0</span>
                </div>
                <div class="song-list-nav">
                    <ul class="clearfix">
                        <li><a class="active" data-index="0" href="#">歌曲列表</a></li>
                        <!--<li><a data-index="1" href="#">评论</a></li>
                        <li><a data-index="2" href="#">收藏者</a></li>-->
                    </ul>
                </div>
                <div class="songList-tb search-result">
                    <table>
                        <tr class="result-head">
                            <th class="operate">操作</th>
                            <th class="name">音乐标题</th>
                            <th class="singer">歌手</th>
                            <th class="album">专辑</th>
                        </tr>
                    </table>
                </div>
            </div>
            <!-- 搜索界面 -->
            <div class="right-sup main-right-search hide">
                <div class="search-tit">
                    <p>搜索<span class="search-text">""</span>，找到<span class="search-songsNum"></span>首单曲
                    </p>
                </div>
                <div class="search-nav">
                    <ul class="clearfix">
                        <li><a class="active" data-index="0" href="#">单曲</a></li>
                        <li><a data-index="1" href="#">歌手</a></li>

                    </ul>
                </div>
                <div class="search-result search-item" id="search-result"></div>
                <div class="search-singer search-item">

                </div>

            </div>
            <!-- 歌单详细信息 -->
            <div class="list-detail-container hide"></div>
            <!-- 提示信息 -->
            <div class="remind-msg hide">
                <p>已添加到我喜欢的音乐</p>
            </div>
        </div>
    </div>
    <!-- 尾部开始 -->

    <footer>
        <!-- audio -->
        <audio id="audio">
            <source id="iiii" class="inherent" src="../../..\uploadFile\mp3\1fd1e47.mp3"
                                              data-img="../../..\uploadFile\img\2e1aa55c.jpg" data-name="为你写诗"
                                              data-singer="汪苏泷">
            <source class="inherent" src="../../..\uploadFile\mp3\8caea237.mp3"
                    data-img="../../..\uploadFile\img\877cebaf.jpg" data-name="北木南"
                    data-singer="小嘉玲">
            <source class="inherent" src="../../..\uploadFile\mp3\2936ec1c.mp3"
                    data-img="../../..\uploadFile\img\376fdd93.jpg" data-name="白羊"
                    data-singer="徐秉龙">
            <source class="inherent" src="../../..\uploadFile\mp3\640ab3b3.mp3"
                    data-img="../../..\uploadFile\img\a6a86e3e.jpg" data-name="一口气写完的歌"
                    data-singer="蒋铭杨">
            <source class="inherent" src="../../..\uploadFile\mp3\78d59064.mp3"
                    data-img="../../..\uploadFile\img\5b8e2ee6.jpg" data-name="失忆"
                    data-singer="野小马">
            <source class="inherent" src="../../..\uploadFile\mp3\2dbdbea8.mp3"
                    data-img="../../..\uploadFile\img\42352947.jpg" data-name="Lemon"
                    data-singer=" 多多poi">
            <source class="inherent" src="../../..\uploadFile\mp3\85c03297.mp3"
                    data-img="../../..\uploadFile\img\239aa57c.jpg" data-name="稚梦"
                    data-singer=" 九一川">


        </audio>
        <!-- 底部播放器 -->
        <div class="audio-play clearfix">
            <!-- 左侧按钮组 -->
            <div class="play-left" >
                <img class="prev" src="../../../statics/imgs/song/prev2.png" alt="上一首" title="上一首">
                <img class="play" src="../../../statics/imgs/song/play.png" alt="播放" title="播放">
                <img class="next" src="../../../statics/imgs/song/next2.png" alt="下一首" title="下一首">
            </div>
            <!-- 中间播放信息 -->
            <div class="play-mid">
                <span class="play-time"><span class="m">00:</span><span class="s">00</span></span>
                <span class="progress">
   <span class="buffered"></span>
   <span class="played"></span>
   <i class="progress-bt"></i>
</span>
                <span class="end-time"><span class="m">00:</span><span class="s">00</span></span>
            </div>
            <!-- 调节音量,循环模式,显示播放列表 -->
            <div class="play-right">
                <img class="voice-bt" src="../../../statics/imgs/song/voice.png" alt="音量" title="静音">
                <span class="voice">
   <span class="voice-pro"></span>
   <i class="progress-bt"></i>
</span>
                <img class="circulation" src="../../../statics/imgs/song/xunhuan1.png" alt="循环" title="列表循环">
                <img class="playedList-Bt" src="../../../statics/imgs/song/playList.png" alt="列表" title="播放列表">
            </div>
            <!-- 播放列表 -->
            <div class="played-list hide" id="played-list">
                <h3><span>播放列表</span><i class="close"></i></h3>
                <div class="song-list">
                    <div class="list-tit clearfix">
                       <%-- <span>总<span class="list-num">0</span>首</span>--%>
                        <span class="clear"><i></i><span>清空</span></span>
                    </div>
                    <div class="list-detail">
                        <table>


                        </table>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

<script src="${pageContext.request.contextPath }/statics/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/statics/node_modules/malihu-custom-scrollbar-plugin/
jquery.mCustomScrollbar.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/util.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/player.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/carousel.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/search.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/myFavorateSongs.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/playList.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/contextMenu.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/panel.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/createSongList.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/main.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/ajax.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/sheetList.js"></script>
<script language="javascript">

    function getUrlVars() {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }
    var params = getUrlVars();

    //查询表头的userName
    var userName=decodeURI(params.userName)
    console.log(userName);
    $.ajax({
        type:"get"
        ,url:'http://localhost:8181/getadminone?phone='+userName/*+'&user_id='+localStorage.getItem("user_id")*/
        ,success: function(res){
            console.log(res);
            localStorage.setItem("user_id",res.data[0].id);
            localStorage.setItem("userName",res.data[0].userName);
            localStorage.setItem("userPic",res.data[0].userPic);
            localStorage.setItem("userRole",res.data[0].userRole);
            localStorage.setItem("phone",res.data[0].phone);
            console.log(localStorage.getItem("user_id"));
        }
    });
    $.ajax({
        type:"get"
        ,url:'http://localhost:8181/getuserpay?user_id='+localStorage.getItem("user_id")
        ,success: function(res){
            console.log(res);
            localStorage.setItem("expiration_time",res.data[0].expiration_time);
            console.log(localStorage.getItem("expiration_time"));
        }
    });
</script>
</body>
</html>

