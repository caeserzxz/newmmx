<?php
function setnav($a=''){
    $c = CONTROLLER_NAME;//当前控制器名称
    if(empty($a))
    {
    $a = ACTION_NAME;//当前方法名称   
    }
    
    $file_name = C('DATA_FILE_NAME');
    $dis_url = './Application/Zyly/View/Common/nav.html';
    return $dis_url;
}


/**
 * 上传图片
 * @param string $file
 */
function Logic($model = null, $base_path = null){
        $admin=M('admin')->where(array('realm_name'=>$_SERVER['SERVER_NAME']))->find();
        if($admin['version']>1)
        {
        $version = $admin['version'];
        }
        else
        {
        $version = 'Pdd';   
        }
    $data_file_name =C('DATA_FILE_NAME');
    static $_cache = array();
    $cache_key = $model.'.'.$base_path;
    if (!is_null($model) && isset($_cache[$cache_key])) return $_cache[$cache_key];
    $base_path = $base_path == null ? './data' : $base_path;
    $file_name = $base_path.'/'.$data_file_name.'/'.$version.'/Controller/'.$model.'Controller.class.php';
    $class_name = $model.'Controller';
    if (!file_exists($file_name)){
            $error = 'Contro Error:  Class '.$class_name.' is not exists!';
            throw_exception($error);
    }else{
        require_once($file_name);
        if (!class_exists($class_name)){
            $error = 'Contro Error:  Class '.$class_name.' is not exists!';
            throw_exception($error);
        }else{
            return $_cache[$cache_key] = new $class_name();
        }
    }
}


function uploadImg($file) {
    $upload = new \Think\Upload(); // 实例化上传类
    $upload->maxSize = 3145728; // 设置附件上传大小
    $upload->exts = array('jpg', 'gif', 'png', 'jpeg'); // 设置附件上传类型
    $upload->rootPath = './Public/Uploads/Wechat/'; // 设置附件上传根目录
    // 上传单个文件
    $info = $upload->uploadOne($file);
    if (!$info) {// 上传错误提示错误信息
        return '上传错误';
    } else {// 上传成功 获取上传文件信息
        return __ROOT__.'/Public/Uploads/Wechat/' . $info['savepath'] . $info['savename'];
    }

}



function PddSign($parameter,$secret)
{
ksort($parameter);
$str = $secret;
foreach ($parameter as $k => $v) {
    $str.=$k.$v;

}
$str.=$secret;
$strs = MD5($str);
return strtoupper($strs);
}

//计算多长时间以前
    function time_trans($the_time){
        $now_time = time();
        $show_time = strtotime($the_time);

        $dur = $now_time - $show_time;

        if($dur < 60){
            return $dur.'秒前';
        }else if($dur < 3600){
            return floor($dur/60).'分钟前';
        }else if($dur < 86400) {
            return floor($dur/3600).'小时前';
        }else if($dur < 259200) {//3天内
            return floor($dur / 86400) . '天前';
        }else{
            return $the_time;
        }
    }




