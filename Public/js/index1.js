$(".dingdan").hide()
$(".nongchang").hide()
$(".userset").hide()

//首页数据代码
function indexs() {
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "../index/mall" ,//url  
        success: function (result) {
            console.log(result.length);
            var html="";
            for(var i=0;i<result.length;i++){
                html+='<li><a  href="">' +
        '<img class="goods-img" src="http://www.test.com/Public/image/goods/'+result[i].image+'" alt="">' +
        '<p>'+result[i].name+'</p>' +
        '<span class="prize">'+result[i].price+'</span>' +
        '  <span class="del">￥'+result[i].oprice+'</span>  ' +
        '</a>' +
        '<img class="add" src="http://www.test.com/Public/YM/imgs/add.png" alt="">' +
        '<li>'
            }
       $(".goods").append(html)
    }
})
}
indexs()









//index 订单  农场  个人中心
function caidan() {
    $("footer").append('<ul>' +
        '<a href="" class="active"><li>'
        + '<img src="http://www.test.com/Public/YM/imgs/shop.png" alt="">' +
        ' <p>商城</p>' +
        '</li></a>' +
        '<a href=""><li>'
        + '<img src="http://www.test.com/Public/YM/imgs/dd.png" alt="">' +
        ' <p>订单</p>' +
        '</li></a>' +
        '<a href="" ><li>'
        + '<img src="http://www.test.com/Public/YM/imgs/nc.png" alt="">' +
        ' <p>农场</p>' +
        '</li></a>' +
        '<a href="" ><li>'
        + '<img src="http://www.test.com/Public/YM/imgs/user.png" alt="">' +
        ' <p>个人中心</p>' +
        '</li></a>' +
        '</ul>')

    var ul = $("footer").find("ul")
    ul.css({
        "height": "50px",
        "overflow": "hidden",
        "background": "white",
    })
    var a = $("footer").find("a")
    a.css({
        "float": "left",
        "text-decoration": "none",
        "width": "25%",
        "font-size": "12px",
        "height": "50px",
        "color": "#666666"
    })
    var li = $("footer").find("ul>a>li")
    li.css({
        "text-align": "center",
        "list-style": "none",
    })
    var img = $("footer").find("ul>a>li>img")
    img.css({
        "width": "25px",
        "height": "25px",
        "margin-bottom": "-2px",
        "margin-top": "4px",
    })
    var p = $("footer").find("ul>a>li>p")
    p.css({
        color: "#666666",
        "padding-top": "3px",
    })
    a.click(function (e) {
        var ins = $(this).index()
        e.preventDefault()
        if (ins == 0) {
            $(this).addClass("active").siblings().removeClass('active')
            $(".index").show()
            $(".dingdan").hide()
            $(".nongchang").hide()
            $(".userset").hide()
            $("div.userInfor").empty();
           
        } else if (ins == 1) {
            $(".index").hide()
            $(".dingdan").show()
            $(".nongchang").hide()
            $(".userset").hide()
           $("div.userInfor").empty();
            $(this).addClass("active").siblings().removeClass('active')
        } else if (ins == 2) {
            $(".index").hide()
            $(".dingdan").hide()
            $(".nongchang").show()
            $(".userset").hide()
            $("div.userInfor").empty();
            $(this).addClass("active").siblings().removeClass('active')
        } else {
            $(".index").hide()
            $(".dingdan").hide()
            $(".nongchang").hide()
            $(".userset").show()
            $("div.userInfor").empty();
            userset()
            $(this).addClass("active").siblings().removeClass('active')

        }
    })
}
caidan()

function userset() {
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "../person/userinfo" ,//url 
        data:({name:'123'}) ,
        success: function (result) {
            console.log(result);
            $(".infor-data").append('<div class="userInfor">'+'<p>会员id:'+result.vipid+'</p>'
                + '<p>昵称:'+result.username+'</p>'
                + '<p>推荐人:'+result.refree+'</p>'
                + '<p>登录名:'+result.tel+'</p>'+'</div>')
            }
        })
}
// userset()

//----------------订单----------------------
$(function () {
    var Dli = $(".dingdan-choose").find("li")
    var dins = $(".dingdan-choose").find("li").index()
    console.log(dins)
    if (dins == 0) {
        $(".all-D").show()
        $(".give-money").hide()
        $(".give-some").hide()
        $(".get-bus").hide()
        var removeBus = $(".coles-D").find("span.removeBus")
        removeBus.click(function () {
            $(this).parents(".all-D-box").remove()
        })
    }
    Dli.click(function () {
        $(this).addClass("active").siblings().removeClass("active")
        var dins = $(this).index()
        if (dins == 0) {
            $(".all-D").show()
            $(".give-money").hide()
            $(".give-some").hide()
            $(".get-bus").hide()
            var removeBus = $(".coles-D").find("span.removeBus")
            removeBus.click(function () {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "/users/login",
                    data: getElementsByTagName("li"),
                    success: function (result) {
                        if (result.resultCode == 200) {
                            $(this).parents(".all-D-box").remove()
                        }
                    },
                    error: function (err) {
                        console.log(err.statusText)
                    }
                });

            })

        } else if (dins == 1) {
            $(".all-D").hide()
            $(".give-money").show()
            $(".give-some").hide()
            $(".get-bus").hide()
            var removeBus = $(".coles-D").find("span.removeBus")
            removeBus.click(function () {
                // $.ajax({
                //     type: "POST",
                //     dataType: "json",
                //     url: "/users/login",
                //     data: $('#form1').serialize(),
                //     success: function (result) {
                //         if (result.resultCode == 200) {
                //             $(this).parents(".all-D-box").remove()
                //         }
                //     },
                //     error: function (err) {
                //         console.log(err.statusText)
                //     }
                // });

            })
            //付款0000000000000000000000---------------------
            var removeBus = $(".coles-D").find("span.myPay")
            myPay.click(function () {
                // $.ajax({
                //     type: "POST",
                //     dataType: "json",
                //     url: "/users/login",
                //     data: $('#form1').serialize(),
                //     success: function (result) {
                //         if (result.resultCode == 200) {
                //             $(this).parents(".all-D-box").remove()
                //         }
                //     },
                //     error: function (err) {
                //         console.log(err.statusText)
                //     }
                // });
            })
        } else if (dins == 2) {
            $(".all-D").hide()
            $(".give-money").hide()
            $(".give-some").show()
            $(".get-bus").hide()
        } else if (dins == 3) {
            $(".all-D").hide()
            $(".give-money").hide()
            $(".give-some").hide()
            $(".get-bus").show()
        }
    })
    //删除 ---- 取消订单

})


$("#forms").submit(function (e) {
    console.log("qwe")
    e.preventDefault()
    // var emails = $("#email").val()
    // var pass = $("#pwd").val()
    // var data = {
    //     emails,
    //     pass
    // }
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
    //     }
    // });
})            