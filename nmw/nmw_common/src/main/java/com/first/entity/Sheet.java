package com.first.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-14 17:42
 */
//歌单表
    @Data
public class Sheet implements Serializable {
    private Integer id; //歌单表id
    private String sheet_name;//歌单表的名字
    private String sheet_pic;//歌单图片
    private Integer sheet_collect;//歌单的收藏数
    private Integer user_id;//用户的id 方便和用户连接，被谁给收藏了
    private Integer list_id;//歌单表22的id，方便歌曲单表和歌单表连接
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String creationDate;//创建的时间

   }
