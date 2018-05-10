<?php
namespace Home\Controller;
use Think\Controller;
class GoodsController extends AllowController {
    public function index(){
    }

//商品详情
    public function goodsinfo(){
    	$goods=M("goods");
        $goodsimg=M("goodsimg");
        $where['id']=$_GET['id'];
        $where1['pid']=$_GET['id'];
        $info=$goods->where($where)->find();
        $info_img=$goodsimg->where($where1)->field('name')->select();
        foreach($info_img as $key=>$val){
            $info['imgs'][$key]=$val['name'];
        }
        if($_SESSION['uid']){
            $info['uid']=$_SESSION['uid'];
        }else{
            $info['uid']=0;
        }
    	$this->assign("info",$info);
    	$this->display('GoodsInfor');
    }


//商品分类信息弹框
    public function goodsClassifyInfo(){
        $goods=M("goods");
        $gclassify=M("gclassify");
        $classprice=M("classprice");
        $where['id']=$_POST['goodsId'];
        $info=$goods->where($where)->find();
        $goodsimg=M("goodsimg");
        $pid=$_POST['goodsId'];
        $imginfo=$goodsimg->where("pid='$pid'")->find();
        $info['image']=$imginfo['name'];
        $a['pid']=$_POST['goodsId'];
        $a['choose']=1;
        $sql=$classprice->where($a)->find();
        $info['C_one']=$sql['c_one'];
        $info['C_two']=$sql['c_two'];
        $where1['pid']=$_POST['goodsId'];
        $info1=$gclassify->where($where1)->where("fid=0")->field("id,name")->select();
        foreach($info1 as $key=>$val){
            $fid=$val["id"];
            $info2=$gclassify->where($where1)->where("fid='$fid'")->field('id,name')->select();
            $info3[$key]=$info2;
        }
        if($info1){
            $response = array(
                'resultCode'  => 200,
                'message' => 'success for request',
                'data'  => $info,
                'data1'=>$info1,
                'data2'=>$info3,
                'biao'=>$_POST['Biao'],
            );
        }else{
            $response = array(
                'resultCode'  => 300,
                'message' => '没有分类信息',
//                'data'  => $info,
//                'data1'=>$info1,
//                'data2'=>$info3,
//                'biao'=>$_POST['Biao'],
            );
        }
        $this->ajaxReturn($response,'json');
    }


    public function classone(){
        $classprice=M("classprice");
        $where['C_one']=$_POST["C_one"];
        // $data['C_two']=$_POST["C_two"];
        $where['pid']=$_POST["goodsid"];
        $list=$classprice->where($where)->where("amount!=0")->select();
        if($list){
            foreach($list as $key=>$val){
                $ctwo_id[$key]=$val['c_two'];
            }
        }
        $this->ajaxReturn($ctwo_id,'json');
    }

//商品分类价格切换
    public function classifyPrice(){
        $classprice=M("classprice");
        $num=$_POST["G_num"];
        $where['C_one']=$_POST["C_one"];
        $where['pid']=$_POST["goodsid"];
        if($_POST["C_two"]==0){
            $data['C_two']=0;
        }else{
            $data['C_two']=$_POST["C_two"];
        }
        $info=$classprice->where($where)->where($data)->find();

        $amount=$info['amount'];
        $cid=$info['id'];
        $totalprice=$num*$info['price'];
        $totalvoucher=$num*$info['voucher'];
        if($info){
            $response = array(
                'code'  => 200,
                'message' => 'success for request',
                'amount'  => $amount,
                'totalprice'  => $totalprice,
                'totalvoucher'  => $totalvoucher,
                'cid'=>$cid,
                'ctwo_id'=>$ctwo_id,
            ); 
            $this->ajaxReturn($response,'json');
        }  
    }


    //关注商品
    public function focusGoods(){
        $focus=M("focus");
        $data['uid']=$_SESSION['uid'];
        $data['pid']=$_POST['goodsId'];
        $data['uptime']=date("Y-m-d H:i:s");
        $res=$focus->data($data)->add();
        if($res){
            $response = array(
                'resultCode'  => 200, 
                'message' => 'success for request',
                'data'  => $info,
            );
        $this->ajaxReturn($response,'json');
        }
    }
}