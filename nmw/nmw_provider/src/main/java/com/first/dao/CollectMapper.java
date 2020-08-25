package com.first.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CollectMapper {

    //新建用户_新建收藏夹
    public  Integer addCollect();
    //删除用户_删除收藏夹
    public Integer delCollectByuserId(@Param("user_id") Integer user_id);
    //删除歌单_更新收藏夹
    public  Integer modifyCollectBysheetId(@Param("sheet_id") Integer sheet_id);

}
