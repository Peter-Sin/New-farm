$(function () {
    var back = $(".nav-bar").find("img.back")
    back.click(function () {
        location.href = "../Index/index?num=3";
    })
})


$(function () {
    var Oget = $(".Duobao").find("button.Oget")
    Oget.click(function () {
        var name = $(this).siblings(".Duo-div").children("#O-D").text()
        var pid = $(this).siblings(".Odtime").attr("pid")
         
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Index/onclicknum",
            data: ({pid:pid}),
            success: function (result) {
                var html="";
                html='<div  class="O-alert">' +
                    ' <img class="closes" src="http://www.test.com/Public/YM/imgs/gb.png" alt="">' +
                    '<h5>商品剩余'+result.dataa+'件可以买入</h5>' +
                    '<h5>请输入购买的份数，够买越多夺宝几率越大</h5>' +
                    ' <p class="dataname" pid='+pid+'>' +
                    name
                    + '</p>' +
                    '<p>' +
                    '<img id="Jian" src="http://www.test.com/Public/YM/imgs/jian.jpg" alt="">' +
                    ' <span class="My-num">1</span>' +
                    ' <img id="jia" src="http://www.test.com/Public/YM/imgs/jia.jpg" alt="">' +
                    '</p>' +
                    ' <button class="MyDuobao" type="submit">确定</button>'
                    + ' </div>'
                $(".OneMoney").append(html)
                var closes = $(".O-alert").find("img.closes")
                closes.click(function () {
                    $(".OneMoney").find(".O-alert").remove()
                })
                var Jian = $(".O-alert").find("img#Jian")
                var Jia = $(".O-alert").find("img#jia")
                var num = 1
                Jian.click(function () {
                    num--
                    if (num <= 1) {
                        num = 1
                        $(".O-alert").find("span.My-num").html(1)
                    } else {
                        $(".O-alert").find("span.My-num").html(num)
                    }

                })
                Jia.click(function () {
                    num++
                    if (num >= result.dataa) {
                        num = result.dataa
                        $(".O-alert").find("span.My-num").html(num)
                    } else {
                        $(".O-alert").find("span.My-num").html(num)
                    }
                })

                var MyDuobao = $(".O-alert").find("button.MyDuobao")
                MyDuobao.click(function () {
                    lootgoods();
                })

            }
            
        })


        
    function lootgoods(){
        var goods = $(".dataname").text()
        var NUM = $(".My-num").text()
        var pid=$(".dataname").attr("pid")
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Index/lootgoods",
            data: ({amount: NUM,pid:pid}),
            success: function (result) {
                if (result.resultCode == 200) {
                    //参与成功的回调中需要每次清理缓存   加上 下列代码
                    $(".OneMoney").find(".O-alert").remove();
                    // $(".Odtime").show() //计时器
                }else if(result.resultCode == 300){
                    $(".OneMoney").find(".O-alert").remove();

                    alert("抢购数量超出");
                }
            },
            error: function (err) {
                console.log(err.statusText)
            }
        });
    }

    })
})




//全选
$(function () {
    var checkbox = $(".Onlie >ul >li").find(".checkbox")
    var allcheckbox = $(".all-check").find(".allcheckbox")
    checkbox.click(function () {
        var Isboll = $(this).attr("a")
        if (Isboll == "off") {
            $(this).addClass("active")
            $(this).attr("a", "on")

            var prize=$(this).siblings("div").find(".prize").text()
            var voucher=$(this).siblings("div").find(".voucher").text()
            var gnum=$(this).siblings("div").find(".gnum").text()
            console.log(gnum);
            var total=$(".all-check").find("p.maidan span.maip").text()
            var num=$(".all-check").find("p.maidan span.daijinquan").text()
            addprize(prize,voucher,total,num,gnum,1)
        } else {
            $(this).removeClass("active")
            $(this).attr("a", "off")
            allcheckbox.removeClass("active")

            var prize=$(this).siblings("div").find(".prize").text()
            var voucher=$(this).siblings("div").find(".voucher").text()
            var total=$(".all-check").find("p.maidan span.maip").text()
            var num=$(".all-check").find("p.maidan span.daijinquan").text()
            addprize(prize,voucher,total,num,gnum,2)
        }

    })

    allcheckbox.click(function () {
        checkbox.attr("a", "on")
        // console.log(checkbox)
        for (var i = 0; i < checkbox.length; i++) {
            if (checkbox[i].getAttribute("a") != "off") {
                checkbox.addClass("active")
            }
        }
        $(this).addClass("active")
        var prize =$(".Onlie >ul >li").find(".prize")
        var gnum=$(".Onlie >ul >li").find(".gnum")
        var totalprice=0;
        for (var i=0;i<prize.length;i++) {
            totalprice+=parseInt(prize[i].innerText)*parseInt(gnum[i].innerText);
        }

        var voucher =$(".Onlie >ul >li").find(".voucher")
        var numvoucher=0;
        for (var i=0;i<voucher.length;i++) {
            numvoucher+=parseInt(voucher[i].innerText)*parseInt(gnum[i].innerText);
        }
    $("#maimaip").html(totalprice)
    $("#daijinquan").html(numvoucher)
    })
    //钱数计算
})
function addprize(a,b,c,d,f,e){
    if(e==1){
        totalprice=parseInt(c)+parseInt(a)*parseInt(f);
        numvoucher=parseInt(d)+parseInt(b)*parseInt(f);
    }else if(e==2){
        totalprice=parseInt(c)-parseInt(a)*parseInt(f);
        numvoucher=parseInt(d)-parseInt(b)*parseInt(f);
    }
    $("#maimaip").html(totalprice)
    //'￥:'+totalprice+'+'+numvoucher+'代金券'
    $("#daijinquan").html(numvoucher)
}

