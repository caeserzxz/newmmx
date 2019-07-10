<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>地址管理</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/addrManage.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/input.js"></script>
    <script src="/Public/Zyly/js/layer-v3.1.1/layer/layer.js"></script>
</head>

<body>
    <div class="addrManage">
        <?php if(is_array($address)): $i = 0; $__LIST__ = $address;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i;?><div class="addrManageItem addrItenAct">
                <div class="addrManageItem-top">
                    <div class="addrInfo-name">
                        <span><?php echo ($vol["name"]); ?></span>
                        <span><?php echo ($vol["tel"]); ?></span>
                    </div>
                    <div class="addrInfo-addr">
                        <span><?php echo ($vol["address"]); ?></span>
                    </div>
                    <?php if($vol["is_default"] == 1): ?><div class="manageDefaultBtn">
                            <span>默认</span>
                        </div><?php endif; ?>
                </div>
                <div class="addrManageItem-bottom">
                    <?php if($vol["is_default"] == 1): ?><div class="addrManageItem-bottom-left">
                            <lable>
                                <i class='input_style checkbox_bg radio_bg_check' onclick="set_default(<?php echo ($vol["id"]); ?>)"><input name="sel" id="selectItem" type="radio"></i>
                                默认地址
                            </lable>
                        </div>
                    <?php else: ?>
                        <div class="addrManageItem-bottom-left">
                            <lable>
                                <i class='input_style checkbox_bg ' onclick="set_default(<?php echo ($vol["id"]); ?>)"><input name="sel" id="selectItem" type="radio"></i>
                                默认地址
                            </lable>
                        </div><?php endif; ?>
                    <div class="addrManageItem-bottom-right">
                        <div class="editBtn" data-id="<?php echo ($vol["id"]); ?>">
                            <img src="/Public/Zyly/images/qianqian@2x.png" alt="">
                            <span>编辑</span>
                        </div>
                        <div class="delect"  data-id="<?php echo ($vol["id"]); ?>">
                            <img src="/Public/Zyly/images/lajit@2x.png" alt="">
                            <span>删除</span>
                        </div>
                    </div>

                </div>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
        
        <div class="bottom-addrManage">
            <div class="addrManageBox">
                <div class="addrManageBtn">
                    <img src="/Public/Zyly/images/++++++@2x.png" alt="">
                    <span>添加收货人</span>
                </div>
            </div>
        </div>
    </div>


</body>
<script>
$(function(){
    var uid=<?php echo ($uid); ?>;
    $('.editBtn').click(function(){
        var id=$(this).attr('data-id');
        location.href='<?php echo U("Address/edit_address");?>?id='+id+'&type=2&uid='+uid;
    })

    $('.delect').click(function(){
        var id=$(this).attr('data-id');
        layer.confirm('是否删除地址？', {
            btn: ['是','否'] //按钮
        }, function(){  
            $.ajax({
				'url':'/index.php/Zyly/Address/del_address',
				'type':'get',
				'data':{'id':id},
				'dataType':'json',
				'success':function(data){
                    if(data.status==1){
                        layer.msg('删除成功',{time:500},function(){
                            location.reload();
                        });
                    }else{
                        layer.msg('删除失败',{time:2000});
                    }
				}
			});
        });
        // location.href='<?php echo U("Address/del_address");?>?id='+id;
    })

    $('.addrManageBtn').click(function(){
        var id=$(this).attr('data-id');
        location.href='<?php echo U("Address/edit_address");?>?type=2&uid='+uid;
    })
})

    function set_default(id){
        $.ajax({
            'url':'/index.php/Zyly/Address/default_address',
            'type':'get',
            'data':{'id':id},
            'dataType':'json',
            'success':function(data){
                if(data.status==1){
                    layer.msg(data.msg,{time:500},function(){
                        location.reload();
                    });
                }else{
                    layer.msg(data.msg,{time:1000});
                }
            }
        });
    }
</script>

</html>