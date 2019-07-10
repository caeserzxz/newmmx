<?php
namespace Zyly\Model;
use Think\Model;
use Think\PddApi;
class GoodsModel{
    private $appid = '';  #公众号的id
    private $secret = ''; # 公众号的secret
    private $mchid='';
    private $mchkey='';
    public $imgUrl;
    private $admin =array();
    private $goods =array();
    private $order =array();
    private $order_goods = array();
    private $address = array();

    public function  __construct(){
        $admin=M('wechat_config')->where(array('id'=>1))->find();
        $this->admin = $admin; 
        $this->appid = $admin['wx_appid'];
        $this->secret = $admin['wx_secret'];
        $this->mchid =$admin['wx_mchid'];
        $this->mchkey = $admin['wx_mchkey'];
    }
    
        public function upload_img($file,$upload_path){
            
            if(!empty($file) && $file['error'] == 0){
                //进行文件上传 使用Upload类
                //实例化Upload类
                $config = array(
                    'maxSize'       =>  2*1024*1024, //上传的文件大小限制 (0-不做限制)(单位是byte)
                    'exts'          =>  array('jpg', 'png', 'gif', 'jpeg'), //允许上传的文件后缀
                    'rootPath'      =>  ROOT_PATH.$upload_path, //保存根路径
                );
                $upload = new \Think\Upload($config);
                //调用upload 或者uploadOne方法实现文件上传
                $res = $upload -> uploadOne($file);
                if($res){
                    //成功时返回一个数组
                    //图片地址
                    $path = $upload_path . $res['savepath'] . $res['savename'];
                    //这个地址在后续的添加操作能够自动保存到数据库了
                    return $path;
                }else{
                    //失败时返回false
                    //如果要求图片必须上传才能添加一个新商品，则这里需要报错
                    $error = $upload -> getError();
                    // $this -> error($error);
                    //失败，把上传类的错误信息 设置到模型中的error属性上
                    $this -> error = $error;
                    return false;
                }
            }else{
                $this -> error = '没有上传图片';
                return false;
            }
        }

    

    //上传商品logo
    public function upload_logo($file,$path){
        if(!empty($file) && $file['error'] == 0){
            //进行文件上传 使用Upload类
            //实例化Upload类
            $config = array(
                'maxSize'       =>  2*1024*1024, //上传的文件大小限制 (0-不做限制)(单位是byte)
                'exts'          =>  array('jpg', 'png', 'gif', 'jpeg'), //允许上传的文件后缀
                'rootPath'      =>  ROOT_PATH .$path, //保存根路径
            );
            // dump($config);die;
            $upload = new \Think\Upload($config);
            //调用upload 或者uploadOne方法实现文件上传
            $res = $upload -> uploadOne($file);
            // dump($res);die;
            if($res){
                //成功时返回一个数组
                //图片地址
                $data['goods_big_img'] = $path . $res['savepath'] . $res['savename'];
                //这个地址在后续的添加操作能够自动保存到数据库了

                //logo图片上传成功，生成缩略图
                //实例化Image类
                $image = new \Think\Image();
                //调用open方法打开原图片
                $image -> open( ROOT_PATH . $data['goods_big_img']);
                //调用thumb方法生成缩略图
                $image -> thumb(135, 135);
                //调用save方法保存图片
                $thumb = $path . $res['savepath'] . 'thumb_' . $res['savename'];
                $image -> save( ROOT_PATH . $thumb);
                //把图片地址保存到数据表（放到$data  goods_small_img）
                $data['goods_small_img'] = $thumb;
                //这个地址在后续的添加操作能够自动保存到数据库了
                //上传成功，返回新的data数据
                return $data;
            }else{
                //失败时返回false
                //如果要求图片必须上传才能添加一个新商品，则这里需要报错
                $error = $upload -> getError();
                // $this -> error($error);
                //失败，把上传类的错误信息 设置到模型中的error属性上
                $this -> error = $error;
                return false;
            }
        }else{
            $this -> error = '没有上传图片';
            return false;
        }
    }

