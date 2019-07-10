<?php
namespace Admin\Model;
use Think\Model;
// use Think\PddApi;
class IndexModel{
    private $appid = '';  #公众号的id
    private $secret = ''; # 公众号的secret
    private $mchid='';
    private $mchkey='';
    public $imgUrl;
    private $admin =array();
    /*------------------------------------ 消息推送 start --------------------------------------------------*/
    /*
     * 绑定账号消息推送
     * */
    
    public function __construct()
    { 
        $admin=M('wechat_config')->where(array('id'=>1))->find();
        $this->admin = $admin; 
        $this->appid = $admin['wx_appid'];
        $this->secret = $admin['wx_secret'];
        $this->mchid =$admin['wx_mchid'];
        $this->mchkey = $admin['wx_mchkey'];
    }
    
    public function bindingPush($user_name='',$top_openid=''){
        $admin = $this->admin;
        $this->templateList('绑定通知');
        $v['admin_id'] = $admin['id'];
            $template_id = M('wechat_template')->where(array('admin_id'=>$v['admin_id'],'isvalid'=>1,'title'=>'绑定通知'))->getField('template_id');
            if($template_id){
                $data = array(
                    "touser" =>$top_openid,
                    "template_id"=>$template_id,
                    "url"=>'http://'.$_SERVER["SERVER_NAME"].'/Pdd/Goods/index?admin_id='.$v['admin_id'],
                    "data"=> array(
                        "first" => array("value"=>"新增一名下级用户","color"=> "#173177"),
                        "keyword1" => array("value"=>$user_name,"color"=> "#173177"),
                        "keyword2" => array("value"=>"用户进入商城后方可查看该用户信息","color"=> "#173177"),
                        "remark" => array("value"=>date('Y-m-d H:i:s'),"color"=> "#173177"),
                    )
                );
                $postJson = json_encode($data);
                $access_token = $this->access_token($v['admin_id']);
                $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
                $res = http_curl($url,'post','json',$postJson);
            }
        return $res;
    }

  /*
     * 订单状态改变 发送推送
     * */
    public function orderStatusPush($type='',$user_openid='',$status='',$orderId='',$price='',$sellerName='拼多多商城',$phone=''){
        $admin = $this->admin;
        $this->templateList('订单状态更新通知');
        $admin_id = $admin['id'];
            # 正常订单状态 status = :-1 未支付; 0-已支付；1-已成团；2-确认收货；3-审核成功；4-审核失败（不可提现）；5-已经结算；
            $first = $type;
            switch($status){
                case 0:
                    $keyword4 = '待确认';
                    break;
                case 1:
                    $keyword4 = '待确认';
                    break;
                case 2:
                    $keyword4 = '审核中';
                    break;
                case 3:
                    $keyword4 = '可提现';
                    break;
                case 5:
                    $keyword4 = '可提现';
                    break;
                default:
                    $keyword4 = '';
                    break;
            }
                $template_id = M('wechat_template')->where(array('admin_id'=>$admin_id,'isvalid'=>1,'title'=>'订单状态更新通知'))->getField('template_id');
                if($template_id){
                    $access_token = $this->access_token($admin_id);
                    $re_url = 'http://' . $_SERVER["SERVER_NAME"].'/Pdd/Person/person';
                        $data = array(
                        "touser" =>$user_openid,
                        "template_id"=>$template_id,
                        "url"=>"$re_url",
                        "data"=> array(
                            "first" => array("value"=>$first,"color"=> "#173177"),
                            "keyword1" => array("value"=>$sellerName,"color"=> "#173177"),
                            "keyword2" => array("value"=>$phone,"color"=> "#173177"),
                            "keyword3" => array("value"=>$orderId,"color"=> "#173177"),
                            "keyword4" => array("value"=>$keyword4,"color"=> "#173177"),
                            "keyword5" => array("value"=>$price,"color"=> "#173177"),
                            "remark" => array("value"=>date('Y-m-d H:i:s'),"color"=> "#173177"),
                        )
                    );
                    $postJson = json_encode($data);
                    $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
                    $res = http_curl($url,'post','json',$postJson);
                    if($res)
                     {
                         echo '';
                    }
                    
                }
    }


