package com.first.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.first.entity.Songs;
import com.first.entity.User;
import com.first.service.ListService;
import com.first.service.SongsService;
import com.first.tools.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class SongsController {
    @Reference
    private SongsService songsService;
    @Reference
    private ListService listService;

    Map<String, Object> map = new HashMap<>();
    Integer result=0;

    //获取数据库里所有的歌曲信息
    @RequestMapping(value = "listAllSongs", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllSongs(){
        List<Songs> listAllSongs=songsService.getAllSongs();
        String jsonStr= JSON.toJSONString(listAllSongs);
        System.out.println(jsonStr);
        return jsonStr;
    }
    //列表展示音乐
    @RequestMapping(value = "listAllSongs2", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllSongs2(){
        List<Songs> listAllSongs2=songsService.getAllSongs2();
        String jsonStr= JSON.toJSONString(listAllSongs2);
        System.out.println(jsonStr);
        return jsonStr;
    }

    //订单音乐
    @RequestMapping(value = "listOrderSongs", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String listOrderSongs(){
        List<Songs> orderSongs=songsService.orderSongs();
        String jsonStr= JSON.toJSONString(orderSongs);
        System.out.println(jsonStr);
        return jsonStr;
    }
    //音乐列表1
    @RequestMapping(value = "listPartSongs", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getPartSongs(){
        List<Songs> listPartSongs=songsService.getPartSongs();
        String jsonStr= JSON.toJSONString(listPartSongs);
        System.out.println(jsonStr);
        return jsonStr;
    }
    //音乐列表2
    @RequestMapping(value = "listPartSongs2", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getPartSongs2(){
        List<Songs> listPartSongs2=songsService.getPartSongs2();
        String jsonStr= JSON.toJSONString(listPartSongs2);
        System.out.println(jsonStr);
        return jsonStr;
    }

    //收藏音乐
    @RequestMapping("songLike")
    @ResponseBody
    public boolean getSongLike(@RequestParam("songName")String songName, HttpServletRequest request){
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute(Constants.USER_SESSION);
        String userName = user.getUserName();
        int result = listService.getListId(userName,songName);
        if(result>0){
            return true;
        }else
            return false;
    }
    //搜索音乐
    @RequestMapping("searchList")
    @ResponseBody
    public List<Songs> searchSong(@RequestParam("search")String search){
        List<Songs> songsList =  listService.getSongByName(search);
        return songsList;
    }
    //分页+查询+展示全部音乐
    @RequestMapping(value = "getSongsAllByPage",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getSongsAllByPage(@RequestParam("page")Integer page
            ,@RequestParam("limit")Integer limit
            ,@RequestParam(value =  "keyword",required = false)String keyword){
        //转化数据start-----
        keyword = "%" + keyword + "%";
        page=(page-1)*limit;
        //转化数据stop-----

        List<Songs> songsList=songsService.getSongsAllByPage(limit,page,keyword);
        Integer count=songsService.getSongsCount();
        //注入map
        map.put("data",songsList);
        map.put("code","0");
        map.put("count",count);
        map.put("msg","成功");
        map.put("status",1);
        System.out.println(songsList);
        return JSON.toJSONString(map);
    }

    //新增歌曲
    @RequestMapping(value = "addsongs",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String addsongs(@RequestParam(value =  "song_name",required = false)String song_name
            ,@RequestParam(value =  "song_singer",required = false)String song_singer
            ,@RequestParam(value =  "song_role",required = false)Integer song_role
            ,@RequestParam(value =  "song_url",required = false)String song_url
            ,@RequestParam(value =  "song_pic",required = false)String song_pic){
        result=songsService.addSongs(song_name,song_singer,song_role,song_url,song_pic);
        //注入map
        map.put("code","0");
        map.put("msg","成功");
        map.put("status",result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }
    //修改音乐
    @RequestMapping(value = "modifysong",produces = "application/json; charset=utf-8")
    @ResponseBody
    public  String modifysong(@RequestParam(value =  "id",required = false)Integer id
            ,@RequestParam(value =  "song_collect",required = false)Integer song_collect
            ,@RequestParam(value =  "song_name",required = false)String song_name
            ,@RequestParam(value =  "song_role",required = false)Integer song_role
            ,@RequestParam(value =  "song_singer",required = false)String song_singer){
        result=songsService.modifySong(id,song_collect,song_name,song_role,song_singer);
        //注入map
        map.put("code","0");
        map.put("msg","成功");
        map.put("status",result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }
    //删除歌曲
    @RequestMapping(value = "delsonglistbyadmin",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String delsonglistbyadmin(@RequestParam(value =  "ids",required = false)String[] ids){
        int[] array = Arrays.asList(ids).stream().mapToInt(Integer::parseInt).toArray();
        for(int i=0;i<ids.length;i++) {
            songsService.delCommentBysongsId(array[i]);
            listService.modifySongListBysongId(array[i]);
            result=songsService.delSongListBysongId(array[i]);
        }
        map.put("status",result);
        map.put("code","0");
        map.put("msg","成功");
        System.out.println(result);
        return JSON.toJSONString(map);
    }

    //查询单个歌单歌曲
    @RequestMapping(value = "getsonglistbypage",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getsonglistbypage(@RequestParam(value =  "keyword",required = false)String keyword1){
        if(keyword1!=null){
            Integer keyword = null;
            if(keyword1!=null){
                keyword = Integer.valueOf(keyword1);
            }
            map.put("data",songsService.getSongById(keyword));
        }else {
            map.put("data",null);
        }
        map.put("code","0");
        map.put("msg","成功");
        System.out.println(result);
        return JSON.toJSONString(map);
    }

    //添加喜欢的音乐
    @RequestMapping("getMusicLike")
    @ResponseBody
    public List<Songs> getSongsLike(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute(Constants.USER_SESSION);
        String userName = user.getUserName();
        List<Songs> songsList = songsService.getSongByName(userName);
        return songsList;
    }
    //删除喜欢的音乐
    @RequestMapping("delMusicLike")
    @ResponseBody
    public boolean delSongLike(@RequestParam("musicName")String musicName,HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        String userName = user.getUserName();
        int num = songsService.delSong(userName, musicName);
        if (num > 0) {
            return true;
        }
        return false;
    }



}
