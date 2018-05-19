var DataJson = {
    checkPhone: function (data) {
        if (!/^[1][3,4,5,7,8][0-9]{9}$/.test(data)) {
            return false;
        } else {
            return true;
        }
    }
};

var num;
var time = 60;
$(".getPhone").click(() => {
    var data = {
        phone: $("input[name='phone'] ").val(),
    }
    if(!data.phone){
        alert("手机号码不能为空");
    }else if (!DataJson.checkPhone(data.phone) || data.phone.length != 11) {
        alert("手机号码格式不正确");
    } else{
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "./gettelcodes",
            data: ({ tel: data.phone }),
            success: function (result) {
                if (result.resultCode == 200) {
                    //验证码
                    $(".getPhone").fadeOut()
                    $(".getPhones").fadeIn()
                    if (time > 0) {
                        var aa = setInterval(() => {
                            num = 1;
                            time--;
                            $(".getPhones").text(time + "s后获取")
                            if (time <= 1) {
                                clearInterval(aa)
                                $(".getPhone").fadeIn()
                                $(".getPhones").fadeOut()
                                time = 60
                            }
                        }, 1000)
                    }
                } else if (result.resultCode == 300) {
                   alert("短信发送失败");
                }else if (result.resultCode == 400) {
                   alert("该手机号未注册");
                }
            },
            error: function (err) {
                console.log(err.statusText)
            }
        });
    }
})


$(".btn_regist").click(() => {
    var data = {
        phone: $("input[name='phone'] ").val(),
        yanzheng: $("input[name='yanzheng'] ").val(),
        password: $("input[name='password'] ").val(),
        passwordtwo: $("input[name='passwordtwo'] ").val(),
    }
     if(!data.phone){
        alert("手机号码不能为空");
    }else if (!DataJson.checkPhone(data.phone) || data.phone.length != 11) {
        alert("手机号码格式不正确");
    }else if(data.password.length<8 || data.password.length>12){
        alert("密码不能少于8 大于12位");
    }else{
        if(data.password==data.passwordtwo){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "./getpasswords",
                data: data,
                success: function (result) {
                    if (result.resultCode == 200) {
                        alert("密码重置成功");
                        window.location.href="./index";
                    } else if (result.resultCode == 300) {
                       alert("手机号未注册");
                    }else if (result.resultCode == 400) {
                       alert("验证码有误");
                    }else if (result.resultCode == 500) {
                       alert("密码重置失败");
                    }
                },
                error: function (err) {
                    console.log(err.statusText)
                }
            });
        }else{
            alert("两次密码输入不一样");
        }
    }
})