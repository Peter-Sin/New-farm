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
    	//验证码校验
    	// $verify = new \Think\Verify();
    	// $fcode = $_POST['fcode'];
    	// if(!$verify->check($fcode,'')){
    	// 	$this->error('验证码输入有误',U('Login/index'));
    	// }

    	//用户登录验证
    	//实例化
    	$manager= M('manager');
    	//获取用户名
    	$where['username'] = $_POST['username'];
    	$where['text'] = md5($_POST['password']);

        //执行查询
        $sql=$manager->where($where)->select();
        $statu=$sql[0]['statu'];
        $id=$sql[0]['id'];
    	
    	if($sql){
    		//将数据成功放入到session里边
    		$_SESSION['admin']['admin_name'] = $username;
    		$_SESSION['admin']['is_login'] = 2;
            $_SESSION['admin']['statu']=$statu;
            $_SESSION['admin']['uid']=$id;

    		$this->success('登录成功',U('Index/index'));
    	}else{
            // echo $user->getLastSql();exit;
    		$this->error('登录失败',U('Login/index'));
    	}
    }

    //退出功能
    public function logout(){
    	//先删除客户端的cookie
        // dump($_SESSION);
    	setcookie(session_name(),'',time()-1,'/');
    	//清除数组
    	$_SESSION = array();
    	//删除服务器端的session文件
    	session_destroy();
        // dump($_SESSION);
    	$this->success('退出成功',U('Login/index'));
    }
}