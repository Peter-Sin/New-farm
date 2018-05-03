<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {

    public function index(){
      $state=M('state');
       $res=$state->find();
       if($res['type']==2){
        header('location:'.U('State/index'));
       }
      $type=M('Categorys');
      $types=$type->select();
      $arr=array();$i=0;

      foreach ($types as $k => $v) {
        if($v['pid']==0){
      
      $arr[]= '<li class="home-category-nav-item ">
            <a class="category-nav-link" >
              <span>'.$v['catename'].'</span>
            </a>
                        <div class="category-nav-children nav-wrap-col-1" style="background:E8E8E8;opacity:0.6;width:200px">
              <div class="nav-children-wrap">
                                <ul class="nav-children-left">';
           $ss= M('Categorys')->where("pid={$v["id"]}")->select();                   
             foreach ($ss as $k => $v) {
                              
                         
             $arr[]='<li class="nav-children-item" style="border-top:1px solid #ccc">
                  <a  href="'.__MODULE__.'/commodity/index/id/'.$v['id'].'">
                      <span>'.$v['catename'].'</span>
                      </a>
                          </li>';
                              }       
                    $arr[]= '</ul>
                              </div>
            
                          </div>
                      </li>';
    


}
    }


           
    //轮播
    $img=M('image');
    $data=$img->select();
    $pro=M('products');
    //新品
    $pros=$pro->where('state=1')->select();     
    $this->assign('pros',$pros);
   
    
  
    //手机
    $proshou=$pro->where( 'cateid=17')->select(); 
    $proshou1=$pro->where( 'cateid=16')->select(); 
    $pross=array_merge($proshou,$proshou1);
    $this->assign('proshow',$pross);

    //耳机
    $proer=$pro->where( 'cateid=21')->select(); 
    $proer1=$pro->where( 'cateid=22')->select(); 
    $proer2=$pro->where( 'cateid=23')->select();
    $pross=array_merge($proer,$proer1,$proer2);
    $this->assign('proer',$pross);

    //手机套
    $probao=$pro->where( 'cateid=26')->select(); 
    $probao1=$pro->where( 'cateid=27')->select(); 
    $probao2=$pro->where( 'cateid=28')->select();
    $pross=array_merge($probao,$probao1,$probao2);
    $this->assign('probao',$pross);

    //连接
    $connect=M('connection');
    $connect1=$connect->select();
    $this->assign('connect',$connect1);
    $this->assign('data',$data); 
   
    $this->assign('arr',$arr);
    $this->display();
	}



}