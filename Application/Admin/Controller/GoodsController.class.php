<?php
namespace Admin\Controller;
use Think\Controller;
class GoodsController extends AllowController {
	//商品列表和搜索和分页
    public function index(){
      $where=array();
      if (!empty($_GET['title'])) {
        $where['title']=array("like","%{$_GET['title']}%");   
      }
      $mod=M("goods");
      $goodsimg=M("goodsimg");
      $sou=$mod->where($where)->count();
      $pan=new \Think\Page($sou,20);
      $pan->setConfig("prev","上一页");
      $pan->setConfig("next","下一页");
      $classprice=M("classprice");
      $gclassify=M("gclassify");
      $list=$mod->where($where)->order("id desc")->limit($pan->firstRow,$pan->listRows)->select();
      foreach($list as $key=>$val){
          if($val['statu']==1){
              $list[$key]['status'] ='✓';
          }else{
              $list[$key]['status'] ='X';
          }
        $pid=$val['id'];
        $imginfo=$goodsimg->where("pid='$pid'")->find();
        $list[$key]['image']=$imginfo["name"];
        if($val['sort']==1){
                $list[$key]['sort']="果篮";
        }elseif($val['sort']==2){
                $list[$key]['sort']="穿戴";
        }elseif($val['sort']==3){
                $list[$key]['sort']="快消";
        }elseif($val['sort']==4){
                $list[$key]['sort']="电子";
        }

        $classify=$val['classify'];
        if($classify==0){
          $list[$key]['cname']="未添加默认分类";
        }else{
          $cinfo=$classprice->where("id='$classify'")->find();
          $C_one=$cinfo["c_one"];
          $C_two=$cinfo["c_two"];
          $cone=$gclassify->where("id='$C_one'")->find();
          $ctwo=$gclassify->where("id='$C_two'")->find();
          // $list[$key]['cone']=$cone['name'];
          // $list[$key]['ctwo']=$ctwo['name'];
          $conefid=$cone['fid'];
          $ctwofid=$ctwo['fid'];
          $conef=$gclassify->where("id='$conefid'")->find();
          $ctwof=$gclassify->where("id='$ctwofid'")->find();
          $conefname=$conef['name'];
          $ctwofname=$conef['name'];
          $list[$key]['cname']=$conef['name'].":".$cone['name'].";".$ctwof['name'].":".$ctwo['name'];
        }
      }
      $this->assign("list",$list);
      $this->assign("pageinfo",$pan->show());
      $this->display("index");
    }

    public function addgoods(){
      $this->display('addgoods');
    }

    public function uploadgoods(){
      $goods=M("goods");
      $data['name']=$_POST['name'];
      $data['price']=$_POST['price'];
      $data['voucher']=$_POST['voucher'];
      $data['oprice']=$_POST['oprice'];
      $data['sort']=$_POST['sort'];
      $data['contents']=$_POST['xiangqing'];
      $data['uptime']=date("Y-m-d H:i:s");
      $res=$goods->data($data)->add();
      if($res){
          $this->success("添加成功",'./index');
      }else{
          $this->success("添加失败");
      }
    }

    public function editgoods(){
      $id=$_GET['id'];
      $goods=M('goods');
      $list=$goods->where("id='$id'")->find();
      $this->assign("list",$list);
      $this->display('editgoods');
    }

    public function updategoods(){
      $goods=M("goods");
      $id=$_POST["id"];
      $data['name']=$_POST['name'];
      $data['price']=$_POST['price'];
      $data['voucher']=$_POST['voucher'];
      $data['sort']=$_POST['sort'];
      $data['oprice']=$_POST['oprice'];
      $data['contents']=$_POST["content"];
      $res=$goods->where("id='$id'")->data($data)->save();
      if($res){
        $this->success("修改成功");
      }
    }

    public function imagemanager(){
      $goodsimg=M("goodsimg");
      $goods=M("goods");
      $id=$_GET["id"];
      $info=$goods->where("id='$id'")->find();
      $image=$goodsimg->where("pid='$id'")->select();
      $this->assign("image",$image);
      $this->assign("info",$info);
      $this->display('imagemanager');
    }

