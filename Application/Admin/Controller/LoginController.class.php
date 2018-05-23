<?php
namespace Admin\Controller;
use Think\Controller;

class LoginController extends Controller{
	//登录页默认显示
    public function index(){
       $this->display("login");
    }

    //加载验证码
    public function verify(){
    	//实例化
    	$verify = new \Think\Verify();
    	//验证码样式
    	$verify->fontSize = 18;
    	$verify->length = 4;
    	$verify->useNoise = false;
    	$verify->entry();
    }

    //验证码校验 用户登录验证
    public function login(){
    	//实例化
    	$manager= M('manager');
    	//获取用户名
    	$where['username'] = $_POST['username'];
    	$where['password'] = md5($_POST['password']);
        //执行查询
        $sql=$manager->where($where)->select();
        $statu=$sql[0]['statu'];
        $id=$sql[0]['id'];
    	$username=$sql[0]['username'];
    	if($sql){
    		//将数据成功放入到session里边
    		$_SESSION['admin']['admin_name'] = $username;
    		$_SESSION['admin']['is_login'] = 2;
            $_SESSION['admin']['statu']=$statu;
            $_SESSION['admin']['uid']=$id;
            echo '<script>window.location="../Index/index";</script>';
    	}else{
            echo '<script>alert("登录失败");window.location="../Login/index";</script>';
    	}
    }

    //退出功能
    public function logout(){
    	//先删除客户端的cookie
    	// setcookie(session_name(),'',time()-1,'/');
    	//清除数组
    	// $_SESSION = array();
            // $_SESSION['admin']['admin_name'] = $username;
            // $_SESSION['admin']['is_login'] = 2;
            // $_SESSION['admin']['statu']=$statu;
            // $_SESSION['admin']['uid']=$id;// 
            unset($_SESSION['admin']);
    	//删除服务器端的session文件
    	// session_destroy();
       echo '<script>alert("退出成功");window.location="./index";</script>';
    }
}