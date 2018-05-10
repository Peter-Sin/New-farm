$(function (num) {
    var test = window.location.host;
    var uid=$(".downLis").attr("uid");
    //客服
    var kefu = $(".kefu")
    kefu.click(function () {
        console.log("你的客服")
    })

    var service = $(".service")
    service.click(function () {
        if(uid==0){
            window.location.href="../Login/index";
        }else{
            var goodsId=$(this).parents(".downLis").attr("GoodsId")
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../Goods/focusGoods" ,//url 
                data:({goodsId:goodsId}) ,
                success: function (result) {
                    if (result.code == 200) {
                        //样式改变
                        // that.parents(".all-D-box").remove()
                    }
                }
            })
        }
    })

    var buyCar = $(".buyCar")
    buyCar.click(function () {
        if(uid==0){
            window.location.href="../Login/index";
        }else{
            window.location.href="../shopcar/shopcar";
        }
    })

    var hideCar = $(".hideCar")
    var num = 0
    hideCar.click(function () {
        // console.log(num)
        if(uid==0){
            window.location.href="../Login/index";
        }else{
            var goodsId=$(this).parents(".downLis").attr("GoodsId");
            var Biao =$(this).attr("a");
            num++;
            if (num == 1) {
                $(".MM").append('<img class="ERROR" src="http://'+test+'/Public/YM/imgs/gb.png" alt="">');
                aaa(num,goodsId,Biao);
                $(".ERROR").click(function () {
                    // $(".MM").empty(".LL")
                    // $(".MM").css("bottom", "-400px")
                    num = 0
                })
            }
        }
    })

    var buing = $(".buing");
    buing.click(function () {
        if(uid==0){
            window.location.href="../Login/index";
        }else{
            var goodsId=$(this).parents(".downLis").attr("GoodsId")
            var Biao =$(this).attr("b");
            num++
            if (num == 1) {
                $(".MM").append('<img class="ERROR" src="http://'+test+'/Public/YM/imgs/gb.png" alt="">')
                aaa(num,goodsId,Biao);
                $(".ERROR").click(function () {
                    // $(".MM").empty(".LL")
                    // $(".MM").css("bottom", "-400px")
                    num = 0
                })
            }
        }
    })
    
})

