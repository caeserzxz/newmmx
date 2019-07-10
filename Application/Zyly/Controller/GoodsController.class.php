<?php
namespace Zyly\Controller;

use Think\Controller;
// use Zyly\Index\Model;

class GoodsController extends Controller {
    private $appid = '';  #公众号的id
    private $secret = ''; # 公众号的secret
    private $mchid='';
    private $mchkey='';
    private $admin =array();

    public function __construct(){
        parent::__construct();
    
        $admin=M('wechat_config')->where(array('id'=>1))->find();
    
        $this->admin = $admin;
        $this->appid = $admin['wx_appid'];
        $this->secret = $admin['wx_secret'];
        $this->mchid =$admin['wx_mchid'];
        $this->mchkey = $admin['wx_mchkey'];

        $nav = setnav('nav');
        $this->assign('nav',$nav);
        $this->assign('cont', CONTROLLER_NAME);

        $index = D('Index');
        // ini_set('date.timezone', 'Asia/Shanghai');
        header("Content-type: text/html; charset=utf-8");
        # 判断是否 微信内打开
        $isWechat = isRequestedByWechat();
        session('Wechat_admin_id', $admin_id);
        # 判断用户是否授权
        
     
        $url_info = I('goods_id');
        $ssq = explode('pid=', $url_info);//url传入过来
        $goods_id = trim($ssq[0]);
        $get_id = trim($ssq[1]);
    
        $Wechat_time =  session('Wechat_time') ? session('Wechat_time') : 10;
    //    dump($Wechat_time);
        if($Wechat_time<time()||!empty($get_id))
        {
            $_SESSION = array();
            session_destroy();
        }
        session_destroy();
        $userInfo = session('WechatUser');//dump($userInfo);die;
        if (!$isWechat) {
            if (empty($userInfo)) {
                 session('WechatUser', array(
//                   'openid' => 'oiUdE1HJg4-JleX-bTduVPVdueI4',
                     'openid' => 'onxczwQ5E9v3roDmJnifD-SNigqg',
                     'nickname' => 'ssqssqssqssq',
                     'sex' => '1',
                     'language' => 'zh_CN',
                     'city' => '广州',
                     'province' => '广东',
                     'country' => '中国',
                     'headimgurl' => 'http://wx.qlogo.cn/mmopen/vi_32/sPEGYt1iaIqf9U9PicLxIyqeiaTSg6POjcsrgnfS0ahjED4JBOEKe8q2DroHziafKfwMMpudcgJEvibibsnp69W4u1sw/0',
                     'phone' => '13763252809',
                     'id' => '3',
                     'is_promoter' => '1',
                     'pid' => '1001389_18022948',
                 ));
            }
        } else {
            if (!empty($userInfo['errcode'])||empty($userInfo)||!empty($get_id)) {
                # 授权获取微信用户信息
                if (!isset($_GET['code'])) {
                    //触发微信返回code码
                    $appId = $this->appid;
                    $redirect_uri = 'http://' . $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
                    # 获取code
                    $code = $index->getCode($redirect_uri, 'userinfo', $appId);
                } else {
                    //获取code码，以获取openid
                    $code = $_GET['code'];
                    
                    $info = $index->getUserInfo($admin_id, $code); # 获取用户信息
                    if ($info['errcode']) {
                        $url = 'http://' . $_SERVER["SERVER_NAME"] . '/Zyly/Goods/getUserInfo';
                        header("Location: {$url}");
                        exit;
                    }
                    $data = M('user')->where(array('openid'=>$info['openid']))->find();
                    if($data){
                        $info['id'] = $data['id'];
                    }else{
                        $info['id'] ='';
                    }
                    session('WechatUser', $info);
                } 
            }
        }
        $blackinfo = session('WechatUser');
        $index->blacklist($blackinfo['openid']);
    }

    public function getUserInfo()
    {
        // if (!isset($_GET['code'])) {
            $appId = $this->appid;
            $redirect_uri = 'http://' . $_SERVER["SERVER_NAME"] . '/Zyly/Goods/index';
            # 获取code
            $code = D('Index')->getCode($redirect_uri, 'userinfo', $appId);
            
        // }
    }
    
