<?php
/** * 随机生成字符串 */

function generateRandomString($length = 43) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';   
    for ($i = 0; $i < $length; $i++) {    
        $randomString .= $characters[rand(0, strlen($characters) - 1)];   
    }
    return $randomString; 
} 

function generateRandomString2($length = 32) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
    $randomString = '';   
    for ($i = 0; $i < $length; $i++) {    
        $randomString .= $characters[rand(0, strlen($characters) - 1)];   
    }
    return $randomString; 
} 
/*
 * 判断是否是微信打开
 * */
function isRequestedByWechat(){
    $ua = $_SERVER['HTTP_USER_AGENT'];
    return (strpos($ua, 'MicroMessenger') !== false) ? true : false;
}
/*
 * 获取数字与前缀
 * */
function findStr($str=''){
    $str=trim($str);
    if(empty($str)){return '';}
    $temp=array('1','2','3','4','5','6','7','8','9','0');
    $result='';
    $string='';
    for($i=0;$i<strlen($str);$i++){
        if(in_array($str[$i],$temp)){
            $result.=$str[$i];
        }else{
            $string.=$str[$i];
        }
    }
    return $string;
}

/*
 * 获取数字与前缀
 * */
function findNum($str=''){
    $str=trim($str);
    if(empty($str)){return '';}
    $temp=array('1','2','3','4','5','6','7','8','9','0');
    $result='';
    $string='';
    for($i=0;$i<strlen($str);$i++){
        if(in_array($str[$i],$temp)){
            $result.=$str[$i];
        }else{
            $string.=$str[$i];
        }
    }
    $data['goodsId'] = $result;
    if($string=='lsm'){
        $data['mall'] = 4;
    }else{
        $data['mall'] = 1;
    }
    return $data;
}
/*
 * 权益保障
 * */
function getGuarantee($array){
    $str = '';//http://ai.com/Public/Share/images/3/icon_sm_qgby.png
    if(!empty($array)){
        foreach($array as $v){
            if($v==1){
                $str .= '<li><img src="/Public/Share/images/icon_gouxuan.png"/>正品保证</li>';
            }
            if($v==2){
                $str .= '<li><img src="/Public/Share/images/icon_gouxuan.png"/>快速发货</li>';
            }
            if($v==3){
                $str .= '<li><img src="/Public/Share/images/icon_gouxuan.png"/>售后无忧</li>';
            }
        }
    }
    return $str;
}
/*
 * 获取url
 * */
function getUrl($type=1){
    $str = 'http://';
    if($type==1){
        if($_SERVER['SERVER_NAME']=='seller.aixiaoping.com'){
            $url = $str.$_SERVER['SERVER_NAME'].'/Home/Coupon/goods?goodsId='; # 爱小屏单品链接
        }else{
            $url = $str.$_SERVER['SERVER_NAME'].'/Share/Index/goods?goodsId='; # 爱小屏单品链接
        }
    }
    if($type==2){
        $url = $str.$_SERVER['SERVER_NAME'].'/Share/Index/fightGroups?typeId='; # 拼团链接
    }
    if($type==3){
        $url = $str.$_SERVER['SERVER_NAME'].'/Wechat/Store/goods?goodsId='; # 公众号单品链接
    }
    if($type==4){
        $url = $str.$_SERVER['SERVER_NAME'].'/Share/Index/groupsGoods?goodsId='; # 拼团单品
    }

    return $url;
}

/**
 ** @desc 封装 curl 的调用接口，post的请求方式
 **/
function http_curl($url,$type='get',$res='json',$arr=''){
    //初始化curl
    $ch = curl_init();
    //设置curl的参数
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    // post数据
    if($type=='post'){
        curl_setopt($ch, CURLOPT_POST, 1);
        // post的变量
        curl_setopt($ch, CURLOPT_POSTFIELDS, $arr);
    }
    //采集
    $output = curl_exec($ch);
    curl_close($ch);
    if($res=='json'){
        return json_decode($output,true);
    }
}





