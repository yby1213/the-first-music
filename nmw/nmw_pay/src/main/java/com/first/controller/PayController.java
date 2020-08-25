package com.first.controller;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.first.entity.Pay;
import com.first.epay.AlipayBean;

import com.first.service.PayService;
import com.first.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class PayController {
    private Logger logger = Logger.getLogger(PayController.class);
    @Autowired
    private PayService payService;
    @Resource
    private  PayService payService1;
    Map<String, Object> map = new HashMap<>();

    /**
     * 阿里支付
     * @param outTradeNo
     * @param subject
     * @param body
     * @return
     * @throws AlipayApiException
     */
    @PostMapping(value = "alipay")
    @ResponseBody
    public String alipay(String outTradeNo, String subject,Integer quantity, String totalAmount, String body) throws AlipayApiException {
        AlipayBean alipayBean = new AlipayBean();
        alipayBean.setOut_trade_no(outTradeNo);
        alipayBean.setSubject(subject);
        alipayBean.setQuantity(quantity);
        alipayBean.setTotal_amount(totalAmount);
        alipayBean.setBody(body);
        return payService.aliPay(alipayBean);
    }
    //查询用户是否vip
    @RequestMapping(value = "getUserOrder",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getuserlistbypage(@RequestParam(value =  "user_id",required = false)Integer user_id)
    {
       Integer result= payService1.getPayByUserId(user_id);
        //注入map
        //map.put("data",userList);
        //map.put("count",count);
        map.put("code","0");
        map.put("msg","成功");
        map.put("status",result);
        System.out.println(result);
        return JSON.toJSONString(map);
         }
    //用户创建订单
    @RequestMapping(value = "addpay",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String addpay(@RequestParam(value =  "index",required = false)int index
                        ,@RequestParam(value =  "user_id",required = false)String user_id1
                        ,@RequestParam(value =  "out_Trade_No",required = false)String out_trade_no1)
    {
        //转化数据start-----
        int user_id = Integer.parseInt(user_id1);
        int out_trade_no = Integer.parseInt(out_trade_no1);
        Integer result=2;
        if (index==1){result= payService1.addPay(user_id,out_trade_no);}
        else{result= payService1.addPay2(user_id,out_trade_no);}
        //注入map
        map.put("code","0");
        map.put("msg","成功");
        map.put("status",result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }
    //用户成功支付订单
    @RequestMapping(value = "successpay",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String successpay(@RequestParam(value =  "total_amount",required = false)String total_amount1
            ,@RequestParam(value =  "out_trade_no",required = false)String out_trade_no1
            ,@RequestParam(value =  "seller_id",required = false)String seller_id
            ,@RequestParam(value =  "timestamp",required = false)String timestamp1
            ,@RequestParam(value =  "user_id",required = false)String user_id1)
    {
        //转化数据start-----
            double total_amount = Double.parseDouble(total_amount1);
            int out_trade_no = Integer.parseInt(out_trade_no1);
            int user_id = Integer.parseInt(user_id1);
            int index=payService1.getPayByUserId(user_id);
        Integer result=0;
        int time=0;
        switch (total_amount1){
            case "8.00":
                time=1;
                break;
            case "45.00":
                time=2;
                break;
            case "88.00":
                time=3;
                break;
             default:
                time=0;
                break;
        }
        //转化数据stop-----
        if (index==0){payService1.successPay(out_trade_no,total_amount,time,seller_id);}
        else{payService1.successPay2(out_trade_no,total_amount,time, user_id);}
        //修改用户表中用户vip
       /* userService.modifyUserByAdmin(user_id,null,3,null,null);*/
        result=payService1.getPayByUserId(user_id);
        //注入map
        map.put("code","0");
        map.put("msg","成功");
        map.put("status",result);
        System.out.println(result);
        return JSON.toJSONString(map);
    }
}