    //首页
    public function index(){
        $admin = $this->admin;
        $userinfo =session('WechatUser');

        $shop_type = I('shop_type')?I('shop_type'):1;
        $users = M('user')->where(array('id'=>$userinfo['id']))->find();
      
        $goods=M('Product')->where(array('del'=>0))->order('price asc')->select();
        foreach ($goods as $k=>$v){
            if(!($v['level_id']>$users['level_id'])){
                $goods[$k]['price'] = $v['price_old'];
            }
        }
        $banner = M('guanggao')->select();

        //通知消息
        $notice = M('notice')->where(array('is_nav'=>1))->select();
        $data['wechat_shop_name'] = $admin['name'];//标题
        #  微信分享
        $admin_id=$this->admin['id'];
        $signPackage = D('Index')->getSignPackage($admin_id); # 获取微信参数 总部 admin_id = -1
        
        $data['signPackage'] = $signPackage;
        $data['shareImg'] = "http://".$_SERVER['HTTP_HOST']."/Data/".$goods[0]['photo_x'];
        $fenxiang_url = "http://".$_SERVER['HTTP_HOST']."/Zyly/Goods/index?goods_id=pid=".$users['id'];
        $data['shareUrl'] = $fenxiang_url;
        $data['shareTitle'] =$admin['name'].'商城';
        $data['shareName'] = '让所有人畅游神舟、开心旅游!';
        
        $this->assign('shop_type',$shop_type);
        $this->assign('data',$data);
        $this->assign('banner',$banner);
        $this->assign('goods',$goods);
        $this->assign('notice',$notice);
        $this->display();
    }

    //商品详情
    public  function detail(){
        $userinfo =session('WechatUser');
        $users = M('user')->where(array('id'=>$userinfo['id']))->find();

        $url_info = I('goods_id');
        $ssq = explode('pid=', $url_info);//url传入过来
        $goods_id = trim($ssq[0]);
        $get_pid = trim($ssq[1]);
        $shop_type = I('shop_type')?I('shop_type'):1;//商城类型

        // $page = I('page');
        $goods = M('Product')->where(array('id'=>$goods_id))->order('sort desc')->find();
        if(!($goods['level_id']>$users['level_id'])){
            $goods['price'] = $goods['price_old'];
            if($users['level_id']==2){
                $level = M('level')->where(array('id'=>$users['level_id']))->find();
                $fg_num = $level['min_num'];
                $is_fg = 10;
            }else{
                $is_fg = 1;
                $fg_num =1;
            }
        }else{
            $is_fg = 1;
            $fg_num =1;
        }
        $photo_string= ltrim($goods['photo_string'], ",");
        $goods['photo_string']=explode(",",$photo_string);
        $p_page = I('p_page');

        $pinlun = M('Product')->alias('a')->join('LEFT JOIN lr_product_dp b on a.id=b.pid')->join('LEFT JOIN lr_user c on b.uid=c.id')->where(array('a.id'=>$goods_id))->field('a.name,b.concent,b.addtime,c.uname,c.photo')->select();
        $pinlun_num = M('product_dp')->where(array('pid'=>$goods_id))->count();
    
        $data['wechat_shop_name'] = $goods['name'];//标题
        #  微信分享
        $admin_id=$this->admin['id'];
        $signPackage = D('Index')->getSignPackage($admin_id); # 获取微信参数 总部 admin_id = -1
        $data['signPackage'] = $signPackage;
        $data['shareImg'] = "http://".$_SERVER['HTTP_HOST']."/Data/".$goods['photo_x'];
        // $fenxiang_url = "http://".$_SERVER['HTTP_HOST']."/Zyly/Vip/share?top_id=".$users['id'];
        $fenxiang_url = "http://".$_SERVER['HTTP_HOST']."/Zyly/Goods/detail?goods_id=".$goods['id']."pid=".$users['id'];
        $data['shareUrl'] = $fenxiang_url;
        $data['shareTitle'] =$goods['name'];
        $data['shareName'] = $goods['intro'];

        $this->assign('fg_num',$fg_num);
        $this->assign('is_fg',$is_fg);
        $this->assign('data',$data);
        $this->assign('pinlun_num',$pinlun_num);
        $this->assign('pinlun',$pinlun);
        $this->assign('goods',$goods);
        $this->assign('banner', $goods['photo_string']);
        $this->assign('shop_type',$shop_type);
        $this->display();
    }

