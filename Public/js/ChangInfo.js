$(function () {

    var hide = $(".hide")
    hide.click(function (e) {
        // e.preventDefault()
        if ($("input[name='username']").val() == "") {
            var aa = "昵称不能为空"
            Alert(aa)
        } else if ($("input[name='xingming']").val() == "") {
            var aa = "姓名不能为空"
            Alert(aa)
        }
        //  else if ($("input[name='phone']").val() == "") {
        //     var aa = "手机号不能为空"
        //     Alert(aa)
        // }
         else if ($("input[name='Payphone']").val() == "") {
            var aa = "支付号不能为空"
            Alert(aa)
        } else if ($("input[name='sex']").val() == "") {
            var aa = "性别不能为空"
            Alert(aa)
        } else {
            var data = {
                username: $("input[name='username']").val(),
                xingming: $("input[name='xingming']").val(),
                // phone: $("input[name='phone']").val(),
                Payphone: $("input[name='Payphone']").val(),
                sex: $("input[name='sex']").val(),
                src: $(".Chang_img")[0].src
            }
            // $.ajax({
            //     type: "POST",
            //     dataType: "json",
            //     url: "../Person/uploadchangeinfo",
            //     data: data,
            //     success: function (result) {
            //         if (result.resultCode == 200) {
            //           alert("修改成功");
            //         }
            //     },
            //     error: function (err) {
            //         console.log(err.statusText)
            //     }
            // });
        }

        function Alert(o) {
            $(".aale").html(o)
            $(".aale").fadeIn()
            setTimeout(function () {
                $(".aale").fadeOut()
            }, 2000)
        }
    })
})


$(function () {
    $(".back").click(function () {
        location.href = "../Index/index?num=3";
    })
})

$(function () {
    $(".Chang_img").click(function () {
        $(".Beau").click()
    })
    $('.Beau').on('change', function () {
        $('section').empty(".Chang_img")
        var files = this.files
        var html = ''
        for (var i = 0; i < files.length; i++) {
            var file = files[i]
            html += '<img  class="Chang_img" src=' + URL.createObjectURL(file) + '>'
        }
        $('section').append(html)
    })

})