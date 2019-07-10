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
    <script src="/Public/admin/js/layer-v3.1.1/layer/layer.js"></script>
    <style>
        .add_menus{
            width: 90px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            color: #fff;
            margin-left: 90%;
            border: 1px solid #ccc;
            background: #5a98de;
            outline: none;
            cursor: pointer;
        }
        .tijiao{
            width: 120px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            color: #fff;
            border: 1px solid #ccc;
            background: #5a98de;
            outline: none;
            cursor: pointer;
            margin: 20px 0;
        }
    </style>
    <title>产品管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 自定义菜单管理 <span class="c-gray en">&gt;</span> 菜单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

    <table class="table table-border table-bordered table-bg">
        <div class="menu-title">
           <a href="/index.php/Admin/Menu/menu_add"><button class='add_menus' type="button">添加菜单</button></a>
        </div>
        <thead>
        <tr class="text-c">
            <th class="checkbox checkbox-primary" width="20">
                <input type="checkbox" class="styled" checked="checked" id="selectAll">
                <label for="selectAll">全选</label>
            </th>
            <th width="130">ID</th>
            <th width="140">菜单名</th>
            <th width="80">是否有子菜单</th>
            <th width="120">菜单类型</th>
            <th width="80">操作</th>
        </tr>
        </thead>


        <tbody id="news_option">
        <!-- 遍历 -->
        <?php if(is_array($data)): $k = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "暂时没有数据" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($k % 2 );++$k;?><tr class="text-c">
                <td>
                    <input type="hidden" name="id" value="<?php echo ($vol["id"]); ?>">
                    <input class='checkeds' checked="checked" type="checkbox">
                </td>
                <td class='id'><?php echo ($vol["id"]); ?></td>
                <td><?php echo ($vol["name"]); ?></td>
                <td>
                    <?php if($vol["type"] == 'menu'): ?>有
                    <?php else: ?>
                        无<?php endif; ?>
                </td>
                <?php if($vol["type"] == view): ?><td>跳转网页</td>
                <?php elseif($vol["type"] == menu): ?>
                    <td>菜单</td>
                <?php elseif($vol["type"] == click): ?>
                    <td>发送消息</td>
                <?php elseif($vol["type"] == miniprogram): ?>
                    <td>跳转小程序</td><?php endif; ?>
                <td>
                    <?php if($vol["type"] == 'menu'): ?>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <a href="/index.php/Admin/Menu/menu_add?id=<?php echo ($vol["id"]); ?>">添加子菜单</a>
                    <?php else: ?>
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<?php endif; ?>
                    <a href="/index.php/Admin/Menu/menu_save?id=<?php echo ($vol["id"]); ?>">编辑</a>
                    <a href="javacript:void(0);">删除</a>
                    <!-- <img src="/Public/admin/images/del.png"  onclick="del(<?php echo ($vol["id"]); ?>)" alt="删除"> -->
                </td>
                
            </tr>
            <?php if(is_array($vol["son"])): foreach($vol["son"] as $key=>$son): ?><tr  class="text-c">
                    <td>
                        <input type="hidden" name="id" value="<?php echo ($son["id"]); ?>">
                        <input class='checkeds' checked="checked" type="checkbox">
                    </td>
                    
                    <td class='id'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-----<?php echo ($son["id"]); ?></td>
                    <td><?php echo ($son["name"]); ?></td>
                    <td>
                        无
                    </td>
                    <?php if($son["type"] == view): ?><td>跳转网页</td>
                    <?php elseif($son["type"] == menu): ?>
                        <td>菜单</td>
                    <?php elseif($son["type"] == click): ?>
                        <td>发送消息</td>
                    <?php elseif($son["type"] == miniprogram): ?>
                        <td>跳转小程序</td><?php endif; ?>
                    <td>
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <a href="/index.php/Admin/Menu/menu_add?id=<?php echo ($son["id"]); ?>">添加子菜单</a>
                        <a href="/index.php/Admin/Menu/menu_save?id=<?php echo ($son["id"]); ?>">编辑</a>
                        <a href="javacript:void(0);" onclick="del(<?php echo ($son["id"]); ?>)">删除</a>
                        <!-- <img src="/Public/admin/images/del.png"  onclick="del(<?php echo ($son["id"]); ?>)" alt="删除"> -->
                    </td>
                </tr><?php endforeach; endif; endforeach; endif; else: echo "暂时没有数据" ;endif; ?>
        <!-- 遍历 -->
        </tbody>
        <tr>
            <td colspan="10" class="td_2">
                <?php echo ($page_index); ?>
            </td>
        </tr>
    </table>
    <div class="tab-tip" style="width: 960px; margin-left: auto; margin-right: auto;text-align:center;">
        <p>您确认微信自定义菜单建立完毕后,点击"生成菜单"按钮我们把数据发送至微信公众平台</p>
        <p>如果您的参数符合规则,微信自定义菜单将创建成功。由于微信客户端缓存,需要24小时微信客户端才可以展示出来。</p>
        <p>建议测试时可以尝试取消关注公众账号后，再次关注，则可以看到创建后的效果。</p>
        <p><span style="color: red;">如果有子菜单，必须创建一个子菜单</span></p>
        <p style="color:red;">自定义菜单最多包括3个一级菜单，每个一级菜单最多包含5个二级菜单。</p>
        <p style="color:red;">一级菜单最多5个汉字，二级菜单最多7个汉字，多出来的部分将会以“...”代替。</p>
        <button class='tijiao' type="button">生成菜单</button>
    </div>
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
      $(function () {
        //实现全选反选
        $("#selectAll").on('click', function () {
            $("tbody input:checkbox").prop("checked", $(this).prop('checked'));
        })
        $("tbody input:checkbox").on('click', function () {
            //当选中的长度等于checkbox的长度的时候,就让控制全选反选的checkbox设置为选中,否则就为未选中
            if ($("tbody input:checkbox").length === $("tbody input:checked").length) {
                $("#selectAll").prop("checked", true);
            } else {
                $("#selectAll").prop("checked", false);
            }
        })
        $('.tijiao').click(function(){
            var checked_checkbox=$('.checkeds:checked');
            var ids='';
            // $('.checkeds:checked').siblings().val()
            $.each(checked_checkbox, function(i,v){
                //v是一个document元素对象，需要转化为jq对象
                //根据选中的checkbox向上找当前行的ul标签，取到自定义的属性cart_id
                var id = $(v).siblings().val();
                if(id > 0){
                    //拼接
                    ids += id + ',';
                }
            });
            ids = ids.slice(0, -1);
            // window.location.href='/index.php/Admin/Menu/create_menu?ids='+ids;
            $.ajax({
                'url':'/index.php/Admin/Menu/create_menu',
                'type':'get',
                'data':{'ids':ids},
                'dataType':'json',
                'success':function(response){
                    console.log(response);
                    // return false;
                    if(response == 0){
                        layer.msg('已成功生成菜单',{time:1400},function(){
                            window.location.reload();
                        });
                        return;
                    }else{
                        layer.msg('生成菜单失败,错误代码:'+response);
                        return;
                    }
                }
            });
           
        })
    })
    function del(id){
        layer.confirm("确认要删除吗，删除后不能恢复", { title: "删除确认" }, function (index) {  
                layer.close(index);  
               $.ajax({
                'url':'/index.php/Admin/Menu/menu_del',
                'type':'get',
                'data':{'id':id},
                'dataType':'json',
                'success':function(data){
                    console.log(data);
                    
                    if(data['status'] == 1){
                        layer.msg(data.msg,{time:1400},function(){
                                      window.location.href='/index.php/Admin/Menu/menu_list';
                                   });
                        return;
                    }else{
                         layer.msg(data.msg,{time:1400});
                        return;
                    }
                }
            });
            });   

    }
</script>
</body>
</html>