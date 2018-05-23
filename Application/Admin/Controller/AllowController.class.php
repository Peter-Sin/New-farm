<?php

namespace Admin\Controller;
use Think\Controller;

class AllowController extends Controller
{
	public function  _initialize(){
		if(!($_SESSION['admin']['is_login']==2)){
			echo '<script>window.location="../login/index";</script>';
		}
	}
	
}