package com.first.service;

import com.first.entity.Songs;

import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-17 9:49
 */
public interface SongsService {
    //查询所有歌
    public List<Songs> getAllSongs();
    //查询所有用户的歌
    public List<Songs> getAllSongs2();
   //付费歌曲
    public List<Songs> orderSongs();
    //分页用
    public List<Songs> pageSongs(int currentPageNo, int pageSize);
    //查询前五首
    public List<Songs> getPartSongs();
    //查询后五首
    public List<Songs> getPartSongs2();
    //查询所有歌曲的数量
    public int songsCount();
    //查询歌曲数量
    public Integer getSongsCount ();
    //分页+展示歌曲
    public List<Songs> getSongsAllByPage( Integer limit,Integer page,String keyword);
    //查询单条歌曲
    public List<Songs> getSongsOne( Integer id);
    //添加歌曲
    public  Integer addSongs( String song_name, String  song_singer, Integer song_role, String song_url,String song_pic);
    //删除歌曲_删除歌曲
    public Integer delSongListBysongId(Integer id);
    //删除歌曲_删除评论
    public Integer delCommentBysongsId(Integer songs_id);
    //修改歌曲
    public  Integer modifySong( Integer id,Integer song_collect,String song_name,Integer song_role,String song_singer);
    //歌单查询歌曲_通过歌单id查询_具体歌曲的内容
    public List<Songs> getSongById(Integer id);
    //显示喜欢歌曲
    public List<Songs> getSongByName(String userName);
    //删除喜欢歌曲
    public int delSong(String userName,String songName);


}
