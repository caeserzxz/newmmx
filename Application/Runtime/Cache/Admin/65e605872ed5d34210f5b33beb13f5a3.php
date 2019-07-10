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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
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
            <th width="125">用户昵称</th>
            <th width="125">推荐人</th>
            <th width="130">注册时间</th>
            <th width="100">会员等级</th>
            <th width="50">状态</th>
            <!--<th width="100">是否为代理</th>-->
            <th width="100">操作</th>
        </tr>
        </thead>


        <tbody id="news_option">
        <!-- 遍历 -->
        <?php if(is_array($userlist)): $i = 0; $__LIST__ = $userlist;if( count($__LIST__)==0 ) : echo "暂时没有数据" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><tr data-id="<?php echo ($v["id"]); ?>" data-name="<?php echo ($v["name"]); ?>" class="text-c">
                <td><?php echo ($v["id"]); ?></td>
                <td><img src="<?php echo ($v["photo"]); ?>" width="80px" height="80px" /></td>
                <td><?php echo ($v["uname"]); ?></td>
                <td><?php echo ($v["top_uname"]); ?></td>
                <td><?php echo ($v["addtime"]); ?></td>
                <td><?php echo ($v["level_name"]); ?></td>
                <td><?php if($v["del"] != 0): ?><label style="color:red;">已禁用</label><?php else: ?><label style="color:green;">正常</label><?php endif; ?></td>
                <!--<td><?php if($v["is_daili"] == 1): ?><label style="color:red;">否</label><?php else: ?><label style="color:green;">是</label><?php endif; ?></td>-->
                <td class="obj_1">
                    <!-- <a href="<?php echo U('User/add');?>?id=<?php echo ($v["id"]); ?>">修改</a> -->
                    <a onclick='del_id_urls(<?php echo ($v["id"]); ?>,<?php echo ($page); ?>)'><?php if($v["del"] != 0): ?><label style="color:green;">恢复</label><?php else: ?>禁用<?php endif; ?></a>
                    &nbsp&nbsp&nbsp&nbsp
                   <!-- <?php if($v["is_daili"] == 1): ?><a onclick='set_daili(<?php echo ($v["id"]); ?>,<?php echo ($page); ?>,1);'><label style="color:green;">设为代理</label></a><?php else: ?><a onclick='set_daili(<?php echo ($v["id"]); ?>,<?php echo ($page); ?>,2);'>取消代理</a><?php endif; ?> -->
                   <!--<a  style="color:green;" href="/index.php/Admin/User/daili_edit?id=<?php echo ($v["id"]); ?>">代理操作</a>-->
                   &nbsp&nbsp&nbsp&nbsp
                   <label style="color:green;" onclick='set_level(<?php echo ($v["id"]); ?>,<?php echo ($page); ?>);'>设置等级</label>
                   &nbsp&nbsp&nbsp&nbsp
                   <label style="color:green;" onclick='del_user(<?php echo ($v["id"]); ?>,this);'>删除</label>
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
    if(type=='xz'){
        $('.obj_1').html('<input type="button" value="选 择" class="aaa_pts_web_3" style="margin:3px 0;" onclick="window_opener(this)">');
    }

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
    
    function set_level(id){
        location.href='<?php echo U("User/user_level_edit");?>?id='+id;
    }

    function del_user(id,obj){
        layer.confirm('是否删除该用户？', {
            btn: ['是','否'] //按钮
        }, function(){  
            $.ajax({
				'url':'/index.php/Admin/User/del_user',
				'type':'get',
				'data':{'id':id},
				'dataType':'json',
				'success':function(data){
                    if(data.status==1){
                        layer.msg('删除成功',{time:500},function(){
                            $(obj).parent().parent().remove();
                        });
                    }else{
                        layer.msg('删除失败',{time:2000});
                    }
				}
			});
        });
    }
</script>

</body>
</html>