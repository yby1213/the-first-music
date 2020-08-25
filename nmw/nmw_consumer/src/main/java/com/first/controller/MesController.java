package com.first.controller;


import com.alibaba.fastjson.JSON;
import com.first.tools.SendSMSUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


/**
 * @Description
 * @auther tjj
 * @create 2020-08-19 21:08
 */
@Controller
public class MesController {

    @RequestMapping(value = "/SendSMS", method = RequestMethod.POST)
    @ResponseBody
    public String SMSTest(String phone, HttpServletRequest request) {
        // 发送短信
        SendSMSUtil sendSMS = new SendSMSUtil();
        String result = sendSMS.senSMSUtil(phone);
        // 获取验证码
        int code = sendSMS.getCode();
        // 将数据存入SESSION
        request.getSession().setAttribute("checkCode", code);
        // 将验证码生成时间存入SESSION，若超过五分钟则不通过校验
        request.getSession().setAttribute("createTime", System.currentTimeMillis());
        return JSON.toJSONString("true");
    }


    @RequestMapping(value = "/checkSMSCode", method = RequestMethod.POST)
    @ResponseBody
    public String checkSMSCode(String checkSMSCode, HttpServletRequest request) {

        // 服务器放入的验证码
        String serverCheckCode = request.getSession().getAttribute("checkCode").toString();

        // 验证码创建时间
        String serverCreateTime = request.getSession().getAttribute("createTime").toString();

        // 当前时间
        long uCreateTime = Long.parseLong(String.valueOf(System.currentTimeMillis()));

        if (serverCheckCode == null || serverCreateTime == null || serverCheckCode.equals("") || serverCreateTime.equals("")) {

            return JSON.toJSONString("CodeError");
        }

        if (!checkSMSCode.equals(serverCheckCode)) {// 验证码不匹配

            return JSON.toJSONString("CodeError");
        }

        long sCreateTime = Long.parseLong(serverCreateTime);// 验证码创建时间

        if (uCreateTime - sCreateTime >= 300000) {// 如果时间大于五分钟

            return JSON.toJSONString("TimeOut");
        }

        return JSON.toJSONString("true");

    }
}
