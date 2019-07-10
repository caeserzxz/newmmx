<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会员中心</title>
    <link href="/Public/Zyly/css/swiper-3.4.0.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/memberCenter.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js" ></script>
    <script src="/Public/Zyly/js/swiper-3.4.0.min.js"></script>
    <script src="/Public/Zyly/js/layer-v3.1.1/layer/layer.js"></script>
</head>

<body>
    <div class="memberCenter">
        <div class="topBox">
            <div class="exmIcon">
                <i class="detail"></i>
            </div>
            <div class="headBox">
                <img src="<?php echo ($users["photo"]); ?>" alt="">
            </div>
            <div class="nameBox">
                <span><?php echo ($users["uname"]); ?></span>
            </div>

            <div class="levBox">
                <div class="levItem">
                    <?php if($users['level_id'] == 0): ?><img src="/Public/Zyly/images/sijiaox1@2x.png" alt="">
                    <?php else: ?>
                        <img src="/Public/Zyly/images/sijiaox@2x.png" alt=""><?php endif; ?>
                    <span>免费会员</span>
                </div>
                <div class="levItem">
                    <?php if($users['level_id'] == 1): ?><img src="/Public/Zyly/images/wujiaox1@2x.png" alt="">
                    <?php else: ?>
                        <img src="/Public/Zyly/images/wujiaox@2x.png" alt=""><?php endif; ?>
                    <span>黄金会员</span>
                </div>
                <div class="levItem">
                    <?php if($users['level_id'] == 2): ?><img src="/Public/Zyly/images/liujiaox1@2x.png" alt="">
                    <?php else: ?>
                        <img src="/Public/Zyly/images/liujiaox@2x.png" alt=""><?php endif; ?>
                    <span>白金会员</span>
                </div>
                <div class="levItem">
                    <?php if($users['level_id'] == 3): ?><img src="/Public/Zyly/images/zuans1@2x.png" alt="">
                    <?php else: ?>
                        <img src="/Public/Zyly/images/zuans222@2x.png" alt=""><?php endif; ?>
                    <span>钻石会员</span>
                </div>
                <div class="sbBtn" >
                    <span>会员介绍</span>
                </div>
            </div>

        </div>
        <div class="line"></div>
        <div class="line"></div>
        <div class="botBox">
            <div class="botBox-tit">
                <p>我的特权</p>
            </div>
            <div class="tqBox">
                <!-- <div class="tqBoxItem">
                    <img src="/Public/Zyly/images/byfy@2x.png" alt="">
                    <span>白银分佣</span>
                </div> -->
                <div class="tqBoxItem" id="tqBoxItem">
                    <img src="/Public/Zyly/images/hjfy@2x.png" alt="">
                    <?php if($users['level_id'] == 0): ?><span>暂无分佣</span>  
                    <?php elseif($users['level_id'] == 1): ?>
                        <span>黄金分佣</span>   
                    <?php elseif($users['level_id'] == 2): ?>
                        <span>白金分佣</span>
                    <?php elseif($users['level_id'] == 3): ?>
                        <span>钻石分佣</span><?php endif; ?>
                </div>
                <div class="tqBoxItem" onclick="one_into(2);">
                    <img src="/Public/Zyly/images/wujiaox1@2x.png" alt="">
                    <span>黄金商城</span>
                </div>
                <div class="tqBoxItem" onclick="two_into(3);">
                    <img src="/Public/Zyly/images/liujiaox1@2x.png" alt="">
                    <span>白金商城</span>
                </div>
                <div class="tqBoxItem" onclick="three_into(4);">
                    <img src="/Public/Zyly/images/zuans1@2x.png" alt="">
                    <span>钻石商城</span>
                </div>
                <div class="tqBoxItem" onclick="jifen(5);">
                    <img src="/Public/Zyly/images/hytj@2x.png" alt="">
                    <span>积分商城</span>
                </div>
                <div class="tqBoxItem no">
                    <img src="/Public/Zyly/images/tejia@2x.png" alt="">
                    <span>会员特价</span>
                </div>
                <div class="tqBoxItem no">
                    <img src="/Public/Zyly/images/pingjia2@2x.png" alt="">
                    <span>评价奖励</span>
                </div>
                <div class="tqBoxItem no">
                    <img src="/Public/Zyly/images/qiandao@2x.png" alt="">
                    <span>签到奖励</span>
                </div>
                <div class="tqBoxItem no">
                    <img src="/Public/Zyly/images/shengri@2x.png" alt="">
                    <span>生日礼包</span>
                </div>
                <div class="tqBoxItem no">
                    <img src="/Public/Zyly/images/huodong@2x.png" alt="">
                    <span>专享活动</span>
                </div>
            </div>
        </div>
    </div>
    <div class="mark"></div>
    
    <div class="hideBox">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <i class="closeIcon"></i>
                    <img src="/Public/Zyly/images/zxhd@2x.png" alt="">
                    <div class="itemName">
                        <span>黄金分佣</span>
                    </div>
                    <p>每周收入封顶<?php echo ($gold["level_max_price"]); ?></p>
                </div>
                <div class="swiper-slide">
                    <i class="closeIcon"></i>
                    <img src="/Public/Zyly/images/zxhd@2x.png" alt="">
                    <div class="itemName">
                        <span>白金分佣</span>
                    </div>
                    <p>每周收入封顶<?php echo ($plat["level_max_price"]); ?></p>
                </div>
                <div class="swiper-slide">
                    <i class="closeIcon"></i>
                    <img src="/Public/Zyly/images/zxhd@2x.png" alt="">
                    <div class="itemName">
                        <span>钻石分佣</span>
                    </div>
                    <p>每周收入封顶<?php echo ($daim["level_max_price"]); ?></p>
                </div>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination"></div>
        </div>
    </div>

 <!-- 底部导航 -->
  <!-- 底部导航 -->
 <div class="bottom clearfix" >
    <div class="bottom-navItem <?php if($cont =='Goods'){echo 'bottom-navItem-act';}?> localurl " data-url="Goods/index">
        <?php if($cont == 'Goods'): ?><img src="/Public/Zyly/images/index2ik@2x.png" alt="">
        <?php else: ?>
            <img src="/Public/Zyly/images/index1ik@2x.png" alt=""><?php endif; ?>
        <span>首页</span>
    </div>
    <!--<div class="bottom-navItem <?php if($cont =='Map'){echo 'bottom-navItem-act';}?> localurl " data-url="Map/map">-->
        <!--<?php if($cont == 'Map'): ?>-->
            <!--<img src="/Public/Zyly/images/map2ik@2x.png" alt="">-->
        <!--<?php else: ?>-->
            <!--<img src="/Public/Zyly/images/map1ik@2x.png" alt="">-->
        <!--<?php endif; ?>-->
        <!--<span>代理</span>-->
    <!--</div>-->
    <!---->
    <!--<div class="bottom-navItem  <?php if($cont =='Vip'){echo 'bottom-navItem-act';}?> localurl " data-url="Vip/memberCenter">-->
        <!--<?php if($cont == 'Vip'): ?>-->
            <!--<img src="/Public/Zyly/images/vip2ik@2x.png" alt="">-->
        <!--<?php else: ?>-->
            <!--<img src="/Public/Zyly/images/vip1ik@2x.png" alt="">-->
        <!--<?php endif; ?>-->
        <!--<span>会员</span>-->
    <!--</div>-->
    <div class="bottom-navItem <?php if($cont =='Person'){echo 'bottom-navItem-act';}?> localurl"  data-url="person/person">
        <?php if($cont == 'Person'): ?><img src="/Public/Zyly/images/person2ik@2x.png" alt="">
        <?php else: ?>
            <img src="/Public/Zyly/images/person1ik@2x.png" alt=""><?php endif; ?>
        <span>我的</span>
    </div>
