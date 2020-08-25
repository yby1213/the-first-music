package com.first.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.first.entity.Sheet;
import com.first.entity.User;
import com.first.service.CollectService;
import com.first.service.SheetService;
import com.first.service.ListService;
import com.first.tools.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SheetController {
    @Reference
    private ListService songListService;
    @Reference
    private SheetService sheetService;
    @Reference
    private CollectService collectService;
    Map<String, Object> map = new HashMap<>();
    int result=0;
    //得到歌单信息
    @RequestMapping(value = "getsheetlistbyadmin", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getsheetlistbyadmin(@RequestParam("page") Integer page
            , @RequestParam("limit") Integer limit
            , @RequestParam(value = "keyword", required = false) String keyword) {

        //转化数据start-----
        keyword = "%" + keyword + "%";
        page = (page - 1) * limit;
        //转化数据stop-----
        List<Sheet> sheetList = sheetService.getSheetListByAdmin(limit, page, keyword);
        Integer count = sheetService.getSheetListByAdmin(limit, page, keyword).size();
        map.put("data", sheetList);
        map.put("count", count);
        map.put("code", "0");
        map.put("msg", "成功");
        map.put("status", 1);
        System.out.println(sheetList);
        return JSON.toJSONString(map);
    }

    //删除歌单
    @RequestMapping(value = "delsheetonebyadmin", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getsheetlistbyadmin(@RequestParam("id") Integer id) {
        collectService.modifyCollectBysheetId(id);
        result = sheetService.delSheetBysheetId(id);
        songListService.delSongListBysheetId(id);
        map.put("code", "0");
        map.put("msg", "成功");
        map.put("status", result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }

    //添加官方歌单
    @RequestMapping(value = "addsheetbyadmin", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String addsheetbyadmin(
            @RequestParam(value = "sheet_name", required = false) String sheet_name
            , @RequestParam(value = "sheet_pic", required = false) String sheet_pic) {
        songListService.addSongListBylistId();
        result = sheetService.addSheetByAdmin2(sheet_name, sheet_pic);
        map.put("code", "0");
        map.put("msg", "成功");
        map.put("status", result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }

    //添加官方歌单
    @RequestMapping(value = "addsonglistbyid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public  String addsonglistbyid(
            @RequestParam(value =  "keyword",required = false)String keyword1
            ,@RequestParam(value =  "ids",required = false)String[] ids) {
        //转化数据start-----
        Integer keyword = null;
        if(keyword1!=null){
            keyword = Integer.valueOf(keyword1);
        }
        int[] array = Arrays.asList(ids).stream().mapToInt(Integer::parseInt).toArray();
        //转化数据stop-----
        for(int i=0;i<array.length;i++) {
            result=songListService.addSongListById(keyword,array[i]);
        }
        map.put("code", "0");
        map.put("msg", "成功");
        map.put("status", result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }
    //添加官方歌单
    @RequestMapping(value = "delsonglistbyid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public  String delsonglistbyid(
            @RequestParam(value =  "keyword",required = false)String keyword1
            ,@RequestParam(value =  "ids",required = false)String[] ids){
        //转化数据start-----
        Integer keyword = null;
        if(keyword1!=null){
            keyword = Integer.valueOf(keyword1);
        }
        int[] array = Arrays.asList(ids).stream().mapToInt(Integer::parseInt).toArray();
        //转化数据stop-----
        for(int i=0;i<array.length;i++) {
            result=songListService.delSongListById(keyword,array[i]);
        }
        map.put("code", "0");
        map.put("msg", "成功");
        map.put("status", result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }
    //添加歌单收藏
    @RequestMapping("getSheetLike")
    @ResponseBody
    public int getSheetLike(@RequestParam("sheetName")String sheetName, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        String userName = user.getUserName();
        int result = sheetService.addSheetByName(userName,sheetName);
        return result;
    }

}
