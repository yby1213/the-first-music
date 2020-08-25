package com.first.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.first.dao.SongsMapper;
import com.first.entity.Sheet;
import com.first.entity.Songs;
import com.first.service.SongsService;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-17 9:52
 */
@Service
public class SongsServiceImpl implements SongsService {
    @Resource
    private SongsMapper songsMapper;

    @Override
    public List<Songs> getAllSongs() {
        List<Songs> listSongs=null;
        listSongs=songsMapper.getAllSongs();
        return listSongs;
    }

    @Override
    public List<Songs> getAllSongs2() {
        List<Songs> listSongs2=null;
        listSongs2=songsMapper.getAllSongs2();
        return listSongs2;
    }


    @Override
    public List<Songs> orderSongs() {
        List<Songs> orderSongs=null;
        orderSongs=songsMapper.orderSongs();
        return  orderSongs;
    }


    @Override
    public List<Songs> pageSongs(int currentPageNo, int pageSize) {
        List<Songs> pageSong=null;
        pageSong=songsMapper.pageSongs((currentPageNo-1)*pageSize,pageSize);
        return pageSong;
    }

    @Override
    public List<Songs> getPartSongs() {
        List<Songs> listPartSongs=null;
        listPartSongs=songsMapper.getPartSongs();
        return listPartSongs;
    }

    @Override
    public List<Songs> getPartSongs2() {
        List<Songs> listPartSongs2=null;
        listPartSongs2=songsMapper.getPartSongs2();
        return listPartSongs2;
    }

    @Override
    public int songsCount() {
        int count=0;
        count=songsMapper.songsCount();
        return count;
    }

    @Override
    public Integer getSongsCount() {
        return songsMapper.getSongsCount();
    }

    @Override
    public List<Songs> getSongsAllByPage(Integer limit, Integer page,String keyword) {
        return songsMapper.getSongsAllByPage(limit,page,keyword);
    }

    @Override
    public List<Songs> getSongsOne(Integer id) {
        return songsMapper.getSongsOne(id);
    }

    @Override
    public Integer addSongs(String song_name, String song_singer, Integer song_role, String song_url, String song_pic) {
        return songsMapper.addSongs(song_name,song_singer,song_role,song_url,song_pic);
    }

    @Override
    public Integer delSongListBysongId(Integer id) {
        return songsMapper.delSongListBysongId(id);
    }

    @Override
    public Integer delCommentBysongsId(Integer songs_id) {
        return songsMapper.delCommentBysongsId(songs_id);
    }

    @Override
    public Integer modifySong(Integer id, Integer song_collect,String song_name, Integer song_role, String song_singer) {
        return songsMapper.modifySong(id,song_collect,song_name,song_role,song_singer);
    }

    @Override
    public List<Songs> getSongById(Integer id) {
        return songsMapper.getSongById(id);
    }

    @Override
    public List<Songs> getSongByName(String userName) {

        return songsMapper.getSongLike(userName);
    }

    @Override
    public int delSong(String userName, String songName) {
        songsMapper.start(0);
        int num = songsMapper.delSongLike(userName, songName);
        songsMapper.start(1);
        return num;
    }
}
