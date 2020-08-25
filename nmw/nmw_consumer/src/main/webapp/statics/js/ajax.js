$(function(){
partSongs=$("#partSongs");
partSongs2=$("#partSongs2");
allSongs=$("#allSongs");
allSongs2=$("#allSongs2");
sheetItem=$("#sheetItem");
orderList=$("#orderList");
    $.ajax({
        type:"GET",//请求类型
        url:"/listPartSongs",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            if(data != null){
                partSongs.html("");
                var options = "";
                for(var i = 0; i < data.length; i++){
                    options +=  "<li>"+
                        "<a href=\"#\">"+
                        "<h4>"+data[i].id+"</h4>"+
                        "<div class='song-detail' data-src="+data[i].song_url+">"+
                        "<img src="+data[i].song_pic+"><p>"+
                        "<span class='song-name'>"+data[i].song_name+"</span>"+
                        "<span class='song-singer'>"+data[i].song_singer+"</span>"+
                        "</p></div> </a> </li>";
                }
                partSongs.html(options);
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
        }
    });

    $.ajax({
        type:"GET",//请求类型
        url:"/listPartSongs2",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            if(data != null){
                partSongs2.html("");
                var options = "";
                for(var i = 0; i < data.length; i++){
                    options +=  "<li>"+
                        "<a href=\"#\">"+
                        "<h4>"+data[i].id+"</h4>"+
                        "<div class='song-detail' data-src="+data[i].song_url+" >"+
                        "<img src="+data[i].song_pic+"><p>"+
                        "<span class='song-name'>"+data[i].song_name+"</span>"+
                        "<span class='song-singer'>"+data[i].song_singer+"</span>"+
                        "</p></div> </a> </li>";
                }
                partSongs2.html(options);
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
        }
    });




//最新前五首
    $.ajax({
        type:"GET",//请求类型
        url:"/listOrderSongs",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            if(data != null){
                orderList.html("");
                var options = "";
                for(var i = 0; i < data.length; i++){
                    options +=  "<li>"+
                        "<a href=\"#\">"+
                        "<h4>"+data[i].id+"</h4>"+
                        "<div class='song-detail' data-src="+data[i].song_url+">"+
                        "<img src="+data[i].song_pic+"><p>"+
                        "<span class='song-name'>"+data[i].song_name+"</span>"+
                        "<span class='song-singer'>"+data[i].song_singer+"</span>"+
                        "</p></div> </a> </li>"
                }
                orderList.html(options);
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
        }
    });

//展示所有歌曲
    $.ajax({
        type:"GET",//请求类型
        url:"/listAllSongs",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            if(data != null){
                allSongs.html("");
                var options = "";
                for(var i = 0; i < data.length; i++){
                    options +=  "<li>"+
                        "<a href=\"#\">"+
                        "<h4>"+data[i].id+"</h4>"+
                        "<div class='song-detail' data-src="+data[i].song_url+">"+
                        "<img src="+data[i].song_pic+"><p>"+
                        "<span class='song-name'>"+data[i].song_name+"</span>"+
                        "<span class='song-singer'>"+data[i].song_singer+"</span>"+
                        "</p></div> </a> </li>"
                }
                allSongs.html(options);
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
        }
    });



    $.ajax({
        type:"GET",//请求类型
        url:"/listAllSongs2",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            if(data != null){
                allSongs2.html("");
                var options = "";
                for(var i = 0; i < data.length; i++){
                    options +=  "<li>"+
                        "<a href=\"#\">"+
                        "<h4>"+data[i].id+"</h4>"+
                        "<div class='song-detail' data-src="+data[i].song_url+">"+
                        "<img src="+data[i].song_pic+"><p>"+
                        "<span class='song-name'>"+data[i].song_name+"</span>"+
                        "<span class='song-singer'>"+data[i].song_singer+"</span>"+
                        "</p></div> </a> </li>"
                }
                allSongs2.html(options);
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
        }
    });

})