//结算
$(function () {
    var maiOk = $(".all-check").find(".maiOk")
    maiOk.click(function () {
        var Bechoose = $(".active")
        // console.log(Bechoose)
         var datas=[];
        for (var i=0;i< Bechoose.length;i++) {
            datas[i]={};
            datas[i].g=Bechoose[i].getAttribute("GoodId");
            datas[i].c=Bechoose[i].getAttribute("cid");
            datas[i].n=Bechoose[i].getAttribute("GoodsNum");
            datas[i].ccc=$(this).attr("ccc");
        }
        console.log(datas);
        datas =JSON.stringify(datas)
        window.location.href="../Order/dingOk?datas="+datas;

        // console.log(datas)
        // $.ajax({
        //     type: "POST",
        //     dataType: "json",
        //     url: "../Order/addorder",
        //     data:({datas}),
        //     success: function (result) {
        //         console.log(result)
        //         if (result.resultCode == 200) {
        //             window.location.href="http://www.test.com/index.php/Home/Order/dingOk?goodsid="+goodsId+"&cid="+cid+"&num="+num;
        //         }
        //     },
        //     error: function (err) {
        //         console.log(err.statusText)
        //     }
        // });
    })
})
//提交订单
$(function () {
    var giveOk = $(".all-check").find(".giveOk")
    giveOk.click(function () {
        var ding = $(".ding")
        var addrid=$(".Ding-adress").attr("addrId");
        var ccc=$(this).attr("ccc");
        var datas=[];
        for (var i=0;i<ding.length;i++) {
            datas[i]={};
            datas[i].g=ding[i].getAttribute("gid");
            datas[i].c=ding[i].getAttribute("cid");
            datas[i].n=ding[i].getAttribute("num");
            datas[i].addrid=addrid;
            datas[i].ccc=ccc;
        }
        // console.log(datas)
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Order/addorder",
            data: ({datas}),
            success: function (result) {
                if (result.resultCode == 200) {
                  
                }
            },
            error: function (err) {
                console.log(err.statusText)
            }
        });
    })
})

function IsChoose(addrid,that){
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "../Address/IsChoose",
        data: ({addrid:addrid}),
        success: function (result) {
            if (result.resultCode==200) {
                console.log("addrid")
                $(".Ding-adress").find(".choso").removeClass("actives")
                $(".Ding-adress").find(".choso").attr("c", "off")
                that.addClass("actives")
                that.attr("c", "on")
            }
        },
        error: function (err) {
            console.log(err.statusText)
        }
    });
}
//选择收货地址
$(function () {
    var ischoose=$(".Ding-all").find(".choso")
    for (var i = 0;i<ischoose.length;i++) {
        if(ischoose[i].getAttribute("IsChoose") == 1){
            $(".Ding-all").find(".choso").eq(i).addClass("actives")
            $(".Ding-all").find(".choso").eq(i).attr("c", "on")
        }
    }
    var choso = $(".Ding-adress").find(".choso")
    choso.click(function () {
        var Isbolls = $(this).attr("c")
        var that=$(this)
        var addrid=$(this).parent("p").siblings(".xiugai").children(".bianjis").attr("AddrId")
        if (Isbolls == "off") {
            IsChoose(addrid,that)
        }

    })
    var bianjis = $(".Ding-adress").find(".bianjis")
    //修改
    bianjis.click(function () {
        var AddrId=$(this).attr("AddrId")
        window.location.href='../Address/eAddr?data='+AddrId
        // console.log(AddrId)
    })

    var deletes = $(".Ding-adress").find(".deletes")
    deletes.click(function () {
        var AddrId=$(this).attr("AddrId")
        var choose=$(this).attr("choose")
        var that=$(this)
        // $(this).parents(".Ding-all").remove()
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Address/DelAddr",
            data: ({addrid:AddrId,choose:choose}),
            success: function (result) {
                if (result.resultCode==200) {
                    that.parents(".Ding-all").remove()
                }
            },
            error: function (err) {
                console.log(err.statusText)
            }
        });
    })
    var hideadress = $(".hide-adress").find("p")
    hideadress.click(function () {
        window.location.href='../Address/address'
    })

    var DataJson = {
        checkPhone: function (data) {
            if (!/^[1][3,4,5,7,8][0-9]{9}$/.test(data)) {
                return false;
            } else {
                return true;
            }
        }
    };
