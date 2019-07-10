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
    <script type="text/javascript" src="/Public/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/Public/admin/js/action.js"></script>

    <title>等级设置</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 等级管理<span class="c-gray en">&gt;</span> 等级设置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- <form class="form form-horizontal" action="<?php echo U('User/level_edit');?>" method="post" onsubmit="return ac_from();"  enctype="multipart/form-data">

    </form> -->
    <!-- <input class="btn btn-default" type="button" value="返回"> -->
    <i class="Hui-iconfont Hui-iconfont-slider-left" onclick="fanhui()" style="cursor:pointer;">返回</i>
    <ul class="commentList">
        <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="<?php echo ($info["photo"]); ?>"> </i></a>
            <div class="comment-main">
                <header class="comment-header">
                    <div class="comment-meta"><a class="comment-author" href="#"><?php echo ($info["uname"]); ?></a> 评论于
                    <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20"><?php echo date('Y-m-d H:i:s',$info['addtime']); ?></time>
                    </div>
                </header>
                <div class="comment-body">
                    <p><?php echo ($info["concent"]); ?></p> 
                </div>
            </div>
        </li>
    </ul>
    <br>
    <form class="form form-horizontal" action="<?php echo U('Product/comment_detail');?>" method="post" onsubmit="return ac_from();"  enctype="multipart/form-data">
        <div>
            回复内容:<textarea rows="10" cols="30" class="textarea radius" name="reply_content" id="reply_content" <?php  echo $info['reply_content']?'disabled':'' ?>><?php echo ($info["reply_content"]); ?></textarea>
        </div>
        <br>
        <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>">
        <input type="hidden" name="page" value="<?php echo ($page); ?>">
        <input class="btn btn-block radius" type="submit" value="回复">
    </form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/Public/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Public/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/Public/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/Public/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/Public/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/Public/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Public/admin/lib/laypage/1.2/laypage.js"></script>


<script>
    function ac_from(){
        var reply_content=$('#reply_content').val();
        if(reply_content==''||reply_content==null){
            layer.msg('回复内容不能为空', { time: 1500 });
            return false;
        }
    }

    function fanhui(){
        window.location.href="javascript:history.go(-1)";
    }
</script>

</body>
</html>