<?php
namespace Admin\Controller;
use Think\Controller;
class MenuController extends PublicController{
    private $appid = '';  #公众号的id
    private $secret = ''; # 公众号的secret
    private $mchid='';
    private $mchkey='';
    public $imgUrl;
    private $admin =array();
    public $display='';

	 public function __construct()
    {
        parent::__construct(); 
        $admin=M('wechat_config')->where(array('id'=>1))->find();
        $this->admin = $admin; 

        $this->appid = $admin['wx_appid'];
        $this->secret = $admin['wx_secet'];
        $this->mchid =$admin['wx_mchid'];
        $this->mchkey = $admin['wx_mchkey'];

        // $a = ACTION_NAME.'.html';//当前方法名称
        // $nav = str_replace("$a","nav", $path);
        // $nav = str_replace("Menu","Admins", $nav);
        // $this->assign('nav', $nav);
        // $this->appid =C('PDD_APPID');
        // $this->secret =C('PDD_SECRET');
        // $models=logic('Admins');
        // $models->isLogin();
        // $models->get_nav();
        // $models->checkauth();
       
    }

	//菜单列表
    public function menu_list(){
        $data = M('weixin_menu')->where(array('isvalid'=>1,'pid'=>0))->select();
        $datas = array();
        $sons = array();
        foreach($data as $k=>$v){
            $datas[$k]['id'] = $v['id'];
            $datas[$k]['name'] = $v['name'];
            $datas[$k]['type'] = $v['type'];
            if($v['type']=='view'){
                if(strlen($v['url'])>80){
                    $url = substr( $v['url'],0,80).'...';
                }else{
                    $url = $v['url'];
                }
                $datas[$k]['str'] = $url;
            }else{
                $datas[$k]['str'] = $v['key'];
            }

            $son = M('weixin_menu')->where(array('isvalid'=>1,'pid'=>$v['id']))->select();
            foreach ($son as $key=>$val) {
                $sons[$key]['id'] = $val['id'];
                $sons[$key]['name'] = $val['name'];
                $sons[$key]['type'] = $val['type'];
                if($val['type']=='view'){
                    if(strlen($val['url'])>80){
                        $url = substr( $val['url'],0,80).'...';
                    }else{
                        $url = $val['url'];
                    }
                    $sons[$key]['str'] = $url;
                }else{
                    $sons[$key]['str'] = $val['key'];
                }
            }
            $datas[$k]['son'] = $sons;
            $sons = array();
        }
        // $admin_id = session('admin_id') ? session('admin_id') : 0 ;
        // $this->assign('admin_id', $admin_id);
        $this->assign('data',$datas);
        $this->display();
       
    }

//设置菜单
    public function create_menu(){
        $admin=$this->admin;
        header('content-type:text/html;charset=utf-8');
        $ids=I('ids');
        $ids=explode(",", $ids);
        $arr=array();
        $top=array();
        $a=0;
        foreach ($ids as $k => $v) {
            $menus=M('Weixin_menu')->where(array('id'=>$v))->find();
            $arr[$k]=$menus;
            $tops=M('Weixin_menu')->where(array('id'=>$v,'pid'=>0))->find();
            if($tops){
                $top[$a]=$tops;
                $a++;
            }
        }
        $num=0;
        $par='';
        foreach ($top as $k => $v) {
            if($v['type']=='menu'){
                $json=json_decode($v['json']);
                $parent=objectToArray($json);
                foreach ($arr as $i => $j) {
                   if($j['pid']==$v['id']){
                        if($j['type']=='view'){
                           $send['type']=$j['type'];
                           $send['name']=$j['name'];
                           $send['url']=$j['url'];
                        }else if($j['type']=='click'){
                           $send['type']=$j['type'];
                           $send['name']=$j['name'];
                           $send['key']=$j['key'];
                        }else if($j['type'] == 'miniprogram'){
                           $send['type']=$j['type'];
                           $send['name']=$j['name'];
                           $send['url']=$j['url'];
                           $send['appid']=$j['appid'];
                           $send['pagepath']=$j['pagepath'];
                        }   
                     $parent['sub_button'][$num]=$send;
                     $num++;
                   }
                }
                $num=0;
                $json_send=json_encode($parent,JSON_UNESCAPED_UNICODE);
            }else{
                $json_send=$v['json'];
            }
            if($par==''){
                $par=$json_send;
            }else{
                $par=$par.','.$json_send;
            }
           
        }

        $index =D('Index');
        $admin_id = $admin['id']; 
        //创建微信菜单
        $par=ltrim($par, ",");
        $postJson = '{"button":['.$par.']}';
        $res = $index->createMenu($admin_id,$postJson);
        $this->ajaxReturn($res);
    }
    //添加菜单
    public function menu_add(){
        // $admin=$this->admin;
        if(IS_POST){
            $data=I('post.');
            $is_exist = M('Weixin_menu')->where(array('name'=>$data['name']))->find();
            if($is_exist){
                $return['status']=-1;
                $return['msg']='菜单名已存在';
                $this->ajaxReturn($return);
            }
          
            if($data['type']=='view'){
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","url":"'.$data['url'].'"}';
            }else if($data['type'] == 'menu'){
                $json='{"name":"'.$data['name'].'","sub_button":[]}';
            }else if($data['type'] == 'click'){
                $data['cate']=1;
                $is_key = M('Weixin_menu')->where(array('key'=>$data['name']))->find();
                if($is_key){
                    $return['status']=-1;
                    $return['msg']='菜单名与其他关键字冲突';
                    $this->ajaxReturn($return);
                }
                $data['key'] = $data['name'];
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","key":"'.$data['name'].'"}';
            }else if($data['type']=='miniprogram'){
                $data['url'] = $data['min_url'];
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","url":"'.$data['url'].'","appid":"'.$data['appid'].'","pagepath":"'.$data['pagepath'].'"}';
            }else if($data['type']=='image_text'){
                $is_key = M('Weixin_menu')->where(array('key'=>$data['name']))->find();
                if($is_key){
                    $return['status']=-1;
                    $return['msg']='菜单名与其他关键字冲突';
                    $this->ajaxReturn($return);
                }
                 
                $data['key'] = $data['name'];
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","key":"'.$data['name'].'"}';
                $data['type']='click';
                $data['cate']=2;
                $image =$_FILES['text_img'];

                if($image['name']){
                    $image_path = '/data/uploadfiles/menu_img/';
                    $logo_img = $this->upload_img($image,$image_path);
                    $data['img_url'] = 'http://'.$_SERVER['HTTP_HOST'].$logo_img;
                }
                $data['url'] = $data['image_url'];
                $data['content'] =$data['image_content'];
            }
           
            $data['isvalid']=1;
            $data['json']=$json;
            $data['create_time']=date('Y-m-d_H:i:s',time());
            if(empty($data['pid'])){
                $data['level']=1;
                $dada['pid']=0;
            }else{
                $data['level']=2;
                $dada['pid']=$data['pid'];
            }
          
            $res=M('Weixin_menu')->add($data);
            if($res){
                $return['status']=1;
                $return['msg']='添加菜单成功';
                $this->ajaxReturn($return);
            }else{
                $return['status']=-1;
                $return['msg']='添加菜单失败';
                $this->ajaxReturn($return);
            }
           
        }else{
            $id=I('id');
            $menus=M('Weixin_menu')->where(array('id'=>$id))->find();
            // $admin_id = session('admin_id') ? session('admin_id') : 0 ;
            // $this->assign('admin_id', $admin_id);
            $this->assign('menus',$menus);
            $this->display(); 
        }
       
    }

