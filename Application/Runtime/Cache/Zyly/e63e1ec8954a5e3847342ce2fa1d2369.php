<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="/Public/Zyly/css/media.css">
	<link rel="stylesheet" href="/Public/Zyly/css/map.css">
	<script src="/Public/Zyly/js/jquery-2.2.2.min.js"></script>

	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=MGRxXnqFqbg977mdOqjjZolg8dRRDyye"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
	<script src="/Public/admin/js/layer-v3.1.1/layer/layer.js"></script>
	<script>
        var appId = '<?php echo ($data["signPackage"]["appId"]); ?>';
        var timestamp = '<?php echo ($data["signPackage"]["timestamp"]); ?>';
        var nonceStr = '<?php echo ($data["signPackage"]["nonceStr"]); ?>';
        var signature = '<?php echo ($data["signPackage"]["signature"]); ?>';
        var shareTitle = '<?php echo ($data["shareTitle"]); ?>';
        var shareName = '<?php echo ($data["shareName"]); ?>';
        var shareUrl = '<?php echo ($data["shareUrl"]); ?>';
        var shareImg = '<?php echo ($data["shareImg"]); ?>';
    </script>
    <script type="text/javascript" src="/Public/Zyly/js/share1.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<title>区域网点</title>
</head>

<body>
	<div id="allmap"></div>
	<div class="searchBox">
		<div class="searchBox-outer">
			<input id="suggestId" type="text">
			<button id="Btn">搜索</button>
		</div>
	</div>
	<div class="sbFont" >
		<img src="/Public/Zyly/images/tip.png" alt="">
		<span>
		亲爱的用户，如果你能成功申请为我们的区域代理你将会拥有丰厚的分润，详情可以咨询我们客服或者或者直接在线申请。填写好资料，我们将会有专人与你取得联系。
		</span>
	</div>
	<div class="btnBox" onclick="apply();">
		<span>申请代理</span>
	</div>
	 <!-- 底部导航 -->
 <div class="bottom clearfix" >
    <div class="bottom-navItem <?php if($cont =='Goods'){echo 'bottom-navItem-act';}?> localurl " data-url="Goods/index">
        <?php if($cont == 'Goods'): ?><img src="/Public/Zyly/images/index2ik@2x.png" alt="">
        <?php else: ?>
            <img src="/Public/Zyly/images/index1ik@2x.png" alt=""><?php endif; ?>
        <span>首页</span>
    </div>
    <div class="bottom-navItem <?php if($cont =='Map'){echo 'bottom-navItem-act';}?> localurl " data-url="Map/map">
        <?php if($cont == 'Map'): ?><img src="/Public/Zyly/images/map2ik@2x.png" alt="">
        <?php else: ?>
            <img src="/Public/Zyly/images/map1ik@2x.png" alt=""><?php endif; ?>
        <span>代理</span>
    </div>
    
    <div class="bottom-navItem  <?php if($cont =='Vip'){echo 'bottom-navItem-act';}?> localurl " data-url="Vip/memberCenter">
        <?php if($cont == 'Vip'): ?><img src="/Public/Zyly/images/vip2ik@2x.png" alt="">
        <?php else: ?>
            <img src="/Public/Zyly/images/vip1ik@2x.png" alt=""><?php endif; ?>
        <span>会员</span>
    </div>
    <div class="bottom-navItem <?php if($cont =='Person'){echo 'bottom-navItem-act';}?> localurl"  data-url="person/person">
        <?php if($cont == 'Person'): ?><img src="/Public/Zyly/images/person2ik@2x.png" alt="">
        <?php else: ?>
            <img src="/Public/Zyly/images/person1ik@2x.png" alt=""><?php endif; ?>
        <span>我的</span>
    </div>
</div>

<script>
    $(function(){
        $('.localurl').click(function(){
            var url = $(this).attr('data-url');
            window.location.href = "/index.php/Zyly/"+url;
        }); 
    })
</script>
</body>

</html>
<script type="text/javascript">
	var users = <?php echo $users;?>;

			var map = new BMap.Map("allmap");      
			map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);      
			// 创建地址解析器实例     
			var myGeo = new BMap.Geocoder();      
			// 将地址解析结果显示在地图上，并调整地图视野 
		
			for(j = 0,len=users.length; j < len; j++) {
				myGeo.getPoint(users[j]['store_location'], function(point){      
					if (point) {      
						map.centerAndZoom(point, 16);      
						map.addOverlay(new BMap.Marker(point));      
					}      
				}, 
				users[j]['city']);
			}

	function G(id) {
		return document.getElementById(id);
	}
	var inp = document.getElementById("suggestId");
	var btn = document.getElementById("Btn");
	console.log(btn);

	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例
	map.centerAndZoom("武汉市", 5); // 初始化地图,用城市名设置地图中心点
	var ac = new BMap.Autocomplete({
		"input": "suggestId",
		"location": map
	});
	ac.addEventListener("onhighlight", function (e) { //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province + _value.city + _value.district + _value.street + _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province + _value.city + _value.district + _value.street + _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		// console.log(G("searchResultPanel"));

		// G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function (e) { //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
		// G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		console.log(_value);

	});


	btn.addEventListener("click", function (e) {
		console.log(inp.value);
		
	
			// if(pp==undefined){
			setPlace();
			// }
			// console.log(pp);
	


	});



	function setPlace() {
		map.clearOverlays(); //清除地图上所有覆盖物
		function myFun() {
			var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp)); //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
			onSearchComplete: myFun
		});
		local.search(myValue);
	}
	
	function apply(){
		var user_info = <?php echo ($user_info); ?>; 
		if(user_info['is_daili']==2){
			layer.msg('您已是代理',{time:1500});
            return;
		}else if(user_info['is_daili']==3){
			layer.msg('您的申请正在审核,请勿重新申请',{time:1500});
            return;
		}else{
			location.href='<?php echo U("Map/proxyApplication");?>';
		}
		
	}
</script>