package com.first.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.first.dao.SheetMapper;
import com.first.entity.Sheet;
import com.first.service.SheetService;
import javax.annotation.Resource;
import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-16 14:29
 */
@Service
public class SheetServiceImpl implements SheetService {
    @Resource
    private SheetMapper sheetMapper;

    @Override
    public List<Sheet> getAllSheet() {
        List<Sheet> listSheet=null;
        listSheet=sheetMapper.getAllSheet();
        return listSheet;
    }

    @Override
    public List<Sheet> getPartSheet() {
        List<Sheet> listPartSheet=null;
        listPartSheet=sheetMapper.getPartSheet();
        return listPartSheet;
    }

    @Override
    public List<Sheet> pageSheet(int currentPageNo, int pageSize) {
        List<Sheet> pSheet=null;
        pSheet=sheetMapper.pageSheet((currentPageNo-1)*pageSize,pageSize);
        return  pSheet;
    }

    @Override
    public int sheetCount() {
        int count=0;
        count=sheetMapper.sheetCount();
        return count;
    }

    @Override
    public List<Sheet> getSheetListByAdmin(Integer limit, Integer page, String keyword) {
        return sheetMapper.getSheetListByAdmin(limit,page,keyword);
    }

    @Override
    public Integer addSheetByAdmin(String sheet_name, String sheet_pic, Integer list_id) {
        return sheetMapper.addSheetByAdmin(sheet_name,sheet_pic,list_id);
    }

    @Override
    public Integer delSheetByuserId(Integer user_id) {
        return sheetMapper.delSheetByuserId(user_id);
    }

    @Override
    public Integer addSheetByAdmin2(String sheet_name, String sheet_pic) {
        return sheetMapper.addSheetByAdmin2(sheet_name,sheet_pic);
    }

    @Override
    public Integer delSheetBysheetId(Integer id) {
        return sheetMapper.delSheetBysheetId(id);
    }

    @Override
    public int addSheetByName(String userName, String sheetName) {
        try{

            if(sheetMapper.getSheetByName(userName,sheetName)==null){
                if(sheetMapper.addSheetLike(userName, sheetName)>0){
                    return 1;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        return 0;

    }

}
