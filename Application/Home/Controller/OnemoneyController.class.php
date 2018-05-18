<?php
namespace Home\Controller;
use Think\Controller;
class OnemoneyController extends AllowController {
    public function onemoney(){
        $onemoney=M("onemoney");
        $lootgoods=M("lootgoods");
        $arr['statu']=1;
        $list=$onemoney->where("uptime<=NOW() AND DATE_ADD(uptime, INTERVAL hour HOUR)>=NOW() AND amount>number")->where($arr)->select();
        foreach($list as $key=>$val){
            $cen=3600*$val['hour']+strtotime($val['uptime']);
            $list[$key]['endtime']=date("Y-m-d H:i:s",$cen);
            $pid=$val['id'];
            $uid=$_SESSION["uid"];
            $anum=$lootgoods->where("pid='$pid' AND uid='$uid'")->Field("SUM(amount) as count")->find();
            if($anum){
                $list[$key]['anum']=$anum['count'];
            }else{
                $list[$key]['anum']=0;
            }
        }
        $this->assign("list",$list);
        $this->display("onemoney");
    }

    public function onclicknum(){
        $onemoney=M("onemoney");
        $pid=$_POST["pid"];
        $info=$onemoney->where("id='$pid'")->find();
        $num=$info['amount']-$info['number'];
        if($num>=0){
            $response=array(
                'resultCode'  => 200,
                'message' => 'success for request',
                'dataa'  => $num,
                'data1'=>$info,
            );
        }else{
            $response=array(
                'resultCode'  => 300,
                'message' => 'faild for request',
                'dataa'  => "已结束",
                'data1'=>$info,
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function lootgoods(){
        $lootgoods=M("lootgoods");
        $onemoney=M("onemoney");
        $data['uid']=$_SESSION['uid'];
        $amount=$_POST['amount'];
        $pid=$_POST['pid'];
        $data['pid']=$pid;
        $onelist=$onemoney->where("id='$pid'")->find();
        if($amount==0){
            $response = array(
                'resultCode'  => 500,
                'message' => '果子数不能为0',
            );
            $this->ajaxReturn($response,'json');
        }elseif($amount>0){
            if($onelist['amount']-$onelist['number']>=$amount){
                // $info=$lootgoods->where($data)->find();
                M()->startTrans();
                // if($info){
                //     $where['amount']=$info['amount']+$_POST['amount'];
                //     $anum=$where['amount'];
                //     $where['loot_time']=date("Y-m-d H:i:s");
                //     $res=$lootgoods->where($data)->data($where)->save();//夺宝数据库   修改
                // }else{
                    $data['amount']=$_POST['amount'];
                    $anum=$data['amount'];
                    $data['loot_time']=date("Y-m-d H:i:s");
                    $res=$lootgoods->data($data)->add();//夺宝数据库   添加
                // }
                $f_mygoods=M("f_mygoods");
                $uid=$_SESSION['uid'];
                $res1=$f_mygoods->where("uid='$uid'")->setDec("voucher",$amount);
                if($res && $res1){
                    $pid=$_POST["pid"];
                    $list=$onemoney->where("id='$pid'")->find();
                    $t['number']=$list['number']+$_POST['amount'];
                    $m=$onemoney->where("id='$pid'")->data($t)->save();//夺宝商品数据库

                    $data1['paysapi_id'] = 1;
                    $data1['orderid'] = 1;
                    $data1['price'] = $_POST['amount'];
                    $data1['pay_money'] = $_POST['amount'];
                    $data1['orderuid'] = 1;
                    $data1['key'] = 1;
                    $data1['pay_time'] = date("Y-m-d H:i:s");
                    // $orderuid=$_POST["orderuid"];
                    // $array=explode('&', $orderuid);
                    $uid=$_POST["uid"];
                    $pid=$_POST["pid"];
                    $m1=$lootgoods->where($data)->data($data1)->save();
                    if($m && $m1){
                        M()->commit();
                        $response = array(
                            'resultCode'  => 200,
                            'message' => '参与成功',
                            'num'=>$t['number'],
                            'total'=>$list['amount'],
                            'anum'=>$anum,
                        );
                    }else{
                        M()->rollback();
                        $response = array(
                            'resultCode'  => 400,
                            'message' => '参与失败',
                        );
                    }
                    $this->ajaxReturn($response,'json');
                }
            }else{
                $response = array(
                    'resultCode'  => 300,
                    'message' => 'success for request',
                    'data'  => '抢购数量超出',
                );
                $this->ajaxReturn($response,'json');
            }
        }else{
            $response = array(
                'resultCode'  => 600,
                'message' => 'success for request',
                'data'  => '数量不能小于0',
            );
            $this->ajaxReturn($response,'json');
        }
    }


    public function myonemoney(){
        $lootgoods=M("lootgoods");
        $onemoney=M("onemoney");
        $winer=M("winer");
        $uid=$_SESSION['uid'];
        $list=M()
            ->table("lootgoods l,onemoney o")
            ->field('l.id,o.name,o.amount,o.number,o.uptime,o.image,o.hour,o.id as pid,sum(l.amount) as anum')
            ->where("l.uid='$uid' AND l.pid=o.id AND o.uptime<NOW()")
            ->group("l.pid,l.uid")
            ->select();
        foreach($list as $key=>$val){
            $cen=3600*$val['hour']+strtotime($val['uptime']);
            $list[$key]['endtime']=date("Y-m-d H:i:s",$cen);
            $list[$key]['union']=time()-$cen;
            $list[$key]['num']=$val['amount']-$val['number'];
            if($list[$key]['union']>0 || $list[$key]['num']<=0){
                $pid=$val['pid'];
                $info=$winer->where("pid='$pid'")->find();
                if($info){
                    $list[$key]['ischoose']=1;
                    $list[$key]['username']=$info['winer'];
                    $list[$key]['winernum']=$info['number'];
                }else{
                    $list[$key]['ischoose']=0;
                }
            }
        }
        $this->assign("list",$list);
        $this->display('myonemoney');
    }
}