    public function templateList($title){
        $admin=M('admin')->where(array('realm_name'=>$_SERVER['SERVER_NAME']))->find();
        $admin_id=$admin['id'];
        $id = $admin_id;
        $template_id = M('wechat_template')->where(array('admin_id'=>$admin_id,'isvalid'=>1,'title'=>$title))->getField('template_id');
        if($template_id)
        {
            
        }
        else
        {
            $access_token =$this->access_token($id);
            $url = "https://api.weixin.qq.com/cgi-bin/template/get_all_private_template?access_token=".$access_token;
            $data = http_curl($url);
            if($data['template_list']){
                $oldTemplate = M('wechat_template')->where(array('admin_id'=>$id,'isvalid'=>1))->field('id')->select();
                foreach($oldTemplate as $v){
                    M('wechat_template')->where(array('id'=>$v['id']))->setField('isvalid',isBit(0));
                }

                foreach($data['template_list'] as $v){
                    if(!empty($v['primary_industry'])&&!empty($v['deputy_industry'])){
                        $map['admin_id'] = $id;
                        $map['isvalid'] = isBit(1);
                        $map['template_id'] = $v['template_id'];
                        $map['title'] = $v['title'];
                        $map['primary_industry'] = $v['primary_industry'];
                        $map['deputy_industry'] = $v['deputy_industry'];
                        $map['content'] = $v['content'];
                        $map['example'] = $v['example'];
                        $map['createTime'] = date('Y-m-d H:i:s');
                       $ssq =  M('wechat_template')->data($map)->add();
                       
                    }
                }
            }
        }
    }//同步模板
    /*------------------------------------ 消息推送 end --------------------------------------------------*/

    /*------------------------------------ 微信支付 start --------------------------------------------------*/
    /**
     *
     * 获取jsapi支付的参数
     * @param array $UnifiedOrderResult 统一支付接口返回的数据
     * @throws WxPayException
     *
     * @return json数据，可直接填入js函数作为参数
     */
    public function GetJsApiParameters($data,$key){
        $wxPay['appId'] = $data['appid'];
        $wxPay['timeStamp'] = time();
        $wxPay['nonceStr'] = $this->getNonceStr();
        $wxPay['package'] = "prepay_id=" . $data['prepay_id'];
        $wxPay['signType'] = "MD5";
        $wxPay['paySign'] = $this->MakeSign($wxPay,$key);
        return $wxPay;
    }

    /**
     * 生成签名
     * @return 签名，本函数不覆盖sign成员变量，如要设置签名需要调用SetSign方法赋值
     */
    public function MakeSign($parameter,$key)
    {
        //签名步骤一：按字典序排序参数
        ksort($parameter);
        $string = $this->ToUrlParams($parameter);
        //签名步骤二：在string后加入KEY
        $string = $string . "&key=".$key;
        //签名步骤三：MD5加密
        $string = md5($string);
        //签名步骤四：所有字符转为大写
        $result = strtoupper($string);
        return $result;
    }

    /**
     * 格式化参数格式化成url参数
     */
    public function ToUrlParams($parameter)
    {
        $buff = "";
        foreach ($parameter as $k => $v)
        {
            if($k != "sign" && $v != "" && !is_array($v)){
                $buff .= $k . "=" . $v . "&";
            }
        }
        $buff = trim($buff, "&");
        return $buff;
    }

