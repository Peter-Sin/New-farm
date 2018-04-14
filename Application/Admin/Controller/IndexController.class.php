<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends AllowController {
    public function index(){
       $this->display("index");
    }
}