    public function uploadimage(){
      $id=$_POST['id'];
      $upload=new \Think\Upload();
      //初始化
      $upload->sizeMax=3147528;//初始化大小
      $upload->exts=array("png","gif","jpeg","jpg");//初始化上传类型
      $upload->rootPath="./Public/image/goods/";//初始化上传路径
      $upload->autoSub=false;
      //执行上传
      $info=$upload->upload();
      if(!$info){
          $this->error("请选择图片",U("Goods/imagemanager?id=$id"));
          exit;
        }else{
          $goodsimg=M("goodsimg");
          $data['name']=$info['img']['savename'];
          $data['uptime']=date("Y-m-d H:i:s");
          $data['pid']=$id;
          $res=$goodsimg->data($data)->add();
          if($res){
            $this->success("添加成功");
          }
      }
    }

    public function deleteimage(){
      $goodsimg=M("goodsimg");
      $id=$_GET["id"];
      $info=$goodsimg->where("id='$id'")->find();
      $urlimg="./Public/image/goods/".$info['name'];
      @unlink($urlimg); 
      $res=$goodsimg->where("id='$id'")->delete();
      if($res){
        $this->success("删除成功");
      }

    }

    public function goodsdelete(){
      $goods=M("goods");
      $id=$_GET['id'];


    }

    public function goodsclassify(){
      $gclassify=M("gclassify");
      $goodsid=$_GET['id'];
      $cid=$_GET['cid'];
      $list=$gclassify->where("pid='$goodsid' AND fid=0")->select();
      $this->assign("list",$list);
      $this->assign("goodsid",$goodsid);
      $this->display('indexclassify');
    }


    public function addclassify(){
      $gclassify=M("gclassify");
      $goodsid=$_GET['goodsid'];
      $cid=$_GET['cid'];
     if($cid==0){
        $list['pid']=$goodsid;
        $list['fid']=$cid;
        $list['path']=0;
      }else{
        $list['pid']=$goodsid;
        $list['fid']=$cid;
        $list['path']='0,'.$cid;
      }
      $this->assign("list",$list);
      $this->display('addclassify');
    }

    public function uploadclassify(){
      $gclassify=M("gclassify");
      $data['pid']=$_POST['goodsid'];
      $data['fid']=$_POST['pid'];
      $data['path']=$_POST['path'];
      $data['name']=$_POST['name'];
      $res=$gclassify->data($data)->add();
      if($res){
        $this->success("添加成功");
      }else{
        $this->error("添加失败");
      }
    }

    public function deleteclassify(){
      $gclassify=M("gclassify");
      $id=$_GET['id'];
      $info=$gclassify->where("fid='$id'")->select();
      if($info){
        $res=$gclassify->where("fid='$id'")->delete();
      }
      $result=$gclassify->where("id='$id'")->delete();
      if($result && $res){
        $this->success("删除成功");
      }else{
        $this->error("删除失败");
      }
    }


    public function priceamount(){
      $gclassify=M("gclassify");
      $classprice=M("classprice");
      $id=$_GET['id'];
      $list=$gclassify->where("pid='$id' AND fid=0")->select();
      if(count($list)==1){
          $cone=$list[0]['id'];
          $info=$gclassify->where("pid='$id' AND fid='$cone'")->select();
          foreach($info as $key=>$val){
              $li[$key]['name']=$list[0]['name'].":".$val['name'];
              $li[$key]['cone']=$val['id'];
              $li[$key]['pid']=$id;
              $where['C_one']=$val['id'];
              $where['C_two']=0;
              $where['pid']=$id;
              $list=$classprice->where($where)->find();
              $li[$key]['price']=$list['price'];
              $li[$key]['voucher']=$list['voucher'];
              $li[$key]['num']=$list['amount'];
          }
      }else{
          foreach($list as $key=>$val){
              $cone=$val['id'];
              $info[$key]=$gclassify->where("pid='$id' AND fid='$cone'")->select();
          }
          $i=0;
          foreach ($info[0] as $key =>$val){
              $a=$val['name'];
              foreach ($info[1] as $k=>$v){
                  $li[$i]['name']=$list[0]['name'].":".$a." ".$list[1]['name'].":".$v['name'];
                  $li[$i]['cone']=$val['id'];
                  $li[$i]['ctwo']=$v['id'];
                  $li[$i]['pid']=$id;
                  $i++;
                  $where['C_one']=$val['id'];
                  $where['C_two']=$v['id'];
                  $where['pid']=$id;
                  $list=$classprice->where($where)->find();
                  $li[$i]['price']=$list['price'];
                  $li[$i]['voucher']=$list['voucher'];
                  $li[$i]['num']=$list['amount'];
              }
          }
      }
      $this->assign("li",$li);
      $this->display('priceamount');
    }