function aaa(num,goodsId,Biao){
    var test = window.location.host;
    $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "../Goods/goodsClassifyInfo" ,//url 
            data:({goodsId:goodsId,Biao}) ,
            success: function (result) {
                if(result.resultCode==200) {
                    console.log(result.data1.length);
                    if(result.data1.length==1) {
                        $(".MM").css("bottom", "0")
                        $(".MM").append('<div class="LL" GoodsId="' + result.data.id + '" Cid="' + result.data.classify + '">' +
                            '<img class="goos" src="http://' + test + '/Public/image/goods/' + result.data.image + '" alt="">' +
                            '<div class="YY">' +
                            ' <p class="INFOR">￥' +
                            '<span class="price">' + result.data.price + '</span>' + '+' +
                            '<span class="voucher">' + result.data.voucher + '</span>' +
                            '<span>优惠券</span>' +
                            '</p>' +
                            ' <p class="INFOR">库存：<span class="amount">4564</span> 件</p>'
                            + '</div>' +

                            '<div class="ff">' +
                            '<div class="PP">' +
                            ' <p>' + result.data1[0].name + '：</p>' +
                            '<div  class="OO">'
                            + '</div>'
                            + '</div>' +
                            '<div class="NN">' +
                            '<span>购买数量 <small>此商品每人限购3件</small></span>' +
                            '<span class="HJ" style=" margin-left: 10%;">' +
                            '<img class="Jian" src="http://' + test + '/Public/YM/imgs/jian.jpg" alt="">' +
                            '<span>1</span>' +
                            '<img class="Jia" src="http://' + test + '/Public/YM/imgs/jia.jpg" alt="">'
                            + '</span>' + '</div>' +
                            '<p class="BB" Biao="' + result.biao + '" ccc="1230"><button>确定</button></p>'
                            + '</div>'
                        )

                        var html = "";
                        for (var i = 0; i < result.data2[0].length; i++) {
                            html += '<p Cid="' + result.data2[0][i].id + '">' + result.data2[0][i].name + '</p>';
                        }
                        // var html1 = "";
                        // for (var i = 0; i < result.data2[1].length; i++) {
                        //     html1 += '<p Cid="' + result.data2[1][i].id + '">' + result.data2[1][i].name + '</p>';
                        // }
                        // $(".ff").append(html0)
                        $(".PP").find(".OO").append(html);
                        // $(".GG").find(".OO").append(html1);


                        for (var i = 0; i < result.data2[0].length; i++) {
                            var MoRenP = $(".PP .OO").find("p")
                            if (result.data.C_one == MoRenP.eq(i).attr("cid")) {
                                MoRenP.eq(i).addClass("active")
                            }
                        }
                        // for (var i = 0; i < result.data2[1].length; i++) {
                        //     var MoRenP = $(".GG .OO").find("p")
                        //     if (result.data.C_two == MoRenP.eq(i).attr("cid")) {
                        //         MoRenP.eq(i).addClass("active")
                        //     }
                        // }
                        classifyPrice(result.data.C_one, result.data.C_two, 1, result.data.id);


                        var Gui = $(".PP .OO").find("p");
                        Gui.click(function () {
                            var that = $(this)
                            $(this).addClass("active").siblings().removeClass("active");
                            var goodsId = $(this).parents(".LL").attr("GoodsId");
                            var a = $(this).attr("cid");
                            var b = 0;
                            var c = $(".NN").children(".HJ").find("span").text();
                            // console.log(a);
                            // console.log(c);
                            // console.log($(".NN").children(".HJ").find("span").text());
                            classifyPrice(a, b, c, goodsId);
                            // var num = result.data2[1].length;
                            // classone(a, goodsId, num);
                        })


                        // var Gui = $(".GG .OO").find("p");
                        // Gui.click(function () {
                        //     $(this).addClass("active").siblings().removeClass("active");
                        //     var goodsId = $(this).parents(".LL").attr("GoodsId");
                        //     var a = $(this).parents(".GG").siblings(".PP").children(".OO").find("p.active").attr("cid");
                        //     var b = $(this).attr("cid");
                        //     var c = $(this).parents(".ff").siblings(".NN").children(".HJ").find("span").text();
                        //     classifyPrice(a, b, c, goodsId);
                        // })
                        var numbee = $(".HJ").find("span").text();
                        $(".Jian").click(function () {
                            if (numbee > 1) {
                                numbee--;
                                $(".HJ").find("span").html(numbee);
                            } else {
                                $(".HJ").find("span").html('1');
                            }
                            var goodsId = $(this).parents(".LL").attr("GoodsId");
                            var a = $(".PP").find("p.active").attr("cid");
                            var b = 0;
                            var c = numbee;
                            classifyPrice(a, b, c, goodsId);
                        })
                        $(".Jia").click(function () {
                            if (numbee < 3) {
                                numbee++;
                                $(".HJ").find("span").html(numbee);
                            } else {
                                $(".HJ").find("span").html('3');
                            }
                            var goodsId = $(this).parents(".LL").attr("GoodsId")
                            var a = $(".PP").find("p.active").attr("cid");
                            var b = 0;
                            var c = numbee;
                            classifyPrice(a, b, c, goodsId);
                        })
                    }else{
                        $(".MM").css("bottom", "0")
                        $(".MM").append('<div class="LL" GoodsId="' + result.data.id + '" Cid="' + result.data.classify + '">' +
                            '<img class="goos" src="http://' + test + '/Public/image/goods/' + result.data.image + '" alt="">' +
                            '<div class="YY">' +
                            ' <p class="INFOR">￥' +
                            '<span class="price">' + result.data.price + '</span>' + '+' +
                            '<span class="voucher">' + result.data.voucher + '</span>' +
                            '<span>优惠券</span>' +
                            '</p>' +
                            ' <p class="INFOR">库存：<span class="amount">4564</span> 件</p>'
                            + '</div>' +

                            '<div class="ff">' +
                            '<div class="PP">' +
                            ' <p>' + result.data1[0].name + '：</p>' +
                            '<div  class="OO">'
                            + '</div>'
                            + '</div>' +

                            '<div class="GG">' +
                            ' <p>' + result.data1[1].name + '：</p>' +
                            '<div  class="OO">'
                            + '</div>'
                            + '</div>' +
                            '</div>' +

                            '<div class="NN">' +
                            '<span>购买数量 <small>此商品每人限购3件</small></span>' +
                            '<span class="HJ" style=" margin-left: 10%;">' +
                            '<img class="Jian" src="http://' + test + '/Public/YM/imgs/jian.jpg" alt="">' +
                            '<span>1</span>' +
                            '<img class="Jia" src="http://' + test + '/Public/YM/imgs/jia.jpg" alt="">'
                            + '</span>' + '</div>' +
                            '<p class="BB" Biao="' + result.biao + '" ccc="1230"><button>确定</button></p>'
                            + '</div>'
                        )

                        var html = "";
                        for (var i = 0; i < result.data2[0].length; i++) {
                            html += '<p Cid="' + result.data2[0][i].id + '">' + result.data2[0][i].name + '</p>';
                        }
                        var html1 = "";
                        for (var i = 0; i < result.data2[1].length; i++) {
                            html1 += '<p Cid="' + result.data2[1][i].id + '">' + result.data2[1][i].name + '</p>';
                        }
                        // $(".ff").append(html0)
                        $(".PP").find(".OO").append(html);
                        $(".GG").find(".OO").append(html1);


                        for (var i = 0; i < result.data2[0].length; i++) {
                            var MoRenP = $(".PP .OO").find("p")
                            if (result.data.C_one == MoRenP.eq(i).attr("cid")) {
                                MoRenP.eq(i).addClass("active")
                            }
                        }
                        for (var i = 0; i < result.data2[1].length; i++) {
                            var MoRenP = $(".GG .OO").find("p")
                            if (result.data.C_two == MoRenP.eq(i).attr("cid")) {
                                MoRenP.eq(i).addClass("active")
                            }
                        }
                        classifyPrice(result.data.C_one, result.data.C_two, 1, result.data.id);


                        var Gui = $(".PP .OO").find("p");
                        Gui.click(function () {
                            var that = $(this)
                            $(this).addClass("active").siblings().removeClass("active");
                            var goodsId = $(this).parents(".LL").attr("GoodsId");
                            var a = $(this).attr("cid");
                            var b = $(this).parents(".PP").siblings(".GG").children(".OO").find("p.active").attr("cid");
                            var c = $(this).parents(".ff").siblings(".NN").children(".HJ").find("span").text();
                            classifyPrice(a, b, c, goodsId);
                            var num = result.data2[1].length;
                            classone(a, goodsId, num);
                        })


                        var Gui = $(".GG .OO").find("p");
                        Gui.click(function () {
                            $(this).addClass("active").siblings().removeClass("active");
                            var goodsId = $(this).parents(".LL").attr("GoodsId");
                            var a = $(this).parents(".GG").siblings(".PP").children(".OO").find("p.active").attr("cid");
                            var b = $(this).attr("cid");
                            var c = $(this).parents(".ff").siblings(".NN").children(".HJ").find("span").text();
                            classifyPrice(a, b, c, goodsId);
                        })
                        var numbee = $(".HJ").find("span").text();
                        $(".Jian").click(function () {
                            if (numbee > 1) {
                                numbee--;
                                $(".HJ").find("span").html(numbee);
                            } else {
                                $(".HJ").find("span").html('1');
                            }
                            var goodsId = $(this).parents(".LL").attr("GoodsId");
                            var a = $(this).parents(".NN").siblings(".ff").children(".PP").find("p.active").attr("cid");
                            var b = $(this).parents(".NN").siblings(".ff").children(".GG").find("p.active").attr("cid");
                            var c = numbee;
                            classifyPrice(a, b, c, goodsId);
                        })
                        $(".Jia").click(function () {
                            if (numbee < 3) {
                                numbee++;
                                $(".HJ").find("span").html(numbee);
                            } else {
                                $(".HJ").find("span").html('3');
                            }
                            var goodsId = $(this).parents(".LL").attr("GoodsId")
                            var a = $(this).parents(".NN").siblings(".ff").children(".PP").find("p.active").attr("cid");
                            var b = $(this).parents(".NN").siblings(".ff").children(".GG").find("p.active").attr("cid");
                            var c = numbee;
                            classifyPrice(a, b, c, goodsId);
                        })
                    }
                }else if(result.resultCode==300){
                    console.log("没有分类信息");
                    var gId=$(".downLis").attr("goodsid");
                    if(Biao=="hideCar"){
                        $.ajax({
                            //几个参数需要注意一下
                            type: "POST",//方法类型
                            dataType: "json",//预期服务器返回的数据类型
                            url: "../Shopcar/addShopcar" ,//url
                            data:({cid:0,pid:goodsId,num:1}) ,
                            success: function (result) {
                                if(result.resultCode==200){
                                    window.location.href="../Shopcar/shopcar";
                                }
                            }
                        })
                    }else if(Biao=="buing"){
                        var ccc=$(".BB").attr("ccc");
                        var datas=[];
                        datas[0]={};
                        datas[0].g=gId;
                        datas[0].c=0;
                        datas[0].n=1;
                        datas[0].ccc=ccc;
                        datas =JSON.stringify(datas);
                        window.location.href="../Order/dingOk?datas="+datas;
                    }

                }

                    var button = $(".BB").find("button");
                    button.click(function () {
                        var biao=$(".BB").attr("Biao");
                        var ccc=$(".BB").attr("ccc");
                        var goodsId=$(this).parents(".LL").attr("GoodsId")
                        // var a=$(this).parents(".BB").siblings(".ff").children(".PP").find("p.active").attr("cid");
                        // var b=$(this).parents(".BB").siblings(".ff").children(".GG").find("p.active").attr("cid");
                        var cid=$(this).parents(".LL").attr("cid")
                        var num=$(".NN").children(".HJ").find("span").text();
                        if(biao=="hideCar"){
                            $.ajax({
                                //几个参数需要注意一下
                                type: "POST",//方法类型
                                dataType: "json",//预期服务器返回的数据类型
                                url: "../Shopcar/addShopcar" ,//url 
                                data:({cid:cid,pid:goodsId,num:num}) ,
                                success: function (result) {
                                    if(result.resultCode==200){
                                        window.location.href="../Shopcar/shopcar";
                                    }
                                }
                            })
                        }else if(biao=="buing"){
                            var datas=[];
                            datas[0]={};
                            datas[0].g=goodsId;
                            datas[0].c=cid;
                            datas[0].n=num;
                            datas[0].ccc=ccc;
                            datas =JSON.stringify(datas);
                            window.location.href="../Order/dingOk?datas="+datas;

                            // $.ajax({
                            //     //几个参数需要注意一下
                            //     type: "POST",//方法类型
                            //     dataType: "json",//预期服务器返回的数据类型
                            //     url: "../Order/addorder" ,//url 
                            //     data:({cid:cid,pid:goodsId}) ,
                            //     success: function (result) {
                            //         if(result.resultCode==200){
                            //             window.location.href="http://www.test.com/index.php/Home/Order/dingOk";
                            //         }
                            //     }
                            // })
                        }
                        // console.log("确定"+biao,a,b,c,goodsId);
                    })

                $(".ERROR").click(function () {
                    $(".MM").empty(".LL")
                    $(".MM").css("bottom", "-400px")
                    // console.log(num + "123")
                })
            }
        })
}

