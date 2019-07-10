<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>菜单修改</title>
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui.admin/css/style.css" />


    <link href="/Public/admin/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/Public/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="/Public/admin/css/addImg.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="/Public/admin/js/layer-v3.1.1/layer/layer.js"></script>
    <script src="/Public/admin/js/upLoad.js"></script>
</head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 自定义菜单管理 <span class="c-gray en">&gt;</span> 修改菜单 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="view">
        
        <div class="s-menu">
            <div class="container">
                <div class="menu-title">
                    <span>自定义菜单设置</span>
                </div>
                <form id="form" action="/index.php/Admin/Menu/menu_save" method="post">
                <div class="menu-content">
                    <div class="content-top">
                        <span class="span-b">菜单名称:</span>
                        <input type="text" name='name' id='names' value="<?php echo ($menus["name"]); ?>">
                        <p>(五个字以内,如"产品服务","最新优惠","联系我们"等)</p>
                    </div>
                    <div class="content-center">
                        <span class="span-b">返回类型:</span>
                        <select name="type" id="type"> 
                            <option value="0">请选类型</option>
                            <?php if($menus["type"] == view): ?><option value="view" selected="selected">跳转网页</option> 
                            <?php else: ?>
                                <option value="view">跳转网页</option><?php endif; ?>
                            <?php if($menus["type"] == menu): ?><option value="menu" selected="selected">菜单</option>
                            <?php else: ?>
                                <option value="menu">菜单</option><?php endif; ?>
                            <?php if($menus["type"] == click): ?><option value="click" selected="selected">发送消息</option>
                            <?php else: ?>
                                <option value="click">发送消息</option><?php endif; ?>
                            <?php if($menus["type"] == image_text): ?><option value="image_text" selected="selected">发送图文消息</option>
                            <?php else: ?>
                                <option value="image_text">发送图文消息</option><?php endif; ?>
                            <?php if($menus["type"] == miniprogram): ?><option value="miniprogram" selected="selected">跳转小程序</option>
                            <?php else: ?>
                                <option value="miniprogram">跳转小程序</option><?php endif; ?>
                             
                        </select> 
                    
                    </div>
                    <div class="content-bottom">
                        <span class="span-b">内容:</span>
                        <button type="button">插入链接</button>
                        <br>
                        <!-- <div class="url-name">
                            <span>链接名称:</span>
                            <input type="text">
                            <br>
                        </div> -->
                        <div class="url-src">
                            <span>链接地址:</span>
                            <input type="text" name='url' value="<?php echo ($menus["url"]); ?>">
                        </div>
                    </div>
                    <div class="content-click">
                         <!-- <div class="url-name">
                            <span>按钮名称:</span>
                            <input type="text" name="">
                            <br>
                        </div> -->
                        <div class="url-src">
                            <span>发送的消息:</span>
                            <textarea name="content" id="content" cols="60" rows="10"><?php echo ($menus["content"]); ?></textarea>
                            <!-- <input type="text" name='url' value=""> -->
                        </div>
                    </div>
                    <div class="content-miniprogram">
                         <div class="url-name">
                            <span>小程序appid:</span>
                            <input type="text" name="appid" value="<?php echo ($menus["appid"]); ?>">
                            <br>
                        </div>
                        <div class="url-src">
                            <span>小程序路径:</span>
                            <input type="text" name="pagepath" value="<?php echo ($menus["pagepath"]); ?>">
                            <div class="url-nameBox">
                                    <img src="/Public/admin/images/tishi.png">
                                    <span class="notes">提示:必须是公众号所绑定的小程序,如:pages/index/index</span>
                            </div>
                            <!-- <input type="text" name='url' value=""> -->
                        </div>
                        <div class="url-name">
                            <span>备用网页url:</span>
                            <input type="text" name="min_url" value="<?php echo ($menus["min_url"]); ?>">
                                <div class="url-nameBox">
                                    <img src="/Public/admin/images/tishi.png">
                                    <span class="notes">提示:备用网页是指访问小程序出错时才会显示的网页</span>
                                </div>
                            <br>
                        </div>
                    </div>
                    <div class="image_text">
                        <span>消息标题:</span>
                        <input type="text" name="image_title" value="<?php echo ($menus["image_title"]); ?>">
                        <br>
                        <span>消息链接:</span>
                        <input type="text" name="image_url" value="<?php echo ($menus["url"]); ?>">
                        <div class="url-src">
                            <span>消息的内容:</span>
                            <textarea name="image_content" id="image_content" cols="60" rows="10"><?php echo ($menus["content"]); ?></textarea>
                            <!-- <input type="text" name='url' value=""> -->
                        </div>
                        <div class="dua-box">
                            <h3>消息图片</h3>
                            <i class="closeImgbox"></i>
                            <div class="box-warp">
                                <div class="add-img">
                                    <img class="addImg" onclick="clickImg(this);" src="<?php echo ($menus["img_url"]); ?>" />
                                    
                                    <input name="text_img" id="id" type="file" class="upload_input" onchange="change(this)" value="$menus.img_url}" />
                                    <div class="preBlock">
                                        <img class="preview" id="preview" alt="" name="pic" width="190" height="190" />
                                    </div>
                                    <img class="delete" onclick="deleteImg(this)" src="/Public/admin/images/delete.png" />
                                </div>
                            </div>

                        </div>
                    </div>
                    <button class="tijiao" type="button">提交</button>
                    <input type="hidden"  name="id" value="<?php echo ($menus["id"]); ?>">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(function () {
        var type=$('#type').val();
        
        if(type=='view'){
                $('.content-bottom').css('display','block');
                $('.content-click').css('display','none');
                $('.content-miniprogram').css('display','none');
                $('.image_text').css('display','none');
            }else if(type == 'menu'){
                $('.content-bottom').css('display','none');
                $('.content-click').css('display','none');
                $('.content-miniprogram').css('display','none');
                $('.image_text').css('display','none');
            }else if(type == 'click'){
                $('.content-click').css('display','block');
                $('.content-bottom').css('display','none');
                $('.content-miniprogram').css('display','none');
                $('.image_text').css('display','none');
                
            }else if(type== 'miniprogram'){
                $('.content-miniprogram').css('display','block');
                $('.content-bottom').css('display','none');
                $('.content-click').css('display','none');
                $('.image_text').css('display','none');
            }else if(type == 'image_text'){
                $('.image_text').css('display','block');
                $('.content-miniprogram').css('display','none');
                $('.content-bottom').css('display','none');
                $('.content-click').css('display','none');
            }

        $('#type').change(function(){
            var type=$('#type').val();
            // console.log(type);
            if(type=='view'){
                $('.content-bottom').css('display','block');
                $('.content-click').css('display','none');
                $('.content-miniprogram').css('display','none');
                $('.image_text').css('display','none');
            }else if(type == 'menu'){
                $('.content-bottom').css('display','none');
                $('.content-click').css('display','none');
                $('.content-miniprogram').css('display','none');
                $('.image_text').css('display','none');
            }else if(type == 'click'){
                $('.content-click').css('display','block');
                $('.content-bottom').css('display','none');
                $('.content-miniprogram').css('display','none');
                $('.image_text').css('display','none');
            }else if(type== 'miniprogram'){
                $('.content-miniprogram').css('display','block');
                $('.content-bottom').css('display','none');
                $('.content-click').css('display','none');
                $('.image_text').css('display','none');
            }else if(type == 'image_text'){
                $('.image_text').css('display','block');
                $('.content-miniprogram').css('display','none');
                $('.content-bottom').css('display','none');
                $('.content-click').css('display','none');
            }
        })

        $('.tijiao').click(function(){
            var type=$('select[name=type]').val();
            var name=$('#names').val();
            var url=$('input[name=url]').val();
            var content = $('#content').val();
            var image_title =$('input[name=image_title]').val();
            var image_url =$('input[name=image_url]').val();
            var image_content = $('#image_content').val()
            if(type==0){
               layer.msg('请选择类型');
               return false; 
            }else if(type=='view'){
                if(name==''){
                    layer.msg('请填写菜单名称');
                    return false;
                }else if(url==''){
                    layer.msg('请填写链接');
                    return false;
                }
            }else if(type=='menu'){
                if(name==''){
                    layer.msg('请填写菜单名称');
                    return false;
                }
            }else if(type == 'click'){
                if(name==''||name==null){
                    layer.msg('请填写菜单名称');
                    return false;
                }else if(content==''|content==null){
                    layer.msg('请填要发送的消息');
                    return false;
                }
            }else if(type=='image_text'){
                if(name==''||name==null){
                    layer.msg('请填写菜单名称');
                    return false;
                }else if(image_title==''||image_title==null){
                    layer.msg('请填写图文标题');
                    return false;
                }else if(image_url==''||image_url==null){
                    layer.msg('请填写图文链接');
                    return false;
                }else if(image_content==''||image_content==null){
                    layer.msg('请填写图文内容');
                    return false;
                }
            }
           
             $.ajax({
                    url: '/index.php/Admin/Menu/menu_save',
                    type: 'POST',
                    cache: false,
                    data: new FormData($('#form')[0]),
                    processData: false,
                    contentType: false,
                    dataType:"json",
                    // beforeSend: function(){
                    //     $('.loadEffect').attr("style","display:block;")
                    // },
                    success : function(data) {
                        console.log(data);
                        // return false;
                             switch (data.status)
                            {
                                case 1:
                                   layer.msg(data.msg,{time:1400},function(){
                                      window.location.href='/index.php/Admin/Menu/menu_list';
                                   });
                                    break;
                                case -1:
                                   layer.msg(data.msg,{time:1400});
                                    break;
                            }
                    }
                });
            
        })

    })

</script>

</html>