    public function editpriceamount(){
      $classprice=M("classprice");
      $list['pid']=$_GET['pid'];
      $list['C_one']=$_GET['cone'];
      $list['C_two']=$_GET['ctwo'];
      $info=$classprice->where($list)->find();
      if($info){
        $this->assign("info",$info);
        $this->display('editpriceamount');
      }else{
        $this->assign("list",$list);
        $this->display('addpriceamount');
      }
    }

    public function uploadpriceamount(){
      $upload=new \Think\Upload();
      //初始化
      $upload->sizeMax=3147528;//初始化大小
      $upload->exts=array("png","gif","jpeg","jpg");//初始化上传类型
      $upload->rootPath="./Public/image/goods/";//初始化上传路径
      $upload->autoSub=false;
      //执行上传
      $info=$upload->upload();
      if(!$info){
        $this->error("请选择图片",U("Goods/index"));
        exit;
      }else{
        $data['image']=$info['img']['savename'];
      }

      $priceamount=M("classprice");
      $data['price']=$_POST["price"];
      $pid=$_POST["pid"];
      $data['pid']=$pid;
      $data['C_one']=$_POST["cone"];
      $data['C_two']=$_POST["ctwo"];
      $data['voucher']=$_POST["voucher"];
      $data['amount']=$_POST["amount"];
      $data['statu']=1;
      $choose=$_POST["choose"];
      if($choose==0){
        $data['choose']=0;
        $res=$priceamount->data($data)->add();
      }else{
        $a['choose']=0;
        $priceamount->where("pid='$pid'")->data($a)->save();
        $data['choose']=1;
        $res=$priceamount->data($data)->add();
        $goods=M("goods");
        $b['classify']=$res;
        $goods->where("id='$pid'")->data($b)->save();
      }
      if($res){
        $this->success("添加成功");
      }
    }


    public function updatepriceamount(){
      $upload=new \Think\Upload();
      //初始化
      $upload->sizeMax=3147528;//初始化大小
      $upload->exts=array("png","gif","jpeg","jpg");//初始化上传类型
      $upload->rootPath="./Public/image/goods/";//初始化上传路径
      $upload->autoSub=false;
      //执行上传
      $info=$upload->upload();
      if(!$info){
        $this->error("请选择图片",U("Goods/index"));
        exit;
      }else{
        $data['image']=$info['img']['savename'];
      }
      $priceamount=M("classprice");
      $pid=$_POST["pid"];
      $data['price']=$_POST["price"];
      $data['voucher']=$_POST["voucher"];
      $data['amount']=$_POST["amount"];
      $data['statu']=1;
      $choose=$_POST["choose"];
      $id=$_POST["id"];
      if($choose==0){
        $data['choose']=0;
      }else{
        $a['choose']=0;
        $info=$priceamount->where("pid='$pid'")->data($a)->save();
        $data['choose']=1;
        $goods=M("goods");
        $b['classify']=$id;
        $goods->where("id='$pid'")->data($b)->save();
      }
      $res=$priceamount->where("id='$id'")->data($data)->save();
      if($res){
        $this->success("修改成功");
      }
    }
    
    public function findchildclass(){
      $gclassify=M("gclassify");
      $cid=$_GET['cid'];
      $gid=$_GET['id'];
      $info=$gclassify->where("fid='$cid' AND pid='$gid'")->select();
      $this->assign("info",$info);
      $this->display('childclass');
    }

    public function statu(){
        $id=$_POST["id"];
        $sid=$_POST["sid"];
        $goods=M("goods");
        if($sid==1){
            $data['statu']=0;
        }else{
            $data['statu']=1;
        }
        $res=$goods->where("id='$id'")->data($data)->save();
        if($res){
            $this->ajaxReturn(1);
        }else{
            $this->ajaxReturn(0);
        }
    }

  }    
   