    //修改菜单
    public function menu_save(){
        if(IS_POST){
            $data=I('post.');
            $is_exist = M('Weixin_menu')->where(array('name'=>$data['name'],'id'=>array('neq',$data['id'])))->find();
            if($is_exist){
                $return['status']=-1;
                $return['msg']='菜单名已存在';
                $this->ajaxReturn($return);
            }
            if($data['type']=='view'){
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","url":"'.$data['url'].'"}';
            }else if($data['type']=='menu'){
                $json='{"name":"'.$data['name'].'","sub_button":[]}';
            }else if($data['type'] == 'click'){
                $data['cate']=1;
                $is_key = M('Weixin_menu')->where(array('key'=>$data['name'],'id'=>array('neq',$data['id'])))->find();
                if($is_key){
                    $return['status']=-1;
                    $return['msg']='菜单名与其他关键字冲突';
                    $this->ajaxReturn($return);
                }
                $data['key'] = $data['name'];
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","key":"'.$data['name'].'"}';
            }else if($data['type']=='miniprogram'){
                $data['url'] = $data['min_url'];
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","url":"'.$data['url'].'","appid":"'.$data['appid'].'","pagepath":"'.$data['pagepath'].'"}';
            }else if($data['type']=='image_text'){
                $is_key = M('Weixin_menu')->where(array('key'=>$data['name'],'id'=>array('neq',$data['id'])))->find();
                if($is_key){
                    $return['status']=-1;
                    $return['msg']='菜单名与其他关键字冲突';
                    $this->ajaxReturn($return);
                }
                $data['key'] = $data['name'];
                $json='{"type":"'.$data['type'].'","name":"'.$data['name'].'","key":"'.$data['name'].'"}';
                $data['type']='click';
                $data['cate']=2;
                $image =$_FILES['text_img'];
                
                if($image['name']){
                    $image_path = '/data/uploadfiles/menu_img/';
                    $logo_img = $this->upload_img($image,$image_path);
                    $data['img_url'] = 'http://'.$_SERVER['HTTP_HOST'].$logo_img;
                }
                $data['url'] = $data['image_url'];
                $data['content'] =$data['image_content'];
            }

            $data['json']=$json;
            $data['save_time']=date('Y-m-d_H:i:s',time());
            
            $res=M('Weixin_menu')->where(array('id'=>$data['id']))->save($data);
            if($res){
                $return['status']=1;
                $return['msg']='修改菜单成功';
                $this->ajaxReturn($return);
            }else{
                $return['status']=-1;
                $return['msg']='修改菜单失败';
                $this->ajaxReturn($return);
            }
        }else{
            $id=I('id');
            $menus=M('Weixin_menu')->where(array('id'=>$id))->find();
            if($menus['type']=='click'&&$menus['cate']==2){
                $menus['type']='image_text';
            }
            if($menus['type'] == 'miniprogram'){
                $menus['min_url'] = $menus['url'];
            }
           
            // $admin_id = session('admin_id') ? session('admin_id') : 0 ;
            // $this->assign('admin_id', $admin_id);
            $this->assign('menus',$menus);
            $this->display();
        }
    }

    //删除菜单
    public function menu_del(){
        $id=I('id');
        $res=M('Weixin_menu')->where(array('id'=>$id))->delete();
        if($res){
            $return['status']=1;
            $return['msg']='删除菜单成功';
            $this->ajaxReturn($return);
        }else{
            $return['status']=-1;
            $return['msg']='删除菜单成功';
            $this->ajaxReturn($return);
        }
    }
}