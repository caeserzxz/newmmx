<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="/Public/admin/css/pinlun.css" rel="stylesheet" type="text/css" />

<link href="/Public/admin/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/Public/admin/static/h-ui/css/H-ui.min.css" />
<link href="/Public/admin/css/bootstrapSwitch.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/Public/admin/js/action.js"></script>
<script type="text/javascript" src="/Public/admin/js/jquery1.8.js"></script>
<script type="text/javascript" src="/Public/admin/js/layer/layer.js"></script>
<script type="text/javascript" src="/Public/admin/js/bootstrapSwitch.js"></script>
<style type="text/css">
	#tanchu { display:none; }
	#tanchu textarea{ width: 99%; height: 280px; margin-top:2px; margin-left:2px; border:1px solid #D3D3D3 }
	#save_reply{ float:right; margin-right:3px; margin-top:2px; padding:2px 10px; }
</style>
</head>
<body>

<div class="aaa_pts_show_1">【 评论管理 】</div>

<!--用来弹出一个输入框，用于商家发送消息-->
<div class="aaa_pts_show_2">
	  <div id="tanchu" >
			<form action="" method="post" name="reply-form" >
				<textarea name="content" id="content"></textarea>			
				<input type="hidden" name="reply_id" id="reply_id" value="">
				<input type="button" name="answer" id="save_reply" value="发送">
			</form>
	  </div>
      <table class="pro_3">
         <tr class="tr_1">
           <td style="width:40px;">ID</td>
           <td style="width:70px;">头像</td>
           <td style="width:90px;">评论人</td>
		   <td style="width:150px;">商品名称</td>
           <td style="width:70px;">评分数</td>
           <!-- <td style="width:30%">评论内容</td> -->
           <td style="width:120px;">评论时间</td>
           <!-- <td style="width:30%">回复内容</td> -->
           <!-- <td style="width:150px;">是否显示</td> -->
           <td style="width:100px;">操作</td>
         </tr>
         <tbody id="news_option">
			<!--遍历 -->
			<?php if(is_array($productdp)): $i = 0; $__LIST__ = $productdp;if( count($__LIST__)==0 ) : echo "暂时没有数据" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><tr>
				   <td><?php echo ($v["id"]); ?></td>
		           <td><img src="<?php echo ($v["photo"]); ?>" style="width:60px; height:60px; margin:5px; border:1px solid #eee;"/></td>
		           <td><?php echo ($v["uname"]); ?></td>
				   <td><?php echo ($v["name"]); ?></td>
				   <td calss="ratio" style="text-align:left;">
					<div class="clearfix">
						<span class="f-l f-14 va-m">宝贝描述：</span>
						<div class="star-bar star-bar-show size-M f-l va-m mr-10">
							<span class="star" style="width:<?php echo ($v["ratio"]); ?>%"></span>
						</div>
						<strong class="f-l f-14 va-m"><?php echo ($v["num"]); ?></strong>
					</div>
				   </td>
		           <!-- <td><?php echo ($v["concent"]); ?></td> -->
		           <td><?php echo date('Y-m-d H:i:s',$v['addtime']); ?></td>
		           <!-- <td><?php echo ($v["reply_content"]); ?></td> -->
		           <!-- <td>
						是:<input type="radio" name="is_nav" value="1">&nbsp&nbsp&nbsp&nbsp
						否:<input type="radio" name="is_nav" value="2">
				   </td> -->
		           <td>
					   <a href="<?php echo U('Product/comment_detail');?>?id=<?php echo ($v["id"]); ?>&page=<?php echo ($page); ?>">查看</a>&nbsp&nbsp&nbsp&nbsp
					   <a href="">删除</a>
				   </td>
			    </tr><?php endforeach; endif; else: echo "暂时没有数据" ;endif; ?>
			<!--遍历 -->
         </tbody>
         <tr>
            <td colspan="10" class="td_2">
                 <?php echo ($page_index); ?>   
             </td>
         </tr>
      </table>      
    </div>
    
</div>
<script>
function product_option(page){
  var obj={
	   "id":'<?php echo $id; ?>' , 
	  }
  var url='?page='+page;
  $.each(obj,function(a,b){
	  url+='&'+a+'='+b;
	 });
  location=url; 
}

$('.reply').on('click', function(){  //使用layer弹出层插件
    //alert($(this).attr("data-id"));
	$("#reply_id").val($(this).attr("data-id"));	
    layer.open({
        type: 1,
		title: "回复内容",
        area: ['500px', '350px'],
        shadeClose: true, //点击遮罩关闭
        content: $("#tanchu"),
		end :function(index){
			var timer=setInterval('myrefresh()',3000); //弹窗结束后，仍指定3秒刷新一次  
		}
    });
});

//ajax提交
$("#save_reply").click(function(){
	//alert($("#reply_id").val());
	$.post("<?php echo U('Product/pinglun');?>",{reply_id:$("#reply_id").val(),reply_content:$("#content").val()},function(data){
		if(data.status==1){
			alert(data.info);
			location.reload();
		}else{
			alert(data.info);
		}
	},"json");
});
</script>
</body>
</html>