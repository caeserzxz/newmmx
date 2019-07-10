<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/integral_record.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/layer-v3.1.1/layer/layer.js"></script>
</head>

<body>
    <div class="wallet">
        <!-- <div class="walletTop">
            <div class="walletTopFont">
                账户余额 &nbsp;(元)
            </div>
            <div class="walletTopNub">
                <p>￥<?php echo ($can_withdraw); ?></p>
                <span onclick="settlement(<?php echo ($can_withdraw); ?>,'<?php echo ($users["phone"]); ?>',<?php echo ($users["banks"]); ?>);">提现</span>

            </div>
        </div>
        <div class="tip">
            <p>提现手续费2%，比如 ，提现金额5400元，提示实际到帐金额5292元，定单在系统秒结算，每周六中午12点前提现，下周一当天内到帐。每周仅限提现一次，建议周六中午12点前前作一次性提现操作，超过的部分，要下下周才能到帐。</p>
        </div> -->
        <div class="walletBottom">
            <div class="walletBottom-income">
                <div>
                    <p>可用积分</p>
                    <span><?php echo ($users["do_score"]); ?>积分</span>
                </div>
                <div>
                    <p>累积积分</p>
                    <span><?php echo ($users["total_score"]); ?>积分</span>
                </div>
            </div>
    
            <div class="walletBottom-cashDetail">
                <?php if(is_array($record)): $i = 0; $__LIST__ = $record;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="cashDetailItem">
                        <span><?php echo ($vol["price"]); ?></span>
                        <span><?php echo ($vol["addtime"]); ?></span>
                       <span><?php echo ($vol["explain"]); ?></span>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
    </div>
</body>

</html>