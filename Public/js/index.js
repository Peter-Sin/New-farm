(function () {
    var num=$(".In-Top").attr("show");
    var shopS = $(".shopping");
    if(num == 1){
        $(".shop-mall").addClass("active").siblings().removeClass('active');
        $(".dingdan").hide();
        $(".nongchang").hide();
        $(".userset").hide()
        shopS.show();
    }else if(num == 3){
        $(".person-info").addClass("active").siblings().removeClass('active')
        $(".index").hide();
        $(".dingdan").hide();
        $(".nongchang").hide();
        $(".userset").show();
        shopS.hide();
        userset();
    }
    $(".enter-onemoney").click(function(e){
        e.preventDefault();
        var uid=$(".footer").attr("islogin");
        if(uid==2){
            window.location.href = "../Index/onemoney";
        }else{
            window.location.href = "../Login/index";
        }
    })

})()

function count(o){
    var t = typeof o;
    if(t == 'string'){
        return o.length;
    }else if(t == 'object'){
        var n = 0;
        for(var i in o){
            n++;
        }
        return n;
    }
    return false;
}
//首页数据代码
function indexs(a) {
    var test = window.location.host;
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "../index/mall" ,//url 
        data:({classify:a}) ,
        success: function (result) {
            $(".footer").attr('islogin',result.is_login);
            var html="";
            var resnum=count(result.data);
            for(var i=0;i<resnum;i++){
                html += '<li class="HHH">'+
                '<a href="http://'+test+'/index.php/Home/Goods/goodsinfo?id='+result.data[i].id+'" GoodId='+result.data[i].id +'>'+
                '<img style="height:172px" class="goods-img"  src="http://'+test+'/Public/image/goods/'+result.data[i].image+'" alt="">'+
                '<p>'+result.data[i].name+'</p>'+
                '<span class="prize">￥:'+result.data[i].price+'+'+result.data[i].voucher+'代金券</span>' +
                '<p>'+
                    '<span class="del">￥'+result.data[i].oprice+'</span>'+
                    '<p/>'+
                '</a>'+
                '<span id="goodsid" style="display:none;">'+result.data[i].id+'</span>'+
                '<img class="adds" cid="'+result.data[i].classify+'" style="width: 25px;margin-top: -15%;float: right;" src="http://'+test+'/Public/YM/imgs/add.png" alt="">'+
                '</li>'
            } 

            // $(function () {
            //     // $(".adre").hide()
            //     var imgdefereds = [];
            //     $('img').each(function () {
            //         var dfd = $.Deferred();
            //         $(this).bind('load', function () {
            //             dfd.resolve();
            //         }).bind('error', function () {
            //             alert("图片加载错误")
            //         })
            //         if (this.complete) setTimeout(function () {
            //             dfd.resolve();
            //         }, 1000);
            //         imgdefereds.push(dfd);
            //     })
            //     $.when.apply(null, imgdefereds).done(function () {
            //        alert("1")
                    
            //     });
            // })

            $("#shoppingnum").html(result.shopcar_num)   
            $(".goods").empty();
            $(".goods").append(html)
            var adds = $(".goods").find("img.adds")
            adds.click(function () {
                var GoodId=$(this).siblings("a").attr("GoodId");
                var cid=$(this).attr("cid");
                var num=1;
                var islogin=$(".footer").attr("islogin");
                var goodsnum=$(".shopping").find("span").html();
                if(islogin){
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "../shopcar/addShopcar",
                        data:({cid:cid,pid:GoodId,num:num}),
                        success: function (result) {
                            if (result.resultCode == 200) {
                                goodsnum++;
                                $("#shoppingnum").html(goodsnum)
                                // 添加成功时的弹窗
                                $(".in-tishi").fadeIn(500)
                                // 1.5秒之后弹窗消失
                                setTimeout(function () {
                                    $(".in-tishi").fadeOut(500)
                                }, 1500)
                            }
                        },
                        error: function (err) {
                            console.log(err.statusText)
                        }
                    });
                }else{
                    window.location.href = "../login/index";
                }

            })
        }
    })
}
indexs(0)

function removebus(goodsid,that){
	$.ajax({
        type: "POST",
        dataType: "json",
        url: "../Order/removeBus",
        data: ({ordernum:goodsid}),
        success: function (result) {
            if (result.code == 200) {
                alert("订单已取消");
                that.parents(".all-D-box").remove()
            }else if(result.code == 200){
                alert("取消订单失败");
            }
        },
        error: function (err) {
            console.log(err.statusText)
        }
    });
}

