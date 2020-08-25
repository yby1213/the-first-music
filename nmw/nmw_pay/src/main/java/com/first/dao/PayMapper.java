package com.first.dao;

import com.first.entity.Pay;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Repository
@Mapper
public interface PayMapper {
    //创建新订单
    public Integer addPay(@Param("out_trade_no") Integer out_trade_no
                          ,@Param("user_id") Integer user_id);

    //订单支付完成
    public  Integer successPay(@Param("out_trade_no") Integer out_trade_no
                                ,@Param("total_amount")double total_amount
                                ,@Param("time")Integer time
                                ,@Param("seller_id")String seller_id);
    //用户续费_查询用户未过期订单,并更新
    public Integer addPay2(@Param("out_trade_no") Integer out_trade_no,
                           @Param("user_id") Integer user_id);

    //用户续费_支付完成
    public  Integer successPay2(@Param("out_trade_no") Integer out_trade_no
            ,@Param("total_amount")double total_amount
            ,@Param("time")Integer time
            ,@Param("user_id") Integer user_id);

    //查询用户订单是否过期
    public Integer getPayByUserId(@Param("user_id") Integer user_id);

    //查询公司收入
    public Integer getAmountAll();
    //查询全部订单(未支付or已经支付)
    public List<Pay> getPayAllByPage(@Param("page") Integer page
                                    ,@Param("limit") Integer limit
                                    ,@Param("order_save") Integer order_save);

}
