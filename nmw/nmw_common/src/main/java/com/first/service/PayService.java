package com.first.service;

import com.alipay.api.AlipayApiException;
import com.first.entity.Pay;
import com.first.epay.AlipayBean;

import java.util.List;

/**
 * 支付服务
 * @author Louis
 * @date Dec 12, 2018
 */
public interface PayService {

    /**
     * 支付宝支付接口
     *
     * @param alipayBean
     * @return
     * @throws AlipayApiException
     */
    String aliPay(AlipayBean alipayBean) throws AlipayApiException;

    //创建新订单
    public Integer addPay(Integer out_trade_no, Integer user_id);
    //订单支付完成
    public  Integer successPay(Integer out_trade_no, double total_amount, Integer time, String seller_id);
    //用户续费_查询用户未过期订单,并更新
    public Integer addPay2(Integer out_trade_no, Integer user_id);
    //用户续费_支付完成
    public  Integer successPay2(Integer out_trade_no, double total_amount, Integer time, Integer user_id);
    //查询用户订单是否过期
    public Integer getPayByUserId(Integer user_id);
      //查询公司收入
    public Integer getAmountAll();
    //查询全部订单(未支付or已经支付)
    public List<Pay> getPayAllByPage(Integer page, Integer limit, Integer order_save);
}