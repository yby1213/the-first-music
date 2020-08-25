package com.first.service.impl;

import com.first.dao.PayMapper;
import com.first.entity.Pay;
import com.first.epay.Alipay;
import com.first.epay.AlipayBean;
import com.first.service.PayService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alipay.api.AlipayApiException;

import javax.annotation.Resource;
import java.util.List;


@Service
public class PayServiceImpl implements PayService {

    @Autowired
    private Alipay alipay;
    @Resource
    private PayMapper payMapper;

    @Override
    public String aliPay(AlipayBean alipayBean) throws AlipayApiException {
        return alipay.pay(alipayBean);
    }

    @Override
    public Integer addPay(Integer out_trade_no, Integer user_id) {
        return payMapper.addPay(user_id,out_trade_no);
    }

    @Override
    public Integer successPay(Integer out_trade_no, double total_amount, Integer time,String seller_id) {
        return payMapper.successPay(out_trade_no,total_amount,time,seller_id);
    }

    @Override
    public Integer addPay2(Integer out_trade_no, Integer user_id) {
        return payMapper.addPay2(user_id,out_trade_no);
    }

    @Override
    public Integer successPay2(Integer out_trade_no, double total_amount, Integer time, Integer user_id) {
        return payMapper.successPay2(out_trade_no,total_amount,time, user_id);
    }

    @Override
    public Integer getPayByUserId(Integer user_id) {
        return payMapper.getPayByUserId(user_id);
    }

    @Override
    public Integer getAmountAll() {
        return payMapper.getAmountAll();
    }

    @Override
    public List<Pay> getPayAllByPage(Integer page, Integer limit, Integer order_save) {
        return payMapper.getPayAllByPage(page,limit,order_save);
    }

}