    //封装一个方法实现商品相册图片多文件上传
    public function upload_pics($goods_id, $files,$path,$type){
    //实现多文件上传，需要使用Upload类，调用upload方法 需要二维的文件数组

    //判断是否有文件需要上传 由于error中有0错误码就必须要进行上传
    // if(min($files['goods_pics']['error']) != 0){
    // 	return false;
    // }
    //实例化Upload类
    $config = array(
        'maxSize'       =>  2*1024*1024, //上传的文件大小限制 (0-不做限制)(单位是byte)
        'exts'          =>  array('jpg', 'png', 'gif', 'jpeg'), //允许上传的文件后缀
        'rootPath'      =>  ROOT_PATH . $path, //保存根路径
    );
    // dump($config);die;
    $upload = new \Think\Upload($config);
    // return $upload;
    //调用upload 方法实现文件上传 返回二维数组 其中包括了所有上传成功的文件信息
    $res = $upload -> upload($files);
    // dump($res);die;
    foreach ($res as $key => $value) {
        //原始图片保存路径
        $orign_img = $path . $value['savepath'] . $value['savename'];
        // //生成三张缩略图
        // // 实例化Image类
        // $image = new \Think\Image();
        // $image -> open(ROOT_PATH . $orign_img);

        // //大缩略图  800
        // $image -> thumb(800, 800);
        // $image -> save(ROOT_PATH . UPLOAD_PATH . $value['savepath'] . 'thumb800_' . $value['savename']);
        // //中等缩略图
        // $image -> thumb(350, 350);
        // $image -> save(ROOT_PATH . UPLOAD_PATH . $value['savepath'] . 'thumb350_' . $value['savename']);
        // //小缩略图
        // $image -> thumb(50, 50);
        // $image -> save(ROOT_PATH . UPLOAD_PATH . $value['savepath'] . 'thumb50_' . $value['savename']);

        //组装一条数据，添加到goodspics表
        $row['goods_id'] = $goods_id;
        $row['goods_img'] = $orign_img;
        $row['type'] = $type;
        // $row['pics_big'] = UPLOAD_PATH . $value['savepath'] . 'thumb800_' . $value['savename'];
        // $row['pics_mid'] = UPLOAD_PATH . $value['savepath'] . 'thumb350_' . $value['savename'];
        // $row['pics_sma'] = UPLOAD_PATH . $value['savepath'] . 'thumb50_' . $value['savename'];
        //实例化goodspics模型
        M('Self_goodsimg') -> add($row);
    }
    return true;
    }




    //获取用户信息
    public function get_user($user_id){
        $userinfo = M('user')->where(array('id'=>$user_id))->find();
        return $userinfo;
    }

    //获取用户等级信息
    public  function  get_level($level_id){
        $level = M('level')->where(array('id'=>$level_id))->find();
        return $level;
    }

    //更新用户等级
    public function save_user_level($user_id,$level_id){
        $map['level_id'] = $level_id;
        $res = M('user')->where(array('id'=>$user_id))->save($map);
        return $res;
    }

