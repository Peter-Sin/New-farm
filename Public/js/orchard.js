var threelis = $(".three-choose ").find("li")
var divs = $(".orchard").find("div.Div-choose")
threelis.click(function () {
    var ins = $(this).index();
    var classify=$(this).text();
    fruitlist(classify);
    $(this).addClass("active").siblings().removeClass('active')
    divs.eq(ins).show().siblings("div.Div-choose").hide()
    $(".U-trees").empty();
})


var test = window.location.host;
function fruitlist(a){
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "../Farm/fruitlist",
        data:({classify:a}),
        success: function (result) {
            if(result){
                var html='';
                for(var i=0;i<result.length;i++){
                    if(a=="互偷模块"){
                        html += '<li>'+
                        '<img class="trees" src="http://'+test+'/public/YM/orcharImg/gs_img.png" alt="">'+
                        '<div class="treesInfo" fid="'+result[i].fid+'" num="'+result[i].count+'">'+
                            '<p>昵称:'+result[i].username+'会员编号:'+result[i].vipid+'</p>'+
                            '<p>产出果实:'+result[i].count+'颗</p>'+
                            '<p>产出事件:'+result[i].time+'</p>'+
                        '</div>'+
                        '<div class="gettree">'+
                            '<p>一键偷取</p>'+
                        '</div>'+
                    '</li>'
                    }else if(a=="偷取记录"){
                        html += '<li>'+
                        '<div class="trees">'+
                            '<p>时间</p>'+
                            '<p>数量</p>'+
                            '<p>信息</p>'+
                        '</div>'+
                        '<div class="loseinfor">'+
                            '<p>'+result[i].time+'</p>'+
                            '<p>'+result[i].num+'颗</p>'+
                            '<p>会员uid:'+result[i].vipid+'昵称:'+result[i].username+'</p>'+
                        '</div>'+
                    '</li>'
                    }else if(a=="被偷记录"){
                        html += '<li>'+
                        '<div class="trees">'+
                            '<p>时间</p>'+
                            '<p>数量</p>'+
                            '<p>信息</p>'+
                        '</div>'+
                        '<div class="loseinfor">'+
                            '<p>'+result[i].time+'</p>'+
                            '<p>'+result[i].num+'</p>'+
                            '<p>会员uid:'+result[i].vipid+'昵称:'+result[i].username+'</p>'+
                        '</div>'+
                    '</li>'
                    } 
                } 
                $(".U-trees").empty();
                $(".U-trees").append(html);
    
                var fid=$(".treesInfo").attr("fid");
                var num=$(".treesInfo").attr("num");
                var gettree=$(".gettree");
                gettree.click(function(){
                    if(confirm("你确认偷取")){
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "../Farm/getlandnum",
                            success: function (result) {
                                if(result.resultCode==200){
                                    var trees= gettrees(fid,num,gettree);
                                }else if(result.resultCode==300){
                                    alert("土地数量不足，暂时无法偷取");
                                }
                            }
                        })
                    }
                })
            } 
        },
        error: function (err) {
            console.log(err.statusText)
        }
    });
}
fruitlist("互偷模块");

function gettrees(fid,num,gettree){
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "../Farm/steal",
        data:({tuid:fid,num:num}),
        success: function (result) {
            if(result.resultCode==200){
                gettree.css({background:'rgb(192, 184, 184)'});
                gettree.unbind();
                gettree.html("已偷取");
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
    friendlist(ins);

})
friendlist(0);

function friendlist(a){
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "../Person/friendlist",
        data:({abc:a}),
        success: function (result) {
            if(result.resultCode==200){
                var html="";
                for(var i=0;i<result.friends.length;i++){
                    if(a==0){
                        html+= '<li>'+
                            '<p>'+result.friends[i].username+'</p>'+
                            '<p>1层</p>'+
                            '</li>'
                    }else if(a==1){
                        html+= '<li>'+
                            '<p>'+result.friends[i].username+'</p>'+
                            '<p>2层</p>'+
                            '</li>'
                    }else if(a==2){
                        html+= '<li>'+
                            '<p>'+result.friends[i].username+'</p>'+
                            '<p>3层</p>'+
                            '</li>'
                    }
                }
                $(".one-class").empty();
                $(".one-class").append(html);
            }
        },
        error: function (err) {
            $(".one-class").empty();
        },
    })
}


//返回键
var back = $(".orchard").find(".back")
back.click(function () {
    location.href = "../Index/index?num=3";
})
//确认转增
var bussOk = $(".Div-choose").find("a.bussOk")

bussOk.click(function (e) {
    e.preventDefault()
    var Had = parseInt($(".Had").text().substring($(".Had").text().length - 6, $(".Had").text().length))
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
    }
    // else {
    // $.ajax({
    //     type: "POST",
    //     dataType: "json",
    //     url: "/users/login",
    //     data: busData,
    //     success: function (result) {
    //         if (result.resultCode == 200) {
    //             $("datt").append("<p>返回正确的数据</p>")
    //         }
    //     },
    //     error: function (err) {
    //         console.log(err.statusText)
    //         $("#datt").append("<p>" + err.statusText + "</p>")
    //         setTimeout(function () {
    //             $("#datt").remove()
    //         }, 3000)
    //     }
    // });
    // }
})

//分享二维码
var Fengxiang = $(".Fengxiang")
Fengxiang.click(function () {
    var test = window.location.host;
    var imgUrl=$(".Weichat").attr("src");
    var link=$(".Weichat").attr("aaa");
    wx.onMenuShareAppMessage({
        title: '农场商城',
        desc: '把农场分享给需要的好友，欢迎访问',
        link: link,
        imgUrl: 'http://'+test+imgUrl,
        trigger: function (res) {
            alert('用户点击发送给朋友');
        },
        success: function (res) {
            alert('已分享');
        },
        cancel: function (res) {
            alert('已取消');
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });
    // alert('已注册获取“发送给朋友”状态事件');
})

