package com.first.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping(value="/upload")
@MultipartConfig
public class AnalyseRepariController {
    private Logger logger = Logger.getLogger(AnalyseRepariController.class);

    @RequestMapping(value = "/img" , method = RequestMethod.POST)
    @ResponseBody
    public String uploadPicture(@RequestParam("index") String index,@RequestParam("file") MultipartFile file, HttpServletRequest servletRequest)
            throws IOException {
        //如果文件内容不为空，则写入上传路径
        Map<String, Object> map = new HashMap<>();
        JSONObject resUrl = new JSONObject();

        //上传文件路径
        String path = servletRequest.getServletContext().getRealPath("/uploadFile/"+index);
        System.out.println("文件名称"+file.getOriginalFilename());
        //上传文件名
        String name = file.getOriginalFilename();//上传文件的真实名称
        String suffixName = name.substring(name.lastIndexOf("."));//获取后缀名
        String hash = Integer.toHexString(new Random().nextInt());//自定义随机数（字母+数字）作为文件名
        String fileName = hash + suffixName;
        File filepath = new File(path, fileName);
        System.out.println("随机数文件名称"+filepath.getName());
        //判断路径是否存在，没有就创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文档中
        File tempFile = new File(path + File.separator + fileName);
        file.transferTo(tempFile);

        //上传到网页,文件的数据库地址
        String s=tempFile.getAbsolutePath();
        String[] split=s.split("webapp");
        String msg="../../.."+split[1];
        map.put("code", 0);
        map.put("msg", msg);
        map.put("status",1);
        return JSON.toJSONString(map);
    }
}