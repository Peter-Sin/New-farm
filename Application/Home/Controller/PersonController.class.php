<?php
namespace Home\Controller;
use Think\Controller;
class PersonController extends AllowController
{
    public function _initialize(){
        $setting=M("setting");
        $info=$setting->where("id='1'")->find();
        $this->fruit_tree=$info['fruit_tree'];//果树生命周期
        $this->tree_price=$info['tree_price'];//果树价值
        $this->land_price=$info['land_price'];//土地价值
        $this->transaction_fee=$info['transaction_fee']/100;//交易手续费百分比
        $this->trading_limits=$info['trading_limits'];//交易最低额度
        $this->user_steal=$info['user_steal']/100;//用户偷取百分比
        $this->trade_exchange=$info['trade_exchange']/100;//交易兑换百分比
    }

    public function personal()
    {
        $this->display('personal');
    }

    public function userinfo()
    {
        $user = M("user");
        $f_mygoods = M("f_mygoods");
        $id = $_SESSION["uid"];
        $info = $user->where("id='$id'")->find();
        $info['faceimg']="/Public/image/userimage/".$info['faceimg'];
        $goodsinfo = $f_mygoods->where("uid='$id'")->field("fruit,voucher,land")->find();
        $land_price=$this->land_price;
        if(empty($info['referee'])){
            $info['referee']="暂无";
        }
        $info['landprice']=$land_price;
        $info['fruitnum'] = $goodsinfo['fruit'];
        $info['vouchernum'] = $goodsinfo['voucher'];
        $this->ajaxReturn($info, 'json');
    }

    public function orachard()
    {
        $this->display('orachard');
    }

    public function fruit()
    {

    }

    public function extend(){
        $user = M("user");
        $uid = $_SESSION["uid"];
        $info = $user->where("id='$uid'")->find();
        if(!$info['referee']){
            $info['referee']="暂无";
        }
        $value = 'http://'.$_SERVER['SERVER_NAME'].'/index.php/Home/login/register?tel='.$info['telphone']; //二维码内容
        if(empty($info['recomcode'])){
            Vendor('phpqrcode.phpqrcode');
            //生成二维码图片
            $object = new \QRcode();
            $errorCorrectionLevel = 'L';//容错级别
            $matrixPointSize = 6;//生成图片大小
            $filename=time().$info['vipid'].'.jpg';
            $url='./Public/image/recomcode/'.$filename;
            $object->png($value, $url, $errorCorrectionLevel, $matrixPointSize, 2);
            $info['recomcode']=$filename;
            $data['recomcode']=$filename;
            $user->where("id='$uid'")->data($data)->save();
        }
        $signPackage=js_sdk();
        $this->assign('signPackage',$signPackage);
        $this->assign("url",$value);
        $this->assign('info',$info);
        $this->display('extend');
    }

    public function getwxcode(){
        $signPackage=js_sdk();
        $this->ajaxReturn($signPackage,'json');
    }

    public function friend()
    {
        $user = M("user");
        $uid = $_SESSION["uid"];
        $info = $user->where("id='$uid'")->find();
        if(!$info['referee']){
            $info['referee']="暂无";
        }
        $this->assign('info', $info);
        $this->display('friend');
    }

    public function friendlist()
    {
        $user = M("user");
        $abc = $_POST['abc'];
        $uid = $_SESSION["uid"];
        $info = $user->where("id='$uid'")->find();
        $telphone = $info['telphone'];
        if ($abc == 0) {
            $friendone = $user->where("referee='$telphone'")->select();
            foreach ($friendone as $key => $val) {
                $friends[$key]['username'] = $val['username'];
            }
        } elseif ($abc == 1) {
            $friendone = $user->where("referee='$telphone'")->select();
            $i = 0;
            foreach ($friendone as $key => $val) {
                $telone = $val['telphone'];
                $friendstwo = $user->where("referee='$telone'")->select();
                foreach ($friendstwo as $k => $v) {
                    $friends[$i]['username'] = $v['username'];
                    $i++;
                }
            }
        } elseif ($abc == 2) {
            $friendone = $user->where("referee='$telphone'")->select();
            $i = 0;
            foreach ($friendone as $key => $val) {
                $telone = $val['telphone'];
                $friendstwo = $user->where("referee='$telone'")->select();
                foreach ($friendstwo as $k => $v) {
                    $teltwo = $v['telphone'];
                    $friendsthree = $user->where("referee='$teltwo'")->select();
                    foreach ($friendsthree as $kk => $vv) {
                        $friends[$i]['username'] = $vv['username'];
                        $i++;
                    }
                }
            }
        }
        if ($friends) {
            $response = array(
                'resultCode' => '200',
                'friends' => $friends,
            );
            $this->ajaxReturn($response, 'json');
        }
    }

