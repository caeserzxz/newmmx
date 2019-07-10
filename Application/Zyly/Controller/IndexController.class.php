<?php
namespace Zyly\Controller;
use Think\Controller;

class IndexController extends Controller {
    private $appid ='';
    private $secret ='';
    private $mchid='';
    private $mchkey='';
    private $admin_id='';
    private $admin =array();
    public $display='';
    /*
     * 配置token
     * */
	 public function __construct()
    {
        parent::__construct(); 
        $admin=M('wechat_config')->where(array('id'=>1))->find();
        $admin_id=$admin['id'];
        $this->admin = $admin; 
        
        $this->appid = $admin['wx_appid'];
        $this->secret = $admin['wx_secret'];
        $this->mchid =$admin['wx_mchid'];
        $this->mchkey = $admin['wx_mchkey'];
    }
    public function index()
    {   
        // $admin_id = 1; # 商家id
        $admin=$this->admin;
        session('admin_id', $admin['id']);
        # 获取参数 signature、token、timestamp、nonce、echostr
        $signature = $_GET["signature"];
        $nonce = $_GET['nonce'];
        $token = $admin['wx_token'];
        $timestamp = $_GET['timestamp'];
        $echostr = $_GET['echostr'];
        # 形成数组，然后按字典序排序
        $array = array();
        $array = array($nonce, $timestamp, $token);
        sort($array);
        # 拼接成字符串,sha1加密 ,然后与signature进行校验
        $str = sha1(implode($array));
        if ($str == $signature&&$echostr) {
            echo $echostr;
            exit;
        }else{
            $this->reponseMsg();
        }
    }

