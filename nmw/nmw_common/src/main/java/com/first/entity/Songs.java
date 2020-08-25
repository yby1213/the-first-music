package com.first.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-14 18:09
 */
//歌曲表
    @Data
public class Songs implements Serializable {
    private Integer id;//歌曲边id
    private String song_singer;//歌手
    private String song_name;//歌名
    private Integer song_role;//0 普通歌，1 vip歌
    private String song_url;//歌的本地地址
    private String song_pic;//歌的图片
    private Integer song_collect;//收藏的数量
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String creationDate;//创建的时间

   }
