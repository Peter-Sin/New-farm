	'wxpay_config'=>array(
		'APPID' =>'wx1023c9b4490b8cca',//绑定支付的APPID（必须配置，开户邮件中可查看）
		'MCHID'=>'1234880602',//商户号（必须配置，开户邮件中可查看）
		'KEY'=>'asdasdasw45656456weqwe784543wqwe',//商户支付密钥，参考开户邮件设置（必须配置，登录商户平台自行设置）
		'APPSECRET'=>'79ae5365decbce25018d5c338c323514',//公众帐号secert（仅JSAPI支付的时候需要配置， 登录公众平台，进入开发者中心可设置），
		'SSLCERT_PATH'=> getcwd().'\\apiclient_cert.pem',//证书路径,注意应该填写绝对路径（仅退款、撤销订单时需要，可登录商户平台下载，
		'SSLKEY_PATH'=> getcwd().'\\apiclient_key.pem',
		'CURL_PROXY_HOST'=>'0.0.0.0',//这里设置代理机器，只有需要代理的时候才设置，不需要代理，请设置为0.0.0.0和0
		'CURL_PROXY_PORT'=>0,
		'REPORT_LEVENL'=>1,//上报等级，0.关闭上报; 1.仅错误出错上报; 2.全量上报
		'NOTIFY_URL'=>'http://www.hnusmarathon.com/Pay/wxnotify',//异步通知url，商户根据实际开发过程设定
	),