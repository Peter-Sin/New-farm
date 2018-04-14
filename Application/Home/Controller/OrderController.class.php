<?php
namespace Home\Controller;
use Think\Controller;
class OrderController extends AllowController {
    public function index(){
        
    }

    //订单查询列表
    public function orderlist(){
    	$order=M("order");
        $classprice=M("classprice");
    	$where['uid']=$_SESSION['uid'];
    	if($_POST['name']==0){
    		$list=$order->where($where)->order('id desc')->select();
    	}else{
            $where['statu']=$_POST['name'];
    		$list=$order->where($where)->order('id desc')->select();
    	}
        if($list){
            $goods=M("goods");
            foreach($list as $key=>$val){
                $id=$val['pid'];
                $cid=$val['cid'];
                $result=$goods->where("id='$id'")->field('name,price,image')->find();
                $list[$key]['pname']=$result['name'];
                $info=$classprice->where("pid='$id' AND id='$cid'")->find();
                $list[$key]['image']=$info['image'];
                $list[$key]['price']=$info['price'];
                $list[$key]['voucher']=$info['voucher'];
                
                switch ($val['statu']) {
                    case '1':
                $list[$key]['status']="待付款";
                        break;
                    case '2':
                $list[$key]['status']="待发货";
                        break;
                    case '3':
                $list[$key]['status']="待收货";
                        break;
                }
            }
            $response = array(
                'code'  => 200, 
                'message' => 'success for request',
                'data'  => $list,
            );
            $this->ajaxReturn($response,'json');
        }else{
            $response = array(
                'code'  => 200, 
                'message' => 'success for request',
                'data'  => $list,
            );
        }
    	
    }


    //提交订单
    public function addorder(){
        $order=M("order");
        $shopcar=M("shopcar");
        $data['uid']=$_SESSION['uid'];
        $data['statu']=1;
        $data['uptime']=date("Y-m-d H:i:s");
        $datas=$_POST["datas"];
        foreach($datas as $key=>$val){
            $data['pid']=$val['g'];
            $data['cid']=$val['c'];
            $data['num']=$val['n'];
            $data['addrid']=$val['addrid'];
            $data['ordernum']=md5($data['uid'].$data['uptime'].$data['pid'].$data['cid']);
            $res=$order->data($data)->add();
            if($val['ccc']==1231){
                $where['uid']=$_SESSION['uid'];
                $where['pid']=$val['g'];
                $where['cid']=$val['c'];
                $where['amount']=$val['n'];
                $info=$shopcar->where($where)->delete();  
            }
        }
        if($res){
            $response = array(
                'resultCode'  => 200, 
                'message' => 'success for request',
                'addorder'  => $res,
                'deleteshopcar'=>$info,
            );
        $this->ajaxReturn($response,'json');
        }
    }

    //取消订单
    public function removeBus(){
        $order=M("order");
        $where['id']=$_POST['orderid'];
        $where['uid']=$_SESSION['uid'];
        $res=$order->where($where)->delete();
        if($res){
            $response = array(
                'code'  => 200, 
                'message' => 'success for request',
                'data'  => $where,
            );
            $this->ajaxReturn($response,'json');
        }
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
            $where['id']=$val['g'];
            $info[$key]=$goods->where($where)->find();
            $cid=$val['c'];
            $list=$classprice->where("id='$cid'")->find();
            $info[$key]['cprice']=$list['price'];
            $info[$key]['ccprice']=$list['price']*$val['n'];
            $info[$key]['cvoucher']=$list['voucher'];
            $info[$key]['image']=$list['image'];
            $info[$key]['num']=$val['n'];
            $info[$key]['cid']=$val['c'];
            $total+=$info[$key]['ccprice'];
            $ccc=$val['ccc'];
        }
        // dump($info);
        $this->assign("info",$info);
        $this->assign("addr",$addr);
        $this->assign("total",$total);
        $this->assign("ccc",$ccc);
        $this->display('DingOk');
    }


}