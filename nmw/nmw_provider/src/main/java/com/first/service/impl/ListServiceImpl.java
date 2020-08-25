package com.first.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.first.dao.ListMapper;
import com.first.entity.Sheet;
import com.first.entity.Songs;
import com.first.service.ListService;
import org.apache.ibatis.jdbc.Null;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ListServiceImpl implements ListService {

    @Resource
    private ListMapper listMapper;

    @Override
    public List<Sheet> getSheetByName(String userName) {
        List<Sheet> sheetList = listMapper.getSheetByName(userName);
        return listMapper.getSheetByName(userName);
    }

    @Override
    public List<Songs> getSongsList(String sheetName) {
        List<Songs> songsList = listMapper.getSongsByName(sheetName);
        return listMapper.getSongsByName(sheetName);
    }

    @Override
    public Sheet getSheetList(String sheetName) {
        return listMapper.getSheetList(sheetName);
    }

    @Override
    public String getSong(String songName) {
        return listMapper.getSong(songName);
    }

    @Override
    public int getListId(String userName, String songName) {
        try{
            if(listMapper.getListId(userName,songName)== null||listMapper.getListId(userName,songName).size()==0){
                if(listMapper.insertSong(userName,songName)>0){
                    return 1;
                }
            }
        }catch (Exception e){
            return 0;
        }
        return 0;
    }

    @Override
    public List<Songs> getSongByName(String songName) {
        if(listMapper.getSongByName(songName)!=null){
            return listMapper.getSongByName(songName);
        }
        return null;
    }
    @Override
    public Integer addSongListByAdmin(Integer list_id, Integer song_id) {
        return listMapper.addSongListByAdmin(list_id,song_id);
    }

    @Override
    public Integer delSongListByuserId(Integer list_id) {
        return listMapper.delSongListByuserId(list_id);
    }

    @Override
    public Integer modifySongListBysongId(Integer song_id) {
        return listMapper.modifySongListBysongId(song_id);
    }

    @Override
    public Integer addSongListBylistId() {
        return listMapper.addSongListBylistId();
    }

    @Override
    public Integer delSongListBysheetId(Integer id) {
        return listMapper.delSongListBysheetId(id);
    }

    @Override
    public Integer addSongListById(Integer list_id, Integer song_id) {
        return listMapper.addSongListById(list_id,song_id);
    }

    @Override
    public Integer delSongListById(Integer list_id, Integer song_id) {
        return listMapper.delSongListById(list_id,song_id);
    }

}
