function songList(obj){
    $.ajax({
        type:"Post",
        url:"listSongs",
        data:{sheetName:obj},
        dataType:"json",
        success:function(data){
            if(data !=null){
                $.ajax({
                    type:"Post",
                    url:"listSheet",
                    data:{sheetName:obj},
                    dataType: "json",
                    success:function (data) {
                        if (data!=null){
                            $(".songListName").html(data.sheet_name);
                            $(".userName").html(data.sheet_name);
                            $(".createTime").html(data.creationDate);
                            $(".girl111").attr("src",data.sheet_pic);
                            /*$(".girl").src = data.sheetPic;*/
                        }
                    },
                    error:function (xhr, textStatus, errorThrown) {
                       /* alert("进入error---");
                        alert("状态码："+xhr.status);
                        alert("状态:"+xhr.readyState);
                        alert("错误信息:"+xhr.statusText );
                        alert("返回响应信息："+xhr.responseText );//这里是详细的信息
                        alert("请求状态："+textStatus);
                        alert(errorThrown);
                        alert("请求失败");*/
                    }
                })
                for (let a = 0 ; a<data.length;a++){
                    /*var c = document.getElementsByClassName("num1");
                    c.innerHTML = data[a].songSinger;
                    var b = document.getElementsByClassName("num2");
                    b.innerHTML = data[a].songName;*/
                    if(a == 0){
                        $(".trNum").empty();
                    }
                    var dom = "<tr data-src="+data[a].song_url+" data-img="+data[a].song_pic+" class='trNum'>"+
                        ' <td><span class="num">'+a + '</span><i class="iconfont icon-xihuan" onclick="like()"></i></td>'+
                        '<td> <span class="song-name" id="song">'+data[a].song_name + '</span></td>'+
                        '<td ><span class="song-singer" onclick="songStart($(this).text())" >'+ data[a].song_singer+ '</span></td>'+
                        ' <td>未收录的单曲</td>'+ '</tr>';

                    $(".num1").html(data[a].songSinger);
                    $(".num2").html(data[a].songName);
                    if(a<=data.length){
                        $(".result-head").after(dom);
                    }
                }
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            /*alert("进入error---");
            alert("状态码："+xhr.status);
            alert("状态:"+xhr.readyState);
            alert("错误信息:"+xhr.statusText );
            alert("返回响应信息："+xhr.responseText );//这里是详细的信息
            alert("请求状态："+textStatus);
            alert(errorThrown);
            alert("请求失败");*/
        }
    });
}
function songStart(obj) {
    var obj = document.getElementById("song").innerText;
    $.ajax({
        type:"Post",
        url:"songStart",
        data:{songName:obj},
        success:function (data) {
            /*$(this).parent().src=data;*/
            /*$(".inherent").src = data;*/
            /*$("#iiii").setAttribute(src,data);*/
            /*$(".audio1").children(":first-of-type").click(function(){
                alert("ss");
            })*/
            /*let source = require(data);*/
            var dom = "<source class='inherent' id='1' src="+data.song_url+" data-img="+data.song_pic+ "data-name="+data.song_name+" data-singer="+data.song_singer+">";
            $("#iiii").before(dom);

        },
        error:function (xhr, textStatus, errorThrown) {
           /* alert("进入error---");
            alert("状态码："+xhr.status);
            alert("状态:"+xhr.readyState);
            alert("错误信息:"+xhr.statusText );
            alert("返回响应信息："+xhr.responseText );//这里是详细的信息
            alert("请求状态："+textStatus);
            alert(errorThrown);
            alert("请求失败");*/
        }
    })

}
function like() {
    /*songName1 = $(this).parent().next().next().children().html();*/
    songName1 = document.getElementById("song").innerText;
    $.ajax({
        type:"Get",
        url:"songLike",
        data:{songName:songName1},
        success:function (data) {
            if(data==true){
                alert("插入成功");
            }else{
                alert("已存在");
            }

        },
        error:function (xhr, textStatus, errorThrown) {
           /* alert("进入error---");
            alert("状态码："+xhr.status);
            alert("状态:"+xhr.readyState);
            alert("错误信息:"+xhr.statusText );
            alert("返回响应信息："+xhr.responseText );//这里是详细的信息
            alert("请求状态："+textStatus);
            alert(errorThrown);
            alert("请求失败");*/
        }
    })
}
function sheetLike(obj) {
    /*sheetName2 = document.getElementById("sheetNames").innerText;
    sheetName3 = document.getElementsByClassName("aaa").innerText;*/
    $.ajax({
        type:"Get",
        url:"getSheetLike",
        data:{sheetName:obj},
        success:function (data) {
            if(data==1){
                alert("添加歌单成功");
            }else{
                alert("失败了");
            }
        },
        error:function (xhr, textStatus, errorThrown) {
          /*  alert("进入error---");
            alert("状态码："+xhr.status);
            alert("状态:"+xhr.readyState);
            alert("错误信息:"+xhr.statusText );
            alert("返回响应信息："+xhr.responseText );//这里是详细的信息
            alert("请求状态："+textStatus);
            alert(errorThrown);
            alert("请求失败");*/
        }
    })
}

/*喜欢的音乐*/
function likeMusic() {
    $.ajax({
        type:"Get",
        url:"getMusicLike",
        success:function (data) {
            for (let a = 0 ; a<data.length;a++){
                /*var c = document.getElementsByClassName("num1");
                c.innerHTML = data[a].songSinger;
                var b = document.getElementsByClassName("num2");
                b.innerHTML = data[a].songName;*/
                if(a == 0){
                    $(".trNum").empty();
                }/*onclick="delMusic()"*/
                var dom = '<tr data-src="'+data[a].song_url+'" data-img=\"http://p1.music.126.net/lN2jt4Vkqw3zzIjc2JjyCw==/2532175280981641.jpg\" class=\"trNum\">'+
                    ' <td><span class="num">'+a + '</span><i class="iconfont icon-xihuan" onclick="like()"></i><i class="iconfont " onclick="delMusic()">&#xe67d;</i></td>'+
                    '<td ><span class="song-name" onclick="songStart($(this).text())" id="song">'+ data[a].song_name+ '</span></td>'+
                    '<td> <span class="song-singer">'+data[a].song_singer + '</span></td>'+
                    ' <td>未收录的单曲</td>'+ '</tr>';

                $(".num1").html(data[a].songSinger);
                $(".num2").html(data[a].songName);
                if(a<=data.length){
                    $(".result-head").after(dom);
                }
            }
        },
        error:function () {

        }
    })
}
/*$(".delMusic").on("click",function () {
    alert("111");
    var obj = document.getElementById("song").innerText;
    function delMusic() {
        $.ajax({
            type:"Get",
            url:"delMusicLike",
            data:{musicName:obj},
            success:function (data) {
                if(data==true){
                    alert("删除成功");
                    likeMusic();
                }else{
                    alert("删除失败");
                }
            },
            error:function () {
            }
        })
    }
})*/


function delMusic() {
    var obj = document.getElementById("song").innerText;
    $.ajax({
        type:"Get",
        url:"delMusicLike",
        data:{musicName:obj},
        success:function (data) {
            if(data==true){
                alert("删除成功");
                likeMusic();
            }else{
                alert("删除失败");
            }
        },
        error:function () {

        }
    })
}

