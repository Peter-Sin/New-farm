
$.ajaxSetup({
    contentType: "application/x-www-form-urlencoded; charset=utf-8"
});
//将从form中通过$('#form').serialize()获取的值转成json
var DataJson = {
    checkPhone: function (data) {
        if (!/^[1][3,4,5,7,8][0-9]{9}$/.test(data)) {
            return false;
        } else {
            return true;
        }
    }
};

var reg = /^[0-9a-zA-Z]+$/;


//Register
//获取手机验证码
$(".getPhone").click(function () {
    var telphone=$("input[name='phone']").val();
    if(!telphone){
        $(".tishi").show()
        $(".tishi").html("手机号不能为空")
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    }else if (!DataJson.checkPhone(telphone) || telphone.length != 11) {
        $(".tishi").show()
        $(".tishi").html("手机号格式不正确")
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    } else{
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "./getphonecodes",
            data: ({tel: telphone}),
            success: function (result) {
                if (result.resultCode == 200) {
                    var num = 60;
                    var that = $(this)
                    var times = setInterval(function () {
                        num -= 1
                        that.css("display", "none")
                        $(".getPhones").css("display", "block")
                        $(".getPhones").html(num + "后获取")
                        if (num === 0) {
                            clearInterval(times);
                            that.css("display", "block")
                            $(".getPhones").css("display", "none")
                        }
                        //发送手机验证请求
                    }, 1000)
                }else if(result.resultCode == 300){
                    $(".tishi").show()
                    $(".tishi").html("该手机号已注册")
                    setTimeout(function () {
                        $(".tishi").hide()
                    }, 2000)
                }else if(result.resultCode == 400){
                    $(".tishi").show()
                    $(".tishi").html("短信发送失败")
                    setTimeout(function () {
                        $(".tishi").hide()
                    }, 2000)
                }
            },
            error: function (err) {
                console.log(err.statusText)
            }
        });
    }
})




//注册
// $("#Registers").submit(function (e) {
$(".btn_regist").click(function () {
    // e.preventDefault()
    var data = {
        phone: $("input[name='phone'] ").val(),
        yanzheng: $("input[name='yanzheng'] ").val(),
        Tphone: $("input[name='Tphone'] ").val(),
        password: $("input[name='password'] ").val(),
        passwordtwo: $("input[name='passwordtwo'] ").val(),
    }
    if(!data.phone) {
        $(".tishi").show()
        $(".tishi").html("手机号不能为空")
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    }else if(!DataJson.checkPhone(data.phone) || data.phone.length != 11) {
        $(".tishi").show()
        $(".tishi").html("手机号格式不正确")
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    } else if(data.Tphone && (!DataJson.checkPhone(data.Tphone) || data.Tphone.length != 11)) {
            $(".tishi").show();
            $(".tishi").html("推荐人手机号格式不正确");
            setTimeout(function () {
                $(".tishi").hide()
            }, 2000)
    } else if(data.Tphone == data.phone) {
        $(".tishi").show();
        $(".tishi").html("推荐人不能为自己");
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    }else if(data.password=="" || !data.password){
        $(".tishi").show()
        $(".tishi").html("请输入密码")
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    }else if(data.password.length<8 || data.password.length>12){
        $(".tishi").show()
        $(".tishi").html("密码不能少于8 大于12位");
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    }else if(!reg.test(data.password)){
        $(".tishi").show()
        $(".tishi").html("密码只能由数字字母组成");
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    }else if (data.password != data.passwordtwo) {
        $(".tishi").show()
        $(".tishi").html("两次密码不一致")
        setTimeout(function () {
            $(".tishi").hide()
        }, 2000)
    }else {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "./uploadregister",
            data: ({
                phone: data.phone,
                yanzheng: data.yanzheng,
                Tphone: data.Tphone,
                password: data.password,
            }),
            success: function (result) {
                if (result.resultCode == 200) {
                    $(".tishi").show()
                    $(".tishi").html("注册成功")
                    setTimeout(function () {
                        $(".tishi").hide();
                        window.location.href = "../login/index";
                    }, 3000);

                } else if (result.resultCode == 300) {
                    $(".tishi").show()
                    $(".tishi").html("验证码有误")
                    setTimeout(function () {
                        $(".tishi").hide()
                    }, 2000)
                } else if (result.resultCode == 400) {
                    $(".tishi").show()
                    $(".tishi").html("该手机号已注册")
                    setTimeout(function () {
                        $(".tishi").hide()
                    }, 2000)
                }
            },
            error: function (err) {
                console.log(err.statusText)

            }
        });
    }

})

