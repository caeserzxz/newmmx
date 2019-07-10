<?php
namespace Zyly\Model;
use Think\Model;
use Think\PddApi;
class OrderModel{
    private $appid = '';  #公众号的id
    private $secret = ''; # 公众号的secret
    private $mchid='';
    private $mchkey='';
    public $imgUrl;
    private $admin =array();

    public function  __construct(){
        $admin=M('wechat_config')->where(array('id'=>1))->find();
        $this->admin = $admin; 
        $this->appid = $admin['wx_appid'];
        $this->secret = $admin['wx_secret'];
        $this->mchid =$admin['wx_mchid'];
        $this->mchkey = $admin['wx_mchkey'];
    }
    
    public function today_money($user_id){
        $dates = date('Y-m-d',time());

        $today_order_num = 0; //今日订单数
        $today_order_money = 0; //今日收入

        $orders = M('order')->where(array('uid'=>$user_id))->select();//订单
        foreach ( $orders as $k => $v) {
            if( date('Y-m-d',$v['addtime'])==$dates ){
                $today_order_num++;
            }
        }

        $income = M('glide')->where(array('uid'=>$user_id,'act_price'=>array('gt',0)))->select();//收入流水
        foreach ($income as $k => $v) {
           if( date('Y-m-d',strtotime($v['addtime']))==$dates ){
                $today_order_money += $v['act_price'];
           }
        }
        $money['today_order_num'] = $today_order_num;//今日订单数
        $money['today_order_money'] =  $today_order_money;//今日收入
        return  $money;
    }

    //查找用户的关系
    /**
     * uid为用户自己的id
     * top_id为上级的id
     */
    public function user_nexus($uid,$top_id){
        $one_user= M('user')->where(array('id'=>$uid))->find();//上级
        if(!empty($one_user)){
            if($one_user['id']==$top_id){
                $num = 1;
                return $num;
            }
        }

        if(!empty($one_user['top_id'])&&$one_user['top_id']!=='9999999999'){
            $two_user=M('user')->where(array('id'=>$one_user['top_id']))->find();//上级
            if($two_user['id']==$top_id){
                $num = 2;
                return $num;
            }
        }
       
        if(!empty($two_user['top_id'])&&$two_user['top_id']!=='9999999999'){
            $three_user=M('user')->where(array('id'=>$two_user['top_id']))->find();//上上级
            if($three_user['id']==$top_id){
                $num = 3;
                return $num;
            }
        }

        return 0;
    }

}