    /*
     * 接收事件推送并回复
     * */
    public function reponseMsg()
    {
        $admin=$this->admin;
        $admin_id=$admin['id'];
        //接收用户端（客户）发送过来的XML数据
        $postArr = $GLOBALS["HTTP_RAW_POST_DATA"];
                           
        //处理消息类型，并设置回复类型和内容
        $postObj = simplexml_load_string($postArr);

        $event = strtolower($postObj->Event);
        $type = strtolower($postObj->MsgType);
        $cont = $postObj->Content;


        // $admin_id = 1; # 商家id
        // $admin_id=$_GET['admin_id'];
        $data['appid'] = $this->appid;
        $data['name'] = $admin['name'];
                            // $strs=implode('--', $admin);
                            // $file = 'ssq2_log.txt';
                            // $content =  'sssdd'.$strs. "\n";
                            // file_put_contents($file, $content, FILE_APPEND);
        //判断该数据包是否是订阅的事件推送
        if($type=='event'){
            //如果是关注 subscribe 事件
            if($event=='subscribe'){
                $content =$admin['subscribe_str']; 

                $EventKey =$postObj->EventKey;
                $show=str_replace("qrscene_","",$EventKey);
                $openid =$postObj->FromUserName;
                    
                $isuser = M('user')->where(array('openid'=>"$openid"))->find();
                $id = $isuser['id'];

                
                if($isuser&&empty($isuser['top_id'])){
                    if($show){
                         M('user')->where(array('id'=>$id))->save(array('openid'=>"$openid",'top_id'=>"$show",'addtime'=>time()));
                    }else{
                         M('user')->where(array('id'=>$id))->save(array('openid'=>"$openid",'top_id'=>'9999999999','addtime'=>time()));
                    }
                }else{
                    if($show){
                        M('user')->add(array('openid'=>"$openid",'top_id'=>"$show",'addtime'=>time()));
                    }else{
                        M('user')->add(array('openid'=>"$openid",'top_id'=>'9999999999','addtime'=>time()));
                    }
                }

                //实例化模型
                $indexModel = Model('Index')->reponseSubscribe($postObj,$content);
                $res = $this->recordUser($admin_id,$postObj->FromUserName,$data['appid']);
            }
            if($event=='scan'){
                $content =$postObj->EventKey;
                $show=str_replace("qrscene_","",$content);
                $openid =$postObj->FromUserName;
                
                // onxczwQ5E9v3roDmJnifD-SNigqg
                $isuser = M('user')->where(array('user_openid'=>"$openid"))->find();
                $id = $isuser['id'];
		        $top_users = M('user')->where(array('id'=>"$show"))->find();		
                
                if($isuser['id'] && empty($isuser['top_id'])){
                    if($isuser['id']!=$show){
                        M('user')->where(array('id'=>$isuser['id']))->save(array('openid'=>"$openid",'top_id'=>"$show")); 
                    }
                }else if(!$isuser['id']&&$top_users){
                    M('user')->add(array('openid'=>"$openid",'top_id'=>"$show")); 
                }
            
                //实例化模型
				$indexModel = Model('Index')->reponseSubscribe($postObj,"欢迎回来!");
                $res = $this->recordUser($admin_id,$postObj->FromUserName,$data['appid']);
            }

            //事件推送
            if($event=='click'){
                // $content = M('weixin_menu')->where(array('isvalid'=>1,'admin_id'=>$admin_id,'key'=>strtolower($postObj->EventKey)))->getField('content');
                // if($content){
                //     //实例化模型
                //     $indexModel = Model('Index')->reponseText($postObj,$content);
                // }
                $content = M('weixin_menu')->where(array('isvalid'=>1,'admin_id'=>$admin_id,'key'=>strtolower($postObj->EventKey)))->find();
                if($content['cate']==1){
                    if($content){
                        //实例化模型
                        $indexModel = Model('Index')->reponseText($postObj,$content['content']);
                    }
                }else{
                    $arr = array(
                        array(
                            'title' => $content['image_title'],
                            'description' => $content['content'],
                            'picUrl'    => $content['img_url'],
                            'url'    => $content['url']),
        
                    );
                    //实例化模型
                        $indexModel = Model('Index')->reponseNews($postObj,$arr);
                }
            }
            // oIeWk1ITyt8ENUkyS8cS0u-M7HFM //返回的
            // oIeWk1ITyt8ENUkyS8cS0u-M7HFM //数据库的
            // <xml>
            //     <ToUserName><![CDATA[gh_b40c86dfecc2]]></ToUserName>
            //     <FromUserName><![CDATA[oIeWk1ITyt8ENUkyS8cS0u-M7HFM]]></FromUserName>
            //     <CreateTime>1535711834</CreateTime>
            //     <MsgType><![CDATA[event]]></MsgType>
            //     <Event><![CDATA[LOCATION]]></Event>
            //     <Latitude>23.180908</Latitude>
            //     <Longitude>113.414116</Longitude>
            //     <Precision>65.000000</Precision>
            // </xml>
            // <xml><ToUserName><![CDATA[gh_b40c86dfecc2]]></ToUserName>
            // <FromUserName><![CDATA[oIeWk1NFA55XEpZQVFK6Scs1Fpo0]]></FromUserName>
            // <CreateTime>1535713144</CreateTime>
            // <MsgType><![CDATA[event]]></MsgType>
            // <Event><![CDATA[LOCATION]]></Event>
            // <Latitude>30.622957</Latitude>
            // <Longitude>114.241753</Longitude>
            // <Precision>65.000000</Precision>
            // </xml>
            // <xml><ToUserName><![CDATA[gh_b40c86dfecc2]]></ToUserName>
            // <FromUserName><![CDATA[oIeWk1I9-1ydFbVLEjHsIhc1GFFw]]></FromUserName>
            // <CreateTime>1535765695</CreateTime>
            // <MsgType><![CDATA[event]]></MsgType>
            // <Event><![CDATA[LOCATION]]></Event>
            // <Latitude>31.017504</Latitude>
            // <Longitude>113.753517</Longitude>
            // <Precision>290.000000</Precision>
            // </xml>

            //https://apis.map.qq.com/ws/geocoder/v1/?location=31.017504,113.753517&key=G6ABZ-27RKW-RMBRP-OUFRT-CX2Z3-SVBKQ
            //获取地理位置
            if($event=='location'){ 
                // $EventKey =$postObj->EventKey;
                $openid =$postObj->FromUserName;
                $latitude = $postObj->Latitude;//纬度
                $longitude = $postObj->Logintude;//经度
                $key = "G6ABZ-27RKW-RMBRP-OUFRT-CX2Z3-SVBKQ";
                $url = "https://apis.map.qq.com/ws/geocoder/v1/?location=".$latitude.','.$longitude.'&key='.$key;
                $data  = http_curl($url);
                $save['province'] =  $data['result']['ad_info']['province'];//省
                $save['city'] = $data['result']['ad_info']['city'];//市
                $save['district'] = $data['result']['ad_info']['district'];//区

                M('user')->where(array('user_openid'=>$openid))->save($save);
            }
        }

        //判断该数据包是否是图文信息 当微信用户发送zhang 关键字的时候 回复一个单图文
        if($type=='text' && trim($cont)=='zhang'){
            $arr = array(
                array(
                    'title' => 'zhang',
                    'description' => 'Pdd',
                    'picUrl'    => 'http://www.aixiaoping.com:8080/aixiaopingRes/cashshop_type/1/nomal/2285550502072725819.png',
                    'url'    => 'http://seller.aixiaoping.com/Zyly/Index/storeIndex'),

            );
            //实例化模型
            $indexModel = Model('Index')->reponseNews($postObj,$arr);
        }else{
            //判断该数据包是否是文本消息
            // if($type=='text'){
            //     switch(trim($cont)){
            //         case 1:
            //             $content = '<a href="https://www.baidu.com">zhang</a>';
            //             break;
            //         case 2:
            //             $content = '广州';
            //             break;
            //         case 3:
            //             $content = '爱小屏';
            //             break;
            //         default:
            //             $content = '没有找到相关信息';
            //             break;
            //     }
            //     //实例化模型
            //     $indexModel = Model('Index')->reponseText($postObj,$content);
            // }
        }
    }