   /**
     * 输出xml字符
     * @throws WxPayException
     **/
    public function ToXml($data)
    {
    
        if(!is_array($data) || count($data) <= 0)
        {
            throw new WxPayException("数组数据异常！");
        }

        $xml = "<xml>";
        foreach ($data as $key=>$val)
        {
            if (is_numeric($val)){
                $xml.="<".$key.">".$val."</".$key.">";
            }else{
                $xml.="<".$key."><![CDATA[".$val."]]></".$key.">";
            }
        }
        $xml.="</xml>";
        return $xml;
    }

    /**
     *
     * 产生随机字符串，不长于32位
     * @param int $length
     * @return 产生的随机字符串
     */
    public static function getNonceStr($length = 32)
    {
        $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        $str ="";
        for ( $i = 0; $i < $length; $i++ )  {
            $str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);
        }
        return $str;
    }

    /**
     * 将xml转为array
     * @param string $xml
     * @throws WxPayException
     */
    public  function xmlArr($xml)
    {
        if(!$xml){
            return "xml数据异常！";
        }
        //将XML转为array
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $array = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $array;
    }


   /**
     * 以post方式提交xml到对应的接口url
     *
     * @param string $xml  需要post的xml数据
     * @param string $url  url
     * @param bool $useCert 是否需要证书，默认不需要
     * @param int $second   url执行超时时间，默认30s
     * @throws WxPayException
     */
    public function postXmlCurl($xml, $url, $useCert = false, $second = 30){
        $admin = $this->admin;
        // $admin_id = $admin['id'];
        $ch = curl_init();
        //设置超时
        curl_setopt($ch, CURLOPT_TIMEOUT, $second);

        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,false);//严格校验
        //设置header
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        //要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		if($useCert == true){
                       curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false);
                       curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,2);//严格校验
			//设置证书
