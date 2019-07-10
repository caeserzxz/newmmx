<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>奖励明细</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/rewardDetail.css">
</head>

<body>
    <div class="rewardDetail">
        <div class="rewardDetail-tit">
            <div class="rewardDetail-tit-left">
                <img src="/Public/Zyly/images/dyorn@2x.png" alt="">
                <div class="succBox">
                    <span class="succtTop">成功推荐</span>
                    <span class="succtBott"><i><?php echo ($users_num); ?></i>人</span>
                </div>
            </div>
            <div class="rewardDetail-tit-right">
                <img src="/Public/Zyly/images/dyorn@2x.png" alt="">
                <div class="sum">
                    <span class="sumTop">累计奖金</span>
                    <span class="sumBott"><i><?php echo ($users["total"]); ?></i>元</span>
                </div>
            </div>
        </div>
        <div class="rewardDetailItem-tit">
                        奖励明细
        </div>
        <div class="rewardDetail-cont">
            <?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="rewardDetailItem">
                    
                    <div class="rewardDetailItem-nub">
                        <div class="rewardDetailItem-nub-left">
                            订单编号:<?php echo ($vol["order_sn"]); ?>
                        </div>
                        <div class="rewardDetailItem-nub-right">
                            <?php if($vol["status"] == 20): ?>待发货
                            <?php elseif($vol["status"] == 30): ?>
                                待收货
                            <?php elseif($vol["status"] == 40): ?>
                                待评价
                            <?php elseif($vol["status"] == 50): ?>
                                已完成<?php endif; ?>
                        </div>
                    </div>

                    <div class="rewardDetailItem-goods">
                        <div class="rewardDetailItem-goods-img">
                            <img src="/Data/<?php echo ($vol["photo_x"]); ?>" alt="">
                        </div>
                        <div class="rewardDetailItem-goods-info">
                            <div class="goodsInfo-goodsName">
                               <?php echo ($vol["goods_name"]); ?>
                            </div>
                            <div class="goodsInfo-buyTime">
                                付款时间:<?php echo date("Y-m-d H:i:s",$vol['pay_time'])?>
                            </div>
                        </div>
                        <div class="rewardDetailItem-goods-mount">
                            ×1
                        </div>
                    </div>
                    <div class="rewardDetailItem-orderDetail">
                        <div class="orderDetail-item">
                            <p>订单来源</p>
                            <p><?php echo ($vol["uname"]); ?></p>
                        </div>
                        <div class="orderDetail-item">
                            <p>付款金额</p>
                            <p>￥<?php echo ($vol["price_h"]); ?></p>
                        </div>
                        <!--<div class="orderDetail-item">-->
                            <!--<p>分佣比例</p>-->
                            <!--<p><?php echo ($vol["maid"]); ?>%</p>-->
                        <!--</div>-->
                        <div class="orderDetail-item">
                            <p>预估收益</p>
                            <p>￥<?php echo ($vol["est_price"]); ?></p>
                        </div>
                    </div>

                </div><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>





    </div>


</body>

</html>