<?php
namespace Home\Controller;
use Think\Controller;
class OrderController extends AllowController {
    public function _initialize() {
        vendor('Wxpay.WxPayException');
        vendor('Wxpay.WxPayConfig');
        vendor('Wxpay.WxPayData');
        vendor('Wxpay.WxPayApi');
        vendor('Wxpay.WxPayNotify');
        vendor('Wxpay.WxPayJsApi');

    }
    public function index(){
        
    }

    //订单查询列表
    public function orderlist(){
    	$order=M("order");
    	$orderinfo=M("orderinfo");
        $classprice=M("classprice");
    	$where['uid']=$_SESSION['uid'];
    	if($_POST['name']==10){
    		$list=$order->where($where)->order('id desc')->select();
    	}else{
            $where['step']=$_POST['name'];
    		$list=$order->where($where)->order('id desc')->select();
    	}
        if($list){
            $goods=M("goods");
            foreach($list as $key=>$val){
                $ordernum=$val['ordernum'];
                $goodsclassinfo[$key]=$orderinfo->where("ordernum='$ordernum'")->select();
                foreach($goodsclassinfo[$key] as $k=>$v){
                    $pid=$v['pid'];
                    $cid=$v['cid'];
                    $result=$goods->where("id='$pid'")->field('name,price,image,voucher')->find();
                    $goodsclassinfo[$key][$k]['pname']=$result['name'];
                    if($cid==0){
                        $goodsimg=M("goodsimg");
                        $imginfo=$goodsimg->where("pid='$pid'")->find();
                        $goodsclassinfo[$key][$k]['image']=$imginfo['name'];
                        $goodsclassinfo[$key][$k]['price']=$result['price'];
                        $goodsclassinfo[$key][$k]['voucher']=$result['voucher'];
                    }else{
                        $info=$classprice->where("pid='$pid' AND id='$cid'")->find();
                        $goodsclassinfo[$key][$k]['image']=$info['image'];
                        $goodsclassinfo[$key][$k]['price']=$info['price'];
                        $goodsclassinfo[$key][$k]['voucher']=$info['voucher'];
                    }
                }
                switch ($val['step']) {
                    case '0':
                    $list[$key]['status']="待付款";
                        break;
                    case '1':
                    $list[$key]['status']="待发货";
                        break;
                    case '2':
                    $list[$key]['status']="待收货";
                        break;
                }
            }
            $response = array(
                'code'  => 200, 
                'message' => 'success for request',
                'data'  => $list,
                'info'=>$goodsclassinfo,
            );
        }else{
            $response = array(
                'code'  => 300,
                'message' => '暂无订单',
            );
        }
        $this->ajaxReturn($response,'json');
    }


    //提交订单
    public function addorder(){
        $order=M("order");
        $orderinfo=M("orderinfo");
        $shopcar=M("shopcar");
        $data['uid']=$_SESSION['uid'];
        $data['statu']=0;
        $data['step']=0;
        $data['uptime']=date("Y-m-d H:i:s");
        $datas=$_POST["datas"];
        M()->startTrans();
        $i=0;$j=0;
        $data['ordernum']=md5($data['uid'].$data['uptime'].$datas);
        $data['addrid']=$_POST['addrid'];
        $data['money']=$_POST['money'];
        $res=$order->data($data)->add();
        foreach($datas as $key=>$val){
            $d['pid']=$val['g'];
            $d['cid']=$val['c'];
            $d['num']=$val['n'];
            $d['ordernum']=$data['ordernum'];
            $resu=$orderinfo->data($d)->add();
            if($resu){
                $i++;
            }
            if($_POST['ccc']==1231){
                $where['uid']=$_SESSION['uid'];
                $where['pid']=$val['g'];
                $where['cid']=$val['c'];
                $where['amount']=$val['n'];
                $result=$shopcar->where($where)->delete();
                if($result){
                    $j++;
                }
            }
        }
        if($_POST['ccc']==1231){
            if($res && count($datas)==$i && $i==$j){
                M()->commit();
                $response = array(
                    'resultCode' =>'200',
                    'message' => 'success for request',
                    'ordernum'  => $data['ordernum'],
                    'i'=>$i,
                    'j'=>$j,
                    'n'=>count($datas),
                );
            }else{
                M()->rollback();
                $response = array(
                    'resultCode' =>'300',
                    'message' => 'fail for request',
                    'ordernum'  => $data['ordernum'],
                    'i'=>$i,
                    'j'=>$j,
                    'n'=>count($datas),
                );
            }
            $this->ajaxReturn($response,'json');
        }else{
            if($res && count($datas)==$i){
                M()->commit();
                $response = array(
                    'resultCode' =>'200',
                    'message' => '提交成功',
                    'ordernum'  => $data['ordernum'],
                    'i'=>$i,
                    'n'=>count($datas),
                );
            }else{
                M()->rollback();
                $response = array(
                    'resultCode' =>'300',
                    'message' => '提交失败',
                    'ordernum'  => $data['ordernum'],
                );
            }
            $this->ajaxReturn($response,'json');
        }
    }

