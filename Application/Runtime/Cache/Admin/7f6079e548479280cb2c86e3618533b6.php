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
    <script type="text/javascript">
        function openDialog(type){
            window.open("<?php echo U('Inout/expUser');?>?tel=<?php echo ($tel); ?>&name=<?php echo ($name); ?>");
        }
    </script>
    <title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 代理列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        <input type="text" class="input-text" style="width:250px" placeholder="用户名" id="name" value="<?php echo ($name); ?>">
        <input type="text" class="input-text" style="width:250px" placeholder="手机号码" id="tel" value="<?php echo ($tel); ?>">
        <button type="button" class="btn btn-success" id="" name="" onclick="product_option(0);"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
    </div>
    <br>
    <table class="table table-border table-bordered table-bg">
        <thead>

        <tr class="text-c">
            <th width="40">ID</th>
            <th width="100">头像</th>
            <th width="150">账户名</th>
            <th width="130">注册时间</th>
            <th width="150">代理的会员级别</th>
            <th width="150">代理区域</th>
            <th width="125">订单数量</th>
            <th width="125">订单业绩</th>
            <th width="150">联系方式</th>
            <th width="150">代理的状态</th>
            <th width="100">操作</th>
        </tr>
        </thead>


        <tbody id="news_option">
        <!-- 遍历 -->
        <?php if(is_array($userlist)): $i = 0; $__LIST__ = $userlist;if( count($__LIST__)==0 ) : echo "暂时没有数据" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><tr data-id="<?php echo ($v["id"]); ?>" data-name="<?php echo ($v["name"]); ?>" class="text-c">
                <td><?php echo ($v["id"]); ?></td>
                <td><img src="<?php echo ($v["photo"]); ?>" width="80px" height="80px" /></td>
                <td><?php echo ($v["uname"]); ?></td>
                <td><?php echo ($v["addtime"]); ?></td>
                <td><?php echo ($v["level_name"]); ?></td>
                <td><?php echo ($v["state"]); echo ($v["city"]); echo ($v["area"]); ?></td>
                <td></td>
                <td></td>
                <td>
                    <?php if($v["tel"] != ''): echo ($v["tel"]); ?>
                    <?php else: ?>
                        <?php echo ($v["email"]); endif; ?>
                </td>
               
                <td>
                    <?php if($v["is_daili"] == 3): ?><span style="color:red;">待审核</span>
                    <?php else: ?>
                        <?php if($v["daili_type"] == 3): ?><span style="color:green;">区代</span>
                        <elseif conditiom="$v.daili_type eq 2">
                            <span style="color:green;">市代</span>   
                        <?php else: ?>
                            <span style="color:green;">省代</span><?php endif; endif; ?>
                </td>
                <td class="obj_1">
                    <!-- <a href="<?php echo U('User/add');?>?id=<?php echo ($v["id"]); ?>">修改</a>-->
                    <?php if($v["is_daili"] == 3): ?><a href="<?php echo U('User/daili_edit');?>?id=<?php echo ($v["id"]); ?>&page=<?php echo ($page); ?>">审核</a>
                    <?php else: ?>
                        <a href="<?php echo U('User/daili_edit');?>?id=<?php echo ($v["id"]); ?>&page=<?php echo ($page); ?>">编辑</a><?php endif; ?>
                </td>
            </tr><?php endforeach; endif; else: echo "暂时没有数据" ;endif; ?>
        <!-- 遍历 -->
        </tbody>
        <tr>
            <td colspan="10" class="td_2">
                <?php echo ($page_index); ?>
            </td>
        </tr>
    </table>
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
    //分页
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

    //更改按钮
    // if(type=='xz'){
    //     $('.obj_1').html('<input type="button" value="选 择" class="aaa_pts_web_3" style="margin:3px 0;" onclick="window_opener(this)">');
    // }

    function window_opener(e){
        var obj=$(e);
        window.opener.document.getElementById('uid').value=obj.parent().parent().attr('data-id');
        window.opener.document.getElementById('user_name').value=obj.parent().parent().attr('data-name');

        window.close();
    }

    function del_id_urls(id,page){
        if(confirm('你确定要执行此操作吗？')){
            location.href='<?php echo U("del");?>?did='+id+'&page='+page;
        }
    }
    
    function set_daili(id,page,type){
        if(confirm('你确定要执行此操作吗？')){
            location.href='<?php echo U("User/set_daili");?>?id='+id+'&page='+page+'&type='+type;
        }
    }
</script>

</body>
</html>