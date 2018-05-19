<?php
namespace Admin\Controller;
use Think\Controller;
class NoticeController extends AllowController
{
    //商品列表和搜索和分页
    public function index()
    {
        $where = array();
        if (!empty($_GET['title'])) {
            $where['title'] = array("like", "%{$_GET['title']}%");
        }
        $mod = M("notice");
        $sou = $mod->where($where)->count();
        $pan = new \Think\Page($sou, 20);
        $pan->setConfig("prev", "上一页");
        $pan->setConfig("next", "下一页");
        $list = $mod->where($where)->order("id desc")->limit($pan->firstRow, $pan->listRows)->select();
        foreach ($list as $key => $val) {
            $list[$key]['num'] = $val['amount'] - $val['number'];
            if ($val['statu'] == 1) {
                $list[$key]['status'] = '✓';
            } else {
                $list[$key]['status'] = 'X';
            }
        }
        $this->assign("list", $list);
        $this->assign("pageinfo", $pan->show());
        $this->display("index");
    }

    public function addnotice(){
        $this->display("addnotice");
    }

    public function uploadnotice(){
        $notice=M("notice");
        $data["title"]=$_POST["title"];
        $data["content"]=$_POST["xiangqing"];
        $data["time"]=date("Y-m-d H:i:s");
        $data["statu"]=0;
        $res=$notice->data($data)->add();
        if($res){
            echo '<script>alert("添加成功");window.location="./index";</script>';
        }else{
            echo '<script>alert("添加失败");window.location="./addnotice";</script>';
        }

    }

    public function editnotice(){
        $notice=M("notice");
        $id=$_GET["id"];
        $info=$notice->where("id='$id'")->find();
        $this->assign("info",$info);
        $this->display("editnotice");
    }

    public function updatenotice(){
        $notice=M("notice");
        $id=$_POST["id"];
        $data["title"]=$_POST["title"];
        $data["content"]=$_POST["content"];
//        $data["time"]=date("Y-m-d H:i:s");
        $data["statu"]=0;
        $res=$notice->where("id='$id'")->data($data)->save();
        if($res){
            echo '<script>alert("修改成功");window.location="./index";</script>';
        }else{
            echo '<script>alert("修改失败");window.location="./index";</script>';
        }
    }

    public function noticedelete(){
        $notice=M("notice");
        $id=$_GET["id"];
        $res=$notice->where("id='$id'")->delete();
        if($res){
            echo '<script>alert("删除成功");window.location="./index";</script>';
        }else{
            echo '<script>alert("删除失败");window.location="./index";</script>';
        }
    }

    public function statu(){
        $id=$_POST["id"];
        $sid=$_POST["sid"];
        $notice=M("notice");
        if($sid==1){
            $data['statu']=0;
        }else{
            $data['statu']=1;
        }
        $res=$notice->where("id='$id'")->data($data)->save();
        if($res){
            $this->ajaxReturn(1);
        }else{
            $this->ajaxReturn(0);
        }
    }
}