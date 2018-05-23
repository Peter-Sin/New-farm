//加载时要获取大量数据
//先不分流加载


$(function () {
    // $(".adre").hide()
    var imgdefereds = [];
    $('img').each(function () {
        var dfd = $.Deferred();
        $(this).bind('load', function () {
            dfd.resolve();
        }).bind('error', function () {
            alert("图片加载错误")
        })
        if (this.complete) setTimeout(function () {
            dfd.resolve();
        }, 1000);
        imgdefereds.push(dfd);
    })
    $.when.apply(null, imgdefereds).done(function () {
        // $(".adre").hide()
        // $(".Home").show()

    });
})

$(function () {
    var land=$(".land-land");
    for(var i=0;i<land.length;i++){
        var a=land[i].getAttribute("landid");
        var b=land[i].getAttribute("treeid");
        var c=land[i].getAttribute("fruitid");
        var d=land[i].getAttribute("kd");
        if(a==1 && b==1 && c==1){//有地有树有果子
            land.eq(i).find("#land-tree-one").hide();
            land.eq(i).find("#land-tree-two").show();
            land.eq(i).find("#tree-one").hide();
            land.eq(i).find("#tree-two").show();
        }else if(a==1 && b==1 && c==0){//有地有树无果子
            land.eq(i).find("#land-tree-one").hide();
            land.eq(i).find("#land-tree-two").show();
            land.eq(i).find("#tree-one").show();
            land.eq(i).find("#tree-two").hide();
        }else if(a==1 && b==1 && c==3){//有地有树树死
            land.eq(i).find("#land-tree-one").hide();
            land.eq(i).find("#land-tree-two").show();
            land.eq(i).find("#tree-one").hide();
            land.eq(i).find("#tree-two").hide();
            land.eq(i).find("#tree-die").show();
        // }else if(a==1 && b!=1){//有地无树
        //     land.eq(i).find("#land-tree-one").hide();
        //     land.eq(i).find("#land-tree-two").show();
        //     land.eq(i).find("#tree-one").hide();
        //     land.eq(i).find("#tree-two").hide();
        }else if(a!=1 && d!=1){//无地 不可开垦
            land.eq(i).find("#land-tree-one").show();//白土地
            land.eq(i).find("#land-tree-two").hide();//黑土地
            land.eq(i).find("#tree-one").hide();//无果树
            land.eq(i).find("#tree-two").hide();//有果树
        }else if(a!=1 && d==1){//无地 可开垦
            // console.log("可开垦");
            land.eq(i).find("#land-tree-one").show();//白土地
            land.eq(i).find("#land-tree-two").hide();//黑土地
            land.eq(i).find("#tree-one").hide();//无果树
            land.eq(i).find("#kd").hide();//有果树
            land.eq(i).find("#kd").show();//kaidi
        }
    }
})

function fruittrade(a){
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "../Farm/trade",
        data:({abc:a}),
        success: function (result) {
            if(result.resultCode==200){
                if(a==0){
                    var num=result.num;
                    var transaction_fee=result.transaction_fee;
                    var trade_exchange=result.trade_exchange;
                    $(".num-fruit").html(num);
                    $(".transaction_fee").html(transaction_fee);
                    $(".trade_exchange").html(trade_exchange);
                }
            }
        }
    })
}

