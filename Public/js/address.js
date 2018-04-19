$(function () {
    var back = $(".nav-bar").find("img.back")
    back.click(function () {
        location.href = "../Index/index?num=3";
    })
})
//购物车全选
$(function () {
    var checkbox = $(".Onlie >ul >li").find(".checkbox");
    var allcheckbox = $(".all-check").find(".allcheckbox");
    checkbox.click(function () {
        var Isboll = $(this).attr("a");
        if (Isboll == "off") {
            $(this).addClass("active");
            $(this).attr("a", "on");
            var prize=$(this).siblings("div").find(".prize").text();
            var voucher=$(this).siblings("div").find(".voucher").text();
            var gnum=$(this).siblings("div").find(".gnum").text();
            var total=$(".all-check").find("p.maidan span.maip").text();
            var num=$(".all-check").find("p.maidan span.daijinquan").text();
            addprize(prize,voucher,total,num,gnum,1);
        } else {
            $(this).removeClass("active");
            $(this).attr("a", "off");
            allcheckbox.removeClass("active");
            var prize=$(this).siblings("div").find(".prize").text();
            var voucher=$(this).siblings("div").find(".voucher").text();
            var gnum=$(this).siblings("div").find(".gnum").text();
            var total=$(".all-check").find("p.maidan span.maip").text();
            var num=$(".all-check").find("p.maidan span.daijinquan").text();
            addprize(prize,voucher,total,num,gnum,2)
        }
    })
    allcheckbox.click(function () {
        checkbox.attr("a", "on");
        for (var i = 0; i < checkbox.length; i++) {
            if (checkbox[i].getAttribute("a") != "off") {
                checkbox.addClass("active")
            }
        }
        $(this).addClass("active")
        var prize =$(".Onlie >ul >li").find(".prize");
        var gnum=$(".Onlie >ul >li").find(".gnum");
        var totalprice=0;
        for (var i=0;i<prize.length;i++) {
            totalprice+=parseInt(prize[i].innerText)*parseInt(gnum[i].innerText);
        }
        var voucher =$(".Onlie >ul >li").find(".voucher");
        var numvoucher=0;
        for (var i=0;i<voucher.length;i++) {
            numvoucher+=parseInt(voucher[i].innerText)*parseInt(gnum[i].innerText);
        }
        $("#maimaip").html(totalprice);
        $("#daijinquan").html(numvoucher);
    })
    function addprize(a,b,c,d,f,e){
        if(e==1){
            totalprice=parseInt(c)+parseInt(a)*parseInt(f);
            numvoucher=parseInt(d)+parseInt(b)*parseInt(f);
        }else if(e==2){
            totalprice=parseInt(c)-parseInt(a)*parseInt(f);
            numvoucher=parseInt(d)-parseInt(b)*parseInt(f);
        }
        $("#maimaip").html(totalprice);
        $("#daijinquan").html(numvoucher);
    }
})




//购物车结算
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
//确认订单提交订单
$(function () {
    var giveOk = $(".all-check").find(".giveOk")
    giveOk.click(function () {
        var ding = $(".ding")
        var addrid=$(".Ding-adress").attr("addrId");
        var ccc=$(this).attr("ccc");
        var money=$(".money").html();
        var voucher=$(".voucher").html();
        var datas=[];
        var order=[];
        // order.addrid=addrid;
        // order.ccc=ccc;
        // order.money=money;
        // order.voucher=voucher;
        // console.log(order);
        for (var i=0;i<ding.length;i++) {
            datas[i]={};
            datas[i].g=ding[i].getAttribute("gid");
            datas[i].c=ding[i].getAttribute("cid");
            datas[i].n=ding[i].getAttribute("num");
        }
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Order/addorder",
            data: ({datas:datas,addrid:addrid,ccc:ccc,money:money,voucher:voucher}),
            success: function (result) {
                if (result.resultCode == 200) {
                    alert("订单提交成功");
                    // window.location.href="../Order/dowxpay?ordernum="+result.ordernum;
                }else{
                    alert("订单提交失败");
                }
            },
            error: function (err) {
                console.log(err.statusText)
            }
        });
    })
})
//默认地址选择
function IsChoose(addrid,that){
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "../Address/IsChoose",
        data: ({addrid:addrid}),
        success: function (result) {
            if (result.resultCode==200) {
                console.log("addrid");
                $(".Ding-adress").find(".choso").removeClass("actives");
                $(".Ding-adress").find(".choso").attr("c", "off");
                that.addClass("actives");
                that.attr("c", "on");
            }
        },
        error: function (err) {
            console.log(err.statusText)
        }
    });
}
//选择收货地址
$(function () {
    var ischoose=$(".Ding-all").find(".choso");
    for (var i = 0;i<ischoose.length;i++) {
        if(ischoose[i].getAttribute("IsChoose") == 1){
            $(".Ding-all").find(".choso").eq(i).addClass("actives");
            $(".Ding-all").find(".choso").eq(i).attr("c", "on");
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
    //重置地址
    $('#reset').click(function () {
        $citypicker3.citypicker('reset');
    });
    //添加地址
    $('#destroy').click(function () {
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
//修改地址
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