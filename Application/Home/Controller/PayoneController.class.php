<?php
namespace Home\Controller;
use Think\Controller;
class PayoneController extends Controller
{
    public function index(){
        $this->display("index");
    }

    public function payone()
    {
        $pid=$_POST['pid'];
        $onemoney=M("onemoney");
        $info=$onemoney->where("id='$pid'")->find();
        $price=$_POST['num']*0.01;
        $istype =$_POST['istype'];
        $orderuid =$_SESSION['uid'].&.$pid;       //此处传入您网站用户的用户名，方便在paysapi后台查看是谁付的款，强烈建议加上。可忽略。
//校验传入的表单，确保价格为正常价格（整数，1位小数，2位小数都可以），支付渠道只能是1或者2，orderuid长度不要超过33个中英文字。
//此处就在您服务器生成新订单，并把创建的订单号传入到下面的orderid中。
        $goodsname = $pid;//请叫我商品名称，不要超过33个中英文字
        $orderid = MD5($pid.$info.$price.$istype.$orderuid.time());    //每次有任何参数变化，订单号就变一个吧。
        $uid = "6dc7af43978a4029302c7e5b";//"此处填写PaysApi的uid";
        $token = "9206745c4f3e1e4acad7ad93d1b88033";//"此处填写PaysApi的Token";
        $return_url = 'http://fnpc1.top/index.php/home/Payone/payreturn';
        $notify_url = 'http://fnpc1.top/index.php/home/Payone/paynotify';
        $key = md5($goodsname . $istype . $notify_url . $orderid . $orderuid . $price . $return_url . $token . $uid);
//经常遇到有研发问为啥key值返回错误，大多数原因：1.参数的排列顺序不对；2.上面的参数少传了，但是这里的key值又带进去计算了，导致服务端key算出来和你的不一样。
        $returndata['goodsname'] = $goodsname;
        $returndata['istype'] = $istype;
        $returndata['key'] = $key;
        $returndata['notify_url'] = $notify_url;
        $returndata['orderid'] = $orderid;
        $returndata['orderuid'] = $orderuid;
        $returndata['price'] = $price;
        $returndata['return_url'] = $return_url;
        $returndata['uid'] = $uid;
        $url="http://fnpc1.top/index.php/home/Payone/index";
        echo $this->jsonSuccess("OK", $returndata, $url);
    }

//返回错误
    function jsonError($message = '', $url = null)
    {
        $return['msg'] = $message;
        $return['data'] = '';
        $return['code'] = -1;
        $return['url'] = $url;
        return json_encode($return);

    }

//返回正确
    function jsonSuccess($message = '', $data = '', $url = null)
    {
        $return['msg'] = $message;
        $return['data'] = $data;
        $return['code'] = 1;
        $return['url'] = $url;
        return json_encode($return);
    }

    public function paynotify()
    {
        $paysapi_id = $_POST["paysapi_id"];
        $orderid = $_POST["orderid"];
        $price = $_POST["price"];
        $realprice = $_POST["realprice"];
        $orderuid = $_POST["orderuid"];
        $key = $_POST["key"];

        $data['paysapi_id'] = $_POST["paysapi_id"];
        $data['orderid'] = $_POST["orderid"];
        $data['price'] = $_POST["price"];
        $data['pay_money'] = $_POST["realprice"];
        $data['orderuid'] = $_POST["orderuid"];
        $data['key'] = $_POST["key"];

        $token = "9206745c4f3e1e4acad7ad93d1b88033";
        $temps = md5($orderid . $orderuid . $paysapi_id . $price . $realprice . $token);
        $order=M("order");
        $lootgoods=M("lootgoods");
        if ($temps != $key) {
            return $this->jsonError("key值不匹配");
        } else {
            // $dd['amount']=$_POST["goodsname"];
            // $dd['amount']=121;
            // $dd['pid']=$_POST["goodsname"];
            // $lootgoods->where("uid=21 AND pid=1")->data($dd)->save();

            M()->startTrans();
            $data['pay_time'] = date("Y-m-d H:i:s");
            $orderuid=$_POST["orderuid"];
            $array=explode('&', $orderuid);
            $data['uid']=$array[0];
            $data['pid']=$array[1];
            $lootgoods = M("lootgoods");
            $res=$lootgoods->data($data)->add();//添加夺取信息表
            $onemoney=M("onemoney");
            $result=$onemoney->where("id='$pid'")->setInc('number',$_POST["price"]);//添加已被夺宝数量
            if($res && $result){
                M()->commit();
            }else{
                M()->rollback();
            }
        }
    }


    public function payreturn()
    {
        $orderid = $_GET["orderid"];
//此处在您数据库中查询：此笔订单号是否已经异步通知给您付款成功了。如成功了，就给他返回一个支付成功的展示。
        echo "恭喜，支付成功!，订单号：" . $orderid;
    }
}