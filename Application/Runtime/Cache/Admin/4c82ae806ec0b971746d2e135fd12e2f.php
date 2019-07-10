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
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
   

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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span class="c-gray en">&gt;</span> 代理修改 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form class="form form-horizontal" id="form" action="/index.php/Admin/User/daili_edit" method="post" onsubmit="return ac_from();" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>代理昵称：</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" disabled placeholder="产品名称" name="uname" id="uname" value="<?php echo ($info["uname"]); ?>">
            </div>
        </div>

        <!-- <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>代理分成：</label>
            <div class="formControls col-xs-8 col-sm-3">
                <input type="text" class="input-text" placeholder="输入1代表1%，10代表10%，最大为20" name="daili_maid" id="daili_maid" value="<?php echo ($info["daili_maid"]); ?>">
            </div>
        </div> -->

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>代理类型：</label>
            <div class="formControls col-xs-8 col-sm-3">
                <span class="select-box">
                    <select class="select" size="1" id="daili_type" name="daili_type">
                        <option value="0" <?php if($info['daili_type']==0){echo 'selected';} ?>>请选择</option>
                        <option value="1" <?php if($info['daili_type']==1){echo 'selected';} ?>>省代</option>
                        <option value="2" <?php if($info['daili_type']==2){echo 'selected';} ?>>市代</option>
                        <option value="3" <?php if($info['daili_type']==3){echo 'selected';} ?>>区代</option>
                    </select>
                </span>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>代理地址：</label>
            <div class="formControls col-xs-8 col-sm-3">
                 <!-- <div id="province"></div> -->

                    <div>
                        <!-- <p><span class="serv_txt">所在城市:</span> -->
                        <div class="border">
                            <select id='province' name='provinceid' style="width: 80px">
                                <!-- <?php if($info["state"] != ''): ?><option value="-10" ><?php echo ($info["state"]); ?></option> -->
                                <!-- <?php else: ?> -->
                                    <option value="-10" >省级</option>
                                <!--<?php endif; ?> -->
                               
                                <?php if(is_array($province)): foreach($province as $key=>$v): if($info["state"] == $v["name"] ): ?><option value="<?php echo ($v["id"]); ?>" selected><?php echo ($v["name"]); ?></option>
                                    <?php else: ?>
                                        <option value="<?php echo ($v["id"]); ?>"><?php echo ($v["name"]); ?></option><?php endif; endforeach; endif; ?>
                            </select>
                            <select  id='city' name='cityid' style="width: 80px">
                                <?php if($info["city"] != ''): ?><option value="<?php echo ($info["city_id"]); ?>" selected><?php echo ($info["city"]); ?></option>
                                <?php else: ?>
                                    <option value="-10">市级</option><?php endif; ?>
                                
                            </select>
                            <select id='area' name='countryid' style="width: 80px">
                                <?php if($info["area"] != ''): ?><option value="<?php echo ($info["area_id"]); ?>" selected><?php echo ($info["area"]); ?></option>
                                <?php else: ?>
                                    <option value="-10">区/县级</option><?php endif; ?>
                            </select>
                        </div>
                        </p>
                    </div>
            </div>
           
        </div>
       
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>门店具体地址：</label>
            <div class="formControls col-xs-8 col-sm-3">
                <textarea class="textarea radius" placeholder="赠送积分" name="store_location" id="store_location"><?php echo ($info["store_location"]); ?></textarea>   
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" name="submit" id="tongguo" value="提交">
                <input type="hidden" name="id" id='id' value="<?php echo ($info["id"]); ?>">
                <!-- <input type="hidden" name="is_type" id='is_type' value="1"> -->
                <input class="btn btn-primary radius" type="submit"  name="submit" value="驳回">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/Public/admin/js/product.js"></script>

<!--_footer 作为公共模版分离出去-->




<script>
    // $(function(){
    //     $("#province").ProvinceCity()
    // });

    // //初始化编辑器
    // $('#content').xheditor({
    //     skin:'nostyle' ,
    //     upImgUrl:'<?php echo U("Upload/xheditor");?>'
    // });

    // function upadd(obj){
    //     //alert('aaa');
    //     $('#imgs_add').append('<div>&nbsp;&nbsp;<input type="file" style="width:160px;" name="files[]" /><a onclick="$(this).parent().remove();" class="btn cls" style="background:#D0D0D0; width:40px; color:black;"">删除</a></div>');
    //     return false;
    // }

    // function getcid(){
    //     var cateid = $('#cateid').val();
    //     $.post('<?php echo U("getcid");?>',{cateid:cateid},function(data){
    //         if(data.catelist!=''){
    //             var htmls = '<option value="">二级分类</option>';
    //             var cate = data.catelist;
    //             for (var i = 0; i<cate.length; i++) {
    //                 htmls += '<option value="'+cate[i].id+'">-- '+cate[i].name+'</option>';
    //             }
    //             $('#cid').html(htmls);
    //             $('#catedesc').html('&nbsp;&nbsp; * 必选项');
    //         }else{
    //             $('#cid').html('<option value="">二级分类</option>');
    //             $('#catedesc').html('&nbsp;&nbsp; * 该分类下还没有二级分类，请先添加');
    //         }
    //     },"json");
    // }

    // //图片删除
    // function del_img(img,obj){
    //     var pro_id = $('#pro_id').val();
    //     if (confirm('是否确认删除？')) {
    //         $.post('<?php echo U("img_del");?>',{img_url:img,pro_id:pro_id},function(data){
    //             if(data.status==1){
    //                 $(obj).parent().remove();
    //                 return false;
    //             }else{
    //                 alert(data.err);
    //                 return false;
    //             }
    //         },"json");
    //     };
    // }

    function ac_from(){
        var reg=/^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 ，判断正整数用/^[1-9]+[0-9]*]*$/
        
        var daili_type = document.getElementById('daili_type').value;
        if(daili_type<1){
            alert('选择代理级别');
            return  false;
        }
        var state = $('#province').val();
        var city = $('#city').val();
        var area = $('#area').val();

        if(state<1||city<1||area<1){
            alert('选择代理区域');
            return  false;
        }
    }
   
</script>
<script type="text/javascript">
	    //获取城市
    $("select[id=province]").change(function(){
            $("#area").html("<option value='-10'> 区/县级</option>");
            var id = $(this).val();
            //获取城市信息
            var url = "<?php echo U('User/getChildren');?>" ;
            var param = {id:id};
            $.post(url,param,function(data){
                var objs = eval("("+data+")");
                $("#city").html("");
                var str = "<option value='-10' >市级</option>" ;
                objs.forEach(function(obj){
                    str += "<option value=\""+obj.id+"\" style='color:black'>"+obj.name+"</option>" ;
            });
            $("#city").append(str);
        });
    });
    //获取区/县
    $("select[id=city]").change(function(){
        var id = $(this).val();
        //获取城市信息
        var url = "<?php echo U('User/getChildren');?>" ;
        var param = {id:id};
        $.post(url,param,function(data){
            var objs = eval("("+data+")");
            $("#area").html("");
            var str = "<option value='-10' >区/县级</option>" ;
            objs.forEach(function(obj){
                str += "<option value=\""+obj.id+"\"  style='color:black' >"+obj.name+"</option>" ;
            });
            $("#area").append(str);
        });
    });
</script>
</body>
</html>