<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的订单</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/myOrder.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/input.js"></script>
</head>

<body>
    <div class="myOrder">
        <div class="myOrderNav">
            <?php if($status == 1): ?><span class="stativAct" onclick="myorder(1)">全部</span>
            <?php else: ?>
                <span onclick="myorder(1)">全部</span><?php endif; ?>
            <?php if($status == 10): ?><span class="stativAct" onclick="myorder(10)">待付款</span>
            <?php else: ?>
                <span onclick="myorder(10)">待付款</span><?php endif; ?>
            <?php if($status == 20): ?><span class="stativAct" onclick="myorder(20)">待收货</span>
            <?php else: ?>
                <span onclick="myorder(20)">待收货</span><?php endif; ?>
            <?php if($status == 30): ?><span class="stativAct" onclick="myorder(30)">已完成</span>
            <?php else: ?>
                <span onclick="myorder(30)">已完成</span><?php endif; ?>
            <!-- <?php if($status == 50): ?><span class="stativAct" onclick="myorder(50)">售后服务</span>
            <?php else: ?>
                <span onclick="myorder(50)">售后服务</span><?php endif; ?> -->
        </div>
        <div class="myOrderContItemBox">
        <?php if(is_array($orders)): $i = 0; $__LIST__ = $orders;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="myOrderContItem">
                <div class="myOrderContItem-tit">
                    <div class="myOrderCont-tit-nub">
                        <span>订单编号:<?php echo ($vol["order_sn"]); ?></span>
                    </div>
                    <?php if($status == 10): ?><div class="myOrderCont-tit-static">
                        等待付款
                    </div><?php endif; ?>
                </div>
                <div class="myOrderContItemBox">
                    <div class="myOrderContItemBox-goodsItem">
                        <div class="selectIcon">
                            <lable>
                                <i class='input_style checkbox_bg '><input name="" id="" type="checkbox"></i>
                            </lable>
                        </div>
                        <div class="goodsItem-img">
                            <img src="/Data/<?php echo ($vol["photo_x"]); ?>" alt="">
                        </div>
                        <div class="goodsItem-goodsInfo">
                            <div class="rightBox-goodsName">
                                <?php echo ($vol["name"]); ?>
                            </div>
                            <div class="rightBox-subGoodsDetail">
                                <!-- 百搭上衣尺码：白色M -->
                            </div>
                            <div class="rightBox-price">

                                <span class="fuhao">￥</span><span><?php echo ($vol["price"]); ?></span>
                            </div>
                            <div class="rightBox-count">
                                <span>x<?php echo ($vol["num"]); ?></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="myOrderContItem-bottom">
                    <div class="myOrderContItem-bottom-left">
                        <div>应付金额&nbsp;:&nbsp;￥<?php echo ($vol["amount"]); ?></div>
                    </div>
                    <div class="myOrderContItem-bottom-right">
                    <!-- <?php if($status == 30): ?><span onclick="comment(<?php echo ($vol["id"]); ?>);">立即评价</span><?php endif; ?> -->
                        <!-- <span>取消订单</span> -->
                        <?php if($vol["status"] == 10): ?><a href="/index.php/Zyly/Goods/wechatPay?order_id=<?php echo ($vol["id"]); ?>"><span>立即付款</span></a><?php endif; ?>
                    </div>
                </div>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
            <!-- <div class="load">
                <div class="span-c3">
                    <span></span>
                    <span></span>
                </div>
                <p>正在加载更多...</p>
            </div> -->
       
        </div>
        <div class="nothing">
            <img src="/Public/Zyly/images/dingdan@2x.png" alt="">
            <p>暂无相关的订单记录</p>
        </div>
        
    </div>
    
</body>
    <script>
        $(function () { 
            $(".myOrderNav span").click(function () { 
                $(this).addClass("stativAct").siblings().removeClass("stativAct");
             });
        });

        function myorder(type){
            // location.href='<?php echo U("Person/order");?>?status='+type;
            console.log(type);
            // return false;
            $('.myOrderContItem').remove();
            $.ajax({
                'url':'/index.php/Zyly/Person/order',
                'type':'post',
                'data':{'status':type},
                'dataType':'json',
                'success':function(data){
                    console.log(data);
                    // return false;
                    var str ='';
                    $.each(data, function (k, v){
                        if(v.status == 10){
                            var  str1 =  '<div class="myOrderContItem-bottom-left">'
                                +                '<div>应付金额&nbsp;:&nbsp;￥'+v.amount+'</div>'
                                +            '</div>'
                                +            '<div class="myOrderContItem-bottom-right" data-id='+v.id+'>'
                                +              '<a href="/index.php/Zyly/Goods/wechatPay?order_id='+v.id+'"><span>立即付款</span></a>'
                                +            '</div>';

                        }else if(v.status == 20){
                            var  str1 =  '<div class="myOrderContItem-bottom-left">'
                                +                '<div>已付金额&nbsp;:&nbsp;￥'+v.amount+'</div>'
                                +            '</div>'
                                +            '<div class="myOrderContItem-bottom-right" data-id='+v.id+'>'
                                +              '<a href="/index.php/Zyly/Goods/wechatPay?order_id='+v.id+'"><span>立即收货</span></a>'
                                +            '</div>';
                        }else if(v.status == 30){
                            var  str1 =  '<div class="myOrderContItem-bottom-left">'
                                +                '<div>已付金额&nbsp;:&nbsp;￥'+v.amount+'</div>'
                                +            '</div>'
                                +            '<div class="myOrderContItem-bottom-right" data-id='+v.id+'>'
                                +              '<a href="javascript:void(0)"><span>已完成</span></a>'
                                +            '</div>';
                        }
                        str += '<div class="myOrderContItem">'
                            +        '<div class="myOrderContItem-tit">'
                            +            '<div class="myOrderCont-tit-nub">'
                            +                '<span>订单编号:'+v.order_sn+'</span>'
                            +            '</div>'
                            +        '</div>'
                            +        '<div class="myOrderContItemBox">'
                            +            '<div class="myOrderContItemBox-goodsItem">'
                            +                '<div class="goodsItem-img">'
                            +                    '<img src="/Data/'+ v.photo_x+'" alt="">'
                            +                '</div>'
                            +                '<div class="goodsItem-goodsInfo">'
                            +                    '<div class="rightBox-goodsName">'
                            +                        v.name
                            +                    '</div>'
                            +                    '<div class="rightBox-subGoodsDetail">'
                            +                    '</div>'
                            +                    '<div class="rightBox-price">'
                            +                        '<span class="fuhao">￥</span><span>'+v.price+'</span>'
                            +                    '</div>'
                            +                    '<div class="rightBox-count">'
                            +                        '<span>x'+v.num+'</span>'
                            +                    '</div>'
                            +                '</div>'
                            +            '</div>'
                            +        '</div>'
                            +        '<div class="myOrderContItem-bottom">'
                            +str1
                            +    '</div>';
                    });
                    // console.log(str);

                    var a=$('.myOrderContItemBox').append(str);
                    num = 0;
                    // if(data.status==1){
                    //     layer.msg(data.msg,{time:1500},function(){
                    //         location.reload();
                    //     });
                    // }else{
                    //     layer.msg(data.msg,{time:2000});
                    // }
                }
            });
        }
        
        //立即评价
        function comment(id){
            location.href='<?php echo U("Person/comment");?>?id='+id;
        }
    </script>
</html>