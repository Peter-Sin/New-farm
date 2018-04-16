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

function js_sdk(){
    require './ThinkPHP/Library/Org/Fenxiang/jssdk.class.php';
    $jssdk = new JSSDK("wx93f30672fccea4dc", "ec3a8d30338a9dd7db0cf9a56a33b9e4");
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
