<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>第一音乐网站VIP充值</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../../statics/style/bootstrap.min.css"/>

    <script src="../../../statics/js/jquery-1.7.2.js"></script>
    <script src="../../../statics/js/bootstrap.js"></script>
    <script src="../../../statics/js/vue.js"></script>
    
    <script language="javascript">
    function submitForm(action) {
        document.getElementById("form").action = action
        document.getElementById("form").submit()
    }

    function submitForm2(action) {
        document.getElementById("form").action = action
        document.getElementById("form").submit()
    }

    function submitForm3(action) {
        document.getElementById("form").action = action
        document.getElementById("form").submit()
    }
</script>
</head>
<body>
    <div class="container" id="box">
       
        <hr>
        <table class="table table-bordered table-hover">
            <caption class="h3 text-info">第一音乐VIP充值</caption>
          
            <tr class="text-danger">
                <th class="text-center">商户订单</th>
                <th class="text-center">订单名称</th>
                <th class="text-center">付款金额</th>
                <th class="text-center">支付方式</th>
            </tr>
            <tr class="text-center" v-for="item in myData">
            	  <form id="form" action="order/alipay" method="post">
                <td>1<input type="hidden" name="outTradeNo" value="dzcp100010015"></td>
                <td><input type="text" name="subject" value="首月充值只需4.8"></td>
                <td><input type="text" name="totalAmount" value="4.8" ><br></td>
                <td><input type="hidden" name="body"> <br>
           <input type="button" value="支付宝支付" onclick="submitForm('order/alipay')"></td>
                </form>
            </tr>
            
            <tr class="text-center" v-for="item in myData">
            	  <form id="form1" action="order/alipay" method="post">
                <td>2<input type="hidden" name="outTradeNo" value="dzcp100010023"></td>
                <td><input type="text" name="subject" value="包年"></td>
                <td><input type="text" name="totalAmount" value="158" ><br></td>
                <td><input type="hidden" name="body"> <br>
           <input type="submit" value="支付宝支付" onclick="submitForm2('order/alipay')"></td>
                </form>
            </tr>

           <tr class="text-center" v-for="item in myData">
                <form id="form2" action="order/alipay" method="post">
                    <td>3<input type="hidden" name="outTradeNo" value="dzcp100010013"></td>
                    <td><input type="text" name="subject" value="包季"></td>
                    <td><input type="text" name="totalAmount" value="88" ><br></td>
                    <td><input type="hidden" name="body"> <br>
                           <input type="submit" value="支付宝支付" onclick="submitForm3('order/alipay')"></td>
                </form>
            </tr>

            <tr v-show="myData.length!=0">
                <td colspan="4" class="text-right">
                   
                </td>
            </tr>
         
        </table>

 
    </div>
</body>
