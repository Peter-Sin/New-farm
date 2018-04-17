<?php

namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $user=M("user");
        $where['uid']=$_SESSION['uid'];
        $uid=$SESSION['is_login'];
        $list=$user->where($where)->find();
        if($_GET['num']){
            $num=$_GET['num'];
        }else{
            $num=1;
        }
        $this->assign("num",$num);
        $this->assign("uid",$uid);
        $this->assign("list",$list);
        $this->display('index');
    }

    public function mall(){
    	$goods=M("goods");
        $shopcar=M("shopcar");
        $where['sort']=$_POST['classify'];
        if($_POST['classify']==0){
            $list=$goods->limit(10)->select();
        }else{
            $list=$goods->where($where)->limit(10)->select();
        }
        $goodsimg=M("goodsimg");
        foreach($list as $key=>$val){
            $pid=$val['id'];
            $info=$goodsimg->where("pid='$pid'")->field('name')->find();
            $list[$key]['image']=$info['name'];
        }
        $data['uid']=$_SESSION['uid'];
        $info=$shopcar->where($data)->select();
        if($info){
            foreach ($info as $key => $val) {
                $total+=$val['amount'];
            }
        }else{
            $total=0;
        }
        $response = array(
            'code'  => 200, 
            'message' => 'success for request',
            'shopcar_num' => $total ,
            'data'  => $list,
            'is_login'=>$_SESSION['is_login'],
        );
    	$this->ajaxReturn($response,'json');
    }

    public function onemoney(){
    	$onemoney=M("onemoney");
    	$list=$onemoney->where("uptime<=NOW() AND DATE_ADD(uptime, INTERVAL hour HOUR)>=NOW() AND amount>number")->select();
    	foreach($list as $key=>$val){
    		$cen=3600*$val['hour']+strtotime($val['uptime']);
    		$list[$key]['endtime']=date("Y-m-d H:i:s",$cen);
    	}
    	$this->assign("list",$list);
        $this->display("onemoney");
    }

    public function onclicknum(){
        $onemoney=M("onemoney");
        $pid=$_POST["pid"];
        $info=$onemoney->where("id='$pid'")->find();
        $num=$info['amount']-$info['number'];
        if($num>0){
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
        $pid=$_POST['pid'];
        $data['pid']=$pid;
        $onelist=$onemoney->where("id='$pid'")->find();
        if($onelist['amount']-$onelist['number']>=$_POST['amount']){
            $info=$lootgoods->where($data)->find();
            M()->startTrans();
            if($info){
                $where['amount']=$info['amount']+$_POST['amount'];
                $where['loot_time']=date("Y-m-d H:i:s");
                $res=$lootgoods->where($data)->data($where)->save();//夺宝数据库   修改
            }else{
                $data['amount']=$_POST['amount'];
                $data['loot_time']=date("Y-m-d H:i:s");
                $res=$lootgoods->data($data)->add();//夺宝数据库   添加
            }
            if($res){
                $pid=$_POST["pid"];
                $list=$onemoney->where("id='$pid'")->find();
                $t['number']=$list['number']+$_POST['amount'];
                $m=$onemoney->where("id='$pid'")->data($t)->save();//夺宝商品数据库
                if($m){
                    M()->commit();
                    $response = array(
                    'resultCode'  => 200, 
                    'message' => 'success for request',
                    'data'  => $m,
                );
                $this->ajaxReturn($response,'json');
                }else{
                    M()->rollback();
                }
            }
        }else{
            $response = array(
                'resultCode'  => 300, 
                'message' => 'success for request',
                'data'  => 抢购数量超出,
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
    	->field('l.id,o.name,o.amount,o.number,o.uptime,o.image,o.hour,o.id as pid')
    	->where("l.uid='$uid' AND l.pid=o.id AND o.uptime<NOW()")
        // AND DATE_ADD(o.uptime, INTERVAL o.hour HOUR)<NOW()
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
                
                // $info=M()
                // ->table("winer w,user u")
                // ->field('u.username')
                // ->where("w.pid='$pid' AND w.winid=u.id")
                // ->select();
                // if(!empty($info[0]['username'])){
                //     $list[$key]['username']=$info[0]['username'];
                // }else{
                //    $list[$key]['username']=$this->winner($pid);
                // }
            }
        }
        // dump($list);
    	$this->assign("list",$list);
    	$this->display('myonemoney');
    }

    // public function winner($pid){
    //     $lootgoods=M("lootgoods");
    //     $winer=M("winer");
    //     $info=$winer->where("pid='$pid'")->find();
    //     if(empty($info)){
    //         $list=$lootgoods->where("pid='$pid'")->select();
    //         $j=0;
    //         $count=array();
    //         foreach($list as $key=>$val){
    //             $num=$val['amount'];
    //             for($i=0;$i<$num;$i++){
    //                 $j++;
    //                 $count[$j]=$val['uid'];
    //             }
    //         }
    //         $random=mt_rand(1,count($count));
    //         $data['winid']=$count[$random];
    //         $data['pid']=$pid;
    //         $res=$winer->data($data)->add();
    //         $user=M("user");
    //         $uid=$data['winid'];
    //         $userinfo=$user->where("id='$uid'")->find();
    //         $username=$userinfo['username'];
    //         return $username;
    //     }
    // }

  //   public function winning(){
  //   	$lootgoods=M("lootgoods");
  //   	$winer=M("winer");
  //   	$pid=$_POST['pid'];
  //   	$info=$winer->where("pid='$pid'")->find();
  //   	if(empty($info)){
	 //    	$list=$lootgoods->where("pid='$pid'")->select();
	 //    	$j=0;
	 //    	$count=array();
	 //    	foreach($list as $key=>$val){
	 //    		$num=$val['amount'];
	 //    		for($i=0;$i<$num;$i++){
	 //    			$j++;
	 //    			$count[$j]=$val['uid'];
	 //    		}
	 //    	}
	 //    	$random=mt_rand(1,count($count));
	 //    	$data['winid']=$count[$random];
	 //    	$data['pid']=$pid;
	 //    	$res=$winer->data($data)->add();
	 //    	if($res){
		//     	$response = array(
		//             'resultCode'  => 200, 
		//             'message' => 'success for request',
		//             'data'  => $res,
		//         );
		//         $this->ajaxReturn($response,'json');
		//     }
		// }else{
  //           $response = array(
  //               'resultCode'  => 200, 
  //               'message' => 'success for request',
  //               'data'  => "改商品已选出获奖者",
  //           );
  //           $this->ajaxReturn($response,'json');
  //       }
  //   }
}