var $citypicker3 = $('#city-picker3');
    $('#reset').click(function () {
        $citypicker3.citypicker('reset');
    });

    $('#destroy').click(function () {
        console.log("14725836900000dizhi");
        var user = $("input[name='user'] ").val();
        var phone = $("input[name='phone'] ").val();
        var adress = $("input[name='adress'] ").val();
        var city = $("input[name='citys'] ").val();
        if (user=="") {
            $(".Adrishi").show()
            $(".Adrishi").html("请填写收货人")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else if(!DataJson.checkPhone(phone) || phone.length != 11){
            $(".Adrishi").show()
            $(".Adrishi").html("手机号格式不正确")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else if(adress==""){
            $(".Adrishi").show()
            $(".Adrishi").html("请填写详细地址")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else if (city == "") {
            $(".Adrishi").show()
            $(".Adrishi").html("请选择省市地区")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else{
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "../Address/addAddr",
                data: ({ user: user, phone: phone, adress: adress, city: city }),
                success: function (result) {
                    if (result.resultCode == 200) {
                        alert("地址添加成功");
                        window.location.href='../Address/chooadres';
                    }
                },
                error: function (err) {
                    console.log(err.statusText)
                }
            });
        }
    });

    $('#destroyedit').click(function () {
        $citypicker3.citypicker('destroyedit');
        var addrid = $(this).attr("addrid")
        var user = $("input[name='user'] ").val()
        var phone = $("input[name='phone'] ").val()
        var adress = $("input[name='adress'] ").val()
        var city = $("input[name='citys'] ").val()
        if (user=="") {
            $(".Adrishi").show()
            $(".Adrishi").html("请填写收货人")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else if(!DataJson.checkPhone(phone) || phone.length != 11){
            $(".Adrishi").show()
            $(".Adrishi").html("手机号格式不正确")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else if(adress==""){
            $(".Adrishi").show()
            $(".Adrishi").html("请填写详细地址")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else if (city == "") {
            $(".Adrishi").show()
            $(".Adrishi").html("请选择省市地区")
            setTimeout(function () {
                $(".Adrishi").hide()
            }, 2000)
        }else{
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "../Address/EditAddr",
                data: ({addrid:addrid, user: user, phone: phone, adress: adress, city: city }),
                success: function (result) {
                    if (result.resultCode == 200) {
                        alert("地址修改成功");
                        window.location.href='../Address/chooadres';
                    }
                },
                error: function (err) {
                    console.log(err.statusText)
                }
            });
        }
    });
})

$(function () {
    var times = $(".Duobao").find(".Odtime");

    // var pid = $(this).siblings(".Duo-div").children("#O-D").attr("pid")
    // console.log(times)
    var a=0;
    function getRTime() {
        var NowTime = new Date();
        for(var i=0;i<times.length;i++){
            var EndTime = new Date(times[i].getAttribute("times")); 
            var t = EndTime.getTime() - NowTime.getTime();
            // var d = Math.floor(t / 1000 / 60 / 60 / 24);
            var h = Math.floor(t / 1000 / 60 / 60 % 24);
            var m = Math.floor(t / 1000 / 60 % 60);
            var s = Math.floor(t / 1000 % 60);
            if(h < 0 && m <0 && s <0){
                $(".Odtime p").eq(i).html("夺宝已结束");
                $(".Oget").eq(i).html("已结束");
                $(".Oget").eq(i).unbind();
                $(".Oget").eq(i).css("background-color","rgb(165, 164, 164)");
            }else{
            if(h<10){
                h="0"+h;
            }
            if(m<10){
                m="0"+m;
            }
            if(s<10){
                s="0"+s;            }
            $(".Odtime p").eq(i).html( h + "时"+m + "分"+s + "秒")
            }
        }
      }
  setInterval(getRTime, 1000);


})

// $(function () {
//     console.log( )
//     var 
// })