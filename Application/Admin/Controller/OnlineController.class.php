<?php
namespace Admin\Controller;
use Think\Controller;
class OnlineController extends AllowController
{
    //商品列表和搜索和分页
    public function index()
    {
        $where = array();
        if (!empty($_GET['title'])) {
            $where['qq'] = array("like", "%{$_GET['title']}%");
        }
        $mod = M("online");
        $sou = $mod->where($where)->count();
        $pan = new \Think\Page($sou, 15);
        $pan->setConfig("prev", "上一页");
        $pan->setConfig("next", "下一页");
        $list=$mod->where()
            -> where($where)
            -> limit($pan->firstRow, $pan->listRows)
            -> order(id)
            -> select();
        $this->assign("list", $list);
        $this->assign("pageinfo", $pan->show());
        $this->display("index");
    }

    public function addonline(){
        $this->assign("info",$info);
        $this->display("add");
    }

    public function upload(){
        $online=M("online");
        $data['name']=$_POST['name'];
        $data['qq']=$_POST['qq'];
        $data['time']=date("Y-m-d H:i:s");
        $res=$online->data($data)->add();
        if($res){
            $this->success("添加成功",'./index');
        }else{
            $this->success("添加失败",'./index');
        }
    }

    public function updateonline(){
        $online=M("online");
        $id=$_POST['id'];
        $data['qq']=$_POST['qq'];
        $data['name']=$_POST['name'];
        $res=$online->where("id='$id'")->data($data)->save();
        if($res){
            $this->success("修改成功",'./index');
        }else{
            $this->success("修改失败",'./index');
        }
    }

    public function editonline(){
        $online=M("online");
        $id=$_GET['id'];
        $info=$online->where("id='$id'")->find();
        $this->assign("info",$info);
        $this->display("edit");
    }

    public function deleteonline(){
        $online=M("online");
        $id=$_GET['id'];
        $res=$online->where("id='$id'")->delete();
        if($res){
            $this->success("修改成功",'./index');
        }else{
            $this->success("修改失败",'./index');
        }
    }


}