<?php
namespace Home\Controller;
use Think\Controller;

class AllowController extends Controller
{
public function  _initialize(){
    if(!($_SESSION['is_login']==2)){
        header('../login/index');
    }
}

}