<?php
namespace Home\Controller;
use Think\Controller;
class FarmController extends AllowController {
    public function _initialize(){
        $setting=M("setting");
        $info=$setting->where("id='1'")->find();
        $this->fruit_tree=$info['fruit_tree'];//果树生命周期
        $this->tree_price=$info['tree_price'];//果树价值
        $this->land_price=$info['land_price'];//土地价值
        $this->transaction_fee=$info['transaction_fee']/100;//交易手续费百分比
        $this->trading_limits=$info['trading_limits'];//交易最低额度
        $this->user_steal=$info['user_steal']/100;//用户偷取百分比
        $this->trade_exchange=$info['trade_exchange']/100;//交易兑换百分比
        $this->uprate=$info['uprate']/100;
        $this->upuprate=$info['upuprate']/100;
    }

    private function lowest(){
        $f_lowest=M("f_lowest");
        $uid=$_SESSION['uid'];
        $lownum=$f_lowest->where("uid='$uid'")->getField("lownum");
        return $lownum;
    }

    public function getlastland(){
        $f_land=M("f_land");
        $f_mygoods=M("f_mygoods");
        $f_rate=M("f_rate");
        $num=$_POST["num"];
        $uid=$_SESSION["uid"];
        $landcount=$f_land->where("uid='$uid'")->count();
        $land_price=$this->land_price;
//        $trading_limits=$this->trading_limits;
        $fruitinfo=$f_mygoods->where("uid='$uid'")->getField("fruit");
        if($fruitinfo>=$land_price){
            if($num==$landcount){
                $lastinfo=$f_land->where("uid='$uid'")->order("id desc")->limit(1)->select();
                $lastltime=strtotime($lastinfo[0]['time']);
                $landnum=$landcount+1;
                $landlife=$f_rate->where("land_num='$landnum'")->getField("cycle");
                $numtime=$landlife*24*3600;
                if($lastltime+$numtime<=time()){
                    M()->startTrans();//开始事务处理
                    $data['uid']=$_SESSION['uid'];
                    $data['time']=date("Y-m-d H:i:s");
                    $res=$f_land->data($data)->add();
//                $landinfo=$f_mygoods->where("uid='$uid'")->getField("land");
//                $arr['land']=$landinfo+1;
//                $result=$f_mygoods->where("uid='$uid'")->data($arr)->save();
                    $result=$f_mygoods->where("uid='$uid'")->setInc("land",1);
                    if($res && $result){
                        M()->commit();
                        $response = array(
                            'resultCode'  => 200,
                            'message' => '开地成功',
                        );
                    }else{
                        M()->rollback();
                        $response = array(
                            'resultCode'  => 300,
                            'message' => '开地失败',
                        );
                    }
                }else{
                    $response = array(
                        'resultCode'  => 400,
                        'message' => '未达到固定周期,暂不可开地',
                    );
                }
            }
        }else{
            $response = array(
                'resultCode'  => 500,
                'message' => '果子数量不足',
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function index(){
    	$user=M("user");
    	$f_mygoods=M("f_mygoods");
		$uid=$_SESSION['uid'];
		if($uid){
			$userinfo=$user->where("id='$uid'")->field('username,vipid,faceimg')->find();
			$goodsinfo=$f_mygoods->where("uid='$uid'")->field('fruit,voucher')->find();
		}else{
			$userinfo=0;
    		$goodsinfo=0;
		}
		$f_tree=M("f_tree");
		$f_land=M("f_land");
		$f_harvest=M("f_harvest");
		$land_count=$f_land->where("uid='$uid'")->count();//土地数量
		for($i=0;$i<16;$i++){
			if($i<$land_count){
				$list[$i]['land']=1;
			}else{
				$list[$i]['land']=0;
			}
			if($i==$land_count){
                $list[$i]['kd']=1;
            }else{
                $list[$i]['kd']=0;
            }
		}
		$trees=$f_tree->where("uid='$uid'")->select();//我的树s
		foreach($trees as $key=>$val){
			$lid=$val['lid']-1;
			$list[$lid]['tree']=1;
			$tid=$val['id'];
			$planttime=$val['time'];
            $fruit_tree_life=$this->fruit_tree;//树木生命值
			$dietime=strtotime($val['time'])+$fruit_tree_life*24*3600;//树木死亡时间
			$fruits=$f_harvest->where("treeid='$tid'")->order("id desc")->limit(1)->select();
			$shtime=strtotime($fruits[0]['time']);//上次收获时间戳
//			$twelvetime=strtotime(date("Y-m-d",$shtime))+12*3600;//上次收获时间当天中午12点时间戳
//			if($shtime<$twelvetime){
//				$cstime=$twelvetime+18*3600;
//			}else{
//				$cstime=$twelvetime+42*3600;
//			}
            $twentyfourime=strtotime(date("Y-m-d",$shtime))+24*3600;//上次收获时间当天晚上24点时间戳
            $cstime=$twentyfourime+6*3600;
			if($dietime<=time()){
                $list[$lid]['fruit']=3;//树木生命结束
            }else{
			    if($cstime<=time()){
			        $list[$lid]['fruit']=1;//可收
                }else{
			        if($dietime<$cstime){
                        $list[$lid]['fruit']=3;//树木生命结束
                    }else{
                        $list[$lid]['fruit']=0;//bu可收
                    }
			    }
            }
		}
		$this->assign("list",$list);
    	$this->assign("uinfo",$userinfo);
		$this->assign("info",$goodsinfo);
        $this->display('indx');
    }

//种树
    public function planting(){
        $uid=$_SESSION['uid'];
        $tree_price=$this->tree_price;
    	$f_mygoods=M('f_mygoods');
        $info=$f_mygoods->where("uid='$uid'")->find();
//        $lowest=$this->lowest();
//        if($lowest){
//            $trading_limits=$lowest;
//        }else{
//            $trading_limits=$this->trading_limits;
//        }
        if($info['fruit']>=$tree_price){
            $f_tree=M('f_tree');
            $f_harvest=M("f_harvest");
            $f_land=M("f_land");
            $f_rate=M("f_rate");
            $land_count=$f_land->where("uid='$uid'")->count();
            $rate=$f_rate->where("land_num='$land_count'")->getField('rate');//当前拆分率
            M()->startTrans();//开始事务处理
            $data['uid']=$uid;
            $lid=$_POST['abc'];
            $data['lid']=$lid;
            $data['time']=date("Y-m-d H:i:s");
            $res=$f_tree->data($data)->add();//树表
            $dataa['uid']=$uid;
            $dataa['treeid']=$res;
            $dataa['rate']=$rate;
            $dataa['amount']=0;
            $dataa['time']=date("Y-m-d H:i:s");
            $resul=$f_harvest->data($dataa)->add();//收获表
            $datas['fruit']=$info['fruit']-$tree_price;
            $datas['tree']=$info['tree']+1;
            $result=$f_mygoods->where("uid='$uid'")->data($datas)->save();
            if($res && $resul && $result){
                M()->commit();
                plantinfo($lid);
                $response = array(
                    'resultCode'  => 200,
                    'message' => 'success for request',
                );
            }else{
                M()->rollback();
                $response = array(
                    'resultCode'  => 400,
                    'message' => '栽种失败',
                );
            }
        }else{
            $response = array(
                'resultCode'  => 300,
                'message' => '果子数量不足',
            );
        }
        $this->ajaxReturn($response,'json');
	}

	public function xiuli(){
		$abc=$_POST['abc'];
		$uid=$_SESSION["uid"];
		if($abc==1){//铲除
            $f_tree=M("f_tree");
            $f_oldtree=M("f_oldtree");
            $f_mygoods=M("f_mygoods");
            $lid=$_POST['num'];
            M()->startTrans();//开始事务处理
            $info=$f_tree->where("uid='$uid' AND lid='$lid'")->find();
            $res=$f_tree->where("uid='$uid' AND lid='$lid'")->delete();
            $data['oid']=$info["id"];
            $data['uid']=$info["uid"];
            $data['lid']=$info["lid"];
            $data['oldtime']=$info["time"];
            $data['time']=date("Y-m-d H:i:s");
            $result=$f_oldtree->data($data)->add();
            $treenum=$f_mygoods->where("uid='$uid'")->getField("tree");
            $datas['tree']=$treenum-1;
            $res1=$f_mygoods->where("uid='$uid'")->data($datas)->save();
            if($res && $result && $res1){
                rmoveinfo($lid);
                M()->commit();
                $response=array(
                    'resultCode'=>200,
                    'content'=>'success'
                );
            }else{
                M()->rollback();
                $response=array(
                    'resultCode'=>300,
                    'content'=>'铲除失败'
                );
            }
            $this->ajaxReturn($response,'json');
		}elseif($abc==3){//收获
			$f_harvest=M("f_harvest");
			$f_mygoods=M("f_mygoods");
			$f_land=M("f_land");
			$f_rate=M("f_rate");
			$f_tree=M("f_tree");
            $treeinfo=$f_tree->where("uid='$uid'")->select();
            $land_count=$f_land->where("uid='$uid'")->count();
            $rate=$f_rate->where("land_num='$land_count'")->getField('rate');
			$i=0;$j=0;
			$total=0;
            M()->startTrans();//开始事务处理
			foreach($treeinfo as $key=>$val) {
                $tid = $val["id"];
                $fruitinfo = $f_harvest->where("uid='$uid' AND treeid='$tid'")->order("time desc")->limit(1)->select();
                $shtime = strtotime($fruitinfo[0]['time']);//上次收获时间
//                $twelvetime=strtotime(date("Y-m-d",$shtime))+12*3600;//上次收获当天中午12点
//                if($shtime<$twelvetime){
//                    $cstime=$twelvetime+18*3600;
//                }else{
//                    $cstime=$twelvetime+42*3600;
//                }
                $fruit_tree_life = $this->fruit_tree;//树木生命值
                $dietime = strtotime($val['time']) + $fruit_tree_life * 24 * 3600;//树木死亡时间

                $twentyfourime = strtotime(date("Y-m-d", $shtime)) + 24 * 3600;//上次收获时间当天晚上24点时间戳
                $cstime = $twentyfourime + 6 * 3600;
                if ($dietime > time()) {
                    if ($cstime <= time()) {
                        $data['uid'] = $uid;
                        $data['treeid'] = $tid;
                        $oldrate = $fruitinfo[0]['rate'];
                        $f_steal = M("f_steal");
                        $oldouttime = $f_steal->where("tuid='$uid'")->order("id desc")->limit(1)->select();
                        $oldoutime = $oldouttime[0]['time'];
                        $tree_price = $this->tree_price;
                        if (strtotime($oldoutime) < $cstime) {
                            $data['amount'] = $tree_price * $oldrate;
                        } else {
                            $user_steal = $this->user_steal;
                            $data['amount'] = $tree_price * $oldrate * (1 - $user_steal);
                        }
                        $total += $data['amount'];
                        $data['rate'] = $rate;
                        $data['time'] = date("Y-m-d H:i:s");
                        $res[$i] = $f_harvest->data($data)->add();
                        if ($res[$i]) {
                            $j++;
                        }
                        $i++;
                    }
                }
            }
//            $response=array(
//                'resultCode'=>200,
//                'i'=>$i,
//                'j'=>$j,
//            );
            if($i==$j){
                if($i==0){
                    M()->rollback();
                    $response=array(
                        'resultCode'=>300,
                        'content'=>'没有可收获的果子'
                    );
                    $this->ajaxReturn($response,'json');
                }else{
                    $fruitnum=$f_mygoods->where("uid='$uid'")->getField("fruit");
                    $datas['fruit']=$fruitnum+$total;
                    $result=$f_mygoods->where("uid='$uid'")->data($datas)->save();
                    $user=M("user");
                    $userinfo=$user->where("id='$uid'")->find();

                    $usertel=$userinfo["referee"];
                    $upuserinfo=$user->where("telphone='$usertel'")->find();
                    if($upuserinfo){
                        $uprare=$this->uprate;
                        $upuprare=$this->upuprate;
                        $upuserid=$upuserinfo["id"];//上级id
                        $upfruittotal=$total*$uprare;
                        $result1=$f_mygoods->where("uid='$upuserid'")->setInc("fruit",$upfruittotal);

                        $upusertel=$upuserinfo["referee"];
                        $upupuserinfo=$user->where("telphone='$upusertel'")->find();
                        if($upupuserinfo){
                            $upupuserid=$upupuserinfo["id"];//上上级id
                            $upupfruittotal=$total*$upuprare;
                            $result2=$f_mygoods->where("uid='$upupuserid'")->setInc("fruit",$upupfruittotal);
                        }
                    }
                    if($upuserinfo && !$upupuserinfo){
                        if($result && $result1){
                            haravestinfo($total);
                            M()->commit();
                            $response=array(
                                'resultCode'=>200,
                                'content'=>'收获成功'
                            );
                            $this->ajaxReturn($response,'json');
                        }else{
                            M()->rollback();
                            $response=array(
                                'resultCode'=>400,
                                'content'=>'收获失败1'
                            );
                            $this->ajaxReturn($response,'json');
                        }
                    }else if(!$upuserinfo){
                        if($result){
                            haravestinfo($total);
                            M()->commit();
                            $response=array(
                                'resultCode'=>200,
                                'content'=>'收获成功'
                            );
                            $this->ajaxReturn($response,'json');
                        }else{
                            M()->rollback();
                            $response=array(
                                'resultCode'=>400,
                                'content'=>'收获失败2'
                            );
                            $this->ajaxReturn($response,'json');
                        }
                    }else if($upuserinfo && $upupuserinfo){
                        if($result && $result1 && $result2){
                            haravestinfo($total);
                            M()->commit();
                            $response=array(
                                'resultCode'=>200,
                                'content'=>'收获成功'
                            );
                            $this->ajaxReturn($response,'json');
                        }else{
                            M()->rollback();
                            $response=array(
                                'resultCode'=>400,
                                'content'=>'收获失败3'
                            );
                            $this->ajaxReturn($response,'json');
                        }
                    }

                }
            }
		}
	}

	public function getlandnum(){
        $f_land=M("f_land");
        $uid=$_SESSION["uid"];
        $landnum=$f_land->where("uid='$uid'")->count();
        if($landnum>=5){
            $response=array(
                'resultCode'=>"200",
            );
        }else{
            $response=array(
                'resultCode'=>"300",
            );
        }
        $this->ajaxReturn($response,'json');
    }
	
//果子交易
	public function trade(){
		$mygoods=M("f_mygoods");
		$trade=M("f_trade");
		$user=M("user");
		$uid=$_SESSION['uid'];
		$a=$_POST['abc'];
		if($a==0){
			$info=$mygoods->where("uid='$uid'")->getfield("fruit");
            $transaction_fee=$this->transaction_fee;
            $trade_exchange=$this->trade_exchange;
			if($info){
				$response=array(
					'resultCode'=>"200",
					'num'=>$info,
                    'transaction_fee'=>($transaction_fee*100).'%',
                    'trade_exchange'=>($trade_exchange*100).'%',
				);
			}
		}elseif($a==1){
			$info=$trade->where("tuid='$uid'")->select();
			foreach($info as $key=>$val){
				$id=$val['tuid'];
				$userinfo=$user->where("id='$id'")->find();
				$info[$key]['vipid']=$userinfo['vipid'];
				$info[$key]['username']=$userinfo['username'];
			}
			if($info){
				$response=array(
					'resultCode'=>"200",
					'num'=>$info,
				);
			}
		}elseif($a==2){
			$info=$trade->where("uid='$uid'")->select();
			foreach($info as $key=>$val){
				$info[$key]['unum']=$val['num']-$val['realnum'];
				$id=$val['tuid'];
				$userinfo=$user->where("id='$id'")->find();
				$info[$key]['vipid']=$userinfo['vipid'];
				$info[$key]['username']=$userinfo['username'];
			}
			if($info){
				$response=array(
					'resultCode'=>"200",
					'num'=>$info,
				);
			}
		}
		$this->ajaxReturn($response,'json');
	}

//交易ing
    public function trading(){
        $uid=$_SESSION['uid'];
        $f_mygoods=M("f_mygoods");
        $lowest=$this->lowest();
        if($lowest){
            $trading_limits=$lowest;
        }else{
            $trading_limits=$this->trading_limits;
        }
        $transaction_fee=$this->transaction_fee;
        $trade_exchange=$this->trade_exchange;
        $myfruit=$f_mygoods->where("uid='$uid'")->find();
        $num=$_POST['somefruit'];//果子数量
        if($myfruit['fruit']-$num*(1+$transaction_fee+$trade_exchange)>=$trading_limits){
            $trade=M("f_trade");
            $exchange=M("f_exchange");
            $user=M("user");
            $telphone=$_POST['userId'];
            $info=$user->where("telphone='$telphone'")->find();
            if($info){
                M()->startTrans();//开始事务处理
                $tuid=$info['id'];
                $pass=md5($_POST['pass']);//支付密码
                $userinfo=$user->where("id='$uid' AND paypass='$pass'")->find();
                if($userinfo){
                    $yourfruit=$f_mygoods->where("uid='$tuid'")->find();
                    $data['fruit']=$myfruit['fruit']-$num*(1+$transaction_fee+$trade_exchange);
                    $data['voucher']=$myfruit['voucher']+$num*$trade_exchange;
                    $datas['voucher']=$yourfruit['voucher']+$num;
                    $res1=$f_mygoods->where("uid='$uid'")->data($data)->save();//保存自己果子
                    $res2=$f_mygoods->where("uid='$tuid'")->data($datas)->save();//保存别人券
                    $arr['uid']=$uid;
                    $arr['tuid']=$tuid;
                    $arr['num']=$num*(1+$transaction_fee);//实际扣除果子
                    $arr['realnum']=$num;//实际到账券
                    $arr['time']=date('Y-m-d H:i:s');
                    $res=$trade->data($arr)->add();//增加交易记录
                    $exc['uid']=$uid;
                    $exc['num']=$num*$trade_exchange;
                    $exc['time']=date('Y-m-d H:i:s');
                    $result=$exchange->data($exc)->add();//增加兑换记录
                    if($res && $res1 && $res2 && $result){
                        tradinginfo($tuid,$num*(1+$transaction_fee));
                        beitradinginfo($tuid,$num);
                        exchangeinfo($num*$trade_exchange);
                        M()->commit();
                        $response = array(
                            'resultCode'  => 200,
                            'message' => 'success for request',
                        );
                    }else{
                        M()->rollback();
                    }
                }else{
                    $response = array(
                        'resultCode'  => 300,
                        'message' => '支付密码有误',
                    );
                }
            }else{
                $response = array(
                    'resultCode'  => 400,
                    'message' => '获赠号码有误',
                );
            }
        }else{
            $response = array(
                'resultCode'  => 500,
                'message' => '你的果子数不足',
            );
        }
		$this->ajaxReturn($response,'json');	
	}

//兑换
    public function exchange(){
    	$f_mygoods=M("f_mygoods");
    	$f_exchange=M("f_exchange");
        $uid=$_SESSION['uid'];
        $info=$f_mygoods->where($where)->field('fruit,voucher')->find();
    	$num=$_POST['num'];
        $lowest=$this->lowest();
        if($lowest){
            $trading_limits=$lowest;
        }else{
            $trading_limits=$this->trading_limits;
        }
    	if($info['fruit']-$num>=$trading_limits){
            M()->startTrans();//开始事务处理
            $where['uid']=$uid;
            $data['fruit']=$info['fruit']-$num;
            $data['voucher']=$info['voucher']+$num;
            $res=$f_mygoods->where($where)->data($data)->save();
            $arr['uid']=$_SESSION['uid'];
            $arr['num']=$num;
            $arr['time']=date('Y-m-d H:i:s');
            $result=$f_exchange->data($arr)->add();
            if($res && $result){
                M()->commit();
                exchangeinfo($num);
                $response = array(
                    'resultCode'  => 200,
                    'message' => 'success for request',
                );
                $this->ajaxReturn($response,'json');
            }else{
                M()->rollback();
            }
        }else{
            $response = array(
                'resultCode'  => 300,
                'message' => '果子不足',
            );
            $this->ajaxReturn($response,'json');
        }


	}
	
//铲除
	public function remove(){
		$f_tree=M("f_tree");
		$f_oldtree=M("f_oldtree");
		// $tid=$_POST['tid'];
		$lid=$_POST['lid'];
		$uid=$_SESSION['uid'];
        M()->startTrans();//开始事务处理
        $info=$f_tree->where("uid='$uid' AND lib='$lib'")->find();
		$res=$f_tree->where("uid='$uid' AND lid='$lid'")->delete();
        $data['oid']=$info["id"];
        $data['uid']=$info["uid"];
        $data['lid']=$info["lid"];
        $data['oldtime']=$info["time"];
        $data['time']=date("Y-m-d H:i:s");
        $result=$f_oldtree->data($data)->add();
		if($res && $result){
            rmoveinfo($lid);
            M()->commit();
			$this->ajaxReturn("已删除",'json');
		}else{
            M()->rollback();
        }
	}

public function fruitlist(){
	$user=M("user");
	$f_tree=M("f_tree");
	$f_harvest=M("f_harvest");
	$f_steal=M("f_steal");
	$classify=$_POST['classify'];
	$uid=$_SESSION['uid'];
	switch($classify){
		case "互偷模块":
            $tree_price=$this->tree_price;
            $telphone=$user->where("id='$uid'")->getField('telphone');
            $userinfo=$user->where("referee='$telphone'")->select();
            $j=0;
            foreach($userinfo as $key=>$val){
                $fid=$val['id'];//朋友id
                $tree=$f_tree->where("uid='$fid'")->select();
                $total=0;
                foreach ($tree as $k=>$v){
                    $tid=$v['id'];//朋友树id
                    $harvest=$f_harvest->where("treeid='$tid'")->order("time desc")->limit(1)->select();
                    $htime=strtotime($harvest[0]['time']);//上次收获时间
                    $steal=$f_steal->where("uid='$uid' AND tuid='$fid'")->order("time desc")->limit(1)->select();//上次被偷取记录
                    $stealtime=strtotime($steal[0]['time']);
                    $twentyfourime=strtotime(date("Y-m-d",$htime))+24*3600;//上次收获时间当天晚上24点时间戳
                    $chnegshutime=$twentyfourime+6*3600;
                    $fruit_tree_life = $this->fruit_tree;//树木生命值
                    $dietime = strtotime($v['time']) + $fruit_tree_life * 24 * 3600;//树木死亡时间
                    if ($dietime > time()) {
                        if ($chnegshutime <= time()) {
                            if($stealtime<$chnegshutime){//判断偷取是否在成熟之前
                                $total+=$tree_price*$harvest[0]['rate'];
                                $i++;
                                $times[$i]['htime']=$harvest[0]['time'];
                            }
                        }
                    }
				}
                if($total>0){
                    $a = array_search(max($times), $times);
                    $hhtime=strtotime($times[$a]['htime']);//开始生长时间
                    $httime=strtotime(date('Y-m-d',$hhtime))+24*3600;//当天晚上24点
                    $list[$j]['time']=date("Y-m-d H:i:s",$httime+6*3600);
                    $list[$j]['count']=$total;
                    $list[$j]['fid']=$fid;
                    $list[$j]['username']=$val['username'];
                    $list[$j]['vipid']=$val['vipid'];
                }
			}
		break;
		case "偷取记录":
			$list=$f_steal->where("uid='$uid'")->select();
			foreach($list as $key =>$val){
				$tuid=$val['tuid'];
				$info=$user->where("id='$tuid'")->find();
				$list[$key]['username']=$info['username'];
				$list[$key]['vipid']=$info['vipid'];
			}
		break;
		case "被偷记录":
			$list=$f_steal->where("tuid='$uid'")->select();
			foreach($list as $key =>$val){
				$uid=$val['uid'];
				$info=$user->where("id='$uid'")->find();
				$list[$key]['username']=$info['username'];
				$list[$key]['vipid']=$info['vipid'];
			}
		break;
	}
    $this->ajaxReturn($list,'json');
}

//偷取果子
	public function steal(){
		$steal=M("f_steal");
		$mygoods=M("f_mygoods");
		$uid=$_SESSION['uid'];
        $user_steal=$this->user_steal;
		$num=$_POST['num']*$user_steal;
		$data['uid']=$uid;
        $tuid=$_POST['tuid'];
		$data['tuid']=$tuid;
		$data['num']=$num;
		$data['time']=date("Y-m-d H:i:s");
        M()->startTrans();//开始事务处理
		$res=$steal->data($data)->add();
        $myinfo=$mygoods->where("uid='$uid'")->getField('fruit');
        $arr['fruit']=$myinfo+$num;
        $res1=$mygoods->where("uid='$uid'")->data($arr)->save();
        if($res && $res1){
            stealinfo($tuid,$num);
            beistealinfo($tuid,$num);
			M()->commit();
			$response=array(
				'resultCode'=>"200",
                'num'=>$num,
			);
			$this->ajaxReturn($response,'json');
		}else{
			M()->rollback();
		}
	}

	//邮箱
    public function letter(){
        $letter=M("letter");
        $user=M("user");
        $uid=$_SESSION["uid"];
        $info=$letter->where("uid=$uid")->order("time desc")->select();
        if($info){
            foreach ($info as $key=>$val){
                $classid=$val['classid'];
                switch($classid){
                    case 1 :
                        $list[$key]['content']="你已注册成功，欢迎访问商城";
                        $list[$key]['time']=$val['time'];
                        break;
                    case '2':
                        $num=$val['num'];
                        $list[$key]['content']='你在'.$num.'号地栽种成功';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '3':
                        $num=$val['num'];
                        $list[$key]['content']='你已成功收获'.$num.'个果子';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '4':
                        $num=$val['num'];
                        $list[$key]['content']='你已铲除'.$num.'号地果树';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '5':
                        $num=$val['num'];
                        $tuid=$val['tuid'];
                        $username=$user->where("id='$tuid'")->getField("username");
                        $list[$key]['content']='你与'.$username.'交易成功，扣除'.$num.'个果子';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '6':
                        $num=$val['num'];
                        $tuid=$val['tuid'];
                        $username=$user->where("id='$tuid'")->getField("username");
                        $list[$key]['content']='你与'.$username.'交易成功，到账'.$num.'个券';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '7':
                        $num=$val['num'];
                        $tuid=$val['tuid'];
                        $username=$user->where("id='$tuid'")->getField("username");
                        $list[$key]['content']='你偷取'.$username.' '.$num.'个果子';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '8':
                        $num=$val['num'];
                        $tuid=$val['tuid'];
                        $username=$user->where("id='$tuid'")->getField("username");
                        $list[$key]['content']=$username.'偷取你'.$num.'个果子';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '9':
                        $num=$val['num'];
                        $list[$key]['content']='你在修改密码成功';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '10':
                        $num=$val['num'];
                        $list[$key]['content']='你设置支付密码成功';
                        $list[$key]['time']=$val['time'];
                        break;
                    case '11':
                        $num=$val['num'];
                        $list[$key]['content']='你成功兑换'.$num.'个券';
                        $list[$key]['time']=$val['time'];
                        break;
                }
                $list[$key]['id']=$val['id'];
            }
            $response=array(
                'resultCode'=>'200',
                'data'=>$list,
            );
            $this->ajaxReturn($response,'json');
        }
    }

    public function deleteletter(){
        $pid=$_POST["pid"];
        $letter=M("letter");
        $uid=$_SESSION['uid'];
        $res=$letter->where("id='$pid' AND uid='$uid'")->delete();
        if($res){
            $response=array(
                'resultCode'=>'200',
                'data'=>'删除成功',
            );
        }else{
            $response=array(
                'resultCode'=>'300',
                'data'=>'删除失败',
            );
        }
        $this->ajaxReturn($response,'json');
    }


    public function deleteallletter(){
        $letter=M("letter");
        $uid=$_SESSION['uid'];
        $res=$letter->where("uid='$uid'")->delete();
        if($res){
            $response=array(
                'resultCode'=>'200',
                'data'=>'邮箱已清空',
            );
        }else{
            $response=array(
                'resultCode'=>'300',
                'data'=>'清空失败',
            );
        }
        $this->ajaxReturn($response,'json');
    }

	}