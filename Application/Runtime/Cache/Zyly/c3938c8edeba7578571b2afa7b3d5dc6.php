<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会员介绍</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/vip_introduction.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/swiper-3.4.2.jquery.min.js"></script>
</head>

<body>
    <div class="VIPIntroduction">
        <div class="VIPItem1">
            <div class="VIPItem1-tit">
                1.会员等级划分及介绍
            </div>
            <div class="VIPItem1-cont">
                会员级别共分为4个级别，分别为免费会员、<?php echo ($gold["level_name"]); ?>、<?php echo ($plat["level_name"]); ?>、<?php echo ($daim["level_name"]); ?>。会员级别由60天内消费金额决定，消费金额越高会员等级越高，享受的会员权益越大。会员级别由系统自动处理，无需申请。
            </div>
        </div>
        <div class="VIPItem2">
            <div class="VIPItem2-tit">
                2.会员等级所对应的消费
            </div>
            <div class="VIPItem2-cont">
                <div class="VIPItem2Box">
                    <img src="/Public/Zyly/images/4XING@2x.png" alt="">
                    <p>免费会员</p>
                    <p>0-<?php echo ($gold["level_price"]); ?></p>
                </div>
                <div class="VIPItem2Box">
                    <img src="/Public/Zyly/images/5XING@2x.png" alt="">
                    <p><?php echo ($gold["level_name"]); ?></p>
                    <p><?php echo ($gold["level_price"]); ?>-<?php echo ($plat["level_price"]); ?></p>
                </div>
                <div class="VIPItem2Box">
                    <img src="/Public/Zyly/images/6XING@2x.png" alt="">
                    <p><?php echo ($plat["level_name"]); ?></p>
                    <p><?php echo ($plat["level_price"]); ?>-<?php echo ($daim["level_price"]); ?></p>
                </div>
                <div class="VIPItem2Box">
                    <img src="/Public/Zyly/images/zuans@2x.png" alt="">
                    <p><?php echo ($daim["level_name"]); ?></p>
                    <p><?php echo ($daim["level_price"]); ?>以上</p>
                </div>
            </div>
        </div>
        <div class="VIPItem3">
            <div class="VIPItem3-tit">
                3.不同等级的会员有哪些特权？
            </div>
            <div class="VIPItem3-cont">
                <div class="VIPItem3Table">
                    <div class="VIPItem3-cont-top">
                        <p>权益</p>
                        <p>免费会员</p>
                        <p><?php echo ($gold["level_name"]); ?></p>
                        <p><?php echo ($plat["level_name"]); ?></p>
                        <p><?php echo ($daim["level_name"]); ?></p>
                    </div>
                    <div class="VIPItem3-cont-center">
                        <div>等级标识</div>
                        <div>
                            <img src="/Public/Zyly/images/4XING@2x.png" alt="">
                        </div>
                        <div>
                            <img src="/Public/Zyly/images/5XING@2x.png" alt="">
                        </div>
                        <div>
                            <img src="/Public/Zyly/images/6XING@2x.png" alt="">
                        </div>
                        <div>
                            <img src="/Public/Zyly/images/zuans@2x.png" alt="">
                        </div>
                    </div>
                    <div class="VIPItem3-cont-bottom">
                            <p>分佣周封顶</p>
                            <p>无分佣</p>
                            <p><?php echo ($gold["level_max_price"]); ?></p>
                            <p><?php echo ($plat["level_max_price"]); ?></p>
                            <p><?php echo ($daim["level_max_price"]); ?></p>
                    </div>
                </div>

            </div>
        </div>
    </div>
   
</body>

</html>