    public function rate()
    {
        $user = M("user");
        $uid = $_SESSION["uid"];
        $info = $user->where("id='$uid'")->find();
        if(!$info['referee']){
            $info['referee']="暂无";
        }
        $f_rate=M("f_rate");
        $f_land=M("f_land");
        $landcount=$f_land->where("uid='$uid'")->count();
        $todayrate=$f_rate->where("land_num='$landcount'")->getField("rate");
        $castime=date("Y-m-d",time());
        $landcount1=$f_land->where("time<='$castime' AND uid='$uid'")->count();
        $yesterdayrate=$f_rate->where("land_num='$landcount1'")->getField("rate");
        $latime=date('Y-m-d H:i:s');
        $casstime=date('Y-m-d H:i:s',strtotime($castime));
        $this->assign('latime',$latime);
        $this->assign('castime',$casstime);
        $this->assign('todayrate', $todayrate);
        $this->assign('yesterdayrate', $yesterdayrate);
        $this->assign('yesterdayrate', $yesterdayrate);
        $this->assign('info', $info);
        $this->display('rate');
    }

    public function setpass()
    {
        $this->display('setpass');
    }

    public function uploadsetpass()
    {
        $uid = $_SESSION['uid'];
        $user = M("user");
        $opass = md5($_POST["opass"]);
        $pass = $_POST["pass"];
        $qpass = $_POST["qpass"];
        if ($pass == $qpass) {
            $info = $user->where("id='$uid' AND password='$opass'")->find();
            if ($info) {
                $data['password'] = md5($pass);
                $res = $user->where("id='$uid'")->data($data)->save();
                if ($res) {
                    unset($_SESSION['uid']);
                    unset($_SESSION['is_login']);
                    $response = array(
                        'resultCode' => '200',//修改成功
                    );
                }
            } else {
                $response = array(
                    'resultCode' => '300',//旧密码输入错误
                );
            }
        } else {
            $response = array(
                'resultCode' => '400',//两次新密码输入不一致
            );
        }
        $this->ajaxReturn($response, 'json');
    }

    public function online()
    {
        $online=M("online");
        $list=$online->select();
        $this->assign("list",$list);
        $this->display('online');
    }

    public function news()
    {
        $message=M("message");
        $info=$message->where("classid=1 AND pid=0")->order("id desc")->select();
        $this->assign("info",$info);
        $this->display('news');
    }

    public function newsdetail(){
        $message=M("message");
        $user=M("user");
        $id=$_GET["id"];
        $info=$message->where("id='$id'")->find();
        $infos=$message->where("pid='$id'")->order("id desc")->select();
        foreach($infos as $key=>$val){
            $uid=$val['uid'];
            $infos[$key]['name']=$user->where("id='$uid'")->getField("username");
        }
        $this->assign("info",$info);
        $this->assign("infos",$infos);
        $this->display('newsdetails');
    }

