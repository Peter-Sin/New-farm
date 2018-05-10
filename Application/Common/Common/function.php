<?php

function tel_code($phone,$telcode){
	require './ThinkPHP/Library/Org/Com/Ucpaas.class.php';
	$options['accountsid']='3ccc20c6d78534e8c5c75fbf895325e8';
	$options['token']='499b97ad795b3de8eaf8f15d2be2f518';
	$ucpass = new \Ucpaas($options);
	$appid = "b494f497719a4823a0fe65a42d5ca087";	//应用的ID，可在开发者控制台内的短信产品下查看
	$templateid = "308830";    //可在后台短信产品→选择接入的应用→短信模板-模板ID，查看该模板ID
	$param = $telcode; //多个参数使用英文逗号隔开（如：param=“a,b,c”），如为参数则留空
	$mobile = $phone;
	$uid = "123";
	//70字内（含70字）计一条，超过70字，按67字/条计费，超过长度短信平台将会自动分割为多条发送。分割后的多条短信将按照具体占用条数计费。
	$result=$ucpass->SendSms($appid,$templateid,$param,$mobile,$uid);
    return $result;
}

function getnumcode($num){
    $arr= array(a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9);
    $str='';
    for($i=0;$i<$num;$i++){
        $key=mt_rand(0,count($arr)-1);
        $str=$str.$arr[$key];
    }
    return $str;
}

function checkmoney($cid,$pid,$num){
    $classprice=M("classprice");
    $goods=M("goods");
    if($cid==0){
        $checkinfo=$goods->where("id='$pid'")->find();
        $list['money']=$checkinfo['price']*$num;
        $list['voucher']=$checkinfo['voucher']*$num;
    }else{
        $checkinfo=$classprice->where("id='$cid' AND pid='$pid'")->find();
        $list['money']=$checkinfo['price']*$num;
        $list['voucher']=$checkinfo['voucher']*$num;
    }
    return $list;
}

function is_weixin(){
    if(strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger')!==false){
        return 1;
    }else{
        return 2;
    }
}

function js_sdk(){
    require './ThinkPHP/Library/Org/Fenxiang/jssdk.class.php';
    $jssdk = new JSSDK('wxe94aa331e60da615','c4643b26f8ee657f9414d0d5edc1c218');
    $signPackage = $jssdk->GetSignPackage();
    return $signPackage;
}


//站内信
function resigninfo($uid){
    $letter=M("letter");
    $data['uid']=$uid;
    $data['classid']=1;//注册
    $data['tuid']=0;
    $data['num']=0;
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function plantinfo($num){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=2;//栽种果树
    $data['tuid']=0;
    $data['num']=$num;//地号
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function haravestinfo($num){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=3;//收获果树
    $data['tuid']=0;
    $data['num']=$num;
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function rmoveinfo($num){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=4;//铲除果树
    $data['tuid']=0;
    $data['num']=$num;//地号
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function tradinginfo($tuid,$num){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=5;//果子交易
    $data['tuid']=$tuid;//被交易人
    $data['num']=$num;//果子数量
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function beitradinginfo($tuid,$num){
    $letter=M("letter");
    $data['uid']=$tuid;
    $data['classid']=6;//果子交易
    $data['tuid']=$_SESSION['uid'];//被交易人
    $data['num']=$num;//果子数量
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function stealinfo($tuid,$num){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=7;//偷取果子
    $data['tuid']=$tuid;//被偷人
    $data['num']=$num;//果子数量
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function beistealinfo($tuid,$num){
    $letter=M("letter");
    $data['uid']=$tuid;//被偷
    $data['classid']=8;//被偷取果子
    $data['tuid']=$_SESSION['uid'];//偷
    $data['num']=$num;//果子数量
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function editpassinfo(){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=9;//修改密码
    $data['tuid']=0;
    $data['num']=0;
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function setpaypassinfo(){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=10;//设置支付密码
    $data['tuid']=0;
    $data['num']=0;
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function exchangeinfo($num){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=11;//兑换交易券
    $data['tuid']=0;//偷
    $data['num']=$num;
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function lowerlevel($uid,$num,$n){
    $letter=M("letter");
    $data['uid']=$uid;
    $data['classid']=$n;//12下级   13 下下级
    $data['tuid']=$_SESSION['uid'];//偷
    $data['num']=$num;
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}

function addfruitnum(){
    $letter=M("letter");
    $data['uid']=$_SESSION['uid'];
    $data['classid']=14;//消费满，赠果子
    $data['tuid']=0;
    $data['num']=300;
    $data['time']=date("Y-m-d H:i:s");
    $res=$letter->data($data)->add();
    return $res;
}
