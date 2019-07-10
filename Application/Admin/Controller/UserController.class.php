<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends PublicController{

	//*************************
	// 普通会员的管理
	//*************************
	public function index(){
		$aaa_pts_qx=1;
		$type=$_GET['type'];
		$id=(int)$_GET['id'];
		$tel = trim($_REQUEST['tel']);
		$name = trim($_REQUEST['name']);

		$names=$this->htmlentities_u8($_GET['name']);
		//搜索
		$where="1=1";
		$name!='' ? $where.=" and uname like '%$name%'" : null;
		$tel!='' ? $where.=" and tel like '%$tel%'" : null;

		define('rows',20);
		$count=M('user')->where($where)->count(); 
		$rows=ceil($count/rows);

		$page=(int)$_GET['page'];
		$page<0?$page=0:'';
		$limit=$page*rows;
	
		//搜索用户的时候,要显示用户以及用户的粉丝
		if($name||$tel){
			$user=M('user')->where($where)->order('id desc')->limit($limit,rows)->find();
			$userlist=M('user')->where(array('top_id'=>$user['id']))->order('id asc')->limit($limit,rows)->select();
			array_unshift($userlist,$user);
			$count = M('user')->where(array('top_id'=>$user['id']))->count();
			$rows=ceil($count/rows);
			
		}else{
			$userlist=M('user')->where($where)->order('id desc')->limit($limit,rows)->select();
		}
		
		$page_index=$this->page_index($count,$rows,$page);
		foreach ($userlist as $k => $v) {
			$userlist[$k]['level_name'] = M('level')->where(array('id'=>$v['level_id']))->getField('level_name');
			$userlist[$k]['addtime']=date("Y-m-d H:i",$v['addtime']);
			if(!empty($v['top_id'])){
				$userlist[$k]['top_uname'] = M('user')->where(array('id'=>$v['top_id']))->getField('uname');
			}
		}
		//====================
		// 将GET到的参数输出
		//=====================
		$this->assign('name',$name);
		$this->assign('tel',$tel);

		//=============
		//将变量输出
		//=============
		$this->assign('page_index',$page_index);
		$this->assign('page',$page);
		$this->assign('userlist',$userlist);
		$this->display();	
	}
	
	
	//*************************
	//会员地址管理
	//*************************
	public function address(){
		// $aaa_pts_qx=1;
		$id=(int)$_GET['id'];
		if($id<1){return;}
		if($_GET['type']=='del' && $id>0 && $_SESSION['admininfo']['qx']==4){
		  $this->delete('address',$id);
		}
		//搜索
		$address=M('address')->where("uid=$id")->select();
		
	    //=============
		//将变量输出
		//=============
		$this->assign('address',$address);
		$this->display();
	}

	public function del()
	{
		$id = intval($_REQUEST['did']);
		$info = M('user')->where('id='.intval($id))->find();
		if (!$info) {
			$this->error('会员信息错误.'.__LINE__);
			exit();
		}

		$data=array();
		$data['del'] = $info['del'] == '1' ?  0 : 1;
		$up = M('user')->where('id='.intval($id))->save($data);
		if ($up) {
			$this->redirect('User/index',array('page'=>intval($_REQUEST['page'])));
			exit();
		}else{
			$this->error('操作失败.');
			exit();
		}
	}
	
	//删除用户
	public function del_user(){
		$id = I('id');
		$res = M('user')->where('id='.intval($id))->delete();
		if($res){
			$return['status'] = 1;
			$return['msg']  = '删除成功';
			$this->ajaxreturn($return);
		}else{
			$return['status'] = -1;
			$return['msg']  = '失败';
			$this->ajaxreturn($return);
		}
	}

	//会员等级列表
	public function level_list(){
		$list = M('level')->select();
		$this->assign('level_list',$list);
		$this->display();
	}

	//会员编辑
	public function level_edit(){
		if(IS_POST){
			$data = I('post.');
			$data['save_time'] = date('Y-m-d H:i:s',time());
			$res = M('level')->where(array('id'=>$data['id']))->save($data);
			if($res){
				$this->redirect('User/level_list');
				exit();
			}else{
				$this->error('操作失败.');
				exit();
			}
		}else{
			$id = I('id');
			$info = M('level')->where(array('id'=>$id))->find();
			$this->assign('info',$info);
			$this->display();
		}
	}

	//设置取消代理
	public function set_daili(){
		$id = I('id');
		$page = I('page');
		$type = I('type');
		$user = M('User')->where(array('id'=>$id))->find();
		if($type==1){
			$data['is_daili']=2;
		}else{
			$data['is_daili']=1;
		}
		$res = M('User')->where(array('id'=>$id))->save($data);
		if($res){
			$this->redirect('User/index');
			exit();
		}else{
			$this->error('操作失败.');
			exit();
		}
	}

	//代理列表
	public function daili(){
		$tel = trim($_REQUEST['tel']);
		$name = trim($_REQUEST['name']);

		$names=$this->htmlentities_u8($_GET['name']);
		//搜索
		
		define('rows',20);
		if(!empty($name)){
			$where['uname'] =array('like',"%$name%");
		}
		if(!empty($tel)){
			$where['tel'] = array('like',"%$tel%");
		}
	
		$where['is_daili'] =array('neq',1);
		$count=M('user')->where($where)->count();

		$rows=ceil($count/rows);

		$page=(int)$_GET['page'];
		$page<0?$page=0:'';
		$limit=$page*rows;
		
		$userlist = M('User')->where($where)->select();
		
		$page_index=$this->page_index($count,$rows,$page);
		foreach ($userlist as $k => $v) {
			$userlist[$k]['level_name'] = M('level')->where(array('id'=>$v['level_id']))->getField('level_name');
		}
		

	
		//====================
		// 将GET到的参数输出
		//=====================
		$this->assign('name',$name);
		$this->assign('tel',$tel);
		
		$this->assign('page_index',$page_index);
		$this->assign('page',$page);
		$this->assign('userlist',$userlist);
		$this->display();
	}

	//修改代理
	public function daili_edit(){
		if(IS_POST){
			$data = I('post.');
			// print '<pre>';
			// print_r($data );
			// print '</pre>';
			// exit();
			if($data['submit']=='驳回'){
				$data['is_daili'] = 1;
			}else{
				$data['is_daili'] = 2;
				//查找是否有代理
				
				if($data['daili_type']==1){//省代
					$daili_user = M('user')->where(array('daili_type'=>$data['daili_type'],'state_id'=>$data['provinceid']))->find();
					$error = "该省已存在代理";
				}else if($data['daili_type']==2){//市代
					$daili_user = M('user')->where(array('daili_type'=>$data['daili_type'],'city_id'=>$data['cityid']))->find();
					$error = "该市已存在代理";
				}else if($data['daili_type']==3){//区代
					$daili_user = M('user')->where(array('daili_type'=>$data['daili_type'],'area_id'=>$data['countryid']))->find();
					$error = "该区/县已存在代理";
				}
				if($daili_user){
					$this->error("$error");
					exit();
				}
			}
	
			$provinceid = $data['provinceid'];//省
			$cityid = $data['cityid'];//市
			$countryid =$data['countryid'];//区
			$data['state'] = M('province')->where(array('id'=>$provinceid))->getField("name");
			$data['city'] = M('province')->where(array('id'=>$cityid))->getField("name");
			$data['area'] = M('province')->where(array('id'=>$countryid))->getField("name");
			if($provinceid==-10 ||$cityid==-10||$countryid==-10){
				unset($data['state']);
				unset($data['city']);
				unset($data['area']);
			}

			$data['save_time'] = date('Y-m-d H:i:s',time());
			$res = M('User')->where(array('id'=>$data['id']))->save($data);
			if($res){
				$this->redirect('User/daili');
				exit();
			}else{
				$this->error('操作失败.');
				exit();
			}
		}else{
			$id = I('id');
			$page = I('page');
			$info = M('User')->where(array('id'=>$id))->find();
			$province =M('province')->where(array('level'=>1))->select();
			$this->assign('province',$province);
			$this->assign('info',$info);
			$this->assign('page',$page);
			$this->display();
		}
	}

	//获取下属地理位置
    public function getChildren(){
        if(IS_AJAX){
            $id = intval(I("id"));
            $model = M("province");
            $area = $model->field("id,name")->where($where=array("parentId"=>$id))->select();
            $this->ajaxReturn(json_encode($area));
        }
    }

	//修改会员等级
	public function user_level_edit(){
		if(IS_POST){
			$id = I('id');
			$level_id = I('level_id');
			$save['save_time'] = date("Y-m-d H:i:s",time());
			$save['level_id'] = $level_id;
			$res = M('user')->where(array('id'=>$id))->save($save);
			if($res){
				$this->redirect('User/index');
				exit();
			}else{
				$this->error('操作失败.');
				exit();
			}
		}else{
			$id = I('id');
			$users = M('user')->where(array('id'=>$id))->find();
			$this->assign('users',$users);
			$this->display();
		}
	}

	//商城等级
	public function shop_list(){
		$shop = M('shop_type')->select();
		$this->assign('shop',$shop);
		$this->display();
	}

	//修改商城分佣
	public function shop_edit(){
		if(IS_POST){
			$data = $_POST;
			$save['shop_name'] = $data['shop_name'];
			$save['one_into'] = $data['one_into'];
			$save['two_into'] = $data['two_into'];
			$save['three_into'] =$data['three_into'];
			$save['daili_into'] =$data['daili_into'];
			$res = M('shop_type')->where(array('id'=>$data['id']))->save($save);
			if($res){
				$this->redirect('User/shop_list');
				exit();
			}else{
				$this->error('操作失败.');
				exit();
			}
		}else{
			$id = I('id');
			$shop = M('shop_type')->where(array('id'=>$id))->find();
			$this->assign('shop',$shop);
			$this->display();
		}
	}

}