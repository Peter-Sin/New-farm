var threelis = $(".three-choose ").find("li")
var divs = $(".orchard").find("div.Div-choose")
threelis.click(function () {
    var ins = $(this).index();
    $(this).addClass("active").siblings().removeClass('active')
    divs.eq(ins).show().siblings("div.Div-choose").hide()
    $(".tee").empty();
    fruittrade(ins);

})
fruittrade(0);

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
                    $(".Had-num").html(num);
                    $(".transaction_fee").html(transaction_fee);
                    $(".trade_exchange").html(trade_exchange);
                }else if(a==1){
                   var  html='';
                    for(var i=0;i<result.num.length;i++){
                            html+='<li>'+
                            '<div class="trees orders">'+
                                '<p>时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间</p>'+
                                '<p>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</p>'+
                                '<p>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份</p>'+
                                '<p>会&nbsp;员&nbsp;uid</p>'+
                                '<p>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</p>'+
                                '<p>更新时间</p>'+
                                '<p>订单状态</p>'+
                            '</div>'+
                            '<div class="treesInfos ordersInfos">'+
                                '<p>'+result.num[i].time+'</p>'+
                                '<p>'+result.num[i].realnum+'</p>'+
                                '<p>被转让者</p>'+
                                '<p>'+result.num[i].vipid+'</p>'+
                                '<p>'+result.num[i].username+'</p>'+
                                '<p>'+result.num[i].time+'</p>'+
                                '<p>交易成功</p>'+
                            '</div>'+
                        '</li>'
                    }
                    $(".tee").empty();
                $(".tee").append(html);
                }else if(a==2){
                    var  html='';
                    for(var i=0;i<result.num.length;i++){
                            html+='<li>'+
                            '<div class="trees">'+
                                '<p>时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间</p>'+
                                '<p>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</p>'+
                                '<p>手&nbsp;&nbsp;续&nbsp;&nbsp;费</p>'+
                                '<p>积分滞留</p>'+
                                '<p>交易数量</p>'+
                                '<p>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份</p>'+
                                '<p>会&nbsp;员&nbsp;uid</p>'+
                                '<p>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</p>'+
                                '<p>更新时间</p>'+
                                '<p>订单状态</p>'+
                            '</div>'+
                            '<div class="loseinfor rembers">'+
                                '<p>'+result.num[i].time+'</p>'+
                                '<p>'+result.num[i].num+'</p>'+
                                '<p>'+result.num[i].unum+'</p>'+
                                '<p>'+result.num[i].unum+'</p>'+
                                '<p>'+result.num[i].realnum+'</p>'+
                                '<p>转让者</p>'+
                                
                                '<p>'+result.num[i].vipid+'</p>'+
                                '<p>'+result.num[i].username+'</p>'+
                                '<p>'+result.num[i].num+'</p>'+
                                
                                '<p>交易成功</p>'+
                            '</div>'+
                        '</li>'
                    }
                    $(".tee").empty();                    
                    $(".tee").append(html)
                }   
            }
        }
    })
}

//feirnd 点击选择
var friendthreelis = $(".friend-choose").find("li")
var Flevel = $(".orchard").find("div.F-level")
friendthreelis.click(function () {
    var ins = $(this).index()
    $(this).addClass("active").siblings().removeClass('active')
    Flevel.eq(ins).show().siblings("div.F-level").hide()

})

//返回键
var back = $(".orchard").find(".back")
back.click(function () {
    location.href = "../Index/index?num=3";
})
//确认转增
var bussOk = $(".Div-choose").find("a.bussOk")

bussOk.click(function (e) {
    e.preventDefault()
    var Had = parseInt($(".Had").find(".Had-num").text());
    var busData = {
        userId: $("#ID").val(),
        somefruit: parseInt($("input[name='number']").val()),
        pass: $("input[type='password']").val()
    }
    if (busData.userId.length != 11) {
        $(".Infor").html("ID长度不够11位--或者没有此ID")
        $(".Infor").css("display", "block")
        setTimeout(function () {
            $(".Infor").hide()
        }, 2000)
    } else if ((Had - busData.somefruit) < 0) {
        $(".Infor").html("您没有那么多")
        $(".Infor").css("display", "block")
        setTimeout(function () {
            $(".Infor").hide()
        }, 2000)
    }else{
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Farm/trading",
            data: busData,
            success: function (result) {
                if (result.resultCode == 200) {
                    // $("datt").append("<p>返回正确的数据</p>")
                    alert("交易成功");
                    window.location.reload();
                }else if(result.resultCode == 300){
                    alert("支付密码有误");
                }else if(result.resultCode == 400){
                    alert("获赠号码有误");
                }else if(result.resultCode == 500){
                    alert("果子数量不足");
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

//分享二维码
var Fengxiang = $(".Fengxiang")
Fengxiang.click(function () {
    console.log("分享+orchard.js 63")
})

