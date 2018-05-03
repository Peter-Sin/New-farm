<?php
namespace Admin\Controller;
use Think\Controller;
class KuaidiController extends AllowController
{
    public function jikuaidi()
    {
        $this->display("jikuaidi");
    }

    public function jikuaidiing()
    {
        defined('EBusinessID') or define('EBusinessID', '1337037');
//电商加密私钥，快递鸟提供，注意保管，不要泄漏
        defined('AppKey') or define('AppKey', '572e68e5-87ed-4645-b14a-7c1674c3c4cc');
//请求url，接口正式地址：http://api.kdniao.cc/api/eorderservice    测试环境地址：http://testapi.kdniao.cc:8081/api/oorderservice
        defined('ReqURL') or define('ReqURL', 'http://testapi.kdniao.cc:8081/api/oorderservice');
        echo "在线下单";
//构造在线下单提交信息
        $eorder = [];
        $eorder["ShipperCode"] = "SF";
        $eorder["OrderCode"] = "PM201605078947";
        $eorder["PayType"] = 1;
        $eorder["ExpType"] = 1;
        $sender = [];
        $sender["Name"] = "李先生";
        $sender["Mobile"] = "18866666666";
        $sender["ProvinceName"] = "广东省";
        $sender["CityName"] = "深圳市";
        $sender["ExpAreaName"] = "福田区";
        $sender["Address"] = "赛格广场5401AB";

        $receiver = [];
        $receiver["Name"] = "林先生";
        $receiver["Mobile"] = "18822222222";
        $receiver["ProvinceName"] = "广东省";
        $receiver["CityName"] = "深圳市";
        $receiver["ExpAreaName"] = "福田区";
        $receiver["Address"] = "赛格广场5401AB";

        $commodityOne = [];
        $commodityOne["GoodsName"] = "其他";
        $commodity = [];
        $commodity[] = $commodityOne;

        $eorder["Sender"] = $sender;
        $eorder["Receiver"] = $receiver;
        $eorder["Commodity"] = $commodity;


//调用在线下单
        $jsonParam = json_encode($eorder, JSON_UNESCAPED_UNICODE);
        echo "在线下单接口提交内容：<br/>" . $jsonParam;
        $jsonResult =$this->submitOOrder($jsonParam);
        echo "<br/><br/>";
        echo $jsonResult;

//解析在线下单返回结果
        $result = json_decode($jsonResult, true);
        echo "<br/><br/>返回码:" . $result["ResultCode"];
        if ($result["ResultCode"] == "100") {
            echo "<br/>是否成功:" . $result["Success"];
        } else {
            echo "<br/>在线下单失败";
        }
    }

    function submitOOrder($requestData){
        $datas = array(
            'EBusinessID' => EBusinessID,
            'RequestType' => '1001',
            'RequestData' => urlencode($requestData) ,
            'DataType' => '2',
        );
        $datas['DataSign'] = $this->encrypt($requestData, AppKey);
        $result=$this->sendPost(ReqURL, $datas);

        //根据公司业务处理返回的信息......

        return $result;
    }

    /**
     *  post提交数据
     * @param  string $url 请求Url
     * @param  array $datas 提交的数据
     * @return url响应返回的html
     */
    function sendPost($url, $datas) {
        $temps = array();
        foreach ($datas as $key => $value) {
            $temps[] = sprintf('%s=%s', $key, $value);
        }
        $post_data = implode('&', $temps);
        $url_info = parse_url($url);
        $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
        $httpheader.= "Host:" . $url_info['host'] . "\r\n";
        $httpheader.= "Content-Type:application/x-www-form-urlencoded\r\n";
        $httpheader.= "Content-Length:" . strlen($post_data) . "\r\n";
        $httpheader.= "Connection:close\r\n\r\n";
        $httpheader.= $post_data;
        $fd = fsockopen($url_info['host'], $url_info['port']);
        fwrite($fd, $httpheader);
        $gets = "";
        $headerFlag = true;
        while (!feof($fd)) {
            if (($header = @fgets($fd)) && ($header == "\r\n" || $header == "\n")) {
                break;
            }
        }
        while (!feof($fd)) {
            $gets.= fread($fd, 128);
        }
        fclose($fd);

        return $gets;
    }

    /**
     * 电商Sign签名生成
     * @param data 内容
     * @param appkey Appkey
     * @return DataSign签名
     */
    function encrypt($data, $appkey) {
        return urlencode(base64_encode(md5($data.$appkey)));
    }
}
