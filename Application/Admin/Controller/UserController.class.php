<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends AllowController {
	//普通用户中心
    public function userList(){
        $where=array();
        if (!empty($_GET['username'])){
           $where['telphone']=array("like","%{$_GET['username']}%"); 
        }
         //实例化
        $user = M('User');
        //统计用户个数
        $tot=$user->where($where)->count();
        //分页
        $page = new \Think\Page($tot,50);
        $page->setConfig('prev','上一页');
        $page->setConfig('next','下一页');
        $list=$user->where($where)->order("id desc")->limit($page->firstRow,$page->listRows)->select();
        foreach($list as $key=>$val){
            if($val['sex']==1){
                $list[$key]['sex']='男';
            }elseif($val['sex']==2){
                $list[$key]['sex']='女';
            }else{
              $list[$key]['sex']='保密';
            }
            if($val['statu']==1){
                $list[$key]['status']='解禁';
            }else{
                $list[$key]['status']='禁用';
            }
        }
        //配置分页
        $this->assign("tot",$tot);
        $this->assign("pageinfo",$page->show());
        $this->assign("list",$list);
        $this->display("User_list");
    }


    public function userinfo(){
        //实例化
      $user = M('manager');
      $id=$_SESSION['admin']['uid'];      
        //查询用户信息
      $list=$user->where("id=$id")->select();      
        //配置用户查询信息
      $this->assign("list",$list);
        //加载模板
      $this->display("User_info");
    }


    
   

    //网站管理员
    public function userManager(){
        //实例化
        $user = M('manager');
        //统计管理员个数
        $tot=$user->count();
        //查询管理员
        $list=$user->select();
        //配置管理员个数信息
        $this->assign("tot",$tot);
        //配置管理员查询信息
        $this->assign("list",$list);
        //加载模板
      $this->display("User_manager");
    }
//添加管理员 
  //添加管理员模板
    public function userManagerAdd(){
      $this->display("User_manager_add");
    }


    //执行添加
    public function insert(){
      //实例化对象
      $User=M('Manager');
      //判断两次密码输入是否一致
      $password=$_POST['password'];
      $repassword=$_POST['repassword'];
      if(!($password==$repassword)){
        //如果不一致，退出到添加页面
        // $this->error("两次输入的密码不一致",U("User/userManagerAdd"));
        echo '<script>alert("两次输入的密码不一致");window.location="./userManagerAdd";</script>'; 
        exit;
      }
      //动态添加管理员信息，密码自动MD5
      $rules=array(       
      array('password','md5',3,'function'), // 对password字段在新增和编辑的时候使md5函数处理    
      );
      $User->auto($rules)->create();
      if(!$User->add()){
        $this->getError();
      }else{
        echo '<script>alert("添加成功");window.location="./userManager";</script>';
        // $this->success("添加成功",U("User/userManager"));
      };     
    }
//删除管理员
    public function userManagerDel(){
        //实例化
      $mod=M("manager");
      //执行删除和判断
      $data['id']=$_GET['id'];
      $res=$mod->data($data)->delete();
      if($res){
        echo '<script>alert("删除成功");window.location="./userManager";</script>';
      }else{
        echo '<script>alert("删除失败");window.location="./userManager";</script>';
      }
    }

//编辑管理员
    public function edit(){
      //实例化
      $mod=M("manager");
      $id=$_SESSION['admin']['uid'];
      //获取需要编辑的数据
      $list=$mod->where("id=$id")->select();
      $this->assign("list",$list);
      //加载模板并且输出
      $this->display("User_manager_edit");
    }



     public function editname(){
      $mod=M("manager");
      $id=$_SESSION['admin']['uid'];
      $data['username']=$_POST['username'];
      $vo=$mod->where("id=$id")->save($data);
      if($vo){
        // $this->success("修改成功",U("User/userinfo"));
        echo '<script>alert("修改成功");window.location="./userinfo";</script>';
      }else{
        // $this->error("修改失败");
        echo '<script>alert("修改失败");</script>';
        header('location:./edit?id='.$id);
      }
    }


    public function editpassword(){
            //实例化
      $mod=M("Manager");
      $id=$_SESSION['admin']['uid'];
      //获取需要编辑的数据
      $vo=$mod->where("id=$id")->select();
      $this->assign("vo",$vo);
      $this->display("User_edit_password");
    }



//执行修改
    public function userManagerEdit(){
      //实例化
      $mod=M("manager");
      $id=$_SESSION['admin']['uid'];
      $list=$mod->where("id=$id")->find();
      $pass=md5($_POST["pword"]);
      $passwd=$list['password'];
      if($pass==$passwd){
        //接收传过来的密码并判断
        $repassword=$_POST['repassword'];  
        $password=$_POST['password'];
        if(!($password==$repassword)){
          echo '<script>alert("两次输入的密码不一致");</script>';
          // $this->error("两次输入的密码不一致");
          exit;
        }else{
          $data['password']=md5($password);
          $info=$mod->where("id=$id")->save($data);
          if($info){
            echo '<script>alert("修改成功");window.location="./userinfo";</script>';
            // $this->success("修改成功",U("User/userinfo"));exit;
          }else{
            echo '<script>alert("修改失败");</script>';
            // $this->error("修改失败");
          }
        }
      }else{
        echo '<script>alert("密码输入错误");</script>';
        // $this->error("密码输入错误");exit;
      }
    }

    public function disable(){
        $id=$_POST["id"];
        $sid=$_POST["sid"];
        $user=M("user");
        if($sid==1){
            $data['statu']=0;
        }else{
            $data['statu']=1;
        }
        $res=$user->where("id='$id'")->data($data)->save();
        if($res){
            $this->ajaxReturn(1);
        }else{
            $this->ajaxReturn(0);
        }
    }

    public function useradd(){
      $this->display("useradd");
    }

    public function updateuser(){
      $user=M("user");
      $tel=$_POST["tel"];
      $data['telphone']=$tel;
      if($_POST["user"]){
        $data['username']=$_POST["user"];
      }else{
        $data['username']=$tel;
      }

      if($_POST["sex"]==1){
          $data['sex']=1;
      }elseif($_POST["sex"]==2){
          $data['sex']=2;
      }else{
          $data['sex']=3;
      }
      $data['realname']=$_POST["realname"];
      $data['referee']=$_POST["referee"];
      $data['password']=md5($_POST["password"]);
      $data['time']=date("Y-m-d H:i:s");
      $repassword=md5($_POST["repassword"]);
      $data['paypass']='e10adc3949ba59abbe56e057f20f883e';
      $data['statu']=0;
      $data['shopcar_num']=0;
      $data['vipid']=$this->vipid();
      $data['faceimg']='defaultfaceimg.png';
      $data['registime']=date("Y-m-d H:i:s");
      $g = "/^1[34578]\d{9}$/"; 
      $n=preg_match($g,$tel);
      if(empty($tel)){
        echo '<script>alert("手机号不能为空");window.location="./useradd";</script>';
      }elseif(empty($n)){
        echo '<script>alert("手机号格式有误");window.location="./useradd";</script>';
      }elseif($tel==$_POST["referee"]){
        echo '<script>alert("推荐人不能为用户自己");window.location="./useradd";</script>';
      }else{
        $info=$user->where("telphone='$tel'")->find();
        if($info){
          echo '<script>alert("该手机号已注册");window.location="./useradd";</script>';
        }else{
          if(strlen($_POST["password"])>=8 && strlen($_POST["password"])<=12){
            if($data['password']==$repassword){
              M()->startTrans();//开始事务处理
              $res=$user->data($data)->add();
              $arr['uid']=$res;
              $arr['lownum']=0;//默认最低0果子
              $arr['content']="默认";
              $lowest=M("f_lowest");
              $res1=$lowest->data($arr)->add();
              $think['uid']=$res;
              $think['fruit']=0;
              $think['voucher']=0;
              $think['tree']=0;
              $think['land']=0;
              $think['totalmoney']=0;
              $mygoods=M("f_mygoods");
              $res2=$mygoods->data($think)->add();
              if($res && $res1 && $res2){
                M()->commit();
                echo '<script>alert("添加成功");window.location="./userlist";</script>';   
              }else{
                M()->rollback();
              }
            }else{
              echo '<script>alert("两次密码不一致");window.location="./useradd";</script>';
            }
          }else{
          echo '<script>alert("密码长度为8到12位");window.location="./useradd";</script>';
        }
      }
    }
  }

  private function vipid(){
    $mod=M("user");
    $vipid=mt_rand(100000,999999);
    $info=$mod->where("vipid='$vipid'")->find();
    if(!$info){
      return $vipid;
    }else{
      return $this->vipid();
    }
  }

  public function edituser(){
    $user=M("user");
    $uid=$_GET["id"];
    $info=$user->where("id='$uid'")->find();
    $this->assign("info",$info);
    $this->display("useredit");
  }

  public function uploaduser(){
      $user=M("user");
      $id=$_POST["id"];
      $data['username']=$_POST["user"];
      $data['referee']=$_POST["referee"];
      $data['password']=md5($_POST["password"]);
      if($_POST["sex"]=="1"){
        $data['sex']=1;
      }elseif($_POST["sex"]=="2"){
        $data['sex']=2;
      }else{
        $data['sex']=3;
      }
      $data['realname']=$_POST["realname"];
      $data['paypass']=md5($_POST["paypass"]);
      $res=$user->where("id='$id'")->data($data)->save();
      if($res){
        echo '<script>alert("修改成功");window.location="./userlist";</script>';
      }else{
        echo '<script>alert("修改失败");window.location="./userlist";</script>';
      }
  }

  public function deleteuser(){
    $user=M("user");
    $ouser=M("ouser");
    $id=$_GET["id"];
    $info=$user->where("id='$id'")->find();
    M()->startTrans();//开始事务处理
    $data["oid"]=$info["id"];
    $data["username"]=$info["username"];
    $data["telphone"]=$info["telphone"];
    $data["vipid"]=$info["vipid"];
    $data["realname"]=$info["realname"];
    $data["sex"]=$info["sex"];
    $data["alipay"]=$info["alipay"];
    $data["referee"]=$info["referee"];
    $data["registime"]=$info["registime"];
    $data["faceimg"]=$info["faceimg"];
    $data["recomcode"]=$info["recomcode"];
    $data["time"]=date("Y-m-d H:i:s");
    $result=$ouser->data($data)->add();
    $res=$user->where("id='$id'")->delete();
    if($res && $result){
      M()->commit();
      echo '<script>alert("删除成功");window.location="./userlist";</script>';
    }else{
      M()->rollback();
      echo '<script>alert("删除失败");window.location="./userlist";</script>';
    }
  }
      
}