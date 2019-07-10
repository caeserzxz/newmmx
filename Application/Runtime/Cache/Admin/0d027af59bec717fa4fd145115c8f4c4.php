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
    <link href="/minipetmrschool/Public/admin/css/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/minipetmrschool/Public/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/minipetmrschool/Public/admin/js/action.js"></script>
    <script src="/minipetmrschool/Public/admin/js/jquery.flot.js"></script>

    <link href="/minipetmrschool/Public/admin/css/order.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/minipetmrschool/Public/admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/minipetmrschool/Public/admin/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/minipetmrschool/Public/admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/minipetmrschool/Public/admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/minipetmrschool/Public/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/minipetmrschool/Public/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/minipetmrschool/Public/admin/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/minipetmrschool/Public/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

    <!--[if IE]>
    <script src="/minipetmrschool/Public/admin/js/excanvas.min.js"></script>
    <![endif]-->

    <title>销售统计</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 销售统计 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="aaa_pts_show_2">

        <div>
            <div class="aaa_pts_4">销售数据趋势</div>
        </div>
        <div class="aaa_pts_3">

            <ul class="tongji_1">
                <li class="aaa_pts_4 <?php echo $type!='m' ? 'r1' : NULL; ?>" onclick="location='<?php echo U('order_count');?>?shop_id=<?php echo $shop_id ?>&type=d'">日视图</li>
                <li class="aaa_pts_4 <?php echo $type=='m' ? 'r1' : NULL; ?>"  onclick="location='<?php echo U('order_count');?>?shop_id=<?php echo $shop_id ?>&type=m'">月视图</li>
            </ul>

            <div id="tongji" style="width:100%; height:250px; overflow:visible;"></div>
        </div>

    </div>
    <br>

</div>



<script>
    var data = [],data_2=[];
    data.push(
        {
            "label":"交易订单数",
            "data": [<?php echo trim($data1,','); ?>],
    points: { show: true },
    color: '#f3bd18'
    }
    );

    function tongji_view(){
        var options = {
            lines: { show: true },
            points: { show: true },
            grid: {backgroundColor: { colors: ['#fff', '#eee'] },hoverable: true},
            yaxis: {ticks: 3,min: 0},
            xaxis: { tickDecimals: 0, tickSize: 1}
        };

        $.plot($("#tongji"), data, options);
    }
    tongji_view();
    $(window).on('resize',function(){
        tongji_view();
        request_data();
    });

    var bool = true;

    var previousPoint=null;
    $('#tongji').on('plothover', function (event, pos, item) {

        if(!bool){return;}
        bool=false;
        setTimeout(function(){bool=true},1000);

        if (item) {
            if(previousPoint != item.datapoint){
                previousPoint = item.datapoint;
                $('#tooltip').remove();
                item.datapoint[0]>=data[0].data.length-2 ? item.pageX-=80 : null;
                showTooltip(item.pageX, item.pageY ,'交易订单数: '+data[0].data[item.datapoint[0]][1]);
            }
        } else {
            $('#tooltip').remove();
            previousPoint = null;
        }
    });

    var inter = setInterval(function(){
        if(!$('.tickLabel').length>0){
            return;
        }
        clearInterval(inter);
        request_data();
    },50);

    function request_data(){
        var $day_String=[<?php echo trim($day_String,','); ?>];
        $('.tickLabel').each(function(index, element) {
            $(this).html($day_String[index]);
        });
    }

    function showTooltip(x, y, contents) {
        if($('#tooltip').length>0){return;}
        $('<div id="tooltip">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #fdd',
            padding: '2px',
            backgroundColor: '#fee',
            opacity: 0.80
        }).appendTo('body').fadeIn(200);
    }

</script>

</body>
</html>