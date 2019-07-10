<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>编辑收货人</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/editConsignee.css">
    <!-- <link rel="stylesheet" href="/Public/Zyly/static/LArea-master/dist/css/LArea.css">
    <script src="/Public/Zyly/static/LArea-master/dist/js/LArea.js"></script> -->
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <script src="/Public/Zyly/js/input.js"></script>
    <script src="/Public/admin/js/layer-v3.1.1/layer/layer.js"></script>
</head>

<body>
    <div class="editConsignee">
        <div class="line"></div>
    <form id="form" class="form form-horizontal" action="<?php echo U('Address/edit_address');?>" method="post"  >
        <div class="consigneeInfo">
            <div class="consigneeInfo-name">
                <span>姓名</span>
                <input value="<?php echo ($address["name"]); ?>" name="name" type="text">
            </div>
            <div class="consigneeInfo-phone">
                <span>手机号码</span>
                <input value="<?php echo ($address["tel"]); ?>" name="tel" type="text">
            </div>
            <div class="consigneeInfo-coding">
                <span>邮政编码</span>
                <input value="<?php echo ($address["code"]); ?>" name="code" type="text">
            </div>
            <!-- <div class="consigneeInfo-area .clearfix">
                <span>所在区域</span>
                <input id="demo1" type="text" readonly="" name="input_area" placeholder="城市选择特效" />
                <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
            </div> -->
            <div class="address_select">
                <span>所在区域:</span>
                    <select  id='province' name='provinceid' style="width: 80px">
                        <!-- <?php if($info["state"] != ''): ?><option value="-10" ><?php echo ($info["state"]); ?></option> -->
                        <!-- <?php else: ?> -->
                            <option value="-10" >省级</option>
                        <!--<?php endif; ?> -->
                        
                        <?php if(is_array($province)): foreach($province as $key=>$v): if($info["state"] == $v["name"] ): ?><option class="test" value="<?php echo ($v["id"]); ?>" selected><?php echo ($v["name"]); ?></option>
                            <?php else: ?>
                                <option class="test" value="<?php echo ($v["id"]); ?>"><?php echo ($v["name"]); ?></option><?php endif; endforeach; endif; ?>
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
            <div class="consigneeInfo-address">
                <span>详细地址</span>
                <input value="<?php echo ($address["address"]); ?>" name="address" type="text">
            </div>
        </div>
        <div class="defaultAddress">
            <div class="selectIcon">
                <lable>
                    <?php if($address["is_default"] == 1): ?><i class='input_style checkbox_bg  checkbox_bg_check'> <input name="is_default"  checked type="checkbox" value="1" > </i>
                    <?php else: ?>
                        <i class='input_style checkbox_bg'> <input  name="is_default"  type="checkbox"  value="022"> </i><?php endif; ?>
                </lable>
                <span>设为默认地址</span>
            </div>
        </div>
        <input type="hidden" name="id" value="<?php echo ($address["id"]); ?>">
        <input type="hidden" name="uid" value="<?php echo ($uid); ?>">
        <input type="hidden" name="goods_id" value="<?php echo ($goods_id); ?>">
        <input type="hidden" name="buy_num" value="<?php echo ($buy_num); ?>">
        <input type="hidden" name="type" value="<?php echo ($type); ?>"> 
        <input type="hidden" name="shop_type" value=<?php echo ($shop_type); ?>>
        <div class="saveBtn">
            <span>保存</span>
        </div>
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
    $('.input_style').click(function(){
       var a= $('.input_style').hasClass('checkbox_bg_check');
       if(a==false){
            $('input[name=is_default]').attr('checked');
            $('input[name=is_default]').attr('value','0');
       }else{
            $('input[name=is_default]').attr('checked','checked');
            $('input[name=is_default]').attr('value','1');
       }
    })

    $('.saveBtn').click(function(){
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
        }
        var str='<input type="hidden" name="state" value='+state+'>'+'<input type="hidden" name="city" value='+city+'>'+'<input type="hidden" name="area" value='+area+'>';     
        $('#form').append(str);
        $('#form').submit();
    })
  
    
</script>
<script type="text/javascript">

//获取城市
$("select[id=province]").change(function(){
        $("#area").html("<option value='-10'> 区/县级</option>");
        var id = $(this).val();
        console.log(id,"id")
        //获取城市信息
        var url = "<?php echo U('Map/getChildren');?>" ;
        var param = {id:id};
        $.post(url,param,function(data){
            var objs = eval("("+data+")");
            $("#city").html("");
            var str = "<option  value='-10' >市级</option>" ;
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