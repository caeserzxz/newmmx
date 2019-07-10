<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>发布评论</title>
    <link rel="stylesheet" href="/Public/Zyly/css/media.css">
    <link rel="stylesheet" href="/Public/Zyly/css/comment.css">
    <link rel="stylesheet" href="/Public/Zyly/static/honeySwitch/lib/honeySwitch.css">
    <script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>
    <!-- <script src="/Public/Zyly/static/diyUpload/js/jquery-1.11.0.min.js"></script> -->
    <script src="/Public/Zyly/js/jquery.raty.js"></script>
    <script src="/Public/Zyly/static/honeySwitch/lib/honeySwitch.js"></script>
    
    <script src="/Public/Zyly/static/diyUpload/js/webuploader.min.js"></script>
    <script src="/Public/Zyly/static//diyUpload/js/diyUpload.js"></script>
</head>

<body>
    <div class="comment">
    <form id="form" class="form form-horizontal" action="/index.php/Zyly/Person/comment" method="post" enctype="multipart/form-data">
        <div class="comment-star">
            <div class="starLeft">
                商品评分
            </div>
            <div id="star1"></div>
            <div class="starRight">
                请选择评分
            </div>
        </div>
        <div class="comment-fontBox">
            <textarea placeholder="宝贝是否满足你的期待呢？说说你使用心得分享给其他购买的朋友吧。" name="" id=""></textarea>
        </div>
        <div class="anonymousBox">
            <span>匿名评论</span>
            <span class="switch-off"></span>
        </div>

        <div class="upLoadImg">
            <div class="upLoadImg-tit">
                上传图片(最多9张)
            </div>
            <div class="upLoadImg-cont">
                <ul class="upload-ul clearfix">
                    <li class="upload-pick">
                        <div class="webuploader-container clearfix" id="goodsUpload"></div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="submitBtn">
            <span class="tijiao">提交</span>
        </div>
    </form>
    </div>



    <!-- <div style="width:400px;margin:50px auto;">
        <p style="font-size:20px">请给出你的评分(5分制)：</p>
        <div id="star1"></div>
        <div id="result1"></div>
    </div> -->
</body>
<script type="text/javascript">
    rat('star1', 'result1', 1);;

    function rat(star, result, m) {

        star = '#' + star;
        result = '#' + result;
        $(result).hide(); //将结果DIV隐藏

        $(star).raty({
            hints: ['1', '2', '3', '4', '5'],
            number: 5,
            path: "/Public/Zyly/images",
            starOff: 'xingxingxixng@2x.png',
            starOn: 'xingxiongxixng@2x.png',
            // size: 30,
            // start: 4,
            showHalf: true,
            //target: result,
            //targetKeep : false,//targetKeep 属性设置为true，用户的选择值才会被保持在目标DIV中，否则只是鼠标悬停时有值，而鼠标离开后这个值就会消失
            click: function (score, evt) {
                //第一种方式：直接取值
                alert('你的评分是' + score * m + '分');
            }
        });

        /*第二种方式可以设置一个隐蔽的HTML元素来保存用户的选择值，然后可以在脚本里面通过jQuery选中这个元素来处理该值。 弹出结果
        var text = $(result).text();
        $('img').click(function () {
            if ($(result).text() != text) {
                alert('你的评分是'+$(result).text()/m+'分');
                alert(result);
                return;
            }
        });*/
    }
</script>
<script>
    var $tgaUpload1 = $('#goodsUpload').diyUpload({
        url: '/uploadFilePath',
        success: function (data) {
            console.log(1);
            
        },
        error: function (err) {
            console.log(2);
            
        },
        buttonText: '',
        accept: {
            title: "Images",
            extensions: 'gif,jpg,jpeg,bmp,png'
        },
        thumb: {
            width: 100,
            height: 100,
            quality: 100,
            allowMagnify: true,
            crop: true,
            type: "image/jpeg"
        }
    });
</script>
<script>
    $('.tijiao').click(function(){
        $('#form').submit();
    })
</script>
</html>