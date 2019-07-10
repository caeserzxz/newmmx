<?php
namespace Zyly\Controller;
use Think\Controller;

 class  VipController  extends Controller{
    public function __construct(){
        parent::__construct();
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
        $nav = setnav('nav');
        $this->assign('nav',$nav);
        $this->assign('cont', CONTROLLER_NAME);
    }

    //会员介绍
    public function vip_introduction(){
        $gold = M('level')->where(array('id'=>1))->find(); //黄金
            $gold['level_price'] = floatval($gold['level_price']);
            $gold['level_max_price'] = floatval($gold['level_max_price']);
        $plat = M('level')->where(array('id'=>2))->find(); //白金
            $plat['level_price'] = floatval($plat['level_price']);
            $plat['level_max_price'] = floatval($plat['level_max_price']);
        $daim = M('level')->where(array('id'=>3))->find(); //钻石
            $daim['level_price'] = floatval($daim['level_price']);
            $daim['level_max_price'] = floatval($daim['level_max_price']);
        
        $this->assign('gold',$gold);
        $this->assign('plat',$plat);
        $this->assign('daim',$daim);
        $this->display();
    }

    //会员中心
    public function memberCenter(){
        $user_info=session('WechatUser');
        
        $users= M('user')->where(array('id'=>$user_info['id']))->find();
        if($users['level_id']==0){
            $users['levels'] = 'putong';
        }else{
            $users['levels'] = $users['level_id'];
        }
        
    
        $gold = M('level')->where(array('id'=>1))->find(); //黄金
            $gold['level_price'] = floatval($gold['level_price']);
            $gold['level_max_price'] = floatval($gold['level_max_price']);
        $plat = M('level')->where(array('id'=>2))->find(); //白金
            $plat['level_price'] = floatval($plat['level_price']);
            $plat['level_max_price'] = floatval($plat['level_max_price']);
        $daim = M('level')->where(array('id'=>3))->find(); //钻石
            $daim['level_price'] = floatval($daim['level_price']);
            $daim['level_max_price'] = floatval($daim['level_max_price']);
        
        $this->assign('gold',$gold);
        $this->assign('plat',$plat);
        $this->assign('daim',$daim);
        $this->assign('users',$users);
        $this->display();
    }

    //分享页面
    public function share(){
        $id = I('top_id');
        $users = M('user')->where(array('id'=>$id))->find();

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
                        M('user')->where(array('id'=>$users['id']))->save($save);   
                    }
            }
            $users = M('user')->where(array('id'=>$users['id']))->find();
            $this->assign('users',$users);
        }

        $this->display();
    }

}