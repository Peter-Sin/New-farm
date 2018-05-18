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
                    case '3':
                    $list[$key]['status']="已收货";
                        break;
                }
                if(empty($val['express_number'])){
                    $list[$key]['express_number']="待添加，请稍候...";
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

    public function getgoods(){
        $order=M("order");
        $oid=$_POST["oid"];
        $data['step']=3;
        $res=$order->where("id='$oid'")->data($data)->save();
        if($res){
            $response = array(
                'resultCode'  => 200, 
            );
            $this->ajaxReturn($response,'json');
        }
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
        foreach($datas as $key=>$val){
            $d['pid']=$val['g'];
            $d['cid']=$val['c'];
            $d['num']=$val['n'];
            $alltotal= checkmoney($val['c'],$val['g'],$val['n']);
            $moneytotal+=$alltotal['money'];
            $vouchertotal+=$alltotal['voucher'];
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
        $data['money']=$_POST['money'];
        $data['voucher']=$_POST['voucher'];
        $res=$order->data($data)->add();
        if($_POST['ccc']==1231){
            if($res && count($datas)==$i && $i==$j){
                M()->commit();
                $response = array(
                    'resultCode' =>'200',
                    'message' => 'success for request',
                    'ordernum'  => $data['ordernum'],
                    'i'=>$moneytotal,
                    'j'=>$vouchertotal,
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
                $vcount+=$info[$key]['cvoucher'];
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
                $vcount+=$info[$key]['cvoucher'];
                $ccc=$val['ccc'];
            }
        }
        $this->assign("info",$info);
        $this->assign("addr",$addr);
        $this->assign("total",$total);
        $this->assign("vcount",$vcount);
        $this->assign("ccc",$ccc);
        $this->display('DingOk');
    }

    public function dopay(){
        $order=M("order");
        $f_mygoods=M("f_mygoods");
        $ordernum=$_GET['ordernum'];
        $info=$order->where("ordernum='$ordernum'")->field("ordernum,uptime,money,voucher,statu")->find();
        $uid=$_SESSION["uid"];
        $myvoucher=$f_mygoods->where("uid='$uid'")->getfield("voucher");
        if($myvoucher<$info['voucher']){
            echo "<script> alert('购物券数量不足');location.href = \"../Index/index\";</script>";
        }else{
            if($info){
                if($info['statu']==1){
                    echo "<script> alert('该订单已支付');location.href = \"../Index/index\";</script>";
                }else{
                    $istype=is_weixin();
                    $info['istype']=$istype;
                    $this->assign("info",$info);
                    $this->display("pay");
                }
            }else{
                echo "<script> alert('订单信息不存在');location.href = \"../Index/index\";</script>";
            }
        }
    }


    public function dopayone(){
        $onemoney=M("onemoney");
        $num=$_GET['num'];
        $pid=$_GET['pid'];
        $infos=$onemoney->where("id='$pid'")->field("amount,number")->find();
        if($infos){
            if($infos['amount']-$infos['number']<$num){
                echo "<script> alert('抢购数量超出,请重新选择');location.href = \"../Onemoney/onemoney\";</script>";
            }else{
                $istype=is_weixin();
                $info['istype']=$istype;
                $info['num']=$num;
                $info['pid']=$pid;
                $this->assign("info",$info);
                $this->display("payone");
            }
        }else{
            echo "<script> alert('夺宝信息有误,请重新选择');location.href = \"../Onemoney/onemoney\";</script>";
        }
    }
}