$(".oneOk").click(function(){
    // e.preventDefault()
    var Had = parseInt($(".num-fruit").text());
    var busData = {
        userId: $("input[name='giveId']").val(),
        somefruit: parseInt($("input[name='giveNum']").val()),
        pass: $("input[type='password']").val()
    }
    if (busData.userId.length != 11) {
        // $(".Infor").html("ID长度不够11位--或者没有此ID")
        // $(".Infor").css("display", "block")
        alert("ID长度不够11位--或者没有此ID");
        setTimeout(function () {
            $(".Infor").hide()
        }, 2000)
    } else if ((Had - busData.somefruit) < 0) {
        // $(".Infor").html("您没有那么多")
        // $(".Infor").css("display", "block")
        alert("您没有那么多");
        setTimeout(function () {
            $(".Infor").hide()
        }, 2000)
    }else if(busData.somefruit<0){
        alert("果子数量不能小于0");
        setTimeout(function () {
            $(".Infor").hide()
        }, 2000)
    }else if(busData.somefruit==0){
        alert("果子数量不能为0");
        setTimeout(function () {
            $(".Infor").hide()
        }, 2000)
    }else if(confirm("你确认进行交易")){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Farm/trading",
            data: busData,
            success: function (result) {
                if (result.resultCode == 200) {
                    $(".AlertBox").fadeOut(50)
                    $(".Jiaoyi").fadeOut(70)
                    alert("交易成功");
                    window.location.reload();
                    // console.log($(".AlertBox"));
                    // $(".AlertBox").fadeIn(50);
                    // $(".Jiaoyi").fadeIn(70);
                }else if(result.resultCode == 300){
                    alert("支付密码有误");
                }else if(result.resultCode == 400){
                    alert("获赠号码有误");
                }else if(result.resultCode == 500){
                    alert("果子数量不足");
                }else if(result.resultCode == 600){
                    alert("获赠人不能为自己");
                }
            },
            error: function (err) {
                console.log(err.statusText)
                $("#datt").append("<p>" + err.statusText + "</p>")
                setTimeout(function () {
                    $("#datt").remove()
                }, 3000)
            }
        });
    }
})

// var Lis = $(".ifC").find("li")
// Lis.click(function () {
//     console.log($(this))
// })


