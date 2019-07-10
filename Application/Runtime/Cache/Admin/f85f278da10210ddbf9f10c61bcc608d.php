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

    <title>公众号配置</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 综合管理 <span class="c-gray en">&gt;</span> 公众号配置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form class="form form-horizontal" action="<?php echo U('More/wechat');?>" method="post" onsubmit="return ac_from();"  enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>公众号名称：</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="公众号名称" name="name" id="name" value="<?php echo ($info["name"]); ?>">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>负责人</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="负责人" name="user_name" id="user_name" value="<?php echo ($info["user_name"]); ?>">
            </div>
        </div>

         <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>logo图片，图片大小100*100</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type='hidden' name="logo" id="photo_sj0" value="<?php echo $info['logo']; ?>">
                <!-- <iframe class="pro_2" src="/Data/inc/photo_add.php?id=photo_sj0&width=200&height=200" frameborder="0"></iframe> -->
                <?php if ($info['logo']) { ?>
                <img src="/Data/<?php echo $info['logo']; ?>" width="100" height="100" /><br /><br />
                <?php } ?>
                <input  type="file"  name="file2" id="logo" >
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>公众号简介</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="公众号简介" name="introduction" id="introduction" value="<?php echo ($info["introduction"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>客服微信号</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="客服微信号" name="user_wechat" id="user_wechat" value="<?php echo ($info["user_wechat"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>客服电话</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="客服电话" name="user_phone" id="user_phone" value="<?php echo ($info["user_phone"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮    箱</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="邮    箱" name="user_email" id="user_email" value="<?php echo ($info["user_email"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>版权信息</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="版权信息" name="copyright" id="copyright" value="<?php echo ($info["copyright"]); ?>">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>appid(微信appid)</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text"  class="input-text" placeholder="微信appid" name="wx_appid" id="wx_appid" value="<?php echo ($info["wx_appid"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>secret(微信secret)</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text"  class="input-text" placeholder="微信secret" name="wx_secret" id="wx_secret" value="<?php echo ($info["wx_secret"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>URL(服务器地址)</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" disabled class="input-text" placeholder="服务器地址" name="wx_url" id="wx_url" value="<?php echo ($info["wx_url"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>Token(令牌)</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" disabled class="input-text" placeholder="Token(令牌)" name="wx_token" id="wx_token" value="<?php echo ($info["wx_token"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>EncodingAESKey(消息加解密密钥)</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" disabled class="input-text" placeholder="EncodingAESKey(消息加解密密钥))" name="wx_coding_key" id="wx_coding_key" value="<?php echo ($info["wx_coding_key"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" disabled class="input-text" placeholder="商户号" name="wx_mchid" id="wx_mchid" value="<?php echo ($info["wx_mchid"]); ?>">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户API密钥</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" disabled class="input-text" placeholder="商户API密钥" name="wx_mchkey" id="wx_mchkey" value="<?php echo ($info["wx_mchkey"]); ?>">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius"  type="submit" name="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">

            </div>
        </div>
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
        var title=document.getElementById('name').value;
        if(!title){
            alert('请输入公众号名称！');
            return false;
        }
    }
</script>

</body>
</html>