    //取消订单
    public function removeBus(){
        $order=M("order");
        $orderinfo=M("orderinfo");
        $ordernum=$_POST['ordernum'];
        $where['ordernum']=$ordernum;
        $where['uid']=$_SESSION['uid'];
        M()->startTrans();
        $res=$order->where($where)->delete();
        $result=$orderinfo->where("ordernum='$ordernum'")->delete();
        if($res && $result){
            M()->commit();
            $response = array(
                'code'  => 200, 
                'message' => '取消订单成功',
                'data'  => $where,
            );
        }else{
            M()->rollback();
            $response = array(
                'code'  => 300,
                'message' => '取消订单失败',
                'data'  => $where,
            );
        }
        $this->ajaxReturn($response,'json');
    }


    //确认订单页面
    public function dingOk(){
        $data=json_decode($_GET["datas"],true);
        // dump($data);
        $address=M("address");
        $goods=M("goods");
        $classprice=M("classprice");
        $data1['uid']=$_SESSION['uid'];
        $data1['choose']=1;
        $addr=$address->where($data1)->find();
        foreach($data as $key =>$val){
            $g=$val['g'];
            $n=$val['n'];
            $c=$val['c'];
            if(empty($g) && empty($n) && empty($c)){
                unset($data[$key]);
            }
        }
        foreach($data as $key =>$val){
            $gid=$val['g'];
            $where['id']=$gid;
            $info[$key]=$goods->where($where)->find();
            $cid=$val['c'];
            if($cid==0){
                $info[$key]['cprice']=$info[$key]['price'];
                $info[$key]['ccprice']=$info[$key]['price']*$val['n'];
                $info[$key]['cvoucher']=$info[$key]['voucher']*$val['n'];
                $goodsimg=M("goodsimg");
                $imginfo=$goodsimg->where("pid='$gid'")->find();
                $info[$key]['image']=$imginfo['name'];
                $info[$key]['num']=$val['n'];
                $info[$key]['cid']=$val['c'];
                $total+=$info[$key]['ccprice'];
                $ccc=$val['ccc'];
            }else{
                $list=$classprice->where("id='$cid'")->find();
                $info[$key]['cprice']=$list['price'];
                $info[$key]['ccprice']=$list['price']*$val['n'];
                $info[$key]['cvoucher']=$list['voucher']*$val['n'];
                $info[$key]['image']=$list['image'];
                $info[$key]['num']=$val['n'];
                $info[$key]['cid']=$val['c'];
                $total+=$info[$key]['ccprice'];
                $ccc=$val['ccc'];
            }
        }
        // dump($info);
        $this->assign("info",$info);
        $this->assign("addr",$addr);
        $this->assign("total",$total);
        $this->assign("ccc",$ccc);
        $this->display('DingOk');
    }

    public function dopay(){
        $order=M("order");
        $ordernum=$_GET['ordernum'];
        $info=$order->where("ordernum='$ordernum'")->find();
        $this->assign("info",$info);
        $this->display("pay");
    }

    function getUserOpenId(){
        $appid="wx1023c9b4490b8cca";
        $appsecret="79ae5365decbce25018d5c338c323514";
        $code=$_GET['code'];
        dump($code);
        $url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$appid."&secret=".$appsecret."code=".$code."&grant_type=authorization_code";
        $res=$this->http_curl($url,'get');
        dump($res);
    }

