package com.first.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.first.entity.Sheet;
import com.first.entity.Songs;
import com.first.service.ListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ListController {
    @Reference
    private ListService listService;

    @RequestMapping("listSongs")
    @ResponseBody
    public List<Songs> getSongList(@RequestParam("sheetName")String sheetName){
        List<Songs> songsList = listService.getSongsList(sheetName);
        return songsList;
    }
    @RequestMapping("listSheet")
    @ResponseBody
    public Sheet getSheetList(@RequestParam("sheetName")String sheetName){
        Sheet sheetList = listService.getSheetList(sheetName);
        return sheetList;
    }
    @RequestMapping("songStart")
    @ResponseBody
    public String getSongUrl(@RequestParam("songName")String songName){
        String songUrl = listService.getSong(songName);
        return songUrl;
    }
}