    //确认订单
    public function writeOrder(){

        $model = D('Goods');
//        $a = $model->BuyingIncentives(3,298,46); //联创
//        $a = $model->BuyingIncentives(3,299,45);//合伙人
//        $a = $model->get_daili(3);
//        dump($a);die;

        $user_info=session('WechatUser');
        $user_info = M('User')->where(array('id'=>$user_info['id']))->find();
        $add_id = I('add_id');
        $goods_id= I('goods_id');
        $num = I('buy_num');
        $shop_type = I('shop_type')?I('shop_type'):1;

        $goods = M('product')->where(array('id'=>$goods_id))->find();
        if(!($goods['level_id']>$user_info['level_id'])){
            $goods['price'] = $goods['price_old'];
            if($user_info['level_id']==2){
                $level = M('level')->where(array('id'=>$user_info['level_id']))->find();
                $goods['count_price'] = $goods['price_old']*$num;
                $fg_num = $level['min_num'];
                $is_fg = 10;
            }else{
                $is_fg = 1;
                $fg_num =1;
                $goods['count_price'] = $goods['price']*$num;
            }
        }else{
            $is_fg = 1;
            $fg_num =1;
            $goods['count_price'] = $goods['price']*$num;
        }
        $goods['buy_num'] = $num;

        if($add_id){
            $address = M('Address')->where(array('id'=>$add_id))->find();
        }else{
            $address = M('Address')->where(array('uid'=>$user_info['id'],'is_default'=>1))->find();
        }
        if(empty($address)){
            $address['id']=999999999;
        }

        // $model = D('Goods');
        // $a=$model ->maid(1,290,42,1);
        // print '<pre>';
        // print_r($a);
        // print '</pre>';
        // exit()
        // $model = D('Goods');
        // $model ->maid($msg['user_id'],$msg['goods_id'],$msg['orderIds'],$msg['shop_type']);
        $this->assign('address_id',$address['id']);
        $this->assign('user_info',$user_info);
        $this->assign('address',$address);
        $this->assign('goods',$goods);
        $this->assign('shop_type',$shop_type);
        $this->display();
    }
    
     /*
     * 微信公众号支付
     * */
    public function wechatPay(){
        $admin = $this->admin;
        $user = session('WechatUser');
        $user = M('user')->where(array('id'=>$user['id']))->find();
        $index = D('Index');

        $order_id = I('order_id');
        if(empty($order_id)){
            $users_id = $user['id'];
            $address_id =  I('address_id');
            $goods_id = I('goods_id');
            $num = I('buy_num');
            $shop_type = I('shop_type');
            $goods= M('Product')->where(array('id'=>$goods_id))->find();
            $address = M('Address')->where(array('id'=>$address_id))->find();
            if($goods['level_id']>$user['level_id']){
                $price = $goods['price'];
                $amount = $goods['price']*$num;
            }else{
                $price = $goods['price_old'];
                $amount = $goods['price_old']*$num;
            }
            $openid = $user['openid']; # 用户openid
            $getPay= session('payDetail'); # 订单信息
            $getPay['money'] = $amount;
            // $getPay['money']= $admin['level_money'];
            // dump($getPay);

            # 自定义数据
            # 2018 02 07 修改
            $map['order_sn'] = create_order_sn();
            $map['uid'] = $users_id;
            $map['price'] = $price;
            $map['amount'] = $amount;
            $map['addtime'] = time();
            $map['price_h'] = $amount;
            $map['status'] = 10;
            $map['receiver'] = $address['name'];
            $map['tel'] = $address['tel'];
            $map['address_xq'] = $address['address_xq'];
            $map['code'] = $address['code'];
            $map['product_num'] = $num;
            $map['order_type'] = 1;
            $map['post'] = $address['id'];
            $map['shop_type'] = $shop_type;
            $visitlog = M('Order')->data($map)->add();

            $order_p['pid'] = $goods['id'];
            $order_p['order_id'] = $visitlog;
            $order_p['name'] = $goods['name'];
            $order_p['price'] = $price;
            $order_p['photo_x'] = $goods['photo_x'];
            $order_p['addtime'] = time();
            $order_p['num'] = $num;
            $order_p['order_sn'] = $map['order_sn'];
            $order_res = M('order_product')->add($order_p);

            $attach = json_encode(array('user_id'=>$users_id,'orderIds'=>$visitlog,'order_p_id'=>$order_res,'goods_id'=>$goods['id']));
        }else{
            $order = M('order')->where(array('id'=>$order_id))->find();
            $order_goods = M('order_product')->where(array('order_id'=>$order_id))->find();
            $goods = M('product')->where(array('id'=>$order_goods['pid']))->find();
            $openid = $user['openid']; # 用户openid
            $getPay= session('payDetail'); # 订单信息
            $getPay['money'] = $order['amount'];

            $attach = json_encode(array('user_id'=>$user['id'],'orderIds'=>$order['id'],'order_p_id'=>$order_goods['id'],'goods_id'=>$goods['id']));
        }



        // # 商品信息
        $goodsName = $goods['name'];
        if(mb_strlen($goodsName) > 20){
            $goodsName = mb_substr($goodsName, 0, 8, 'utf-8').'...';
        }
        # 商家信息
        $sellerInfo = array();
        $sellerInfo['appid'] = $this->appid;
        $sellerInfo['mchid'] = $this->mchid;
        $sellerInfo['mch_key'] = $this->mchkey;
        # 统一下单
        $data = array();
        $data['openid'] = $openid;
        $data['body'] = $goodsName;# 设置商品或支付单简要描述
        $data['attach'] = $attach;# 该字段主要用于商户携带订单的自定义数据
        $rand = rand(100000,999909);
        $date = date('Ymd');
        $data['out_trade_no'] =$date.$rand.$visitlog;# 设置商户系统内部的订单号
        $data['total_fee'] = $order['amount']*100;
        $data['time_start'] = date("YmdHis");
        $data['time_expire'] = date("YmdHis", time() + 600);
        $data['goods_tag'] = $goodsName;# 设置商品标记，代金券或立减优惠功能的参数
        $data['notify_url'] = 'http://'.$_SERVER['SERVER_NAME']."/Zyly/Goods/weChatNotify";# 设置接收微信支付异步通知回调地址
        $data['trade_type'] = "JSAPI";# 支付类型
        $data['appid'] = $sellerInfo['appid'];
        $data['mch_id'] = $sellerInfo['mchid'];
        $data['nonce_str'] = $index->getNonceStr();
        $data['sign'] = $index->MakeSign($data,$sellerInfo['mch_key']);
        $xml = $index->ToXml($data);
        
        $url = "https://api.mch.weixin.qq.com/pay/unifiedorder"; # 统一下单 接口链接
        $res = $index->postXmlCurl($xml,$url,false,30);
       
        $postArr = $index->xmlArr($res); # 将xml转成数组
       
        if($postArr['result_code']=='SUCCESS'&&$postArr['return_code']=='SUCCESS'){
            # 调起微信支付参数
            $wxPay = $index->GetJsApiParameters($postArr,$sellerInfo['mch_key']);
            $this->assign('data',$getPay);
            $this->assign('wxPay',$wxPay);
        }else{ 
            print '<pre>';
            print_r($postArr);
            print '</pre>';
            exit();
        }
        //}
        $this->assign('corporate_name',$admin['name']);
        $this->display();
    }

