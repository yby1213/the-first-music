package com.first.dao;

import com.first.entity.Sheet;
import com.first.entity.Songs;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-16 14:28
 */
@Repository
@Mapper
public interface SheetMapper {
    //得到全部歌单
    public List<Sheet> getAllSheet();
    //得到部分歌单
    public List<Sheet> getPartSheet();
    //歌单分页
    public List<Sheet> pageSheet(@Param("currentPageNo")int currentPageNo, @Param("pageSize") int pageSize);
    //歌单总数
    public int sheetCount();
    //分页+关键字+展示全部歌单
    public List<Sheet> getSheetListByAdmin(@Param("limit") Integer limit
            ,@Param("page") Integer page,@Param("keyword")String keyword);
    //新建歌单
    public Integer addSheetByAdmin(@Param("sheet_name")String sheet_name
            ,@Param("sheet_pic")String sheet_pic,@Param("list_id")Integer list_id);
    //删除用户_删除歌单
    public Integer delSheetByuserId(@Param("user_id")Integer user_id);
    //新增歌单(官方)
    public  Integer addSheetByAdmin2(@Param("sheet_name")String sheet_name,@Param("sheet_pic")String sheet_pic);
    //删除官方歌单
    public Integer delSheetBysheetId(@Param("id")Integer id);
    //添加歌单判断
    public String getSheetByName(@Param("userName")String userName,@Param("sheetName")String sheetName);
    //用户添加喜欢的歌单
    public int addSheetLike(@Param("userName")String userName,@Param("sheetName")String sheetName);


}
