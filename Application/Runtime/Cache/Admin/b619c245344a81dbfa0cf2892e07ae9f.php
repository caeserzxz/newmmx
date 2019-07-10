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
    <link href="/Public/admin/css/main.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/Public/admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/Public/admin/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/css/style.css" />

    <!--[if IE 6]>
    <script type="text/javascript" src="/Public/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!-- <script type="text/javascript" src="/Public/admin/js/jquery.js"></script> -->
    <script type="text/javascript" src="/Public/admin/js/action.js"></script>
    <script type="text/javascript" src="/Public/plugins/xheditor/xheditor-1.2.1.min.js"></script>
    <script type="text/javascript" src="/Public/plugins/xheditor/xheditor_lang/zh-cn.js"></script>
    <script type="text/javascript" src="/Public/admin/js/jCalendar.js"></script>
    <script type="text/javascript" src="/Public/admin/js/jquery.js"></script>
    <!-- 省市联动 -->
    <!-- <script type="text/javascript" src="http://lib.h-ui.net/jquery/1.9.1/jquery.min.js"></script> -->
    <!-- <script type="text/javascript" src="/Public/admin/js/jquery.provincesCity.js"></script>
    <script type="text/javascript" src="/Public/admin/js/provincesData.js"></script> -->

   

    <style>
        <?php
 $width=round($img['width']*0.6+6); $height =round( $width*$img['height'] / $img['width']); ?>

        li {list-style-type:none;}
        .dx1{float:left; margin-left: 17px; margin-bottom:10px; }
        .dx2{color:#090; font-size:16px;  border-bottom:1px solid #CCC; width:100% !important; padding-bottom:8px;}
        .dx3{width:120px; margin:5px auto; border-radius: 2px; border: 1px solid #b9c9d6; display:block;}
        .dx4{border-bottom:1px solid #eee; padding-top:5px; width:100%;}
        .img-err {
            position: relative;
            top: 2px;
            left: 82%;
            color: white;
            font-size: 20px;
            border-radius: 16px;
            background: #c00;
            height: 21px;
            width: 21px;
            text-align: center;
            line-height: 20px;
            cursor:pointer;
        }
        .btn{
            height: 25px;
            width: 60px;
            line-height: 24px;
            padding: 0 8px;
            background: #24a49f;
            border: 1px #26bbdb solid;
            border-radius: 3px;
            color: #fff;
            display: inline-block;
            text-decoration: none;
            font-size: 13px;
            outline: none;
            -webkit-box-shadow: #666 0px 0px 6px;
            -moz-box-shadow: #666 0px 0px 6px;
        }
        .btn:hover{
            border: 1px #0080FF solid;
            background:#D2E9FF;
            color: red;
            -webkit-box-shadow: rgba(81, 203, 238, 1) 0px 0px 6px;
            -moz-box-shadow: rgba(81, 203, 238, 1) 0px 0px 6px;
        }
        .cls{
            background: #24a49f;
        }
    </style>

    <title>添加产品</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span class="c-gray en">&gt;</span> 会员等级修改 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form class="form form-horizontal" action="/index.php/Admin/User/user_level_edit" method="post" onsubmit="return ac_from();" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>会员昵称：</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" disabled placeholder="昵称" name="uname" id="uname" value="<?php echo ($users["uname"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>会员等级：</label>
            <div class="formControls col-xs-8 col-sm-3">
                <span class="select-box">
                    <select class="select" size="1" name="level_id">
                        <option value="0" <?php if($users['level_id']==0){echo 'selected';} ?>>普通会员</option>
                        <option value="1" <?php if($users['level_id']==1){echo 'selected';} ?>>黄金会员</option>
                        <option value="2" <?php if($users['level_id']==2){echo 'selected';} ?>>白金会员</option>
                        <option value="3" <?php if($users['level_id']==3){echo 'selected';} ?>>钻石会员</option>
                    </select>
                </span>
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" name="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input type="hidden" name="id" id='id' value="<?php echo ($users["id"]); ?>">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/Public/admin/js/product.js"></script>

<!--_footer 作为公共模版分离出去-->

<script>


    function ac_from(){
      
    }
</script>

</body>
</html>