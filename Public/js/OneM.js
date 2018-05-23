
//一元夺宝
$(function () {
    var NowTime = new Date();
        
    var test = window.location.host;
    var Oget = $(".Duobao").find("button.Oget")
    Oget.click(function () {
        var name = $(this).siblings(".Duo-div").children("#O-D").text()
        var pid = $(this).siblings(".Odtime").attr("pid")
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "../Onemoney/onclicknum",
            data: ({pid:pid}),
            success: function (result) {
                
                // var oldtime = result.data1.uptime;
                //     var y = oldtime.substring(0,4)
                //     var m = oldtime.substring(6,7)
                //     m = m < 10 ? '0' + m : m;
                //     var d = oldtime.substring(8,oldtime.length)
                //     d = d < 10 ? ('0' + d) : d;
                //     var overtime = y+"/"+m+"/"+d
                // console.log();

                var html="";
                html='<div  class="O-alert">' +
                    ' <img class="closes" src="http://'+test+'/Public/YM/imgs/gb.png" alt="">' +
                    '<h5>商品剩余'+result.dataa+'件可以买入</h5>' +
                    '<h5>请输入购买的份数，够买越多夺宝几率越大</h5>' +
                    ' <p class="dataname" pid='+pid+'>'+name+'</p>' +
                    '<p>' +
                    '<img id="Jian" src="http://'+test+'/Public/YM/imgs/jian.jpg" alt="">' +
                    ' <span class="My-num">0</span>' +
                    ' <img id="jia" src="http://'+test+'/Public/YM/imgs/jia.jpg" alt="">' +
                    '</p>' +
                    ' <button class="MyDuobao" type="submit" disabled="false">确定</button>'
                    + ' </div>';
                $(".OneMoney").append(html)
                var closes = $(".O-alert").find("img.closes");
                closes.click(function () {
                    $(".OneMoney").find(".O-alert").remove()
                })
                var Jian = $(".O-alert").find("img#Jian");
                var Jia = $(".O-alert").find("img#jia");
                var num = 0
                Jian.click(function () {
                    num--;
                    if (num <= 0) {
                        num = 0
                        $(".O-alert").find("span.My-num").html(0);
                        $(".MyDuobao").attr("disabled",true);
                    } else {
                        $(".O-alert").find("span.My-num").html(num);
                        $(".MyDuobao").attr("disabled",false);
                    }

                })
                Jia.click(function () {
                    num++;
                    if (num >= result.dataa) {
                        num = result.dataa;
                        if(num==0){
                            $(".O-alert").find("span.My-num").html(num);
                            $(".MyDuobao").attr("disabled",true);
                        }else{
                            $(".O-alert").find("span.My-num").html(num);
                            $(".MyDuobao").attr("disabled",false);
                        }
                    } else {
                        $(".O-alert").find("span.My-num").html(num);
                        $(".MyDuobao").attr("disabled",false);
                    }
                })

                var MyDuobao = $(".O-alert").find("button.MyDuobao");
                MyDuobao.click(function () {
                    var a=$(this).siblings(".dataname").attr("pid");
                    lootgoods(a);
                })

            }
            
        })
        
        function lootgoods(a){
            var goods = $(".dataname").text()
            var NUM = $(".My-num").text()
            var pid=$(".dataname").attr("pid")
            if(NUM==0){
                alert("果子数不能为0");
            }else{
                window.location.href='../Order/dopayone?pid='+pid+'&num='+NUM;
               
            }
        }
    })
})




//夺宝倒计时
$(function () {
    var times = $(".Duobao").find(".Odtime");
    var a=0;
    function getRTime() {
        var NowTime = new Date();
        for(var i=0;i<times.length;i++){
            var EndTime = new Date(times[i].getAttribute("times")); 
            var t = EndTime.getTime() - NowTime.getTime();
            var d = Math.floor(t / 1000 / 60 / 60 / 24);
            var h = Math.floor(t / 1000 / 60 / 60 % 24);
            var m = Math.floor(t / 1000 / 60 % 60);
            var s = Math.floor(t / 1000 % 60);
            if(h < 0 && m <0 && s <0){
                $(".Odtime p").eq(i).html("夺宝已结束");
                $(".Oget").eq(i).html("已结束");
                $(".Oget").eq(i).unbind();
                $(".Oget").eq(i).css("background-color","rgb(165, 164, 164)");
            }else{
            if(d<10){
                d="0"+d;
            }
            if(h<10){
                h="0"+h;
            }
            if(m<10){
                m="0"+m;
            }
            if(s<10){
                s="0"+s;            }
            $(".Odtime p").eq(i).html(d+"天" +h + "时"+m + "分"+s + "秒");
            }
        }
      }
  setInterval(getRTime, 1000);
})
