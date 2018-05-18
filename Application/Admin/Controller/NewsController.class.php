<?php
namespace Admin\Controller;
use Think\Controller;

class NewsController extends Controller{
	//登录页默认显示
    public function index(){
    	$where=array();
	    if (!empty($_GET['title'])) {
	        $where['title']=array("like","%{$_GET['title']}%");   
	    }
	    $where['pid']=0;
	    $where['classid']=1;
      	$mod=M("message");
      	$sou=$mod->where($where)->count();
      	$pan=new \Think\Page($sou,20);
      	$pan->setConfig("prev","上一页");
      	$pan->setConfig("next","下一页");
    	$list=$mod->where($where)->order("id desc")->limit($pan->firstRow,$pan->listRows)->select();
    	$this->assign("list",$list);
    	$this->assign("pageinfo",$pan->show());
       	$this->display("index");
    }

    public function addinfo(){
    	$this->display("addinfo");
    }

    public function uploadinfo(){
    	$message=M("message");
    	$data['title']=$_POST["name"];
    	$data['uid']=0;
    	$data['pid']=0;
    	$data['classid']=1;
    	$data['time']=date("Y-m-d H:i:s");
    	$res=$message->data($data)->add();
    	if($res){
    		echo "<script>alert('添加成功');window.location.href='./index'</script>";
    	}else{
			echo "<script>alert('添加失败');window.location.href='./index'</script>";
    	}
    }

    public function editinfo(){
    	$id=$_GET["id"];
    	$message=M("message");
    	$list=$message->where("id='$id'")->find();
    	$this->assign("list",$list);
    	$this->display("editinfo");
    }

    public function updateinfo(){
    	$id=$_POST["id"];
    	$message=M("message");
    	$data['title']=$_POST["name"];
    	$res=$message->where("id='$id'")->data($data)->save();
    	if($res){
    		echo "<script>alert('修改成功');window.location.href='./index'</script>";
    	}else{
			echo "<script>alert('修改失败');window.location.href='./index'</script>";
    	}
    }

    public function deleteinfo(){
    	$id=$_GET["id"];
    	$message=M("message");
    	$info=$message->where("pid='$id'")->find();
    	$res=$message->where("id='$id'")->delete();
    	if($info){
    		$result=$message->where("pid='$id'")->delete();
    	}
    	if($res){
    		echo "<script>alert('删除成功');window.location.href='./index'</script>";
    	}else{
			echo "<script>alert('删除失败');window.location.href='./index'</script>";
    	}

    }

    public function detailinfo(){
    	$where=array();
	    if (!empty($_GET['title'])) {
	        $where['title']=array("like","%{$_GET['title']}%");   
	    }
	    $where['pid']=$_GET["id"];
    	$where['classid']=2;
      	$mod=M("message");
      	$sou=$mod->where($where)->count();
      	$pan=new \Think\Page($sou,5);
      	$pan->setConfig("prev","上一页");
      	$pan->setConfig("next","下一页");
    	$list=$mod->where($where)->order("id desc")->limit($pan->firstRow,$pan->listRows)->select();
    	$user=M("user");
    	foreach($list as $key=>$val){
    		$uid=$val["uid"];
    		if($uid==0){
    			$list[$key]['name']="管理员";
    		}else{
    			$list[$key]['name']=$user->where("id='$uid'")->getfield('username');
    		}
    	}
    	$this->assign("list",$list);
    	$this->assign("pageinfo",$pan->show());
    	$this->display("detailinfo");
    }

    public function replyinfo(){
    	$id=$_GET["id"];
    	$message=M("message");
    	$info=$message->where("id='$id'")->find();
    	$this->assign("info",$info);
    	$this->display("replyinfo");
    }

    public function upreplyinfo(){
    	$message=M("message");
    	$data['title']=$_POST["name"];
    	$data['uid']=0;
    	$data['pid']=$_POST["id"];
    	$data['classid']=2;
    	$data['time']=date("Y-m-d H:i:s");
    	$res=$message->data($data)->add();
    	if($res){
    		echo "<script>alert('添加成功');window.location.href='./index'</script>";
    	}else{
			echo "<script>alert('添加失败');window.location.href='./index'</script>";
    	}
    }
}