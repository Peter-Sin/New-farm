<?php

namespace Admin\Controller;
use Think\Controller;

class AllowController extends Controller
{
	public function  _initialize(){
		if(!($_SESSION['admin']['is_login']==2)){
			// $this->error('无权登录',U('Login/index'));
			echo '<script>alert("无权登录");window.location="../login/index";</script>';
		}
	}
	
}