$(function () {
//     var boll = "3";
//     $(".ifC").find("li").click(function(){
//         var num=$(this).index();
//         var kd=$(this).attr("kd");
//         if(boll == "3"){
//             if(kd==1){
//                 $.ajax({
//                     type: "POST",
//                     dataType: "json",
//                     url: "../Farm/getlastland",
//                     data: ({num:num}),
//                     success: function (result) {
//                         if (result.resultCode == 200) {
//                             alert("开地成功");
//                             window.location.reload();
//                         }else if(result.resultCode == 300){
//                             alert("开地失败");
//                         }else if(result.resultCode == 400){
//                             alert("开地周期未达到，暂不可开地");
//                         }else if(result.resultCode == 500){
//                             alert("果子数量不足");
//                         }
//                     }
//                 })
//             }
//         }
        // else{
        //     console.log("此处暂不可开地");
        // }
    // })
    $(".U-Box li").click(function () {

        var ins = $(this).index();
        $(this).css({
            "transform": "scale(1.2)"
        })
        var classid=$(this).attr("classid");
        var that = $(this)
        setTimeout(function () {
            that.css({
                "transform": "scale(1)"
            })
        }, 500)
        if(ins == 0){
            boll = "1";
            var Lis = $(".ifC").find("li");
            Lis.on("click",(function () {
                if(boll== "1"){
                    boll = "3";
                    var ins = $(this).index() + 1;
                    var landid = $(this).attr("landid");
                    var treeid = $(this).attr("treeid");
                    var fruitid = $(this).attr("fruitid");
                    var kd=$(this).attr("kd");
                    var thiss = $(this);
                    if (landid != 1 && treeid != 1 && kd==1) {
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "../Farm/planting",
                            data: ({abc: ins}),
                            success: function (result) {
                                if (result.resultCode == 200) {
                                    alert("栽种成功");
                                    window.location.reload();
                                }else if(result.resultCode == 300) {
                                    alert("果子数量不足");
                                }else if(result.resultCode == 400){
                                    alert("栽种失败");
                                }else if(result.resultCode == 500){
                                    alert("未达到开地周期，暂不可栽种");
                                }
                            }
                        })
                    } else {
                        alert("不可栽种");
                    }
                }
            }))
            }else if(ins == 1){//chanchu
                // boll = "2";
                // var Lis = $(".ifC").find("li");
                  // Lis.click(function () {
                    window.location.reload();
                      // var landid = $(this).attr("landid");
                      // var treeid = $(this).attr("treeid");
                      // if (boll == "2") {
                      //     boll = "3";
                      //     if(landid==1 && treeid==1) {
                      //         var num = $(this).index();
                      //         var fruitid = $(this).attr("fruitid");
                      //         if (fruitid == 1) {
                      //             var information = "您的果子还未收获，确定要铲除吗？";
                      //         } else {
                      //             var information = "您的果子还未成熟，确定要铲除吗？";
                      //         }
                      //         $(".AlertBox").fadeIn(50);
                      //         $(".Z_Alert").fadeIn(70);
                      //         $(".Z_infor").html(information);
                      //         $(".Z__Q").click(function (){
                      //             $(".AlertBox").fadeOut(50);
                      //             $(".Z_Alert").fadeOut(70);
                      //             $.ajax({
                      //                 type: "POST",
                      //                 dataType: "json",
                      //                 url: "../Farm/xiuli",
                      //                 data: ({abc:ins,num:num+1}),
                      //                 success: function (result) {
                      //                     if (result.resultCode == 200) {
                      //                         alert("已铲除");
                      //                         window.location.reload();
                      //                     }else if(result.resultCode == 300){
                      //                         alert("铲除失败");
                      //                     }
                      //                 }
                      //             })
                      //         })
                      //     }else{
                      //         alert("没有果树可以铲除");
                      //     }
                      // }
                  // })

            }else if (ins == 2) {
                // $.ajax({
                //     type: "POST",
                //     dataType: "json",
                //     url: "../Farm/getlandnum",
                //     // data:({abc:ins}),
                //     success: function (result) {
                //         if(result.resultCode==200){
                            $(".AlertBox").fadeIn(50)
                            $(".Jiaoyi").fadeIn(70)
                            fruittrade(0);
                            $(".J_lis1").hide();
                            $(".J_lis11").show();
                            $(".J_lis2").show();
                            $(".J_lis22").hide();
                            $(".J_lis3").show();
                            $(".J_lis33").hide();
                            $(".dnfs").show()
                //         }else if(result.resultCode==300){
                //             alert("土地数量不足，暂时无法交易");
                //         }
                //     }
                // })

            }else if(ins == 3){
                if(confirm("你确认收货果子")){
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "../Farm/xiuli",
                        data:({abc:ins}),
                        success: function (result) {
                            if(result.resultCode==200){
                                alert("已收获");
                                window.location.reload();
                            }else if(result.resultCode==300){
                                alert("暂无可收获果子");
                            }else if(result.resultCode==400){
                                alert("收获失败");
                            }
                        }
                    }) 
                }
            }else if (ins == 4) {
                $(".dnfs").show()
                $(".AlertBox").fadeIn(50)
                $(".Email").fadeIn(50)
                var startTime = new Date().getTime();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "../Farm/letter",
                    // data:({abc:ins}),
                    success: function (result) {
                            var endTime1  = new Date().getTime();
                            var b = endTime1 - startTime;
                            // console.log(startTime);
                            console.log(b);
                        if(result.resultCode==200){
                            
                            var html="";
                            var information=result.data;
                            for(var key in information){
                                html += '<p class="T-infor" pid="'+information[key].id+'">'+
                                    '<span class="T-num">'+information[key].content+'</span>'+
                                    '<span class="T-time">--'+information[key].time+'</span>'+
                                    '</p>'
                            }
                            $(".letter").append(html);
                            var endTime2  = new Date().getTime();
                        var a = endTime2 - startTime;
                        console.log(startTime);
                        console.log(a);
                        }
                    }
                })

            }
    })
})

$(function () {
    $(".T_Q").click(function () {
        var information = "您确定要清空邮箱吗？";
         $(".Email").fadeOut(50);
         $(".Z_Alert").fadeIn(70);
         $(".Z_infor").html(information);
         $(".Z__Q").click(function (){
            $(".AlertBox").fadeOut(50);
            $(".Z_Alert").fadeOut(70);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "../Farm/deleteallletter",
                success: function (result) {
                    if(result.resultCode==200){
                        alert("邮箱已清空");
                        window.location.reload();
                    }else if(result.resultCode==300){
                        alert("邮箱清空失败");
                    }
                }
            })
         })
    })
    $(".T_D").click(function () {
        var boll = "1";
        $(".T-infor").click(function () {
            if (boll == 1) {
                boll = "3";
                var pid = $(this).attr("pid");
                var thiss = $(this);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "../Farm/deleteletter",
                    data:({pid:pid}),
                    success: function (result) {
                        if(result.resultCode==200){
                            alert("删除成功");
                            thiss.hide();
                        }else if(result.resultCode==200){
                            alert("删除成失败");
                        }
                    }
                })
            }
        })
    })
})