    /*
     * 网站首页
     *  获取code snsapi_base
     *  获取用户信息
     *      跳转商城首页
     * */
    public function storeIndex(){
        $admin=$this->admin;
        header("Content-type: text/html; charset=utf-8");
        if (!isset($_GET['code'])){
            $appId = $this->appid;
            $redirect_uri = 'http://'.$_SERVER["SERVER_NAME"].'/Zyly/Index/storeIndex';
            # 获取code
            $code =D('Index')->getCode($redirect_uri,'userinfo',$appId);
        } else {
            //获取code码，以获取openid
            $code = $_GET['code'];
            $admin_id=$admin['id'];
            $info = D('Index')->getUserInfo($admin_id,$code); # 获取用户信息
            $data = M('user')->where(array('openid'=>$info['openid']))->find();
            if($data){
                $info['id'] = $data['id'];
            }else{
                $info['id'] = '';
            }
            session('WechatUser',$info);
            $this->redirect('Zyly/Goods/index',array('admin_id' => $admin_id),0);

        }
    }
    
    
    public function storeAdmin(){
        header("Content-type: text/html; charset=utf-8");
        if (!isset($_GET['code'])){
            $appId = $this->appid;
            $redirect_uri = 'http://'.$_SERVER["SERVER_NAME"].'/Zyly/Index/storeAdmin';
            # 获取code
            $code = Model('Index')->getCode($redirect_uri,'userinfo',$appId);
        } else {
            //获取code码，以获取openid
            $code = $_GET['code'];
            // $admin_id = 1;
            $admin_id=$_GET['id'];
            $info = Model('Index')->getUserInfo($admin_id,$code); # 获取用户信息
            $data = M('user')->where(array('user_openid'=>$info['openid'],'isvalid'=>1))->find();
            if($data){
                $info['is_promoter'] = $data['is_promoter'];
                $info['pid'] = $data['pid'];
                $info['id'] = $data['id'];
            }else{
                $info['id'] = '';
            }
            session('WechatUser',$info);
            $this->redirect('Pdd/goods/person1',array('admin_id' => $admin_id),0);

        }
    }
    public function storeAdmins(){
        header("Content-type: text/html; charset=utf-8");
        if (!isset($_GET['code'])){
            $appId = $this->appid;
            $redirect_uri = 'http://'.$_SERVER["SERVER_NAME"].'/Zyly/admins/hxmIndex';
            # 获取code
            $code = Model('Index')->getCode($redirect_uri,'userinfo',$appId);
        } else {
            //获取code码，以获取openid
            $code = $_GET['code'];
            // $admin_id = 1;
            $admin_id=$_GET['admin_id'];
            $info = Model('Index')->getUserInfo($admin_id,$code); # 获取用户信息
            $data = M('user')->where(array('user_openid'=>$info['openid'],'isvalid'=>1))->find();
            if($data){
                $info['is_promoter'] = $data['is_promoter'];
                $info['pid'] = $data['pid'];
                $info['id'] = $data['id'];
            }else{
                $info['id'] = '';
            }
            session('WechatUser',$info);
            $this->redirect('Pdd/admins/hxmIndex',array('admin_id' => $admin_id),0);

        }
    }
    
    
    
    

