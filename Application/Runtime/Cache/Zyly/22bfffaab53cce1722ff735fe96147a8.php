<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的粉丝</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/myFan.css">
</head>

<body>
    <div class="myFan">
    <?php if(is_array($fance_list)): $i = 0; $__LIST__ = $fance_list;if( count($__LIST__)==0 ) : echo "暂无粉丝" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="myFanItem">
            <div class="myFanItem-left">
                <div class="myFanItem-left-img">
                    <img src="<?php echo ($vol["photo"]); ?>" alt="">
                </div>
                <div class="myFanItem-left-fanInfo">
                    <div class="fanName"><?php echo ($vol["uname"]); ?></div>
                    <div class="fanTime">
                        <span><?php echo ($vol["city"]); ?></span>&nbsp;
                        <span>注册时间:<?php  echo date("Y-m-d H:i:s",$vol['addtime'])?></span>
                    </div>
                </div>
            </div>
            <div class="myFanItem-right">
                <p>订单:<?php echo ($vol["order_num"]); ?>单</p>
                <p>粉丝:<?php echo ($vol["fance_num"]); ?>个</p>
            </div>
        </div><?php endforeach; endif; else: echo "暂无粉丝" ;endif; ?>
        <!-- <div class="load">
            <div class="span-c3">
                <span></span>
                <span></span>
            </div>
            <p>正在加载更多...</p>
        </div> -->
    </div>
</body>

</html>