function orderlist(a) {
    var test = window.location.host;
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "../order/orderlist" ,//url 
        data:({name:a}) ,
        success: function (result) {
            if (a == 10) {
                var html = "";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].step == 0) {
                        html += '<div class="all-D-box">' +
                            '<p class="all-D-top">' +
                            '<span>' + result.data[i].uptime + '</span>' +
                            '<span>' + result.data[i].status + '</span>' +
                            '</p>' +
                            '<div class="all-D-div" id="all-D-div'+i+'">' +
                            '</div>' +
                            '<p class="coles-D">' +
                            '<span class="removeBus" GoodId=' + result.data[i].ordernum + '>取消订单</span>' +
                            '<span class="myPay"><a href="http://' + test + '/index.php/home/order/dowxpay?id=' + result.data[i].ordernum + '">付款</a></span>' +
                            '</p>' +
                            '</div>'
                    } else if (result.data[i].step == 1) {
                        html += '<div class="all-D-box">' +
                            '<p class="all-D-top">' +
                            '<span>' + result.data[i].uptime + '</span>' +
                            '<span>' + result.data[i].status + '</span>' +
                            '</p>' +
                            '<div class="all-D-div" id="all-D-div'+i+'">' +
                            '</div>' +
                            '<p class="coles-G">' +
                            '商家正在接受中，请耐心等待！' +
                            '</p>' +
                            '</div>'
                    } else if (result.data[i].step == 2) {
                        html += '<div class="all-D-box">' +
                            '<p class="all-D-top">' +
                            '<span>' + result.data[i].uptime + '</span>' +
                            '<span>' + result.data[i].status + '</span>' +
                            '</p>' +
                            '<div class="all-D-div" id="all-D-div'+i+'">' +
                            '</div>' +
                            '<div class="coles-Get">' +
                            '<p class="Get-left">' +
                            '<span class="wuliu">物流编号:' +
                            '<small id="Wuliu">1234567890123</small>' +
                            '</span>' +
                            '<button class="Get-infors" data-clipboard-action="copy" data-clipboard-target="#Wuliu">复制</button>' +
                            '</p>' +
                            '<span class="Get-right">确认收货</span>' +
                            '</div>' +
                            '</div>'
                    }
                }

                $(".all-D").append('<div class="all-D0">' + html + '</div>');
                var removeBus = $(".coles-D").find("span.removeBus")
                removeBus.click(function () {
                    var GoodId = $(this).attr("GoodId")
                    var that = $(this)
                    removebus(GoodId, that)
                })
            } else if (a == 0) {
                var html = "";
                for (var i = 0; i < result.data.length; i++) {
                    html += '<div class="all-D-box">' +
                        '<p class="all-D-top">' +
                        '<span>' + result.data[i].uptime + '</span>' +
                        '<span>' + result.data[i].status + '</span>' +
                        '</p>' +
                        '<div class="all-D-div" id="all-D-div'+i+'">' +
                        '</div>' +
                        '<p class="coles-D">' +
                        '<span class="removeBus" GoodId=' + result.data[i].ordernum + '>取消订单</span>' +
                        '<span class="myPay"><a href="http://' + test + '/index.php/home/order/dowxpay?id=' + result.data[i].ordernum + '">付款</a></span>' +
                        '</p>' +
                        '</div>'
                }
                $(".give-money").append('<div class="give-money1">' + html + '</div>')
                var removeBus = $(".coles-D").find("span.removeBus")
                removeBus.click(function () {
                    var GoodId = $(this).attr("GoodId")
                    var that = $(this)
                    removebus(GoodId, that)
                })
            } else if (a == 1) {
                var html = "";
                for (var i = 0; i < result.data.length; i++) {
                    html += '<div class="all-D-box">' +
                        '<p class="all-D-top">' +
                        '<span>' + result.data[i].uptime + '</span>' +
                        '<span>' + result.data[i].status + '</span>' +
                        '</p>' +
                        '<div class="all-D-div" id="all-D-div'+i+'">' +
                        '</div>' +
                        '<p class="coles-G">' +
                        '商家正在接受中，请耐心等待！' +
                        '</p>' +
                        '</div>'
                }
                $(".give-some").append('<div class="give-some2">' + html + '</div>')
            } else if (a == 2) {
                var html = "";
                for (var i = 0; i < result.data.length; i++) {
                    html += '<div class="all-D-box">' +
                        '<p class="all-D-top">' +
                        '<span>' + result.data[i].uptime + '</span>' +
                        '<span>' + result.data[i].status + '</span>' +
                        '</p>' +
                        '<div class="all-D-div" id="all-D-div'+i+'">' +
                        '</div>' +
                        '<div class="coles-Get">' +
                        '<p class="Get-left">' +
                        '<span class="wuliu">物流编号:' +
                        '<small id="Wuliu">1234567890123</small>' +
                        '</span>' +
                        '<button class="Get-infors" data-clipboard-action="copy" data-clipboard-target="#Wuliu">复制</button>' +
                        '</p>' +
                        '<span class="Get-right">确认收货</span>' +
                        '</div>' +
                        '</div>'
                }
                $(".get-bus").append('<div class="get-bus3">' + html + '</div>')
            }
            for (var j = 0; j < result.info.length; j++) {
                var htmlgoods = '';
                for (var k = 0; k < result.info[j].length; k++) {
                    htmlgoods += '<div class="goods_lists"><img  src="http://' + test + '/Public/image/goods/' + result.info[j][k].image + '" alt="">' +
                        '<p>' + result.info[j][k].pname + '</p>' +
                        '<p>' +
                        '<span>￥:' + result.info[j][k].price + '+' + result.info[j][k].voucher + '代金券</span>' +
                        '<span>x' + result.info[j][k].num + '</span>' +
                        '</p></div>';
                }
                $("#all-D-div"+j).empty();
                $("#all-D-div"+j).append(htmlgoods);
            }
        }
    })
}

