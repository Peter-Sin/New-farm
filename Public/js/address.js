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
    function addprize(a,b,c,d,f,e){
        if(e==1){
            totalprice=Number(c)+Number(a)*Number(f);
            numvoucher=Number(d)+Number(b)*Number(f);
        }else if(e==2){
            totalprice=Number(c)-Number(a)*Number(f);
            numvoucher=Number(d)-Number(b)*Number(f);
        }
        $("#maimaip").html(totalprice);
        $("#daijinquan").html(numvoucher);
    }

    allcheckbox.click(function () {
        if($(this).attr("a")=="on"){
            checkbox.attr("a", "off");
            checkbox.removeClass("active");
            $(this).removeClass("active");
            $(this).attr("a", "off");
            $("#maimaip").html(0);
            $("#daijinquan").html(0);
        }else{
            checkbox.attr("a", "on");
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].getAttribute("a") != "off") {
                    checkbox.addClass("active");
                }
            }
            $(this).addClass("active");
            $(this).attr("a", "on");
            var prize =$(".Onlie >ul >li").find(".prize");
            var gnum=$(".Onlie >ul >li").find(".gnum");
            var totalprice=0;
            for (var i=0;i<prize.length;i++) {
                totalprice+=Number(prize[i].innerText)*Number(gnum[i].innerText);
            }
            var voucher =$(".Onlie >ul >li").find(".voucher");
            var numvoucher=0;
            for (var i=0;i<voucher.length;i++) {
                numvoucher+=Number(voucher[i].innerText)*Number(gnum[i].innerText);
            }
            $("#maimaip").html(totalprice);
            $("#daijinquan").html(numvoucher);
        }
    })
})




//购物车结算
$(function () {
    var total=$(".goodsnums").attr("total");
    $(".jian").click(function(){
        var num=$(this).siblings(".gnum").html();
        var pid=$(this).parents(".div-nums").siblings(".checkbox").attr("goodid");
        var cid=$(this).parents(".div-nums").siblings(".checkbox").attr("cid");
        var price=$(this).parents(".goodsnums").siblings(".pricevoucher").find(".prize");
        var voucher=$(this).parents(".goodsnums").siblings(".pricevoucher").find(".voucher");
        var here=$(this);
        var choose=$(this).parents(".div-nums").siblings(".checkbox").attr("a");
        if(choose=='on'){
            var totalprice=Number($("#maimaip").html())-Number(price.html());
            var numvoucher=Number($("#daijinquan").html())-Number(voucher.html());
        }
        num--;
        if(num<1){
            $(this).siblings(".gnum").html(1);
            alert("数量不能小于1");
        }else{
            shopcarnum(pid,cid,num,here,totalprice,numvoucher);

            // $(this).siblings(".gnum").html(num);
        }
    })

    $(".jia").click(function(){
        var num=$(this).siblings(".gnum").html();
        var total=$(this).parents(".goodsnums").attr("total");
        var pid=$(this).parents(".div-nums").siblings(".checkbox").attr("goodid");
        var cid=$(this).parents(".div-nums").siblings(".checkbox").attr("cid");
        var price=$(this).parents(".goodsnums").siblings(".pricevoucher").find(".prize");
        var voucher=$(this).parents(".goodsnums").siblings(".pricevoucher").find(".voucher");
        var here=$(this);
        var choose=$(this).parents(".div-nums").siblings(".checkbox").attr("a");
        if(choose=='on'){
            var totalprice = Number($("#maimaip").html()) + Number(price.html());
            var numvoucher = Number($("#daijinquan").html()) + Number(voucher.html());
        }
        num++;
        if(num>total){
            $(this).siblings(".gnum").html(total);
            alert("不能购买更多");
        }else{
            shopcarnum(pid,cid,num,here,totalprice,numvoucher);
        }
    })

    function shopcarnum(pid,cid,num,here,totalprice,numvoucher){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../shopcar/shopcarnum",
            data: ({num:num,pid:pid,cid:cid}),
            success: function (result) {
                if(result.code==200){
                    here.siblings(".gnum").html(num);
                    here.parents(".div-nums").siblings(".checkbox").attr("GoodsNum",num);
                    $("#maimaip").html(totalprice);
                    $("#daijinquan").html(numvoucher);
                }else{
                    alert("faild");
                }
            }
        })
    }

    $(".deletecar").click(function(){
        var pid=$(this).parents(".div-nums").siblings(".checkbox").attr("goodid");
        var cid=$(this).parents(".div-nums").siblings(".checkbox").attr("cid");
        var here=$(this);
        if(confirm("您确定要删除该条记录吗？")){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "../shopcar/deleteshopcar",
                data: ({pid:pid,cid:cid}),
                success: function (result) {
                    if(result.code==200){
                        here.parents(".shopcarlist").remove();
                    }else{
                        alert("faild");
                    }
                }
            })
        }
    })

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
        datas =JSON.stringify(datas)
        if(datas=='[]'){
            alert("请选择商品");
        }else{
            window.location.href="../Order/dingOk?datas="+datas;
        }
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
    $(".editaddress").click(function(){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../address/selfaddress",
            // data:({datas}),
            success: function (result) {
                if(result.code==200){
                    $(".addresslist").show();
                    html='';
                    for(var i=0;i<result.data.length;i++){
                        html+='<div class="listcarchop" choose='+result.data[i].choose+'><span class="choosecar" pid="'+result.data[i].id+'"><li></li></span>选中'+
                            '<p class="Ding-mid">'+
                            '<span class="Ding-mid-left">收货人:'+
                            '<i>'+result.data[i].username+'</i>'+
                            '</span>'+
                            '<span class="Ding-mid-right">'+result.data[i].telphone+'</span>'+
                            '</p>'+
                            '<section class="Ding-down" style="margin:0 0 0 5%">'+
                            '<span class="Ding-down-left">收货地址：</span>'+
                            '<span class="Ding-down-right">'+result.data[i].address+result.data[i].place+'</span>'+
                            '</section></div>';

                    }

                    $(".addresslist").append(html);
                    for(var i=0;i<result.data.length;i++) {
                        if(result.data[i].choose==1){
                            $(".listcarchop").eq(i).find(".choosecar").addClass("active");
                        }
                    }
                    $(".addresslist").find(".choosecar").click(function(){
                        var pid=$(this).attr("pid");
                        var here=$(this);
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "../address/selfischoose",
                            data:({pid:pid}),
                            success: function (result) {
                                if(result.code==200){
                                    $(".choosecar").removeClass("active");
                                    here.addClass("active");
                                }
                            }
                        })
                    })


                    $(".closeaddress").click(function(){
                        $(".addresslist").show();
                        window.location.reload();
                    })
                }
            }
        })
    })

    var giveOk = $(".all-check").find(".giveOk")
    giveOk.click(function () {
        var ding = $(".ding")
        var addrid=$(".Ding-adress").attr("addrId");
        var ccc=$(this).attr("ccc");
        var money=$(".money").html();
        var voucher=$(".voucher").html();
        if(addrid){
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
                        window.location.href="../Order/dopay?ordernum="+result.ordernum;
                    }else{
                        alert("订单提交失败");
                    }
                },
                error: function (err) {
                    console.log(err.statusText)
                }
            });
        }else{
            alert("请选择你的收货地址");
        } 
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