// 动画1    不用别释放
// $(function () {
//     var num = 5
//     var time = setInterval(function () {
//         num--
//         $(".wait").html(num)
//         if (num == 4) {
//             $(".wait").css({
//                 "background-color": "rgb(11, 226, 22)",
//                 "color": "rgb(215, 12, 233)"
//             })
//         } else if (num == 3) {
//             $(".wait").css({
//                 "background-color": "rgb(215, 12, 233)",
//                 "color": "rgb(56, 233, 12)"
//             })
//         } else if (num == 2) {
//             $(".wait").css({
//                 "background-color": "rgb(56, 233, 12)",
//                 "color": "rgb(233, 12, 86)"
//             })
//         } else if (num == 1) {
//             $(".wait").css({
//                 "background-color": "rgb(233, 12, 86)",
//                 "color": "rgb(11, 226, 190)"
//             })
//         } else if (num == 0) {
//             $(".wait").css({
//                 "background-color": "white",
//             })
//         }
//         if (num <= 0) {
//             clearInterval(time)
//             $(".BBB").empty(".wait")
//             $(".adre").fadeIn()
//             $(".A-top").animate({
//                 "margin-top": 0
//             }, 3000)
//             $(".A-down").animate({
//                 "margin-top": 0
//             }, 3000)
//             setTimeout(function () {
//                 $(".btn").animate({
//                     "margin-left": 0
//                 }, 600)
//             }, 3000)
//         }
//     }, 1000)

//     $(".btn").click(function () {
//         $(".adre").fadeOut(100).empty("div")
//         $(".Home").fadeIn(200)
//     })
// })





