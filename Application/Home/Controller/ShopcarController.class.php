<?php
namespace Home\Controller;
use Think\Controller;
class ShopcarController extends AllowController {
    public function index(){
        
    }

    public function addShopcar(){
        $shopcar=M("shopcar");
        $data['uid']=$_SESSION['uid'];
        $data['pid']=$_POST['pid'];
        $data['cid']=$_POST['cid'];

        $info=$shopcar->where($data)->find();
        if($info){
            $num=$_POST['num'];
            $datas['amount']=$info['amount']+$num;
            $datas['uptime']=date("Y-m-d H:i:s");
            $res=$shopcar->where($data)->data($datas)->save();
        }else{
            $data['amount']=$_POST['num'];
            $data['uptime']=date("Y-m-d H:i:s");
            $res=$shopcar->data($data)->add();
        }
        if($res){
            $response = array(
                'resultCode'  => 200, 
                'message' => 'success for request',
                'data'  => $res,
            ); 
            $this->ajaxReturn($response,'json');
        }  
    }

    public function shopcar(){
        $shopcar=M("shopcar");
        $goods=M("goods");
        $classprice=M("classprice");
        $where['uid']=$_SESSION['uid'];
        $list=$shopcar->where($where)->order("uptime desc")->select();
        foreach($list as $key=>$val){
            $id=$val['pid'];
            $cid=$val['cid'];
            $info=$goods->where("id='$id'")->field("name,price,voucher,total")->find();
            if($cid==0){
                $list[$key]['pname']=$info['name'];
                $goodsimg=M("goodsimg");
                $imginfo=$goodsimg->where("pid='$id'")->find();
                $list[$key]['image']=$imginfo['name'];
                $list[$key]['price']=$info['price'];
                $list[$key]['voucher']=$info['voucher'];
                $list[$key]['total']=$info['total'];
            }else{
                $info1=$classprice->where("id='$cid'")->field("price,image,voucher,amount")->find();
                $list[$key]['pname']=$info['name'];
                $list[$key]['image']=$info1['image'];
                $list[$key]['price']=$info1['price'];
                $list[$key]['voucher']=$info1['voucher'];
                $list[$key]['total']=$info1['amount'];
            }
        }
        if($list){
           // dump($list);
            $this->assign("list",$list);
            $this->display('shopcar');
        }else{
            echo "<script>
                alert('你暂时没有添加购物车');
                window.location.href = '../Index/index';
                </script>";
        }
    }

    public function shopcarnum(){
        $shopcar=M("shopcar");
        $where['cid']=$_POST["cid"];
        $where['pid']=$_POST["pid"];
        $where['uid']=$_SESSION["uid"];
        $data['amount']=$_POST["num"];
        $res=$shopcar->where($where)->data($data)->save();
        if($res){
            $response=array(
                'code'=>200,
                'content'=>"success",
            );
        }else{
            $response=array(
                'code'=>300,
                'content'=>"save fail",
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function deleteshopcar(){
        $shopcar=M("shopcar");
        $where['cid']=$_POST["cid"];
        $where['pid']=$_POST["pid"];
        $where['uid']=$_SESSION["uid"];
        $res=$shopcar->where($where)->delete();
        if($res){
            $response=array(
                'code'=>200,
                'content'=>"success",
            );
        }else{
            $response=array(
                'code'=>300,
                'content'=>"delete fail",
            );
        }
        $this->ajaxReturn($response,'json');
    }
}