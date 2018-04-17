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
        // $this->ajaxReturn($info,'json');
        if($info){
            $num=$_POST['num'];
            $datas['amount']=$info['amount']+$num;
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
        $list=$shopcar->where($where)->select();
        foreach($list as $key=>$val){
            $id=$val['pid'];
            $info=$goods->where("id='$id'")->field("name,price,voucher")->find();
            $cid=$val['cid'];
            if($cid==0){
                $list[$key]['pname']=$info['name'];
                $goodsimg=M("goodsimg");
                $imginfo=$goodsimg->where("pid='$id'")->find();
                $list[$key]['image']=$imginfo['name'];
                $list[$key]['price']=$info['price'];
                $list[$key]['voucher']=$info['voucher'];
            }else{
                $info1=$classprice->where("id='$cid'")->field("price,image,voucher")->find();
                $list[$key]['pname']=$info['name'];
                $list[$key]['image']=$info1['image'];
                $list[$key]['price']=$info1['price'];
                $list[$key]['voucher']=$info1['voucher'];
            }

        }
        if($list){
            $this->assign("list",$list);
            $this->display('shopcar');
        }else{
            echo "<script>
                alert('你暂时没有添加购物车');
                window.location.href = '../Index/index';
                </script>";
        }

    }
}