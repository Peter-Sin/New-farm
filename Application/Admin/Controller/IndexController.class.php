<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends AllowController {
    public function index(){
        $setting=M("setting");
        $name=$setting->where("id=1")->getField("farm_name");
        $this->assign("name",$name);
       $this->display("index");
    }
}