function jzy_sms($mobile,$openid){
    $random = rand(100000,999990);
    $sdkappid = 1400081514;
    $url = "https://yun.tim.qq.com/v5/tlssmssvr/sendsms?sdkappid=$sdkappid&random=$random";
    $time = time();
    $appkey = 'db9d1e5d73801badf79a0dca68bc0915';
    $sig=  hash("sha256","appkey=$appkey&random=$random&time=$time&mobile=$mobile");
    $code = $random;
     $arr = '{
        "ext": "",
        "extend": "",
        "msg": "您正在登陆验证，验证码'.$code.'，请于1分钟内按页面提示提交验证码！",
        "sig": "'.$sig.'",
        "tel": {
            "mobile": "'.$mobile.'",
            "nationcode": "86"
        },
        "time": '.$time.',
        "type": 0
    }';
    $message = http_curl($url, 'post', 'json', $arr);
    if($message['result']==0)
    {//发送成功
          $user_code = M('User')->where(array('isvalid'=>1,'user_openid'=>$openid))->find();
          if(empty($user_code))
          {
                 M('User')->add(array('isvalid'=>1,'user_openid'=>$openid));
          }
        $save['sms_code'] = $random;
        $save['sms_time'] = $time;
        $save_code = M('user')->where(array('user_openid'=>$openid,'isvalid'=>true))->save($save);
        if($save_code)
        {
            return 1;
        }
        else
        {
            return '-1,该账号尚未注册'.$save_code;
        }
    }
    else
    {
        return $message['result'];
    }

}

/*
     * 获取接口地址
     * */
function getIp(){
    $server = $_SERVER['SERVER_NAME'];
    if($server=='seller.aixiaoping.com' || $server=='xcx.aixiaoping.com'){
        $ip = 'http://www.aixiaoping.com:8080/aixiaopingAPI'; # 正式接口地址
    }else{
        $ip = '192.168.200.182:8080';# 海洋电脑
        //$ip = '192.168.200.152:8080';# 张璐电脑
        //$ip = 'http://www.aixiaoping.com:8080/aixiaopingAPI'; # 正式接口地址
    }
    return $ip;
}
function pddGetIp(){
    $server = $_SERVER['SERVER_NAME'];
    if($server=='axpys.aixiaoping.cn' || $server=='xcx.aixiaoping.com'){
        $ip = 'http://open.aixiaoping.cn:8080/open'; # 正式接口地址
    }else{
        // $ip = "http://47.104.210.139:8080/open";
        $ip = 'http://open.aixiaoping.cn:8080/open';
        //  $ip = '192.168.200.182:8080/open';# 海洋电脑
        //$ip = '192.168.200.152:8080/aixiaopingAPI';# 张璐电脑
        //$ip = 'http://www.aixiaoping.com:8080/aixiaopingAPI'; # 正式接口地址
    }
    return $ip;
}
function JdGetIp(){
    $server = $_SERVER['SERVER_NAME'];
    if($server=='axpys.aixiaoping.cn' || $server=='xcx.aixiaoping.com'){
        $ip = 'http://open.aixiaoping.cn:8080/open'; # 正式接口地址
    }else{
        // $ip = "http://47.104.210.139:8080/open";
        $ip = 'http://open.aixiaoping.cn:8080/open';
        //  $ip = '192.168.200.182:8080/open';# 海洋电脑
        //$ip = '192.168.200.152:8080/aixiaopingAPI';# 张璐电脑
        //$ip = 'http://www.aixiaoping.com:8080/aixiaopingAPI'; # 正式接口地址
    }
    return $ip;
}
/*
 * 封装 json
 * */
function return_pdd_jsons($client_id,$sign,$str){
    if(empty($str)){
        $data = json_encode(
            array(
                "client_id"=>"$client_id",
                "sign"=>"$sign",
            )
            ,JSON_UNESCAPED_UNICODE
        );
        return $data;
    }else{
        $data = json_encode(
            array(
                "client_id"=> "$client_id",
                "sign"=> "$sign",
                "data"=>$str,
            )
            ,JSON_UNESCAPED_UNICODE
        );
        return $data;
    }
}
/*
 * 获取商品详情数据
 * */
