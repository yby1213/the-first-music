package com.first.service;

import com.first.entity.Sheet;
import com.first.entity.Songs;

import java.util.List;

public interface ListService {
    //获取歌单名
    public List<Sheet> getSheetByName(String userName);
    //获取歌名
    public List<Songs> getSongsList(String sheetName);
    //通过歌单名获取歌单
    public Sheet getSheetList(String sheetName);
    //通过歌曲名获取歌
    public String getSong(String songName);
    //得到list
    public int getListId(String userName,String songName);
    //通过歌名得到歌曲
    public List<Songs> getSongByName(String songName);
    //新建list
    public Integer addSongListByAdmin(Integer list_id,Integer song_id);
    //删除用户_删除list
    public Integer delSongListByuserId(Integer list_id);
    //删除歌曲_更新lsit
    public Integer modifySongListBysongId(Integer song_id);
    //添加歌单_随机生成list_id
    public Integer addSongListBylistId();
    //删除歌单_删除list
    public  Integer delSongListBysheetId(Integer id);
    //歌单添加歌曲
    public  Integer addSongListById(Integer list_id,Integer song_id);
    //歌单删除歌曲
    public  Integer delSongListById(Integer list_id,Integer song_id);

}