    /*
     * 微信异步回调
     * */
    public function weChatNotify(){
        $admin=$this->admin;
        // 接收微信支付回调
        $postStr = file_get_contents("php://input",'r');
        file_put_contents("pdd.log",date("Y-m-d H:i:s").'----微信异步'.$postStr.PHP_EOL,FILE_APPEND);//记录日志
        if(!empty($postStr)){
            // 将xml格式转换成数组
            $index = D('Index');
            $data = $index->xmlArr($postStr);
            if($data['return_code'] == 'SUCCESS'){
                $return = array(
                    'return_code' => 'SUCCESS',
                    'return_msg' => 'OK',
                );
                $map['createdate'] = date("Y-m-d H:i:s");
                $map['out_trade_no'] = $data['out_trade_no'];
                $map['transaction_id'] = $data['transaction_id'];
                $total_fee = intval($data['total_fee'])/100;
                $msg = json_decode($data['attach'], true); # 商品详情记录(调用java支付完成接口 使用参数)

                $attach = M('order')->where(array('id'=>$msg['orderIds']))->find();
                
                if($attach['id'])
                {
                    $message = M('order')->where(array('id' => $msg['orderIds']))->save(array('total_fee' => $total_fee,'wx_trade_no' => $map['transaction_id'],'status'=>20));
                }

                //修改销量
                $goods_num =   M('product')->where(array('id'=>$msg['goods_id']))->getField('shiyong');
                $save_goods['shiyong'] = rand(1,10)+$goods_num;
                M('product')->where(array('id'=>$msg['goods_id']))->save($save_goods);

                //进行分佣
                $model = D('Goods');
                $model ->BuyingIncentives($msg['user_id'],$msg['goods_id'],$msg['orderIds']);
                //更新用户信息
                session('WechatUser',null);
                $new_info = M('user')->where(array('id'=>$msg['user_id']))->find();
                session('WechatUser',$new_info);
                
                file_put_contents("pdd.log",date("Y-m-d H:i:s").'----微信成功支付异步trade_no:'.$map['transaction_id'].'----$message:'.$message.'----user_id:'.$msg['user_id'].PHP_EOL,FILE_APPEND);//记录日志

                # 回调我们商城
                if(!empty($message)){
                echo $this->arrayToXml($return);
                exit;
                }
                else
                {
                 checkReturn();
                }
                echo $this->arrayToXml($return);
                exit;
            }else{
                $return = array(
                    'return_code' => 'FAIL',
                    'return_msg' => '',
                );
                echo $this->arrayToXml($return);
                exit;
            }
        }
    }
    
