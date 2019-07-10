<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>填写订单</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/writeOrder.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/layer-v3.1.1/layer/layer.js"></script>
</head>

<body>

    <div class="writeOrder">
        <div class="writeOrder-userInfo">
            <div class="userInfo-top">
                <span class="userInfoName"><?php echo ($address["name"]); ?></span>
                <span class="userInfoPhone"><?php echo ($address["tel"]); ?></span>
            </div>
            <div class="userInfo-address">
                <img src="/Public/Zyly/images/dingwei@2x.png" alt="">
                <span><?php echo ($address["address_xq"]); ?></span>
            </div>
            <div class="userInfo-subAddres s">
                <span><?php echo ($address["address"]); ?></span>
            </div> 
            <div class="defaultBtn">
            <?php if($address['id'] == '999999999'): ?><span onclick="selects(<?php echo ($user_info["id"]); ?>,<?php echo ($goods["id"]); ?>,<?php echo ($goods["buy_num"]); ?>,<?php echo ($shop_type); ?>)">添加收货地址</span>
            <?php else: ?>
                <span>默认</span><?php endif; ?>
            </div>
            <div class="rightBtn">
                <img onclick="selects(<?php echo ($user_info["id"]); ?>,<?php echo ($goods["id"]); ?>,<?php echo ($goods["buy_num"]); ?>,<?php echo ($shop_type); ?>)" src="/Public/Zyly/images/jiantou@2x1.png" alt="">
            </div>
        </div>
        <div class="line"></div>
        <div class="goodsInfo">
            <div class="goodsInfo-tit">
                商品信息
            </div>
            <div class="goodsInfo-cont">
                <div class="orderItem">
                    <div class="goodsInfo-cont-left">
                        <img src="/Data/<?php echo ($goods["photo_x"]); ?>" alt="">
                    </div>
                    <div class="goodsInfo-cont-right">
                        <div class="rightBox-goodsName">
                           <?php echo ($goods["name"]); ?>
                        </div>
                        <!-- <div class="rightBox-subGoodsDetail">
                            百搭上衣尺码：白色M
                        </div> -->
                        <div class="rightBox-price">
                            <?php if($is_fg == 10): ?><span class="fuhao">￥</span><span><?php echo ($goods["price_old"]); ?></span>
                            <?php else: ?>
                                <span class="fuhao">￥</span><span><?php echo ($goods["price"]); ?></span><?php endif; ?>
                        </div>
                        <div class="rightBox-count">
                            <span>x<?php echo ($goods["buy_num"]); ?></span>
                        </div>
                    </div>
                </div>
                <!-- <div class="orderItem">
                    <div class="goodsInfo-cont-left">
                        <img src="/Public/Zyly/images/goods.png" alt="">
                    </div>
                    <div class="goodsInfo-cont-right">
                        <div class="rightBox-goodsName">
                            10个旅游卡 4190元的净水器 10个旅游卡 4190元的净水器
                        </div>
                        <div class="rightBox-subGoodsDetail">
                            百搭上衣尺码：白色M
                        </div>
                        <div class="rightBox-price">
                            <span class="fuhao">￥</span><span>1299</span>
                        </div>
                        <div class="rightBox-count">
                            <span>x1</span>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
        <div class="line"></div>
        <div class="moneyBox">
            <div class="goodsTotal">
                <span>商品合计</span>
                <?php if($shop_type == 5): ?><span><?php echo ($goods["count_price"]); ?>积分</span>
                <?php else: ?>
                    <span>￥<?php echo ($goods["count_price"]); ?></span><?php endif; ?>
                
            </div>
            <!-- <div class="fare">
                <span>运费</span>
                <div>
                    <span>满88元包邮</span>
                    <span>￥16.00</span>
                </div>

            </div> -->
        </div>
        <div class="writeOrder-bottom">
            <div class="writeOrder-bottom-left">
                <span>应付金额:</span>
                <?php if($shop_type == 5): ?><span><?php echo ($goods["count_price"]); ?>积分</span>
                <?php else: ?>
                    <span>￥<?php echo ($goods["count_price"]); ?></span><?php endif; ?>
               
            </div>
            <div class="writeOrder-bottom-right">
                <span class="pay">订单支付</span>
            </div>
        </div>
    </div>

    <div class="alert" style="display:none;">
        <div class="alert-in">
            <div class="no">
                <img  id="no-img" src="/Public/Zyly/images/chacha@2x (2).png" /></div>
            <div class="pay">
                <p>立即支付</p>
                <div>¥<?php echo ($goods["count_price"]); ?></div>
            </div>
            <div class="we">
                <img src="/Public/Zyly/images/icon_wexin@3x.png" class="we1" />
                <img src="/Public/Zyly/images/gengduo@2x.png" class="we2" />
                <span>微信支付</span>
            </div>
            <a href="<?php echo U('Goods/wechatPay');?>?address_id=<?php echo ($address_id); ?>&goods_id=<?php echo ($goods["id"]); ?>&buy_num=<?php echo ($goods["buy_num"]); ?>&shop_type=<?php echo ($shop_type); ?>">
                <div class="button">去支付</div>
            </a>
        </div>
    </div>
</body>
<script>
    var address_id =<?php echo $address_id;?>;
    var goods_id= <?php echo ($goods["id"]); ?>;
    var buy_num = <?php echo ($goods["buy_num"]); ?>;
    var shop_type = <?php echo ($shop_type); ?>;

    function selects(uid,goods_id,buy_num,shop_type){ 
        location.href='<?php echo U("Address/selectConsignee");?>?uid='+uid+'&goods_id='+goods_id+'&buy_num='+buy_num+'&shop_type='+shop_type;
    }

    $(function(){
        $('.pay').click(function(){
           if(address_id==999999999){
               alert('请选择收货地址');
           }else{
               if(shop_type==5){
                    layer.confirm('是否用积分兑换此商品?', {
                        btn: ['是','否'] //按钮
                    }, function(){  
                        $.ajax({
                            'url':'/index.php/Zyly/Goods/exchange_goods',
                            'type':'post',
                            'data':{'goods_id':goods_id,'address_id':address_id,'buy_num':buy_num,'shop_type':shop_type},
                            'dataType':'json',
                            'success':function(data){
                                if(data.status==1){
                                    layer.msg(data.msg,{time:2000},function(){
                                        location.href='<?php echo U("Person/integral_record");?>';
                                    });
                                }else{
                                    layer.msg(data.msg,{time:2000});
                                }
                            }
                        });
                    });
               }else{
                    $('.alert').css('display','block');
               }
           }

        })
        
        $('.no').click(function(){
            $('.alert').css('display','none');
        })

    })
</script>
</html>