<?php
namespace Zyly\Controller;
use Think\Controller;

class PersonController extends Controller{  
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
        ini_set('date.timezone', 'Asia/Shanghai');
        header("Content-type: text/html; charset=utf-8");
        # 判断是否 微信内打开
        $isWechat = isRequestedByWechat();
        session('Wechat_admin_id', $admin_id);
        # 判断用户是否授权
 
        $Wechat_time =  session('Wechat_time') ? session('Wechat_time') : 10;
        // if($Wechat_time<time())
        // {
        //     $_SESSION = array();
        //     session_destroy();
        // }
        session_destroy();
        $userInfo = session('WechatUser'); //dump($userInfo);die;
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
                    'id' => '1',
                    'level_id'=> '1',
                    'is_promoter' => '1',
                    'pid' => '1001389_18022948',
                ));
           }
        } else {
            if (!empty($userInfo['errcode']) || empty($userInfo)) {
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
    }
    
    //个人中心首页
    public function person(){
        $admin = $this->admin;
        $userInfo = session('WechatUser');
        $user_info = M('user')->where(array('id'=>$userInfo['id']))->find();
        $fance_num = M('user')->where(array('top_id'=>$user_info['id']))->count();
        $model = D('Order');
        $money = $model->today_money($user_info['id']);

        $goods=M('Product')->field('id,name,intro,photo_x,sort,shiyong,price')->where(array('del'=>0))->limit(1)->order('sort desc')->find();
        
        #  微信分享
        $data['wechat_shop_name'] = $admin['name'];//标题
        $admin_id=$this->admin['id'];
        $signPackage = D('Index')->getSignPackage($admin_id); # 获取微信参数 总部 admin_id = -1
        
        $data['signPackage'] = $signPackage;
        $data['shareImg'] = "http://".$_SERVER['HTTP_HOST']."/Data/".$goods['photo_x'];
        $fenxiang_url = "http://".$_SERVER['HTTP_HOST']."/Zyly/Goods/index?goods_id=pid=".$users['id'];
        $data['shareUrl'] = $fenxiang_url;
        $data['shareTitle'] =$admin['name'].'商城';
        $data['shareName'] = '让所有人畅游神舟、开心旅游!';
        
        $this->assign('data',$data);
        $this->assign('money',$money);
        $this->assign('fance_num',$fance_num);
        $this->assign('userInfo',$user_info);
        $this->display();
    }


    //个人订单
    public function order(){
        $userInfo = session('WechatUser');
        $user_info = M('user')->where(array('id'=>$userInfo['id']))->find();

        $status = I('status')?I('status'):1;
        if(IS_POST){
            $where['a.uid'] = $user_info['id'];
            if($status!=1){
                $where['a.status'] = $status;
            }
            $list = M('order')->alias('a')->join('LEFT JOIN lr_order_product b  on a.id = b.order_id')->where($where)->field('a.*,b.pid,b.name,b.photo_x,b.num')->order('a.addtime desc')->select();
            $this->ajaxreturn($list);
        }else{
            $list =  M('order')->alias('a')->join('LEFT JOIN lr_order_product b  on a.id = b.order_id')->where(array('a.uid'=>$user_info['id']))->field('a.*,b.pid,b.name,b.photo_x,b.num')->order('a.addtime desc')->select();
            $this->assign('status',$status);
            $this->assign('orders',$list);
            $this->display();
        }


    }

    //我的粉丝
    public function my_fan(){
        // $id = I('id');
        $userinfo =session('WechatUser');
        $fance_list = M('User')->where(array('top_id'=>$userinfo['id']))->select();
      
       foreach ($fance_list as $k => $v) {
            $fance_list[$k]['order_num'] = M('order')->where(array('uid'=>$v['id']))->count();
            $fance_list[$k]['fance_num'] = M('user')->where(array('top_id'=>$v['id']))->count();
       }
       
        $model = D('Goods');

        $this->assign('fance_list',$fance_list);
        $this->display();
    }

    //我的推荐
    public function my_recommend(){
        // session_destroy();
        $admin = $this->admin;
        $userinfo =session('WechatUser');
        //用户自己
        $users = M('user')->where(array('id'=>$userinfo['id']))->find();
        if($users['banks']){
          $this->assign('banks',1);
        }else{
          $this->assign('banks',2);
        }

        if(empty($users['phone'])){
            $users['phone'] = 'rhujhnfjhfnjffghgj';
        }
        //下级
        $users_lower = M('user')->order('total desc')->limit(10)->select();
        foreach ($users_lower as $k=> $v) {
            $fans  = M('user')->where(array('top_id'=>$v['id']))->count();
            $users_lower[$k]['fans'] = intval($fans);
        }
        array_multisort(array_column($users_lower,'fans'),SORT_DESC,$users_lower);

        $users_num = M('user')->where(array('top_id'=>$userinfo['id']))->count();
        $goods=M('Product')->field('id,name,intro,photo_x,sort,shiyong,price')->where(array('del'=>0))->limit(1)->order('sort desc')->select();
        #  微信分享
        $data['wechat_shop_name'] = $admin['name'];//标题
        $admin_id=$this->admin['id'];
        $signPackage = D('Index')->getSignPackage($admin_id); # 获取微信参数 总部 admin_id = -1
        
        $data['signPackage'] = $signPackage;
        $data['shareImg'] = "http://".$_SERVER['HTTP_HOST']."/Data/".$goods[0]['photo_x'];
        $fenxiang_url = "http://".$_SERVER['HTTP_HOST']."/Zyly/Goods/index?goods_id=pid=".$users['id'];
        $data['shareUrl'] = $fenxiang_url;
        $data['shareTitle'] =$admin['name'].'商城';
        $data['shareName'] = '让所有人畅游神舟、开心旅游!';
        

        $this->assign('users',$users);
        $this->assign('users_num',$users_num);
        $this->assign('users_lower',$users_lower);
        $this->assign('data',$data);
        $this->display();
    }

    //我的评价
    public function comment(){
       if(IS_POST){
            $file = $_FILES;
            $data = I('post.');
            print '<pre>';
            print_r($data);
            print '</pre>';
            exit();
       }else{
            $id = I('id');
            $this->display();
       }
      
    }

    //服务中心
    public function serverCenter(){
        $this->display();
    }

    //常见问题
    public function commonProblem(){
        $this->display();
    }

    //推荐奖励
    public function rewardDetail(){
        $userinfo =session('WechatUser');
        $model = D('order');
        //用户自己
        $user_info = M('user')->where(array('id'=>$userinfo['id']))->find();
        //下级
        $users_num = M('user')->where(array('top_id'=>$userinfo['id']))->count();
        //奖励明细
        $glide = M('glide')->where(array('uid'=>$user_info['id'],'act_price'=>array('egt',0)))->select();
        $data = array();
        foreach ($glide  as $k => $v) {
            $order = M('order')->field('uid,order_sn,status,pay_time,price_h,product_num')->where(array('id'=>$v['order_id']))->find();
            $users = M('user')->field('uname,top_id')->where(array('id'=>$order['uid']))->find();
           
            $goods = M('product')->field('name,photo_x,maid_one,maid_two,maid_three')->where(array('id'=>$v['goods_id']))->find();

            $data[$k]['order_sn'] = $order['order_sn'];//订单编号
            $data[$k]['status'] =  $order['status'];//审核状态
            $data[$k]['photo_x'] =$goods['photo_x'];//商品图片
            $data[$k]['goods_name'] = $goods['name'];//商品名称
            $data[$k]['pay_time'] = $order['pay_time'];//支付时间
            $data[$k]['product_num'] = $order['product_num'];//商品数量
            $data[$k]['uname'] = $users['uname']; //订单来源
            $data[$k]['price_h'] = $order['price_h'];//支付金额
            $data[$k]['est_price'] = $v['est_price'];//支付金额
        }

        $this->assign('data',$data);
        $this->assign('users',$user_info);
        $this->assign('users_num',$users_num);
        $this->display();
    }

    //推荐说明
    public function tuijianProblem(){
        $this->display();
    }

    //提现
    public function withdraw(){
        $userinfo =session('WechatUser');
        $id= $userinfo['id'];

        $money =I('money');

        $users = M('user')->where(array('id'=>$id))->find();

        if($money<1){
            $return['status'] =-1;
            $return['msg'] = '提现金额小于1元,无法提现';
            $this->ajaxreturn($return);
        }
        if($money>$users['can_withdraw']){
            $return['status'] =-1;
            $return['msg'] = '提现金额小于1元,无法提现';
            $this->ajaxreturn($return);
        }


        // $glide = M('glide')->where(array('uid'=>$id,'act_price'=>array('GT',0),'status'=>0))->select();
        
        // $orderids = '';
        // $moneys = 0;
        // foreach ($glide as $k => $v) {
        //     $orderids .= ','.$v['id'];
        //     $moneys = $moneys+$v['act_price'];
        // }
        
        // if(sprintf('%.2f', floatval($moneys))!=sprintf('%.2f', floatval($users['can_withdraw']))){
        //     $return['status'] =-1;
        //     $return['msg'] = '提现金额有误,请联系客服';
        //     $this->ajaxreturn($return);
        // }
        // $orderids = ltrim($orderids,',');

        $add['uid'] = $id;
        $add['money'] = $money;
        $add['orderids'] = $orderids;
        $add['create_time'] = date("Y-m-d H:i:s",time());
        $add['status'] = 1;
        $res = M('withdraw')->add($add);

        // if(empty($orderids)){
        //     $return['status'] =-1;
        //     $return['msg'] = '请确认是否有提现';
        //     $this->ajaxreturn($return);
        // }else{
        //     $res = M('withdraw')->add($add);
        // }

        if($res){
            // $save['status'] = 1;
            // $save['save_time'] = date("Y-m-d H:i:s",time());
            // $ids = explode(',',$orderids);
            // foreach ($ids as $k => $v) {
            //     M('glide')->where(array('id'=>$v))->save($save);    //修改流水的提现状态
            // }

            $saves['can_withdraw'] = $users['can_withdraw']-$money;
            $saves['save_time'] = date("Y-m-d H:i:s",time());
            M('user')->where(array('id'=>$id))->save($saves);//重置用户可提现的钱
            
            $return['status'] =1;
            $return['msg'] = '结算成功,待客服审核';
            $this->ajaxreturn($return);
        }else{
            $return['status'] =-1;
            $return['msg'] = '提现失败';
            $this->ajaxreturn($return);
        }

    }
    
    //个人资料
    public  function  personalInfo(){
        $userinfo =session('WechatUser');
        //用户自己
        $users = M('user')->where(array('id'=>$userinfo['id']))->find();
        if(IS_POST){
            $save['real_name'] =I('real_name');
            $save['phone'] =I('phone');
            $save['postal_address'] = I('postal_address');
            $save['bank_name'] =I('bank_name');
            $save['banks'] = preg_replace('# #','',I('banks'));
            $save['save_time'] = date('Y-m-d H:i:s',time());

            $res = M('user')->where(array('id'=>$users['id']))->save($save);
            if($res){
                $return['status'] = 1;
                $return['msg'] = "更新个人资料成功";
                $this->ajaxreturn($return);
            }else{
                $return['status'] = -1;
                $return['msg'] = "更新个人资料失败";
                $this->ajaxreturn($return);
            }
        }else{
            $this->assign('users',$users);
            $this->display();
        }
    }

    //结算中心
    public function wallet(){
        $userinfo =session('WechatUser');
        $users = M('user')->where(array('id'=>$userinfo['id']))->find();

    
        if(empty($users['phone'])){
            $users['phone'] = 'rhujhnfjhfnjffghgj';
        }
        if(empty($users['banks'])){
            $users['banks']=2;
        }else{
            $users['banks']=1;
        }

        $user_withdraw = M('withdraw')->where(array('uid'=>$userinfo['id']))->order('create_time desc')->select();
        // $yt_money = M('glide')->where(array(array('uid'=>$userinfo['id'],'status'=>2,'act_price'=>array('gt',0))))->sum('act_price');
        // $kt_money = M('glide')->where(array(array('uid'=>$userinfo['id'],'status'=>0,'act_price'=>array('gt',0))))->sum('act_price');
        $yt_money = $users['withdraw_old'];
        $kt_money = $users['can_withdraw'];
        
        $this->assign('yt_money',sprintf('%.2f',floatval($yt_money)));//已提现
        $this->assign('kt_money',sprintf('%.2f',floatval($kt_money)));//可提现
        $this->assign('can_withdraw',sprintf('%.2f',floatval($users['can_withdraw'])));//余额和可提现
        $this->assign('total',sprintf('%.2f',floatval($users['total'])));//总佣金
        $this->assign('list',$user_withdraw);//提现记录
        $this->assign('users',$users);
        $this->display();
    }
    
    //定时更新周佣金
    public function clear_week_commission(){
        $sql = 'update lr_user set `week_commission` = 0';
        $res =  M('user')->execute($sql);

        if($res){
            print '<pre>';
            print_r('周佣金清除成功!');
            print '</pre>';
            exit();
        }else{
            print '<pre>';
            print_r('周佣金清除失败!');
            print '</pre>';
            exit();
        }
    }

    //积分流水记录
    public function integral_record(){

        $userinfo =session('WechatUser');
        $users = M('user')->where(array('id'=>$userinfo['id']))->find();
  
        $record = M('integral_record')->where(array('user_id'=>$users['id']))->select();
        // print '<pre>';
        // print_r($record);
        // print '</pre>';
        // exit();
        $this->assign('users',$users);
        $this->assign('record',$record);
        $this->display();
    }
}