    function arrayToXml($arr){ 
        $xml = "<xml>"; 
        foreach ($arr as $key => $val){ 
            if(is_array($val)){ 
                    $xml.="<".$key.">".$this->arrayToXml($val)."</".$key.">"; 
            }else{ 
                $xml.='<'.$key.'>'.$val.'</'.$key.'>'; 
            } 
        }
        $xml.="</xml>"; 
        return $xml; 
    }
        
    
    //支付成功的页面
    public function successPay(){
        $money  = I('money');
        $this->assign('money',$money);
        $this->display();
    }

    //积分兑换商品
    public function exchange_goods(){
        $user = session('WechatUser');
        $users = M('user')->where(array('id'=>$user['id']))->find();
      
        $users_id = $user['id'];
        $address_id =  I('address_id');
        $goods_id = I('goods_id');
        $num = I('buy_num');
        $shop_type = I('shop_type');

        $goods= M('Product')->where(array('id'=>$goods_id))->find();
        $address = M('Address')->where(array('id'=>$address_id))->find();
        if($users['do_score']<$goods['price']){
            $return['status'] = -1;
            $return['msg'] = '积分不足';
            $this->ajaxreturn($return);
        }
        $map['order_sn'] = create_order_sn();
        $map['uid'] = $users_id;
        $map['price'] = $goods['price'];
        $map['amount'] = $goods['price']*$num;
        $map['addtime'] = time();
        $map['price_h'] = $goods['price']*$num;
        $map['status'] = 20;
        $map['receiver'] = $address['name'];
        $map['tel'] = $address['tel'];
        $map['address_xq'] = $address['address_xq'];
        $map['code'] = $address['code'];
        $map['product_num'] = $num;
        $map['order_type'] = 1;
        $map['post'] = $address['id'];
        $map['shop_type'] = $shop_type;
        //添加积分订单
        $res = M('Order')->data($map)->add();

        $order_p['pid'] = $goods['id'];
        $order_p['order_id'] = $res;
        $order_p['name'] = $goods['name'];
        $order_p['price'] = $goods['price'];
        $order_p['photo_x'] = $goods['photo_x'];
        $order_p['addtime'] = time();
        $order_p['num'] = $num;
        $order_p['order_sn'] = $map['order_sn'];
        $order_res = M('order_product')->add($order_p);

        if($res){
            //添加积分的流水
            $model =D('Goods');
            $explain='兑换'.$goods['name'].'消费'.$goods['price'].'积分';
            $model->add_integral_record($users_id,-$goods['price'],$explain);
            
            //修改销量
            $goods_num =   M('product')->where(array('id'=>$msg['goods_id']))->getField('shiyong');
            $save_goods['shiyong'] = rand(1,10)+$goods_num;
            M('product')->where(array('id'=>$msg['goods_id']))->save($save_goods);

            $return['status'] = 1;
            $return['msg'] = '兑换成功';
            $this->ajaxreturn($return);
        }else{
            $return['status'] = -1;
            $return['msg'] = '兑换失败';
            $this->ajaxreturn($return);
        }
        
    }
       //分享页面
    public function share(){
        $admin = $this->admin;
        $userinfo =session('WechatUser');
        $users = M('user')->where(array('id'=>$userinfo['id']))->find();
       
        $code_img = $users['code_img'];//二维码
        $code_time = $users['code_time'] - time();

        if($code_img&&$code_time>0){
            $this->assign('users',$users);
        }else{
            if(empty($code_img)){
                    # 生成一个二维码
                    $arr = array(
                        'expire_seconds'   => 2592000,
                        'action_name'   => 'QR_LIMIT_STR_SCENE',
                        'action_info'   => array('scene'=>array('scene_str'=>$users['id']))
                    );

                    $code = D('Index')->qrcode(json_encode($arr),$admin['id']);
                    
                    if($code['ticket'])
                    {
                        $c_time =time()+2590000;
                        $save['code_time'] = $c_time;
                        $save['code_img'] = $code['url'];
                        M('user')->where(array('id'=>$userinfo['id']))->save($save);   
                    }
            }
            $users = M('user')->where(array('id'=>$userinfo['id']))->find();
            $this->assign('users',$users);
        }

        $this->display();
    }

}