<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=yes"/>
    <title>商品信息</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/goodsInfo.css">
    <link rel="stylesheet" href="/Public/Zyly/css/swiper-3.4.0.min.css">
 
</head>

<body>
    <div class="goodsInfo">
        <div class="goodsInfo-tab">
            <p class="tab-act">
                <span>商品介绍</span>
            </p>
            <p>
                <span>图文详情</span>
            </p>
            <!-- <p>
                <span>商品评价</span>
            </p> -->
        </div>
        <div class="goodsInfo-cont">
            <div class="goodsInfo-cont1 boxShow">
                <div class="goodsInfoCont1-imgs">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <?php if(is_array($banner)): $i = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
                                    <img src="/Data/<?php echo ($vol); ?>" alt="">
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                            <!-- <div class="swiper-slide">
                                <img src="/Public/Zyly/images/bann4@2x.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="/Public/Zyly/images/bann4@2x.png" alt="">
                            </div> -->
                        </div>
                        <!-- 如果需要分页器 -->
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                    <div class="goodsInfoCont1-goodsInfo">
                        <div class="goodsInfo-goodsName">
                            <?php echo ($goods["name"]); ?>
                        </div>
                        <div class="goodsInfo-subGoodsName">
                            <?php echo ($goods["intro"]); ?>
                        </div>
                    
                        <div class="goodsInfo-price">
                            <!-- <img src="/Public/Zyly/images/lvyou@2x.png" alt=""> -->
                            <?php if($shop_type == 5): ?><span class="fuhao"><?php echo ($goods["price"]); ?></span><span>积分</span>
                            <?php else: ?>
                                <span class="fuhao">￥</span><span><?php echo ($goods["price"]); ?></span><?php endif; ?>
                           
                        </div>

                        <div class="goodsInfo-hotBox">
                            <img src="/Public/Zyly/images/huohuo@2x.png" alt="">
                            <span>月销<?php echo ($goods["shiyong"]); ?>笔</span>
                        </div>
                    </div>
               
                <div class="line"></div>
                <div class="goodsInfoCont1-goodsIntro">
                    <div class="goodsIntro-tit">
                        商品介绍
                    </div>
                    <div class="goodsIntro-cont">
                       <?php echo ($goods["content"]); ?>
                    </div>
                </div>
                <div class="line"></div>
                
                <!-- <div class="load">
                    <div class="span-c3">
                        <span></span>
                        <span></span>
                    </div>
                    <p>正在加载更多...</p>
                </div> -->
                

            </div>
            <div class="goodsInfo-cont2 ">
                <div class="cont2-goodsDetail">
                   <?php echo ($goods["intro"]); ?>
                </div>
                <div class="cont2-imgBox">
                    <!-- <?php if(is_array($banner)): $i = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><img src="/Data/<?php echo ($vol); ?>" alt=""><?php endforeach; endif; else: echo "" ;endif; ?> -->
                    <img src="/Data/<?php echo ($goods["photo_d"]); ?>" alt="">
                </div>
                <div class="cont2-shareBtn">
                    <span onclick="share();">分享有惊喜</span>
                </div>
                <div class="line"></div>
                <div class="noteItem">
                    <div class="noteItem-tit">
                        注意事项
                    </div>
                    <div class="noteItemBox">
                        <div class="noteItemBox-subtit">
                            • 购买运费如何收取？
                        </div>
                        <div class="noteItemBox-cont">
                            单笔订单金额(不含运费)满88元免邮费；不满88元，每单收取10元运费。（港澳台地区需满500元免邮费；不满500元，每单收取30元运费)
                        </div>
                        <div class="noteItemBox-subtit">
                            • 使用什么快递发货?
                        </div>
                        <div class="noteItemBox-cont">
                            <p>默认使用顺丰快递发货(个别商品使用其他快递）</p>
                            <p>配送范围覆盖全国大部分地区(港澳台地区除外）。</p>
                        </div>

                        <div class="noteItemBox-subtit">
                            • 如何申请退货?
                        </div>
                        <div class="noteItemBox-cont">
                            <p>
                                1.自收到商品之日起30日内，顾客可申请无忧退货，退款将原路返还，不同的银行处理时间不同，预计1-5个工作日到账；
                            </p>
                            <p>
                                2.内裤和食品等特殊商品无质量问题不支持退货；
                            </p>
                            <p>
                                3.退货流程：
                            </p>
                            <p>
                                确认收货-申请退货-客服审核通过-用户寄回商品-仓库签收验货-退款审核-退款完成；
                            </p>
                        </div>
                    </div>
                </div>
            </div>
         
        </div>
        <div class="goodsInfoCont1-hideBox">
                    <div class="hideBoxGoodsInfo">
                        <div class="hideBoxGoodsInfo-left">
                            <img src="/Data/<?php echo ($goods["photo_x"]); ?>" alt="">
                        </div>
                        <div class="hideBoxGoodsInfo-right">
                            <div class="rightBox-goodsName" data-price="<?php echo ($goods["price"]); ?>" data-id="<?php echo ($goods["id"]); ?>">
                                <?php echo ($goods["price"]); ?>
                            </div>
                            <div class="rightBox-subGoodsName">
                               <?php echo ($goods["name"]); ?>
                            </div>
                            <div class="rightBox-price">
                                {if condition="$is_fg eq 10"}
                                    <span>￥</span><span class="count_price"><?php echo ($goods["price_old"]); ?></span>
                                {else /}
                                    <span>￥</span><span class="count_price"><?php echo ($goods["price"]); ?></span>
                                {/if}
                            </div>
                        </div>
                        <div class="closeBtn">
                            <img src="/Public/Zyly/images/xxxxx@2x.png" alt="">
                        </div>
                    </div>
        
                    <div class="hideBoxAmount">
                        <span class="sub_number">-</span>
                        <input value="1" type="text" name="product_num" id="product_num">
                        <span class="add_number">+</span>
                    </div>

                    <div class="hideBoxBtn">
                        <span  class="buy">立即购买</span>
                    </div>
                </div>
                <div class="mask"></div>
        <div class="funcBottom">
            <div class="funcBottomCont">
                <div class="buyCar">
                    <img src="/Public/Zyly/images/index1ik@2x.png" alt="">
                    <span>首页</span>
                </div>
                <div class="kefu">
                    <img src="/Public/Zyly/images/kefuIcon@2x.png" alt="">
                    <span>客服</span>
                </div>
             
                <!-- <div class="buyCar">
                    <img src="/Public/Zyly/images/taoxingxi@2x.png" alt="">
                    <span>购物车</span>
                </div> -->
                <div class="share" onclick="share();">
                    分享
                </div>
                <div class="buyNow">
                    立即购买
                </div>
            </div>

        </div>
    </div>
</body>
<script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
<script src="/Public/Zyly/js/layer-v3.1.1/layer/layer.js"></script>
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

    var mySwiper = new Swiper('.swiper-container', {
        autoplay: 1000,
        speed: 300,
        loop: true,
        // 如果需要分页器
        pagination: '.swiper-pagination',
    })

    function share(){
        layer.msg('点击右上角分享',{time:1500});
  
    }
</script>
<script>
    var shop_type = <?php echo ($shop_type); ?>;
    var is_fg = <?php echo ($is_fg); ?>;
    var fg_num = <?php echo ($fg_num); ?>;
    $(function () {
        $(".goodsInfo-tab p").click(function () {
            var index = $(this).index();
            console.log(index);
            $(this).addClass("tab-act").siblings().removeClass("tab-act");
            $(".goodsInfo-cont>div").eq(index).addClass("boxShow").siblings().removeClass("boxShow");
        });

        $(".buyNow").click(function () {
            $(".mask").show();
            $(".goodsInfoCont1-hideBox").show();


        })
        $(".closeBtn").click(function () {
            $(".mask").hide();
            $(".goodsInfoCont1-hideBox").hide();
        });

        $('.add_number').click(function(){
            var price  = $('.rightBox-goodsName').attr('data-price');
            var num = $('#product_num').val();
            var new_num = parseInt(num)+1;
            var count_price = price*new_num;
            //设置新的数量

            $('#product_num').attr('value',new_num);
            // $('#product_num').val(new_num);
            //设置新的总价
            $('.count_price').html(count_price);

        })

        $('.sub_number').click(function(){
            var price  = $('.rightBox-goodsName').attr('data-price');
            var num = $('#product_num').val();
            var new_num = parseInt(num)-1;
            //数量要大于或等于1
			if(new_num== 0)
			{
				return;
			}
            var count_price = price*new_num;
            $('#product_num').attr('value',new_num);
            // $('#product_num').val(new_num);
            //设置新的总价
            $('.count_price').html(count_price);

        })

        $('.buy').click(function(){
            var goods_id = $('.rightBox-goodsName').attr('data-id');
            var num = $('#product_num').val();
            // console.log(is_fg);
            // return false;
            if(is_fg==10){
                if(num<fg_num){
                    layer.msg('复购最低'+fg_num+'盒起',{time:2000});
                    return false;
                }
            }
            location.href='<?php echo U("Goods/writeOrder");?>?goods_id='+goods_id+'&buy_num='+num+'&shop_type='+shop_type;
        })
        
        $('.kefu').click(function(){
            location.href='tel:17671853375';
        })
        $('.buyCar').click(function(){
            location.href='<?php echo U("Goods/index");?>';
        })
    })
</script>


</html>