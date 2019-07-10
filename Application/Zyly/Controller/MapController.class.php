<?php
namespace Zyly\Controller;

use Think\Controller;


class MapController extends Controller{
    
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
        session_destroy();
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
            'id' => '2',
            'is_promoter' => '1',
            'pid' => '1001389_18022948',
        ));
    }

    //代理位置
    public function map(){
        $admin = $this->admin;
        $userinfo =session('WechatUser');
        $user_info = M('user')->where(array('id'=>$userinfo['id']))->find();
        $user_info = json_encode($user_info);

        $users = M('user')->where(array('is_daili'=>2))->select();
        $users = json_encode($users);

        $goods=M('Product')->field('id,name,intro,photo_x,sort,shiyong,price')->where(array('del'=>0))->limit(1)->order('sort desc')->find();
        
        #  微信分享
        $data['wechat_shop_name'] = $admin['name'];//标题
        $admin_id=$this->admin['id'];
        $signPackage = D('Index')->getSignPackage($admin_id); # 获取微信参数 总部 admin_id = -1
        
        $data['signPackage'] = $signPackage;
        $data['shareImg'] = "http://".$_SERVER['HTTP_HOST']."/Data/".$goods['photo_x'];
        $fenxiang_url = "http://".$_SERVER['HTTP_HOST']."/Zyly/Goods/index?goods_id=pid=".$userinfo['id'];
        $data['shareUrl'] = $fenxiang_url;
        $data['shareTitle'] =$admin['name'].'商城';
        $data['shareName'] = '让所有人畅游神舟、开心旅游!';

        $this->assign('data',$data);
        $this->assign('user_info',$user_info);
        $this->assign('users',$users);
        $this->display();
    }
    //代理位置 
    public  function gaodemap(){
        $users = M('user')->where(array('is_daili'=>2))->select();
        $users = json_encode($users);

        $this->assign('users',$users);
        $this->display();
    }

    public function get_daili_location(){
        $users = M('user')->where(array('is_daili'=>2))->select();
    }

    //申请代理
    public function proxyApplication(){
        $userinfo =session('WechatUser');
        $user_info = M('user')->where(array('id'=>$userinfo['id']))->find();
        if(IS_POST){
            $data = I('post.');
            // $this->ajaxreturn($data);
            $state_info = M('province')->where(array('id'=>$data['state']))->find();
            $city_info =  M('province')->where(array('id'=>$data['city']))->find();
            $area_info = M('province')->where(array('id'=>$data['area']))->find();

            
            $add['state']  = $state_info['name'];
            $add['city'] = $city_info['name'];
            $add['area'] = $area_info['name'];
            $add['state_id'] = $data['state']; 
            $add['city_id'] = $data['city'];
            $add['area_id'] = $data['area'];

            $add['is_daili'] = 3;
            $add['name'] =$data['name'];
            $add['store_location'] =$data['store_location'];
            $add['introduce'] = $data['introduce'];
            $add['tel'] = $data['tel'];
            if($data['qq_id']){
                if(strpos($data['qq_id'],'@')){
                    $add['email']=$data['qq_id'];
                }else{
                    $add['qq_id']= $data['qq_id'];
                }
            }
           
            $res=M('user')->where(array('id'=>$userinfo['id']))->save($add);
            if($res){
                $return['status'] = 1;
                $return['msg'] = '申请成功';
            }else{
                $return['status'] = -1;
                $return['msg'] = '申请成功';
            }
            $this->ajaxreturn($return);
        }else{
            $province =M('province')->where(array('level'=>1))->select();
            
            $this->assign('province',$province);
            $this->display();
        }
    }

    //获取下属地理位
    public function getChildren(){
        if(IS_AJAX){
            $id = intval(I("id"));
            $model = M("province");
            $area = $model->field("id,name")->where($where=array("parentId"=>$id))->select();
            $this->ajaxReturn(json_encode($area));
        }
    }
}