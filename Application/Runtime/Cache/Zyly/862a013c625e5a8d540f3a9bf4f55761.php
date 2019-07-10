<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>代理提交申请</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/proxyApplication.css">
    <!-- <link rel="stylesheet" href="/Public/Zyly/static/LArea-master/dist/css/LArea.css"> -->
    <!-- <script src="/Public/Zyly/static/LArea-master/dist/js/LArea.js"></script> -->
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/admin/js/layer-v3.1.1/layer/layer.js"></script>
</head>

<body>
    <div class="proxyApplication">
        <form id="form" method="post">
        <div class="address_select">
            <span>所在区域:</span>
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
                        <?php if($info["city"] != ''): ?><option value="-10"><?php echo ($info["city"]); ?></option>
                        <?php else: ?>
                            <option value="-10">市级</option><?php endif; ?>
                        
                    </select>
                    <select id='area' name='countryid' style="width: 80px">
                        <?php if($info["area"] != ''): ?><option value="-10"><?php echo ($info["area"]); ?></option>
                        <?php else: ?>
                            <option value="-10">区/县级</option><?php endif; ?>
                    </select>
            </div>
            <div class="proxyInfo">
                <textarea placeholder="写下您的基本信息或者介绍等" name="introduce" id="introduce"></textarea>
            </div>
            <div class="proxyName sty">
                <input placeholder="详细地址:如道路 门牌号 小区 楼栋号单元室等" type="text" name="store_location" id="store_location">
            </div>
            <div class="proxyName sty">
                <input placeholder="姓名(必填)" type="text" name="name" id="name">
            </div>
            <div class="proxyPhone sty">
                <input placeholder="手机(必填)" type="text" name="tel" id="tel">
            </div>
            <div class="proxyEmail sty">
                <input placeholder="邮箱/QQ(选填)" type="text" name="qq_id" id="qq_id">
            </div>
            <button class="tijiao" type="button">提交</button>
        </form>
    </div>

</body>
<script>
    // var area = new LArea();
    // area.init({
    //     'trigger': '#demo1', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
    //     'valueTo': '#value1', //选择完毕后id属性输出到该位置
    //     'keys': {
    //         id: 'id',
    //         name: 'name'
    //     }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
    //     'type': 1, //数据源类型
    //     'data': "/Public/Zyly/static/LArea-master/dist/js/AreaData.json" //数据源
    // });

    $('.tijiao').click(function(){
        // var input_area = $('input[name=input_area]').val();
        var introduce = $('#introduce').val();
        var name = $('input[name=name]').val();
        var tel = $('input[name=tel]').val();
        var store_location =  $('input[name=store_location]').val();
        var qq_id = $('input[name=qq_id]').val();
        var state = $('#province').val();
        var city = $('#city').val();
        var area = $('#area').val();
        // console.log(state);
        // console.log(city);
        // console.log(area);
        // return  false;
        if(state<0||city<0||area<0){
            layer.msg('请选择地区',{time:1500});
            return;
        }else if(store_location==''||store_location==null){
            layer.msg('填写详细地址',{time:1500});
            return;
        }else if(introduce==''||introduce==null){
            layer.msg('请填写简介',{time:1500});
            return;
        }else if(name==''||name==null){
            layer.msg('请填写真实姓名',{time:1500});
            return;
        }else if(tel==''||tel==null){
            layer.msg('请填写手机号码',{time:1500});
            return;
        }
        var data = {
            'introduce':introduce,
            'name':name,
            'tel':tel,
            'qq_id':qq_id,
            'store_location':store_location,
            'state':state,
            'city':city,
            'area':area
        };

        $.ajax({
            'url':'/index.php/Zyly/Map/proxyApplication',
            'type':'post',
            'data':data,
            'dataType':'json',
            'success':function(data){
                console.log(data);
                // return false;
               if(data.status==1){
                    layer.msg(data.msg,{time:1500},function(){
                        location.href='<?php echo U("Map/map");?>';
                    });
                    return;
               }else{
                    layer.msg(data.msg,{time:1500});
                    return;
               }
            }
        });
    })
</script>
<script type="text/javascript">

    //获取城市
    $("select[id=province]").change(function(){
            $("#area").html("<option value='-10'> 区/县级</option>");
            var id = $(this).val();
            //获取城市信息
            var url = "<?php echo U('Map/getChildren');?>" ;
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
        var url = "<?php echo U('Map/getChildren');?>" ;
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
</html>