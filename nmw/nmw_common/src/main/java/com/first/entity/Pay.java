package com.first.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
@Data
public class Pay {
    private Integer id;
    private Integer out_trade_no;//订单号
    private double total_amount;//金额
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String timestamp;//订单生效时间
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String expiration_time;//订单失效时间
    private String seller_id;//卖方
    private Integer user_id;//买方
    private Integer order_save;//订单状态(0:未支付,1:支付完成)
}