    //购买奖励
    public function BuyingIncentives($user_id='',$goods_id='',$order_id=""){
        $users = M('user')->where(array('id'=>$user_id))->find();
        $orders =  M('order')->where(array('id'=>$order_id))->find();
        $this->order = $orders;

        $order_goods = M('order_product')->where(array('order_id'=>$order_id))->find();
        $this->order_goods = $order_goods;

        $goods = M('product')->where(array('id'=>$goods_id))->find();
        $this->goods = $goods;

        if($goods['level_id']>$users['level_id']){
            if($users['top_id']){
               $top_user = $this->get_user($users['top_id']);
               $top_level = $this->get_level($top_user['level_id']);
                //直推奖分佣
                if($goods['level_id']==1){
                    $direct_radio = $top_level['direct_lc'];
                }else{
                    $direct_radio = $top_level['direct_hh'];
                }
                $direct_money = $orders['amount'] * $direct_radio /100; //直推奖佣金
                dump('用户'.$top_user['id'].'拿'.$direct_money.'直推奖');
                //更新用户余额
                $this->save_user_money($top_user['id'],$direct_money,0);
                //添加流水
                $this->add_glide($top_user['id'],$users['id'],$direct_money,$order_id,$goods_id,'直推奖佣金');
            }

            $two_user = $this->get_daili($users['top_id']);
            if($two_user){
                //区间奖分佣
//                $two_user = $this->get_user($top_user['top_id']);
                if($two_user['level_id']==2){
                    $two_level = $this->get_level($two_user['level_id']);
                    if($goods['level_id']==1){
                        $section_radio = $two_level['two_commission'];
                        $two_desc = '区间奖佣金';
                    }else if($goods['level_id']==2){
                        $section_radio = $two_level['team_commission'];
                        $two_desc = '团队奖佣金';
                    }

                    $section_money = $orders['amount'] * $section_radio /100; //区间奖佣金
                    dump('用户'.$two_user['id'].'拿'.$section_money.'区间奖佣金');

                    //更新用户余额
                    $this->save_user_money($two_user['id'],$section_money,0);
                    //添加流水
                    $this->add_glide($two_user['id'],$users['id'],$section_money,$order_id,$goods_id,$two_desc);
                }

            }

            //给用户升级
            $this->save_user_level($users['id'],$goods['level_id']);
        }else{
            //复购奖励
            $top_user = $this->get_user($users['top_id']);
            if($top_user['level_id']==2){
                $top_level = $this->get_level($top_user['level_id']);
                if($goods['level_id']==1){
                    $repeat_radio =  $top_level['repeat_purchase_lc'];
                }else{
                    $repeat_radio =  $top_level['repeat_purchase_hh'];
                }
                $repeat_money = $orders['amount'] * $repeat_radio /100; //复购奖佣金
                dump('用户'.$top_user['id'].'拿'.$repeat_money.'复购奖佣金');
                //更新用户余额
                $this->save_user_money($top_user['id'],$repeat_money,0);
                //添加流水
                $this->add_glide($top_user['id'],$users['id'],$repeat_money,$order_id,$goods_id,'复购奖佣金');
            }

        }
    }

    //添加流水
    public function add_glide($user_id,$source_uid,$moeny,$order_id,$goods_id,$desc){
        $data['uid'] = $user_id;
        $data['source_uid'] = $source_uid;
        $data['addtime']=date('Y-m-d H:i:s',time());
        $data['est_price'] = $moeny;
        $data['act_price'] = $moeny;
        $data['order_id'] = $order_id;
        $data['goods_id'] = $goods_id;
        $data['explain'] = $desc;
        //添加流水记录
        $res = M('glide')->add($data);
        return  $res;
    }

    //更新用户余额
    public function save_user_money($user_id,$money,$is_withdraw){
       $users = M('user')->where(array('id'=>$user_id))->find();
        $map['can_withdraw'] = $users['can_withdraw']+$money;
        if($money>0){
            $map['total'] = $users['total']+$money;
        }
        if($is_withdraw==1){
            $map['withdraw_old'] =  $users['withdraw_old'] + abs($money);
        }

        if($money<0&&$is_withdraw!=1){
            $map['total_money'] = $users['total_money'] + abs($money);
        }
        $res = M('user')->where(array('id'=>$user_id))->save($map);
        return  $res;
    }

    function get_daili($top_pid){
        $top_info = M('user')->where(array('id'=>$top_pid))->find();
        if($top_info['level_id']==2){
            return $top_info['id'];
            exit;
        }
        if(empty($top_info['top_id']))
        {
            return '';
            exit;
        }
        else
        {
            $c = $this->get_daili($top_info['top_id']);
        }
        if($c){
            return $c;
            exit;
        }
    }

    
}