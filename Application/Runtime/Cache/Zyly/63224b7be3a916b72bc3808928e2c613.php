<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/personal.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
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
</head>

<body>
    <div class="personal">
        <div class="userInfo" onclick="info();">
            <div class="userInfo-left">
                <div class="userInfo-left-img">
                    <img src="<?php echo ($userInfo["photo"]); ?>" alt="">
                </div>
                <div class="userInfo-left-name">
                    <p><?php echo ($userInfo["uname"]); ?></p>
                    <?php if($userInfo["level_id"] == 0): ?><span>普通用户</span>
                    <?php elseif($userInfo["level_id"] == 1): ?>
                        <span>联创会员</span>
                    <?php elseif($userInfo["level_id"] == 2): ?>
                        <span>合伙人</span><?php endif; ?>
                    
                </div>
            </div>
            <div class="userInfo-right" onclick="info();">
            <span>完善会员资料</span>
                <img src="/Public/Zyly/images/jiantou@2x.png" alt="">
            </div>
        </div>
        <div class="jfBox">
            <div onclick="rewardDetail();" class="jf-item">
                <p>今日收入</p>
                <span><?php echo ($money["today_order_money"]); ?></span>
            </div>
            <div onclick="rewardDetail();" class="jf-item">
                <p>今日订单</p>
                <span><?php echo ($money["today_order_num"]); ?></span>
            </div>
            <div class="jf-item" onclick="wallet();">
                <p>可结算</p>
                <span><?php echo ($userInfo["can_withdraw"]); ?></span>
            </div>
            <!--<div class="jf-item"  onclick="jifen(<?php echo ($userInfo["id"]); ?>)">-->
                <!--<p>积分</p>-->
                <!--<span><?php echo ($userInfo["do_score"]); ?></span>-->
            <!--</div>-->
        </div>
        <div class="line"></div>
        
        <div class="servBox">
            <div class="serv-item" onclick="select_address(1)">
                <img src="/Public/Zyly/images/wodedindan.png" alt="">
                <p>我的订单</p>
            </div>
            <div class="serv-item" onclick="select_address(10)">
                <img src="/Public/Zyly/images/daifuk@2x.png" alt="">
                <p>未付款</p>
            </div>
            <div class="serv-item" onclick="select_address(20)">
                <img src="/Public/Zyly/images/daishouh@2x.png" alt="">
                <p>待发货</p>
            </div>
            <div class="serv-item" onclick="select_address(30)">
                <img src="/Public/Zyly/images/daishouh@2x.png" alt="">
                <p>待收货</p>
            </div>
            <div class="serv-item" onclick="select_address(40)">
                <img src="/Public/Zyly/images/daipingj@2x.png" alt="">
                <p>已完成</p>
            </div>
            <!--<div id="kefu" class="serv-item" onclick="callphone();">-->
                <!--<img src="/Public/Zyly/images/kefu@2x.png" alt="">-->
                <!--<p>售后服务</p>-->
            <!--</div>-->
        </div>
        <div class="line"></div>

        <div class="selectBox">
            <a href="<?php echo U('Vip/vip_introduction');?>">
                <div class="selectBox-item">
                    <div class="selectBox-left">
                        <img src="/Public/Zyly/images/zan@2x.png" alt="">
                        <span>会员中心</span>
                    </div>

                    <div class="selectBox-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
            </a>

            <div class="selectBox-item" onclick="my_fance(<?php echo ($userInfo["id"]); ?>)">
                <div class="selectBox-left">
                    <img src="/Public/Zyly/images/fensi@2x.png" alt="">
                    <span>我的粉丝</span>
                </div>
                <div class="selectBox-right">
                        <span><?php echo ($fance_num); ?></span>

                    <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                </div>
            </div>
            <a href="<?php echo U('Person/my_recommend');?>?uid=<?php echo ($userInfo["id"]); ?>">
                <div class="selectBox-item">
                    <div class="selectBox-left">
                        <img src="/Public/Zyly/images/dingw@2x.png" alt="">
                        <span>我的推荐</span>
                    </div>
                    <div class="selectBox-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
            </a>
            <!-- <div class="selectBox-item">
                <div class="selectBox-left">
                    <img src="/Public/Zyly/images/pingjia@2x.png" alt="">
                    <span>我的评价</span>
                </div>
                <div class="selectBox-right">
                    <span>10</span>
                    <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                </div>
            </div> -->
            <a href="<?php echo U('Address/address_list');?>?uid=<?php echo ($userInfo["id"]); ?>">
                <div class="selectBox-item">
                    <div class="selectBox-left">
                        <img src="/Public/Zyly/images/dingw@2x.png" alt="">
                        <span>地址管理</span>
                    </div>
                    <div class="selectBox-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
            </a>

            <div onclick="wallet();" class="selectBox-item">
                    <div class="selectBox-left">
                        <img src="/Public/Zyly/images/dingw@2x.png" alt="">
                        <span>结算中心</span>
                    </div>
                    <div  class="selectBox-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
            </div>

             <!--<div onclick="service();" class="selectBox-item">-->
                    <!--<div class="selectBox-left">-->
                        <!--<img src="/Public/Zyly/images/dingw@2x.png" alt="">-->
                        <!--<span>服务中心</span>-->
                    <!--</div>-->
                    <!--<div  class="selectBox-right">-->
                        <!--<img src="/Public/Zyly/images/jiantou@2x1.png" alt="">-->
                    <!--</div>-->
            <!--</div>-->
            
        </div>
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
    </div>
</body>
<script>
    function select_address(sta){
        location.href='<?php echo U("Person/order");?>?status='+sta;
    }
    
    function my_fance(id){
        location.href='<?php echo U("Person/my_fan");?>?id='+id;
    }
    
    function service(){
        location.href='<?php echo U("Person/serverCenter");?>';
    }
    function rewardDetail(){
        location.href='<?php echo U("Person/rewardDetail");?>';
    }
    function info(){
        location.href='<?php echo U("Person/personalInfo");?>';
    }
    function wallet(){
        location.href='<?php echo U("Person/wallet");?>';
    }
    function  callphone(){
        location.href='tel:13318203838';
    }
    function jifen(){
        location.href='<?php echo U("Person/integral_record");?>';
    }
</script>
</html>