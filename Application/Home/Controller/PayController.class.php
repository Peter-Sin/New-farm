<?php
namespace Home\Controller;
use Think\Controller;
class PayController extends Controller
{
    public function index()
    {
        $this->display("index");
    }
    public function dopay(){
        //下单地址，如果使用本地环境测试，修改成http,正式环境使用https;
//本地测试异步通知不到，请注意；
        $url = "http://api.659980.com/pay/action";
//测试商户
        $uid = "57752125";
        $token = "d334cb030f2935c306ed47454a8c18dd";
        $post["uid"] = $uid;
        $post["price"] = $_REQUEST["price"];
        $post["istype"] = $_REQUEST["istype"];
        $post["notify_url"] = $_REQUEST["notify_url"];
        $post["return_url"] = $_REQUEST["return_url"];
        $post["orderid"] = $_REQUEST["orderid"];
        $post["orderuid"] = $_REQUEST["orderuid"];
        $post["goodsname"] = $_REQUEST["goodsname"];
        $post["key"] = md5($post["goodsname"] . $post["istype"] . $post["notify_url"] . $post["orderid"] . $post["orderuid"] . $post["price"] . $post["return_url"] . $token . $post["uid"]);
// md5(goodsname + istype + notify_url + orderid + orderuid + price + return_url + token + uid);
        $post["format"] = isset($_REQUEST["format"])?$_REQUEST["format"]:"json";
        $post["mode"] = $_REQUEST["mode"];
        if(isset($post["format"]) and $post["format"] == "web"){
            $url .= "?" . http_build_query($post);
            header('Location: ' . $url);
            exit;
        }
        $return = $this->phpPost($url, $post);
        $info = json_decode($return, true);
        if($info["code"] != 200){
            echo ('<script>alert("' . $info['msg'] . '");window.history.go(-1);</script>');
            exit;
        }
        if(isset($info["data"]["qrcode"]) and $info["data"]["qrcode"]){
            $qrcode = urlencode($info["data"]["qrcode"]);
        }
        if($post["istype"] == 10001){
            $type['ico'] = 1;
            $type['logo'] = "alipay";
            $type['name'] = "支付宝";
        }elseif($post["istype"] == 20001){
            $type['ico'] = 3;
            $type['logo'] = "weixin";
            $type['name'] = "微信";
        }elseif($post["istype"] == 30001){
            $type['ico'] = 4;
            $type['logo'] = "qq";
            $type['name'] = "QQ钱包";
        }else{
            $type['ico'] = 5;
            $type['logo'] = "uni";
            $type['name'] = "云闪付";
        }
        $istype = $post["istype"];
        $this->assign("istype",$istype);
        $this->assign("qrcode",$qrcode);
        $this->assign("info",$info);
        $this->assign("type",$type);


        if($post['mode']==2){
            if(isset($info["data"]["alipay"]) and $info["data"]["alipay"]){
                $outInfo = '<spcn style="color:#ffffff;">' . $info["data"]["alipay_zhi"] . "</span>";
                if(strpos($info["data"]["alipay"], "alipay.com") > 0){
                    $s1 = "https://ds.alipay.com/?from=mobilecodec&scheme=";
                    $s2 = "alipays://platformapi/startapp?saId=10000007&clientVersion=3.7.0.0718&qrcode=";
                    $s3 = $info["data"]["alipay"] . "?_s=web-other";
                    $s5 = $s1 . urlencode($s2 . urlencode($s3));
                    $outMsg = '<hr><img id="show_qrcode" src="https://pan.baidu.com/share/qrcode?w=210&h=210&url=' . urlencode($s5) . '" width="210" height="210" style="display: block;margin: 0 auto;"/>';
                    $outMsg .= '<span style="max-width: 14.5em;font-weight: bold;font-size:1.3em;" class="btn">或直接扫码转账' . $info["data"]["realprice"]. '元</span>';
                }else{
                    $outMsg = "或直接向帐号转帐吧：" . $info["data"]["alipay"];
                }
            }elseif(isset($info["data"]["wechat"]) and $info["data"]["wechat"]){
                $outInfo = '<img  id="show_qrcode" src="https://pan.baidu.com/share/qrcode?w=210&h=210&url=' . urlencode($info["data"]["wechat"]) . '" width="210" height="210" style="display: block;"/>';
                $outMsg = $info["msg"];
            }elseif(isset($info["data"]["qq_qrcode"]) and $info["data"]["qq_qrcode"]){
                $outInfo = '<img  id="show_qrcode" src="https://pan.baidu.com/share/qrcode?w=210&h=210&url=' . urlencode($info["data"]["qq_qrcode"]) . '" width="210" height="210" style="display: block;"/>  QQ号码：' . $info["data"]["qq"];
                $outMsg = $info["msg"];
            }elseif(isset($info["data"]["uni_phone"]) and $info["data"]["uni_phone"]){
                $outInfo = "云闪付手机号转账：" . $info["data"]["uni_phone"] . "<br>云闪付银行卡转账：" . $info["data"]["uni_cardno"] . "<br>云付付开户名：" . $info["data"]["uni_cardname"];
                $outMsg = $info["msg"];
            }else{
                $outMsg = "";
            }
            $this->assign("outMsg",$outMsg);
            $this->assign("outInfo",$outInfo);
            $this->display("pay2");
        }else{
            $this->display("pay1");
        }
    }
    private function phpPost($url, $post_data=array(), $timeout=5,$header=""){
        $header=empty($header)?$this->defaultHeader():$header;
        $post_string = http_build_query($post_data);
        $header.="Content-length: ".strlen($post_string);
        $opts = array(
            'http'=>array(
                'protocol_version'=>'1.0',//http协议版本(若不指定php5.2系默认为http1.0)
                'method'=>"POST",//获取方式
                'timeout' => $timeout ,//超时时间
                'header'=> $header,
                'content'=> $post_string)
        );
        $context = stream_context_create($opts);
        return  @file_get_contents($url,false,$context);
    }
//默认模拟的header头
    private function defaultHeader(){
        $header="User-Agent:Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12\r\n";
        $header.="Accept:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n";
        $header.="Accept-language: zh-cn,zh;q=0.5\r\n";
        $header.="Accept-Charset: GB2312,utf-8;q=0.7,*;q=0.7\r\n";
        return $header;
    }

    public function check(){
        $orderid = $_REQUEST["orderid"];
        $filename = $orderid . ".lock";
        if (file_exists($filename)) {
            echo "1";
            unlink($filename);
        } else {
            echo "2";
        }
    }
}