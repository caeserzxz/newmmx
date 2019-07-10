<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>服务中心</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/serverCenter.css">
   
</head>

<body>
    <div class="server">
        <div class="server-tel">
            <img src="/Public/Zyly/images/dianhua@2x.png" alt="">
            <span>客服热线</span>
        </div>
        <div class="server-problem">
            <div class="problem-tit">
                <span>问题分类</span>
            </div>
            <div class="problem-cont">
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>常见问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>配送问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>售后问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>优惠问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>飞机问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>支付问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>导游问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>会员问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>活动问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
                <div onclick="commonProblem();" class="problem-item">
                    <div class="item-left">
                        <img src="/Public/Zyly/images/-----@2x.png" alt="">
                        <span>其他问题</span>
                    </div>
                    <div class="item-right">
                        <img src="/Public/Zyly/images/jiantou@2x1.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
 <script src="/Public/Zyly/js/jquery-2.2.2.min.js" ></script>
<script>
    function commonProblem(){
        
        location.href='<?php echo U("Person/commonProblem");?>';
    }
    $(function(){
        $('.server-tel').click(function(){
            location.href='tel:13318203838';
         })
    })
    
</script>
</html>