$(function () {
    $(".Jclose").click(function () {
        $(".AlertBox").fadeOut(50);
        $(".Jiaoyi").fadeOut(70);
        $(".dnfs").hide();
    })
    $(".Z_close").click(function () {
        $(".AlertBox").fadeOut(50);
        $(".Getrees").fadeOut(70);
        $(".Buss").fadeOut(50);
        $(".dnfs").hide();
    })
    $(".Eclose").click(function () {
        $(".AlertBox").fadeOut(50);
        $(".Email").fadeOut(70);
        $(".dnfs").hide();
        $(".letter").empty();
    })
    $(".J_lis1").click(function () {
        $(".jb2").attr("src", "/Public/img/alert/jiaoyi/j1.png");
        $(".one-img1").attr("src", "/Public/img/alert/jiaoyi/1.png");
        $(".TWO").fadeOut(50);
        $(".one").fadeIn(50);
        $(".Three").fadeOut(50);
        $(".Three").find(".three_box").empty();
        $(".TWO").find(".three_box").empty();
        $(".J_lis1").hide();
        $(".J_lis11").show();
        $(".J_lis2").show();
        $(".J_lis22").hide();
        $(".J_lis3").show();
        $(".J_lis33").hide();
    })
    $(".J_lis2").click(function () {
        var abc=1;
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Farm/trade",
            data:({abc:abc}),
            success: function (result) {
                if(result.resultCode==200){
                    $(".jb2").attr("src", "/Public/img/alert/jiaoyi/j1.png");
                    $(".one-img1").attr("src", "/Public/img/alert/jiaoyi/2.png");
                    $(".Three").find(".three_box").empty();
                    $(".TWO").fadeIn(50);
                    $(".one").fadeOut(50);
                    $(".Three").fadeOut(50);
                    var html='';
                    for(var i=0;i<result.num.length;i++){
                        html+='<div>' +
                            '<p><span>时间：</span>'+
                            '<span>'+result.num[i].time+'</span></p>' +
                            '<p><span>数量：</span>' +
                            '<span>'+result.num[i].num+'</span></p>' +
                            '<p><span>身份：</span><span>转让者</span></p>' +
                            '<p><span>ID：</span><span>'+result.num[i].vipid+'</span></p>' +
                            '<p class="klkl"><span>昵称：</span><span>'+result.num[i].username+'</span></p>'
                            // '<p><span>更新时间：</span><span>2015-12-88 21:45:79</span></p>' +
                            // '<p><span>订单状态：</span><span style="color:rgb(15, 238, 15)">交易已经完成</span></p>'+
                        '</div>'
                    }
                    $(".TWO").find(".two_box").append(html);
                    $(".J_lis1").show();
                    $(".J_lis11").hide();
                    $(".J_lis2").hide();
                    $(".J_lis22").show();
                    $(".J_lis3").show();
                    $(".J_lis33").hide();
                }
            }
        })
    })
    $(".J_lis3").click(function () {
        var abc=2;
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Farm/trade",
            data:({abc:abc}),
            success: function (result) {
                if(result.resultCode==200){
                    $(".jb2").attr("src", "/Public/img/alert/jiaoyi/j1.png");
                    $(".one-img1").attr("src", "/Public/img/alert/jiaoyi/3.png");
                    $(".TWO").find(".three_box").empty();
                    $(".TWO").fadeOut(50);
                    $(".one").fadeOut(50);
                    $(".Three").fadeIn(50);
                    var html='';
                    for(var i=0;i<result.num.length;i++){
                        html+='<div>'+
                            '<p><span>时间：</span><span>'+result.num[i].time+'</span></p>'+
                        '<p><span>数量：</span><span>'+result.num[i].realnum+'</span></p>'+
                        '<p><span>身份：</span><span>'+'被转让者'+'</span></p>'+
                        '<p><span>ID：</span><span>'+result.num[i].vipid+'</span></p>'+
                        '<p><span>昵称：</span><span>'+result.num[i].username+'</span></p>'+
                        // '<p><span>更新时间：</span><span>'+1999-12-88 21:45:79+'</span></p>'+
                        // '<p><span>订单状态：</span><span style="color:rgb(15, 238, 15)">'+交易已经完成+'</span></p>'+
                        '</div>'
                    }
                    $(".Three").find(".three_box").append(html);
                    $(".J_lis1").show();
                    $(".J_lis11").hide();
                    $(".J_lis2").show();
                    $(".J_lis22").hide();
                    $(".J_lis3").hide();
                    $(".J_lis33").show();
                }
            }
        })

        $(".jb2").attr("src", "/Public/img/alert/jiaoyi/j1.png");
        $(".one-img1").attr("src", "/Public/img/alert/jiaoyi/3.png");
        $(".Three").fadeIn(50);
        $(".one").fadeOut(50);
        $(".TWO").fadeOut(50);
        $(".TWO").find(".three_box").empty();
    })

    $(".TB-right").click(function () {
        $.ajax({
                type: "POST",
                dataType: "json",
                url: "../Farm/rateinfo",
                // data:({num:num}),
                success: function (result) {
                    if (result.resultCode == 200) {

                        console.log(result.data)
                        var arrss = result.data
                        for(var i=0;i<arrss.length;i++){
                            $(".G_infor p").eq(i).text(arrss[i].land+"块地")
                            $(".G_infor2 p").eq(i).text("利率"+arrss[i].rate)
                            $(".G_infor3 p").eq(i).text("产"+arrss[i].num)
                        }

                        $(".AlertBox").fadeIn(50);
                        $(".Getrees").fadeIn(50);
                        $(".dnfs").show();
                    }else if(result.resultCode == 300){
                        // alert("果子数量不足");
                    }
                }
            })
       
    })
    $("#GetG").click(()=>  {
        $(".AlertBox").fadeIn(50)
        $(".Buss").fadeIn(50);
        $(".dnfs").show();
    })

    $("#Busser").click(()=>{
        var num=$("input[name='trees']").val();
        if(num==0){
            alert("兑换数量不能为0");
        }else if(num<0){
            alert("兑换数量不能小于0");
        }else if(confirm("你确认兑换果子")){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "../Farm/exchange",
                data:({num:num}),
                success: function (result) {
                    if (result.resultCode == 200) {
                        alert("兑换成功");
                        window.location.reload();
                    }else if(result.resultCode == 300){
                        alert("果子数量不足");
                    }
                }
            })
        }
    })
})

//返回个人中心
$(function() {
    var shopS = $(".shopping");
    $(".left-img").click(function () {
        window.location.href = "../Index/index?num=3";
    })
})