    public function getUserInfo(){
        $admin_id = $_GET['admin_id'];
        if (!isset($_GET['code'])){
            $appId = M('weixin_bingwechat')->where(array('admin_id' => $admin_id, 'isvalid' => 1))->getField('appId');
            $redirect_uri = 'http://'.$_SERVER["SERVER_NAME"].'/Zyly/Index/storeIndex';
            # 获取code
            $code = Model('Index')->getCode($redirect_uri,'userinfo',$appId);
        }
    }
    



    /*
    * 开启权限
    * */
    public function authority(){
        $admin_id = I('admin_id');
        if(IS_POST){
            $wechat_type = I('wechat_type');
            $admin_id = I('admin_id');
            $res = M('admin_user')->where(array('id'=>$admin_id))->setField('wechat_type',$wechat_type);
            $this->ajaxReturn($res);
        }else{
            if($admin_id){
                $wechat_type = M('admin_user')->where(array('id'=>$admin_id))->getField('wechat_type');
                # 模板数据
                $this->assign('wechat_type',$wechat_type);
                $this->assign('admin_id',$admin_id);
            }
        }
        $this->display();
    }

    /*
     * 绑定账号消息推送
     * */
//    public function bindingPush($users_id=45144){
//        exit;
//        $index = Model('Index');
//        $map = M('user_wechat')->where(array('users_id'=>$users_id))->select();
//        //dump($map);die;
//        foreach($map as $k=>$v){
//            $template_id = M('gzh_wechat_template')->where(array('admin_id'=>$v['admin_id'],'isvalid'=>1,'title'=>'绑定通知'))->getField('template_id');
//            $data = array(
//                "touser" =>$v['openid'],
//                "template_id"=>$template_id,
//                "url"=>"http://seller.aixiaoping.com/Wechat/Store/mallIndex?admin_id=".$v['admin_id'],
//                "data"=> array(
//                    "first" => array("value"=>"你已成功绑定 爱小屏 帐号","color"=> "#173177"),
//                    "keyword1" => array("value"=>$v['phone'],"color"=> "#173177"),
//                    "keyword2" => array("value"=>"你可以看到爱小屏账号的相关信息","color"=> "#173177"),
//                    "remark" => array("value"=>date('Y-m-d H:i:s'),"color"=> "#173177"),
//                )
//            );
//            $postJson = json_encode($data);
//            $access_token = $index->access_token($v['admin_id']);
//            $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
//            $res = http_curl($url,'post','json',$postJson);
//        }
//        return $res;
//    }

    /*
     * 退款通知
     * */
    public function refundPush($users_id=45144,$orderId=111112619411111,$admin_id=498,$price=1){
        exit;
        $index = Model('Index');
        $map = M('user_wechat')->where(array('users_id'=>$users_id))->select();
        $array = array();
        foreach($map as $k=>$v){
            if($admin_id==$v['admin_id']||$v['admin_id']==47) {
                $template_id = M('gzh_wechat_template')->where(array('admin_id' => $v['admin_id'], 'isvalid' => 1, 'title' => '退款成功通知'))->getField('template_id');
                if($template_id){
                    $data = array(
                        "touser" => $v['openid'],
                        "template_id" => $template_id,
                        "url" => "http://seller.aixiaoping.com/Wechat/Store/mallIndex?admin_id=" . $v['admin_id'],
                        "data" => array(
                            "first" => array("value" => "您有一笔订单退款成功", "color" => "#173177"),
                            "keyword1" => array("value" => date('Y-m-d H:i:s'), "color" => "#173177"),
                            "keyword2" => array("value" => $orderId, "color" => "#173177"),
                            "keyword3" => array("value" => '商品', "color" => "#173177"),
                            "keyword4" => array("value" => $price.'元', "color" => "#173177"),
                            "remark" => array("value" => '更多优惠尽在爱小屏', "color" => "#173177"),
                        )
                    );
                    $postJson = json_encode($data);
                    $access_token = $index->access_token($v['admin_id']);
                    $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" . $access_token;
                    $res = http_curl($url, 'post', 'json', $postJson);
                    $array[] = $res;
                }
            }
        }
        $this->json(1,'访问成功',$array);
    }


