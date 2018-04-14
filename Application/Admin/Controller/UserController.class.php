<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends AllowController {
	//普通用户中心
    public function userList(){
        $where=array();
        if (!empty($_GET['username'])){
           $where['username']=array("like","%{$_GET['username']}%"); 
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
        $this->error("两次输入的密码不一致",U("User/userManagerAdd"));
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
        $this->success("添加成功",U("User/userManager"));
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
        $this->success("删除成功",U("User/userManager"));
      }else{
        $this->error("删除失败");
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
        $this->success("修改成功",U("User/userinfo"));
      }else{
        $this->error("修改失败");
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
          $this->error("两次输入的密码不一致");exit;
        }else{
          $data['password']=md5($password);
          $info=$mod->where("id=$id")->save($data);
          if($info){
            $this->success("修改成功",U("User/userinfo"));exit;
          }else{
            $this->error("修改失败");
          }
        }
      }else{
        $this->error("密码输入错误");exit;
      }
    }
}