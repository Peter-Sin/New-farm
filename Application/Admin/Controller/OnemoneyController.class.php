<?php
namespace Admin\Controller;
use Think\Controller;
class OnemoneyController extends AllowController {
	//商品列表和搜索和分页
    public function index(){
      $where=array();
      if (!empty($_GET['title'])) {
        $where['title']=array("like","%{$_GET['title']}%");   
      }
      $mod=M("onemoney");
      $sou=$mod->where($where)->count();
      $pan=new \Think\Page($sou,20);
      $pan->setConfig("prev","上一页");
      $pan->setConfig("next","下一页");
      $list=$mod->where($where)->order("id desc")->limit($pan->firstRow,$pan->listRows)->select();
      foreach($list as $key=>$val){
        $list[$key]['num']=$val['amount']-$val['number'];
        if($val['statu']==1){
            $list[$key]['status']='✓';
        }else{
            $list[$key]['status']='X';
        }
      }
      $this->assign("list",$list);
      $this->assign("pageinfo",$pan->show());
      $this->display("index");
    }

    public function addgoods(){
      $this->display('addgoods');
    }

    public function uploadgoods(){
      $upload=new \Think\Upload();
      $upload->sizeMax=3147528;//初始化大小
      $upload->exts=array("png","gif","jpeg","jpg");//初始化上传类型
      $upload->rootPath="./Public/image/onemoney/";//初始化上传路径
      $upload->autoSub=false;
      $info=$upload->upload();
      if(!$info){
          $this->error("请选择图片",U("Onemoney/addgoods"));exit;
        }else{
        $goods=M("onemoney");
        $data['name']=$_POST['name'];
        $data['amount']=$_POST['amount'];
        $data['uptime']=$_POST['uptime'];
        $data['hour']=$_POST['hour'];
        $data['image']=$info['img']['savename'];
        $res=$onemoney->data($data)->add();
        if($res){
          $this->success("添加成功");
        }
      }
    }

    public function editgoods(){
      $id=$_GET['id'];
      $goods=M('onemoney');
      $list=$goods->where("id='$id'")->find();
      $this->assign("list",$list);
      $this->display('editgoods');
    }

    public function updategoods(){
      $goods=M("onemoney");
      $id=$_POST['id'];
      if(!empty($_FILES['img']['size'])){
        $upload=new \Think\Upload();
        $upload->sizeMax=3147528;//初始化大小
        $upload->exts=array("png","gif","jpeg","jpg");//初始化上传类型
        $upload->rootPath="./Public/image/onemoney/";//初始化上传路径
        $upload->autoSub=false;
        $info=$upload->upload();
        if(!$info){
            $this->error("请选择图片",U("Onemoney/editgoods"));exit;
          }else{
          $data['image']=$info['img']['savename'];
          $urlimg="./Public/image/onemoney/".$_POST['oldimg'];
          @unlink($urlimg); 
        }
      }else{
        if(!empty($_POST['name'])){
          $data['name']=$_POST['name'];
        }
        if(!empty($_POST['amount'])){
          $data['amount']=$_POST['amount'];
        }
        if(!empty($_POST['uptime'])){
          $data['uptime']=$_POST['uptime'];
        }
        if(!empty($_POST['hour'])){
          $data['hour']=$_POST['hour'];
        }
      }
      $res=$goods->where("id='$id'")->data($data)->save();
      if($res){
        $this->success("修改成功");
      }
    }

    public function goodsdelete(){
      $goods=M("onemoney");
      $id=$_GET['id'];
      $info=$goods->where("id='$id'")->find();
      $urlimg="./Public/image/goods/".$info['image'];
      @unlink($urlimg); 
      $res=$goods->where("id='$id'")->delete();
      if($res){
        $this->success("删除成功");
      }
    }

    public function lootinfo(){
      $goods=M("onemoney");
      $winer=M("winer");
      $list=$goods->
      // where("DATE_ADD(uptime, INTERVAL hour HOUR)<NOW()")->
      select();
      foreach ($list as $key=>$val){
        $uptime=strtotime($val['uptime']);
        $hour=$val['hour']*3600;
        $amount=$val['amount'];
        $number=$val['number'];
        if($uptime>time()){
          $list[$key]['iswiner']="未开始";
        }elseif($uptime<$uptime+$hour && $number<$amount){
          $list[$key]['iswiner']="正在抢购中";
        }else{
          $pid=$val["id"];
          $info=$winer->where("pid='$pid'")->find();
          if($info){
            $list[$key]['iswiner']="已选出";
          }else{
            $list[$key]['iswiner']="未选出";
          } 
        } 
      }
      $this->assign("list",$list);
      $this->display('lootinfo');
    }

    public function lootuser(){
      $lootgoods=M("lootgoods");
      $id=$_GET['id'];
      $list=$lootgoods->where("pid='$id'")->field("uid,amount")->select();
      $user=M("user");
      foreach($list as $key=>$val){
        $uid=$val['uid'];
        $info=$user->where("id='$uid'")->find();
        $list[$key]['username']=$info['username'];
      }
      $this->assign("list",$list);
      $this->display('lootuser');
    }

    public function lootwinner(){
      $id=$_GET['id'];
      $winer=M("winer");
      $onemoney=M("onemoney");
      $info=$winer->where("pid='$id'")->find();
      $list=$onemoney->where("id='$id'")->field('id,name')->find();
      if($info){
        $this->assign("list",$list);
        $this->assign("info",$info);
        $this->display('editwiner');
      }else{
        $this->assign("list",$list);
        $this->display('addwiner');
      }
    }

    public function updatewiner(){
      $winer=M("winer");
      $where['id']=$_POST['id'];
      $data['pid']=$_POST['pid'];
      $data['winer']=$_POST['winer'];
      $data['number']=$_POST['number'];
      $res=$winer->where($where)->data($data)->save();
      if($res){
        $this->success("修改成功");
      }
    }

    public function uploadwiner(){
      $winer=M("winer");
      $data['pid']=$_POST['pid'];
      $data['winer']=$_POST['winer'];
      $data['number']=$_POST['number'];
      $res=$winer->data($data)->add();
      if($res){
        $this->success("添加成功");
      }
    }

    public function statu(){
        $id=$_POST["id"];
        $sid=$_POST["sid"];
        $onemoney=M("onemoney");
        if($sid==1){
            $data['statu']=0;
        }else{
            $data['statu']=1;
        }
        $res=$onemoney->where("id='$id'")->data($data)->save();
        if($res){
            $this->ajaxReturn(1);
        }else{
            $this->ajaxReturn(0);
        }
    }
}    
   



