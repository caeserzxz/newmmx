<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/swiper-3.4.0.min.css">
    <link rel="stylesheet" href="/Public/Zyly/css/index.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
</head>

<body>
    <div class="index-warp">
        <!-- 轮播 -->
        <div class="index-banner">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <?php if(is_array($banner)): $i = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
                            <img src="/Data/<?php echo ($vol["photo"]); ?>" alt="">
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <!-- 如果需要分页器 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>
    
        <!-- 通知 -->
        <!-- <div class="notice">
            <div class="notice-left">
                <img src="/Public/Zyly/images/laba@2x.png" alt="">
                <?php if(is_array($notice)): $i = 0; $__LIST__ = $notice;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><p><?php echo ($vol["title"]); ?></p><?php endforeach; endif; else: echo "" ;endif; ?>
               
            </div>
            <div class="notice-right">
                详情
            </div>
        </div> -->


        <div class="line"></div>

        <!-- 人气推荐 -->
        <div class="index-popular">
            <!-- <div class="popular-tit">
                <div class="popular-tit-left">
                    商品展示(横幅)
                </div>
                <div class="popular-tit-right">
                    <span>更多推荐</span>
                    <img src="/Public/Zyly/images/jiantou@2x.png" alt="">
                </div>
            </div> -->
            <div class="popular-cont">
                <?php if(is_array($goods)): $i = 0; $__LIST__ = $goods;if( count($__LIST__)==0 ) : echo "没有数据" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="popular-item clearfix" onclick="detail(<?php echo ($vol["id"]); ?>)">
                    <div class="item-left">
                        <img src="/Data/<?php echo ($vol["photo_x"]); ?>" alt="">
                    </div>
                    <div class="item-right">
                        <p class="item-right-tit">
                           <?php echo ($vol["name"]); ?>
                        </p>

                        <div class="item-oldPrice">
                            <p><?php echo ($vol["intro"]); ?></p>
                        </div>
                      `   
                        <div class="item-newPrice ">
                            <?php if($shop_type == 5): ?><div class="item-newPrice-left">
                                    <span><?php echo ($vol["price"]); ?>积分</span>
                                </div>
                            <?php else: ?>
                                <div class="item-newPrice-left">
                                    <img src="/Public/Zyly/images/lvyou@2x.png" alt="">
                                    <span>￥<?php echo ($vol["price"]); ?></span>
                                </div><?php endif; ?>
                            <div class="item-newPrice-right">

                                <span>销量:</span>
                                <span><?php echo ($vol["shiyong"]); ?></span>
                            </div>
                        </div>
                    </div>
                </div><?php endforeach; endif; else: echo "没有数据" ;endif; ?>
            </div>
        </div>

        <!-- <div class="line"></div> -->
        <!-- 正在加载 -->
        <!-- <div class="load">
            <div class="span-c3">
                <span></span>
                <span></span>
            </div>
            <p>正在加载更多...</p>
        </div> -->


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
        <!-- <div class="bottom clearfix">
            <div class="bottom-navItem bottom-navItem-act">
                <img src="/Public/Zyly/images/huiyuan@2x.png" alt="">
                <span>首页</span>
            </div>
            <div class="bottom-navItem">
                <img src="/Public/Zyly/images/huiyuan@2x.png" alt="">
                <span>分类</span>
            </div>
            
            <div class="bottom-navItem">
                <img src="/Public/Zyly/images/huiyuan@2x.png" alt="">
                <span>专题</span>
            </div>
            <div class="bottom-navItem">
                <img src="/Public/Zyly/images/huiyuan@2x.png" alt="">
                <span>个人中心</span>
            </div>
        </div> -->
    </div>
</body>

<script src="/Public/Zyly/js/swiper-3.4.2.jquery.min.js"></script>
<script>
    var appId = '<?php echo ($data["signPackage"]["appId"]); ?>';
    var timestamp = '<?php echo ($data["signPackage"]["timestamp"]); ?>';
    var nonceStr = '<?php echo ($data["signPackage"]["nonceStr"]); ?>';
    var signature = '<?php echo ($data["signPackage"]["signature"]); ?>';
    var shareTitle = '<?php echo ($data["shareTitle"]); ?>';
    var shareName = '<?php echo ($data["shareName"]); ?>';
    var shareUrl = '<?php echo ($data["shareUrl"]); ?>';
    var shareImg = '<?php echo ($data["shareImg"]); ?>';
</script>
<script type="text/javascript" src="/Public/Zyly/js/share1.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    var  shop_type = <?php echo ($shop_type); ?>;
    var mySwiper = new Swiper('.swiper-container', {
        autoplay: 1000,
        speed: 300,
        loop: true,
        // 如果需要分页器
        pagination: '.swiper-pagination',
        autoplayDisableOnInteraction : false,

    })
    function detail(id){
        location.href='<?php echo U("Goods/detail");?>?goods_id='+id+'&shop_type='+shop_type;
    }
    $('.imgurl').click(function () {
        var imgUrl = $(this).attr("data-imgUrl");
        if (imgUrl)
        {
            window.location.href = imgUrl;
        }
        else
        {
            
        }
    });
</script>

</html>