</div>

<script>
    $(function(){
        $('.localurl').click(function(){
            var url = $(this).attr('data-url');
            window.location.href = "/index.php/Zyly/"+url;
        }); 
    })
</script>

    <script>
        var mySwiper = new Swiper('.swiper-container', {
            // 如果需要分页器
            pagination: '.swiper-pagination',
        })
    </script>
</body>
<script>
var levels = '<?php echo ($users["levels"]); ?>';
    $(function () {
        $(".hideBox").hide();
        $(".closeIcon").click(function () {
            $(".mark").hide();
            $(".hideBox").hide();
        });
        $("#tqBoxItem").click(function () {
            $(".mark").show();
            $(".hideBox").show();
        });
        $('.no').click(function(){
            layer.msg('敬请期待',{time:1500});
            return;
        })
        $('.sbBtn').click(function(){
            location.href='<?php echo U("Vip/vip_introduction");?>';
        })
        $('.detail').click(function(){
            location.href='<?php echo U("Vip/vip_introduction");?>';
        })
    });

    //黄金商城
    function one_into(shop_type){
        if(levels<1||levels=='putong'){
            layer.msg('您不是黄金会员');
        }else{
            location.href='<?php echo U("Goods/index","shop_type=2");?>';
        }
    }
    //白金商城
    function two_into(shop_type){
        if(levels<2||levels=='putong'){
            layer.msg('您不是白金会员');
        }else{
            location.href='<?php echo U("Goods/index","shop_type=3");?>';
        }
    }
    //钻石商城
    function three_into(shop_type){
        if(levels<3||levels=='putong'){
            layer.msg('您不是钻石会员');
        }else{
            location.href='<?php echo U("Goods/index","shop_type=4");?>';
        }
    }
    //积分商城
    function jifen(shop_type){
        if(levels<1||levels=='putong'){
            layer.msg('您不是黄金会员');
        }else{
            location.href='<?php echo U("Goods/index","shop_type=5");?>';
        }
    }
</script>
</html>