//                       curl_setopt($ch,CURLOPT_CAINFO, getcwd().'/cert/apiclient_cert.PEM');
			//使用证书：cert 与 key 分别属于两个.pem文件
			curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
			curl_setopt($ch,CURLOPT_SSLCERT, getcwd().'/cert/apiclient_cert.pem');
			curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
			curl_setopt($ch,CURLOPT_SSLKEY, getcwd().'/cert/apiclient_key.pem');
		}
        
        
        //post提交方式
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        //运行curl
        $data = curl_exec($ch);
        //返回结果
        if($data){
            curl_close($ch);
            return $data;
        } else {
            $error = curl_errno($ch);
            curl_close($ch);
            return "curl出错，错误码:$error";
        }
    }


    /*------------------------------------ 微信支付 end --------------------------------------------------*/

    /*------------------------------------ 创建菜单 start --------------------------------------------------*/
    public function createMenu($admin_id,$postJson){
        //获取access_token
        $access_token = $this->access_token($admin_id);
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token=' . $access_token;
        $res = http_curl($url,'post','json', $postJson);
        if($res['errcode']==0&&$res['errmsg']=='ok'){
            return 0;
        }else{
            return $res['errcode'];
        }
    }
    /*------------------------------------ 消息回复 end --------------------------------------------------*/

    /*------------------------------------ 消息回复 xml 开始 --------------------------------------------------*/
    /*
     * 回复多图文
     * */
    public function reponseNews($postObj,$arr){
        //处理消息类型，并设置回复类型和内容
        $toUser = $postObj->FromUserName;
        $fromUser = $postObj->ToUserName;
        $time = time();
        $template = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <ArticleCount>".count($arr)."</ArticleCount>
                        <Articles>";
        foreach($arr as $k=>$v){
            $template .= "<item>
                        <Title><![CDATA[".$v['title']."]]></Title>
                        <Description><![CDATA[".$v['description']."]]></Description>
                        <PicUrl><![CDATA[".$v['picUrl']."]]></PicUrl>
                        <Url><![CDATA[".$v['url']."]]></Url>
                        </item>";
        }

        $template .= "</Articles>
                        </xml>";
        $info = sprintf($template, $toUser, $fromUser, $time, 'news');
        //把XML数据返回给手机端
        echo $info;
    }

    /*
     * 回复单文本
     * */
    public function reponseText($postObj,$content){
        //处理消息类型，并设置回复类型和内容
        $toUser = $postObj->FromUserName;
        $fromUser = $postObj->ToUserName;
        $time = time();
        $template = '<xml>
                                <ToUserName><![CDATA[%s]]></ToUserName>
                                <FromUserName><![CDATA[%s]]></FromUserName>
                                <CreateTime>%s</CreateTime>
                                <MsgType><![CDATA[%s]]></MsgType>
                                <Content><![CDATA[%s]]></Content>
                                </xml>';
        //回复用户消息
        $Msgtype = 'text';
        $info = sprintf($template, $toUser, $fromUser, $time, $Msgtype, $content);
        //把XML数据返回给手机端
        echo $info;
    }


    /*
     * 回复用户关注
     * */
    public function reponseSubscribe($postObj,$content){
        //处理消息类型，并设置回复类型和内容
        $toUser = $postObj->FromUserName;
        $fromUser = $postObj->ToUserName;
        $time = time();
        //回复用户消息
        $Msgtype = 'text';
        //文本发送模板
        $template = "<xml>
                            <ToUserName><![CDATA[%s]]></ToUserName>
                            <FromUserName><![CDATA[%s]]></FromUserName>
                            <CreateTime>%s</CreateTime>
                            <MsgType><![CDATA[%s]]></MsgType>
                            <Content><![CDATA[%s]]></Content>
                            <FuncFlag>0</FuncFlag>
                            </xml>";
        $info = sprintf($template, $toUser, $fromUser, $time, $Msgtype, $content);
        //把XML数据返回给手机端
        echo $info;
    }
    /*------------------------------------ 消息回复 xml 结束 --------------------------------------------------*/


    /*------------------------------------ 网页授权 获取用户信息 开始 --------------------------------------------------*/
    /*
     * 网页授权 获取code
     * */
    public function getCode($redirect_uri = '', $snsapi = 'base',$appId){
        $redirect_uri = urlencode($redirect_uri);
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={$appId}&redirect_uri={$redirect_uri}&response_type=code&scope=snsapi_{$snsapi}&state=1#wechat_redirect";
        header("Location: {$url}");
        exit ;
    }

    /*
     * 获取用户基础信息
     * */
    public function getUserInfo($admin_id,$code){
        $c = CONTROLLER_NAME;//当前控制器名称
        $a = ACTION_NAME;//当前方法名称
        $ac = $c . '-' . $a;
         if(strtolower($ac) == 'goods-index'){
           $from = '1';  
        }
        else if(strtolower($ac) == 'goods-detail'){
           $from = '2';  
        } 
        session('WechatUser',null);
        $admin=$this->admin;
        $url_info = I('goods_id');
        
        $ssq = explode('pid=', $url_info);//url传入过来
        $goods_id = trim($ssq[0]);
        $get_id = trim($ssq[1]);
        $top_id =  $get_id? $get_id :'';
        $data['appid'] =$this->appid;
        $data['appsecret'] =$this->secret;
       
        $tokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={$data['appid']}&secret={$data['appsecret']}&code=" . $code . "&grant_type=authorization_code";
        $tokenUrlArr = http_curl($tokenUrl,'get');
      
        $url = "https://api.weixin.qq.com/sns/userinfo?access_token=" . $tokenUrlArr['access_token'] . "&openid=" . $tokenUrlArr['openid'] . "&lang=zh_CN";
        $info = http_curl($url,'get');
    
        # 判断用户是否存在
        $isuser = M('user')->where(array('openid'=>$info['openid']))->find();
        if($isuser['id'] ==$top_id){
            $top_id = '';
        }
        # 如果不存在则保存在数据库
        $top_users = M('user')->where(array('id'=>$top_id))->find();
    
        $map['uname'] = $info['nickname'];
        $map['photo'] = $info['headimgurl'];
        $map['tel'] = $info['phone'];
        $map['openid'] = $info['openid'];
        if($isuser){
          
            $map['save_time'] = date('Y-m-d H:i:s',time());
            if(empty($isuser['top_id'])){
                $map['top_id'] = $top_id;
            }
            M('user')->where(array('id'=>$isuser['id']))->save($map);
        }else{
            if($top_users['id']){
                $map['top_id'] = $top_id;
            }
            $map['addtime'] = time();
            $push = M('user')->add($map);
        }
       
        // if($push) {
        //     $this->bindingPush($info['nickname'],$top_users['user_openid']);
        // }
        
        $times = time()+3600;
        session('Wechat_time',$times);
        // dump(session('Wechat_time'));
        return $info;
    }

    /*------------------------------------ 网页授权 获取用户信息 结束 --------------------------------------------------*/

    /*---------------------------------------分享基础参数 获取 开始 ------------------------------------------------*/
    /*
     * 微信JSSDK
     * */
    public function getSignPackage($admin_id){
        $admin = $this->admin;
        $admin_id = $admin['id'];
        // 获取appid
        $appid = $this->appid;
        // 获取jsapi_ticket 票据
        $jsapi_ticket = $this->getJsApiTicket($admin_id);//return $jsapi_ticket;
        if(empty($jsapi_ticket)){
            session('jsapi_ticket_expire_time',null);
            session('jsapi_ticket',null);
            session('jsapi_admin_id',null);
            cookie('ADMIN_ID',null);
            cookie('ACCESS_TOKEN',null);
            $access_token = S('access_token_'."$admin_id",null,array('prefix'=>'access_token'));
            $jsapi_ticket = $this->getJsApiTicket($admin_id); 
        }
        $timestamp = time();
        $noncestr = $this->getRandCode(); # 获取随机码
        # 获取 signature
        // 注意 URL 一定要动态获取，不能 hardcode.
        $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        // 这里参数的顺序要按照 key 值 ASCII 码升序排序
        $string = "jsapi_ticket=".$jsapi_ticket."&noncestr=".$noncestr."&timestamp=".$timestamp."&url=".$url;
        $signature = sha1($string);
        $signPackage = array("appId"=>$appid,"nonceStr"=>$noncestr,"timestamp"=>$timestamp,"signature"=>$signature,"url"=>$url,"rawString"=>$string);
        return $signPackage;
    }

    /*
     * 获取全局票据
     * */
    public function getJsApiTicket($admin_id){
        $admin = $this->admin;
        $admin_id = $admin['id'];
        $time = session('jsapi_ticket_expire_time');
        $ticket = session('jsapi_ticket');
        $jsapi_admin_id = session('jsapi_admin_id');
        if($time>time() && $ticket && $jsapi_admin_id==$admin_id){
            $jsapi_ticket = $_SESSION['jsapi_ticket'];
        }else{
            $access_token = $this->access_token($admin_id);
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=".$access_token;
            $res = http_curl($url);
            if($res['errcode']!=0){
                cookie('ADMIN_ID',null);
                $access_token = S('access_token_'."$admin_id",null,array('prefix'=>'access_token'));
                $access_token = $this->access_token($admin_id);
                $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=".$access_token;
                $res = http_curl($url);
                $jsapi_ticket = $res['ticket'];
                session('jsapi_ticket',$jsapi_ticket);
                session('jsapi_admin_id',$admin_id);
                session('jsapi_ticket_expire_time',time()+7000);
            }else{
                $jsapi_ticket = $res['ticket'];
                session('jsapi_ticket',$jsapi_ticket);
                session('jsapi_admin_id',$admin_id);
                session('jsapi_ticket_expire_time',time()+7000);
            }

        }
        return $jsapi_ticket;
    }

    /*
     * 获取随机码
     * noncestr
     * */
    public function getRandCode($length = 16){
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $str = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }

    /*---------------------------------------分享基础参数 获取 结束 ------------------------------------------------*/

    /*
     * 生成二维码
     * */
    public function qrcode($data,$admin){
        $access_token = $this->access_token($admin);
        $url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=".$access_token;
        $res = http_curl($url,'post','json',$data);
        $codeImgUrl['url'] = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=".urlencode($res['ticket']);
        $codeImgUrl['ticket'] =urlencode($res['ticket']);
        $codeImgUrl['expire_seconds'] =$res['expire_seconds'];
        return $codeImgUrl;
    }

    /*--------------------------------------- 常用方法 start ------------------------------------------------*/
    /*
    * 获取access_token
    * 有效时间2小时
    * */
    public function access_token($admin_id){
        $admin=$this->admin;
        $admin_id=$admin['id'];
        if(!empty($admin_id)){
            $data['appid'] =$this->appid;
            $data['appsecret'] =$this->secret;
            // API地址
            $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $data['appid'] . '&secret=' . $data['appsecret'];
            $access_token = S('access_token_'."$admin_id",'',array('prefix'=>'access_token'));
            if(!empty($access_token)){
                return $access_token;
            }else{
                // 访问并获取返回的数据
                $con = file_get_contents($url);
                $arr = json_decode($con, true);
                S('access_token_'."$admin_id",$arr['access_token'],array('prefix'=>'access_token','expire'=>'3600')); 
                cookie('ADMIN_ID',$admin_id,7000);
                return $arr['access_token'];
            }
        }else{
            return '';
        }
    }

    /*
     * 中文转换
     * */
    public function change($arr){
        $newArr = array();
        $newArr['type'] = $arr['type'];
        $newArr['name'] = urlencode($arr['name']);
        if($arr['key']){
            $newArr['key'] = urlencode($arr['key']);
        }
        if($arr['url']){
            $newArr['url'] = urlencode($arr['url']);
        }

        return $newArr;
    }

    /*
    * 图片上传
    * */
    public function upload($img,$path){
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     3145728 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->rootPath  = dirname(dirname(dirname(dirname(dirname(dirname(__FILE__)))))).$path;//（务必保证此目录存在）
        //$upload->savePath  =      $path; // 设置附件上传目录    // 上传单个文件
        $info   =   $upload->uploadOne($img);
        if(!$info) {// 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功 获取上传文件信息
            return $info['savepath'].$info['savename'];
        }
    }

    /*
    * 文件上传
    * */
    public function postFile($file,$num,$path){
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     3145728 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg', 'txt','p12');// 设置附件上传类型
        $upload->rootPath  = dirname(dirname(dirname(dirname(dirname(dirname(__FILE__)))))).$path;//（务必保证此目录存在）
        $upload->savePath  =      '/'.$num.'/'.time().'/'; // 设置附件上传目录    // 上传单个文件
        $upload->saveName = '';
        $upload->autoSub = false;
        $info   =   $upload->uploadOne($file);
        if(!$info) {// 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功 获取上传文件信息
            return $info['savepath'].$info['savename'];
        }
    }
    /*
     * 将微信图片拉取到本地服务器
     * */
    public function uploadWechatImg($admin_id,$serverId,$path){
        $access_token = $this->access_token($admin_id);
        $url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=".$access_token."&media_id=".$serverId;
        $foldername = date('Y-m-d');
        $path = $path;
        if (!file_exists($path.$foldername)) {
            mkdir($path.$foldername, 0777, true);
        }
        $targetName = $path.$foldername.'/'.date('YmdHis').rand(1000,9999).'.jpg';
        $ch = curl_init($url); // 初始化
        $fp = fopen($targetName, 'wb'); // 打开写入
        curl_setopt($ch, CURLOPT_FILE, $fp); // 设置输出文件的位置，值是一个资源类型
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_exec($ch);
        curl_close($ch);
        fclose($fp);
        return $targetName;
    }


    /**
     * 发送短信
     */
    public function sendSms($PhoneNumbers="17671853375",$SignName='爱小屏',$TemplateCode='SMS_139975897',$remark='新的应用待审核') {

        $params = array ();

        // *** 需用户填写部分 ***

        // fixme 必填: 请参阅    取得您的AK信息
        $accessKeyId = "LTAIJ0UgeeslRrBh";
        $accessKeySecret = "3QOhLgCtKJXLLMohr0iUBye9uhjiER";

        // fixme 必填: 短信接收号码
        $params["PhoneNumbers"] = "$PhoneNumbers";

        // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
        $params["SignName"] = "$SignName";

        // fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
        $params["TemplateCode"] = "$TemplateCode";

        // fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
        $params['TemplateParam'] = Array (
            "remark" => "$remark"
            // "code" => "12345",
            // "product" => "阿里通信"
        );

        // fixme 可选: 设置发送短信流水号
        $params['OutId'] = "12345";

        // fixme 可选: 上行短信扩展码, 扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段
        $params['SmsUpExtendCode'] = "1234567";


        // *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
        if(!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }

        // 初始化SignatureHelper实例用于设置参数，签名以及发送请求

        // 此处可能会抛出异常，注意catch
        $content = $this->request(
            $accessKeyId,
            $accessKeySecret,
            "dysmsapi.aliyuncs.com",
            array_merge($params, array(
                "RegionId" => "cn-hangzhou",
                "Action" => "SendSms",
                "Version" => "2017-05-25",
            ))
            // fixme 选填: 启用https
            // ,true
        );

        return $content;
    }

    public function request($accessKeyId, $accessKeySecret, $domain, $params, $security=false) {
        $apiParams = array_merge(array (
            "SignatureMethod" => "HMAC-SHA1",
            "SignatureNonce" => uniqid(mt_rand(0,0xffff), true),
            "SignatureVersion" => "1.0",
            "AccessKeyId" => $accessKeyId,
            "Timestamp" => gmdate("Y-m-d\TH:i:s\Z"),
            "Format" => "JSON",
        ), $params);
        ksort($apiParams);

        $sortedQueryStringTmp = "";
        foreach ($apiParams as $key => $value) {
            $sortedQueryStringTmp .= "&" . $this->encode($key) . "=" . $this->encode($value);
        }

        $stringToSign = "GET&%2F&" . $this->encode(substr($sortedQueryStringTmp, 1));

        $sign = base64_encode(hash_hmac("sha1", $stringToSign, $accessKeySecret . "&",true));

        $signature = $this->encode($sign);

        $url = ($security ? 'https' : 'http')."://{$domain}/?Signature={$signature}{$sortedQueryStringTmp}";

        try {
            $content = $this->fetchContent($url);
            return json_decode($content);
        } catch( \Exception $e) {
            return false;
        }
    }

    private function encode($str)
    {
        $res = urlencode($str);
        $res = preg_replace("/\+/", "%20", $res);
        $res = preg_replace("/\*/", "%2A", $res);
        $res = preg_replace("/%7E/", "~", $res);
        return $res;
    }

    private function fetchContent($url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "x-sdk-client" => "php/2.0.0"
        ));

        if(substr($url, 0,5) == 'https') {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        }

        $rtn = curl_exec($ch);

        if($rtn === false) {
            trigger_error("[CURL_" . curl_errno($ch) . "]: " . curl_error($ch), E_USER_ERROR);
        }
        curl_close($ch);

        return $rtn;
    }
    /*--------------------------------------- 常用方法 end ------------------------------------------------*/

    //获取接收短信的管理员
    public function get_user(){
        $url = "http://open.aixiaoping.cn/index.php/Cps/Index/get_user";
        $message = http_curl($url);
        return $message;
    }


}