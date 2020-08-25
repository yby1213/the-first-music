package com.first.service;

import com.first.entity.Sheet;


import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-16 14:27
 */
public interface SheetService {
    //得到全部歌单
    public List<Sheet> getAllSheet();
    //得到部分歌单
    public List<Sheet> getPartSheet();
    //歌单分页
    public List<Sheet> pageSheet(int currentPageNo, int pageSize);
    //歌单总数
    public int sheetCount();
    //分页+关键字+展示全部歌单
    public List<Sheet> getSheetListByAdmin(Integer limit, Integer page,String keyword);
    //新建歌单
    public Integer addSheetByAdmin(String sheet_name,String sheet_pic,Integer list_id);
    //删除用户_删除歌单
    public Integer delSheetByuserId(Integer user_id);
    //新增歌单(官方)
    public  Integer addSheetByAdmin2(String sheet_name,String sheet_pic);
    //删除官方歌单
    public Integer delSheetBysheetId(Integer id);
    //加入收藏歌单
    public int addSheetByName(String userName,String sheetName);
}