function getGoodsDetail($goodsDetail='',$type,$snapshotGoodsId){
    $str = '';
    if($type&&$snapshotGoodsId){
        $base = M('re_goodssnapshot')->where(array('id'=>$snapshotGoodsId,'isValid'=>1))->order('id desc')->field('baseGoodsId')->find();
        if(!empty($base)){
            $goodsDetail = M('re_goods_details')->where(array('good_id'=>$base['basegoodsid'],'isValid'=>1))->find();

        }
        $str .= $goodsDetail['content'];
    }else if($goodsDetail){
        foreach($goodsDetail as $k=>$v){
            if($v['detailType']=='picture'){
                //style="width: '.$v['pictureWidth'].';height: '.$v['pictureHeight'].';"
                $str .= '<img src="'.$v['picture'].'" style="width: 100%;">';
            }
            if($v['detailType']=='text'){
                $str .= '<div>'.$v['text'].'</div>';
            }
        }
    }
    return $str;
}

/*
 * UUID
 * */
function uuid() {
    if (function_exists ( 'com_create_guid' )) {
        return com_create_guid ();
    } else {
        mt_srand ( ( double ) microtime () * 10000 ); //optional for php 4.2.0 and up.随便数播种，4.2.0以后不需要了。
        $charid = strtoupper ( md5 ( uniqid ( rand (), true ) ) ); //根据当前时间（微秒计）生成唯一id.
        $hyphen = chr ( 45 ); // "-"
        $uuid = '' . //chr(123)// "{"
            substr ( $charid, 0, 8 ) . $hyphen . substr ( $charid, 8, 4 ) . $hyphen . substr ( $charid, 12, 4 ) . $hyphen . substr ( $charid, 16, 4 ) . $hyphen . substr ( $charid, 20, 12 );
        //.chr(125);// "}"
        return $uuid;
    }
}

/*
 * 对象转换成数组*/
function objectToArray($e){
    $e=(array)$e;
    foreach($e as $k=>$v){
        if( gettype($v)=='resource' ) return;
        if( gettype($v)=='object' || gettype($v)=='array' )
            $e[$k]=(array)objectToArray($v);
    }
    return $e;
}

/*
 * 商品类别
 * */
function type($data){
    $types = array(
        'childTypeId' => $data['id'],
        'childTypeName' => $data['name'],
        'parentTypeId' => $data['pid'],
        'parentTypeName' => $data['pname']
    );
    $type = json_encode($types);
    return $type;
}

/*
 * 商品标签
 * */
function lables($tag_id){
    if(!empty($tag_id)){
        $where['id'] = array('exp', "IN ({$tag_id})");
        $tagId = M('cashshop_goods_lable')->where($where)->field('id,name')->select();
        foreach($tagId as $v){
            $tags[] = array(
                'lableId' => intval($v['id']),
                'lableName' => $v['name'],
            );
        }
        $tag = json_encode($tags);
    }
    return $tag;
}

/*
 * 商品图片
 * */
function images($images){
    if(!empty($images)){
        $images = trim($images, ','); //去掉两端的逗号
        $img = explode(',', $images);//将字符串转换成数组

        $one[] = array(
            'imgUrl' => $img[0]
        );
        $first = json_encode($one); //将数组的第一个转换成json
        $allImg = Array();
        foreach ($img as $key => $value) {
            $allImg[]=Array('imgUrl'=>$value);
        }
        $all = json_encode($allImg);//将数组转换成json
    }
    return $all;
}

/*
 * 商品首页图
 * */
