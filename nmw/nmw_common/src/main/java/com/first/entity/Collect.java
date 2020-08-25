package com.first.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-14 17:23
 */
//收藏表
    @Data
public class Collect implements Serializable {
    private Integer id;//收藏表的id
    private Integer user_id;//用户表id
    private Integer sheet_id;//歌单表的id


}
