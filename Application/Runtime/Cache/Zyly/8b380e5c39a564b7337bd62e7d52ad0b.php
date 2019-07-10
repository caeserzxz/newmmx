<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>编辑收货人</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/selectConsignee.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/input.js"></script>
</head>

<body>

    <div class="selectConsignee">
        <?php if(is_array($address)): $i = 0; $__LIST__ = $address;if( count($__LIST__)==0 ) : echo "暂无收货人信息" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i; if($vol["is_default"] == 1): ?><div class="consigneeItem itemAct clearfix">
                <div class="consigneeItem-selectIcon">
                    <lable>
                        <i class='input_style checkbox_bg radio_bg_check'> <input name="sel" id="selectItem" type="radio"></i>
                    </lable>
                </div>
            <?php else: ?>
                <div class="consigneeItem clearfix">
                <div class="consigneeItem-selectIcon">
                    <lable>
                        <i class='input_style checkbox_bg' onclick="selects(<?php echo ($vol["id"]); ?>,<?php echo ($goods_id); ?>,<?php echo ($buy_num); ?>,<?php echo ($shop_type); ?>)"> <input name="sel" id="selectItem" type="radio"></i>
                    </lable>
                </div><?php endif; ?>
            
                <div class="consigneeItem-info">
                    <div class="consigneeItem-info-top">
                        <span><?php echo ($vol["name"]); ?></span>
                        <span><?php echo ($vol["tel"]); ?></span>
                    </div>
                    <div class="consigneeItem-info-bottom">
                        <span><?php echo ($vol["address"]); ?></span>
                    </div>
                </div>
                <div class="defaultBtn">
                    <span>默认</span>
                </div>
                <div class="editBtn"  data-id="<?php echo ($vol["id"]); ?>">
                    <img src="/Public/Zyly/images/biainji@2x.png" alt="">
                </div>
            </div><?php endforeach; endif; else: echo "暂无收货人信息" ;endif; ?>
       
        <div class="bottom-addConsignee">
            <div class="addConsigneeBox">
                <div class="addConsigneeBtn">
                    <img src="/Public/Zyly/images/++++++@2x.png" alt="">
                    <span>添加收货人</span>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
  $(function(){
      var goods_id =<?php echo $goods_id;?>;
      var buy_num = <?php echo $buy_num;?>;
      var uid=<?php echo ($uid); ?>;
      var shop_type=<?php echo ($shop_type); ?>;
      $('.editBtn').click(function(){
          var id=$(this).attr('data-id');
          location.href='<?php echo U("Address/edit_address");?>?id='+id+'&type=1&goods_id='+goods_id+'&buy_num='+buy_num+'&shop_type='+shop_type;
      })

      $('.addConsigneeBtn').click(function(){
        location.href='<?php echo U("Address/edit_address");?>?uid='+uid+'&type=1&goods_id='+goods_id+'&buy_num='+buy_num+'&shop_type='+shop_type;
      })
  })
  function selects(add_id,goods_id,buy_num,shop_type){
    location.href='<?php echo U("Goods/writeOrder");?>?add_id='+add_id+'&goods_id='+goods_id+'&buy_num='+buy_num+'&shop_type='+shop_type;
  }
</script>

</html>