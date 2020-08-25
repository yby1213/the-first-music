package com.first.service;

public interface CollectService {
    //新建用户_新建收藏夹
    public  Integer addCollect();
    //删除用户_删除收藏夹
    public Integer delCollectByuserId(Integer user_id);
    //删除歌单_更新收藏夹
    public  Integer modifyCollectBysheetId(Integer sheet_id);
}