    public function getcode(){
        $appid="wx1023c9b4490b8cca";
        $redirect_uri=urlencode("http://www.cusdc.cn/index.php/Home/Pay/getUserOpenId");
        $url="https://open.weixin.qq.com/connect/qrconnect?appid=".$appid."&redirect_uri=".$redirect_uri."&response_type=code&scope=snsapi_login&state=STATE#wechat_redirect";
        header('location:'.$url);
    }

    private function is_weixin(){
        if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
            return 1;
        }
        return 0;
    }

    private function CheckOrderStatus($ordid){
        $Ord=M('enroll');
        $condition['order'] = $ordid;
        $ordstatus=$Ord->where($condition)->getField('statu');
        if($ordstatus==1){
            return true;
        }else{
            return false;
        }
    }

    private function CheckOrder($order){
        $Ord=M('enroll');
        $condition['order'] = $order;
        $ordstatus=$Ord->where($condition)->getField('order');
        if($ordstatus==$order){
            return true;
        }else{
            return false;
        }
    }

    private function OrderHandle($parameter){
        $ordid=$parameter['out_trade_no'];
        $data['pay_time']          =date("Y-m-d H:i:s");
        $data['pay_type']          =$parameter['pay_type'];
        $data['pay_return_no']     =$parameter['trade_no'];
        $data['pay_return_sts']    =$parameter['trade_status'];
        $data['buyer_email']       =$parameter['buyer_email'];
        $data['statu']             ='1';
        $data['pay_money']         =$parameter['total_fee'];
        $data['grants']			   ='0';
        $Ord=M('enroll');
        $condition['order'] = $ordid;
        $res=$Ord->where($condition)->save($data);
        if($res){
            $commission=M("commission");
            $info=$Ord->where("order='$order'")->field("recode,uid,cid,order")->find();
//            $checkrecode=CheckRecode($info['recode']);
            if($info['recode'] && $checkrecode){
                $information['uid']=$info['uid'];
                $information['cid']=$info['cid'];
                $information['recode']=$info['recode'];
                $information['order']=$info['order'];
                $information['batch']=1;
                $information['sign']=1;
                $information['amount']=50;
                $information['time']=date('Y-m-d H:i:s');
                $result=$commission->add($information);
            }
        }
    }


    public function dowxpay(){
        $order=M('order');
        $ordernum=$_GET["ordernum"];
        $condition['ordernum'] = $ordernum;
        $info=$order->where($condition)->find();
        if(empty($info) || $info=='NULL'){
            $this->ajaxReturn('0');exit;//订单号不存在
        }else{
            $statu=$order->where($condition)->getField('statu');
            if($statu=='2'){
                $this->ajaxReturn('1');exit;//该订单已支付
            }else{
                $usernames="商城支付";
                $datainfo=$info['ordernum'].$info['uptime'];
                $order=substr($info['ordernum'],0,30).getnumcode(2);//订单号
                $fee=C(ENROLL_FEE)*100;
                if(is_weixin()==1){
                    //①、获取用户openid
                    $tools = new \WxPayJsApi();
                    $openId = $tools->GetOpenid();
                    //②、统一下单
                    $input = new \WxPayUnifiedOrder();
                    $input->SetBody($usernames);//商品简单描述String(128)
                    $input->SetAttach($datainfo);//附加数据，在查询API和支付通知中原样返回，可作为自定义参数使用。String(127)
                    $input->SetOut_trade_no($order);//商户系统内部订单号，要求32个字符内、且在同一个商户号下唯一
                    $input->SetTotal_fee($fee);//订单总金额，单位为分
                    $input->SetTime_start(date("YmdHis"));//订单生成时间，格式为yyyyMMddHHmmss，如2009年12月25日9点10分10秒表示为20091225091010。
                    $input->SetTime_expire(date("YmdHis", time() + 600));//订单失效时间，格式为yyyyMMddHHmmss，如2009年12月27日9点10分10秒表示为20091227091010。
                    $input->SetGoods_tag('');//商品标记，使用代金券或立减优惠功能时需要的参数String(32)
                    $input->SetNotify_url('http://www.cusdc.cn/index.php/Home/Pay/weipayverify');//异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数
                    //https://api.mch.weixin.qq.com/pay/unifiedorder
                    $input->SetTrade_type('JSAPI');//取值如下：JSAPI，NATIVE，APP等
                    $input->SetOpenid($openId);
                    // $input->SetProduct_id($uuid);//trade_type=NATIVE时（即扫码支付），此参数必传。此参数为二维码中包含的商品ID，商户自行定义。String(32)
                    // $input->SetSpbill_create_ip(get_client_ip());//APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP，String(16)
                    $result = \WxPayApi::unifiedOrder($input);
                    $jsApiParameters = $tools->GetJsApiParameters($result);
                }else{
                    $input = new \WxPayUnifiedOrder();
                    $input->SetBody($usernames);//商品简单描述String(128)
                    $input->SetAttach($datainfo);//附加数据，在查询API和支付通知中原样返回，可作为自定义参数使用。String(127)
                    $input->SetOut_trade_no($order);//商户系统内部订单号，要求32个字符内、且在同一个商户号下唯一
                    $input->SetTotal_fee($fee);//订单总金额，单位为分
                    $input->SetTime_start(date("YmdHis"));//订单生成时间，格式为yyyyMMddHHmmss，如2009年12月25日9点10分10秒表示为20091225091010。
                    $input->SetTime_expire(date("YmdHis", time() + 600));//订单失效时间，格式为yyyyMMddHHmmss，如2009年12月27日9点10分10秒表示为20091227091010。
                    $input->SetGoods_tag('');//商品标记，使用代金券或立减优惠功能时需要的参数String(32)
                    $input->SetNotify_url('http://www.cusdc.cn/index.php/Home/Pay/weipayverify');//异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数
                    //https://api.mch.weixin.qq.com/pay/unifiedorder
                    $input->SetTrade_type('MWEB');//取值如下：JSAPI，NATIVE，APP等
                    $input->SetProduct_id($order);//trade_type=NATIVE时（即扫码支付），此参数必传。此参数为二维码中包含的商品ID，商户自行定义。String(32)
                    $input->SetSpbill_create_ip(get_client_ip());//APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP，String(16)
                    $result = \WxPayApi::unifiedOrder($input);
                }
                if ($result['return_code'] == 'FAIL') {
                    $this->assign("wxalt", $result['return_msg']);
                    $this->assign("wxewm", '');
                } elseif ($result['result_code'] == 'FAIL') {
                    $this->assign("wxalt", $result['err_code'].':'.$result['err_code_des']);
                    $this->assign("wxewm", '');
                } else {
                    if(is_weixin()==1){
                        $this->assign('jsApiParameters',$jsApiParameters);
                        $this->display("wxpay");
                    }else{
                        $redirect_url=urlencode("http://www.cusdc.cn");
                        $url=$result['mweb_url']."&redirect_url=".$redirect_url;
                        $this->assign('url',$url);
                        $this->display("www");
                    }
                }
            }
        }
    }


    public function weipayverify(){
        //写支付记录，WEB_PATH是我网站的根目录
        libxml_disable_entity_loader(true);
        $postStr = $this->postdata();//接收post数据
        $postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
        $arr = $this->object2array($postObj);//对象转成数组
        ksort($arr);// 对数据进行排序
        $str =$this-> ToUrlParams($arr);//对数据拼接成字符串
        $user_sign = strtoupper(md5($str));
        if($user_sign == $arr['sign']){//验证成功
            $out_trade_no   = $arr['out_trade_no'];        //商户订单号
            $trade_no       = $arr['transaction_id'];        //微信交易号
            $trade_status   = $arr['result_code'];    //交易状态
            $total_fee      = $arr['total_fee']/100;       //交易金额
            // $notify_id      = $arr['notify_id'];       //通知校验ID
            // $notify_time    = $arr['notify_time'];     //通知的发送时间。格式为yyyy-MM-dd HH:mm:ss。
            $buyer_email    = $arr['openid'];     //买家支付宝帐号
            $parameter = array(
                "out_trade_no" => $out_trade_no, //商户订单编号
                "trade_no"     => $trade_no,     //支付宝交易号
                "trade_status" => $trade_status, //交易状态
                "total_fee"    => $total_fee,    //交易金额
                // "notify_id"    => $notify_id,    //通知校验ID
                // "notify_time"  => $notify_time,  //通知的发送时间
                "buyer_email"  => $buyer_email,  //买家支付宝帐号
                "pay_type"     => 'wxpay',
            );

            if(!$this->CheckOrderStatus($out_trade_no)){
                $this->OrderHandle($parameter);  //进行订单处理，并传送从支付宝返回的参数；
            }
        }
    }



}