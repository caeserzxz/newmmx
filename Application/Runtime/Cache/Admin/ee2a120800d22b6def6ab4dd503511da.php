<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加菜单</title>
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 自定义菜单管理 <span class="c-gray en">&gt;</span> 添加菜单 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="view">
        <div class="s-menu">
            <div class="container">
                <div class="menu-title">
                    <?php if($menus == ''): ?><span>自定义菜单设置</span>
                    <?php else: ?>
                        <span><b><?php echo ($menus["name"]); ?></b>的子菜单设置</span><?php endif; ?>
                   
                </div>
                <form id="form" action="/index.php/Admin/Menu/menu_add" method="post">
                <div class="menu-content">
                    <div class="content-top">
                        <span class="span-b">菜单名称:</span>
                        <input type="text" id='names' name='name' value="">
                        <p>(五个字以内,如"产品服务","最新优惠","联系我们"等)</p>
                    </div>
                    <div class="content-center">
                        <span class="span-b">返回类型:</span>
                        <dl class="select">
                            <dt>选择类型</dt>
                            <dd>
                                <ul>
                                    <li>
                                        <a href="#" onclick="select_type('view')">跳转网页</a>
                                    </li>
                                    <?php if($menus == null): ?><li>
                                        <a href="#" onclick="select_type('menu')">菜单</a>
                                    </li><?php endif; ?>
                                    <li>
                                    <a href="#" onclick="select_type('click')">发送消息</a>
                                    </li>
                                    <li>
                                    <a href="#" onclick="select_type('image_text')">发送图文消息</a>
                                    </li>
                                    <li>
                                    <a href="#" onclick="select_type('miniprogram')">跳转小程序</a>
                                    </li>
                                    
                                </ul>
                            </dd>
                        </dl>
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
                            <input type="text" name='url' value="">
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
                            <textarea name="content" id="content" cols="60" rows="10"></textarea>
                            <!-- <input type="text" name='url' value=""> -->
                        </div>
                    </div>
                    <div class="content-miniprogram">
                         <div class="url-name">
                            <span>小程序appid:</span>
                            <input type="text" name="appid">
                            <br>
                        </div>
                        <div class="url-src">
                            <span>小程序路径:</span>
                            <input type="text" name="pagepath">
                            <div class="url-nameBox">
                                    <img src="/Public/admin/images/tishi.png">
                                    <span class="notes">提示:必须是公众号所绑定的小程序,如:pages/index/index</span>
                            </div>
                            <!-- <input type="text" name='url' value=""> -->
                        </div>
                        <div class="url-name">
                            <span>备用网页url:</span>
                            <input type="text" name="min_url">
                                <div class="url-nameBox">
                                    <img src="/Public/admin/images/tishi.png">
                                    <span class="notes">提示:备用网页是指访问小程序出错时才会显示的网页</span>
                                </div>
                            <br>
                        </div>
                    </div>
                    <div class="image_text">
                        <span>消息标题:</span>
                        <input type="text" name="image_title">
                        <br>
                        <span>消息链接:</span>
                        <input type="text" name="image_url">
                        <div class="url-src">
                            <span>消息的内容:</span>
                            <textarea name="image_content" id="image_content" cols="60" rows="10"></textarea>
                            <!-- <input type="text" name='url' value=""> -->
                        </div>
                        <div class="dua-box">
                            <h3>消息图片</h3>
                            <i class="closeImgbox"></i>
                            <div class="box-warp">
                                <div class="add-img">
                                    <img class="addImg" onclick="clickImg(this);" src="/Public/admin/images/addImg.png" />
                                    
                                    <input name="text_img" id="id" type="file" class="upload_input" onchange="change(this)" />
                                    <div class="preBlock">
                                        <img class="preview" id="preview" alt="" name="pic" width="190" height="190" />
                                    </div>
                                    <img class="delete" onclick="deleteImg(this)" src="/Public/admin/images/delete.png" />
                                </div>
                            </div>

                        </div>
                    </div>
                    
                    <button class="tijiao" type="button">提交</button>
                    <input type="hidden" class="type" name="type" value="">
                    <input type="hidden" name="pid" value="<?php echo ($menus["id"]); ?>">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
        function  select_type(type){
            // console.log(type);
            // return false;
            $('.type').val(type);
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
        }

    $(function () {
        
        $(".select").each(function () {
            var s = $(this);
            var z = parseInt(s.css("z-index"));
            var dt = $(this).children("dt");
            var dd = $(this).children("dd");
            var _show = function () {
                dd.slideDown(200);
                dt.addClass("cur");
                s.css("z-index", z + 1);
            }; //展开效果
            var _hide = function () {
                dd.slideUp(200);
                dt.removeClass("cur");
                s.css("z-index", z);
            }; //关闭效果
            dt.click(function () {
                dd.is(":hidden") ? _show() : _hide();
            });
            dd.find("a").click(function () {
                dt.html($(this).html());
                _hide();
            }); //选择效果（如需要传值，可自定义参数，在此处返回对应的“value”值 ）
            $("body").click(function (i) {
                !$(i.target).parents(".select").first().is(s) ? _hide() : "";
            });
        })

        $('.tijiao').click(function(){
            console.log('sss');
            // return false;
            var type=$('input[name=type]').val();
            var name=$('#names').val();
            var url=$('input[name=url]').val();
            var content = $('#content').val();
            var appid=$('input[name=appid]').val();
            var pagepath=$('input[name=pagepath]').val();
            var min_url=$('input[name=min_url]').val();
            var image_title =$('input[name=image_title]').val();
            var image_url =$('input[name=image_url]').val();
            var text_img =$('input[name=text_img]').val();
            var image_content = $('#image_content').val()
           if(type==0){
               layer.msg('请选择类型');
               return false; 
            }else if(type=='view'){
                if(name=='' ||name==null){
                    layer.msg('请填写菜单名称');
                    return false;
                }else if(url=='' ||url==null){
                    layer.msg('请填写链接');
                    return false;
                }
            }else if(type=='menu'){
                if(name=='' ||name==null){
                    layer.msg('请填写菜单名称');
                    return false;
                }
            }else if(type == 'click'){
                if(name=='' || name==null){
                    layer.msg('请填写菜单名称');
                    return false;
                }else if(content =='' || content == null){
                    layer.msg('要发送的消息不能为空');
                    return false;
                }
            }else if(type == 'miniprogram'){
                if(name=='' ||name==null){
                    layer.msg('请填写菜单名称');
                    return false;
                }else if(appid =='' ||appid==null){
                    layer.msg('请填写小程序appid');
                    return false;
                }else if(pagepath==''||pagepath==null){
                    layer.msg('请填写小程序页面路径');
                    return false;
                }else if(min_url==''||min_url==null){
                    layer.msg('请填写备用页面路径');
                    return false;
                }
            }else if(type=='image_text'){
                if(name=='' ||name==null){
                    layer.msg('请填写菜单名称');
                    return false;
                }else if(image_title=='' ||  image_title==null){
                    layer.msg('请填写标题');
                    return false;
                }else if(image_url==''||image_url==null){
                    layer.msg('请填写链接');
                    return false;
                }else if(image_content==''||image_content==null){
                    layer.msg('请填写内容');
                    return false;
                }else if(text_img==''||text_img==null){
                    layer.msg('请上传图片');
                    return false;
                }
            }
             $.ajax({
                    url: '/index.php/Admin/Menu/menu_add',
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