function image_url($url){
    if(!empty($url)){
        $img = json_decode($url, true);
        $image_url = $img[0]['imgUrl'];
        $Img = 'http://www.aixiaoping.com:8080/aixiaopingRes/'.$image_url;
    }else{
        $Img = 'http://'.$_SERVER['SERVER_NAME'].'/Public/Home/images/logo.png';
    }
    return $Img;
}
/*
 * 商品首页图
 * */
function coverPic($images){
    if(!empty($images)){
        $images = trim($images, ','); //去掉两端的逗号
        $img = explode(',', $images);//将字符串转换成数组

        $one[] = array(
            'imgUrl' => $img[0]
        );
        $first = json_encode($one); //将数组的第一个转换成json
    }
    return $first;
}

/*
 * 商家图标
 * */
function storeLogo($img){
    if(!empty($img)){
        if(strpos($img,'http://www.aixiaoping.com:8080') !== false){
            if($img == 'http://www.aixiaoping.com:8080/aixiaopingRes/' || $img == 'http://www.aixiaoping.com:8080/aixiaopingRes/http://www.aixiaoping.com:8080/aixiaopingRes/'){
                $Img = 'http://www.aixiaoping.com:8080/aixiaopingRes/upload-res/message_icon/1/nomal/6015511007081438819.png';
            }else{
                $Img = $img;
            }

        }else{
            if(strpos($img,'http://') !== false){
                $Img = $img;
            }else{
                $Img = 'http://www.aixiaoping.com:8080/aixiaopingRes/'.$img;
            }

        }
    }else{
        $Img = 'http://www.aixiaoping.com:8080/aixiaopingRes/upload-res/message_icon/1/nomal/6015511007081438819.png';
    }
    return $Img;
}

/*
 * 销毁session
 * */
function delSession(){
    session('Content', null);
    session('sellMall', null);
    session('scoreMall', null);
    session('killMall', null);
    session('ImgUrl', null);
    session('GoodsName', null);
    session('Type', null);
    session('Lables', null);
    session('Edit', null);
    session('standardDetails', null);
    session('parentStandard', null);
    session('From', null);
    session('Cid', null);
    session('Format', null);
    session('Sum', null);
    session('Format', null);
    session('Scope', null);
    session('Model',null);
}

/* 2017 3 15
    json_decode
*/
function json($data, $key){
    $arr = json_decode($data, true);
    $arr1 = array_column($arr, $key);
    $ids = implode(',', $arr1);
    return $ids;
}

/* md5 加密 */
function axp($user){
    if(empty($user)){
        $user = "";
    }
    $one = md5('axp'.$user);
    $time = str_replace(':','-',date('Y-m-d-H:i'));
    $two = md5($one.$time);
    return $two;
}

/*
 * 封装 json
 * */
function return_pdd_json($client_id,$sign,$str){
    if(empty($str)){
        $data = json_encode(
            array(
                "client_id"=>"$client_id",
                "sign"=>"$sign",
            )
        );
        return $data;
    }else{
        $data = json_encode(
            array(
                "client_id"=> "$client_id",
                "sign"=> "$sign",
                "data"=>$str,
            )
        );
        return $data;
    }
}
function return_jd_json($str){
    if(empty($str)){
        $data = json_encode(
            array(
            )
        );
        return $data;
    }else{
        $data = json_encode(
            array(
                "data"=>$str,
            )
        );
        return $data;
    }
}


//两时间相差天时分秒;
function get_timediff($begin_time,$end_time)
{
    $begin_time = strtotime($begin_time);

    $end_time = strtotime($end_time);
    if($begin_time < $end_time){
        $starttime = $begin_time;
        $endtime = $end_time;
    }else{
        $starttime = $end_time;
        $endtime = $begin_time;
    }
    //计算天数
    $timediff = $endtime-$starttime;
    $days = intval($timediff/86400);
    //计算小时数
    $remain = $timediff%86400;
    $hours = intval($remain/3600);
    //计算分钟数
    $remain = $remain%3600;
    $mins = intval($remain/60);
    //计算秒数
    $secs = $remain%60;
    //$res = array("day" => $days,"hour" => $hours,"min" => $mins,"sec" => $secs);
    return "{$days}天{$hours}时{$mins}分{$secs}秒";
}

