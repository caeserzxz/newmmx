<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>推荐奖励</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/recommendReward.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/layer-v3.1.1/layer/layer.js"></script>
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
    <div class="bigBox">
        <div class="recommendTop">
            <i onclick="guize();"></i>
            <img src="/Public/Zyly/images/yaoqing@2x.png" alt="">
            <p>推荐好友</p>
            <p>获取好友推荐的订单分成</p>
            <span onclick="share();">立即邀请</span>
        </div>
        <div class="line"></div>
        <div class="recommendSum">
            <div class="Sumitem" onclick="rewardDetail();">
                <img src="/Public/Zyly/images/dyorn@2x.png" alt="">
                <div class="itemDir">
                    <p>成功推荐</p> 
                    <p><span><?php echo ($users_num); ?></span>人</p>
                </div>
            </div>
            <div class="Sumitem" onclick="rewardDetail();">
                <img src="/Public/Zyly/images/qiandai@2x.png" alt="">
                <div class="itemDir">
                    <p>累计奖金</p>
                    <p><span><?php echo ($users["total"]); ?></span>元</p>
                </div>
            </div>
            <div onclick="settlement(<?php echo ($users["can_withdraw"]); ?>,'<?php echo ($users["phone"]); ?>',<?php echo ($banks); ?>);" class="Sumitem">
                <img src="/Public/Zyly/images/qian@2x.png" alt="">
                <div class="itemDir showBox">
                    <p>可结算</p>
                    <p><span><?php echo ($users["can_withdraw"]); ?></span>元</p>
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div class="recommendBot">
            <div class="shareTit">
                <span>分享排行榜</span>
            </div>
            <div class="shareBox">
            <?php if(is_array($users_lower)): $k = 0; $__LIST__ = $users_lower;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($k % 2 );++$k;?><div class="shareItem">
                    <div class="shareItem-left">
                        <i><?php echo ($k); ?></i>
                        <img src="<?php echo ($vol["photo"]); ?>" alt="">
                        <span>TOP<?php echo ($k); ?></span>
                    </div>
                    <div class="shareItem-right">
                        <!-- ￥ <?php echo ($vol["total"]); ?> -->
                        <?php echo ($vol["fans"]); ?>个粉丝
                    </div>
                </div><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
    </div>
</body>
<script>
    function share(){
        // layer.msg('点击右上角分享',{time:1500});
        location.href='<?php echo U("Goods/share");?>';
    }

    function rewardDetail(){
        location.href='<?php echo U("Person/rewardDetail");?>';
    }

    function settlement(money,phone,banks){

        // if(phone=='rhujhnfjhfnjffghgj'||banks==2){
        //     layer.msg('请先完善个人资料', {icon: 1},function(){
        //         location.href='<?php echo U("Person/personalInfo");?>';
        //     });
        // }else{
        //     layer.confirm('是否结算', {
        //     btn: ['去结算'] //按钮
        //     }, function(){
        //         $.ajax({
        //             'url':'/index.php/Zyly/Person/withdraw',
        //             'type':'post',
        //             'data':{'money':money},
        //             'dataType':'json',
        //             'success':function(data){
        //                 // alert(data);
        //                 // return false;
        //                 console.log(data);
        //                 if(data.status == 1){
        //                     layer.msg(data.msg, {icon: 1},function(){
        //                         location.reload();
        //                     });
        //                 }else{
        //                     layer.msg(data.msg, {icon: 1});
        //                 }
        //
        //             }
        //         });
        //         // layer.msg('结算成功', {icon: 1});
        //     });
        // }
        location.href='<?php echo U("Person/wallet");?>';
      
    }
    function  guize(){
        location.href='<?php echo U("Person/tuijianProblem");?>';
    }
</script>
</html>