//找回密码
$("#Getpasss").submit(function (e) {
    e.preventDefault()
    // console.log("get my pass")
    var data = {
        phone: $("input[name='phone'] ").val(),
        yanzheng: $("input[name='yanzheng'] ").val(),
        password: $("input[name='password'] ").val(),
        passwordtwo: $("input[name='passwordtwo'] ").val(),
    }
    if (!DataJson.checkPhone(data.phone) || data.phone.length != 11) {
        $(".Gtishi").show()
        $(".Gtishi").html("手机号格式不正确")
        setTimeout(function () {
            $(".Gtishi").hide()
        }, 2000)
    } else if (data.password != data.passwordtwo) {
        $(".Gtishi").show()
        $(".Gtishi").html("两次密码不一致")
        setTimeout(function () {
            $(".Gtishi").hide()
        }, 2000)
    } else if (data.password.length != 6 || data.passwordtwo.length != 6) {
        $(".Gtishi").show()
        $(".Gtishi").html("请输入6位数的密码")
        setTimeout(function () {
            $(".Gtishi").hide()
        }, 2000)
    } else {
        // $.ajax({
        //     type: "POST",
        //     dataType: "json",
        //     url: "/users/login",
        //     data: $('#form1').serialize(),
        //     success: function (result) {
        //         if (result.resultCode == 200) {
        //            
        //         }
        //     },
        //     error: function (err) {
        //         console.log(err.statusText)
        //        
        //     }
        // });
    }
})
//修改密码
$(".btn-setpass").click(function (e) {
    e.preventDefault()
    var data = {
        phone: $("input[name='phone'] ").val(),
        pass: $("input[name='pass'] ").val(),
        qpass: $("input[name='qpass'] ").val(),
    }
    if(data.phone=="" || !data.phone){
        // $(".Setishi").show()
        // $(".Setishi").html("请输入旧密码")
        // setTimeout(function () {
        //     $(".Setishi").hide()
        // }, 2000)
        alert("请输入旧密码");
    }else if(data.pass=="" || !data.pass){
        // $(".Setishi").show()
        // $(".Setishi").html("密码不能为空")
        // setTimeout(function () {
        //     $(".Setishi").hide()
        // }, 2000)
        alert("密码不能为空");
    }else if(data.phone==data.pass){
        // $(".Setishi").show()
        // $(".Setishi").html("新密码不能与旧密码相同");
        // setTimeout(function () {
        //     $(".Setishi").hide()
        // }, 2000)
        alert("新密码不能与旧密码相同");
    }else if(data.pass.length<8 || data.pass.length>12){
        // $(".Setishi").show()
        // $(".Setishi").html("密码不能少于8 大于12位");
        // setTimeout(function () {
        //     $(".Setishi").hide()
        // }, 2000)
        alert("密码不能少于8 大于12位");
    }else if(!reg.test(data.pass)){
        // $(".Setishi").show()
        // $(".Setishi").html("密码只能由数字、字母组成");
        // setTimeout(function () {
        //     $(".Setishi").hide()
        // }, 2000)
        alert("密码只能由数字、字母组成");
    }else if(data.pass != data.qpass) {
        // $(".Setishi").show()
        // $(".Setishi").html("两次密码不一致")
        // setTimeout(function () {
        //     $(".Setishi").hide()
        // }, 2000)
        alert("两次密码不一致");
    }else {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Person/uploadsetpass",
            data: ({opass:data.phone,pass:data.pass,qpass:data.qpass}),
            success: function (result) {
                if (result.resultCode == 200) {
                   alert("修改成功");
                   window.location.href = "../login/index";
                }else if(result.resultCode == 300){
                    alert("旧密码输入错误");
                }else if(result.resultCode == 400){
                    alert("两次密码输入不一致");
                }
            },
            error: function (err) {
                console.log(err.statusText)
               
            }
        });
    }
})
//设置支付密码
$(".paypass").click(function (e) {
    e.preventDefault()
    var data = {
        pass: $("input[name='pass'] ").val(),
        password: $("input[name='password'] ").val(),
        passwordtwo: $("input[name='passwordtwo'] ").val(),
    }
    if( data.password.length != 6){
        // console.log("1");
        alert("请输入6位数的支付密码");
        // $(".Payishi").show()
        // $(".Payishi").html("请输入6位数的支付密码")
        // setTimeout(function () {
        //     $(".Payishi").hide()
        // }, 2000)
    }else if(data.password != data.passwordtwo){
        alert("两次密码不一致");
        // $(".Payishi").show()
        // $(".Payishi").html("两次密码不一致")
        // setTimeout(function () {
        //     $(".Payishi").hide()
        // }, 2000)
    }else{
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "../Person/update" ,//url
            data: $("#Paypasss").serialize(),
            success: function (result) {
                // console.log(result);//打印服务端返回的数据(调试用)
                if (result.resultCode==200) {
                    alert("支付密码设置成功");
                    window.location.href = "../index/index";
                }else if(result.resultCode==300){
                    alert("新密码与旧密码一样");
                }else if(result.resultCode==400){
                    alert("密码设置失败");
                }else if(result.resultCode==500){
                    alert("登录密码输入有误");
                }else if(result.resultCode==600){
                    alert("支付密码为6位");
                }
                ;
            },
            error : function() {
                alert("异常！");
            }
        });
    }
})
//登录
$(".btn-login").click(function () {
    var data = {
        phone: $("input[name='phone'] ").val(),
        pass: $("input[name='pass'] ").val()
    }
    if(!DataJson.checkPhone(data.phone) || data.phone.length != 11) {
        $(".Logishi").show()
        $(".Logishi").html("手机号格式不正确")
        setTimeout(function () {
            $(".Logishi").hide()
        }, 2000)
    }else{
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Login/uploadlogin",
            data: ({ phone: data.phone, pass: data.pass }),
            success: function (result) {
                if (result.resultCode == 200) {
                    alert("登陆成功");
                    window.location.href = "../Index/index";
                }else if(result.resultCode == 300){
                    alert("账号密码有误");
                }else if(result.resultCode == 400){
                    alert("账号被禁用");
                }
            },
            error: function (err) {
                console.log(err.statusText)

            }
        });
    }
})




