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
        $info['landprice']=$goodsinfo['land']*$land_price;
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
        $value = 'http://'.$_SERVER['SERVER_NAME'].'/index.php/Home/login/register?tel='.$info['telphone']; //二维码内容
        if(empty($info['recomcode'])){
            Vendor('phpqrcode.phpqrcode');
            //生成二维码图片
            $object = new \QRcode();
            $errorCorrectionLevel = 'L';//容错级别
            $matrixPointSize = 6;//生成图片大小
            $object->png($value, 'qrcode.png', $errorCorrectionLevel, $matrixPointSize, 2);
            $logo = '';//准备好的logo图片
            $QR = 'qrcode.png';//已经生成的原始二维码图
            if ($logo !== FALSE) {
                $QR = imagecreatefromstring(file_get_contents($QR));
                $logo = imagecreatefromstring(file_get_contents($logo));
                $QR_width = imagesx($QR);//二维码图片宽度
                $QR_height = imagesy($QR);//二维码图片高度
                $logo_width = imagesx($logo);//logo图片宽度
                $logo_height = imagesy($logo);//logo图片高度
                $logo_qr_width = $QR_width / 5;
                $scale = $logo_width/$logo_qr_width;
                $logo_qr_height = $logo_height/$scale;
                $from_width = ($QR_width - $logo_qr_width) / 2;
                //重新组合图片并调整大小
                imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width,
                    $logo_qr_height, $logo_width, $logo_height);
            }
            //输出图片
            $filename=date("YmdHis").$info['vipid'].'.jpg';
            imagepng($QR, './Public/image/recomcode/'.$filename);
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
        }
        $this->ajaxReturn($response, 'json');

    }

    public function rate()
    {
        $user = M("user");
        $uid = $_SESSION["uid"];
        $info = $user->where("id='$uid'")->find();
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
        $this->display('online');
    }

    public function news()
    {
        $this->display('news');
    }

    public function notice()
    {
        $this->display('notice');
    }

    public function fruitt()
    {
        $f_land=M("f_land");
        $uid=$_SESSION["uid"];
        $landnum=$f_land->where("uid='$uid'")->count();
        if($landnum>=5) {
            $this->display('fruit');
        }else{
            echo "<script>
                    alert('土地数量不足，暂时无法交易');
                    window.location.href = \"../Index/index?num=3\";
                    </script>";
        }
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
            $data['paypass'] = md5($_POST['password']);
            $res = $user->where($where)->data($data)->save();
            if ($res) {
                $this->ajaxReturn(1);//密码设置成功
            }
        } else {
            $this->ajaxReturn(0);//密码输入有误
        }
    }

    public function changeinfo()
    {
        $user = M("user");
        $uid = $_SESSION['uid'];
        $userinfo = $user->where("id='$uid'")->field('faceimg,username,realname,sex,telphone,alipay')->find();
        if (empty($userinfo['src'])) {
            $userinfo['src'] = '__PUBLIC__/YM/fontimg/back2.png';
        }
        if ($userinfo['sex'] == 1) {
            $userinfo['sex'] = '男';
        } elseif ($userinfo['sex'] == 2) {
            $userinfo['sex'] = '女';
        }
        $this->assign('userinfo', $userinfo);
        $this->display('ChangInfo');
    }

    public function uploadchangeinfo(){
        $user = M("user");
        $uid = $_SESSION['uid'];
        $upload = new \Think\Upload();
        $upload->sizeMax = 3147528;//初始化大小
        $upload->exts = array("png", "gif", "jpeg", "jpg");//初始化上传类型
        $upload->rootPath = "./Public/image/userimage/";//初始化上传路径
        $upload->autoSub = false;
        $info = $upload->upload();
        if (!$info) {
            $this->error("请选择图片", U("Person/changeinfo"));exit;
        } else {
            $data['faceimg']=$info['Beau']['savename'];
            $data['username'] = $_POST['username'];
            $data['realname'] = $_POST['xingming'];
            $data['alipay'] = $_POST['Payphone'];
            if ($_POST['sex'] == "男") {
                $data['sex'] = 1;
            } else {
                $data['sex'] = 2;
            }
            $res = $user->where("id='$uid'")->data($data)->save();
            if ($res) {
                Header('Location:../Person/changeinfo');
            }
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

        $jssdkObj = new Jssdk('wx93f30672fccea4dc','ec3a8d30338a9dd7db0cf9a56a33b9e4');
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
