package com.first.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-14 17:25
 */
//歌单曲表
    @Data
public class SongList implements Serializable {
    private Integer id;//歌单曲表
    private Integer list_id;// 歌单去22的id
    private Integer song_id;//歌的id

}