/* 评价级别 */
function commImg($img = 0){
    $num = round($img);
    switch($num){
        case 1:
            $img = '1.png';
            break;
        case 2:
            $img = '2.png';
            break;
        case 3:
            $img = '3.png';
            break;
        case 4:
            $img = '4.png';
            break;
        case 5:
            $img = '5.png';
            break;
        case 6:
            $img = '6.png';
            break;
        case 7:
            $img = '7.png';
            break;
        case 8:
            $img = '8.png';
            break;
        case 9:
            $img = '9.png';
            break;
        default:
            $img = '10.png';
            break;
    }
    return $img;
}

/*
 * 时间转换
 * */
function dateTime($time){
    $time = explode('-',$time);
    $time = $time[0].'年'.$time[1].'月'.$time[2].'日';
    return $time;
}

/*
 * 支付回调 定时器
 * */
function checkReturn($data){
    ignore_user_abort();//关闭浏览器后，继续执行php代码
    set_time_limit(0);//程序执行时间无限制
    $sleep_time = 10;//多长时间执行一次
    $sum = 0;
    while(1){
        $sum += 1;
        if($sum >= 6){
            break;
        }else{
            $output = $this->http_curl($this->getIp()."/Zyly/Goods/webNotify?data=".$data);
            $msg = json_decode($output, true); //{"message":"请求成功","status":1}

            if(strlen($msg['status']) == 0){
                $msg=date("Y-m-d H:i:s").'----'.$sum.'----'.$output.PHP_EOL;
                file_put_contents("log.log",$msg,FILE_APPEND);//记录日志
                sleep($sleep_time);//等待时间，进行下一次操作。
            }else{
                break;
            }
        }
    }
    exit();
}

/* 获取活动领取红包幸运者
 * $tid 活动优惠券id
 * $admin_id 商家id
*/
function luckyHuman($aid, $admin_id, $limit){
    $red = M('adminuser_redpaper')->where(array('isvalid'=>1,'adminuserId'=>$admin_id,'activityId'=>$aid))->find();
    $redpaper = M('adminuser_redpaper_users_receive')->alias('red')
        ->join('users ON users.id=red.userid')
        ->where(array('red.isvalid'=>1,'red.redpaper'=>$red['id']))
        ->field('users.name,users.realname,users.imgUrl,users.headimage,red.money,red.createtime')
        ->order('red.id desc')
        ->limit($limit)
        ->select(); //23
    $redData = array();
    $sum = intval($red['totalquantity']) - intval($red['surplusquantity']);
    foreach($redpaper as $k=>$v){
        if(!empty($v['realname'])){
            $redData[$k]['name'] = $v['realname'];
        }else{
            $redData[$k]['name'] = $v['name'];
        }

        if(!empty($v['imgurl'])){
            $redData[$k]['images'] = 'http://www.aixiaoping.com:8080/aixiaopingRes/'.$v['imgurl'];
        }else{
            if(!empty($v['headimage'])&&strlen($v['headimage'])>49){
                $redData[$k]['images'] = $v['headimage'];
            }else{
                $redData[$k]['images'] = 'http://www.aixiaoping.com:8080/aixiaopingRes/upload-res/message_icon/1/nomal/6014510504124952819.png';
            }
        }

        $v['ranking'] = $sum;
        $m = date('m', strtotime($v['createtime'])); # 将活动结束时间转成时间戳格式
        $d = date('d', strtotime($v['createtime'])); # 将活动结束时间转成时间戳格式
        $time = date('H:i:s', strtotime($v['createtime'])); # 将活动结束时间转成时间戳格式
        $redData[$k]['createtime'] = $m.'/'.$d.' '.$time; # 活动结束时间

        $redData[$k]['ranking'] = $v['ranking'];
        $redData[$k]['time'] = $v['createtime'];
        $redData[$k]['content'] = $v['money'].'元红包';
        $redData[$k]['status'] = '购买者';
        $sum = intval($sum-1);
    }

    $map['activityId'] = $aid;
    $map['isvalid'] = 1;
    $map['score'] = array('gt',0);
    $score = M('user_coupons')->where($map)->order('id desc')->limit($limit)->select();
    $count = count($score);
    $scoreData = array();
    foreach($score as $k=>$v){
        $scoreData[$k]['name'] = $v['user_name'];
        $scoreData[$k]['images'] = $v['headimage'];
        $scoreData[$k]['images'] = $v['headimage'];

        $m = date('m', strtotime($v['createtime'])); # 将活动结束时间转成时间戳格式
        $d = date('d', strtotime($v['createtime'])); # 将活动结束时间转成时间戳格式
        $time = date('H:i:s', strtotime($v['createtime'])); # 将活动结束时间转成时间戳格式
        $scoreData[$k]['createtime'] =  $m.'/'.$d.' '.$time; # 活动结束时间

        $v['ranking'] = $count;
        $scoreData[$k]['ranking'] = $v['ranking'];
        $scoreData[$k]['time'] = $v['createtime'];
        $scoreData[$k]['content'] = $v['score'].'个积分';
        $scoreData[$k]['status'] = '领券者';

        $count = intval($count-1);
    }
    # 合并数组
    $data = array_merge($redData,$scoreData);
    $arr1 = array_map(create_function('$n', 'return $n["createtime"];'), $data);
    array_multisort($arr1,SORT_DESC,$data); # 将数组按照时间排序 desc
    return $data;
}


