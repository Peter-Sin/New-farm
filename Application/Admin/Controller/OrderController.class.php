<?php
namespace Admin\Controller;
use Think\Controller;
class OrderController extends AllowController {
	public function index(){
	    $where=array();
	    if (!empty($_GET['title'])) {
	        $where['ordernum']=array("like","%{$_GET['title']}%");   
	    }
	    $mod=M("order");
	    $sou=$mod->where($where)->count();
	    $pan=new \Think\Page($sou,20);
	    $pan->setConfig("prev","上一页");
	    $pan->setConfig("next","下一页");
	    $list=$mod->where($where)->order("id desc")->limit($pan->firstRow,$pan->listRows)->select();
	    $goods=M("goods");
	    $user=M("user");
	    $gclassify=M("gclassify");
	    $classprice=M("classprice");
	    foreach($list as $key=>$val){
	    	$gid=$val['pid'];
	    	$cid=$val['cid'];
	    	$uid=$val['uid'];
	    	if($val['statu']==1){
                $list[$key]['statu']="待支付";
            }elseif($val['statu']==2){
                $list[$key]['statu']="代发货";
            }elseif($val['statu']==3){
                $list[$key]['statu']="待收货";
            }
	    	$ginfo=$goods->where("id='$gid'")->find();
	    	$cinfo=$classprice->where("id='$cid'")->find();
	    	$uinfo=$user->where("id='$uid'")->find();
	    	$list[$key]['username']=$uinfo["username"];
	    	$list[$key]['goodsname']=$ginfo["name"];
	    	if($cid==0){
                $list[$key]['cname']='暂无分类';
            }else{
                $C_one=$cinfo["c_one"];
                $C_two=$cinfo["c_two"];
                $cone=$gclassify->where("id='$C_one'")->find();
                $ctwo=$gclassify->where("id='$C_two'")->find();
                // $list[$key]['cone']=$cone['name'];
                // $list[$key]['ctwo']=$ctwo['name'];
                $conefid=$cone['fid'];
                $ctwofid=$ctwo['fid'];
                $conef=$gclassify->where("id='$conefid'")->find();
                $ctwof=$gclassify->where("id='$ctwofid'")->find();
                $conefname=$conef['name'];
                $ctwofname=$conef['name'];
                $list[$key]['cname']=$conef['name'].":".$cone['name'].";".$conef['name'].":".$ctwo['name'];
            }
	    }
	    $this->assign("list",$list);
	    $this->assign("pageinfo",$pan->show());
	    $this->display("index");
    }
}