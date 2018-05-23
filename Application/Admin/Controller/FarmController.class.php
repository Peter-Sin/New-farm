<?php
namespace Admin\Controller;
use Think\Controller;
class FarmController extends AllowController
{
    //商品列表和搜索和分页
    public function index()
    {
        $where = array();
        if (!empty($_GET['title'])) {
            $where['telphone'] = array("like", "%{$_GET['title']}%");
        }
        $mod=M("f_mygoods");
        $f_lowest=M("f_lowest");
        $souu = M()
            ->table("user u")
            -> join ("f_land l on l.uid=u.id")
            -> field("u.id,u.username,u.telphone,u.vipid,u.faceimg,l.uid,COUNT(*) count")
            -> group("u.id")
            -> where($where)
            -> select();
        $sou=sizeof($souu);
        $pan = new \Think\Page($sou, 5);
        $pan->setConfig("prev", "上一页");
        $pan->setConfig("next", "下一页");
        $list = M()
            ->table("user u")
            -> join ("f_land l on l.uid=u.id")
            -> field("u.id,u.username,u.telphone,u.vipid,u.faceimg,l.uid,COUNT(*) count")
            -> group("u.id")
            -> where($where)
            -> order("u.id desc")
            -> limit($pan->firstRow, $pan->listRows)
            -> select();
        foreach ($list as $key => $val) {
            $uid=$val['id'];
            $info=$mod->where("uid='$uid'")->find();

            
            $lowest=$f_lowest->where("uid='$uid'")->getField("lownum");
            if($lowest==''){
                $list[$key]['lowest']='NAN';
            }else{
                $list[$key]['lowest']=$lowest;
            }
            $list[$key]['fruit']=$info["fruit"];
            $list[$key]['voucher']=$info["voucher"];
            $list[$key]['tnum']=$info["tree"];
            $list[$key]['lnum']=$info["land"];
        }

        $this->assign("list", $list);
        $this->assign("pageinfo", $pan->show());
        $this->display("index");
    }

    public function deleteuser(){
        $uid=$_GET['id'];
        $user=M("user");
        $ouser=M("ouser");
        $data=$user->where("id='$uid'")->field('username,telphone,vipid,realname,sex,alipay,referee,registime,faceimg,recomcode')->find();
        $data['oid']=$uid;
        $data['time']=date('Y-m-d H:i:s');
        M()->startTrans();//开始事务处理
        $res=$ouser->data($data)->add();
        $result=$user->where("id='$uid'")->delete();
        if($res && $result){
            M()->commit();
            echo '<script>alert("删除成功");window.location="./index";</script>';
            // $this->success(删除成功);
        }else{
            M()->rollback();
            echo '<script>alert("删除失败");window.location="./index";</script>';
            // $this->success(删除失败);
        }
    }


    public function edituser(){
        $this->display('edituser');
    }

    public function setting(){
        $mod=M("setting");
        $info=$mod->where("id='1'")->find();
        $this->assign("info",$info);
        $this->display("setting");
    }

    public function uploadsetting(){
        $mod=M("setting");
        $data['farm_name']=$_POST["farm_name"];
        $data['fruit_tree']=$_POST["fruit_tree"];
        $data['land_price']=$_POST["land_price"];
        $data['tree_price']=$_POST["tree_price"];
        $data['transaction_fee']=$_POST["transaction_fee"];
        $data['trading_limits']=$_POST["trading_limits"];
        $data['user_steal']=$_POST["user_steal"];
        $data['trade_exchange']=$_POST["trade_exchange"];
        $data['uprate']=$_POST["uprate"];
        $data['upuprate']=$_POST["upuprate"];
        $res=$mod->where("id='1'")->data($data)->save();
        if($res){
            echo '<script>alert("修改成功");window.location="./setting";</script>';
            // $this->success(修改成功,'./setting');
        }else{
            echo '<script>alert("修改失败");window.location="./setting";</script>';
            // $this->error(修改失败,'./setting');
        }
    }

    public function rate(){
        $f_rate=M("f_rate");
        $info=$f_rate->select();
        $this->assign("info",$info);
        $this->display('rate');
    }

    public function landcycle(){
        $f_rate=M("f_rate");
        $info=$f_rate->select();
        $this->assign("info",$info);
        $this->display('landcycle');
    }

    public function uploadlandcycle(){
        $f_rate=M("f_rate");
        $where['land_num']=$_POST['lnum'];
        $data['cycle']=$_POST['cycle'];
        $res=$f_rate->where($where)->data($data)->save();
        if($res){
            echo '<script>alert("修改成功");window.location="./landcycle";</script>';
        }else{
            echo '<script>alert("修改失败");window.location="./landcycle";</script>';
        }
    }

    public function uploadrate(){
        $f_rate=M("f_rate");
        $where['land_num']=$_POST['lnum'];
        $data['rate']=$_POST['rate'];
        $res=$f_rate->where($where)->data($data)->save();
        if($res){
            echo '<script>alert("修改成功");window.location="./rate";</script>';
        }else{
            echo '<script>alert("修改失败");window.location="./rate";</script>';
        }
    }

    public function addfruitrecord(){
        $where = array();
        if (!empty($_GET['title'])) {
            $where['u.telphone'] = array("like", "%{$_GET['title']}%");
        }
        $mod=M("addfruit");
        $sou=M()
            ->table("user u,addfruit f")
            ->field("u.username,u.telphone as tel,f.*")
            ->where("u.telphone=f.telphone")
            ->where($where)
            ->count();
        $pan = new \Think\Page($sou, 15);
        $pan->setConfig("prev", "上一页");
        $pan->setConfig("next", "下一页");
        $list=M()
            ->table("user u,addfruit f")
            ->field("u.username,u.telphone as tel,f.*")
            ->where("u.telphone=f.telphone")
            ->where($where)
            ->limit($pan->firstRow, $pan->listRows)
            ->select();
        $this->assign("list",$list);
        $this->assign("pageinfo", $pan->show());
        $this->display("addfruitrecode");
    }

