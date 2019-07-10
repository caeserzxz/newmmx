<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/Public/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="/Public/admin/js/jquery.js"></script> -->
    <script type="text/javascript" src="/Public/admin/js/action.js"></script>
    <script src="/Public/admin/js/layer-v3.1.1/layer/layer.js"></script>

    <link href="/Public/admin/css/order.css" rel="stylesheet" type="text/css" />

    <title>全部订单</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 全部订单 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <form name='form' action="<?php echo U('Order/withdraw_list');?>" method='get'>
        <!--  -->
    </form>
    <br>
    <table class="table table-border table-bordered table-bg">
        <thead>

        <tr class="text-c">
            <th width="40">提现订单ID</th>
            <th width="100">提现用户</th>
            <th width="50">用户头像</th>
            <th width="60">真实姓名</th>
            <th width="90">联系方式</th>
            <th width="40">金额</th>
            <th width="80">开户行</th>
            <th width="120">银行卡号</th>
            <th width="50">提现状态</th>
            <th width="80">提现时间</th>
            <th width="150">操作</th>
        </tr>
        </thead>



        <?php if(is_array($withdraw)): $i = 0; $__LIST__ = $withdraw;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$order): $mod = ($i % 2 );++$i;?><tr data-id="<?php echo ($order["id"]); ?>" data-name="<?php echo ($order["name"]); ?>" class="text-c">
                <td><?php echo ($order["id"]); ?></td>
                <td><?php echo ($order["uname"]); ?></td>
                <td><img style="width:50px;height:auto;" src="<?php echo ($order["photo"]); ?>" alt=""></td>
                <td><?php echo ($order["real_name"]); ?></td>
                <td><?php echo ($order["phone"]); ?></td>
                <td><?php echo ($order["money"]); ?></td>
                <td><?php echo ($order["bank_name"]); ?></td>
                <td><?php echo ($order["banks"]); ?></td>
                <td class="status">
                    <?php if($order["status"] == 1): ?><font style="color:red">待审核</font>
                        <?php elseif($order["status"] == 2): ?><font style="color:#900">已转账</font>
                        <?php elseif($order["status"] == 4): ?><font style="color:#900">待转账</font>
                        <?php elseif($order["status"] == 5): ?><font style="color:#900">审核不通过</font>
                        <?php else: ?>
                        <font class='font_color'>驳回</font><?php endif; ?>
                </td>
                <td><?php echo ($order["create_time"]); ?></td>
                <td>
                    <a onclick="carry(<?php echo ($order["id"]); ?>,4);">通过</a> |
                    <a onclick="carry(<?php echo ($order["id"]); ?>,5);">不通过</a> |
                    <a onclick="carry(<?php echo ($order["id"]); ?>,2);">手动转账</a> |
                    <a onclick="carry(<?php echo ($order["id"]); ?>,3);">驳回</a> |
                
                </td>
            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        <tr>
            <td colspan="10" class="td_2">
                 <?php echo ($page_index); ?>   
             </td>
         </tr>
    </table>
</div>

<script>
    //搜索按钮点击事件
    function product_option(page){
            
        var obj={
            "name":$("#name").val(),
            "tel":$("#tel").val(),
        }
        var url='?page='+page;
        $.each(obj,function(a,b){
            url+='&'+a+'='+b;
        });
        location=url;
    }

    // function openDialog(){
    //     //alert('aaa');die();
    //     location="<?php echo U('Inout/expOrder');?>";
    // }

    // function openDialog2(){
    //     var shop_id = $('#shop_id').val();
    //     var type = $('#type').val();
    //     var status = $('#status').val();
    //     var start_time = $('#start_time').val();
    //     var end_time = $('#end_time').val();
    //     //alert('aaa');die();
    //     location="<?php echo U('Inout/expOrder');?>?shop_id="+shop_id+"&type="+type+"&status="+status+"&start_time="+start_time+'&end_time='+end_time;
    // }

    //订单状态字体颜色设置
    $('.font_color').each(function(index, element) {
        var obj = $(this);
        switch(obj.html()){
            case '待发货':
            case '交易完成':
            case '待收货':
                obj.css('color','#090');
                break;
            case '交易关闭':
            case '已退款':
                obj.css('color','#900');
                break;
            case '申请退款':
                obj.css('color','#f00');
            default:
                obj.css('color','#063559');
                break;
        }
    });

    //选择商家按钮事件
    function win_open(url,width,height){

        height==null ? height=600 : height;
        width==null ?  width=800 : width;
        var myDate=new Date()
        window.open(url,'newwindow'+myDate.getSeconds(),'height='+height+',width='+width);
    }

    //提现驳回
    function refuse(id){
        if(confirm("驳回后结果不可更改,确认驳回吗?"))
        {
            
        }
    }

    //手动转账
    function carry(id,status){
        if(status==2){
            var str="确认转账后结果不可更改,确认转账吗?";
        }else if(status==3){
            var str ="确认驳回吗?";
        }
        else if(status==4){
            var str="确认审核通过吗?";
        }
        else if(status==5){
            var str="确认审核不通过吗?";
        }

        if(confirm(str))
        {
            $.ajax({
				'url':'/index.php/Admin/Order/carry',
				'type':'post',
				'data':{'id':id,'status':status},
				'dataType':'json',
				'success':function(data){
                    console.log(data);
                    
                    if(data.status==1){
                        layer.msg(data.msg,{time:1400},function(){
                            window.location.href='/index.php/Admin/Order/withdraw_list';
                        });
                        return;
                    }else{
                        layer.msg(data.msg,{time:1400});
                        return;
                    }
				}
			});
        }
    }


</script>

</body>
</html>