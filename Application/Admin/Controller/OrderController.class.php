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
	    $pan=new \Think\Page($sou,15);
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
	    	if($val['step']==0){
                $list[$key]['steps']="待支付";
            }elseif($val['step']==1){
                $list[$key]['steps']="待发货";
            }elseif($val['step']==2){
                $list[$key]['steps']="待收货";
            }elseif($val['step']==3){
                $list[$key]['steps']="已收货";
            }
	    	$ginfo=$goods->where("id='$gid'")->find();
	    	$cinfo=$classprice->where("id='$cid'")->find();
	    	$uinfo=$user->where("id='$uid'")->find();
	    	$list[$key]['username']=$uinfo["username"];
//	    	$list[$key]['goodsname']=$ginfo["name"];
//	    	if($cid==0){
//                $list[$key]['cname']='暂无分类';
//            }else{
//                $C_one=$cinfo["c_one"];
//                $C_two=$cinfo["c_two"];
//                $cone=$gclassify->where("id='$C_one'")->find();
//                $ctwo=$gclassify->where("id='$C_two'")->find();
//                // $list[$key]['cone']=$cone['name'];
//                // $list[$key]['ctwo']=$ctwo['name'];
//                $conefid=$cone['fid'];
//                $ctwofid=$ctwo['fid'];
//                $conef=$gclassify->where("id='$conefid'")->find();
//                $ctwof=$gclassify->where("id='$ctwofid'")->find();
//                $conefname=$conef['name'];
//                $ctwofname=$conef['name'];
//                $list[$key]['cname']=$conef['name'].":".$cone['name'].";".$conef['name'].":".$ctwo['name'];
//            }
	    }
	    $this->assign("list",$list);
	    $this->assign("pageinfo",$pan->show());
	    $this->display("index");
    }

    public function editmoney(){
	    $data['money']=$_POST["money"];
	    $order=M("order");
        $where['ordernum']=$_POST["ordernum"];
        $result=$order->where($where)->data($data)->save();
        if($result){
            $response=array(
                'code'=>200,
                'content'=>'修改成功',
            );
        }else{
            $response=array(
                'code'=>300,
                'content'=>'修改失败',
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function editvoucher(){
        $data['voucher']=$_POST["voucher"];
        $order=M("order");
        $where['ordernum']=$_POST["ordernum"];
        $result=$order->where($where)->data($data)->save();
        if($result){
            $response=array(
                'code'=>200,
                'content'=>'修改成功',
            );
        }else{
            $response=array(
                'code'=>300,
                'content'=>'修改失败',
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function deleteorder(){
	    $order=M("order");
	    $orderinfo=M("orderinfo");
	    $ordernum=$_GET["ordernum"];
	    M()->startTrans();
	    $res=$order->where("ordernum='$ordernum'")->delete();
	    $result=$orderinfo->where("ordernum='$ordernum'")->delete();
	    if($res && $result){
	        M()->commit();
            echo '<script>alert("删除成功");window.location="./index";</script>';
        }else{
	        M()->rollback();
            echo '<script>alert("删除失败");window.location="./index";</script>';
        }
    }

    public function orderaddress()
    {
        $order = M("order");
        $address=M("address");
        $ordernum=$_GET["ordernum"];
        $addr=$order->where("ordernum='$ordernum'")->field("addrid,express_number")->find();
        $addressid=$addr['addrid'];
        $addressinfo=$address->where("id='$addressid'")->find();
        $addressinfo['ordernum']=$ordernum;
        $addressinfo['express']=$addr['express_number'];
        $this->assign("info",$addressinfo);
        $this->display('addressinfo');
    }

    public function orderclass(){
        $orderinfo = M("orderinfo");
        $goods=M("goods");
        $goodsimg=M("goodsimg");
        $classprice=M("classprice");
        $gclassify=M("gclassify");
        $ordernum=$_GET["ordernum"];
        $list=$orderinfo->where("ordernum='$ordernum'")->select();
        foreach($list as $key=>$val){
            $pid=$val['pid'];
            $cid=$val['cid'];
            $num=$val['num'];
            $list[$key]['gname']=
            $goodsinfo=$goods->where("id='$pid'")->find();
            $list[$key]['gname']=$goodsinfo['name'];
            $list[$key]['id']=$goodsinfo['id'];
            $imginfo=$goodsimg->where("pid='$pid'")->find();
            if($cid==0){
                $list[$key]['classify']="暂无分类";
                $list[$key]['image']=$imginfo['name'];
            }else{
                $classid=$classprice->where("id='$cid'")->find();
                if($classid['image']){
                    $list[$key]['image']=$classid['image'];
                }else{
                    $list[$key]['image']=$imginfo['name'];
                }
                $C_oid=$classid['c_one'];
                $C_tid=$classid['c_two'];
                $C_O=$gclassify->where("pid='$pid' AND fid=0")->select();
                if(count($C_O)==1){
                    $C_one=$gclassify->where("id='$C_oid'")->getField("name");
                    $list[$key]['classify']=$C_O[0]['name'].':'.$C_one ;
                }elseif(count($C_O)==2){
                    $C_one=$gclassify->where("id='$C_oid'")->getField("name");
                    $C_two=$gclassify->where("id='$C_tid'")->getField("name");
                    $list[$key]['classify']=$C_O[0]['name'].':'.$C_one .';'. $C_O[1]['name'].':'.$C_two;
                }
            }
            $list[$key]['num']=$num;
        }
        $this->assign("list",$list);
        $this->display('orderclass');
    }

    public function express_number(){
        $order=M("order");
        $where['ordernum']=$_POST["ordernum"];
        $data['express_number']=$_POST['express'];
        $res=$order->where($where)->data($data)->save();
        if($res){
            // echo '<script>alert("添加成功");</script>';
            // header('location:./orderaddress?ordernum='.$ordernum);
            $this->success("添加成功");
        }else{
            $this->error("添加失败");
        }
    }

    public function statu(){
        $id=$_POST["id"];
        $sid=$_POST["sid"];
        $order=M("order");
        if($sid==1){
            $data['step']=2;
        }elseif($sid==2){
            $data['step']=3;
        }
        $res=$order->where("id='$id'")->data($data)->save();
        if($res){
            $this->ajaxReturn(1);
        }else{
            $this->ajaxReturn(0);
        }
    }


}