<?php
namespace Home\Controller;
use Think\Controller;
class LoginController extends Controller {
		public function index(){
		    if($_SESSION['is_login']==2){
		        header('location:../Index/index');
            }else{
                $this->display('Login');
            }
    }

    public function uploadlogin(){
    	$mod=M("user");
    	$where['telphone']=$_POST['phone'];
    	$where['password']=md5($_POST['pass']);
    	$info=$mod->where($where)->find();
    	if(!empty($info)){
            $_SESSION['uid']=$info['id'];
            $_SESSION['is_login']=2;
            $response=array(
				'resultCode'=>200,
			);
    	}else{
            $response=array(
                'resultCode'=>300,
            );
        }
        $this->ajaxReturn($response,'json');
    }

    public function register(){
        if($_GET){
            $telphone=$_GET['tel'];
        }
        $this->assign("telphone",$telphone);
        $this->display('Register');
	}
	
	public function getphonecodes(){
		$phone=$_POST['tel'];
		$user=M("user");
		$userinfo=$user->where("telphone='$phone'")->find();
		if($userinfo){
            $response=array(
                'resultCode'=>300,
                'content'=>"该手机号已注册"
            );
        }else{
            $telcode=mt_rand(100000,999999);
            $result=tel_code($phone,$telcode);
            if($result['code']==000000){
                cookie('code',$telcode,'expire=300&prefix=think_');
                $response=array(
                    'resultCode'=>200,
                    'content'=>"短信发送成功"
                );
            }
        }
    $this->ajaxReturn($response,'json');
	}

    public function uploadregister(){
		$mod=M("user");
		$lowest=M("f_lowest");
		$mygoods=M("f_mygoods");
		$data['telphone']=$_POST['phone'];
		$info=$mod->where($data)->find();
    	if(empty($info)){
			$code=$_COOKIE['think_code'];
			if($code==$_POST['yanzheng']){
                M()->startTrans();//开始事务处理
				$data['username']=$_POST['phone'];
				$data['password']=md5($_POST['password']);
				$data['referee']=$_POST['Tphone'];
				$data['vipid']=$this->vipid();
                $data['paypass']='';
                $data['shopcar_num']=0;
				$data['faceimg']='defaultfaceimg.png';
				$data['registime']=date("Y-m-d H:i:s");
				$sql=$mod->data($data)->add();
				$arr['uid']=$sql;
				$arr['lownum']=0;//默认最低0果子
                $arr['content']="默认";
				$res1=$lowest->data($arr)->add();
				$think['uid']=$sql;
				$think['fruit']=0;
                $think['voucher']=0;
                $think['tree']=0;
                $think['land']=0;
                $res2=$mygoods->data($think)->add();
				if($sql && $res1 && $res2){
                    M()->commit();
                    resigninfo($sql);
					$response=array(
						'resultCode'=>200,
					);
				}else{
                    M()->rollback();
                }
			}else{
				$response=array(
					'resultCode'=>300,
				);
			}	
		}else{
			$response=array(
				'resultCode'=>400,
			);
		}
		$this->ajaxReturn($response,'json');
		
	}

	
	private function vipid(){
		$mod=M("user");
		$vipid=mt_rand(100000,999999);
		$info=$mod->where("vipid='$vipid'")->find();
		if(!$info){
			return $vipid;
		}else{
			return $this->vipid();
		}
	}

    public function getpass(){
        $this->display('getpass');
    }

    public function logout()
    {
        if ($_SESSION['is_login'] == 2) {
            $_SESSION['uid'] = null;
            $_SESSION['is_login'] = null;
        }
        if(!($_SESSION['is_login']==2)){
            $response=array(
                'resultCode'=>'200',
            );
            $this->ajaxReturn($response,'json');
        }
    }
}