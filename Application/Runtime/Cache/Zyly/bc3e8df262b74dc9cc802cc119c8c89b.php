<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/wallet.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/layer-v3.1.1/layer/layer.js"></script>
</head>

<body>
    <div class="wallet">
        <div class="walletTop">
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
        </div>
        <div class="walletBottom">
            <div class="walletBottom-income">
                <div>
                    <p>总收入</p>
                    <span>￥<?php echo ($total); ?></span>
                </div>
                <div>
                    <p>已提现</p>
                    <span>￥<?php echo ($yt_money); ?></span>
                </div>
                <div>
                    <p>可提现</p>
                    <span>￥<?php echo ($kt_money); ?></span>
                </div>
            </div>
    
            <div class="walletBottom-cashDetail">
                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="cashDetailItem">
                        <span>￥<?php echo ($vol["money"]); ?></span>
                        <span><?php echo ($vol["create_time"]); ?></span>
                        <?php if($vol["status"] == 1): ?><span>审核中</span>
                        <?php elseif($vol["status"] == 2): ?>
                            <span>提现成功</span>
                        <?php elseif($vol["status"] == 3): ?>
                            <span>提现驳回</span>
                        <?php elseif($vol["status"] == 4): ?>
                            <span>待转账</span>
                        <?php elseif($vol["status"] == 5): ?>
                            <span>审核失败</span><?php endif; ?>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
    </div>
</body>
<script>
   function settlement(money,phone,banks){

        if(phone=='rhujhnfjhfnjffghgj'||banks==2){
            layer.msg('请先完善个人资料', {icon: 1},function(){
                location.href='<?php echo U("Person/personalInfo");?>';    
            });
        }else{
            layer.confirm('是否全部提现?', {
                btn: ['全部结算','结算部分','取消提现'] //按钮
                }, function(){
                    withdraw(money);
                },function(){
                    layer.prompt({title: '输入要结算的金额', formType: 3}, function(text, index){
                        var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
                        console.log(text);
                        if(!reg.test(text)){
                            layer.msg('保证金金额的输入格式不正确,请确认!');
                            return ;
                        }else{
                            if(text>money){
                                layer.msg('可提现金额不足');
                                return ;
                            }else{
                                withdraw(text);
                            }
                        }
                    });
                }, function(){
                    layer.msg('的确很重要', {icon: 1});
                }
            );
        }

    }

function  withdraw(money){
    layer.confirm('是否结算', {
        btn: ['去结算'] //按钮
        }, function(){
            $.ajax({ 
                'url':'/index.php/Zyly/Person/withdraw',
                'type':'post',
                'data':{'money':money},
                'dataType':'json',
                'success':function(data){
                    console.log(data);
                    
                    // // alert(data);
                    // return false;
                    // console.log(data);
                    if(data.status == 1){
                        layer.msg(data.msg, {icon: 1},function(){
                            location.reload();
                        });
                    }else{
                        layer.msg(data.msg, {icon: 1}); 
                    }
                    
                }
            });
            // layer.msg('结算成功', {icon: 1});
        });
}
</script>
</html>