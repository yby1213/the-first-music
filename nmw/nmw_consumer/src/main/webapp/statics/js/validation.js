$(function(){
    var flagUsername=false;
    var flagPassword=false;
    var flagPhone=false;

    $("#uname").blur(function(){

        if($("#uname").val()==null||$("#uname").val()==''){
            $("#spanUserName").html("用户名不能为空");

        }else{
            $("#spanUserName").html("");
            flagUsername=true;
        }
    });

    $("#pwd").blur(function(){
        var pwd=$(this).val();
        var pwdReg=/^[a-zA-Z]\w{5,9}$/;
        if(!pwdReg.test(pwd)) {
            $("#spanUserPwd").html("密码格式错误，必须是字母开头");
        }else{
            $("#spanUserPwd").html("");
            flagPassword=true;
        }
    });

    $("#tel").blur(function(){
        var phone=$(this).val();
        var phoneReg=/^1[34578]\d{9}$/;
        if(!phoneReg.test(phone)){
            $("#spanPhone").html("请输入正确格式的手机号");
        }else{
            $("#spanPhone").html("");
            flagPhone=true;
        }
    });

    /*$("#submit").click(function(){
        $("form").submit();
        if(flagUsername==true && flagPassword==true && flagPhone==true){

            alert("保存成功");
        }else{
            alert("保存失败，请查看是否还有错误提交");
        }
    })*/
});