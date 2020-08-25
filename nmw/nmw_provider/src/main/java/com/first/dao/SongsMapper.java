package com.first.dao;


import com.first.entity.Songs;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-17 9:40
 */
@Repository
@Mapper
public interface SongsMapper {
    //查询所有歌
    public List<Songs> getAllSongs();
    //查询所有用户的歌
    public List<Songs> getAllSongs2();
    //分页用
    public List<Songs> pageSongs(@Param("currentPageNo")int currentPageNo, @Param("pageSize") int pageSize);
    //查询前五首
    public List<Songs> getPartSongs();
    //查询后五首
    public List<Songs> getPartSongs2();
    //查询所有歌曲的数量
    public int songsCount();
    //根据创建的时间排序
    public List<Songs> orderSongs();
    //得到歌曲总数
    public Integer getSongsCount();
    //分页+展示歌曲
    public List<Songs>  getSongsAllByPage(@Param("limit") Integer limit
            ,@Param("page") Integer page
            ,@Param("keyword") String keyword);
    //查询单条歌曲
    public List<Songs> getSongsOne(@Param("id") Integer id);
    //添加歌曲
    public  Integer addSongs(@Param("song_name") String song_name
            ,@Param("song_singer") String  song_singer
            ,@Param("song_role") Integer song_role
            ,@Param("song_url") String song_url
            ,@Param("song_pic") String song_pic);
    //删除歌曲_删除歌曲
    public Integer delSongListBysongId(@Param("id")Integer id);
    //修改歌曲
    public  Integer modifySong(@Param("id") Integer id
            ,@Param("song_collect")Integer song_collect
            ,@Param("song_name")String song_name
            ,@Param("song_role")Integer song_role
            ,@Param("song_singer")String song_singer);
    //删除歌曲_删除评论
    public Integer delCommentBysongsId(@Param("songs_id")Integer songs_id);
    //歌单查询歌曲_通过歌单id查询_具体歌曲的内容
    public List<Songs> getSongById(@Param("id")Integer id);
    //显示喜欢歌曲
    public List<Songs> getSongLike(@Param("userName")String userName);
    //删除喜欢歌曲
    public int delSongLike(@Param("userName")String userName,@Param("songName")String songName);
    //开始
    public void start(int number);

}