function isBit($type){
    if($type==1){
        $server =$_SERVER['SERVER_NAME'];
        if($server=='seller.aixiaoping.com' || $server=='xcx.aixiaoping.com'){
            return 1;
        }else{
            return '';
        }

    }else{
        return '';
    }
}

function cashRecord($data, $admin_id, $tid=0, $type){
    $map = array();
    $map['adminuserId'] = $admin_id;
    $map['beforepoint'] = doubleval($data['sellerMoney']);
    if($type==1){
        $map['afterpoint'] = doubleval(doubleval($data['sellerMoney']) - doubleval($data['redPrice']));
        $map['cashpoint'] = doubleval(-$data['redPrice']);
        $map['remark'] = '活动优惠券红包扣除';
    }else{
        $map['afterpoint'] = doubleval(doubleval($data['sellerMoney']) + doubleval($data['redPrice']));
        $map['cashpoint'] = doubleval($data['redPrice']);
        $map['remark'] = '活动优惠券红包剩余钱返回';
    }

    $map['type'] = 1;
    $map['createTime'] = date('Y-m-d H:i:s');
    $server =$_SERVER['SERVER_NAME'];
    if($server=='seller.aixiaoping.com' || $server=='xcx.aixiaoping.com'){
        $map['isValid'] = 1;
    }else{
        $map['isValid'] = '';
    }

    $map['goodName'] = ''.$tid.''; # 优惠券id

    $res = M('adminuser_cashpoint_record')->data($map)->add();

    return $res;
}

