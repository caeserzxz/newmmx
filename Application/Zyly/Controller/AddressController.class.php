<?php
namespace Zyly\Controller;
use Think\Controller;

class AddressController extends Controller {
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

    //选择收货人
    public function selectConsignee(){
    
        $userinfo =session('WechatUser');
        $uid = I('uid')? I('uid'):$userinfo['id'];
        $goods_id = I('goods_id');
        $num = I('buy_num');
        $shop_type = I('shop_type');
      
        $list = M('address')->where(array('uid'=>$uid))->order('is_default desc')->select();
        
        $this->assign('goods_id',$goods_id);
        $this->assign('buy_num',$num);
        $this->assign('uid',$uid);
        $this->assign('address',$list);
        $this->assign('shop_type',$shop_type);
        $this->display();
    }
    
    //地址列表
    public  function address_list(){
        $userinfo =session('WechatUser');
        $uid = I('uid')? I('uid'):$userinfo['id'];
        
        $list = M('address')->where(array('uid'=>$uid))->order('is_default desc')->select();
        // print '<pre>';
        // print_r($list);
        // print '</pre>';
        // exit();
        $this->assign('uid',$uid);
        $this->assign('address',$list);
        $this->display();
    }

    //添加修改地址
    public function edit_address(){
        $userinfo =session('WechatUser');
        if(IS_POST){
            $data = I('post.');
    
            $data['is_default'] = floatval($data['is_default']);
            $state_info = M('province')->where(array('id'=>$data['state']))->find();
            $city_info =  M('province')->where(array('id'=>$data['city']))->find();
            $area_info = M('province')->where(array('id'=>$data['area']))->find();

            
            $data['state']  = $state_info['name'];
            $data['city'] = $city_info['name'];
            $data['area'] = $area_info['name'];
            $data['state_id'] = $state_info['id']; 
            $data['city_id'] = $city_info['id'];
            $data['area_id'] =$area_info['id'];
       
            $data['address_xq'] = $data['state'].$data['city'].$data['area'].$data['address'];
            if($data['is_default']==1){
                $address = M('address')->where(array('id'=>$data['id']))->find();
                //如果自己不是默认
                if($address['is_default']!=1){
                    $address_default =M('address')->where(array('is_default'=>1))->find();
                    if($address_default){
                        M('address')->where(array('id'=>$address_default['id']))->save(array('is_default'=>0));
                    }
                }
            }
       
            if($data['id']){
                $data['save_time']=date("Y-m-d H:i:s",time());
                $res  =M('address')->where(array('id'=>$data['id']))->save($data);
                $a_id = $data['id'];
            }else{
                $data['add_time']=date("Y-m-d H:i:s",time());
                $res  =M('address')->add($data);
                $a_id = $res;
            }
         
            if($res){
                if($data['type']==1){
                    $goods_id = $data['goods_id'];
                    $buy_num = $data['buy_num'];

                    $host = $_SERVER['HTTP_HOST'];
                    $url = "http://".$host.'/Zyly/Goods/writeOrder?add_id='.$a_id.'&goods_id='.$goods_id.'&buy_num='.$buy_num.'&shop_type='.$data['shop_type'];
                    echo "<script language='javascript'
                    type='text/javascript'>"; 
                    echo "window.location.href='$url'"; 
                    echo "</script>";
                    
                }else{
                    $this->redirect('Address/address_list');
                }
            }else{
                $this->error('操作失败.');
            }
        }else{
            $user_info = M('user')->where(array('id'=>$userinfo['id']))->find();
         
            $id = I('id');
            $type=I('type');
            $shop_type = I('shop_type');
            $goods_id = I('goods_id')?I('goods_id'):99999999;
            $buy_num = I('buy_num')?I('buy_num'):999999999;
            $address = M('address')->where(array('id'=>$id))->find();
            $uid=I('uid')?I('uid'):$address['uid'];

            $province =M('province')->where(array('level'=>1))->select();
            $this->assign('province',$province);

            $this->assign('uid',$uid);
            $this->assign('type',$type);
            $this->assign('goods_id',$goods_id);
            $this->assign('buy_num',$buy_num);
            $this->assign('address',$address);
            $this->assign('shop_type',$shop_type);
            $this->assign('info',$user_info);
            $this->display();
        }
    }
    
    //删除地址
    public function del_address(){
        $id = I('id');
        $res =  M('address')->where(array('id'=>$id))->delete();
       
        if($res){
            $return['status'] = 1;
            $return['msg'] = '删除成功';
        }else{
            $return['status'] = -1;
            $return['msg'] = '删除成功';
        }
        $this->ajaxreturn($return);
    }

    //设置默认地址
    public function default_address(){
        $id = I('id');
        $data['is_default'] = 1;
        $data['save_time'] = date('Y-m-d-H:i',time());

        $default_address = M('address')->where(array('is_default'=>1))->find();
        if($default_address){
            M('address')->where(array('id'=>$default_address['id']))->save(array('is_default'=>0));
            $res =  M('address')->where(array('id'=>$id))->save($data);
        }else{
            $res =  M('address')->where(array('id'=>$id))->save($data);
        }

        if($res){
            $return['status'] = 1;
            $return['msg'] = '设置默认地址成功';
        }else{
            $return['status'] = -1;
            $return['msg'] = '设置默认地址成功';
        }
        $this->ajaxreturn($return);    
    }
}