    public function uploadmessage(){
        $cid=$_POST["cid"];
        $pid=$_POST["pid"];
        $title=$_POST["title"];
        $message=M("message");
        $data['uid']=$_SESSION["uid"];
        $data['title']=$_POST["title"];
        $data['time']=date("Y-m-d H:i:s");
        if($cid==1 && $pid==null){
            $data['pid']=0;
            $data['classid']=$cid;
        }else{
            $data['pid']=$pid;
            $data['classid']=$cid;
        }
        $res=$message->data($data)->add();
        if($res){
            $response=array(
                'resultCode'=>'200',
                'data'=>'提交成功',
            );
        }else{
            $response=array(
                'resultCode'=>'300',
                'data'=>'提交失败',
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function notice()
    {
        $notice=M("notice");
        $list=$notice->where("statu=1")->order("id desc")->select();
        $this->assign("list",$list);
        $this->display('notice');
    }

    public function noticedetail(){
        $notice=M("notice");
        $id=$_GET["id"];
        $info=$notice->where("id='$id'")->find();
        $this->assign("info",$info);
        $this->display('ggdetails');
    }

    public function fruitt()
    {
        // $f_land=M("f_land");
        // $uid=$_SESSION["uid"];
        // $landnum=$f_land->where("uid='$uid'")->count();
        $this->display('fruit');
        
        // }else{
        //     echo "<script>
        //             alert('土地数量不足，暂时无法交易');
        //             window.location.href = \"../Index/index?num=3\";
        //             </script>";
        // }
    }


    public function uppass()
    {
        $user = M("user");
        $where['id'] = $_SESSION['uid'];
        $where['password'] = md5($_POST['pass']);
        $info = $user->where($where)->find();
        if ($info) {
            $data['password'] = md5($_POST['password']);
            $res = $user->where($where)->data($data)->save();
            if ($res) {
                $this->ajaxReturn(1);//密码修改成功
                alert("密码修改成功");
            }
        } else {
            $this->ajaxReturn(0);//原密码输入有误
            alert("原密码输入有误");
        }
    }

    public function paypass()
    {
        $this->display('Paypass');
    }

    public function update()
    {
        $user = M("user");
        $where['id'] = $_SESSION['uid'];
        $where['password'] = md5($_POST['pass']);
        $info = $user->where($where)->find();
        if ($info) {
            if($info['paypass']==md5($_POST['password'])){
                $response=array(
                    'resultCode'=>'300',
                    'data'=>'新密码与旧密码一样',
                );
            }else{
                if(strlen($_POST['password'])==6){
                   $data['paypass'] = md5($_POST['password']);
                    $res = $user->where($where)->data($data)->save();
                    if ($res) {
                        $response=array(
                            'resultCode'=>'200',
                            'data'=>'密码设置成功',
                        );
                    } else {
                        $response=array(
                            'resultCode'=>'400',
                            'data'=>'密码设置失败',
                        );
                    } 
                }else{
                   $response=array(
                        'resultCode'=>'600',
                        'data'=>'支付密码为6位',
                    ); 
                }
            }
        }else{
            $response=array(
                'resultCode'=>'500',
                'data'=>'登录密码输入有误',
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function changeinfo()
    {
        $user = M("user");
        $uid = $_SESSION['uid'];
        $userinfo = $user->where("id='$uid'")->field('faceimg,username,referee,realname,sex,telphone,alipay')->find();
        if (empty($userinfo['src'])) {
            $userinfo['src'] = '__PUBLIC__/YM/fontimg/back2.png';
        }
        if ($userinfo['sex'] == 1) {
            $userinfo['sex'] = '男';
        } elseif ($userinfo['sex'] == 2) {
            $userinfo['sex'] = '女';
        }else{
            $userinfo['sex'] = '保密';
        }
        $this->assign('userinfo', $userinfo);
        $this->display('ChangInfo');
    }

    public function uploadchangeinfo(){
        $user = M("user");
        if($_FILES['Beau']['size']) {
            $upload = new \Think\Upload();
            $upload->sizeMax = 3147528;//初始化大小
            $upload->exts = array("png", "gif", "jpeg", "jpg");//初始化上传类型
            $upload->rootPath = "./Public/image/userimage/";//初始化上传路径
            $upload->autoSub = false;
            $info = $upload->upload();
            if (!$info) {
                $this->error("请选择图片", U("Person/changeinfo"));
                exit;
            } else {
                $data['faceimg'] = $info['Beau']['savename'];
            }
        }
        $uid = $_SESSION['uid'];
        $data['username'] = $_POST['username'];
        $data['realname'] = $_POST['xingming'];
        if($_POST['refereeas']=="" || !$_POST['refereeas']){
            $data['referee'] = $_POST['referee'];
        }
        $data['alipay'] = $_POST['Payphone'];
        if ($_POST['sex'] == "男") {
            $data['sex'] = 1;
        } elseif($_POST['sex'] == "女") {
            $data['sex'] = 2;
        }else{
            $data['sex'] = 3;
        }
        $res = $user->where("id='$uid'")->data($data)->save();
        if ($res) {
            echo '<script>alert("修改成功");window.location="./changeinfo";</script>';
        }else{
            echo '<script>alert("修改失败");window.location="./changeinfo";</script>';
        }
    }



    private function getUA(){
        $browser = 'd';
        $userAgent = $_SERVER['HTTP_USER_AGENT'];
        if(strripos($userAgent,'MicroMessenger') !== false){
            return $browser = 'wx';
        }elseif(strripos($userAgent,'SQ') !== false){
            return $browser = 'm';
        }elseif(isset($_GET['client']) && $_GET['client']=='mc'){
            return $browser = 'm';
        }
        $keywords = array('Android', 'iPad', 'iPhone', 'iPod', 'SAMSUNG', 'LG', 'xiaomi', 'ucweb', 'webOS', 'lenovo', 'meizu', 'huawei', 'Mobile', 'Windows Phone', 'BlackBerry', 'MIDP', 'SymbianOS', 'Nokia');
        if(preg_match("/(" . implode('|', $keywords) . ")/i", strtolower($userAgent))){ $browser = 'm'; }
        return $browser;
    }

//    public function extend(){
//        $username = session('username');
//        // 如果用户未登录，跳转到登录页面
//        if(!$username)
//        {
//            header('location:'.U('Login/login'));
//        }//判断用户是否登录
//        $member_name = $username;//用户名
//        $member=M('member');
//        $data=$member->where("h_userName =$member_name")->find();
//        $act ='http://'.$_SERVER['HTTP_HOST'].U('/Home/Login/register');
//        $url = $act.'?t='.$data['uid'];//注册页面信息链接
//
//        $data6=M('config')->where("id=1")->find();
//        $this->assign('data6', $data6);//这是什么？？？？？？？？？？？？？？
//        $browser= $this->getUA();
//        //如果微信访问则去获取微信ID
//        if($browser == 'wx') {
//            $this->redirect('User/extend_wx');
//        }
//        $this->assign('url',$url);
//        $this->assign('data',$data);
//        $this->display();
//    }


    public function extend_wx(){
        $username = session('username');
        // 如果用户未登录，跳转到登录页面
        if(!$username)
        {
            header('location:'.U('Login/login'));
        }//判断用户是否登录
        $member_name = $username;//用户名
        $member=M('member');
        $data=$member->where("h_userName =$member_name")->find();
        $act ='http://'.$_SERVER['HTTP_HOST'].U('/Home/Login/register');
        $url = $act.'?t='.$data['uid'];//注册页面信息链接
        $jssdkObj = new Jssdk('wxe94aa331e60da615','c4643b26f8ee657f9414d0d5edc1c218');
        // 'wxe94aa331e60da615','c4643b26f8ee657f9414d0d5edc1c218'
        $res = $jssdkObj->getSignPackage();
        $appID = $res['appId'];
        $timestamp = $res['timestamp'];
        $nonceStr = $res['nonceStr'];
        $signature = $res['signature'];
        $this->assign('appID',$appID);
        $this->assign('timestamp',$timestamp);
        $this->assign('nonceStr',$nonceStr);
        $this->assign('signature',$signature);
        $this->assign('url',$url);
        $this->assign('data',$data);
        $this->display();
    }
    }