function classifyPrice(a,b,c,goodsId,that){
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "../Goods/classifyPrice" ,//url 
        data:({C_one:a,C_two:b,G_num:c,goodsid:goodsId}) ,
        success: function (result) {
            if(result.code==200){
                var aa=$(".LL").find("span.price");
                $(".LL").find("span.price").html(result.totalprice);
                $(".LL").find("span.voucher").html(result.totalvoucher);
                $(".LL").find("span.amount").html(result.amount);
                $(".LL").attr("cid",result.cid)
            }else{
                console.log("该分类无商品");
            }
        }
    })
}

function classone(a,goodsId,num){
    $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "../Goods/classone" ,//url 
        data:({C_one:a,goodsid:goodsId}) ,
        success: function (result) {
            var MoRenP = $(".GG .OO").find("p")
           if(result){
                for(var i=0;i<num;i++){
                    var id=MoRenP.eq(i).attr("cid");
                    if(result.indexOf(id)==-1){
                        MoRenP.eq(i).css({
                            "background":"grey",
                            "color":"#fff",
                            "pointer-events":"none"
                        })
                         MoRenP.eq(i).removeClass("active")
                    }else if(result.indexOf(id)>-1){
                        MoRenP.eq(i).css({
                            "background":"rgb(212, 206, 206)",
                            "color":"#000",
                            "pointer-events":"auto"
                        })
                    }
                } 
           }else{
                MoRenP.css({
                    "background":"grey",
                    "color":"#fff",
                    "pointer-events":"none"
                })
                 MoRenP.removeClass("active")
           }
}
})
}