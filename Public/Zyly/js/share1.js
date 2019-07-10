document.write("<script language=javascript src='http://res.wx.qq.com/open/js/jweixin-1.2.0.js'></script>");
document.write("<script language=javascript src='http://qzonestyle.gtimg.cn/qzone/qzact/common/share/share.js'></script>");
$(function(){
    wx.config({
        debug: false,
        appId: appId,
        timestamp: timestamp,
        nonceStr: nonceStr,
        signature: signature,
        jsApiList: [
            // 所有要调用的 API 都要加到这个列表中
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ'

        ]
    });
    wx.checkJsApi({
        jsApiList: [
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ'

        ],
        success: function (res) {
            if (res.checkResult.getLocation == false) {
                alert('你的微信版本太低，不支持微信JS接口，请升级到最新的微信版本！');
                return;
            }
        }
    });
    wx.ready(function(){
        // 分享到朋友圈
        wx.onMenuShareTimeline({
            title: shareTitle, // 分享标题
            //desc:shareTitle,
            link: shareUrl, // 分享链接
            imgUrl: shareImg,   // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        //分享给朋友
        wx.onMenuShareAppMessage({
            title: shareTitle, // 分享标题
            desc: shareName,// 分享描述
            link: shareUrl, // 分享链接
            imgUrl: shareImg,
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        //分享到QQ
        wx.onMenuShareQQ({
            title: shareTitle, // 分享标题
            desc: shareName,// 分享描述
            link: shareUrl, // 分享链接
            imgUrl: shareImg,
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    });


    setShareInfo({
        title: shareTitle,
        summary: shareName,
        pic: shareImg,
        url: shareUrl,
        WXconfig:       {
            swapTitleInWX: true,
            appId: appId,
            timestamp: timestamp,
            nonceStr: nonceStr,
            signature: signature,
        }
    });
});