//index 订单  农场  个人中心
function caidan() {
    var ul = $("footer").find("ul");
    ul.css({
        "height": "50px",
        "overflow": "hidden",
        "background": "white",
    })
    var a = $("footer").find("a");
    a.css({
        "float": "left",
        "text-decoration": "none",
        "width": "25%",
        "font-size": "12px",
        "height": "50px",
        "color": "#666666"
    })
    var li = $("footer").find("ul>a>li");
    li.css({
        "text-align": "center",
        "list-style": "none",
    })
    var img = $("footer").find("ul>a>li>img");
    img.css({
        "width": "25px",
        "height": "25px",
        "margin-bottom": "-2px",
        "margin-top": "4px",
    })
    var p = $("footer").find("ul>a>li>p");
    p.css({
        color: "#666666",
        "padding-top": "3px",
    })
    var shopS = $(".shopping");
    a.click(function (e) {
        var uid=$(".footer").attr("islogin");
        var ins = $(this).index();
        e.preventDefault();
        if (ins == 0) {
            $(this).addClass("active").siblings().removeClass('active');
            $(".index").show();
            $(".dingdan").hide();
            $(".nongchang").hide();
            $(".userset").hide();
            // $("div.userInfor").empty();
            shopS.show();
        } else if (ins == 1) {
            if(uid) {
                $(".index").hide();
                $(".dingdan").show();
                // $(".dingdan").empty();
                $(".nongchang").hide();
                $(".userset").hide();
                shopS.hide();
                $(this).addClass("active").siblings().removeClass('active');
                orderlist("10")
            }else{
                window.location.href="../login/index";
            }
        } else if (ins == 2) {
            if(uid) {
                $(".index").hide();
                $(".dingdan").hide();
                $(".nongchang").show();
                $(".userset").hide();
                shopS.hide();
                window.location.href="../farm/index";
                $(this).addClass("active").siblings().removeClass('active')
            }else {
                window.location.href = "../login/index";
            }
        } else {
            if(uid) {
                userset();
                $(".index").hide();
                $(".dingdan").hide();
                $(".nongchang").hide();
                $(".userset").show();
                shopS.hide();
                $(this).addClass("active").siblings().removeClass('active')
            }else {
                window.location.href = "../login/index";
            }
        }
    })
}
caidan()

function userset() {
    var test = window.location.host;
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "../person/userinfo" ,//url 
        data:({name:'123'}) ,
        success: function (result) {
            $(".faceimg").attr('src','http://'+test+result.faceimg);
            $(".vipid").html(result.vipid);
            $(".username").html(result.username);
            $(".referee").html(result.referee);
            $(".telphone").html(result.telphone);
            $(".land-price").html(result.landprice);
            $(".fruit-price").html(result.fruitnum);
            $(".voucher-price").html(result.vouchernum);
            }
        })
}


