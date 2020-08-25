package com.first.dao;

import com.first.entity.Sheet;
import com.first.entity.Songs;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ListMapper {
    //获取歌单名
    public List<Sheet> getSheetByName(@Param("userName") String userName);
    //获取歌名
    public List<Songs> getSongsByName(@Param("sheetName") String sheetName);
    //通过歌单名获取歌单
    public Sheet getSheetList(@Param("sheetName") String sheetName);
    //通过歌曲名获取歌
    public String getSong(@Param("songName") String songName);
    //得到list
    public List getListId(@Param("userName")String userName,@Param("songName")String songName);
    //歌单添加歌曲
    public int insertSong(@Param("userName")String userName,@Param("songName")String songName);
    //通过歌名得到歌曲
    public List<Songs> getSongByName(@Param("songName")String songName);
    //新建list
    public Integer addSongListByAdmin(@Param("list_id") Integer list_id,@Param("song_id") Integer song_id);
    //删除用户_删除list
    public Integer delSongListByuserId(@Param("list_id")Integer list_id);
    //删除歌曲_更新lsit
    public Integer modifySongListBysongId(@Param("song_id")Integer song_id);
    //添加歌单_随机生成list_id
    public Integer addSongListBylistId();
    //删除歌单_删除list
    public  Integer delSongListBysheetId(@Param("id")Integer id);
    //歌单添加歌曲
    public  Integer addSongListById(@Param("list_id")Integer list_id,@Param("song_id")Integer song_id);
    //歌单删除歌曲
    public  Integer delSongListById(@Param("list_id")Integer list_id,@Param("song_id")Integer song_id);

}