    /*
     * 订单状态改变 发送推送
     * */
    public function orderStatusPush($users_id=45144,$type=1,$status=20,$orderId=111112619411111,$admin_id=498,$sellerName='小屏商城',$phone=18800000011,$price=1){
        exit;
        $index = Model('Index');
        $map = M('user_wechat')->where(array('users_id'=>$users_id))->select();
        if($type==1){
            # 正常订单状态 status = : -1 待支付 | 0 待支付 | 5 待拼团 |20 待发货 | 25 待兑换 | 30 待收货 |40 已完成(待评价) | 50 已完成(已评价)
            $first = '亲，您的订单有新消息！';
            switch($status){
                case 20:
                    $keyword4 = '正在等待商家发货';
                    break;
                case 25:
                    $keyword4 = '待兑换';
                    break;
                case 30:
                    $keyword4 = '待收货';
                    break;
                case 40:
                    $keyword4 = '待评价';
                    break;
                case 50:
                    $keyword4 = '已完成';
                    break;
                default:
                    $keyword4 = '';
                    break;
            }
            $url = "http://seller.aixiaoping.com/Wechat/Store/checkOrder?status=".$status."&admin_id=";
        }else{
            # 退单状态
            $first = '亲，您的退单有新消息！';
            switch($status){
                case 10:
                    $keyword4 = '商家正在审核您的退单信息';
                    break;
                case 20:
                    $keyword4 = '正在退单';
                    break;
                case 30:
                    $keyword4 = '商家同意退单';
                    break;
                case 40:
                    $keyword4 = '该商品不可退单';
                    break;
                case 50:
                    $keyword4 = '您的退单已完成';
                    break;
                case 60:
                    $keyword4 = '您正在申请退单';
                    break;
                default:
                    $keyword4 = '';
                    break;
            }
            $url = "http://seller.aixiaoping.com/Wechat/Store/backOrderList?admin_id=";
        }

        $array = array();
        foreach($map as $k=>$v){
            if($admin_id==$v['admin_id']||$v['admin_id']==47){
                $template_id = M('gzh_wechat_template')->where(array('admin_id'=>$v['admin_id'],'isvalid'=>1,'title'=>'订单状态更新通知'))->getField('template_id');
                if($template_id){
                    $data = array(
                        "touser" =>$v['openid'],
                        "template_id"=>$template_id,
                        "url"=>$url.$v['admin_id'],
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
                    $access_token = $index->access_token($v['admin_id']);
                    $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
                    $res = http_curl($url,'post','json',$postJson);
                    $array[] = $res;
                }

            }
        }
        $this->json(1,'访问成功',$array);
    }


    /*
     * 充值成功 推送
     * */
    public function rechargePush($users_id=45144,$type=2,$value=1){
        exit;
        $index = Model('Index');
        $map = M('user_wechat')->where(array('users_id'=>$users_id))->select();
        switch($type){
            case 1:
                $first = '您的红包充值成功！';
                $unit = '元';
                break;
            default:
                $first = '您的积分充值成功！';
                $unit = '积分';
                break;
        }
        $array = array();
        foreach($map as $k=>$v){
            $template_id = M('gzh_wechat_template')->where(array('admin_id'=>$v['admin_id'],'isvalid'=>1,'title'=>'充值成功通知'))->getField('template_id');
            if($template_id){
                $data = array(
                    "touser" =>$v['openid'],
                    "template_id"=>$template_id,
                    "url"=>"http://seller.aixiaoping.com/Wechat/Store/mallIndex?admin_id=".$v['admin_id'],
                    "data"=> array(
                        "first" => array("value"=>$first,"color"=> "#173177"),
                        "keyword1" => array("value"=>$value.$unit,"color"=> "#173177"),
                        "keyword2" => array("value"=>date('Y-m-d H:i:s'),"color"=> "#173177"),
                        "remark" => array("value"=>'更多优惠尽在爱小屏',"color"=> "#173177"),
                    )
                );
                $postJson = json_encode($data);
                $access_token = $index->access_token($v['admin_id']);
                $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$access_token;
                $res = http_curl($url,'post','json',$postJson);
                $array[] = $res;
            }

        }
        $this->json(1,'访问成功',$array);
    }


    public static function json($code, $message = "", $data = array()) {
        if (!is_numeric($code)) {
            return "";
        }
        $result = array(
            "status" => $code,
            "message" => $message,
            "data" => $data
        );

        exit(json_encode($result));
    }
    
    //创建公众号
    public function create_wechat(){
        header("content-type:text/html;charset=utf8"); 	
        $data = $_GET['arr'];
        $data = json_decode($data,true);

        $map['name'] = $data['app_name']; //公众号名称
        $map['openId'] = $data['client_id']; //'爱小屏开放平台client_id'
        $map['client_screct'] = $data['client_screct']; //爱小屏开放平台client_screct
        $map['pid'] = $data['pid']; //公众号pid
        $map['tgy_name'] = '推广员'; //
        $map['mode10_one'] = 40; //模式1第一级分佣（购买者）40表示分40%
        $map['mode10_two'] = 30; //模式1第二级分佣比例
        $map['three'] = 10; //第三级分佣
        $map['daili'] = 5; //代理分佣
        $map['type'] = 5;  //类别1管理员，5是代理
        $map['remark'] = ''; //备注
        $map['real_name'] = $data['real_name']; //实名认证名字
        $map['isCheck'] = $data['isCheck']; //是否实名认证
        $map['mode'] = 10; //模式
        $map['is_old'] = 1; //是否启用元老邀请
        $map['old_code'] = '666'; //元老邀请码
        $map['old_fenyong'] = 11; //元老自购分佣比例（vip会员自购比例+此比例
        $map['level_money'] = $data['level_money']; //升级所需支付金额
        $map['level_quantity'] = 3; //分佣层级 1一层分佣;2两级分佣;3三级分佣
        $map['realm_name'] = $data['realm_name']; //域名
        $map['wechat_appid'] = $data['wechat_appid']; //微信公众号appid
        $map['wechat_secret'] = $data['wechat_secret']; //微信公众号的secret
        $map['wechat_mchid'] = $data['wechat_mchid']; //微信公众号的商户号
        $map['wechat_mchkey'] = $data['wechat_mchkey']; //微信公众号的商户密钥
        $map['pay_method'] = 0; //提现方式  0为银行卡 1为零钱
        if($data['is_promoter']==0){
            $data['is_promoter'] =false;
        }
        $map['is_promoter'] = $data['is_promoter']; //生成pid是否要付费
        if($data['is_dis_daili']==0){
            $data['is_dis_daili'] =false;
        }
        $map['is_dis_daili'] = $data['is_dis_daili']; //是否显示代理
        $map['admin_url'] = $data['admin_url'];//后台地址
        $map['wx_url'] = $data['wx_url'];//优惠券地址
        $map['version'] = $data['version']; //版本号
        $map['default_username'] = $data['default_username'];
        $map['default_password'] = $data['default_password'];
        $res = M('Admin')->add($map);
        if($res){
            //添加自定义菜单的信息
            $add['isvalid'] = 1;
            $add['create_time'] =date('Y-m-d H:i:s',time());
            $add['admin_id'] =$res;
            $add['name'] = "优惠券商城";
            $add['type'] = "view";
            $add['url'] = $map['wx_url'];
            $add['json'] ='{"type":"view","name":"优惠券商城","url":"'.$map['wx_url'].'"}';
            $add['pid'] = 0;
            $add['level'] =1;
            M('Weixin_menu')->add($add);

            $add2['user_name'] = $map['default_username'];
            $yan = 'zxcvbnmasdfghjklqwertyuiop88888888';
            $password = md5($map['default_password'] . $yan);
            $add2['password'] = $password;
            $add2['name'] = '超级管理员';
            $add2['create_time'] = date('Y-m-d H:i:s',time());
            $add2['auths'] = '0';
            $add2['isvalid'] =1;
            $add2['admin_id'] = $res;
            M('Manage')->add($add2);

        }
        $this->ajaxReturn($res);
    }


	//定时清除周佣金
	public function clean_maid(){
        $model = M('user');
        $sql='UPDATE lr_user SET week_commission = 0';
        $res  = $model->execute($sql);
	}

}