//----------------订单----------------------
$(function () {
    var Dli = $(".dingdan-choose").find("li");
    var dins = $(".dingdan-choose").find("li").index();
    if (dins == 0) {
        $(".all-D").show();
        $(".give-money").hide();
        $(".give-some").hide();
        $(".get-bus").hide();
        $("div.give-money1").empty();
        $("div.give-some2").empty();
        $("div.get-bus3").empty();
        var removeBus = $(".coles-D").find("span.removeBus");
        removeBus.click(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "./order/orderlist",
                // data: $('#form1').serialize(),
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

    }

 


    //删除 ---- 取消订单
     Dli.click(function () {
        $(this).addClass("active").siblings().removeClass("active");
        var dins = $(this).index();
        console.log(dins);
        if (dins == 0) {//全部
            $(".all-D").show();
            orderlist("10");
            $(".give-money").hide();
            $(".give-some").hide();
            $(".get-bus").hide();
            $("div.give-money1").empty();
            $("div.give-some2").empty();
            $("div.get-bus3").empty();
        } else if (dins == 1) {//代付款
            $(".all-D").hide();
            $(".give-money").show();
            $(".give-some").hide();
            $(".get-bus").hide();
            $("div.all-D0").empty();
            $("div.give-some2").empty();
            $("div.get-bus3").empty();
            orderlist("0");
            var removeBus = $(".coles-D").find("span.removeBus");
            removeBus.click(function () {
            	$(this).parents(".all-D-box").remove();
                // $.ajax({
                //     type: "POST",
                //     dataType: "json",
                //     url: "/users/logins",
                //     // data: $('#form1').serialize(),
                //     success: function (result) {
                //         console.log(result);
                //         if (result.resultCode == 200) {
                //             $(this).parents(".all-D-box").remove()
                //         }
                //     },
                //     error: function (err) {
                //         console.log(err.statusText)
                //     }
                // });

            })
            //付款
            var myPay = $(".coles-D").find("span.myPay");
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
        } else if (dins == 2) {//代发货
            $(".all-D").hide();
            $(".give-money").hide();
            $(".give-some").show();
            $(".get-bus").hide();
            $("div.all-D0").empty();
            $("div.give-money1").empty();
            $("div.get-bus3").empty();
            orderlist("1")
        } else if (dins == 3) {//待收货
            $(".all-D").hide();
            $(".give-money").hide();
            $(".give-some").hide();
            $(".get-bus").show();
            $("div.all-D0").empty();
            $("div.give-money1").empty();
            $("div.give-some2").empty();
            orderlist("2");
            //确认支付
            var GetOk = $(".coles-Get").find("span.Get-right");
            GetOk.click(function () {
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
                // console.log("index" + 244)
            })

            //物流代码，复制粘贴
            var Getinfors = $(".Get-left").find("button.Get-infors");
            Getinfors.click(function () {
                var wuliu = $("#Wuliu").text();
                var clipboard = new Clipboard('.Get-infors');
                clipboard.on('success', function (e) {
                    console.log("文字已复制到剪贴板中");
                    console.log(e.text);
                });

                clipboard.on('error', function (e) {
                    console.log("异常错误： " + JSON.stringify(e));
                    console.log(e);
                });
            })
            //查询
            $(".search-bud").submit(function (e) {
                console.log("物流");
                e.preventDefault();
                var biangao = $("#wuliu").val();
                var data = {
                    biangao
                }
                console.log(data.biangao)
                // $.ajax({
                //     type: "POST",
                //     dataType: "json",
                //     url: "/users/login",
                //     data: $('#form1').serialize(),
                //     success: function (result) {
                //         if (result.resultCode == 200) {

                //         }
                //     },
                //     error: function (err) {
                //         console.log(err.statusText)
                //     }
                // });
            })

        }
    })


})
//添加购物车
// function ADD(adds) {
//     // body...
//      console.log("123123123123")
// }
// $(function () {
//     var shopcar = $(".shopping").find("img")
//     shopcar.click(function () {
//         console.log("123123123123123");

        // $.ajax({
        //     type: "POST",
        //     dataType: "json",
        //     url: "/users/login",
        //     data: $('#form1').serialize(),
        //     success: function (result) {
        //         if (result.resultCode == 200) {
        // 添加成功时的弹窗
        // $(".in-tishi").fadeIn(500)
        // 1.5秒之后弹窗消失
        // setTimeout(function () {
        //     $(".in-tishi").fadeOut(500)
        // }, 1500)
        //         }
        //     },
        //     error: function (err) {
        //         console.log(err.statusText)
        //     }
        // });

    // })
// })
//前往购物车
$(function () {
    var goshop = $(".shopping").find("img");
    goshop.click(function () {
        var uid=$("footer").attr("islogin");
        if(uid==2){
            window.location.href="../shopcar/shopcar";
        }else{
            window.location.href="../Login/index";
        }
        // console.log("123")
        // $.ajax({
        //     type: "POST",
        //     dataType: "json",
        //     url: "/",
        //     data: $('#form1').serialize(),
        //     success: function (result) {
        //         if (result.resultCode == 200) {
                  
        //         }
        //     },
        //     error: function (err) {
        //         console.log(err.statusText)
        //     }
        // });
    })
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

$(".logout").click(function () {
    $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Login/logout",
            // data: $('#form1').serialize(),
            success: function (result) {
                if (result.resultCode == 200) {
                    alert("退出成功");
                    window.location.href="../Login/index";
                }
            },
            error: function (err) {
                console.log(err.statusText)
            }
        });
    })




document.onreadystatechange = loadingChange;  
function loadingChange() {
    // console.log(document.readyState)
    if (document.readyState == "complete") { 
        // console.log(document.readyState)
       // console.log("资源加载完毕")
    }
}