/* 商家logo 获取 */
function sellerData($sellerId,$type){
    $sellerData = M('seller')->join('seller_main_page main ON main.seller_id=seller.id')->where(array('seller.isvalid'=>'1','seller.id'=>$sellerId))->field('seller.name,seller.logo,seller.adminuser_id,seller.zoneId,main.seller_logo')->find();
    if($type==1){
        if($sellerData['seller_logo']=='http://www.aixiaoping.com:8080/aixiaopingRes/'||$sellerData['logo']=='http://www.aixiaoping.com:8080/aixiaopingRes/'){
            return '';
        }else{
            if(!empty($sellerData['seller_logo'])){
                return $sellerData['seller_logo'];
            }else{
                return $sellerData['logo'];
            }
        }

    }else{
        $data = array();
        $data['name'] = $sellerData['name'];
        $data['adminuser_id'] = $sellerData['adminuser_id'];
        $data['zoneid'] = $sellerData['zoneid'];
        if($sellerData['seller_logo']=='http://www.aixiaoping.com:8080/aixiaopingRes/'||$sellerData['logo']=='http://www.aixiaoping.com:8080/aixiaopingRes/'){
            $data['logo'] = '';
        }else{
            if(!empty($sellerData['seller_logo'])){
                $data['logo'] = $sellerData['seller_logo'];
            }else{
                $data['logo'] = $sellerData['logo'];
            }
        }
        //$seller = M('seller')->where(array('isvalid'=>'1','id'=>$ticket['sellerid']))->field('name,logo,adminuser_id,zoneId')->find();
        return $data;
    }

}

/*
 * get 参数加密
 * */
function encrypt1($plaintext) {
    $key = 'pansmaze';
    $iv = base64_decode("9XZ8QJAkaPo=");
    $td = mcrypt_module_open(MCRYPT_DES, '', MCRYPT_MODE_CBC, '');
    mcrypt_generic_init ($td, $key, $iv);
    $padLength = 8 - strlen($plaintext) % 8;
    $paddedText = str_pad($plaintext, strlen($plaintext)+$padLength, chr($padLength), STR_PAD_RIGHT);
    $encrypted_data = mcrypt_generic($td, $paddedText);
    mcrypt_generic_deinit ($td);
    mcrypt_module_close ($td);

    return base64_encode($encrypted_data);
}

/*
 * 参数解密
 * */
function decrypt1($ciphertext) {
    $key = 'pansmaze';
    $sencrypted_data = base64_decode($ciphertext);
    $iv = base64_decode("9XZ8QJAkaPo=");
    $td = mcrypt_module_open (MCRYPT_DES, '', MCRYPT_MODE_CBC, '');
    mcrypt_generic_init ($td, $key, $iv);
    $sdecrypted_data = mdecrypt_generic ($td, $sencrypted_data);
    mcrypt_generic_deinit ($td);
    mcrypt_module_close ($td);

    $last_ch=substr($sdecrypted_data,-1,1);
    $pad_count=ord($last_ch);
    $sdecrypted_data=substr($sdecrypted_data,0,strlen($sdecrypted_data)-$pad_count);
    return $sdecrypted_data;
}
/*$plaintext = '张美 霞';
$ciphertext = encrypt($plaintext);
echo '加密:'.encrypt($plaintext);
echo '解密：'.decrypt($ciphertext);exit;*/

//生成24位唯一订单号码，格式：YYYY-MMDD-HHII-SS-NNNN,NNNN-CC，其中：YYYY=年份，MM=月份，DD=日期，HH=24格式小时，II=分，SS=秒，NNNNNNNN=随机数，CC=检查码
//订购日期
function create_order_sn(){
    $order_date = date('Y-m-d');

    //订单号码主体（YYYYMMDDHHIISSNNNNNNNN）
   
    $order_id_main = date('YmdHis') . rand(10000000,99999999);
   
    //订单号码主体长度
   
    $order_id_len = strlen($order_id_main);
   
    $order_id_sum = 0;
   
    for($i=0; $i<$order_id_len; $i++){
   
    $order_id_sum += (int)(substr($order_id_main,$i,1));
   
    }
   
    //唯一订单号码（YYYYMMDDHHIISSNNNNNNNNCC）
   
    $order_id = $order_id_main . str_pad((100 - $order_id_sum % 100) % 100,2,'0',STR_PAD_LEFT);
    return $order_id;
}
 
#递归方法实现无限极分类
function getTree($pid=0,$list,$level=1) {
    static $tree = array();
    foreach($list as $row) { 
        if($row['mode10_top_pid']==$pid) {
            $row['user_level'] = $level;
            $tree[] = $row;
            getTree($list, $row['pid'], $level + 1);
        }
    }
    return $tree;
}