    public function addfruit()
    {
        $this->display("addfruit");
    }

    public function uploadaddfruit(){
        $addfruit=M("addfruit");
        $f_mygoods=M("f_mygoods");
        $user=M("user");
        $telphone=$_POST['telphone'];
        $userid=$user->where("telphone='$telphone'")->getField("id");
        if($userid){
            if(empty($_POST['num']) && $_POST['num']==0){
                $response=array(
                    'resultCode'  => 400,
                    'message' => '用户充值为空',
                );
            }else{
                M()->startTrans();//开始事务处理
                $data['telphone']=$telphone;
                $data['num']=$_POST['num'];
                $data['content']=$_POST['content'];
                $data['time']=date("Y-m-d H:i:s");
                $res=$addfruit->data($data)->add();
                $result=$f_mygoods->where("uid='$userid'")->setInc("fruit",$_POST['num']);
                if($res && $result){
                    M()->commit();
                    $response=array(
                        'resultCode'  => 200,
                        'message' => '用户果子充值成功',
                    );
                }else{
                    M()->rollback();
                    $response=array(
                        'resultCode'  => 300,
                        'message' => '用户果子充值失败',
                    );
                }
            }
            if($_POST['refereetel']){
                if(empty($_POST['refereenum']) && $_POST['refereenum']==0){
                    $response['resultCode1']=700;
                    $response['message1']='推荐人充值为空';
                }else{
                    M()->startTrans();//开始事务处理
                    $refereetel=$_POST['refereetel'];
                    $arr['telphone']=$refereetel;
                    $refereeid=$user->where("telphone='$refereetel'")->getField("id");
                    $arr['num']=$_POST['refereenum'];
                    $arr['content']=$telphone."充值赠送";
                    $arr['time']=date("Y-m-d H:i:s");
                    $res1=$addfruit->data($arr)->add();
                    $result1=$f_mygoods->where("uid='$refereeid'")->setInc("fruit",$_POST['refereenum']);
                    if($res1 && $result1){
                        M()->commit();
                        $response['resultCode1']=200;
                        $response['message1']='推荐人果子赠送成功';
                    }else{
                        M()->rollback();
                        $response['resultCode1']=300;
                        $response['message1']='推荐人果子赠送失败';
                    }
                }
            }else{
                $response['resultCode1']=600;
                $response['message1']='推荐人号码为空';
            }
        }else{
            $response=array(
                'resultCode'  => 500,
                'message' => '用户号码有误',
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function setlowest(){
        $uid=$_GET['id'];
        $user=M("user");
        $info=$user->where("id='$uid'")->field("username,id")->find();
        $uid=$info['id'];
        $f_lowest=M("f_lowest");
        $info['lownum']=$f_lowest->where("uid='$uid'")->getField("lownum");
        $this->assign("info",$info);
        $this->display("setlowest");
    }

    public function uploadlowest(){
        $f_lowest=M("f_lowest");
        $uid=$_POST['uid'];
        $data['lownum']=$_POST['num'];
        $data['content']=$_POST['content'];
        $info=$f_lowest->where("uid='$uid'")->find();
        if($info){
            $res=$f_lowest->where("uid='$uid'")->data($data)->save();
        }else{
            $data['uid']=$uid;
            $res=$f_lowest->data($data)->add();
        }
        if($res){
            $this->success("修改成功",'./setlowest?id='.$uid);
            // echo '<script>alert("修改成功");window.location="./rate";</script>';
            // header('location:./setlowest?id='.$uid);
        }else{
            $this->error("修改失败",'./setlowest?id='.$uid);

        }
    }

    public function addland(){
        $this->display('addland');
    }

    public function uploadaddland(){
        $tel=$_POST['tel'];
        $user=M("user");
        $f_land=M("f_land");
        $f_mygoods=M("f_mygoods");
        $userid=$user->where("telphone='$tel'")->getField('id');
        if($userid){
            $landinfo=$f_land->where("uid='$userid'")->find();
            if($landinfo){
                $response=array(
                    'resultCode'  => 300,
                    'message' => '用户土地系统已开启',
                );
            }else{
                M()->startTrans();
                $data['uid']=$userid;
                $data['time']=date("Y-m-d H:i:s");
                $res=$f_land->data($data)->add();
                $result=$f_mygoods->where("uid='$userid'")->setInc('land', 1);
                if($res && $result){
                    M()->commit();
                    $response=array(
                        'resultCode'  => 200,
                        'message' => '开启土地成功',
                    );
                }else{
                    M()->rollback();
                    $response=array(
                        'resultCode'  => 400,
                        'message' => '开启土地失败',
                    );
                }
            }
        }else{
            $response=array(
                'resultCode'  => 500,
                'message' => '用户不存在',
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function findrefereetel(){
        $user=M("user");
        $tel=$_POST["tel"];
        $userinfo=$user->where("telphone='$tel'")->find();
        if($userinfo){
            $refereetel=$user->where("telphone='$tel'")->getField("referee");
            if($refereetel){
                $response=array(
                    'resultCode'  => 200,
                    'message' => '查找成功',
                    'data'=>$refereetel,
                );
            }else{
                $response=array(
                    'resultCode'  => 300,
                    'message' => '没有推荐人',
                );
            }
        }else{
            $response=array(
                'resultCode'  => 400,
                'message' => '用户号码有误',
            );
        }
        $this->ajaxReturn($response,'json');
    }

}