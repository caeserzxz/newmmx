/*
Navicat MySQL Data Transfer

Source Server         : benli
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tour

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-28 15:42:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lr_address`
-- ----------------------------
DROP TABLE IF EXISTS `lr_address`;
CREATE TABLE `lr_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `name` varchar(10) NOT NULL COMMENT '收货人',
  `tel` char(15) NOT NULL COMMENT '联系方式',
  `sheng` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `quyu` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `address` varchar(255) NOT NULL COMMENT '收货地址（不加省市区）',
  `address_xq` varchar(255) NOT NULL COMMENT '省市区+详细地址',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '邮政编号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `is_default` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否默认地址 1默认',
  `add_time` datetime DEFAULT NULL,
  `save_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `state` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `area` varchar(255) DEFAULT NULL COMMENT '区/县',
  `state_id` int(11) DEFAULT NULL COMMENT '省id',
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL COMMENT '区县id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户收货地址表';

-- ----------------------------
-- Records of lr_address
-- ----------------------------
INSERT INTO `lr_address` VALUES ('27', '1231122111', '213122', '0', '0', '123 ', '北京市 东城区 123 ', '123122', '1', '0', '2018-10-17 11:19:00', '2019-01-11 18:36:22', '广东', '广州市', '荔湾区', '1960', '1961', '1962');
INSERT INTO `lr_address` VALUES ('28', '1231223222', '21312222121w2', '0', '0', '123 12', '北京市 东城区 123 12', '123121222', '1', '0', '2018-10-17 11:19:00', '2018-10-17 12:42:00', null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('29', '1231 ', '21312', '0', '0', '123 ', '北京市 东城区 123 ', '12312', '1', '0', '2018-10-17 11:23:00', null, null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('30', '1231 ', '21312', '0', '0', '123 ', '北京市 东城区 123 ', '12312', '1', '0', '2018-10-17 11:23:00', null, null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('31', '1231 ', '21312', '0', '0', '123 ', '北京市 东城区 123 ', '12312', '1', '0', '2018-10-17 11:24:00', null, null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('32', '1231 ', '21312', '0', '0', '123 ', '北京市 东城区 123 ', '12312', '1', '0', '2018-10-17 11:24:00', null, null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('33', 'fds g', '地方', '0', '0', '发生', '北京市 东城区 发生', '0', '1', '0', '2018-10-30 14:19:39', null, null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('34', '1 ', '2 12', '0', '0', '21 ', '北京市 东城区 21 ', '12', '1', '0', '2018-10-30 14:28:45', null, null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('35', '是的', '是的的', '0', '0', '的是', '北京市 东城区 的是', '0', '1', '0', '2018-10-30 14:30:01', null, null, null, null, null, null, null);
INSERT INTO `lr_address` VALUES ('36', '发', '放到', '0', '0', '舒服点', '山西大同市矿区舒服点', '2147483647', '3', '1', '2019-01-10 15:44:39', '2019-01-11 16:17:38', '山西', '大同市', '矿区', '225', '237', '239');

-- ----------------------------
-- Table structure for `lr_adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `lr_adminuser`;
CREATE TABLE `lr_adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表：包括后台管理员、商家会员和普通会员',
  `name` varchar(20) NOT NULL COMMENT '登陆账号',
  `uname` varchar(10) DEFAULT NULL COMMENT '昵称',
  `pwd` varchar(50) NOT NULL COMMENT 'MD5密码',
  `qx` tinyint(4) NOT NULL DEFAULT '5' COMMENT '权限 4超级管理员 5普通管理员',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_adminuser
-- ----------------------------
INSERT INTO `lr_adminuser` VALUES ('1', 'admin', '超级管理员', '14e1b600b1fd579f47433b88e8d85291', '4', '1375086480', '0');
INSERT INTO `lr_adminuser` VALUES ('2', 'ceshi', '普通管理员', '14e1b600b1fd579f47433b88e8d85291', '5', '1493262002', '0');
INSERT INTO `lr_adminuser` VALUES ('3', 'ceshi2', '普通管理员', '550e1bafe077ff0b0b67f4e32f29d751', '5', '1493262042', '0');
INSERT INTO `lr_adminuser` VALUES ('4', 'test', '普通管理员', '14e1b600b1fd579f47433b88e8d85291', '5', '1498634942', '1');
INSERT INTO `lr_adminuser` VALUES ('5', 'hxxy2003', '普通管理员', '14e1b600b1fd579f47433b88e8d85291', '5', '1498636731', '0');
INSERT INTO `lr_adminuser` VALUES ('6', 'fdsafd', '普通管理员', '9055a12518dc6631ab421d03003f0f9c', '5', '1498636738', '0');
INSERT INTO `lr_adminuser` VALUES ('7', 'fdsafsda', '普通管理员', '07cd3d179cab8fdc94cb3c08766a4713', '5', '1498636758', '0');
INSERT INTO `lr_adminuser` VALUES ('8', 'asaa', '普通管理员', '4c2f0934fa62306c76a89477e563f7ce', '5', '1498636767', '0');
INSERT INTO `lr_adminuser` VALUES ('9', 'tretre', '普通管理员', '280179d97a5f8877b93b3537ca69e908', '5', '1498636775', '0');
INSERT INTO `lr_adminuser` VALUES ('10', 'fdsafdsa', '普通管理员', '07cd3d179cab8fdc94cb3c08766a4713', '5', '1498636786', '0');
INSERT INTO `lr_adminuser` VALUES ('11', 'fdsafdsafdsa', '普通管理员', '07cd3d179cab8fdc94cb3c08766a4713', '5', '1498636793', '0');
INSERT INTO `lr_adminuser` VALUES ('12', 'fdsafdsafdsaf', '普通管理员', '36c97f6a8b2beb254581ebb46369a3ae', '5', '1498636810', '0');
INSERT INTO `lr_adminuser` VALUES ('13', 'zxzz', '普通管理员', '14e1b600b1fd579f47433b88e8d85291', '5', '1547202390', '0');

-- ----------------------------
-- Table structure for `lr_admin_app`
-- ----------------------------
DROP TABLE IF EXISTS `lr_admin_app`;
CREATE TABLE `lr_admin_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL COMMENT '系统名称',
  `uname` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `bname` varchar(20) DEFAULT NULL COMMENT '备案人',
  `nyear` int(11) DEFAULT '0',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '项目开通时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '项目到期时间',
  `photo` varchar(100) DEFAULT NULL COMMENT '中心认证照',
  `content` text,
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `iphone_key` varchar(255) DEFAULT NULL,
  `android_key` varchar(255) DEFAULT NULL,
  `iphone_version` int(5) NOT NULL DEFAULT '1',
  `logo` varchar(100) DEFAULT NULL,
  `android_version` int(5) NOT NULL DEFAULT '0',
  `android_version2` varchar(50) NOT NULL DEFAULT '',
  `logo2` varchar(100) DEFAULT NULL,
  `view_img` varchar(100) DEFAULT NULL,
  `iphone_app_url` varchar(255) DEFAULT NULL,
  `android_app_url` varchar(255) DEFAULT NULL,
  `android_appkey` varchar(255) DEFAULT NULL,
  `android_master_secret` varchar(255) DEFAULT NULL,
  `iphone_pem` varchar(255) DEFAULT NULL,
  `weixinid` varchar(255) DEFAULT NULL COMMENT '微信号',
  `baiduid` varchar(255) DEFAULT NULL COMMENT '百度市场id',
  `baidukey` varchar(255) DEFAULT NULL COMMENT '百度市场key',
  `key` varchar(255) DEFAULT NULL COMMENT 'key=（appkey-1）*2',
  `ispcshop` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否开通pc',
  `current_version` char(50) NOT NULL DEFAULT '5.0.00' COMMENT '当前版本',
  `tuiguang` tinyint(2) NOT NULL DEFAULT '0' COMMENT '开通推广',
  `pcnav_color` varchar(50) NOT NULL DEFAULT 'c81622' COMMENT 'pc版导航条颜色',
  `ahover_color` varchar(50) NOT NULL DEFAULT 'f97293' COMMENT 'pc版导航条鼠标hover值',
  `theme_color` varchar(20) DEFAULT '#21b7a1' COMMENT 'app主题颜色',
  `version` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3058 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_admin_app
-- ----------------------------
INSERT INTO `lr_admin_app` VALUES ('3057', '29', '小程序', '小程序', '小程序', '3', '1493913600', '1588608000', 'UploadFiles/app_zhengshu/20160720/1468997491.jpg', '小程序', '1468997498', null, 'com.pts.LianShang.yl3057', '1', null, '1', '1', 'UploadFiles/pack/ic_launcher_144.png,UploadFiles/pack/ic_launcher_114.png,UploadFiles/pack/ic_launch', 'UploadFiles/pack/splash_2208.png,UploadFiles/pack/splash_1136.png,UploadFiles/pack/splash_960.png', 'https://itunes.apple.com/cn/app/yang-lao/id1116965974?mt=8 ', 'http://42.96.193.246/down/small/3057.apk', 'c8933e5dc3af0792dec75cb6', 'e072b826c12a3f8210a6cc9a', null, '', '', '', null, '1', '5.1.00', '0', 'c81622', 'f97293', '#CC0000', '1');

-- ----------------------------
-- Table structure for `lr_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `lr_attribute`;
CREATE TABLE `lr_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性名称',
  `attr_name` varchar(20) NOT NULL,
  `sort` int(3) NOT NULL COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_attribute
-- ----------------------------
INSERT INTO `lr_attribute` VALUES ('1', '尺寸', '2', '1482025941');
INSERT INTO `lr_attribute` VALUES ('2', '颜色', '3', '1482025959');
INSERT INTO `lr_attribute` VALUES ('3', '类型', '1', '1482025973');
INSERT INTO `lr_attribute` VALUES ('4', '口味', '5', '1482027915');
INSERT INTO `lr_attribute` VALUES ('5', '尺码', '6', '1482027960');
INSERT INTO `lr_attribute` VALUES ('6', '规格', '4', '1482028066');
INSERT INTO `lr_attribute` VALUES ('7', '机型', '0', '1482046174');
INSERT INTO `lr_attribute` VALUES ('9', '品牌', '0', '1482046443');
INSERT INTO `lr_attribute` VALUES ('10', '样式', '0', '1482046603');
INSERT INTO `lr_attribute` VALUES ('12', '大小', '0', '1482052706');

-- ----------------------------
-- Table structure for `lr_brand`
-- ----------------------------
DROP TABLE IF EXISTS `lr_brand`;
CREATE TABLE `lr_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品品牌表',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `type` tinyint(2) DEFAULT '0' COMMENT '是否推荐',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `shop_id` int(11) unsigned DEFAULT '0' COMMENT '店铺id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_brand
-- ----------------------------
INSERT INTO `lr_brand` VALUES ('1', '小米手环', 'UploadFiles/brand/20170630/1498818446765084.jpg', '1', '1493177975', '0');
INSERT INTO `lr_brand` VALUES ('2', '小米电源', 'UploadFiles/brand/20170630/1498818537250741.jpg', '1', '1493185503', '0');
INSERT INTO `lr_brand` VALUES ('3', '小米路由', 'UploadFiles/brand/20170630/1498818583379669.jpg', '1', '1493185534', '0');
INSERT INTO `lr_brand` VALUES ('4', '小米笔记本', 'UploadFiles/brand/20170630/1498818644256526.jpg', '1', '1493185716', '0');
INSERT INTO `lr_brand` VALUES ('5', '小米耳机', 'UploadFiles/brand/20170630/1498818722846846.jpg', '1', '1494040656', '0');
INSERT INTO `lr_brand` VALUES ('6', '小米鼠标', 'UploadFiles/brand/20170630/1498818806205533.jpg', '0', '1495703462', '0');
INSERT INTO `lr_brand` VALUES ('7', '小米手机', 'UploadFiles/brand/20170630/1498818925123582.png', '0', '1495703505', '0');
INSERT INTO `lr_brand` VALUES ('8', '小米无人机', 'UploadFiles/brand/20170630/1498819011159430.jpg', '0', '1498639350', '0');

-- ----------------------------
-- Table structure for `lr_category`
-- ----------------------------
DROP TABLE IF EXISTS `lr_category`;
CREATE TABLE `lr_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类id',
  `name` varchar(50) NOT NULL COMMENT '栏目名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `concent` varchar(255) DEFAULT NULL COMMENT '栏目简介',
  `bz_1` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `bz_2` varchar(255) DEFAULT NULL COMMENT '备注字段',
  `bz_3` varchar(100) DEFAULT NULL COMMENT '图标',
  `bz_4` tinyint(2) NOT NULL DEFAULT '0' COMMENT '备用字段',
  `bz_5` varchar(100) DEFAULT NULL COMMENT '推荐略缩图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_category
-- ----------------------------
INSERT INTO `lr_category` VALUES ('1', '0', '产品分类（系统分类，不要删除）', '0', '0', '', '', null, '', '0', null);
INSERT INTO `lr_category` VALUES ('2', '1', '手机', '1', '1493188517', '手机', 'UploadFiles/category/20170630/1498815628850398.png', '0', null, '0', null);
INSERT INTO `lr_category` VALUES ('3', '1', '笔记本', '2', '1493188587', '笔记本', 'UploadFiles/category/20170630/1498816659516131.png', '1', null, '0', null);
INSERT INTO `lr_category` VALUES ('4', '1', '智能硬件', '3', '1493188655', '智能硬件', 'UploadFiles/category/20170630/1498817044193439.png', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('5', '4', '路由器', '1', '1493188735', '路由器', 'UploadFiles/category/20170630/1498817235977098.png', '1', null, '0', null);
INSERT INTO `lr_category` VALUES ('12', '1', '周边配件', '5', '1495694783', '周边配件', 'UploadFiles/category/20170630/1498817466248911.jpg', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('8', '2', '红米', '1', '1494211044', '红米', 'UploadFiles/category/20170630/1498816164528404.png', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('9', '3', '电脑', '1', '1494211080', '电脑', 'UploadFiles/category/20170630/1498816738489391.png', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('13', '12', '耳机', '1', '1495694905', '耳机', 'UploadFiles/category/20170630/1498817567512643.jpg', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('19', '12', '手环', '0', '1498818093', '手环', 'UploadFiles/category/20170630/1498818092623976.jpg', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('15', '2', '小米', '2', '1495694950', '小米', 'UploadFiles/category/20170630/1498816223479651.png', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('16', '4', '净化器', '2', '1495698002', '净化器', 'UploadFiles/category/20170630/1498817327332325.png', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('17', '3', '鼠标', '2', '1495698212', '鼠标', 'UploadFiles/category/20170630/1498816813257929.png', null, null, '0', null);
INSERT INTO `lr_category` VALUES ('18', '2', '平板', '90', '1498640233', '平板', 'UploadFiles/category/20170630/1498816577371393.png', null, null, '0', null);

-- ----------------------------
-- Table structure for `lr_china_city`
-- ----------------------------
DROP TABLE IF EXISTS `lr_china_city`;
CREATE TABLE `lr_china_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tid` int(11) DEFAULT '0' COMMENT '父级id',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `head` varchar(1) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3526 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='中国省市区地址联动表';

-- ----------------------------
-- Records of lr_china_city
-- ----------------------------
INSERT INTO `lr_china_city` VALUES ('1', '0', '北京', '110000', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2', '1', '北京', '110100', 'B', '1');
INSERT INTO `lr_china_city` VALUES ('3', '2', '东城区', '110101', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('4', '2', '西城区', '110102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('5', '2', '崇文区', '110103', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('6', '2', '宣武区', '110104', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('7', '2', '朝阳区', '110105', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('8', '2', '丰台区', '110106', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('9', '2', '石景山区', '110107', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('10', '2', '海淀区', '110108', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('11', '2', '门头沟区', '110109', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('12', '2', '房山区', '110111', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('13', '2', '通州区', '110112', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('14', '2', '顺义区', '110113', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('15', '2', '昌平区', '110114', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('16', '2', '大兴区', '110115', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('17', '2', '怀柔区', '110116', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('18', '2', '平谷区', '110117', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('19', '1', '县', '110200', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('20', '19', '密云县', '110228', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('21', '19', '延庆县', '110229', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('22', '0', '天津', '120000', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('23', '22', '天津', '120100', 'T', '1');
INSERT INTO `lr_china_city` VALUES ('24', '23', '和平区', '120101', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('25', '23', '河东区', '120102', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('26', '23', '河西区', '120103', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('27', '23', '南开区', '120104', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('28', '23', '河北区', '120105', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('29', '23', '红桥区', '120106', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('30', '23', '塘沽区', '120107', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('31', '23', '汉沽区', '120108', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('32', '23', '大港区', '120109', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('33', '23', '东丽区', '120110', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('34', '23', '西青区', '120111', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('35', '23', '津南区', '120112', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('36', '23', '北辰区', '120113', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('37', '23', '武清区', '120114', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('38', '23', '宝坻区', '120115', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('39', '22', '县', '120200', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('40', '39', '宁河县', '120221', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('41', '39', '静海县', '120223', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('42', '39', '蓟县', '120225', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('43', '0', '河北省', '130000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('44', '43', '石家庄市', '130100', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('46', '44', '长安区', '130102', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('47', '44', '桥东区', '130103', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('48', '44', '桥西区', '130104', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('49', '44', '新华区', '130105', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('50', '44', '井陉矿区', '130107', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('51', '44', '裕华区', '130108', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('52', '44', '井陉县', '130121', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('53', '44', '正定县', '130123', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('54', '44', '栾城县', '130124', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('55', '44', '行唐县', '130125', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('56', '44', '灵寿县', '130126', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('57', '44', '高邑县', '130127', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('58', '44', '深泽县', '130128', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('59', '44', '赞皇县', '130129', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('60', '44', '无极县', '130130', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('61', '44', '平山县', '130131', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('62', '44', '元氏县', '130132', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('63', '44', '赵县', '130133', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('64', '44', '辛集市', '130181', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('65', '44', '藁城市', '130182', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('66', '44', '晋州市', '130183', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('67', '44', '新乐市', '130184', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('68', '44', '鹿泉市', '130185', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('69', '43', '唐山市', '130200', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('71', '69', '路南区', '130202', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('72', '69', '路北区', '130203', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('73', '69', '古冶区', '130204', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('74', '69', '开平区', '130205', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('75', '69', '丰南区', '130207', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('76', '69', '丰润区', '130208', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('77', '69', '滦县', '130223', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('78', '69', '滦南县', '130224', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('79', '69', '乐亭县', '130225', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('80', '69', '迁西县', '130227', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('81', '69', '玉田县', '130229', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('82', '69', '唐海县', '130230', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('83', '69', '遵化市', '130281', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('84', '69', '迁安市', '130283', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('85', '43', '秦皇岛市', '130300', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('87', '85', '海港区', '130302', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('88', '85', '山海关区', '130303', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('89', '85', '北戴河区', '130304', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('90', '85', '青龙满族自治县', '130321', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('91', '85', '昌黎县', '130322', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('92', '85', '抚宁县', '130323', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('93', '85', '卢龙县', '130324', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('94', '43', '邯郸市', '130400', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('96', '94', '邯山区', '130402', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('97', '94', '丛台区', '130403', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('98', '94', '复兴区', '130404', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('99', '94', '峰峰矿区', '130406', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('100', '94', '邯郸县', '130421', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('101', '94', '临漳县', '130423', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('102', '94', '成安县', '130424', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('103', '94', '大名县', '130425', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('104', '94', '涉县', '130426', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('105', '94', '磁县', '130427', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('106', '94', '肥乡县', '130428', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('107', '94', '永年县', '130429', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('108', '94', '邱县', '130430', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('109', '94', '鸡泽县', '130431', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('110', '94', '广平县', '130432', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('111', '94', '馆陶县', '130433', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('112', '94', '魏县', '130434', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('113', '94', '曲周县', '130435', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('114', '94', '武安市', '130481', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('115', '43', '邢台市', '130500', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('117', '115', '桥东区', '130502', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('118', '115', '桥西区', '130503', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('119', '115', '邢台县', '130521', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('120', '115', '临城县', '130522', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('121', '115', '内丘县', '130523', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('122', '115', '柏乡县', '130524', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('123', '115', '隆尧县', '130525', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('124', '115', '任县', '130526', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('125', '115', '南和县', '130527', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('126', '115', '宁晋县', '130528', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('127', '115', '巨鹿县', '130529', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('128', '115', '新河县', '130530', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('129', '115', '广宗县', '130531', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('130', '115', '平乡县', '130532', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('131', '115', '威县', '130533', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('132', '115', '清河县', '130534', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('133', '115', '临西县', '130535', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('134', '115', '南宫市', '130581', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('135', '115', '沙河市', '130582', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('136', '43', '保定市', '130600', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('138', '136', '新市区', '130602', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('139', '136', '北市区', '130603', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('140', '136', '南市区', '130604', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('141', '136', '满城县', '130621', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('142', '136', '清苑县', '130622', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('143', '136', '涞水县', '130623', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('144', '136', '阜平县', '130624', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('145', '136', '徐水县', '130625', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('146', '136', '定兴县', '130626', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('147', '136', '唐县', '130627', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('148', '136', '高阳县', '130628', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('149', '136', '容城县', '130629', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('150', '136', '涞源县', '130630', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('151', '136', '望都县', '130631', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('152', '136', '安新县', '130632', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('153', '136', '易县', '130633', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('154', '136', '曲阳县', '130634', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('155', '136', '蠡县', '130635', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('156', '136', '顺平县', '130636', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('157', '136', '博野县', '130637', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('158', '136', '雄县', '130638', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('159', '136', '涿州市', '130681', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('160', '136', '定州市', '130682', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('161', '136', '安国市', '130683', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('162', '136', '高碑店市', '130684', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('163', '43', '张家口市', '130700', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('165', '163', '桥东区', '130702', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('166', '163', '桥西区', '130703', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('167', '163', '宣化区', '130705', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('168', '163', '下花园区', '130706', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('169', '163', '宣化县', '130721', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('170', '163', '张北县', '130722', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('171', '163', '康保县', '130723', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('172', '163', '沽源县', '130724', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('173', '163', '尚义县', '130725', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('174', '163', '蔚县', '130726', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('175', '163', '阳原县', '130727', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('176', '163', '怀安县', '130728', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('177', '163', '万全县', '130729', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('178', '163', '怀来县', '130730', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('179', '163', '涿鹿县', '130731', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('180', '163', '赤城县', '130732', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('181', '163', '崇礼县', '130733', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('182', '43', '承德市', '130800', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('184', '182', '双桥区', '130802', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('185', '182', '双滦区', '130803', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('186', '182', '鹰手营子矿区', '130804', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('187', '182', '承德县', '130821', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('188', '182', '兴隆县', '130822', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('189', '182', '平泉县', '130823', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('190', '182', '滦平县', '130824', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('191', '182', '隆化县', '130825', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('192', '182', '丰宁满族自治县', '130826', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('193', '182', '宽城满族自治县', '130827', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('194', '182', '围场满族蒙古族自治县', '130828', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('195', '43', '沧州市', '130900', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('197', '195', '新华区', '130902', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('198', '195', '运河区', '130903', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('199', '195', '沧县', '130921', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('200', '195', '青县', '130922', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('201', '195', '东光县', '130923', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('202', '195', '海兴县', '130924', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('203', '195', '盐山县', '130925', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('204', '195', '肃宁县', '130926', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('205', '195', '南皮县', '130927', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('206', '195', '吴桥县', '130928', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('207', '195', '献县', '130929', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('208', '195', '孟村回族自治县', '130930', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('209', '195', '泊头市', '130981', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('210', '195', '任丘市', '130982', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('211', '195', '黄骅市', '130983', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('212', '195', '河间市', '130984', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('213', '43', '廊坊市', '131000', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('215', '213', '安次区', '131002', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('216', '213', '广阳区', '131003', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('217', '213', '固安县', '131022', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('218', '213', '永清县', '131023', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('219', '213', '香河县', '131024', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('220', '213', '大城县', '131025', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('221', '213', '文安县', '131026', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('222', '213', '大厂回族自治县', '131028', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('223', '213', '霸州市', '131081', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('224', '213', '三河市', '131082', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('225', '43', '衡水市', '131100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('227', '225', '桃城区', '131102', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('228', '225', '枣强县', '131121', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('229', '225', '武邑县', '131122', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('230', '225', '武强县', '131123', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('231', '225', '饶阳县', '131124', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('232', '225', '安平县', '131125', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('233', '225', '故城县', '131126', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('234', '225', '景县', '131127', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('235', '225', '阜城县', '131128', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('236', '225', '冀州市', '131181', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('237', '225', '深州市', '131182', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('238', '0', '山西省', '140000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('239', '238', '太原市', '140100', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('241', '239', '小店区', '140105', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('242', '239', '迎泽区', '140106', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('243', '239', '杏花岭区', '140107', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('244', '239', '尖草坪区', '140108', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('245', '239', '万柏林区', '140109', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('246', '239', '晋源区', '140110', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('247', '239', '清徐县', '140121', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('248', '239', '阳曲县', '140122', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('249', '239', '娄烦县', '140123', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('250', '239', '古交市', '140181', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('251', '238', '大同市', '140200', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('253', '251', '城区', '140202', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('254', '251', '矿区', '140203', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('255', '251', '南郊区', '140211', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('256', '251', '新荣区', '140212', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('257', '251', '阳高县', '140221', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('258', '251', '天镇县', '140222', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('259', '251', '广灵县', '140223', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('260', '251', '灵丘县', '140224', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('261', '251', '浑源县', '140225', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('262', '251', '左云县', '140226', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('263', '251', '大同县', '140227', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('264', '238', '阳泉市', '140300', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('266', '264', '城区', '140302', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('267', '264', '矿区', '140303', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('268', '264', '郊区', '140311', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('269', '264', '平定县', '140321', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('270', '264', '盂县', '140322', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('271', '238', '长治市', '140400', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('273', '271', '城区', '140402', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('274', '271', '郊区', '140411', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('275', '271', '长治县', '140421', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('276', '271', '襄垣县', '140423', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('277', '271', '屯留县', '140424', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('278', '271', '平顺县', '140425', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('279', '271', '黎城县', '140426', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('280', '271', '壶关县', '140427', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('281', '271', '长子县', '140428', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('282', '271', '武乡县', '140429', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('283', '271', '沁县', '140430', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('284', '271', '沁源县', '140431', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('285', '271', '潞城市', '140481', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('286', '238', '晋城市', '140500', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('288', '286', '城区', '140502', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('289', '286', '沁水县', '140521', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('290', '286', '阳城县', '140522', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('291', '286', '陵川县', '140524', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('292', '286', '泽州县', '140525', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('293', '286', '高平市', '140581', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('294', '238', '朔州市', '140600', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('296', '294', '朔城区', '140602', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('297', '294', '平鲁区', '140603', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('298', '294', '山阴县', '140621', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('299', '294', '应县', '140622', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('300', '294', '右玉县', '140623', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('301', '294', '怀仁县', '140624', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('302', '238', '晋中市', '140700', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('304', '302', '榆次区', '140702', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('305', '302', '榆社县', '140721', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('306', '302', '左权县', '140722', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('307', '302', '和顺县', '140723', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('308', '302', '昔阳县', '140724', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('309', '302', '寿阳县', '140725', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('310', '302', '太谷县', '140726', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('311', '302', '祁县', '140727', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('312', '302', '平遥县', '140728', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('313', '302', '灵石县', '140729', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('314', '302', '介休市', '140781', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('315', '238', '运城市', '140800', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('317', '315', '盐湖区', '140802', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('318', '315', '临猗县', '140821', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('319', '315', '万荣县', '140822', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('320', '315', '闻喜县', '140823', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('321', '315', '稷山县', '140824', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('322', '315', '新绛县', '140825', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('323', '315', '绛县', '140826', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('324', '315', '垣曲县', '140827', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('325', '315', '夏县', '140828', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('326', '315', '平陆县', '140829', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('327', '315', '芮城县', '140830', null, '0');
INSERT INTO `lr_china_city` VALUES ('328', '315', '永济市', '140881', null, '0');
INSERT INTO `lr_china_city` VALUES ('329', '315', '河津市', '140882', null, '0');
INSERT INTO `lr_china_city` VALUES ('330', '238', '忻州市', '140900', null, '0');
INSERT INTO `lr_china_city` VALUES ('332', '330', '忻府区', '140902', null, '0');
INSERT INTO `lr_china_city` VALUES ('333', '330', '定襄县', '140921', null, '0');
INSERT INTO `lr_china_city` VALUES ('334', '330', '五台县', '140922', null, '0');
INSERT INTO `lr_china_city` VALUES ('335', '330', '代县', '140923', null, '0');
INSERT INTO `lr_china_city` VALUES ('336', '330', '繁峙县', '140924', null, '0');
INSERT INTO `lr_china_city` VALUES ('337', '330', '宁武县', '140925', null, '0');
INSERT INTO `lr_china_city` VALUES ('338', '330', '静乐县', '140926', null, '0');
INSERT INTO `lr_china_city` VALUES ('339', '330', '神池县', '140927', null, '0');
INSERT INTO `lr_china_city` VALUES ('340', '330', '五寨县', '140928', null, '0');
INSERT INTO `lr_china_city` VALUES ('341', '330', '岢岚县', '140929', null, '0');
INSERT INTO `lr_china_city` VALUES ('342', '330', '河曲县', '140930', null, '0');
INSERT INTO `lr_china_city` VALUES ('343', '330', '保德县', '140931', null, '0');
INSERT INTO `lr_china_city` VALUES ('344', '330', '偏关县', '140932', null, '0');
INSERT INTO `lr_china_city` VALUES ('345', '330', '原平市', '140981', null, '0');
INSERT INTO `lr_china_city` VALUES ('346', '238', '临汾市', '141000', null, '0');
INSERT INTO `lr_china_city` VALUES ('348', '346', '尧都区', '141002', null, '0');
INSERT INTO `lr_china_city` VALUES ('349', '346', '曲沃县', '141021', null, '0');
INSERT INTO `lr_china_city` VALUES ('350', '346', '翼城县', '141022', null, '0');
INSERT INTO `lr_china_city` VALUES ('351', '346', '襄汾县', '141023', null, '0');
INSERT INTO `lr_china_city` VALUES ('352', '346', '洪洞县', '141024', null, '0');
INSERT INTO `lr_china_city` VALUES ('353', '346', '古县', '141025', null, '0');
INSERT INTO `lr_china_city` VALUES ('354', '346', '安泽县', '141026', null, '0');
INSERT INTO `lr_china_city` VALUES ('355', '346', '浮山县', '141027', null, '0');
INSERT INTO `lr_china_city` VALUES ('356', '346', '吉县', '141028', null, '0');
INSERT INTO `lr_china_city` VALUES ('357', '346', '乡宁县', '141029', null, '0');
INSERT INTO `lr_china_city` VALUES ('358', '346', '大宁县', '141030', null, '0');
INSERT INTO `lr_china_city` VALUES ('359', '346', '隰县', '141031', null, '0');
INSERT INTO `lr_china_city` VALUES ('360', '346', '永和县', '141032', null, '0');
INSERT INTO `lr_china_city` VALUES ('361', '346', '蒲县', '141033', null, '0');
INSERT INTO `lr_china_city` VALUES ('362', '346', '汾西县', '141034', null, '0');
INSERT INTO `lr_china_city` VALUES ('363', '346', '侯马市', '141081', null, '0');
INSERT INTO `lr_china_city` VALUES ('364', '346', '霍州市', '141082', null, '0');
INSERT INTO `lr_china_city` VALUES ('365', '238', '吕梁市', '141100', null, '0');
INSERT INTO `lr_china_city` VALUES ('367', '365', '离石区', '141102', null, '0');
INSERT INTO `lr_china_city` VALUES ('368', '365', '文水县', '141121', null, '0');
INSERT INTO `lr_china_city` VALUES ('369', '365', '交城县', '141122', null, '0');
INSERT INTO `lr_china_city` VALUES ('370', '365', '兴县', '141123', null, '0');
INSERT INTO `lr_china_city` VALUES ('371', '365', '临县', '141124', null, '0');
INSERT INTO `lr_china_city` VALUES ('372', '365', '柳林县', '141125', null, '0');
INSERT INTO `lr_china_city` VALUES ('373', '365', '石楼县', '141126', null, '0');
INSERT INTO `lr_china_city` VALUES ('374', '365', '岚县', '141127', null, '0');
INSERT INTO `lr_china_city` VALUES ('375', '365', '方山县', '141128', null, '0');
INSERT INTO `lr_china_city` VALUES ('376', '365', '中阳县', '141129', null, '0');
INSERT INTO `lr_china_city` VALUES ('377', '365', '交口县', '141130', null, '0');
INSERT INTO `lr_china_city` VALUES ('378', '365', '孝义市', '141181', null, '0');
INSERT INTO `lr_china_city` VALUES ('379', '365', '汾阳市', '141182', null, '0');
INSERT INTO `lr_china_city` VALUES ('380', '0', '内蒙古自治区', '150000', null, '0');
INSERT INTO `lr_china_city` VALUES ('381', '380', '呼和浩特市', '150100', null, '0');
INSERT INTO `lr_china_city` VALUES ('383', '381', '新城区', '150102', null, '0');
INSERT INTO `lr_china_city` VALUES ('384', '381', '回民区', '150103', null, '0');
INSERT INTO `lr_china_city` VALUES ('385', '381', '玉泉区', '150104', null, '0');
INSERT INTO `lr_china_city` VALUES ('386', '381', '赛罕区', '150105', null, '0');
INSERT INTO `lr_china_city` VALUES ('387', '381', '土默特左旗', '150121', null, '0');
INSERT INTO `lr_china_city` VALUES ('388', '381', '托克托县', '150122', null, '0');
INSERT INTO `lr_china_city` VALUES ('389', '381', '和林格尔县', '150123', null, '0');
INSERT INTO `lr_china_city` VALUES ('390', '381', '清水河县', '150124', null, '0');
INSERT INTO `lr_china_city` VALUES ('391', '381', '武川县', '150125', null, '0');
INSERT INTO `lr_china_city` VALUES ('392', '380', '包头市', '150200', null, '0');
INSERT INTO `lr_china_city` VALUES ('394', '392', '东河区', '150202', null, '0');
INSERT INTO `lr_china_city` VALUES ('395', '392', '昆都仑区', '150203', null, '0');
INSERT INTO `lr_china_city` VALUES ('396', '392', '青山区', '150204', null, '0');
INSERT INTO `lr_china_city` VALUES ('397', '392', '石拐区', '150205', null, '0');
INSERT INTO `lr_china_city` VALUES ('398', '392', '白云鄂博矿区', '150206', null, '0');
INSERT INTO `lr_china_city` VALUES ('399', '392', '九原区', '150207', null, '0');
INSERT INTO `lr_china_city` VALUES ('400', '392', '土默特右旗', '150221', null, '0');
INSERT INTO `lr_china_city` VALUES ('401', '392', '固阳县', '150222', null, '0');
INSERT INTO `lr_china_city` VALUES ('402', '392', '达尔罕茂明安联合旗', '150223', null, '0');
INSERT INTO `lr_china_city` VALUES ('403', '380', '乌海市', '150300', null, '0');
INSERT INTO `lr_china_city` VALUES ('405', '403', '海勃湾区', '150302', null, '0');
INSERT INTO `lr_china_city` VALUES ('406', '403', '海南区', '150303', null, '0');
INSERT INTO `lr_china_city` VALUES ('407', '403', '乌达区', '150304', null, '0');
INSERT INTO `lr_china_city` VALUES ('408', '380', '赤峰市', '150400', null, '0');
INSERT INTO `lr_china_city` VALUES ('410', '408', '红山区', '150402', null, '0');
INSERT INTO `lr_china_city` VALUES ('411', '408', '元宝山区', '150403', null, '0');
INSERT INTO `lr_china_city` VALUES ('412', '408', '松山区', '150404', null, '0');
INSERT INTO `lr_china_city` VALUES ('413', '408', '阿鲁科尔沁旗', '150421', null, '0');
INSERT INTO `lr_china_city` VALUES ('414', '408', '巴林左旗', '150422', null, '0');
INSERT INTO `lr_china_city` VALUES ('415', '408', '巴林右旗', '150423', null, '0');
INSERT INTO `lr_china_city` VALUES ('416', '408', '林西县', '150424', null, '0');
INSERT INTO `lr_china_city` VALUES ('417', '408', '克什克腾旗', '150425', null, '0');
INSERT INTO `lr_china_city` VALUES ('418', '408', '翁牛特旗', '150426', null, '0');
INSERT INTO `lr_china_city` VALUES ('419', '408', '喀喇沁旗', '150428', null, '0');
INSERT INTO `lr_china_city` VALUES ('420', '408', '宁城县', '150429', null, '0');
INSERT INTO `lr_china_city` VALUES ('421', '408', '敖汉旗', '150430', null, '0');
INSERT INTO `lr_china_city` VALUES ('422', '380', '通辽市', '150500', null, '0');
INSERT INTO `lr_china_city` VALUES ('424', '422', '科尔沁区', '150502', null, '0');
INSERT INTO `lr_china_city` VALUES ('425', '422', '科尔沁左翼中旗', '150521', null, '0');
INSERT INTO `lr_china_city` VALUES ('426', '422', '科尔沁左翼后旗', '150522', null, '0');
INSERT INTO `lr_china_city` VALUES ('427', '422', '开鲁县', '150523', null, '0');
INSERT INTO `lr_china_city` VALUES ('428', '422', '库伦旗', '150524', null, '0');
INSERT INTO `lr_china_city` VALUES ('429', '422', '奈曼旗', '150525', null, '0');
INSERT INTO `lr_china_city` VALUES ('430', '422', '扎鲁特旗', '150526', null, '0');
INSERT INTO `lr_china_city` VALUES ('431', '422', '霍林郭勒市', '150581', null, '0');
INSERT INTO `lr_china_city` VALUES ('432', '380', '鄂尔多斯市', '150600', null, '0');
INSERT INTO `lr_china_city` VALUES ('434', '432', '东胜区', '150602', null, '0');
INSERT INTO `lr_china_city` VALUES ('435', '432', '达拉特旗', '150621', null, '0');
INSERT INTO `lr_china_city` VALUES ('436', '432', '准格尔旗', '150622', null, '0');
INSERT INTO `lr_china_city` VALUES ('437', '432', '鄂托克前旗', '150623', null, '0');
INSERT INTO `lr_china_city` VALUES ('438', '432', '鄂托克旗', '150624', null, '0');
INSERT INTO `lr_china_city` VALUES ('439', '432', '杭锦旗', '150625', null, '0');
INSERT INTO `lr_china_city` VALUES ('440', '432', '乌审旗', '150626', null, '0');
INSERT INTO `lr_china_city` VALUES ('441', '432', '伊金霍洛旗', '150627', null, '0');
INSERT INTO `lr_china_city` VALUES ('442', '380', '呼伦贝尔市', '150700', null, '0');
INSERT INTO `lr_china_city` VALUES ('444', '442', '海拉尔区', '150702', null, '0');
INSERT INTO `lr_china_city` VALUES ('445', '442', '阿荣旗', '150721', null, '0');
INSERT INTO `lr_china_city` VALUES ('446', '442', '莫力达瓦达斡尔族自治旗', '150722', null, '0');
INSERT INTO `lr_china_city` VALUES ('447', '442', '鄂伦春自治旗', '150723', null, '0');
INSERT INTO `lr_china_city` VALUES ('448', '442', '鄂温克族自治旗', '150724', null, '0');
INSERT INTO `lr_china_city` VALUES ('449', '442', '陈巴尔虎旗', '150725', null, '0');
INSERT INTO `lr_china_city` VALUES ('450', '442', '新巴尔虎左旗', '150726', null, '0');
INSERT INTO `lr_china_city` VALUES ('451', '442', '新巴尔虎右旗', '150727', null, '0');
INSERT INTO `lr_china_city` VALUES ('452', '442', '满洲里市', '150781', null, '0');
INSERT INTO `lr_china_city` VALUES ('453', '442', '牙克石市', '150782', null, '0');
INSERT INTO `lr_china_city` VALUES ('454', '442', '扎兰屯市', '150783', null, '0');
INSERT INTO `lr_china_city` VALUES ('455', '442', '额尔古纳市', '150784', null, '0');
INSERT INTO `lr_china_city` VALUES ('456', '442', '根河市', '150785', null, '0');
INSERT INTO `lr_china_city` VALUES ('457', '380', '巴彦淖尔市', '150800', null, '0');
INSERT INTO `lr_china_city` VALUES ('459', '457', '临河区', '150802', null, '0');
INSERT INTO `lr_china_city` VALUES ('460', '457', '五原县', '150821', null, '0');
INSERT INTO `lr_china_city` VALUES ('461', '457', '磴口县', '150822', null, '0');
INSERT INTO `lr_china_city` VALUES ('462', '457', '乌拉特前旗', '150823', null, '0');
INSERT INTO `lr_china_city` VALUES ('463', '457', '乌拉特中旗', '150824', null, '0');
INSERT INTO `lr_china_city` VALUES ('464', '457', '乌拉特后旗', '150825', null, '0');
INSERT INTO `lr_china_city` VALUES ('465', '457', '杭锦后旗', '150826', null, '0');
INSERT INTO `lr_china_city` VALUES ('466', '380', '乌兰察布市', '150900', null, '0');
INSERT INTO `lr_china_city` VALUES ('468', '466', '集宁区', '150902', null, '0');
INSERT INTO `lr_china_city` VALUES ('469', '466', '卓资县', '150921', null, '0');
INSERT INTO `lr_china_city` VALUES ('470', '466', '化德县', '150922', null, '0');
INSERT INTO `lr_china_city` VALUES ('471', '466', '商都县', '150923', null, '0');
INSERT INTO `lr_china_city` VALUES ('472', '466', '兴和县', '150924', null, '0');
INSERT INTO `lr_china_city` VALUES ('473', '466', '凉城县', '150925', null, '0');
INSERT INTO `lr_china_city` VALUES ('474', '466', '察哈尔右翼前旗', '150926', null, '0');
INSERT INTO `lr_china_city` VALUES ('475', '466', '察哈尔右翼中旗', '150927', null, '0');
INSERT INTO `lr_china_city` VALUES ('476', '466', '察哈尔右翼后旗', '150928', null, '0');
INSERT INTO `lr_china_city` VALUES ('477', '466', '四子王旗', '150929', null, '0');
INSERT INTO `lr_china_city` VALUES ('478', '466', '丰镇市', '150981', null, '0');
INSERT INTO `lr_china_city` VALUES ('479', '380', '兴安盟', '152200', null, '0');
INSERT INTO `lr_china_city` VALUES ('480', '479', '乌兰浩特市', '152201', null, '0');
INSERT INTO `lr_china_city` VALUES ('481', '479', '阿尔山市', '152202', null, '0');
INSERT INTO `lr_china_city` VALUES ('482', '479', '科尔沁右翼前旗', '152221', null, '0');
INSERT INTO `lr_china_city` VALUES ('483', '479', '科尔沁右翼中旗', '152222', null, '0');
INSERT INTO `lr_china_city` VALUES ('484', '479', '扎赉特旗', '152223', null, '0');
INSERT INTO `lr_china_city` VALUES ('485', '479', '突泉县', '152224', null, '0');
INSERT INTO `lr_china_city` VALUES ('486', '380', '锡林郭勒盟', '152500', null, '0');
INSERT INTO `lr_china_city` VALUES ('487', '486', '二连浩特市', '152501', null, '0');
INSERT INTO `lr_china_city` VALUES ('488', '486', '锡林浩特市', '152502', null, '0');
INSERT INTO `lr_china_city` VALUES ('489', '486', '阿巴嘎旗', '152522', null, '0');
INSERT INTO `lr_china_city` VALUES ('490', '486', '苏尼特左旗', '152523', null, '0');
INSERT INTO `lr_china_city` VALUES ('491', '486', '苏尼特右旗', '152524', null, '0');
INSERT INTO `lr_china_city` VALUES ('492', '486', '东乌珠穆沁旗', '152525', null, '0');
INSERT INTO `lr_china_city` VALUES ('493', '486', '西乌珠穆沁旗', '152526', null, '0');
INSERT INTO `lr_china_city` VALUES ('494', '486', '太仆寺旗', '152527', null, '0');
INSERT INTO `lr_china_city` VALUES ('495', '486', '镶黄旗', '152528', null, '0');
INSERT INTO `lr_china_city` VALUES ('496', '486', '正镶白旗', '152529', null, '0');
INSERT INTO `lr_china_city` VALUES ('497', '486', '正蓝旗', '152530', null, '0');
INSERT INTO `lr_china_city` VALUES ('498', '486', '多伦县', '152531', null, '0');
INSERT INTO `lr_china_city` VALUES ('499', '380', '阿拉善盟', '152900', null, '0');
INSERT INTO `lr_china_city` VALUES ('500', '499', '阿拉善左旗', '152921', null, '0');
INSERT INTO `lr_china_city` VALUES ('501', '499', '阿拉善右旗', '152922', null, '0');
INSERT INTO `lr_china_city` VALUES ('502', '499', '额济纳旗', '152923', null, '0');
INSERT INTO `lr_china_city` VALUES ('503', '0', '辽宁省', '210000', null, '0');
INSERT INTO `lr_china_city` VALUES ('504', '503', '沈阳市', '210100', null, '0');
INSERT INTO `lr_china_city` VALUES ('506', '504', '和平区', '210102', null, '0');
INSERT INTO `lr_china_city` VALUES ('507', '504', '沈河区', '210103', null, '0');
INSERT INTO `lr_china_city` VALUES ('508', '504', '大东区', '210104', null, '0');
INSERT INTO `lr_china_city` VALUES ('509', '504', '皇姑区', '210105', null, '0');
INSERT INTO `lr_china_city` VALUES ('510', '504', '铁西区', '210106', null, '0');
INSERT INTO `lr_china_city` VALUES ('511', '504', '苏家屯区', '210111', null, '0');
INSERT INTO `lr_china_city` VALUES ('512', '504', '东陵区', '210112', null, '0');
INSERT INTO `lr_china_city` VALUES ('513', '504', '沈北新区', '210113', null, '0');
INSERT INTO `lr_china_city` VALUES ('514', '504', '于洪区', '210114', null, '0');
INSERT INTO `lr_china_city` VALUES ('515', '504', '辽中县', '210122', null, '0');
INSERT INTO `lr_china_city` VALUES ('516', '504', '康平县', '210123', null, '0');
INSERT INTO `lr_china_city` VALUES ('517', '504', '法库县', '210124', null, '0');
INSERT INTO `lr_china_city` VALUES ('518', '504', '新民市', '210181', null, '0');
INSERT INTO `lr_china_city` VALUES ('519', '503', '大连市', '210200', null, '0');
INSERT INTO `lr_china_city` VALUES ('521', '519', '中山区', '210202', null, '0');
INSERT INTO `lr_china_city` VALUES ('522', '519', '西岗区', '210203', null, '0');
INSERT INTO `lr_china_city` VALUES ('523', '519', '沙河口区', '210204', null, '0');
INSERT INTO `lr_china_city` VALUES ('524', '519', '甘井子区', '210211', null, '0');
INSERT INTO `lr_china_city` VALUES ('525', '519', '旅顺口区', '210212', null, '0');
INSERT INTO `lr_china_city` VALUES ('526', '519', '金州区', '210213', null, '0');
INSERT INTO `lr_china_city` VALUES ('527', '519', '长海县', '210224', null, '0');
INSERT INTO `lr_china_city` VALUES ('528', '519', '瓦房店市', '210281', null, '0');
INSERT INTO `lr_china_city` VALUES ('529', '519', '普兰店市', '210282', null, '0');
INSERT INTO `lr_china_city` VALUES ('530', '519', '庄河市', '210283', null, '0');
INSERT INTO `lr_china_city` VALUES ('531', '503', '鞍山市', '210300', null, '0');
INSERT INTO `lr_china_city` VALUES ('533', '531', '铁东区', '210302', null, '0');
INSERT INTO `lr_china_city` VALUES ('534', '531', '铁西区', '210303', null, '0');
INSERT INTO `lr_china_city` VALUES ('535', '531', '立山区', '210304', null, '0');
INSERT INTO `lr_china_city` VALUES ('536', '531', '千山区', '210311', null, '0');
INSERT INTO `lr_china_city` VALUES ('537', '531', '台安县', '210321', null, '0');
INSERT INTO `lr_china_city` VALUES ('538', '531', '岫岩满族自治县', '210323', null, '0');
INSERT INTO `lr_china_city` VALUES ('539', '531', '海城市', '210381', null, '0');
INSERT INTO `lr_china_city` VALUES ('540', '503', '抚顺市', '210400', null, '0');
INSERT INTO `lr_china_city` VALUES ('542', '540', '新抚区', '210402', null, '0');
INSERT INTO `lr_china_city` VALUES ('543', '540', '东洲区', '210403', null, '0');
INSERT INTO `lr_china_city` VALUES ('544', '540', '望花区', '210404', null, '0');
INSERT INTO `lr_china_city` VALUES ('545', '540', '顺城区', '210411', null, '0');
INSERT INTO `lr_china_city` VALUES ('546', '540', '抚顺县', '210421', null, '0');
INSERT INTO `lr_china_city` VALUES ('547', '540', '新宾满族自治县', '210422', null, '0');
INSERT INTO `lr_china_city` VALUES ('548', '540', '清原满族自治县', '210423', null, '0');
INSERT INTO `lr_china_city` VALUES ('549', '503', '本溪市', '210500', null, '0');
INSERT INTO `lr_china_city` VALUES ('551', '549', '平山区', '210502', null, '0');
INSERT INTO `lr_china_city` VALUES ('552', '549', '溪湖区', '210503', null, '0');
INSERT INTO `lr_china_city` VALUES ('553', '549', '明山区', '210504', null, '0');
INSERT INTO `lr_china_city` VALUES ('554', '549', '南芬区', '210505', null, '0');
INSERT INTO `lr_china_city` VALUES ('555', '549', '本溪满族自治县', '210521', null, '0');
INSERT INTO `lr_china_city` VALUES ('556', '549', '桓仁满族自治县', '210522', null, '0');
INSERT INTO `lr_china_city` VALUES ('557', '503', '丹东市', '210600', null, '0');
INSERT INTO `lr_china_city` VALUES ('559', '557', '元宝区', '210602', null, '0');
INSERT INTO `lr_china_city` VALUES ('560', '557', '振兴区', '210603', null, '0');
INSERT INTO `lr_china_city` VALUES ('561', '557', '振安区', '210604', null, '0');
INSERT INTO `lr_china_city` VALUES ('562', '557', '宽甸满族自治县', '210624', null, '0');
INSERT INTO `lr_china_city` VALUES ('563', '557', '东港市', '210681', null, '0');
INSERT INTO `lr_china_city` VALUES ('564', '557', '凤城市', '210682', null, '0');
INSERT INTO `lr_china_city` VALUES ('565', '503', '锦州市', '210700', null, '0');
INSERT INTO `lr_china_city` VALUES ('567', '565', '古塔区', '210702', null, '0');
INSERT INTO `lr_china_city` VALUES ('568', '565', '凌河区', '210703', null, '0');
INSERT INTO `lr_china_city` VALUES ('569', '565', '太和区', '210711', null, '0');
INSERT INTO `lr_china_city` VALUES ('570', '565', '黑山县', '210726', null, '0');
INSERT INTO `lr_china_city` VALUES ('571', '565', '义县', '210727', null, '0');
INSERT INTO `lr_china_city` VALUES ('572', '565', '凌海市', '210781', null, '0');
INSERT INTO `lr_china_city` VALUES ('573', '565', '北镇市', '210782', null, '0');
INSERT INTO `lr_china_city` VALUES ('574', '503', '营口市', '210800', null, '0');
INSERT INTO `lr_china_city` VALUES ('576', '574', '站前区', '210802', null, '0');
INSERT INTO `lr_china_city` VALUES ('577', '574', '西市区', '210803', null, '0');
INSERT INTO `lr_china_city` VALUES ('578', '574', '鲅鱼圈区', '210804', null, '0');
INSERT INTO `lr_china_city` VALUES ('579', '574', '老边区', '210811', null, '0');
INSERT INTO `lr_china_city` VALUES ('580', '574', '盖州市', '210881', null, '0');
INSERT INTO `lr_china_city` VALUES ('581', '574', '大石桥市', '210882', null, '0');
INSERT INTO `lr_china_city` VALUES ('582', '503', '阜新市', '210900', null, '0');
INSERT INTO `lr_china_city` VALUES ('584', '582', '海州区', '210902', null, '0');
INSERT INTO `lr_china_city` VALUES ('585', '582', '新邱区', '210903', null, '0');
INSERT INTO `lr_china_city` VALUES ('586', '582', '太平区', '210904', null, '0');
INSERT INTO `lr_china_city` VALUES ('587', '582', '清河门区', '210905', null, '0');
INSERT INTO `lr_china_city` VALUES ('588', '582', '细河区', '210911', null, '0');
INSERT INTO `lr_china_city` VALUES ('589', '582', '阜新蒙古族自治县', '210921', null, '0');
INSERT INTO `lr_china_city` VALUES ('590', '582', '彰武县', '210922', null, '0');
INSERT INTO `lr_china_city` VALUES ('591', '503', '辽阳市', '211000', null, '0');
INSERT INTO `lr_china_city` VALUES ('593', '591', '白塔区', '211002', null, '0');
INSERT INTO `lr_china_city` VALUES ('594', '591', '文圣区', '211003', null, '0');
INSERT INTO `lr_china_city` VALUES ('595', '591', '宏伟区', '211004', null, '0');
INSERT INTO `lr_china_city` VALUES ('596', '591', '弓长岭区', '211005', null, '0');
INSERT INTO `lr_china_city` VALUES ('597', '591', '太子河区', '211011', null, '0');
INSERT INTO `lr_china_city` VALUES ('598', '591', '辽阳县', '211021', null, '0');
INSERT INTO `lr_china_city` VALUES ('599', '591', '灯塔市', '211081', null, '0');
INSERT INTO `lr_china_city` VALUES ('600', '503', '盘锦市', '211100', null, '0');
INSERT INTO `lr_china_city` VALUES ('602', '600', '双台子区', '211102', null, '0');
INSERT INTO `lr_china_city` VALUES ('603', '600', '兴隆台区', '211103', null, '0');
INSERT INTO `lr_china_city` VALUES ('604', '600', '大洼县', '211121', null, '0');
INSERT INTO `lr_china_city` VALUES ('605', '600', '盘山县', '211122', null, '0');
INSERT INTO `lr_china_city` VALUES ('606', '503', '铁岭市', '211200', null, '0');
INSERT INTO `lr_china_city` VALUES ('608', '606', '银州区', '211202', null, '0');
INSERT INTO `lr_china_city` VALUES ('609', '606', '清河区', '211204', null, '0');
INSERT INTO `lr_china_city` VALUES ('610', '606', '铁岭县', '211221', null, '0');
INSERT INTO `lr_china_city` VALUES ('611', '606', '西丰县', '211223', null, '0');
INSERT INTO `lr_china_city` VALUES ('612', '606', '昌图县', '211224', null, '0');
INSERT INTO `lr_china_city` VALUES ('613', '606', '调兵山市', '211281', null, '0');
INSERT INTO `lr_china_city` VALUES ('614', '606', '开原市', '211282', null, '0');
INSERT INTO `lr_china_city` VALUES ('615', '503', '朝阳市', '211300', null, '0');
INSERT INTO `lr_china_city` VALUES ('617', '615', '双塔区', '211302', null, '0');
INSERT INTO `lr_china_city` VALUES ('618', '615', '龙城区', '211303', null, '0');
INSERT INTO `lr_china_city` VALUES ('619', '615', '朝阳县', '211321', null, '0');
INSERT INTO `lr_china_city` VALUES ('620', '615', '建平县', '211322', null, '0');
INSERT INTO `lr_china_city` VALUES ('621', '615', '喀喇沁左翼蒙古族自治县', '211324', null, '0');
INSERT INTO `lr_china_city` VALUES ('622', '615', '北票市', '211381', null, '0');
INSERT INTO `lr_china_city` VALUES ('623', '615', '凌源市', '211382', null, '0');
INSERT INTO `lr_china_city` VALUES ('624', '503', '葫芦岛市', '211400', null, '0');
INSERT INTO `lr_china_city` VALUES ('626', '624', '连山区', '211402', null, '0');
INSERT INTO `lr_china_city` VALUES ('627', '624', '龙港区', '211403', null, '0');
INSERT INTO `lr_china_city` VALUES ('628', '624', '南票区', '211404', null, '0');
INSERT INTO `lr_china_city` VALUES ('629', '624', '绥中县', '211421', null, '0');
INSERT INTO `lr_china_city` VALUES ('630', '624', '建昌县', '211422', null, '0');
INSERT INTO `lr_china_city` VALUES ('631', '624', '兴城市', '211481', null, '0');
INSERT INTO `lr_china_city` VALUES ('632', '0', '吉林省', '220000', null, '0');
INSERT INTO `lr_china_city` VALUES ('633', '632', '长春市', '220100', null, '0');
INSERT INTO `lr_china_city` VALUES ('635', '633', '南关区', '220102', null, '0');
INSERT INTO `lr_china_city` VALUES ('636', '633', '宽城区', '220103', null, '0');
INSERT INTO `lr_china_city` VALUES ('637', '633', '朝阳区', '220104', null, '0');
INSERT INTO `lr_china_city` VALUES ('638', '633', '二道区', '220105', null, '0');
INSERT INTO `lr_china_city` VALUES ('639', '633', '绿园区', '220106', null, '0');
INSERT INTO `lr_china_city` VALUES ('640', '633', '双阳区', '220112', null, '0');
INSERT INTO `lr_china_city` VALUES ('641', '633', '农安县', '220122', null, '0');
INSERT INTO `lr_china_city` VALUES ('642', '633', '九台市', '220181', null, '0');
INSERT INTO `lr_china_city` VALUES ('643', '633', '榆树市', '220182', null, '0');
INSERT INTO `lr_china_city` VALUES ('644', '633', '德惠市', '220183', null, '0');
INSERT INTO `lr_china_city` VALUES ('645', '632', '吉林市', '220200', null, '0');
INSERT INTO `lr_china_city` VALUES ('647', '645', '昌邑区', '220202', null, '0');
INSERT INTO `lr_china_city` VALUES ('648', '645', '龙潭区', '220203', null, '0');
INSERT INTO `lr_china_city` VALUES ('649', '645', '船营区', '220204', null, '0');
INSERT INTO `lr_china_city` VALUES ('650', '645', '丰满区', '220211', null, '0');
INSERT INTO `lr_china_city` VALUES ('651', '645', '永吉县', '220221', null, '0');
INSERT INTO `lr_china_city` VALUES ('652', '645', '蛟河市', '220281', null, '0');
INSERT INTO `lr_china_city` VALUES ('653', '645', '桦甸市', '220282', null, '0');
INSERT INTO `lr_china_city` VALUES ('654', '645', '舒兰市', '220283', null, '0');
INSERT INTO `lr_china_city` VALUES ('655', '645', '磐石市', '220284', null, '0');
INSERT INTO `lr_china_city` VALUES ('656', '632', '四平市', '220300', null, '0');
INSERT INTO `lr_china_city` VALUES ('658', '656', '铁西区', '220302', null, '0');
INSERT INTO `lr_china_city` VALUES ('659', '656', '铁东区', '220303', null, '0');
INSERT INTO `lr_china_city` VALUES ('660', '656', '梨树县', '220322', null, '0');
INSERT INTO `lr_china_city` VALUES ('661', '656', '伊通满族自治县', '220323', null, '0');
INSERT INTO `lr_china_city` VALUES ('662', '656', '公主岭市', '220381', null, '0');
INSERT INTO `lr_china_city` VALUES ('663', '656', '双辽市', '220382', null, '0');
INSERT INTO `lr_china_city` VALUES ('664', '632', '辽源市', '220400', null, '0');
INSERT INTO `lr_china_city` VALUES ('666', '664', '龙山区', '220402', null, '0');
INSERT INTO `lr_china_city` VALUES ('667', '664', '西安区', '220403', null, '0');
INSERT INTO `lr_china_city` VALUES ('668', '664', '东丰县', '220421', null, '0');
INSERT INTO `lr_china_city` VALUES ('669', '664', '东辽县', '220422', null, '0');
INSERT INTO `lr_china_city` VALUES ('670', '632', '通化市', '220500', null, '0');
INSERT INTO `lr_china_city` VALUES ('672', '670', '东昌区', '220502', null, '0');
INSERT INTO `lr_china_city` VALUES ('673', '670', '二道江区', '220503', null, '0');
INSERT INTO `lr_china_city` VALUES ('674', '670', '通化县', '220521', null, '0');
INSERT INTO `lr_china_city` VALUES ('675', '670', '辉南县', '220523', null, '0');
INSERT INTO `lr_china_city` VALUES ('676', '670', '柳河县', '220524', null, '0');
INSERT INTO `lr_china_city` VALUES ('677', '670', '梅河口市', '220581', null, '0');
INSERT INTO `lr_china_city` VALUES ('678', '670', '集安市', '220582', null, '0');
INSERT INTO `lr_china_city` VALUES ('679', '632', '白山市', '220600', null, '0');
INSERT INTO `lr_china_city` VALUES ('681', '679', '八道江区', '220602', null, '0');
INSERT INTO `lr_china_city` VALUES ('682', '679', '江源区', '220605', null, '0');
INSERT INTO `lr_china_city` VALUES ('683', '679', '抚松县', '220621', null, '0');
INSERT INTO `lr_china_city` VALUES ('684', '679', '靖宇县', '220622', null, '0');
INSERT INTO `lr_china_city` VALUES ('685', '679', '长白朝鲜族自治县', '220623', null, '0');
INSERT INTO `lr_china_city` VALUES ('686', '679', '临江市', '220681', null, '0');
INSERT INTO `lr_china_city` VALUES ('687', '632', '松原市', '220700', null, '0');
INSERT INTO `lr_china_city` VALUES ('689', '687', '宁江区', '220702', null, '0');
INSERT INTO `lr_china_city` VALUES ('690', '687', '前郭尔罗斯蒙古族自治县', '220721', null, '0');
INSERT INTO `lr_china_city` VALUES ('691', '687', '长岭县', '220722', null, '0');
INSERT INTO `lr_china_city` VALUES ('692', '687', '乾安县', '220723', null, '0');
INSERT INTO `lr_china_city` VALUES ('693', '687', '扶余县', '220724', null, '0');
INSERT INTO `lr_china_city` VALUES ('694', '632', '白城市', '220800', null, '0');
INSERT INTO `lr_china_city` VALUES ('696', '694', '洮北区', '220802', null, '0');
INSERT INTO `lr_china_city` VALUES ('697', '694', '镇赉县', '220821', null, '0');
INSERT INTO `lr_china_city` VALUES ('698', '694', '通榆县', '220822', null, '0');
INSERT INTO `lr_china_city` VALUES ('699', '694', '洮南市', '220881', null, '0');
INSERT INTO `lr_china_city` VALUES ('700', '694', '大安市', '220882', null, '0');
INSERT INTO `lr_china_city` VALUES ('701', '632', '延边朝鲜族自治州', '222400', null, '0');
INSERT INTO `lr_china_city` VALUES ('702', '701', '延吉市', '222401', null, '0');
INSERT INTO `lr_china_city` VALUES ('703', '701', '图们市', '222402', null, '0');
INSERT INTO `lr_china_city` VALUES ('704', '701', '敦化市', '222403', null, '0');
INSERT INTO `lr_china_city` VALUES ('705', '701', '珲春市', '222404', null, '0');
INSERT INTO `lr_china_city` VALUES ('706', '701', '龙井市', '222405', null, '0');
INSERT INTO `lr_china_city` VALUES ('707', '701', '和龙市', '222406', null, '0');
INSERT INTO `lr_china_city` VALUES ('708', '701', '汪清县', '222424', null, '0');
INSERT INTO `lr_china_city` VALUES ('709', '701', '安图县', '222426', null, '0');
INSERT INTO `lr_china_city` VALUES ('710', '0', '黑龙江省', '230000', null, '0');
INSERT INTO `lr_china_city` VALUES ('711', '710', '哈尔滨市', '230100', null, '0');
INSERT INTO `lr_china_city` VALUES ('713', '711', '道里区', '230102', null, '0');
INSERT INTO `lr_china_city` VALUES ('714', '711', '南岗区', '230103', null, '0');
INSERT INTO `lr_china_city` VALUES ('715', '711', '道外区', '230104', null, '0');
INSERT INTO `lr_china_city` VALUES ('716', '711', '平房区', '230108', null, '0');
INSERT INTO `lr_china_city` VALUES ('717', '711', '松北区', '230109', null, '0');
INSERT INTO `lr_china_city` VALUES ('718', '711', '香坊区', '230110', null, '0');
INSERT INTO `lr_china_city` VALUES ('719', '711', '呼兰区', '230111', null, '0');
INSERT INTO `lr_china_city` VALUES ('720', '711', '阿城区 ', '230112', null, '0');
INSERT INTO `lr_china_city` VALUES ('721', '711', '依兰县', '230123', null, '0');
INSERT INTO `lr_china_city` VALUES ('722', '711', '方正县', '230124', null, '0');
INSERT INTO `lr_china_city` VALUES ('723', '711', '宾县', '230125', null, '0');
INSERT INTO `lr_china_city` VALUES ('724', '711', '巴彦县', '230126', null, '0');
INSERT INTO `lr_china_city` VALUES ('725', '711', '木兰县', '230127', null, '0');
INSERT INTO `lr_china_city` VALUES ('726', '711', '通河县', '230128', null, '0');
INSERT INTO `lr_china_city` VALUES ('727', '711', '延寿县', '230129', null, '0');
INSERT INTO `lr_china_city` VALUES ('728', '711', '双城市', '230182', null, '0');
INSERT INTO `lr_china_city` VALUES ('729', '711', '尚志市', '230183', null, '0');
INSERT INTO `lr_china_city` VALUES ('730', '711', '五常市', '230184', null, '0');
INSERT INTO `lr_china_city` VALUES ('731', '710', '齐齐哈尔市', '230200', null, '0');
INSERT INTO `lr_china_city` VALUES ('733', '731', '龙沙区', '230202', null, '0');
INSERT INTO `lr_china_city` VALUES ('734', '731', '建华区', '230203', null, '0');
INSERT INTO `lr_china_city` VALUES ('735', '731', '铁锋区', '230204', null, '0');
INSERT INTO `lr_china_city` VALUES ('736', '731', '昂昂溪区', '230205', null, '0');
INSERT INTO `lr_china_city` VALUES ('737', '731', '富拉尔基区', '230206', null, '0');
INSERT INTO `lr_china_city` VALUES ('738', '731', '碾子山区', '230207', null, '0');
INSERT INTO `lr_china_city` VALUES ('739', '731', '梅里斯达斡尔族区', '230208', null, '0');
INSERT INTO `lr_china_city` VALUES ('740', '731', '龙江县', '230221', null, '0');
INSERT INTO `lr_china_city` VALUES ('741', '731', '依安县', '230223', null, '0');
INSERT INTO `lr_china_city` VALUES ('742', '731', '泰来县', '230224', null, '0');
INSERT INTO `lr_china_city` VALUES ('743', '731', '甘南县', '230225', null, '0');
INSERT INTO `lr_china_city` VALUES ('744', '731', '富裕县', '230227', null, '0');
INSERT INTO `lr_china_city` VALUES ('745', '731', '克山县', '230229', null, '0');
INSERT INTO `lr_china_city` VALUES ('746', '731', '克东县', '230230', null, '0');
INSERT INTO `lr_china_city` VALUES ('747', '731', '拜泉县', '230231', null, '0');
INSERT INTO `lr_china_city` VALUES ('748', '731', '讷河市', '230281', null, '0');
INSERT INTO `lr_china_city` VALUES ('749', '710', '鸡西市', '230300', null, '0');
INSERT INTO `lr_china_city` VALUES ('751', '749', '鸡冠区', '230302', null, '0');
INSERT INTO `lr_china_city` VALUES ('752', '749', '恒山区', '230303', null, '0');
INSERT INTO `lr_china_city` VALUES ('753', '749', '滴道区', '230304', null, '0');
INSERT INTO `lr_china_city` VALUES ('754', '749', '梨树区', '230305', null, '0');
INSERT INTO `lr_china_city` VALUES ('755', '749', '城子河区', '230306', null, '0');
INSERT INTO `lr_china_city` VALUES ('756', '749', '麻山区', '230307', null, '0');
INSERT INTO `lr_china_city` VALUES ('757', '749', '鸡东县', '230321', null, '0');
INSERT INTO `lr_china_city` VALUES ('758', '749', '虎林市', '230381', null, '0');
INSERT INTO `lr_china_city` VALUES ('759', '749', '密山市', '230382', null, '0');
INSERT INTO `lr_china_city` VALUES ('760', '710', '鹤岗市', '230400', null, '0');
INSERT INTO `lr_china_city` VALUES ('762', '760', '向阳区', '230402', null, '0');
INSERT INTO `lr_china_city` VALUES ('763', '760', '工农区', '230403', null, '0');
INSERT INTO `lr_china_city` VALUES ('764', '760', '南山区', '230404', null, '0');
INSERT INTO `lr_china_city` VALUES ('765', '760', '兴安区', '230405', null, '0');
INSERT INTO `lr_china_city` VALUES ('766', '760', '东山区', '230406', null, '0');
INSERT INTO `lr_china_city` VALUES ('767', '760', '兴山区', '230407', null, '0');
INSERT INTO `lr_china_city` VALUES ('768', '760', '萝北县', '230421', null, '0');
INSERT INTO `lr_china_city` VALUES ('769', '760', '绥滨县', '230422', null, '0');
INSERT INTO `lr_china_city` VALUES ('770', '710', '双鸭山市', '230500', null, '0');
INSERT INTO `lr_china_city` VALUES ('772', '770', '尖山区', '230502', null, '0');
INSERT INTO `lr_china_city` VALUES ('773', '770', '岭东区', '230503', null, '0');
INSERT INTO `lr_china_city` VALUES ('774', '770', '四方台区', '230505', null, '0');
INSERT INTO `lr_china_city` VALUES ('775', '770', '宝山区', '230506', null, '0');
INSERT INTO `lr_china_city` VALUES ('776', '770', '集贤县', '230521', null, '0');
INSERT INTO `lr_china_city` VALUES ('777', '770', '友谊县', '230522', null, '0');
INSERT INTO `lr_china_city` VALUES ('778', '770', '宝清县', '230523', null, '0');
INSERT INTO `lr_china_city` VALUES ('779', '770', '饶河县', '230524', null, '0');
INSERT INTO `lr_china_city` VALUES ('780', '710', '大庆市', '230600', null, '0');
INSERT INTO `lr_china_city` VALUES ('782', '780', '萨尔图区', '230602', null, '0');
INSERT INTO `lr_china_city` VALUES ('783', '780', '龙凤区', '230603', null, '0');
INSERT INTO `lr_china_city` VALUES ('784', '780', '让胡路区', '230604', null, '0');
INSERT INTO `lr_china_city` VALUES ('785', '780', '红岗区', '230605', null, '0');
INSERT INTO `lr_china_city` VALUES ('786', '780', '大同区', '230606', null, '0');
INSERT INTO `lr_china_city` VALUES ('787', '780', '肇州县', '230621', null, '0');
INSERT INTO `lr_china_city` VALUES ('788', '780', '肇源县', '230622', null, '0');
INSERT INTO `lr_china_city` VALUES ('789', '780', '林甸县', '230623', null, '0');
INSERT INTO `lr_china_city` VALUES ('790', '780', '杜尔伯特蒙古族自治县', '230624', null, '0');
INSERT INTO `lr_china_city` VALUES ('791', '710', '伊春市', '230700', null, '0');
INSERT INTO `lr_china_city` VALUES ('793', '791', '伊春区', '230702', null, '0');
INSERT INTO `lr_china_city` VALUES ('794', '791', '南岔区', '230703', null, '0');
INSERT INTO `lr_china_city` VALUES ('795', '791', '友好区', '230704', null, '0');
INSERT INTO `lr_china_city` VALUES ('796', '791', '西林区', '230705', null, '0');
INSERT INTO `lr_china_city` VALUES ('797', '791', '翠峦区', '230706', null, '0');
INSERT INTO `lr_china_city` VALUES ('798', '791', '新青区', '230707', null, '0');
INSERT INTO `lr_china_city` VALUES ('799', '791', '美溪区', '230708', null, '0');
INSERT INTO `lr_china_city` VALUES ('800', '791', '金山屯区', '230709', null, '0');
INSERT INTO `lr_china_city` VALUES ('801', '791', '五营区', '230710', null, '0');
INSERT INTO `lr_china_city` VALUES ('802', '791', '乌马河区', '230711', null, '0');
INSERT INTO `lr_china_city` VALUES ('803', '791', '汤旺河区', '230712', null, '0');
INSERT INTO `lr_china_city` VALUES ('804', '791', '带岭区', '230713', null, '0');
INSERT INTO `lr_china_city` VALUES ('805', '791', '乌伊岭区', '230714', null, '0');
INSERT INTO `lr_china_city` VALUES ('806', '791', '红星区', '230715', null, '0');
INSERT INTO `lr_china_city` VALUES ('807', '791', '上甘岭区', '230716', null, '0');
INSERT INTO `lr_china_city` VALUES ('808', '791', '嘉荫县', '230722', null, '0');
INSERT INTO `lr_china_city` VALUES ('809', '791', '铁力市', '230781', null, '0');
INSERT INTO `lr_china_city` VALUES ('810', '710', '佳木斯市', '230800', null, '0');
INSERT INTO `lr_china_city` VALUES ('812', '810', '向阳区', '230803', null, '0');
INSERT INTO `lr_china_city` VALUES ('813', '810', '前进区', '230804', null, '0');
INSERT INTO `lr_china_city` VALUES ('814', '810', '东风区', '230805', null, '0');
INSERT INTO `lr_china_city` VALUES ('815', '810', '郊区', '230811', null, '0');
INSERT INTO `lr_china_city` VALUES ('816', '810', '桦南县', '230822', null, '0');
INSERT INTO `lr_china_city` VALUES ('817', '810', '桦川县', '230826', null, '0');
INSERT INTO `lr_china_city` VALUES ('818', '810', '汤原县', '230828', null, '0');
INSERT INTO `lr_china_city` VALUES ('819', '810', '抚远县', '230833', null, '0');
INSERT INTO `lr_china_city` VALUES ('820', '810', '同江市', '230881', null, '0');
INSERT INTO `lr_china_city` VALUES ('821', '810', '富锦市', '230882', null, '0');
INSERT INTO `lr_china_city` VALUES ('822', '710', '七台河市', '230900', null, '0');
INSERT INTO `lr_china_city` VALUES ('824', '822', '新兴区', '230902', null, '0');
INSERT INTO `lr_china_city` VALUES ('825', '822', '桃山区', '230903', null, '0');
INSERT INTO `lr_china_city` VALUES ('826', '822', '茄子河区', '230904', null, '0');
INSERT INTO `lr_china_city` VALUES ('827', '822', '勃利县', '230921', null, '0');
INSERT INTO `lr_china_city` VALUES ('828', '710', '牡丹江市', '231000', null, '0');
INSERT INTO `lr_china_city` VALUES ('830', '828', '东安区', '231002', null, '0');
INSERT INTO `lr_china_city` VALUES ('831', '828', '阳明区', '231003', null, '0');
INSERT INTO `lr_china_city` VALUES ('832', '828', '爱民区', '231004', null, '0');
INSERT INTO `lr_china_city` VALUES ('833', '828', '西安区', '231005', null, '0');
INSERT INTO `lr_china_city` VALUES ('834', '828', '东宁县', '231024', null, '0');
INSERT INTO `lr_china_city` VALUES ('835', '828', '林口县', '231025', null, '0');
INSERT INTO `lr_china_city` VALUES ('836', '828', '绥芬河市', '231081', null, '0');
INSERT INTO `lr_china_city` VALUES ('837', '828', '海林市', '231083', null, '0');
INSERT INTO `lr_china_city` VALUES ('838', '828', '宁安市', '231084', null, '0');
INSERT INTO `lr_china_city` VALUES ('839', '828', '穆棱市', '231085', null, '0');
INSERT INTO `lr_china_city` VALUES ('840', '710', '黑河市', '231100', null, '0');
INSERT INTO `lr_china_city` VALUES ('842', '840', '爱辉区', '231102', null, '0');
INSERT INTO `lr_china_city` VALUES ('843', '840', '嫩江县', '231121', null, '0');
INSERT INTO `lr_china_city` VALUES ('844', '840', '逊克县', '231123', null, '0');
INSERT INTO `lr_china_city` VALUES ('845', '840', '孙吴县', '231124', null, '0');
INSERT INTO `lr_china_city` VALUES ('846', '840', '北安市', '231181', null, '0');
INSERT INTO `lr_china_city` VALUES ('847', '840', '五大连池市', '231182', null, '0');
INSERT INTO `lr_china_city` VALUES ('848', '710', '绥化市', '231200', null, '0');
INSERT INTO `lr_china_city` VALUES ('850', '848', '北林区', '231202', null, '0');
INSERT INTO `lr_china_city` VALUES ('851', '848', '望奎县', '231221', null, '0');
INSERT INTO `lr_china_city` VALUES ('852', '848', '兰西县', '231222', null, '0');
INSERT INTO `lr_china_city` VALUES ('853', '848', '青冈县', '231223', null, '0');
INSERT INTO `lr_china_city` VALUES ('854', '848', '庆安县', '231224', null, '0');
INSERT INTO `lr_china_city` VALUES ('855', '848', '明水县', '231225', null, '0');
INSERT INTO `lr_china_city` VALUES ('856', '848', '绥棱县', '231226', null, '0');
INSERT INTO `lr_china_city` VALUES ('857', '848', '安达市', '231281', null, '0');
INSERT INTO `lr_china_city` VALUES ('858', '848', '肇东市', '231282', null, '0');
INSERT INTO `lr_china_city` VALUES ('859', '848', '海伦市', '231283', null, '0');
INSERT INTO `lr_china_city` VALUES ('860', '710', '大兴安岭地区', '232700', null, '0');
INSERT INTO `lr_china_city` VALUES ('861', '860', '加格达奇区', '232701', null, '0');
INSERT INTO `lr_china_city` VALUES ('862', '860', '松岭区', '232702', null, '0');
INSERT INTO `lr_china_city` VALUES ('863', '860', '新林区', '232703', null, '0');
INSERT INTO `lr_china_city` VALUES ('864', '860', '呼中区', '232704', null, '0');
INSERT INTO `lr_china_city` VALUES ('865', '860', '呼玛县', '232721', null, '0');
INSERT INTO `lr_china_city` VALUES ('866', '860', '塔河县', '232722', null, '0');
INSERT INTO `lr_china_city` VALUES ('867', '860', '漠河县', '232723', null, '0');
INSERT INTO `lr_china_city` VALUES ('868', '0', '上海市', '310000', null, '0');
INSERT INTO `lr_china_city` VALUES ('869', '868', '上海市', '310000', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('870', '869', '黄浦区', '310101', null, '0');
INSERT INTO `lr_china_city` VALUES ('871', '869', '卢湾区', '310103', null, '0');
INSERT INTO `lr_china_city` VALUES ('872', '869', '徐汇区', '310104', null, '0');
INSERT INTO `lr_china_city` VALUES ('873', '869', '长宁区', '310105', null, '0');
INSERT INTO `lr_china_city` VALUES ('874', '869', '静安区', '310106', null, '0');
INSERT INTO `lr_china_city` VALUES ('875', '869', '普陀区', '310107', null, '0');
INSERT INTO `lr_china_city` VALUES ('876', '869', '闸北区', '310108', null, '0');
INSERT INTO `lr_china_city` VALUES ('877', '869', '虹口区', '310109', null, '0');
INSERT INTO `lr_china_city` VALUES ('878', '869', '杨浦区', '310110', null, '0');
INSERT INTO `lr_china_city` VALUES ('879', '869', '闵行区', '310112', null, '0');
INSERT INTO `lr_china_city` VALUES ('880', '869', '宝山区', '310113', null, '0');
INSERT INTO `lr_china_city` VALUES ('881', '869', '嘉定区', '310114', null, '0');
INSERT INTO `lr_china_city` VALUES ('882', '869', '浦东新区', '310115', null, '0');
INSERT INTO `lr_china_city` VALUES ('883', '869', '金山区', '310116', null, '0');
INSERT INTO `lr_china_city` VALUES ('884', '869', '松江区', '310117', null, '0');
INSERT INTO `lr_china_city` VALUES ('885', '869', '青浦区', '310118', null, '0');
INSERT INTO `lr_china_city` VALUES ('886', '869', '南汇区', '310119', null, '0');
INSERT INTO `lr_china_city` VALUES ('887', '869', '奉贤区', '310120', null, '0');
INSERT INTO `lr_china_city` VALUES ('888', '868', '县', '310200', null, '0');
INSERT INTO `lr_china_city` VALUES ('889', '888', '崇明县', '310230', null, '0');
INSERT INTO `lr_china_city` VALUES ('890', '0', '江苏省', '320000', null, '0');
INSERT INTO `lr_china_city` VALUES ('891', '890', '南京市', '320100', null, '0');
INSERT INTO `lr_china_city` VALUES ('893', '891', '玄武区', '320102', null, '0');
INSERT INTO `lr_china_city` VALUES ('894', '891', '白下区', '320103', null, '0');
INSERT INTO `lr_china_city` VALUES ('895', '891', '秦淮区', '320104', null, '0');
INSERT INTO `lr_china_city` VALUES ('896', '891', '建邺区', '320105', null, '0');
INSERT INTO `lr_china_city` VALUES ('897', '891', '鼓楼区', '320106', null, '0');
INSERT INTO `lr_china_city` VALUES ('898', '891', '下关区', '320107', null, '0');
INSERT INTO `lr_china_city` VALUES ('899', '891', '浦口区', '320111', null, '0');
INSERT INTO `lr_china_city` VALUES ('900', '891', '栖霞区', '320113', null, '0');
INSERT INTO `lr_china_city` VALUES ('901', '891', '雨花台区', '320114', null, '0');
INSERT INTO `lr_china_city` VALUES ('902', '891', '江宁区', '320115', null, '0');
INSERT INTO `lr_china_city` VALUES ('903', '891', '六合区', '320116', null, '0');
INSERT INTO `lr_china_city` VALUES ('904', '891', '溧水县', '320124', null, '0');
INSERT INTO `lr_china_city` VALUES ('905', '891', '高淳县', '320125', null, '0');
INSERT INTO `lr_china_city` VALUES ('906', '890', '无锡市', '320200', null, '0');
INSERT INTO `lr_china_city` VALUES ('908', '906', '崇安区', '320202', null, '0');
INSERT INTO `lr_china_city` VALUES ('909', '906', '南长区', '320203', null, '0');
INSERT INTO `lr_china_city` VALUES ('910', '906', '北塘区', '320204', null, '0');
INSERT INTO `lr_china_city` VALUES ('911', '906', '锡山区', '320205', null, '0');
INSERT INTO `lr_china_city` VALUES ('912', '906', '惠山区', '320206', null, '0');
INSERT INTO `lr_china_city` VALUES ('913', '906', '滨湖区', '320211', null, '0');
INSERT INTO `lr_china_city` VALUES ('914', '906', '江阴市', '320281', null, '0');
INSERT INTO `lr_china_city` VALUES ('915', '906', '宜兴市', '320282', null, '0');
INSERT INTO `lr_china_city` VALUES ('916', '890', '徐州市', '320300', null, '0');
INSERT INTO `lr_china_city` VALUES ('918', '916', '鼓楼区', '320302', null, '0');
INSERT INTO `lr_china_city` VALUES ('919', '916', '云龙区', '320303', null, '0');
INSERT INTO `lr_china_city` VALUES ('920', '916', '九里区', '320304', null, '0');
INSERT INTO `lr_china_city` VALUES ('921', '916', '贾汪区', '320305', null, '0');
INSERT INTO `lr_china_city` VALUES ('922', '916', '泉山区', '320311', null, '0');
INSERT INTO `lr_china_city` VALUES ('923', '916', '丰县', '320321', null, '0');
INSERT INTO `lr_china_city` VALUES ('924', '916', '沛县', '320322', null, '0');
INSERT INTO `lr_china_city` VALUES ('925', '916', '铜山县', '320323', null, '0');
INSERT INTO `lr_china_city` VALUES ('926', '916', '睢宁县', '320324', null, '0');
INSERT INTO `lr_china_city` VALUES ('927', '916', '新沂市', '320381', null, '0');
INSERT INTO `lr_china_city` VALUES ('928', '916', '邳州市', '320382', null, '0');
INSERT INTO `lr_china_city` VALUES ('929', '890', '常州市', '320400', null, '0');
INSERT INTO `lr_china_city` VALUES ('931', '929', '天宁区', '320402', null, '0');
INSERT INTO `lr_china_city` VALUES ('932', '929', '钟楼区', '320404', null, '0');
INSERT INTO `lr_china_city` VALUES ('933', '929', '戚墅堰区', '320405', null, '0');
INSERT INTO `lr_china_city` VALUES ('934', '929', '新北区', '320411', null, '0');
INSERT INTO `lr_china_city` VALUES ('935', '929', '武进区', '320412', null, '0');
INSERT INTO `lr_china_city` VALUES ('936', '929', '溧阳市', '320481', null, '0');
INSERT INTO `lr_china_city` VALUES ('937', '929', '金坛市', '320482', null, '0');
INSERT INTO `lr_china_city` VALUES ('938', '890', '苏州市', '320500', null, '0');
INSERT INTO `lr_china_city` VALUES ('940', '938', '沧浪区', '320502', null, '0');
INSERT INTO `lr_china_city` VALUES ('941', '938', '平江区', '320503', null, '0');
INSERT INTO `lr_china_city` VALUES ('942', '938', '金阊区', '320504', null, '0');
INSERT INTO `lr_china_city` VALUES ('943', '938', '虎丘区', '320505', null, '0');
INSERT INTO `lr_china_city` VALUES ('944', '938', '吴中区', '320506', null, '0');
INSERT INTO `lr_china_city` VALUES ('945', '938', '相城区', '320507', null, '0');
INSERT INTO `lr_china_city` VALUES ('946', '938', '常熟市', '320581', null, '0');
INSERT INTO `lr_china_city` VALUES ('947', '938', '张家港市', '320582', null, '0');
INSERT INTO `lr_china_city` VALUES ('948', '938', '昆山市', '320583', null, '0');
INSERT INTO `lr_china_city` VALUES ('949', '938', '吴江市', '320584', null, '0');
INSERT INTO `lr_china_city` VALUES ('950', '938', '太仓市', '320585', null, '0');
INSERT INTO `lr_china_city` VALUES ('951', '890', '南通市', '320600', null, '0');
INSERT INTO `lr_china_city` VALUES ('953', '951', '崇川区', '320602', null, '0');
INSERT INTO `lr_china_city` VALUES ('954', '951', '港闸区', '320611', null, '0');
INSERT INTO `lr_china_city` VALUES ('955', '951', '海安县', '320621', null, '0');
INSERT INTO `lr_china_city` VALUES ('956', '951', '如东县', '320623', null, '0');
INSERT INTO `lr_china_city` VALUES ('957', '951', '启东市', '320681', null, '0');
INSERT INTO `lr_china_city` VALUES ('958', '951', '如皋市', '320682', null, '0');
INSERT INTO `lr_china_city` VALUES ('959', '951', '通州市', '320683', null, '0');
INSERT INTO `lr_china_city` VALUES ('960', '951', '海门市', '320684', null, '0');
INSERT INTO `lr_china_city` VALUES ('961', '890', '连云港市', '320700', null, '0');
INSERT INTO `lr_china_city` VALUES ('963', '961', '连云区', '320703', null, '0');
INSERT INTO `lr_china_city` VALUES ('964', '961', '新浦区', '320705', null, '0');
INSERT INTO `lr_china_city` VALUES ('965', '961', '海州区', '320706', null, '0');
INSERT INTO `lr_china_city` VALUES ('966', '961', '赣榆县', '320721', null, '0');
INSERT INTO `lr_china_city` VALUES ('967', '961', '东海县', '320722', null, '0');
INSERT INTO `lr_china_city` VALUES ('968', '961', '灌云县', '320723', null, '0');
INSERT INTO `lr_china_city` VALUES ('969', '961', '灌南县', '320724', null, '0');
INSERT INTO `lr_china_city` VALUES ('970', '890', '淮安市', '320800', null, '0');
INSERT INTO `lr_china_city` VALUES ('972', '970', '清河区', '320802', null, '0');
INSERT INTO `lr_china_city` VALUES ('973', '970', '楚州区', '320803', null, '0');
INSERT INTO `lr_china_city` VALUES ('974', '970', '淮阴区', '320804', null, '0');
INSERT INTO `lr_china_city` VALUES ('975', '970', '清浦区', '320811', null, '0');
INSERT INTO `lr_china_city` VALUES ('976', '970', '涟水县', '320826', null, '0');
INSERT INTO `lr_china_city` VALUES ('977', '970', '洪泽县', '320829', null, '0');
INSERT INTO `lr_china_city` VALUES ('978', '970', '盱眙县', '320830', null, '0');
INSERT INTO `lr_china_city` VALUES ('979', '970', '金湖县', '320831', null, '0');
INSERT INTO `lr_china_city` VALUES ('980', '890', '盐城市', '320900', null, '0');
INSERT INTO `lr_china_city` VALUES ('982', '980', '亭湖区', '320902', null, '0');
INSERT INTO `lr_china_city` VALUES ('983', '980', '盐都区', '320903', null, '0');
INSERT INTO `lr_china_city` VALUES ('984', '980', '响水县', '320921', null, '0');
INSERT INTO `lr_china_city` VALUES ('985', '980', '滨海县', '320922', null, '0');
INSERT INTO `lr_china_city` VALUES ('986', '980', '阜宁县', '320923', null, '0');
INSERT INTO `lr_china_city` VALUES ('987', '980', '射阳县', '320924', null, '0');
INSERT INTO `lr_china_city` VALUES ('988', '980', '建湖县', '320925', null, '0');
INSERT INTO `lr_china_city` VALUES ('989', '980', '东台市', '320981', null, '0');
INSERT INTO `lr_china_city` VALUES ('990', '980', '大丰市', '320982', null, '0');
INSERT INTO `lr_china_city` VALUES ('991', '890', '扬州市', '321000', null, '0');
INSERT INTO `lr_china_city` VALUES ('993', '991', '广陵区', '321002', null, '0');
INSERT INTO `lr_china_city` VALUES ('994', '991', '邗江区', '321003', null, '0');
INSERT INTO `lr_china_city` VALUES ('995', '991', '维扬区', '321011', null, '0');
INSERT INTO `lr_china_city` VALUES ('996', '991', '宝应县', '321023', null, '0');
INSERT INTO `lr_china_city` VALUES ('997', '991', '仪征市', '321081', null, '0');
INSERT INTO `lr_china_city` VALUES ('998', '991', '高邮市', '321084', null, '0');
INSERT INTO `lr_china_city` VALUES ('999', '991', '江都市', '321088', null, '0');
INSERT INTO `lr_china_city` VALUES ('1000', '890', '镇江市', '321100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1002', '1000', '京口区', '321102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1003', '1000', '润州区', '321111', null, '0');
INSERT INTO `lr_china_city` VALUES ('1004', '1000', '丹徒区', '321112', null, '0');
INSERT INTO `lr_china_city` VALUES ('1005', '1000', '丹阳市', '321181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1006', '1000', '扬中市', '321182', null, '0');
INSERT INTO `lr_china_city` VALUES ('1007', '1000', '句容市', '321183', null, '0');
INSERT INTO `lr_china_city` VALUES ('1008', '890', '泰州市', '321200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1010', '1008', '海陵区', '321202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1011', '1008', '高港区', '321203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1012', '1008', '兴化市', '321281', null, '0');
INSERT INTO `lr_china_city` VALUES ('1013', '1008', '靖江市', '321282', null, '0');
INSERT INTO `lr_china_city` VALUES ('1014', '1008', '泰兴市', '321283', null, '0');
INSERT INTO `lr_china_city` VALUES ('1015', '1008', '姜堰市', '321284', null, '0');
INSERT INTO `lr_china_city` VALUES ('1016', '890', '宿迁市', '321300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1018', '1016', '宿城区', '321302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1019', '1016', '宿豫区', '321311', null, '0');
INSERT INTO `lr_china_city` VALUES ('1020', '1016', '沭阳县', '321322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1021', '1016', '泗阳县', '321323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1022', '1016', '泗洪县', '321324', null, '0');
INSERT INTO `lr_china_city` VALUES ('1023', '0', '浙江省', '330000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1024', '1023', '杭州市', '330100', 'H', '1');
INSERT INTO `lr_china_city` VALUES ('1026', '1024', '上城区', '330102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1027', '1024', '下城区', '330103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1028', '1024', '江干区', '330104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1029', '1024', '拱墅区', '330105', null, '0');
INSERT INTO `lr_china_city` VALUES ('1030', '1024', '西湖区', '330106', null, '0');
INSERT INTO `lr_china_city` VALUES ('1031', '1024', '滨江区', '330108', null, '0');
INSERT INTO `lr_china_city` VALUES ('1032', '1024', '萧山区', '330109', null, '0');
INSERT INTO `lr_china_city` VALUES ('1033', '1024', '余杭区', '330110', null, '0');
INSERT INTO `lr_china_city` VALUES ('1034', '1024', '桐庐县', '330122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1035', '1024', '淳安县', '330127', null, '0');
INSERT INTO `lr_china_city` VALUES ('1036', '1024', '建德市', '330182', null, '0');
INSERT INTO `lr_china_city` VALUES ('1037', '1024', '富阳市', '330183', null, '0');
INSERT INTO `lr_china_city` VALUES ('1038', '1024', '临安市', '330185', null, '0');
INSERT INTO `lr_china_city` VALUES ('1039', '1023', '宁波市', '330200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1041', '1039', '海曙区', '330203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1042', '1039', '江东区', '330204', null, '0');
INSERT INTO `lr_china_city` VALUES ('1043', '1039', '江北区', '330205', null, '0');
INSERT INTO `lr_china_city` VALUES ('1044', '1039', '北仑区', '330206', null, '0');
INSERT INTO `lr_china_city` VALUES ('1045', '1039', '镇海区', '330211', null, '0');
INSERT INTO `lr_china_city` VALUES ('1046', '1039', '鄞州区', '330212', null, '0');
INSERT INTO `lr_china_city` VALUES ('1047', '1039', '象山县', '330225', null, '0');
INSERT INTO `lr_china_city` VALUES ('1048', '1039', '宁海县', '330226', null, '0');
INSERT INTO `lr_china_city` VALUES ('1049', '1039', '余姚市', '330281', null, '0');
INSERT INTO `lr_china_city` VALUES ('1050', '1039', '慈溪市', '330282', null, '0');
INSERT INTO `lr_china_city` VALUES ('1051', '1039', '奉化市', '330283', null, '0');
INSERT INTO `lr_china_city` VALUES ('1052', '1023', '温州市', '330300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1054', '1052', '鹿城区', '330302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1055', '1052', '龙湾区', '330303', null, '0');
INSERT INTO `lr_china_city` VALUES ('1056', '1052', '瓯海区', '330304', null, '0');
INSERT INTO `lr_china_city` VALUES ('1057', '1052', '洞头县', '330322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1058', '1052', '永嘉县', '330324', null, '0');
INSERT INTO `lr_china_city` VALUES ('1059', '1052', '平阳县', '330326', null, '0');
INSERT INTO `lr_china_city` VALUES ('1060', '1052', '苍南县', '330327', null, '0');
INSERT INTO `lr_china_city` VALUES ('1061', '1052', '文成县', '330328', null, '0');
INSERT INTO `lr_china_city` VALUES ('1062', '1052', '泰顺县', '330329', null, '0');
INSERT INTO `lr_china_city` VALUES ('1063', '1052', '瑞安市', '330381', null, '0');
INSERT INTO `lr_china_city` VALUES ('1064', '1052', '乐清市', '330382', null, '0');
INSERT INTO `lr_china_city` VALUES ('1065', '1023', '嘉兴市', '330400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1067', '1065', '南湖区', '330402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1068', '1065', '秀洲区', '330411', null, '0');
INSERT INTO `lr_china_city` VALUES ('1069', '1065', '嘉善县', '330421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1070', '1065', '海盐县', '330424', null, '0');
INSERT INTO `lr_china_city` VALUES ('1071', '1065', '海宁市', '330481', null, '0');
INSERT INTO `lr_china_city` VALUES ('1072', '1065', '平湖市', '330482', null, '0');
INSERT INTO `lr_china_city` VALUES ('1073', '1065', '桐乡市', '330483', null, '0');
INSERT INTO `lr_china_city` VALUES ('1074', '1023', '湖州市', '330500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1076', '1074', '吴兴区', '330502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1077', '1074', '南浔区', '330503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1078', '1074', '德清县', '330521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1079', '1074', '长兴县', '330522', null, '0');
INSERT INTO `lr_china_city` VALUES ('1080', '1074', '安吉县', '330523', null, '0');
INSERT INTO `lr_china_city` VALUES ('1081', '1023', '绍兴市', '330600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1083', '1081', '越城区', '330602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1084', '1081', '绍兴县', '330621', null, '0');
INSERT INTO `lr_china_city` VALUES ('1085', '1081', '新昌县', '330624', null, '0');
INSERT INTO `lr_china_city` VALUES ('1086', '1081', '诸暨市', '330681', null, '0');
INSERT INTO `lr_china_city` VALUES ('1087', '1081', '上虞市', '330682', null, '0');
INSERT INTO `lr_china_city` VALUES ('1088', '1081', '嵊州市', '330683', null, '0');
INSERT INTO `lr_china_city` VALUES ('1089', '1023', '金华市', '330700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1091', '1089', '婺城区', '330702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1092', '1089', '金东区', '330703', null, '0');
INSERT INTO `lr_china_city` VALUES ('1093', '1089', '武义县', '330723', null, '0');
INSERT INTO `lr_china_city` VALUES ('1094', '1089', '浦江县', '330726', null, '0');
INSERT INTO `lr_china_city` VALUES ('1095', '1089', '磐安县', '330727', null, '0');
INSERT INTO `lr_china_city` VALUES ('1096', '1089', '兰溪市', '330781', null, '0');
INSERT INTO `lr_china_city` VALUES ('1097', '1089', '义乌市', '330782', null, '0');
INSERT INTO `lr_china_city` VALUES ('1098', '1089', '东阳市', '330783', null, '0');
INSERT INTO `lr_china_city` VALUES ('1099', '1089', '永康市', '330784', null, '0');
INSERT INTO `lr_china_city` VALUES ('1100', '1023', '衢州市', '330800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1102', '1100', '柯城区', '330802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1103', '1100', '衢江区', '330803', null, '0');
INSERT INTO `lr_china_city` VALUES ('1104', '1100', '常山县', '330822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1105', '1100', '开化县', '330824', null, '0');
INSERT INTO `lr_china_city` VALUES ('1106', '1100', '龙游县', '330825', null, '0');
INSERT INTO `lr_china_city` VALUES ('1107', '1100', '江山市', '330881', null, '0');
INSERT INTO `lr_china_city` VALUES ('1108', '1023', '舟山市', '330900', null, '0');
INSERT INTO `lr_china_city` VALUES ('1110', '1108', '定海区', '330902', null, '0');
INSERT INTO `lr_china_city` VALUES ('1111', '1108', '普陀区', '330903', null, '0');
INSERT INTO `lr_china_city` VALUES ('1112', '1108', '岱山县', '330921', null, '0');
INSERT INTO `lr_china_city` VALUES ('1113', '1108', '嵊泗县', '330922', null, '0');
INSERT INTO `lr_china_city` VALUES ('1114', '1023', '台州市', '331000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1116', '1114', '椒江区', '331002', null, '0');
INSERT INTO `lr_china_city` VALUES ('1117', '1114', '黄岩区', '331003', null, '0');
INSERT INTO `lr_china_city` VALUES ('1118', '1114', '路桥区', '331004', null, '0');
INSERT INTO `lr_china_city` VALUES ('1119', '1114', '玉环县', '331021', null, '0');
INSERT INTO `lr_china_city` VALUES ('1120', '1114', '三门县', '331022', null, '0');
INSERT INTO `lr_china_city` VALUES ('1121', '1114', '天台县', '331023', null, '0');
INSERT INTO `lr_china_city` VALUES ('1122', '1114', '仙居县', '331024', null, '0');
INSERT INTO `lr_china_city` VALUES ('1123', '1114', '温岭市', '331081', null, '0');
INSERT INTO `lr_china_city` VALUES ('1124', '1114', '临海市', '331082', null, '0');
INSERT INTO `lr_china_city` VALUES ('1125', '1023', '丽水市', '331100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1127', '1125', '莲都区', '331102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1128', '1125', '青田县', '331121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1129', '1125', '缙云县', '331122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1130', '1125', '遂昌县', '331123', null, '0');
INSERT INTO `lr_china_city` VALUES ('1131', '1125', '松阳县', '331124', null, '0');
INSERT INTO `lr_china_city` VALUES ('1132', '1125', '云和县', '331125', null, '0');
INSERT INTO `lr_china_city` VALUES ('1133', '1125', '庆元县', '331126', null, '0');
INSERT INTO `lr_china_city` VALUES ('1134', '1125', '景宁畲族自治县', '331127', null, '0');
INSERT INTO `lr_china_city` VALUES ('1135', '1125', '龙泉市', '331181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1136', '0', '安徽省', '340000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1137', '1136', '合肥市', '340100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1139', '1137', '瑶海区', '340102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1140', '1137', '庐阳区', '340103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1141', '1137', '蜀山区', '340104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1142', '1137', '包河区', '340111', null, '0');
INSERT INTO `lr_china_city` VALUES ('1143', '1137', '长丰县', '340121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1144', '1137', '肥东县', '340122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1145', '1137', '肥西县', '340123', null, '0');
INSERT INTO `lr_china_city` VALUES ('1146', '1136', '芜湖市', '340200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1148', '1146', '镜湖区', '340202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1149', '1146', '弋江区', '340203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1150', '1146', '鸠江区', '340207', null, '0');
INSERT INTO `lr_china_city` VALUES ('1151', '1146', '三山区', '340208', null, '0');
INSERT INTO `lr_china_city` VALUES ('1152', '1146', '芜湖县', '340221', null, '0');
INSERT INTO `lr_china_city` VALUES ('1153', '1146', '繁昌县', '340222', null, '0');
INSERT INTO `lr_china_city` VALUES ('1154', '1146', '南陵县', '340223', null, '0');
INSERT INTO `lr_china_city` VALUES ('1155', '1136', '蚌埠市', '340300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1157', '1155', '龙子湖区', '340302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1158', '1155', '蚌山区', '340303', null, '0');
INSERT INTO `lr_china_city` VALUES ('1159', '1155', '禹会区', '340304', null, '0');
INSERT INTO `lr_china_city` VALUES ('1160', '1155', '淮上区', '340311', null, '0');
INSERT INTO `lr_china_city` VALUES ('1161', '1155', '怀远县', '340321', null, '0');
INSERT INTO `lr_china_city` VALUES ('1162', '1155', '五河县', '340322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1163', '1155', '固镇县', '340323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1164', '1136', '淮南市', '340400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1166', '1164', '大通区', '340402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1167', '1164', '田家庵区', '340403', null, '0');
INSERT INTO `lr_china_city` VALUES ('1168', '1164', '谢家集区', '340404', null, '0');
INSERT INTO `lr_china_city` VALUES ('1169', '1164', '八公山区', '340405', null, '0');
INSERT INTO `lr_china_city` VALUES ('1170', '1164', '潘集区', '340406', null, '0');
INSERT INTO `lr_china_city` VALUES ('1171', '1164', '凤台县', '340421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1172', '1136', '马鞍山市', '340500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1174', '1172', '金家庄区', '340502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1175', '1172', '花山区', '340503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1176', '1172', '雨山区', '340504', null, '0');
INSERT INTO `lr_china_city` VALUES ('1177', '1172', '当涂县', '340521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1178', '1136', '淮北市', '340600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1180', '1178', '杜集区', '340602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1181', '1178', '相山区', '340603', null, '0');
INSERT INTO `lr_china_city` VALUES ('1182', '1178', '烈山区', '340604', null, '0');
INSERT INTO `lr_china_city` VALUES ('1183', '1178', '濉溪县', '340621', null, '0');
INSERT INTO `lr_china_city` VALUES ('1184', '1136', '铜陵市', '340700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1186', '1184', '铜官山区', '340702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1187', '1184', '狮子山区', '340703', null, '0');
INSERT INTO `lr_china_city` VALUES ('1188', '1184', '郊区', '340711', null, '0');
INSERT INTO `lr_china_city` VALUES ('1189', '1184', '铜陵县', '340721', null, '0');
INSERT INTO `lr_china_city` VALUES ('1190', '1136', '安庆市', '340800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1192', '1190', '迎江区', '340802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1193', '1190', '大观区', '340803', null, '0');
INSERT INTO `lr_china_city` VALUES ('1194', '1190', '宜秀区', '340811', null, '0');
INSERT INTO `lr_china_city` VALUES ('1195', '1190', '怀宁县', '340822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1196', '1190', '枞阳县', '340823', null, '0');
INSERT INTO `lr_china_city` VALUES ('1197', '1190', '潜山县', '340824', null, '0');
INSERT INTO `lr_china_city` VALUES ('1198', '1190', '太湖县', '340825', null, '0');
INSERT INTO `lr_china_city` VALUES ('1199', '1190', '宿松县', '340826', null, '0');
INSERT INTO `lr_china_city` VALUES ('1200', '1190', '望江县', '340827', null, '0');
INSERT INTO `lr_china_city` VALUES ('1201', '1190', '岳西县', '340828', null, '0');
INSERT INTO `lr_china_city` VALUES ('1202', '1190', '桐城市', '340881', null, '0');
INSERT INTO `lr_china_city` VALUES ('1203', '1136', '黄山市', '341000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1205', '1203', '屯溪区', '341002', null, '0');
INSERT INTO `lr_china_city` VALUES ('1206', '1203', '黄山区', '341003', null, '0');
INSERT INTO `lr_china_city` VALUES ('1207', '1203', '徽州区', '341004', null, '0');
INSERT INTO `lr_china_city` VALUES ('1208', '1203', '歙县', '341021', null, '0');
INSERT INTO `lr_china_city` VALUES ('1209', '1203', '休宁县', '341022', null, '0');
INSERT INTO `lr_china_city` VALUES ('1210', '1203', '黟县', '341023', null, '0');
INSERT INTO `lr_china_city` VALUES ('1211', '1203', '祁门县', '341024', null, '0');
INSERT INTO `lr_china_city` VALUES ('1212', '1136', '滁州市', '341100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1214', '1212', '琅琊区', '341102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1215', '1212', '南谯区', '341103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1216', '1212', '来安县', '341122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1217', '1212', '全椒县', '341124', null, '0');
INSERT INTO `lr_china_city` VALUES ('1218', '1212', '定远县', '341125', null, '0');
INSERT INTO `lr_china_city` VALUES ('1219', '1212', '凤阳县', '341126', null, '0');
INSERT INTO `lr_china_city` VALUES ('1220', '1212', '天长市', '341181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1221', '1212', '明光市', '341182', null, '0');
INSERT INTO `lr_china_city` VALUES ('1222', '1136', '阜阳市', '341200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1224', '1222', '颍州区', '341202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1225', '1222', '颍东区', '341203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1226', '1222', '颍泉区', '341204', null, '0');
INSERT INTO `lr_china_city` VALUES ('1227', '1222', '临泉县', '341221', null, '0');
INSERT INTO `lr_china_city` VALUES ('1228', '1222', '太和县', '341222', null, '0');
INSERT INTO `lr_china_city` VALUES ('1229', '1222', '阜南县', '341225', null, '0');
INSERT INTO `lr_china_city` VALUES ('1230', '1222', '颍上县', '341226', null, '0');
INSERT INTO `lr_china_city` VALUES ('1231', '1222', '界首市', '341282', null, '0');
INSERT INTO `lr_china_city` VALUES ('1232', '1136', '宿州市', '341300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1234', '1232', '埇桥区', '341302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1235', '1232', '砀山县', '341321', null, '0');
INSERT INTO `lr_china_city` VALUES ('1236', '1232', '萧县', '341322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1237', '1232', '灵璧县', '341323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1238', '1232', '泗县', '341324', null, '0');
INSERT INTO `lr_china_city` VALUES ('1239', '1136', '巢湖市', '341400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1241', '1239', '居巢区', '341402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1242', '1239', '庐江县', '341421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1243', '1239', '无为县', '341422', null, '0');
INSERT INTO `lr_china_city` VALUES ('1244', '1239', '含山县', '341423', null, '0');
INSERT INTO `lr_china_city` VALUES ('1245', '1239', '和县', '341424', null, '0');
INSERT INTO `lr_china_city` VALUES ('1246', '1136', '六安市', '341500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1248', '1246', '金安区', '341502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1249', '1246', '裕安区', '341503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1250', '1246', '寿县', '341521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1251', '1246', '霍邱县', '341522', null, '0');
INSERT INTO `lr_china_city` VALUES ('1252', '1246', '舒城县', '341523', null, '0');
INSERT INTO `lr_china_city` VALUES ('1253', '1246', '金寨县', '341524', null, '0');
INSERT INTO `lr_china_city` VALUES ('1254', '1246', '霍山县', '341525', null, '0');
INSERT INTO `lr_china_city` VALUES ('1255', '1136', '亳州市', '341600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1257', '1255', '谯城区', '341602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1258', '1255', '涡阳县', '341621', null, '0');
INSERT INTO `lr_china_city` VALUES ('1259', '1255', '蒙城县', '341622', null, '0');
INSERT INTO `lr_china_city` VALUES ('1260', '1255', '利辛县', '341623', null, '0');
INSERT INTO `lr_china_city` VALUES ('1261', '1136', '池州市', '341700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1263', '1261', '贵池区', '341702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1264', '1261', '东至县', '341721', null, '0');
INSERT INTO `lr_china_city` VALUES ('1265', '1261', '石台县', '341722', null, '0');
INSERT INTO `lr_china_city` VALUES ('1266', '1261', '青阳县', '341723', null, '0');
INSERT INTO `lr_china_city` VALUES ('1267', '1136', '宣城市', '341800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1269', '1267', '宣州区', '341802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1270', '1267', '郎溪县', '341821', null, '0');
INSERT INTO `lr_china_city` VALUES ('1271', '1267', '广德县', '341822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1272', '1267', '泾县', '341823', null, '0');
INSERT INTO `lr_china_city` VALUES ('1273', '1267', '绩溪县', '341824', null, '0');
INSERT INTO `lr_china_city` VALUES ('1274', '1267', '旌德县', '341825', null, '0');
INSERT INTO `lr_china_city` VALUES ('1275', '1267', '宁国市', '341881', null, '0');
INSERT INTO `lr_china_city` VALUES ('1276', '0', '福建省', '350000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1277', '1276', '福州市', '350100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1279', '1277', '鼓楼区', '350102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1280', '1277', '台江区', '350103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1281', '1277', '仓山区', '350104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1282', '1277', '马尾区', '350105', null, '0');
INSERT INTO `lr_china_city` VALUES ('1283', '1277', '晋安区', '350111', null, '0');
INSERT INTO `lr_china_city` VALUES ('1284', '1277', '闽侯县', '350121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1285', '1277', '连江县', '350122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1286', '1277', '罗源县', '350123', null, '0');
INSERT INTO `lr_china_city` VALUES ('1287', '1277', '闽清县', '350124', null, '0');
INSERT INTO `lr_china_city` VALUES ('1288', '1277', '永泰县', '350125', null, '0');
INSERT INTO `lr_china_city` VALUES ('1289', '1277', '平潭县', '350128', null, '0');
INSERT INTO `lr_china_city` VALUES ('1290', '1277', '福清市', '350181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1291', '1277', '长乐市', '350182', null, '0');
INSERT INTO `lr_china_city` VALUES ('1292', '1276', '厦门市', '350200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1294', '1292', '思明区', '350203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1295', '1292', '海沧区', '350205', null, '0');
INSERT INTO `lr_china_city` VALUES ('1296', '1292', '湖里区', '350206', null, '0');
INSERT INTO `lr_china_city` VALUES ('1297', '1292', '集美区', '350211', null, '0');
INSERT INTO `lr_china_city` VALUES ('1298', '1292', '同安区', '350212', null, '0');
INSERT INTO `lr_china_city` VALUES ('1299', '1292', '翔安区', '350213', null, '0');
INSERT INTO `lr_china_city` VALUES ('1300', '1276', '莆田市', '350300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1302', '1300', '城厢区', '350302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1303', '1300', '涵江区', '350303', null, '0');
INSERT INTO `lr_china_city` VALUES ('1304', '1300', '荔城区', '350304', null, '0');
INSERT INTO `lr_china_city` VALUES ('1305', '1300', '秀屿区', '350305', null, '0');
INSERT INTO `lr_china_city` VALUES ('1306', '1300', '仙游县', '350322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1307', '1276', '三明市', '350400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1309', '1307', '梅列区', '350402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1310', '1307', '三元区', '350403', null, '0');
INSERT INTO `lr_china_city` VALUES ('1311', '1307', '明溪县', '350421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1312', '1307', '清流县', '350423', null, '0');
INSERT INTO `lr_china_city` VALUES ('1313', '1307', '宁化县', '350424', null, '0');
INSERT INTO `lr_china_city` VALUES ('1314', '1307', '大田县', '350425', null, '0');
INSERT INTO `lr_china_city` VALUES ('1315', '1307', '尤溪县', '350426', null, '0');
INSERT INTO `lr_china_city` VALUES ('1316', '1307', '沙县', '350427', null, '0');
INSERT INTO `lr_china_city` VALUES ('1317', '1307', '将乐县', '350428', null, '0');
INSERT INTO `lr_china_city` VALUES ('1318', '1307', '泰宁县', '350429', null, '0');
INSERT INTO `lr_china_city` VALUES ('1319', '1307', '建宁县', '350430', null, '0');
INSERT INTO `lr_china_city` VALUES ('1320', '1307', '永安市', '350481', null, '0');
INSERT INTO `lr_china_city` VALUES ('1321', '1276', '泉州市', '350500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1323', '1321', '鲤城区', '350502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1324', '1321', '丰泽区', '350503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1325', '1321', '洛江区', '350504', null, '0');
INSERT INTO `lr_china_city` VALUES ('1326', '1321', '泉港区', '350505', null, '0');
INSERT INTO `lr_china_city` VALUES ('1327', '1321', '惠安县', '350521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1328', '1321', '安溪县', '350524', null, '0');
INSERT INTO `lr_china_city` VALUES ('1329', '1321', '永春县', '350525', null, '0');
INSERT INTO `lr_china_city` VALUES ('1330', '1321', '德化县', '350526', null, '0');
INSERT INTO `lr_china_city` VALUES ('1331', '1321', '金门县', '350527', null, '0');
INSERT INTO `lr_china_city` VALUES ('1332', '1321', '石狮市', '350581', null, '0');
INSERT INTO `lr_china_city` VALUES ('1333', '1321', '晋江市', '350582', null, '0');
INSERT INTO `lr_china_city` VALUES ('1334', '1321', '南安市', '350583', null, '0');
INSERT INTO `lr_china_city` VALUES ('1335', '1276', '漳州市', '350600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1337', '1335', '芗城区', '350602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1338', '1335', '龙文区', '350603', null, '0');
INSERT INTO `lr_china_city` VALUES ('1339', '1335', '云霄县', '350622', null, '0');
INSERT INTO `lr_china_city` VALUES ('1340', '1335', '漳浦县', '350623', null, '0');
INSERT INTO `lr_china_city` VALUES ('1341', '1335', '诏安县', '350624', null, '0');
INSERT INTO `lr_china_city` VALUES ('1342', '1335', '长泰县', '350625', null, '0');
INSERT INTO `lr_china_city` VALUES ('1343', '1335', '东山县', '350626', null, '0');
INSERT INTO `lr_china_city` VALUES ('1344', '1335', '南靖县', '350627', null, '0');
INSERT INTO `lr_china_city` VALUES ('1345', '1335', '平和县', '350628', null, '0');
INSERT INTO `lr_china_city` VALUES ('1346', '1335', '华安县', '350629', null, '0');
INSERT INTO `lr_china_city` VALUES ('1347', '1335', '龙海市', '350681', null, '0');
INSERT INTO `lr_china_city` VALUES ('1348', '1276', '南平市', '350700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1350', '1348', '延平区', '350702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1351', '1348', '顺昌县', '350721', null, '0');
INSERT INTO `lr_china_city` VALUES ('1352', '1348', '浦城县', '350722', null, '0');
INSERT INTO `lr_china_city` VALUES ('1353', '1348', '光泽县', '350723', null, '0');
INSERT INTO `lr_china_city` VALUES ('1354', '1348', '松溪县', '350724', null, '0');
INSERT INTO `lr_china_city` VALUES ('1355', '1348', '政和县', '350725', null, '0');
INSERT INTO `lr_china_city` VALUES ('1356', '1348', '邵武市', '350781', null, '0');
INSERT INTO `lr_china_city` VALUES ('1357', '1348', '武夷山市', '350782', null, '0');
INSERT INTO `lr_china_city` VALUES ('1358', '1348', '建瓯市', '350783', null, '0');
INSERT INTO `lr_china_city` VALUES ('1359', '1348', '建阳市', '350784', null, '0');
INSERT INTO `lr_china_city` VALUES ('1360', '1276', '龙岩市', '350800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1362', '1360', '新罗区', '350802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1363', '1360', '长汀县', '350821', null, '0');
INSERT INTO `lr_china_city` VALUES ('1364', '1360', '永定县', '350822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1365', '1360', '上杭县', '350823', null, '0');
INSERT INTO `lr_china_city` VALUES ('1366', '1360', '武平县', '350824', null, '0');
INSERT INTO `lr_china_city` VALUES ('1367', '1360', '连城县', '350825', null, '0');
INSERT INTO `lr_china_city` VALUES ('1368', '1360', '漳平市', '350881', null, '0');
INSERT INTO `lr_china_city` VALUES ('1369', '1276', '宁德市', '350900', null, '0');
INSERT INTO `lr_china_city` VALUES ('1371', '1369', '蕉城区', '350902', null, '0');
INSERT INTO `lr_china_city` VALUES ('1372', '1369', '霞浦县', '350921', null, '0');
INSERT INTO `lr_china_city` VALUES ('1373', '1369', '古田县', '350922', null, '0');
INSERT INTO `lr_china_city` VALUES ('1374', '1369', '屏南县', '350923', null, '0');
INSERT INTO `lr_china_city` VALUES ('1375', '1369', '寿宁县', '350924', null, '0');
INSERT INTO `lr_china_city` VALUES ('1376', '1369', '周宁县', '350925', null, '0');
INSERT INTO `lr_china_city` VALUES ('1377', '1369', '柘荣县', '350926', null, '0');
INSERT INTO `lr_china_city` VALUES ('1378', '1369', '福安市', '350981', null, '0');
INSERT INTO `lr_china_city` VALUES ('1379', '1369', '福鼎市', '350982', null, '0');
INSERT INTO `lr_china_city` VALUES ('1380', '0', '江西省', '360000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1381', '1380', '南昌市', '360100', 'N', '1');
INSERT INTO `lr_china_city` VALUES ('1383', '1381', '东湖区', '360102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1384', '1381', '西湖区', '360103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1385', '1381', '青云谱区', '360104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1386', '1381', '湾里区', '360105', null, '0');
INSERT INTO `lr_china_city` VALUES ('1387', '1381', '青山湖区', '360111', null, '0');
INSERT INTO `lr_china_city` VALUES ('1388', '1381', '南昌县', '360121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1389', '1381', '新建县', '360122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1390', '1381', '安义县', '360123', null, '0');
INSERT INTO `lr_china_city` VALUES ('1391', '1381', '进贤县', '360124', null, '0');
INSERT INTO `lr_china_city` VALUES ('1392', '1380', '景德镇市', '360200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1394', '1392', '昌江区', '360202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1395', '1392', '珠山区', '360203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1396', '1392', '浮梁县', '360222', null, '0');
INSERT INTO `lr_china_city` VALUES ('1397', '1392', '乐平市', '360281', null, '0');
INSERT INTO `lr_china_city` VALUES ('1398', '1380', '萍乡市', '360300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1400', '1398', '安源区', '360302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1401', '1398', '湘东区', '360313', null, '0');
INSERT INTO `lr_china_city` VALUES ('1402', '1398', '莲花县', '360321', null, '0');
INSERT INTO `lr_china_city` VALUES ('1403', '1398', '上栗县', '360322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1404', '1398', '芦溪县', '360323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1405', '1380', '九江市', '360400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1407', '1405', '庐山区', '360402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1408', '1405', '浔阳区', '360403', null, '0');
INSERT INTO `lr_china_city` VALUES ('1409', '1405', '九江县', '360421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1410', '1405', '武宁县', '360423', null, '0');
INSERT INTO `lr_china_city` VALUES ('1411', '1405', '修水县', '360424', null, '0');
INSERT INTO `lr_china_city` VALUES ('1412', '1405', '永修县', '360425', null, '0');
INSERT INTO `lr_china_city` VALUES ('1413', '1405', '德安县', '360426', null, '0');
INSERT INTO `lr_china_city` VALUES ('1414', '1405', '星子县', '360427', null, '0');
INSERT INTO `lr_china_city` VALUES ('1415', '1405', '都昌县', '360428', null, '0');
INSERT INTO `lr_china_city` VALUES ('1416', '1405', '湖口县', '360429', null, '0');
INSERT INTO `lr_china_city` VALUES ('1417', '1405', '彭泽县', '360430', null, '0');
INSERT INTO `lr_china_city` VALUES ('1418', '1405', '瑞昌市', '360481', null, '0');
INSERT INTO `lr_china_city` VALUES ('1419', '1380', '新余市', '360500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1421', '1419', '渝水区', '360502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1422', '1419', '分宜县', '360521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1423', '1380', '鹰潭市', '360600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1425', '1423', '月湖区', '360602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1426', '1423', '余江县', '360622', null, '0');
INSERT INTO `lr_china_city` VALUES ('1427', '1423', '贵溪市', '360681', null, '0');
INSERT INTO `lr_china_city` VALUES ('1428', '1380', '赣州市', '360700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1430', '1428', '章贡区', '360702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1431', '1428', '赣县', '360721', null, '0');
INSERT INTO `lr_china_city` VALUES ('1432', '1428', '信丰县', '360722', null, '0');
INSERT INTO `lr_china_city` VALUES ('1433', '1428', '大余县', '360723', null, '0');
INSERT INTO `lr_china_city` VALUES ('1434', '1428', '上犹县', '360724', null, '0');
INSERT INTO `lr_china_city` VALUES ('1435', '1428', '崇义县', '360725', null, '0');
INSERT INTO `lr_china_city` VALUES ('1436', '1428', '安远县', '360726', null, '0');
INSERT INTO `lr_china_city` VALUES ('1437', '1428', '龙南县', '360727', null, '0');
INSERT INTO `lr_china_city` VALUES ('1438', '1428', '定南县', '360728', null, '0');
INSERT INTO `lr_china_city` VALUES ('1439', '1428', '全南县', '360729', null, '0');
INSERT INTO `lr_china_city` VALUES ('1440', '1428', '宁都县', '360730', null, '0');
INSERT INTO `lr_china_city` VALUES ('1441', '1428', '于都县', '360731', null, '0');
INSERT INTO `lr_china_city` VALUES ('1442', '1428', '兴国县', '360732', null, '0');
INSERT INTO `lr_china_city` VALUES ('1443', '1428', '会昌县', '360733', null, '0');
INSERT INTO `lr_china_city` VALUES ('1444', '1428', '寻乌县', '360734', null, '0');
INSERT INTO `lr_china_city` VALUES ('1445', '1428', '石城县', '360735', null, '0');
INSERT INTO `lr_china_city` VALUES ('1446', '1428', '瑞金市', '360781', null, '0');
INSERT INTO `lr_china_city` VALUES ('1447', '1428', '南康市', '360782', null, '0');
INSERT INTO `lr_china_city` VALUES ('1448', '1380', '吉安市', '360800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1450', '1448', '吉州区', '360802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1451', '1448', '青原区', '360803', null, '0');
INSERT INTO `lr_china_city` VALUES ('1452', '1448', '吉安县', '360821', null, '0');
INSERT INTO `lr_china_city` VALUES ('1453', '1448', '吉水县', '360822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1454', '1448', '峡江县', '360823', null, '0');
INSERT INTO `lr_china_city` VALUES ('1455', '1448', '新干县', '360824', null, '0');
INSERT INTO `lr_china_city` VALUES ('1456', '1448', '永丰县', '360825', null, '0');
INSERT INTO `lr_china_city` VALUES ('1457', '1448', '泰和县', '360826', null, '0');
INSERT INTO `lr_china_city` VALUES ('1458', '1448', '遂川县', '360827', null, '0');
INSERT INTO `lr_china_city` VALUES ('1459', '1448', '万安县', '360828', null, '0');
INSERT INTO `lr_china_city` VALUES ('1460', '1448', '安福县', '360829', null, '0');
INSERT INTO `lr_china_city` VALUES ('1461', '1448', '永新县', '360830', null, '0');
INSERT INTO `lr_china_city` VALUES ('1462', '1448', '井冈山市', '360881', null, '0');
INSERT INTO `lr_china_city` VALUES ('1463', '1380', '宜春市', '360900', null, '0');
INSERT INTO `lr_china_city` VALUES ('1465', '1463', '袁州区', '360902', null, '0');
INSERT INTO `lr_china_city` VALUES ('1466', '1463', '奉新县', '360921', null, '0');
INSERT INTO `lr_china_city` VALUES ('1467', '1463', '万载县', '360922', null, '0');
INSERT INTO `lr_china_city` VALUES ('1468', '1463', '上高县', '360923', null, '0');
INSERT INTO `lr_china_city` VALUES ('1469', '1463', '宜丰县', '360924', null, '0');
INSERT INTO `lr_china_city` VALUES ('1470', '1463', '靖安县', '360925', null, '0');
INSERT INTO `lr_china_city` VALUES ('1471', '1463', '铜鼓县', '360926', null, '0');
INSERT INTO `lr_china_city` VALUES ('1472', '1463', '丰城市', '360981', null, '0');
INSERT INTO `lr_china_city` VALUES ('1473', '1463', '樟树市', '360982', null, '0');
INSERT INTO `lr_china_city` VALUES ('1474', '1463', '高安市', '360983', null, '0');
INSERT INTO `lr_china_city` VALUES ('1475', '1380', '抚州市', '361000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1477', '1475', '临川区', '361002', null, '0');
INSERT INTO `lr_china_city` VALUES ('1478', '1475', '南城县', '361021', null, '0');
INSERT INTO `lr_china_city` VALUES ('1479', '1475', '黎川县', '361022', null, '0');
INSERT INTO `lr_china_city` VALUES ('1480', '1475', '南丰县', '361023', null, '0');
INSERT INTO `lr_china_city` VALUES ('1481', '1475', '崇仁县', '361024', null, '0');
INSERT INTO `lr_china_city` VALUES ('1482', '1475', '乐安县', '361025', null, '0');
INSERT INTO `lr_china_city` VALUES ('1483', '1475', '宜黄县', '361026', null, '0');
INSERT INTO `lr_china_city` VALUES ('1484', '1475', '金溪县', '361027', null, '0');
INSERT INTO `lr_china_city` VALUES ('1485', '1475', '资溪县', '361028', null, '0');
INSERT INTO `lr_china_city` VALUES ('1486', '1475', '东乡县', '361029', null, '0');
INSERT INTO `lr_china_city` VALUES ('1487', '1475', '广昌县', '361030', null, '0');
INSERT INTO `lr_china_city` VALUES ('1488', '1380', '上饶市', '361100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1490', '1488', '信州区', '361102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1491', '1488', '上饶县', '361121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1492', '1488', '广丰县', '361122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1493', '1488', '玉山县', '361123', null, '0');
INSERT INTO `lr_china_city` VALUES ('1494', '1488', '铅山县', '361124', null, '0');
INSERT INTO `lr_china_city` VALUES ('1495', '1488', '横峰县', '361125', null, '0');
INSERT INTO `lr_china_city` VALUES ('1496', '1488', '弋阳县', '361126', null, '0');
INSERT INTO `lr_china_city` VALUES ('1497', '1488', '余干县', '361127', null, '0');
INSERT INTO `lr_china_city` VALUES ('1498', '1488', '鄱阳县', '361128', null, '0');
INSERT INTO `lr_china_city` VALUES ('1499', '1488', '万年县', '361129', null, '0');
INSERT INTO `lr_china_city` VALUES ('1500', '1488', '婺源县', '361130', null, '0');
INSERT INTO `lr_china_city` VALUES ('1501', '1488', '德兴市', '361181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1502', '0', '山东省', '370000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1503', '1502', '济南市', '370100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1505', '1503', '历下区', '370102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1506', '1503', '市中区', '370103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1507', '1503', '槐荫区', '370104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1508', '1503', '天桥区', '370105', null, '0');
INSERT INTO `lr_china_city` VALUES ('1509', '1503', '历城区', '370112', null, '0');
INSERT INTO `lr_china_city` VALUES ('1510', '1503', '长清区', '370113', null, '0');
INSERT INTO `lr_china_city` VALUES ('1511', '1503', '平阴县', '370124', null, '0');
INSERT INTO `lr_china_city` VALUES ('1512', '1503', '济阳县', '370125', null, '0');
INSERT INTO `lr_china_city` VALUES ('1513', '1503', '商河县', '370126', null, '0');
INSERT INTO `lr_china_city` VALUES ('1514', '1503', '章丘市', '370181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1515', '1502', '青岛市', '370200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1517', '1515', '市南区', '370202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1518', '1515', '市北区', '370203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1519', '1515', '四方区', '370205', null, '0');
INSERT INTO `lr_china_city` VALUES ('1520', '1515', '黄岛区', '370211', null, '0');
INSERT INTO `lr_china_city` VALUES ('1521', '1515', '崂山区', '370212', null, '0');
INSERT INTO `lr_china_city` VALUES ('1522', '1515', '李沧区', '370213', null, '0');
INSERT INTO `lr_china_city` VALUES ('1523', '1515', '城阳区', '370214', null, '0');
INSERT INTO `lr_china_city` VALUES ('1524', '1515', '胶州市', '370281', null, '0');
INSERT INTO `lr_china_city` VALUES ('1525', '1515', '即墨市', '370282', null, '0');
INSERT INTO `lr_china_city` VALUES ('1526', '1515', '平度市', '370283', null, '0');
INSERT INTO `lr_china_city` VALUES ('1527', '1515', '胶南市', '370284', null, '0');
INSERT INTO `lr_china_city` VALUES ('1528', '1515', '莱西市', '370285', null, '0');
INSERT INTO `lr_china_city` VALUES ('1529', '1502', '淄博市', '370300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1531', '1529', '淄川区', '370302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1532', '1529', '张店区', '370303', null, '0');
INSERT INTO `lr_china_city` VALUES ('1533', '1529', '博山区', '370304', null, '0');
INSERT INTO `lr_china_city` VALUES ('1534', '1529', '临淄区', '370305', null, '0');
INSERT INTO `lr_china_city` VALUES ('1535', '1529', '周村区', '370306', null, '0');
INSERT INTO `lr_china_city` VALUES ('1536', '1529', '桓台县', '370321', null, '0');
INSERT INTO `lr_china_city` VALUES ('1537', '1529', '高青县', '370322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1538', '1529', '沂源县', '370323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1539', '1502', '枣庄市', '370400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1541', '1539', '市中区', '370402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1542', '1539', '薛城区', '370403', null, '0');
INSERT INTO `lr_china_city` VALUES ('1543', '1539', '峄城区', '370404', null, '0');
INSERT INTO `lr_china_city` VALUES ('1544', '1539', '台儿庄区', '370405', null, '0');
INSERT INTO `lr_china_city` VALUES ('1545', '1539', '山亭区', '370406', null, '0');
INSERT INTO `lr_china_city` VALUES ('1546', '1539', '滕州市', '370481', null, '0');
INSERT INTO `lr_china_city` VALUES ('1547', '1502', '东营市', '370500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1549', '1547', '东营区', '370502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1550', '1547', '河口区', '370503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1551', '1547', '垦利县', '370521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1552', '1547', '利津县', '370522', null, '0');
INSERT INTO `lr_china_city` VALUES ('1553', '1547', '广饶县', '370523', null, '0');
INSERT INTO `lr_china_city` VALUES ('1554', '1502', '烟台市', '370600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1556', '1554', '芝罘区', '370602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1557', '1554', '福山区', '370611', null, '0');
INSERT INTO `lr_china_city` VALUES ('1558', '1554', '牟平区', '370612', null, '0');
INSERT INTO `lr_china_city` VALUES ('1559', '1554', '莱山区', '370613', null, '0');
INSERT INTO `lr_china_city` VALUES ('1560', '1554', '长岛县', '370634', null, '0');
INSERT INTO `lr_china_city` VALUES ('1561', '1554', '龙口市', '370681', null, '0');
INSERT INTO `lr_china_city` VALUES ('1562', '1554', '莱阳市', '370682', null, '0');
INSERT INTO `lr_china_city` VALUES ('1563', '1554', '莱州市', '370683', null, '0');
INSERT INTO `lr_china_city` VALUES ('1564', '1554', '蓬莱市', '370684', null, '0');
INSERT INTO `lr_china_city` VALUES ('1565', '1554', '招远市', '370685', null, '0');
INSERT INTO `lr_china_city` VALUES ('1566', '1554', '栖霞市', '370686', null, '0');
INSERT INTO `lr_china_city` VALUES ('1567', '1554', '海阳市', '370687', null, '0');
INSERT INTO `lr_china_city` VALUES ('1568', '1502', '潍坊市', '370700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1570', '1568', '潍城区', '370702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1571', '1568', '寒亭区', '370703', null, '0');
INSERT INTO `lr_china_city` VALUES ('1572', '1568', '坊子区', '370704', null, '0');
INSERT INTO `lr_china_city` VALUES ('1573', '1568', '奎文区', '370705', null, '0');
INSERT INTO `lr_china_city` VALUES ('1574', '1568', '临朐县', '370724', null, '0');
INSERT INTO `lr_china_city` VALUES ('1575', '1568', '昌乐县', '370725', null, '0');
INSERT INTO `lr_china_city` VALUES ('1576', '1568', '青州市', '370781', null, '0');
INSERT INTO `lr_china_city` VALUES ('1577', '1568', '诸城市', '370782', null, '0');
INSERT INTO `lr_china_city` VALUES ('1578', '1568', '寿光市', '370783', null, '0');
INSERT INTO `lr_china_city` VALUES ('1579', '1568', '安丘市', '370784', null, '0');
INSERT INTO `lr_china_city` VALUES ('1580', '1568', '高密市', '370785', null, '0');
INSERT INTO `lr_china_city` VALUES ('1581', '1568', '昌邑市', '370786', null, '0');
INSERT INTO `lr_china_city` VALUES ('1582', '1502', '济宁市', '370800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1584', '1582', '市中区', '370802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1585', '1582', '任城区', '370811', null, '0');
INSERT INTO `lr_china_city` VALUES ('1586', '1582', '微山县', '370826', null, '0');
INSERT INTO `lr_china_city` VALUES ('1587', '1582', '鱼台县', '370827', null, '0');
INSERT INTO `lr_china_city` VALUES ('1588', '1582', '金乡县', '370828', null, '0');
INSERT INTO `lr_china_city` VALUES ('1589', '1582', '嘉祥县', '370829', null, '0');
INSERT INTO `lr_china_city` VALUES ('1590', '1582', '汶上县', '370830', null, '0');
INSERT INTO `lr_china_city` VALUES ('1591', '1582', '泗水县', '370831', null, '0');
INSERT INTO `lr_china_city` VALUES ('1592', '1582', '梁山县', '370832', null, '0');
INSERT INTO `lr_china_city` VALUES ('1593', '1582', '曲阜市', '370881', null, '0');
INSERT INTO `lr_china_city` VALUES ('1594', '1582', '兖州市', '370882', null, '0');
INSERT INTO `lr_china_city` VALUES ('1595', '1582', '邹城市', '370883', null, '0');
INSERT INTO `lr_china_city` VALUES ('1596', '1502', '泰安市', '370900', null, '0');
INSERT INTO `lr_china_city` VALUES ('1598', '1596', '泰山区', '370902', null, '0');
INSERT INTO `lr_china_city` VALUES ('1599', '1596', '岱岳区', '370911', null, '0');
INSERT INTO `lr_china_city` VALUES ('1600', '1596', '宁阳县', '370921', null, '0');
INSERT INTO `lr_china_city` VALUES ('1601', '1596', '东平县', '370923', null, '0');
INSERT INTO `lr_china_city` VALUES ('1602', '1596', '新泰市', '370982', null, '0');
INSERT INTO `lr_china_city` VALUES ('1603', '1596', '肥城市', '370983', null, '0');
INSERT INTO `lr_china_city` VALUES ('1604', '1502', '威海市', '371000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1606', '1604', '环翠区', '371002', null, '0');
INSERT INTO `lr_china_city` VALUES ('1607', '1604', '文登市', '371081', null, '0');
INSERT INTO `lr_china_city` VALUES ('1608', '1604', '荣成市', '371082', null, '0');
INSERT INTO `lr_china_city` VALUES ('1609', '1604', '乳山市', '371083', null, '0');
INSERT INTO `lr_china_city` VALUES ('1610', '1502', '日照市', '371100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1612', '1610', '东港区', '371102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1613', '1610', '岚山区', '371103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1614', '1610', '五莲县', '371121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1615', '1610', '莒县', '371122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1616', '1502', '莱芜市', '371200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1618', '1616', '莱城区', '371202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1619', '1616', '钢城区', '371203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1620', '1502', '临沂市', '371300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1622', '1620', '兰山区', '371302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1623', '1620', '罗庄区', '371311', null, '0');
INSERT INTO `lr_china_city` VALUES ('1624', '1620', '河东区', '371312', null, '0');
INSERT INTO `lr_china_city` VALUES ('1625', '1620', '沂南县', '371321', null, '0');
INSERT INTO `lr_china_city` VALUES ('1626', '1620', '郯城县', '371322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1627', '1620', '沂水县', '371323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1628', '1620', '苍山县', '371324', null, '0');
INSERT INTO `lr_china_city` VALUES ('1629', '1620', '费县', '371325', null, '0');
INSERT INTO `lr_china_city` VALUES ('1630', '1620', '平邑县', '371326', null, '0');
INSERT INTO `lr_china_city` VALUES ('1631', '1620', '莒南县', '371327', null, '0');
INSERT INTO `lr_china_city` VALUES ('1632', '1620', '蒙阴县', '371328', null, '0');
INSERT INTO `lr_china_city` VALUES ('1633', '1620', '临沭县', '371329', null, '0');
INSERT INTO `lr_china_city` VALUES ('1634', '1502', '德州市', '371400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1636', '1634', '德城区', '371402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1637', '1634', '陵县', '371421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1638', '1634', '宁津县', '371422', null, '0');
INSERT INTO `lr_china_city` VALUES ('1639', '1634', '庆云县', '371423', null, '0');
INSERT INTO `lr_china_city` VALUES ('1640', '1634', '临邑县', '371424', null, '0');
INSERT INTO `lr_china_city` VALUES ('1641', '1634', '齐河县', '371425', null, '0');
INSERT INTO `lr_china_city` VALUES ('1642', '1634', '平原县', '371426', null, '0');
INSERT INTO `lr_china_city` VALUES ('1643', '1634', '夏津县', '371427', null, '0');
INSERT INTO `lr_china_city` VALUES ('1644', '1634', '武城县', '371428', null, '0');
INSERT INTO `lr_china_city` VALUES ('1645', '1634', '乐陵市', '371481', null, '0');
INSERT INTO `lr_china_city` VALUES ('1646', '1634', '禹城市', '371482', null, '0');
INSERT INTO `lr_china_city` VALUES ('1647', '1502', '聊城市', '371500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1649', '1647', '东昌府区', '371502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1650', '1647', '阳谷县', '371521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1651', '1647', '莘县', '371522', null, '0');
INSERT INTO `lr_china_city` VALUES ('1652', '1647', '茌平县', '371523', null, '0');
INSERT INTO `lr_china_city` VALUES ('1653', '1647', '东阿县', '371524', null, '0');
INSERT INTO `lr_china_city` VALUES ('1654', '1647', '冠县', '371525', null, '0');
INSERT INTO `lr_china_city` VALUES ('1655', '1647', '高唐县', '371526', null, '0');
INSERT INTO `lr_china_city` VALUES ('1656', '1647', '临清市', '371581', null, '0');
INSERT INTO `lr_china_city` VALUES ('1657', '1502', '滨州市', '371600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1659', '1657', '滨城区', '371602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1660', '1657', '惠民县', '371621', null, '0');
INSERT INTO `lr_china_city` VALUES ('1661', '1657', '阳信县', '371622', null, '0');
INSERT INTO `lr_china_city` VALUES ('1662', '1657', '无棣县', '371623', null, '0');
INSERT INTO `lr_china_city` VALUES ('1663', '1657', '沾化县', '371624', null, '0');
INSERT INTO `lr_china_city` VALUES ('1664', '1657', '博兴县', '371625', null, '0');
INSERT INTO `lr_china_city` VALUES ('1665', '1657', '邹平县', '371626', null, '0');
INSERT INTO `lr_china_city` VALUES ('1666', '1502', '菏泽市', '371700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1668', '1666', '牡丹区', '371702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1669', '1666', '曹县', '371721', null, '0');
INSERT INTO `lr_china_city` VALUES ('1670', '1666', '单县', '371722', null, '0');
INSERT INTO `lr_china_city` VALUES ('1671', '1666', '成武县', '371723', null, '0');
INSERT INTO `lr_china_city` VALUES ('1672', '1666', '巨野县', '371724', null, '0');
INSERT INTO `lr_china_city` VALUES ('1673', '1666', '郓城县', '371725', null, '0');
INSERT INTO `lr_china_city` VALUES ('1674', '1666', '鄄城县', '371726', null, '0');
INSERT INTO `lr_china_city` VALUES ('1675', '1666', '定陶县', '371727', null, '0');
INSERT INTO `lr_china_city` VALUES ('1676', '1666', '东明县', '371728', null, '0');
INSERT INTO `lr_china_city` VALUES ('1677', '0', '河南省', '410000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1678', '1677', '郑州市', '410100', 'Z', '1');
INSERT INTO `lr_china_city` VALUES ('1680', '1678', '中原区', '410102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1681', '1678', '二七区', '410103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1682', '1678', '管城回族区', '410104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1683', '1678', '金水区', '410105', null, '0');
INSERT INTO `lr_china_city` VALUES ('1684', '1678', '上街区', '410106', null, '0');
INSERT INTO `lr_china_city` VALUES ('1685', '1678', '惠济区', '410108', null, '0');
INSERT INTO `lr_china_city` VALUES ('1686', '1678', '中牟县', '410122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1687', '1678', '巩义市', '410181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1688', '1678', '荥阳市', '410182', null, '0');
INSERT INTO `lr_china_city` VALUES ('1689', '1678', '新密市', '410183', null, '0');
INSERT INTO `lr_china_city` VALUES ('1690', '1678', '新郑市', '410184', null, '0');
INSERT INTO `lr_china_city` VALUES ('1691', '1678', '登封市', '410185', null, '0');
INSERT INTO `lr_china_city` VALUES ('1692', '1677', '开封市', '410200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1694', '1692', '龙亭区', '410202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1695', '1692', '顺河回族区', '410203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1696', '1692', '鼓楼区', '410204', null, '0');
INSERT INTO `lr_china_city` VALUES ('1697', '1692', '禹王台区', '410205', null, '0');
INSERT INTO `lr_china_city` VALUES ('1698', '1692', '金明区', '410211', null, '0');
INSERT INTO `lr_china_city` VALUES ('1699', '1692', '杞县', '410221', null, '0');
INSERT INTO `lr_china_city` VALUES ('1700', '1692', '通许县', '410222', null, '0');
INSERT INTO `lr_china_city` VALUES ('1701', '1692', '尉氏县', '410223', null, '0');
INSERT INTO `lr_china_city` VALUES ('1702', '1692', '开封县', '410224', null, '0');
INSERT INTO `lr_china_city` VALUES ('1703', '1692', '兰考县', '410225', null, '0');
INSERT INTO `lr_china_city` VALUES ('1704', '1677', '洛阳市', '410300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1706', '1704', '老城区', '410302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1707', '1704', '西工区', '410303', null, '0');
INSERT INTO `lr_china_city` VALUES ('1708', '1704', '瀍河回族区', '410304', null, '0');
INSERT INTO `lr_china_city` VALUES ('1709', '1704', '涧西区', '410305', null, '0');
INSERT INTO `lr_china_city` VALUES ('1710', '1704', '吉利区', '410306', null, '0');
INSERT INTO `lr_china_city` VALUES ('1711', '1704', '洛龙区', '410311', null, '0');
INSERT INTO `lr_china_city` VALUES ('1712', '1704', '孟津县', '410322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1713', '1704', '新安县', '410323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1714', '1704', '栾川县', '410324', null, '0');
INSERT INTO `lr_china_city` VALUES ('1715', '1704', '嵩县', '410325', null, '0');
INSERT INTO `lr_china_city` VALUES ('1716', '1704', '汝阳县', '410326', null, '0');
INSERT INTO `lr_china_city` VALUES ('1717', '1704', '宜阳县', '410327', null, '0');
INSERT INTO `lr_china_city` VALUES ('1718', '1704', '洛宁县', '410328', null, '0');
INSERT INTO `lr_china_city` VALUES ('1719', '1704', '伊川县', '410329', null, '0');
INSERT INTO `lr_china_city` VALUES ('1720', '1704', '偃师市', '410381', null, '0');
INSERT INTO `lr_china_city` VALUES ('1721', '1677', '平顶山市', '410400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1723', '1721', '新华区', '410402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1724', '1721', '卫东区', '410403', null, '0');
INSERT INTO `lr_china_city` VALUES ('1725', '1721', '石龙区', '410404', null, '0');
INSERT INTO `lr_china_city` VALUES ('1726', '1721', '湛河区', '410411', null, '0');
INSERT INTO `lr_china_city` VALUES ('1727', '1721', '宝丰县', '410421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1728', '1721', '叶BRBR县', '410422', null, '0');
INSERT INTO `lr_china_city` VALUES ('1729', '1721', '鲁山县', '410423', null, '0');
INSERT INTO `lr_china_city` VALUES ('1730', '1721', '郏县', '410425', null, '0');
INSERT INTO `lr_china_city` VALUES ('1731', '1721', '舞钢市', '410481', null, '0');
INSERT INTO `lr_china_city` VALUES ('1732', '1721', '汝州市', '410482', null, '0');
INSERT INTO `lr_china_city` VALUES ('1733', '1677', '安阳市', '410500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1735', '1733', '文峰区', '410502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1736', '1733', '北关区', '410503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1737', '1733', '殷都区', '410505', null, '0');
INSERT INTO `lr_china_city` VALUES ('1738', '1733', '龙安区', '410506', null, '0');
INSERT INTO `lr_china_city` VALUES ('1739', '1733', '安阳县', '410522', null, '0');
INSERT INTO `lr_china_city` VALUES ('1740', '1733', '汤阴县', '410523', null, '0');
INSERT INTO `lr_china_city` VALUES ('1741', '1733', '滑县', '410526', null, '0');
INSERT INTO `lr_china_city` VALUES ('1742', '1733', '内黄县', '410527', null, '0');
INSERT INTO `lr_china_city` VALUES ('1743', '1733', '林州市', '410581', null, '0');
INSERT INTO `lr_china_city` VALUES ('1744', '1677', '鹤壁市', '410600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1746', '1744', '鹤山区', '410602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1747', '1744', '山城区', '410603', null, '0');
INSERT INTO `lr_china_city` VALUES ('1748', '1744', '淇滨区', '410611', null, '0');
INSERT INTO `lr_china_city` VALUES ('1749', '1744', '浚县', '410621', null, '0');
INSERT INTO `lr_china_city` VALUES ('1750', '1744', '淇县', '410622', null, '0');
INSERT INTO `lr_china_city` VALUES ('1751', '1677', '新乡市', '410700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1753', '1751', '红旗区', '410702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1754', '1751', '卫滨区', '410703', null, '0');
INSERT INTO `lr_china_city` VALUES ('1755', '1751', '凤泉区', '410704', null, '0');
INSERT INTO `lr_china_city` VALUES ('1756', '1751', '牧野区', '410711', null, '0');
INSERT INTO `lr_china_city` VALUES ('1757', '1751', '新乡县', '410721', null, '0');
INSERT INTO `lr_china_city` VALUES ('1758', '1751', '获嘉县', '410724', null, '0');
INSERT INTO `lr_china_city` VALUES ('1759', '1751', '原阳县', '410725', null, '0');
INSERT INTO `lr_china_city` VALUES ('1760', '1751', '延津县', '410726', null, '0');
INSERT INTO `lr_china_city` VALUES ('1761', '1751', '封丘县', '410727', null, '0');
INSERT INTO `lr_china_city` VALUES ('1762', '1751', '长垣县', '410728', null, '0');
INSERT INTO `lr_china_city` VALUES ('1763', '1751', '卫辉市', '410781', null, '0');
INSERT INTO `lr_china_city` VALUES ('1764', '1751', '辉县市', '410782', null, '0');
INSERT INTO `lr_china_city` VALUES ('1765', '1677', '焦作市', '410800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1767', '1765', '解放区', '410802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1768', '1765', '中站区', '410803', null, '0');
INSERT INTO `lr_china_city` VALUES ('1769', '1765', '马村区', '410804', null, '0');
INSERT INTO `lr_china_city` VALUES ('1770', '1765', '山阳区', '410811', null, '0');
INSERT INTO `lr_china_city` VALUES ('1771', '1765', '修武县', '410821', null, '0');
INSERT INTO `lr_china_city` VALUES ('1772', '1765', '博爱县', '410822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1773', '1765', '武陟县', '410823', null, '0');
INSERT INTO `lr_china_city` VALUES ('1774', '1765', '温县', '410825', null, '0');
INSERT INTO `lr_china_city` VALUES ('1775', '1765', '沁阳市', '410882', null, '0');
INSERT INTO `lr_china_city` VALUES ('1776', '1765', '孟州市', '410883', null, '0');
INSERT INTO `lr_china_city` VALUES ('1777', '1677', '濮阳市', '410900', null, '0');
INSERT INTO `lr_china_city` VALUES ('1779', '1777', '华龙区', '410902', null, '0');
INSERT INTO `lr_china_city` VALUES ('1780', '1777', '清丰县', '410922', null, '0');
INSERT INTO `lr_china_city` VALUES ('1781', '1777', '南乐县', '410923', null, '0');
INSERT INTO `lr_china_city` VALUES ('1782', '1777', '范县', '410926', null, '0');
INSERT INTO `lr_china_city` VALUES ('1783', '1777', '台前县', '410927', null, '0');
INSERT INTO `lr_china_city` VALUES ('1784', '1777', '濮阳县', '410928', null, '0');
INSERT INTO `lr_china_city` VALUES ('1785', '1677', '许昌市', '411000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1787', '1785', '魏都区', '411002', null, '0');
INSERT INTO `lr_china_city` VALUES ('1788', '1785', '许昌县', '411023', null, '0');
INSERT INTO `lr_china_city` VALUES ('1789', '1785', '鄢陵县', '411024', null, '0');
INSERT INTO `lr_china_city` VALUES ('1790', '1785', '襄城县', '411025', null, '0');
INSERT INTO `lr_china_city` VALUES ('1791', '1785', '禹州市', '411081', null, '0');
INSERT INTO `lr_china_city` VALUES ('1792', '1785', '长葛市', '411082', null, '0');
INSERT INTO `lr_china_city` VALUES ('1793', '1677', '漯河市', '411100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1795', '1793', '源汇区', '411102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1796', '1793', '郾城区', '411103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1797', '1793', '召陵区', '411104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1798', '1793', '舞阳县', '411121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1799', '1793', '临颍县', '411122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1800', '1677', '三门峡市', '411200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1802', '1800', '湖滨区', '411202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1803', '1800', '渑池县', '411221', null, '0');
INSERT INTO `lr_china_city` VALUES ('1804', '1800', '陕县', '411222', null, '0');
INSERT INTO `lr_china_city` VALUES ('1805', '1800', '卢氏县', '411224', null, '0');
INSERT INTO `lr_china_city` VALUES ('1806', '1800', '义马市', '411281', null, '0');
INSERT INTO `lr_china_city` VALUES ('1807', '1800', '灵宝市', '411282', null, '0');
INSERT INTO `lr_china_city` VALUES ('1808', '1677', '南阳市', '411300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1810', '1808', '宛城区', '411302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1811', '1808', '卧龙区', '411303', null, '0');
INSERT INTO `lr_china_city` VALUES ('1812', '1808', '南召县', '411321', null, '0');
INSERT INTO `lr_china_city` VALUES ('1813', '1808', '方城县', '411322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1814', '1808', '西峡县', '411323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1815', '1808', '镇平县', '411324', null, '0');
INSERT INTO `lr_china_city` VALUES ('1816', '1808', '内乡县', '411325', null, '0');
INSERT INTO `lr_china_city` VALUES ('1817', '1808', '淅川县', '411326', null, '0');
INSERT INTO `lr_china_city` VALUES ('1818', '1808', '社旗县', '411327', null, '0');
INSERT INTO `lr_china_city` VALUES ('1819', '1808', '唐河县', '411328', null, '0');
INSERT INTO `lr_china_city` VALUES ('1820', '1808', '新野县', '411329', null, '0');
INSERT INTO `lr_china_city` VALUES ('1821', '1808', '桐柏县', '411330', null, '0');
INSERT INTO `lr_china_city` VALUES ('1822', '1808', '邓州市', '411381', null, '0');
INSERT INTO `lr_china_city` VALUES ('1823', '1677', '商丘市', '411400', null, '0');
INSERT INTO `lr_china_city` VALUES ('1825', '1823', '梁园区', '411402', null, '0');
INSERT INTO `lr_china_city` VALUES ('1826', '1823', '睢阳区', '411403', null, '0');
INSERT INTO `lr_china_city` VALUES ('1827', '1823', '民权县', '411421', null, '0');
INSERT INTO `lr_china_city` VALUES ('1828', '1823', '睢县', '411422', null, '0');
INSERT INTO `lr_china_city` VALUES ('1829', '1823', '宁陵县', '411423', null, '0');
INSERT INTO `lr_china_city` VALUES ('1830', '1823', '柘城县', '411424', null, '0');
INSERT INTO `lr_china_city` VALUES ('1831', '1823', '虞城县', '411425', null, '0');
INSERT INTO `lr_china_city` VALUES ('1832', '1823', '夏邑县', '411426', null, '0');
INSERT INTO `lr_china_city` VALUES ('1833', '1823', '永城市', '411481', null, '0');
INSERT INTO `lr_china_city` VALUES ('1834', '1677', '信阳市', '411500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1836', '1834', '浉河区', '411502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1837', '1834', '平桥区', '411503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1838', '1834', '罗山县', '411521', null, '0');
INSERT INTO `lr_china_city` VALUES ('1839', '1834', '光山县', '411522', null, '0');
INSERT INTO `lr_china_city` VALUES ('1840', '1834', '新县', '411523', null, '0');
INSERT INTO `lr_china_city` VALUES ('1841', '1834', '商城县', '411524', null, '0');
INSERT INTO `lr_china_city` VALUES ('1842', '1834', '固始县', '411525', null, '0');
INSERT INTO `lr_china_city` VALUES ('1843', '1834', '潢川县', '411526', null, '0');
INSERT INTO `lr_china_city` VALUES ('1844', '1834', '淮滨县', '411527', null, '0');
INSERT INTO `lr_china_city` VALUES ('1845', '1834', '息县', '411528', null, '0');
INSERT INTO `lr_china_city` VALUES ('1846', '1677', '周口市', '411600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1848', '1846', '川汇区', '411602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1849', '1846', '扶沟县', '411621', null, '0');
INSERT INTO `lr_china_city` VALUES ('1850', '1846', '西华县', '411622', null, '0');
INSERT INTO `lr_china_city` VALUES ('1851', '1846', '商水县', '411623', null, '0');
INSERT INTO `lr_china_city` VALUES ('1852', '1846', '沈丘县', '411624', null, '0');
INSERT INTO `lr_china_city` VALUES ('1853', '1846', '郸城县', '411625', null, '0');
INSERT INTO `lr_china_city` VALUES ('1854', '1846', '淮阳县', '411626', null, '0');
INSERT INTO `lr_china_city` VALUES ('1855', '1846', '太康县', '411627', null, '0');
INSERT INTO `lr_china_city` VALUES ('1856', '1846', '鹿邑县', '411628', null, '0');
INSERT INTO `lr_china_city` VALUES ('1857', '1846', '项城市', '411681', null, '0');
INSERT INTO `lr_china_city` VALUES ('1858', '1677', '驻马店市', '411700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1860', '1858', '驿城区', '411702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1861', '1858', '西平县', '411721', null, '0');
INSERT INTO `lr_china_city` VALUES ('1862', '1858', '上蔡县', '411722', null, '0');
INSERT INTO `lr_china_city` VALUES ('1863', '1858', '平舆县', '411723', null, '0');
INSERT INTO `lr_china_city` VALUES ('1864', '1858', '正阳县', '411724', null, '0');
INSERT INTO `lr_china_city` VALUES ('1865', '1858', '确山县', '411725', null, '0');
INSERT INTO `lr_china_city` VALUES ('1866', '1858', '泌阳县', '411726', null, '0');
INSERT INTO `lr_china_city` VALUES ('1867', '1858', '汝南县', '411727', null, '0');
INSERT INTO `lr_china_city` VALUES ('1868', '1858', '遂平县', '411728', null, '0');
INSERT INTO `lr_china_city` VALUES ('1869', '1858', '新蔡县', '411729', null, '0');
INSERT INTO `lr_china_city` VALUES ('1870', '1677', '省直辖县级行政区划', '419000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1871', '1870', '济源市', '419001', null, '0');
INSERT INTO `lr_china_city` VALUES ('1872', '0', '湖北省', '420000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1873', '1872', '武汉市', '420100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1875', '1873', '江岸区', '420102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1876', '1873', '江汉区', '420103', null, '0');
INSERT INTO `lr_china_city` VALUES ('1877', '1873', '硚口区', '420104', null, '0');
INSERT INTO `lr_china_city` VALUES ('1878', '1873', '汉阳区', '420105', null, '0');
INSERT INTO `lr_china_city` VALUES ('1879', '1873', '武昌区', '420106', null, '0');
INSERT INTO `lr_china_city` VALUES ('1880', '1873', '青山区', '420107', null, '0');
INSERT INTO `lr_china_city` VALUES ('1881', '1873', '洪山区', '420111', null, '0');
INSERT INTO `lr_china_city` VALUES ('1882', '1873', '东西湖区', '420112', null, '0');
INSERT INTO `lr_china_city` VALUES ('1883', '1873', '汉南区', '420113', null, '0');
INSERT INTO `lr_china_city` VALUES ('1884', '1873', '蔡甸区', '420114', null, '0');
INSERT INTO `lr_china_city` VALUES ('1885', '1873', '江夏区', '420115', null, '0');
INSERT INTO `lr_china_city` VALUES ('1886', '1873', '黄陂区', '420116', null, '0');
INSERT INTO `lr_china_city` VALUES ('1887', '1873', '新洲区', '420117', null, '0');
INSERT INTO `lr_china_city` VALUES ('1888', '1872', '黄石市', '420200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1890', '1888', '黄石港区', '420202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1891', '1888', '西塞山区', '420203', null, '0');
INSERT INTO `lr_china_city` VALUES ('1892', '1888', '下陆区', '420204', null, '0');
INSERT INTO `lr_china_city` VALUES ('1893', '1888', '铁山区', '420205', null, '0');
INSERT INTO `lr_china_city` VALUES ('1894', '1888', '阳新县', '420222', null, '0');
INSERT INTO `lr_china_city` VALUES ('1895', '1888', '大冶市', '420281', null, '0');
INSERT INTO `lr_china_city` VALUES ('1896', '1872', '十堰市', '420300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1898', '1896', '茅箭区', '420302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1899', '1896', '张湾区', '420303', null, '0');
INSERT INTO `lr_china_city` VALUES ('1900', '1896', '郧县', '420321', null, '0');
INSERT INTO `lr_china_city` VALUES ('1901', '1896', '郧西县', '420322', null, '0');
INSERT INTO `lr_china_city` VALUES ('1902', '1896', '竹山县', '420323', null, '0');
INSERT INTO `lr_china_city` VALUES ('1903', '1896', '竹溪县', '420324', null, '0');
INSERT INTO `lr_china_city` VALUES ('1904', '1896', '房县', '420325', null, '0');
INSERT INTO `lr_china_city` VALUES ('1905', '1896', '丹江口市', '420381', null, '0');
INSERT INTO `lr_china_city` VALUES ('1906', '1872', '宜昌市', '420500', null, '0');
INSERT INTO `lr_china_city` VALUES ('1908', '1906', '西陵区', '420502', null, '0');
INSERT INTO `lr_china_city` VALUES ('1909', '1906', '伍家岗区', '420503', null, '0');
INSERT INTO `lr_china_city` VALUES ('1910', '1906', '点军区', '420504', null, '0');
INSERT INTO `lr_china_city` VALUES ('1911', '1906', '猇亭区', '420505', null, '0');
INSERT INTO `lr_china_city` VALUES ('1912', '1906', '夷陵区', '420506', null, '0');
INSERT INTO `lr_china_city` VALUES ('1913', '1906', '远安县', '420525', null, '0');
INSERT INTO `lr_china_city` VALUES ('1914', '1906', '兴山县', '420526', null, '0');
INSERT INTO `lr_china_city` VALUES ('1915', '1906', '秭归县', '420527', null, '0');
INSERT INTO `lr_china_city` VALUES ('1916', '1906', '长阳土家族自治县', '420528', null, '0');
INSERT INTO `lr_china_city` VALUES ('1917', '1906', '五峰土家族自治县', '420529', null, '0');
INSERT INTO `lr_china_city` VALUES ('1918', '1906', '宜都市', '420581', null, '0');
INSERT INTO `lr_china_city` VALUES ('1919', '1906', '当阳市', '420582', null, '0');
INSERT INTO `lr_china_city` VALUES ('1920', '1906', '枝江市', '420583', null, '0');
INSERT INTO `lr_china_city` VALUES ('1921', '1872', '襄樊市', '420600', null, '0');
INSERT INTO `lr_china_city` VALUES ('1923', '1921', '襄城区', '420602', null, '0');
INSERT INTO `lr_china_city` VALUES ('1924', '1921', '樊城区', '420606', null, '0');
INSERT INTO `lr_china_city` VALUES ('1925', '1921', '襄阳区', '420607', null, '0');
INSERT INTO `lr_china_city` VALUES ('1926', '1921', '南漳县', '420624', null, '0');
INSERT INTO `lr_china_city` VALUES ('1927', '1921', '谷城县', '420625', null, '0');
INSERT INTO `lr_china_city` VALUES ('1928', '1921', '保康县', '420626', null, '0');
INSERT INTO `lr_china_city` VALUES ('1929', '1921', '老河口市', '420682', null, '0');
INSERT INTO `lr_china_city` VALUES ('1930', '1921', '枣阳市', '420683', null, '0');
INSERT INTO `lr_china_city` VALUES ('1931', '1921', '宜城市', '420684', null, '0');
INSERT INTO `lr_china_city` VALUES ('1932', '1872', '鄂州市', '420700', null, '0');
INSERT INTO `lr_china_city` VALUES ('1934', '1932', '梁子湖区', '420702', null, '0');
INSERT INTO `lr_china_city` VALUES ('1935', '1932', '华容区', '420703', null, '0');
INSERT INTO `lr_china_city` VALUES ('1936', '1932', '鄂城区', '420704', null, '0');
INSERT INTO `lr_china_city` VALUES ('1937', '1872', '荆门市', '420800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1939', '1937', '东宝区', '420802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1940', '1937', '掇刀区', '420804', null, '0');
INSERT INTO `lr_china_city` VALUES ('1941', '1937', '京山县', '420821', null, '0');
INSERT INTO `lr_china_city` VALUES ('1942', '1937', '沙洋县', '420822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1943', '1937', '钟祥市', '420881', null, '0');
INSERT INTO `lr_china_city` VALUES ('1944', '1872', '孝感市', '420900', null, '0');
INSERT INTO `lr_china_city` VALUES ('1946', '1944', '孝南区', '420902', null, '0');
INSERT INTO `lr_china_city` VALUES ('1947', '1944', '孝昌县', '420921', null, '0');
INSERT INTO `lr_china_city` VALUES ('1948', '1944', '大悟县', '420922', null, '0');
INSERT INTO `lr_china_city` VALUES ('1949', '1944', '云梦县', '420923', null, '0');
INSERT INTO `lr_china_city` VALUES ('1950', '1944', '应城市', '420981', null, '0');
INSERT INTO `lr_china_city` VALUES ('1951', '1944', '安陆市', '420982', null, '0');
INSERT INTO `lr_china_city` VALUES ('1952', '1944', '汉川市', '420984', null, '0');
INSERT INTO `lr_china_city` VALUES ('1953', '1872', '荆州市', '421000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1955', '1953', '沙市区', '421002', null, '0');
INSERT INTO `lr_china_city` VALUES ('1956', '1953', '荆州区', '421003', null, '0');
INSERT INTO `lr_china_city` VALUES ('1957', '1953', '公安县', '421022', null, '0');
INSERT INTO `lr_china_city` VALUES ('1958', '1953', '监利县', '421023', null, '0');
INSERT INTO `lr_china_city` VALUES ('1959', '1953', '江陵县', '421024', null, '0');
INSERT INTO `lr_china_city` VALUES ('1960', '1953', '石首市', '421081', null, '0');
INSERT INTO `lr_china_city` VALUES ('1961', '1953', '洪湖市', '421083', null, '0');
INSERT INTO `lr_china_city` VALUES ('1962', '1953', '松滋市', '421087', null, '0');
INSERT INTO `lr_china_city` VALUES ('1963', '1872', '黄冈市', '421100', null, '0');
INSERT INTO `lr_china_city` VALUES ('1965', '1963', '黄州区', '421102', null, '0');
INSERT INTO `lr_china_city` VALUES ('1966', '1963', '团风县', '421121', null, '0');
INSERT INTO `lr_china_city` VALUES ('1967', '1963', '红安县', '421122', null, '0');
INSERT INTO `lr_china_city` VALUES ('1968', '1963', '罗田县', '421123', null, '0');
INSERT INTO `lr_china_city` VALUES ('1969', '1963', '英山县', '421124', null, '0');
INSERT INTO `lr_china_city` VALUES ('1970', '1963', '浠水县', '421125', null, '0');
INSERT INTO `lr_china_city` VALUES ('1971', '1963', '蕲春县', '421126', null, '0');
INSERT INTO `lr_china_city` VALUES ('1972', '1963', '黄梅县', '421127', null, '0');
INSERT INTO `lr_china_city` VALUES ('1973', '1963', '麻城市', '421181', null, '0');
INSERT INTO `lr_china_city` VALUES ('1974', '1963', '武穴市', '421182', null, '0');
INSERT INTO `lr_china_city` VALUES ('1975', '1872', '咸宁市', '421200', null, '0');
INSERT INTO `lr_china_city` VALUES ('1977', '1975', '咸安区', '421202', null, '0');
INSERT INTO `lr_china_city` VALUES ('1978', '1975', '嘉鱼县', '421221', null, '0');
INSERT INTO `lr_china_city` VALUES ('1979', '1975', '通城县', '421222', null, '0');
INSERT INTO `lr_china_city` VALUES ('1980', '1975', '崇阳县', '421223', null, '0');
INSERT INTO `lr_china_city` VALUES ('1981', '1975', '通山县', '421224', null, '0');
INSERT INTO `lr_china_city` VALUES ('1982', '1975', '赤壁市', '421281', null, '0');
INSERT INTO `lr_china_city` VALUES ('1983', '1872', '随州市', '421300', null, '0');
INSERT INTO `lr_china_city` VALUES ('1985', '1983', '曾都区', '421302', null, '0');
INSERT INTO `lr_china_city` VALUES ('1986', '1983', '广水市', '421381', null, '0');
INSERT INTO `lr_china_city` VALUES ('1987', '1872', '恩施土家族苗族自治州', '422800', null, '0');
INSERT INTO `lr_china_city` VALUES ('1988', '1987', '恩施市', '422801', null, '0');
INSERT INTO `lr_china_city` VALUES ('1989', '1987', '利川市', '422802', null, '0');
INSERT INTO `lr_china_city` VALUES ('1990', '1987', '建始县', '422822', null, '0');
INSERT INTO `lr_china_city` VALUES ('1991', '1987', '巴东县', '422823', null, '0');
INSERT INTO `lr_china_city` VALUES ('1992', '1987', '宣恩县', '422825', null, '0');
INSERT INTO `lr_china_city` VALUES ('1993', '1987', '咸丰县', '422826', null, '0');
INSERT INTO `lr_china_city` VALUES ('1994', '1987', '来凤县', '422827', null, '0');
INSERT INTO `lr_china_city` VALUES ('1995', '1987', '鹤峰县', '422828', null, '0');
INSERT INTO `lr_china_city` VALUES ('1996', '1872', '省直辖县级行政区划', '429000', null, '0');
INSERT INTO `lr_china_city` VALUES ('1997', '1996', '仙桃市', '429004', null, '0');
INSERT INTO `lr_china_city` VALUES ('1998', '1996', '潜江市', '429005', null, '0');
INSERT INTO `lr_china_city` VALUES ('1999', '1996', '天门市', '429006', null, '0');
INSERT INTO `lr_china_city` VALUES ('2000', '1996', '神农架林区', '429021', null, '0');
INSERT INTO `lr_china_city` VALUES ('2001', '0', '湖南省', '430000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2002', '2001', '长沙市', '430100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2004', '2002', '芙蓉区', '430102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2005', '2002', '天心区', '430103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2006', '2002', '岳麓区', '430104', null, '0');
INSERT INTO `lr_china_city` VALUES ('2007', '2002', '开福区', '430105', null, '0');
INSERT INTO `lr_china_city` VALUES ('2008', '2002', '雨花区', '430111', null, '0');
INSERT INTO `lr_china_city` VALUES ('2009', '2002', '长沙县', '430121', null, '0');
INSERT INTO `lr_china_city` VALUES ('2010', '2002', '望城县', '430122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2011', '2002', '宁乡县', '430124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2012', '2002', '浏阳市', '430181', null, '0');
INSERT INTO `lr_china_city` VALUES ('2013', '2001', '株洲市', '430200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2015', '2013', '荷塘区', '430202', null, '0');
INSERT INTO `lr_china_city` VALUES ('2016', '2013', '芦淞区', '430203', null, '0');
INSERT INTO `lr_china_city` VALUES ('2017', '2013', '石峰区', '430204', null, '0');
INSERT INTO `lr_china_city` VALUES ('2018', '2013', '天元区', '430211', null, '0');
INSERT INTO `lr_china_city` VALUES ('2019', '2013', '株洲县', '430221', null, '0');
INSERT INTO `lr_china_city` VALUES ('2020', '2013', '攸县', '430223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2021', '2013', '茶陵县', '430224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2022', '2013', '炎陵县', '430225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2023', '2013', '醴陵市', '430281', null, '0');
INSERT INTO `lr_china_city` VALUES ('2024', '2001', '湘潭市', '430300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2026', '2024', '雨湖区', '430302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2027', '2024', '岳塘区', '430304', null, '0');
INSERT INTO `lr_china_city` VALUES ('2028', '2024', '湘潭县', '430321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2029', '2024', '湘乡市', '430381', null, '0');
INSERT INTO `lr_china_city` VALUES ('2030', '2024', '韶山市', '430382', null, '0');
INSERT INTO `lr_china_city` VALUES ('2031', '2001', '衡阳市', '430400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2033', '2031', '珠晖区', '430405', null, '0');
INSERT INTO `lr_china_city` VALUES ('2034', '2031', '雁峰区', '430406', null, '0');
INSERT INTO `lr_china_city` VALUES ('2035', '2031', '石鼓区', '430407', null, '0');
INSERT INTO `lr_china_city` VALUES ('2036', '2031', '蒸湘区', '430408', null, '0');
INSERT INTO `lr_china_city` VALUES ('2037', '2031', '南岳区', '430412', null, '0');
INSERT INTO `lr_china_city` VALUES ('2038', '2031', '衡阳县', '430421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2039', '2031', '衡南县', '430422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2040', '2031', '衡山县', '430423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2041', '2031', '衡东县', '430424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2042', '2031', '祁东县', '430426', null, '0');
INSERT INTO `lr_china_city` VALUES ('2043', '2031', '耒阳市', '430481', null, '0');
INSERT INTO `lr_china_city` VALUES ('2044', '2031', '常宁市', '430482', null, '0');
INSERT INTO `lr_china_city` VALUES ('2045', '2001', '邵阳市', '430500', null, '0');
INSERT INTO `lr_china_city` VALUES ('2047', '2045', '双清区', '430502', null, '0');
INSERT INTO `lr_china_city` VALUES ('2048', '2045', '大祥区', '430503', null, '0');
INSERT INTO `lr_china_city` VALUES ('2049', '2045', '北塔区', '430511', null, '0');
INSERT INTO `lr_china_city` VALUES ('2050', '2045', '邵东县', '430521', null, '0');
INSERT INTO `lr_china_city` VALUES ('2051', '2045', '新邵县', '430522', null, '0');
INSERT INTO `lr_china_city` VALUES ('2052', '2045', '邵阳县', '430523', null, '0');
INSERT INTO `lr_china_city` VALUES ('2053', '2045', '隆回县', '430524', null, '0');
INSERT INTO `lr_china_city` VALUES ('2054', '2045', '洞口县', '430525', null, '0');
INSERT INTO `lr_china_city` VALUES ('2055', '2045', '绥宁县', '430527', null, '0');
INSERT INTO `lr_china_city` VALUES ('2056', '2045', '新宁县', '430528', null, '0');
INSERT INTO `lr_china_city` VALUES ('2057', '2045', '城步苗族自治县', '430529', null, '0');
INSERT INTO `lr_china_city` VALUES ('2058', '2045', '武冈市', '430581', null, '0');
INSERT INTO `lr_china_city` VALUES ('2059', '2001', '岳阳市', '430600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2061', '2059', '岳阳楼区', '430602', null, '0');
INSERT INTO `lr_china_city` VALUES ('2062', '2059', '云溪区', '430603', null, '0');
INSERT INTO `lr_china_city` VALUES ('2063', '2059', '君山区', '430611', null, '0');
INSERT INTO `lr_china_city` VALUES ('2064', '2059', '岳阳县', '430621', null, '0');
INSERT INTO `lr_china_city` VALUES ('2065', '2059', '华容县', '430623', null, '0');
INSERT INTO `lr_china_city` VALUES ('2066', '2059', '湘阴县', '430624', null, '0');
INSERT INTO `lr_china_city` VALUES ('2067', '2059', '平江县', '430626', null, '0');
INSERT INTO `lr_china_city` VALUES ('2068', '2059', '汨罗市', '430681', null, '0');
INSERT INTO `lr_china_city` VALUES ('2069', '2059', '临湘市', '430682', null, '0');
INSERT INTO `lr_china_city` VALUES ('2070', '2001', '常德市', '430700', null, '0');
INSERT INTO `lr_china_city` VALUES ('2072', '2070', '武陵区', '430702', null, '0');
INSERT INTO `lr_china_city` VALUES ('2073', '2070', '鼎城区', '430703', null, '0');
INSERT INTO `lr_china_city` VALUES ('2074', '2070', '安乡县', '430721', null, '0');
INSERT INTO `lr_china_city` VALUES ('2075', '2070', '汉寿县', '430722', null, '0');
INSERT INTO `lr_china_city` VALUES ('2076', '2070', '澧县', '430723', null, '0');
INSERT INTO `lr_china_city` VALUES ('2077', '2070', '临澧县', '430724', null, '0');
INSERT INTO `lr_china_city` VALUES ('2078', '2070', '桃源县', '430725', null, '0');
INSERT INTO `lr_china_city` VALUES ('2079', '2070', '石门县', '430726', null, '0');
INSERT INTO `lr_china_city` VALUES ('2080', '2070', '津市市', '430781', null, '0');
INSERT INTO `lr_china_city` VALUES ('2081', '2001', '张家界市', '430800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2083', '2081', '永定区', '430802', null, '0');
INSERT INTO `lr_china_city` VALUES ('2084', '2081', '武陵源区', '430811', null, '0');
INSERT INTO `lr_china_city` VALUES ('2085', '2081', '慈利县', '430821', null, '0');
INSERT INTO `lr_china_city` VALUES ('2086', '2081', '桑植县', '430822', null, '0');
INSERT INTO `lr_china_city` VALUES ('2087', '2001', '益阳市', '430900', null, '0');
INSERT INTO `lr_china_city` VALUES ('2089', '2087', '资阳区', '430902', null, '0');
INSERT INTO `lr_china_city` VALUES ('2090', '2087', '赫山区', '430903', null, '0');
INSERT INTO `lr_china_city` VALUES ('2091', '2087', '南县', '430921', null, '0');
INSERT INTO `lr_china_city` VALUES ('2092', '2087', '桃江县', '430922', null, '0');
INSERT INTO `lr_china_city` VALUES ('2093', '2087', '安化县', '430923', null, '0');
INSERT INTO `lr_china_city` VALUES ('2094', '2087', '沅江市', '430981', null, '0');
INSERT INTO `lr_china_city` VALUES ('2095', '2001', '郴州市', '431000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2097', '2095', '北湖区', '431002', null, '0');
INSERT INTO `lr_china_city` VALUES ('2098', '2095', '苏仙区', '431003', null, '0');
INSERT INTO `lr_china_city` VALUES ('2099', '2095', '桂阳县', '431021', null, '0');
INSERT INTO `lr_china_city` VALUES ('2100', '2095', '宜章县', '431022', null, '0');
INSERT INTO `lr_china_city` VALUES ('2101', '2095', '永兴县', '431023', null, '0');
INSERT INTO `lr_china_city` VALUES ('2102', '2095', '嘉禾县', '431024', null, '0');
INSERT INTO `lr_china_city` VALUES ('2103', '2095', '临武县', '431025', null, '0');
INSERT INTO `lr_china_city` VALUES ('2104', '2095', '汝城县', '431026', null, '0');
INSERT INTO `lr_china_city` VALUES ('2105', '2095', '桂东县', '431027', null, '0');
INSERT INTO `lr_china_city` VALUES ('2106', '2095', '安仁县', '431028', null, '0');
INSERT INTO `lr_china_city` VALUES ('2107', '2095', '资兴市', '431081', null, '0');
INSERT INTO `lr_china_city` VALUES ('2108', '2001', '永州市', '431100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2110', '2108', '零陵区', '431102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2111', '2108', '冷水滩区', '431103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2112', '2108', '祁阳县', '431121', null, '0');
INSERT INTO `lr_china_city` VALUES ('2113', '2108', '东安县', '431122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2114', '2108', '双牌县', '431123', null, '0');
INSERT INTO `lr_china_city` VALUES ('2115', '2108', '道县', '431124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2116', '2108', '江永县', '431125', null, '0');
INSERT INTO `lr_china_city` VALUES ('2117', '2108', '宁远县', '431126', null, '0');
INSERT INTO `lr_china_city` VALUES ('2118', '2108', '蓝山县', '431127', null, '0');
INSERT INTO `lr_china_city` VALUES ('2119', '2108', '新田县', '431128', null, '0');
INSERT INTO `lr_china_city` VALUES ('2120', '2108', '江华瑶族自治县', '431129', null, '0');
INSERT INTO `lr_china_city` VALUES ('2121', '2001', '怀化市', '431200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2123', '2121', '鹤城区', '431202', null, '0');
INSERT INTO `lr_china_city` VALUES ('2124', '2121', '中方县', '431221', null, '0');
INSERT INTO `lr_china_city` VALUES ('2125', '2121', '沅陵县', '431222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2126', '2121', '辰溪县', '431223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2127', '2121', '溆浦县', '431224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2128', '2121', '会同县', '431225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2129', '2121', '麻阳苗族自治县', '431226', null, '0');
INSERT INTO `lr_china_city` VALUES ('2130', '2121', '新晃侗族自治县', '431227', null, '0');
INSERT INTO `lr_china_city` VALUES ('2131', '2121', '芷江侗族自治县', '431228', null, '0');
INSERT INTO `lr_china_city` VALUES ('2132', '2121', '靖州苗族侗族自治县', '431229', null, '0');
INSERT INTO `lr_china_city` VALUES ('2133', '2121', '通道侗族自治县', '431230', null, '0');
INSERT INTO `lr_china_city` VALUES ('2134', '2121', '洪江市', '431281', null, '0');
INSERT INTO `lr_china_city` VALUES ('2135', '2001', '娄底市', '431300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2137', '2135', '娄星区', '431302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2138', '2135', '双峰县', '431321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2139', '2135', '新化县', '431322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2140', '2135', '冷水江市', '431381', null, '0');
INSERT INTO `lr_china_city` VALUES ('2141', '2135', '涟源市', '431382', null, '0');
INSERT INTO `lr_china_city` VALUES ('2142', '2001', '湘西土家族苗族自治州', '433100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2143', '2142', '吉首市', '433101', null, '0');
INSERT INTO `lr_china_city` VALUES ('2144', '2142', '泸溪县', '433122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2145', '2142', '凤凰县', '433123', null, '0');
INSERT INTO `lr_china_city` VALUES ('2146', '2142', '花垣县', '433124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2147', '2142', '保靖县', '433125', null, '0');
INSERT INTO `lr_china_city` VALUES ('2148', '2142', '古丈县', '433126', null, '0');
INSERT INTO `lr_china_city` VALUES ('2149', '2142', '永顺县', '433127', null, '0');
INSERT INTO `lr_china_city` VALUES ('2150', '2142', '龙山县', '433130', null, '0');
INSERT INTO `lr_china_city` VALUES ('2151', '0', '广东省', '440000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2152', '2151', '广州市', '440100', 'G', '1');
INSERT INTO `lr_china_city` VALUES ('2154', '2152', '荔湾区', '440103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2155', '2152', '越秀区', '440104', null, '0');
INSERT INTO `lr_china_city` VALUES ('2156', '2152', '海珠区', '440105', null, '0');
INSERT INTO `lr_china_city` VALUES ('2157', '2152', '天河区', '440106', null, '0');
INSERT INTO `lr_china_city` VALUES ('2158', '2152', '白云区', '440111', null, '0');
INSERT INTO `lr_china_city` VALUES ('2159', '2152', '黄埔区', '440112', null, '0');
INSERT INTO `lr_china_city` VALUES ('2160', '2152', '番禺区', '440113', null, '0');
INSERT INTO `lr_china_city` VALUES ('2161', '2152', '花都区', '440114', null, '0');
INSERT INTO `lr_china_city` VALUES ('2162', '2152', '南沙区', '440115', null, '0');
INSERT INTO `lr_china_city` VALUES ('2163', '2152', '萝岗区', '440116', null, '0');
INSERT INTO `lr_china_city` VALUES ('2164', '2152', '增城市', '440183', null, '0');
INSERT INTO `lr_china_city` VALUES ('2165', '2152', '从化市', '440184', null, '0');
INSERT INTO `lr_china_city` VALUES ('2166', '2151', '韶关市', '440200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2168', '2166', '武江区', '440203', null, '0');
INSERT INTO `lr_china_city` VALUES ('2169', '2166', '浈江区', '440204', null, '0');
INSERT INTO `lr_china_city` VALUES ('2170', '2166', '曲江区', '440205', null, '0');
INSERT INTO `lr_china_city` VALUES ('2171', '2166', '始兴县', '440222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2172', '2166', '仁化县', '440224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2173', '2166', '翁源县', '440229', null, '0');
INSERT INTO `lr_china_city` VALUES ('2174', '2166', '乳源瑶族自治县', '440232', null, '0');
INSERT INTO `lr_china_city` VALUES ('2175', '2166', '新丰县', '440233', null, '0');
INSERT INTO `lr_china_city` VALUES ('2176', '2166', '乐昌市', '440281', null, '0');
INSERT INTO `lr_china_city` VALUES ('2177', '2166', '南雄市', '440282', null, '0');
INSERT INTO `lr_china_city` VALUES ('2178', '2151', '深圳市', '440300', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('2180', '2178', '罗湖区', '440303', null, '0');
INSERT INTO `lr_china_city` VALUES ('2181', '2178', '福田区', '440304', null, '0');
INSERT INTO `lr_china_city` VALUES ('2182', '2178', '南山区', '440305', null, '0');
INSERT INTO `lr_china_city` VALUES ('2183', '2178', '宝安区', '440306', null, '0');
INSERT INTO `lr_china_city` VALUES ('2184', '2178', '龙岗区', '440307', null, '0');
INSERT INTO `lr_china_city` VALUES ('2185', '2178', '盐田区', '440308', null, '0');
INSERT INTO `lr_china_city` VALUES ('2186', '2151', '珠海市', '440400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2188', '2186', '香洲区', '440402', null, '0');
INSERT INTO `lr_china_city` VALUES ('2189', '2186', '斗门区', '440403', null, '0');
INSERT INTO `lr_china_city` VALUES ('2190', '2186', '金湾区', '440404', null, '0');
INSERT INTO `lr_china_city` VALUES ('2191', '2151', '汕头市', '440500', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('2193', '2191', '龙湖区', '440507', null, '0');
INSERT INTO `lr_china_city` VALUES ('2194', '2191', '金平区', '440511', null, '0');
INSERT INTO `lr_china_city` VALUES ('2195', '2191', '濠江区', '440512', null, '0');
INSERT INTO `lr_china_city` VALUES ('2196', '2191', '潮阳区', '440513', null, '0');
INSERT INTO `lr_china_city` VALUES ('2197', '2191', '潮南区', '440514', null, '0');
INSERT INTO `lr_china_city` VALUES ('2198', '2191', '澄海区', '440515', null, '0');
INSERT INTO `lr_china_city` VALUES ('2199', '2191', '南澳县', '440523', null, '0');
INSERT INTO `lr_china_city` VALUES ('2200', '2151', '佛山市', '440600', 'F', '1');
INSERT INTO `lr_china_city` VALUES ('2202', '2200', '禅城区', '440604', null, '0');
INSERT INTO `lr_china_city` VALUES ('2203', '2200', '南海区', '440605', null, '0');
INSERT INTO `lr_china_city` VALUES ('2204', '2200', '顺德区', '440606', null, '0');
INSERT INTO `lr_china_city` VALUES ('2205', '2200', '三水区', '440607', null, '0');
INSERT INTO `lr_china_city` VALUES ('2206', '2200', '高明区', '440608', null, '0');
INSERT INTO `lr_china_city` VALUES ('2207', '2151', '江门市', '440700', 'J', '1');
INSERT INTO `lr_china_city` VALUES ('2209', '2207', '蓬江区', '440703', null, '0');
INSERT INTO `lr_china_city` VALUES ('2210', '2207', '江海区', '440704', null, '0');
INSERT INTO `lr_china_city` VALUES ('2211', '2207', '新会区', '440705', null, '0');
INSERT INTO `lr_china_city` VALUES ('2212', '2207', '台山市', '440781', null, '0');
INSERT INTO `lr_china_city` VALUES ('2213', '2207', '开平市', '440783', null, '0');
INSERT INTO `lr_china_city` VALUES ('2214', '2207', '鹤山市', '440784', null, '0');
INSERT INTO `lr_china_city` VALUES ('2215', '2207', '恩平市', '440785', null, '0');
INSERT INTO `lr_china_city` VALUES ('2216', '2151', '湛江市', '440800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2218', '2216', '赤坎区', '440802', null, '0');
INSERT INTO `lr_china_city` VALUES ('2219', '2216', '霞山区', '440803', null, '0');
INSERT INTO `lr_china_city` VALUES ('2220', '2216', '坡头区', '440804', null, '0');
INSERT INTO `lr_china_city` VALUES ('2221', '2216', '麻章区', '440811', null, '0');
INSERT INTO `lr_china_city` VALUES ('2222', '2216', '遂溪县', '440823', null, '0');
INSERT INTO `lr_china_city` VALUES ('2223', '2216', '徐闻县', '440825', null, '0');
INSERT INTO `lr_china_city` VALUES ('2224', '2216', '廉江市', '440881', null, '0');
INSERT INTO `lr_china_city` VALUES ('2225', '2216', '雷州市', '440882', null, '0');
INSERT INTO `lr_china_city` VALUES ('2226', '2216', '吴川市', '440883', null, '0');
INSERT INTO `lr_china_city` VALUES ('2227', '2151', '茂名市', '440900', 'M', '1');
INSERT INTO `lr_china_city` VALUES ('2229', '2227', '茂南区', '440902', null, '0');
INSERT INTO `lr_china_city` VALUES ('2230', '2227', '茂港区', '440903', null, '0');
INSERT INTO `lr_china_city` VALUES ('2231', '2227', '电白县', '440923', null, '0');
INSERT INTO `lr_china_city` VALUES ('2232', '2227', '高州市', '440981', null, '0');
INSERT INTO `lr_china_city` VALUES ('2233', '2227', '化州市', '440982', null, '0');
INSERT INTO `lr_china_city` VALUES ('2234', '2227', '信宜市', '440983', null, '0');
INSERT INTO `lr_china_city` VALUES ('2235', '2151', '肇庆市', '441200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2237', '2235', '端州区', '441202', null, '0');
INSERT INTO `lr_china_city` VALUES ('2238', '2235', '鼎湖区', '441203', null, '0');
INSERT INTO `lr_china_city` VALUES ('2239', '2235', '广宁县', '441223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2240', '2235', '怀集县', '441224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2241', '2235', '封开县', '441225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2242', '2235', '德庆县', '441226', null, '0');
INSERT INTO `lr_china_city` VALUES ('2243', '2235', '高要市', '441283', null, '0');
INSERT INTO `lr_china_city` VALUES ('2244', '2235', '四会市', '441284', null, '0');
INSERT INTO `lr_china_city` VALUES ('2245', '2151', '惠州市', '441300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2247', '2245', '惠城区', '441302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2248', '2245', '惠阳区', '441303', null, '0');
INSERT INTO `lr_china_city` VALUES ('2249', '2245', '博罗县', '441322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2250', '2245', '惠东县', '441323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2251', '2245', '龙门县', '441324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2252', '2151', '梅州市', '441400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2254', '2252', '梅江区', '441402', null, '0');
INSERT INTO `lr_china_city` VALUES ('2255', '2252', '梅县', '441421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2256', '2252', '大埔县', '441422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2257', '2252', '丰顺县', '441423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2258', '2252', '五华县', '441424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2259', '2252', '平远县', '441426', null, '0');
INSERT INTO `lr_china_city` VALUES ('2260', '2252', '蕉岭县', '441427', null, '0');
INSERT INTO `lr_china_city` VALUES ('2261', '2252', '兴宁市', '441481', null, '0');
INSERT INTO `lr_china_city` VALUES ('2262', '2151', '汕尾市', '441500', null, '0');
INSERT INTO `lr_china_city` VALUES ('2264', '2262', '城区', '441502', null, '0');
INSERT INTO `lr_china_city` VALUES ('2265', '2262', '海丰县', '441521', null, '0');
INSERT INTO `lr_china_city` VALUES ('2266', '2262', '陆河县', '441523', null, '0');
INSERT INTO `lr_china_city` VALUES ('2267', '2262', '陆丰市', '441581', null, '0');
INSERT INTO `lr_china_city` VALUES ('2268', '2151', '河源市', '441600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2270', '2268', '源城区', '441602', null, '0');
INSERT INTO `lr_china_city` VALUES ('2271', '2268', '紫金县', '441621', null, '0');
INSERT INTO `lr_china_city` VALUES ('2272', '2268', '龙川县', '441622', null, '0');
INSERT INTO `lr_china_city` VALUES ('2273', '2268', '连平县', '441623', null, '0');
INSERT INTO `lr_china_city` VALUES ('2274', '2268', '和平县', '441624', null, '0');
INSERT INTO `lr_china_city` VALUES ('2275', '2268', '东源县', '441625', null, '0');
INSERT INTO `lr_china_city` VALUES ('2276', '2151', '阳江市', '441700', null, '0');
INSERT INTO `lr_china_city` VALUES ('2278', '2276', '江城区', '441702', null, '0');
INSERT INTO `lr_china_city` VALUES ('2279', '2276', '阳西县', '441721', null, '0');
INSERT INTO `lr_china_city` VALUES ('2280', '2276', '阳东县', '441723', null, '0');
INSERT INTO `lr_china_city` VALUES ('2281', '2276', '阳春市', '441781', null, '0');
INSERT INTO `lr_china_city` VALUES ('2282', '2151', '清远市', '441800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2284', '2282', '清城区', '441802', null, '0');
INSERT INTO `lr_china_city` VALUES ('2285', '2282', '佛冈县', '441821', null, '0');
INSERT INTO `lr_china_city` VALUES ('2286', '2282', '阳山县', '441823', null, '0');
INSERT INTO `lr_china_city` VALUES ('2287', '2282', '连山壮族瑶族自治县', '441825', null, '0');
INSERT INTO `lr_china_city` VALUES ('2288', '2282', '连南瑶族自治县', '441826', null, '0');
INSERT INTO `lr_china_city` VALUES ('2289', '2282', '清新县', '441827', null, '0');
INSERT INTO `lr_china_city` VALUES ('2290', '2282', '英德市', '441881', null, '0');
INSERT INTO `lr_china_city` VALUES ('2291', '2282', '连州市', '441882', null, '0');
INSERT INTO `lr_china_city` VALUES ('2292', '2151', '东莞市', '441900', null, '0');
INSERT INTO `lr_china_city` VALUES ('2293', '2151', '中山市', '442000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2294', '2151', '潮州市', '445100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2296', '2294', '湘桥区', '445102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2297', '2294', '潮安县', '445121', null, '0');
INSERT INTO `lr_china_city` VALUES ('2298', '2294', '饶平县', '445122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2299', '2151', '揭阳市', '445200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2301', '2299', '榕城区', '445202', null, '0');
INSERT INTO `lr_china_city` VALUES ('2302', '2299', '揭东县', '445221', null, '0');
INSERT INTO `lr_china_city` VALUES ('2303', '2299', '揭西县', '445222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2304', '2299', '惠来县', '445224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2305', '2299', '普宁市', '445281', null, '0');
INSERT INTO `lr_china_city` VALUES ('2306', '2151', '云浮市', '445300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2308', '2306', '云城区', '445302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2309', '2306', '新兴县', '445321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2310', '2306', '郁南县', '445322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2311', '2306', '云安县', '445323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2312', '2306', '罗定市', '445381', null, '0');
INSERT INTO `lr_china_city` VALUES ('2313', '0', '广西壮族自治区', '450000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2314', '2313', '南宁市', '450100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2316', '2314', '兴宁区', '450102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2317', '2314', '青秀区', '450103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2318', '2314', '江南区', '450105', null, '0');
INSERT INTO `lr_china_city` VALUES ('2319', '2314', '西乡塘区', '450107', null, '0');
INSERT INTO `lr_china_city` VALUES ('2320', '2314', '良庆区', '450108', null, '0');
INSERT INTO `lr_china_city` VALUES ('2321', '2314', '邕宁区', '450109', null, '0');
INSERT INTO `lr_china_city` VALUES ('2322', '2314', '武鸣县', '450122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2323', '2314', '隆安县', '450123', null, '0');
INSERT INTO `lr_china_city` VALUES ('2324', '2314', '马山县', '450124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2325', '2314', '上林县', '450125', null, '0');
INSERT INTO `lr_china_city` VALUES ('2326', '2314', '宾阳县', '450126', null, '0');
INSERT INTO `lr_china_city` VALUES ('2327', '2314', '横县', '450127', null, '0');
INSERT INTO `lr_china_city` VALUES ('2328', '2313', '柳州市', '450200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2330', '2328', '城中区', '450202', null, '0');
INSERT INTO `lr_china_city` VALUES ('2331', '2328', '鱼峰区', '450203', null, '0');
INSERT INTO `lr_china_city` VALUES ('2332', '2328', '柳南区', '450204', null, '0');
INSERT INTO `lr_china_city` VALUES ('2333', '2328', '柳北区', '450205', null, '0');
INSERT INTO `lr_china_city` VALUES ('2334', '2328', '柳江县', '450221', null, '0');
INSERT INTO `lr_china_city` VALUES ('2335', '2328', '柳城县', '450222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2336', '2328', '鹿寨县', '450223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2337', '2328', '融安县', '450224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2338', '2328', '融水苗族自治县', '450225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2339', '2328', '三江侗族自治县', '450226', null, '0');
INSERT INTO `lr_china_city` VALUES ('2340', '2313', '桂林市', '450300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2342', '2340', '秀峰区', '450302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2343', '2340', '叠彩区', '450303', null, '0');
INSERT INTO `lr_china_city` VALUES ('2344', '2340', '象山区', '450304', null, '0');
INSERT INTO `lr_china_city` VALUES ('2345', '2340', '七星区', '450305', null, '0');
INSERT INTO `lr_china_city` VALUES ('2346', '2340', '雁山区', '450311', null, '0');
INSERT INTO `lr_china_city` VALUES ('2347', '2340', '阳朔县', '450321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2348', '2340', '临桂县', '450322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2349', '2340', '灵川县', '450323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2350', '2340', '全州县', '450324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2351', '2340', '兴安县', '450325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2352', '2340', '永福县', '450326', null, '0');
INSERT INTO `lr_china_city` VALUES ('2353', '2340', '灌阳县', '450327', null, '0');
INSERT INTO `lr_china_city` VALUES ('2354', '2340', '龙胜各族自治县', '450328', null, '0');
INSERT INTO `lr_china_city` VALUES ('2355', '2340', '资源县', '450329', null, '0');
INSERT INTO `lr_china_city` VALUES ('2356', '2340', '平乐县', '450330', null, '0');
INSERT INTO `lr_china_city` VALUES ('2357', '2340', '荔蒲县', '450331', null, '0');
INSERT INTO `lr_china_city` VALUES ('2358', '2340', '恭城瑶族自治县', '450332', null, '0');
INSERT INTO `lr_china_city` VALUES ('2359', '2313', '梧州市', '450400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2361', '2359', '万秀区', '450403', null, '0');
INSERT INTO `lr_china_city` VALUES ('2362', '2359', '蝶山区', '450404', null, '0');
INSERT INTO `lr_china_city` VALUES ('2363', '2359', '长洲区', '450405', null, '0');
INSERT INTO `lr_china_city` VALUES ('2364', '2359', '苍梧县', '450421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2365', '2359', '藤县', '450422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2366', '2359', '蒙山县', '450423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2367', '2359', '岑溪市', '450481', null, '0');
INSERT INTO `lr_china_city` VALUES ('2368', '2313', '北海市', '450500', null, '0');
INSERT INTO `lr_china_city` VALUES ('2370', '2368', '海城区', '450502', null, '0');
INSERT INTO `lr_china_city` VALUES ('2371', '2368', '银海区', '450503', null, '0');
INSERT INTO `lr_china_city` VALUES ('2372', '2368', '铁山港区', '450512', null, '0');
INSERT INTO `lr_china_city` VALUES ('2373', '2368', '合浦县', '450521', null, '0');
INSERT INTO `lr_china_city` VALUES ('2374', '2313', '防城港市', '450600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2376', '2374', '港口区', '450602', null, '0');
INSERT INTO `lr_china_city` VALUES ('2377', '2374', '防城区', '450603', null, '0');
INSERT INTO `lr_china_city` VALUES ('2378', '2374', '上思县', '450621', null, '0');
INSERT INTO `lr_china_city` VALUES ('2379', '2374', '东兴市', '450681', null, '0');
INSERT INTO `lr_china_city` VALUES ('2380', '2313', '钦州市', '450700', null, '0');
INSERT INTO `lr_china_city` VALUES ('2382', '2380', '钦南区', '450702', null, '0');
INSERT INTO `lr_china_city` VALUES ('2383', '2380', '钦北区', '450703', null, '0');
INSERT INTO `lr_china_city` VALUES ('2384', '2380', '灵山县', '450721', null, '0');
INSERT INTO `lr_china_city` VALUES ('2385', '2380', '浦北县', '450722', null, '0');
INSERT INTO `lr_china_city` VALUES ('2386', '2313', '贵港市', '450800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2388', '2386', '港北区', '450802', null, '0');
INSERT INTO `lr_china_city` VALUES ('2389', '2386', '港南区', '450803', null, '0');
INSERT INTO `lr_china_city` VALUES ('2390', '2386', '覃塘区', '450804', null, '0');
INSERT INTO `lr_china_city` VALUES ('2391', '2386', '平南县', '450821', null, '0');
INSERT INTO `lr_china_city` VALUES ('2392', '2386', '桂平市', '450881', null, '0');
INSERT INTO `lr_china_city` VALUES ('2393', '2313', '玉林市', '450900', null, '0');
INSERT INTO `lr_china_city` VALUES ('2395', '2393', '玉州区', '450902', null, '0');
INSERT INTO `lr_china_city` VALUES ('2396', '2393', '容县', '450921', null, '0');
INSERT INTO `lr_china_city` VALUES ('2397', '2393', '陆川县', '450922', null, '0');
INSERT INTO `lr_china_city` VALUES ('2398', '2393', '博白县', '450923', null, '0');
INSERT INTO `lr_china_city` VALUES ('2399', '2393', '兴业县', '450924', null, '0');
INSERT INTO `lr_china_city` VALUES ('2400', '2393', '北流市', '450981', null, '0');
INSERT INTO `lr_china_city` VALUES ('2401', '2313', '百色市', '451000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2403', '2401', '右江区', '451002', null, '0');
INSERT INTO `lr_china_city` VALUES ('2404', '2401', '田阳县', '451021', null, '0');
INSERT INTO `lr_china_city` VALUES ('2405', '2401', '田东县', '451022', null, '0');
INSERT INTO `lr_china_city` VALUES ('2406', '2401', '平果县', '451023', null, '0');
INSERT INTO `lr_china_city` VALUES ('2407', '2401', '德保县', '451024', null, '0');
INSERT INTO `lr_china_city` VALUES ('2408', '2401', '靖西县', '451025', null, '0');
INSERT INTO `lr_china_city` VALUES ('2409', '2401', '那坡县', '451026', null, '0');
INSERT INTO `lr_china_city` VALUES ('2410', '2401', '凌云县', '451027', null, '0');
INSERT INTO `lr_china_city` VALUES ('2411', '2401', '乐业县', '451028', null, '0');
INSERT INTO `lr_china_city` VALUES ('2412', '2401', '田林县', '451029', null, '0');
INSERT INTO `lr_china_city` VALUES ('2413', '2401', '西林县', '451030', null, '0');
INSERT INTO `lr_china_city` VALUES ('2414', '2401', '隆林各族自治县', '451031', null, '0');
INSERT INTO `lr_china_city` VALUES ('2415', '2313', '贺州市', '451100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2417', '2415', '八步区', '451102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2418', '2415', '昭平县', '451121', null, '0');
INSERT INTO `lr_china_city` VALUES ('2419', '2415', '钟山县', '451122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2420', '2415', '富川瑶族自治县', '451123', null, '0');
INSERT INTO `lr_china_city` VALUES ('2421', '2313', '河池市', '451200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2423', '2421', '金城江区', '451202', null, '0');
INSERT INTO `lr_china_city` VALUES ('2424', '2421', '南丹县', '451221', null, '0');
INSERT INTO `lr_china_city` VALUES ('2425', '2421', '天峨县', '451222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2426', '2421', '凤山县', '451223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2427', '2421', '东兰县', '451224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2428', '2421', '罗城仫佬族自治县', '451225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2429', '2421', '环江毛南族自治县', '451226', null, '0');
INSERT INTO `lr_china_city` VALUES ('2430', '2421', '巴马瑶族自治县', '451227', null, '0');
INSERT INTO `lr_china_city` VALUES ('2431', '2421', '都安瑶族自治县', '451228', null, '0');
INSERT INTO `lr_china_city` VALUES ('2432', '2421', '大化瑶族自治县', '451229', null, '0');
INSERT INTO `lr_china_city` VALUES ('2433', '2421', '宜州市', '451281', null, '0');
INSERT INTO `lr_china_city` VALUES ('2434', '2313', '来宾市', '451300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2436', '2434', '兴宾区', '451302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2437', '2434', '忻城县', '451321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2438', '2434', '象州县', '451322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2439', '2434', '武宣县', '451323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2440', '2434', '金秀瑶族自治县', '451324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2441', '2434', '合山市', '451381', null, '0');
INSERT INTO `lr_china_city` VALUES ('2442', '2313', '崇左市', '451400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2444', '2442', '江洲区', '451402', null, '0');
INSERT INTO `lr_china_city` VALUES ('2445', '2442', '扶绥县', '451421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2446', '2442', '宁明县', '451422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2447', '2442', '龙州县', '451423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2448', '2442', '大新县', '451424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2449', '2442', '天等县', '451425', null, '0');
INSERT INTO `lr_china_city` VALUES ('2450', '2442', '凭祥市', '451481', null, '0');
INSERT INTO `lr_china_city` VALUES ('2451', '0', '海南省', '460000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2452', '2451', '海口市', '460100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2454', '2452', '秀英区', '460105', null, '0');
INSERT INTO `lr_china_city` VALUES ('2455', '2452', '龙华区', '460106', null, '0');
INSERT INTO `lr_china_city` VALUES ('2456', '2452', '琼山区', '460107', null, '0');
INSERT INTO `lr_china_city` VALUES ('2457', '2452', '美兰区', '460108', null, '0');
INSERT INTO `lr_china_city` VALUES ('2458', '2451', '三亚市', '460200', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('2460', '2451', '省直辖县级行政区划', '469000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2461', '2460', '五指山市', '469001', null, '0');
INSERT INTO `lr_china_city` VALUES ('2462', '2460', '琼海市', '469002', null, '0');
INSERT INTO `lr_china_city` VALUES ('2463', '2460', '儋州市', '469003', null, '0');
INSERT INTO `lr_china_city` VALUES ('2464', '2460', '文昌市', '469005', null, '0');
INSERT INTO `lr_china_city` VALUES ('2465', '2460', '万宁市', '469006', null, '0');
INSERT INTO `lr_china_city` VALUES ('2466', '2460', '东方市', '469007', null, '0');
INSERT INTO `lr_china_city` VALUES ('2467', '2460', '定安县', '469021', null, '0');
INSERT INTO `lr_china_city` VALUES ('2468', '2460', '屯昌县', '469022', null, '0');
INSERT INTO `lr_china_city` VALUES ('2469', '2460', '澄迈县', '469023', null, '0');
INSERT INTO `lr_china_city` VALUES ('2470', '2460', '临高县', '469024', null, '0');
INSERT INTO `lr_china_city` VALUES ('2471', '2460', '白沙黎族自治县', '469025', null, '0');
INSERT INTO `lr_china_city` VALUES ('2472', '2460', '昌江黎族自治县', '469026', null, '0');
INSERT INTO `lr_china_city` VALUES ('2473', '2460', '乐东黎族自治县', '469027', null, '0');
INSERT INTO `lr_china_city` VALUES ('2474', '2460', '陵水黎族自治县', '469028', null, '0');
INSERT INTO `lr_china_city` VALUES ('2475', '2460', '保亭黎族苗族自治县', '469029', null, '0');
INSERT INTO `lr_china_city` VALUES ('2476', '2460', '琼中黎族苗族自治县', '469030', null, '0');
INSERT INTO `lr_china_city` VALUES ('2477', '2460', '西沙群岛', '469031', null, '0');
INSERT INTO `lr_china_city` VALUES ('2478', '2460', '南沙群岛', '469032', null, '0');
INSERT INTO `lr_china_city` VALUES ('2479', '2460', '中沙群岛的岛礁及其海域', '469033', null, '0');
INSERT INTO `lr_china_city` VALUES ('2480', '0', '重庆市', '500000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2481', '2480', '重庆市', '500000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2482', '2481', '万州区', '500101', null, '0');
INSERT INTO `lr_china_city` VALUES ('2483', '2481', '涪陵区', '500102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2484', '2481', '渝中区', '500103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2485', '2481', '大渡口区', '500104', null, '0');
INSERT INTO `lr_china_city` VALUES ('2486', '2481', '江北区', '500105', null, '0');
INSERT INTO `lr_china_city` VALUES ('2487', '2481', '沙坪坝区', '500106', null, '0');
INSERT INTO `lr_china_city` VALUES ('2488', '2481', '九龙坡区', '500107', null, '0');
INSERT INTO `lr_china_city` VALUES ('2489', '2481', '南岸区', '500108', null, '0');
INSERT INTO `lr_china_city` VALUES ('2490', '2481', '北碚区', '500109', null, '0');
INSERT INTO `lr_china_city` VALUES ('2491', '2481', '万盛区', '500110', null, '0');
INSERT INTO `lr_china_city` VALUES ('2492', '2481', '双桥区', '500111', null, '0');
INSERT INTO `lr_china_city` VALUES ('2493', '2481', '渝北区', '500112', null, '0');
INSERT INTO `lr_china_city` VALUES ('2494', '2481', '巴南区', '500113', null, '0');
INSERT INTO `lr_china_city` VALUES ('2495', '2481', '黔江区', '500114', null, '0');
INSERT INTO `lr_china_city` VALUES ('2496', '2481', '长寿区', '500115', null, '0');
INSERT INTO `lr_china_city` VALUES ('2497', '2481', '江津区', '500116', null, '0');
INSERT INTO `lr_china_city` VALUES ('2498', '2481', '合川区', '500117', null, '0');
INSERT INTO `lr_china_city` VALUES ('2499', '2481', '永川区', '500118', null, '0');
INSERT INTO `lr_china_city` VALUES ('2500', '2481', '南川区', '500119', null, '0');
INSERT INTO `lr_china_city` VALUES ('2501', '2480', '县', '500200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2502', '2501', '綦江县', '500222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2503', '2501', '潼南县', '500223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2504', '2501', '铜梁县', '500224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2505', '2501', '大足县', '500225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2506', '2501', '荣昌县', '500226', null, '0');
INSERT INTO `lr_china_city` VALUES ('2507', '2501', '璧山县', '500227', null, '0');
INSERT INTO `lr_china_city` VALUES ('2508', '2501', '梁平县', '500228', null, '0');
INSERT INTO `lr_china_city` VALUES ('2509', '2501', '城口县', '500229', null, '0');
INSERT INTO `lr_china_city` VALUES ('2510', '2501', '丰都县', '500230', null, '0');
INSERT INTO `lr_china_city` VALUES ('2511', '2501', '垫江县', '500231', null, '0');
INSERT INTO `lr_china_city` VALUES ('2512', '2501', '武隆县', '500232', null, '0');
INSERT INTO `lr_china_city` VALUES ('2513', '2501', '忠县', '500233', null, '0');
INSERT INTO `lr_china_city` VALUES ('2514', '2501', '开县', '500234', null, '0');
INSERT INTO `lr_china_city` VALUES ('2515', '2501', '云阳县', '500235', null, '0');
INSERT INTO `lr_china_city` VALUES ('2516', '2501', '奉节县', '500236', null, '0');
INSERT INTO `lr_china_city` VALUES ('2517', '2501', '巫山县', '500237', null, '0');
INSERT INTO `lr_china_city` VALUES ('2518', '2501', '巫溪县', '500238', null, '0');
INSERT INTO `lr_china_city` VALUES ('2519', '2501', '石柱土家族自治县', '500240', null, '0');
INSERT INTO `lr_china_city` VALUES ('2520', '2501', '秀山土家族苗族自治县', '500241', null, '0');
INSERT INTO `lr_china_city` VALUES ('2521', '2501', '酉阳土家族苗族自治县', '500242', null, '0');
INSERT INTO `lr_china_city` VALUES ('2522', '2501', '彭水苗族土家族自治县', '500243', null, '0');
INSERT INTO `lr_china_city` VALUES ('2523', '0', '四川省', '510000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2524', '2523', '成都市', '510100', 'C', '1');
INSERT INTO `lr_china_city` VALUES ('2526', '2524', '锦江区', '510104', null, '0');
INSERT INTO `lr_china_city` VALUES ('2527', '2524', '青羊区', '510105', null, '0');
INSERT INTO `lr_china_city` VALUES ('2528', '2524', '金牛区', '510106', null, '0');
INSERT INTO `lr_china_city` VALUES ('2529', '2524', '武侯区', '510107', null, '0');
INSERT INTO `lr_china_city` VALUES ('2530', '2524', '成华区', '510108', null, '0');
INSERT INTO `lr_china_city` VALUES ('2531', '2524', '龙泉驿区', '510112', null, '0');
INSERT INTO `lr_china_city` VALUES ('2532', '2524', '青白江区', '510113', null, '0');
INSERT INTO `lr_china_city` VALUES ('2533', '2524', '新都区', '510114', null, '0');
INSERT INTO `lr_china_city` VALUES ('2534', '2524', '温江区', '510115', null, '0');
INSERT INTO `lr_china_city` VALUES ('2535', '2524', '金堂县', '510121', null, '0');
INSERT INTO `lr_china_city` VALUES ('2536', '2524', '双流县', '510122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2537', '2524', '郫县', '510124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2538', '2524', '大邑县', '510129', null, '0');
INSERT INTO `lr_china_city` VALUES ('2539', '2524', '蒲江县', '510131', null, '0');
INSERT INTO `lr_china_city` VALUES ('2540', '2524', '新津县', '510132', null, '0');
INSERT INTO `lr_china_city` VALUES ('2541', '2524', '都江堰市', '510181', null, '0');
INSERT INTO `lr_china_city` VALUES ('2542', '2524', '彭州市', '510182', null, '0');
INSERT INTO `lr_china_city` VALUES ('2543', '2524', '邛崃市', '510183', null, '0');
INSERT INTO `lr_china_city` VALUES ('2544', '2524', '崇州市', '510184', null, '0');
INSERT INTO `lr_china_city` VALUES ('2545', '2523', '自贡市', '510300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2547', '2545', '自流井区', '510302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2548', '2545', '贡井区', '510303', null, '0');
INSERT INTO `lr_china_city` VALUES ('2549', '2545', '大安区', '510304', null, '0');
INSERT INTO `lr_china_city` VALUES ('2550', '2545', '沿滩区', '510311', null, '0');
INSERT INTO `lr_china_city` VALUES ('2551', '2545', '荣县', '510321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2552', '2545', '富顺县', '510322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2553', '2523', '攀枝花市', '510400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2555', '2553', '东区', '510402', null, '0');
INSERT INTO `lr_china_city` VALUES ('2556', '2553', '西区', '510403', null, '0');
INSERT INTO `lr_china_city` VALUES ('2557', '2553', '仁和区', '510411', null, '0');
INSERT INTO `lr_china_city` VALUES ('2558', '2553', '米易县', '510421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2559', '2553', '盐边县', '510422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2560', '2523', '泸州市', '510500', null, '0');
INSERT INTO `lr_china_city` VALUES ('2562', '2560', '江阳区', '510502', null, '0');
INSERT INTO `lr_china_city` VALUES ('2563', '2560', '纳溪区', '510503', null, '0');
INSERT INTO `lr_china_city` VALUES ('2564', '2560', '龙马潭区', '510504', null, '0');
INSERT INTO `lr_china_city` VALUES ('2565', '2560', '泸县', '510521', null, '0');
INSERT INTO `lr_china_city` VALUES ('2566', '2560', '合江县', '510522', null, '0');
INSERT INTO `lr_china_city` VALUES ('2567', '2560', '叙永县', '510524', null, '0');
INSERT INTO `lr_china_city` VALUES ('2568', '2560', '古蔺县', '510525', null, '0');
INSERT INTO `lr_china_city` VALUES ('2569', '2523', '德阳市', '510600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2571', '2569', '旌阳区', '510603', null, '0');
INSERT INTO `lr_china_city` VALUES ('2572', '2569', '中江县', '510623', null, '0');
INSERT INTO `lr_china_city` VALUES ('2573', '2569', '罗江县', '510626', null, '0');
INSERT INTO `lr_china_city` VALUES ('2574', '2569', '广汉市', '510681', null, '0');
INSERT INTO `lr_china_city` VALUES ('2575', '2569', '什邡市', '510682', null, '0');
INSERT INTO `lr_china_city` VALUES ('2576', '2569', '绵竹市', '510683', null, '0');
INSERT INTO `lr_china_city` VALUES ('2577', '2523', '绵阳市', '510700', null, '0');
INSERT INTO `lr_china_city` VALUES ('2579', '2577', '涪城区', '510703', null, '0');
INSERT INTO `lr_china_city` VALUES ('2580', '2577', '游仙区', '510704', null, '0');
INSERT INTO `lr_china_city` VALUES ('2581', '2577', '三台县', '510722', null, '0');
INSERT INTO `lr_china_city` VALUES ('2582', '2577', '盐亭县', '510723', null, '0');
INSERT INTO `lr_china_city` VALUES ('2583', '2577', '安县', '510724', null, '0');
INSERT INTO `lr_china_city` VALUES ('2584', '2577', '梓潼县', '510725', null, '0');
INSERT INTO `lr_china_city` VALUES ('2585', '2577', '北川羌族自治县', '510726', null, '0');
INSERT INTO `lr_china_city` VALUES ('2586', '2577', '平武县', '510727', null, '0');
INSERT INTO `lr_china_city` VALUES ('2587', '2577', '江油市', '510781', null, '0');
INSERT INTO `lr_china_city` VALUES ('2588', '2523', '广元市', '510800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2590', '2588', '市中区', '510802', null, '0');
INSERT INTO `lr_china_city` VALUES ('2591', '2588', '元坝区', '510811', null, '0');
INSERT INTO `lr_china_city` VALUES ('2592', '2588', '朝天区', '510812', null, '0');
INSERT INTO `lr_china_city` VALUES ('2593', '2588', '旺苍县', '510821', null, '0');
INSERT INTO `lr_china_city` VALUES ('2594', '2588', '青川县', '510822', null, '0');
INSERT INTO `lr_china_city` VALUES ('2595', '2588', '剑阁县', '510823', null, '0');
INSERT INTO `lr_china_city` VALUES ('2596', '2588', '苍溪县', '510824', null, '0');
INSERT INTO `lr_china_city` VALUES ('2597', '2523', '遂宁市', '510900', null, '0');
INSERT INTO `lr_china_city` VALUES ('2599', '2597', '船山区', '510903', null, '0');
INSERT INTO `lr_china_city` VALUES ('2600', '2597', '安居区', '510904', null, '0');
INSERT INTO `lr_china_city` VALUES ('2601', '2597', '蓬溪县', '510921', null, '0');
INSERT INTO `lr_china_city` VALUES ('2602', '2597', '射洪县', '510922', null, '0');
INSERT INTO `lr_china_city` VALUES ('2603', '2597', '大英县', '510923', null, '0');
INSERT INTO `lr_china_city` VALUES ('2604', '2523', '内江市', '511000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2606', '2604', '市中区', '511002', null, '0');
INSERT INTO `lr_china_city` VALUES ('2607', '2604', '东兴区', '511011', null, '0');
INSERT INTO `lr_china_city` VALUES ('2608', '2604', '威远县', '511024', null, '0');
INSERT INTO `lr_china_city` VALUES ('2609', '2604', '资中县', '511025', null, '0');
INSERT INTO `lr_china_city` VALUES ('2610', '2604', '隆昌县', '511028', null, '0');
INSERT INTO `lr_china_city` VALUES ('2611', '2523', '乐山市', '511100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2613', '2611', '市中区', '511102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2614', '2611', '沙湾区', '511111', null, '0');
INSERT INTO `lr_china_city` VALUES ('2615', '2611', '五通桥区', '511112', null, '0');
INSERT INTO `lr_china_city` VALUES ('2616', '2611', '金口河区', '511113', null, '0');
INSERT INTO `lr_china_city` VALUES ('2617', '2611', '犍为县', '511123', null, '0');
INSERT INTO `lr_china_city` VALUES ('2618', '2611', '井研县', '511124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2619', '2611', '夹江县', '511126', null, '0');
INSERT INTO `lr_china_city` VALUES ('2620', '2611', '沐川县', '511129', null, '0');
INSERT INTO `lr_china_city` VALUES ('2621', '2611', '峨边彝族自治县', '511132', null, '0');
INSERT INTO `lr_china_city` VALUES ('2622', '2611', '马边彝族自治县', '511133', null, '0');
INSERT INTO `lr_china_city` VALUES ('2623', '2611', '峨眉山市', '511181', null, '0');
INSERT INTO `lr_china_city` VALUES ('2624', '2523', '南充市', '511300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2626', '2624', '顺庆区', '511302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2627', '2624', '高坪区', '511303', null, '0');
INSERT INTO `lr_china_city` VALUES ('2628', '2624', '嘉陵区', '511304', null, '0');
INSERT INTO `lr_china_city` VALUES ('2629', '2624', '南部县', '511321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2630', '2624', '营山县', '511322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2631', '2624', '蓬安县', '511323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2632', '2624', '仪陇县', '511324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2633', '2624', '西充县', '511325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2634', '2624', '阆中市', '511381', null, '0');
INSERT INTO `lr_china_city` VALUES ('2635', '2523', '眉山市', '511400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2637', '2635', '东坡区', '511402', null, '0');
INSERT INTO `lr_china_city` VALUES ('2638', '2635', '仁寿县', '511421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2639', '2635', '彭山县', '511422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2640', '2635', '洪雅县', '511423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2641', '2635', '丹棱县', '511424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2642', '2635', '青神县', '511425', null, '0');
INSERT INTO `lr_china_city` VALUES ('2643', '2523', '宜宾市', '511500', null, '0');
INSERT INTO `lr_china_city` VALUES ('2645', '2643', '翠屏区', '511502', null, '0');
INSERT INTO `lr_china_city` VALUES ('2646', '2643', '宜宾县', '511521', null, '0');
INSERT INTO `lr_china_city` VALUES ('2647', '2643', '南溪县', '511522', null, '0');
INSERT INTO `lr_china_city` VALUES ('2648', '2643', '江安县', '511523', null, '0');
INSERT INTO `lr_china_city` VALUES ('2649', '2643', '长宁县', '511524', null, '0');
INSERT INTO `lr_china_city` VALUES ('2650', '2643', '高县', '511525', null, '0');
INSERT INTO `lr_china_city` VALUES ('2651', '2643', '珙县', '511526', null, '0');
INSERT INTO `lr_china_city` VALUES ('2652', '2643', '筠连县', '511527', null, '0');
INSERT INTO `lr_china_city` VALUES ('2653', '2643', '兴文县', '511528', null, '0');
INSERT INTO `lr_china_city` VALUES ('2654', '2643', '屏山县', '511529', null, '0');
INSERT INTO `lr_china_city` VALUES ('2655', '2523', '广安市', '511600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2657', '2655', '广安区', '511602', null, '0');
INSERT INTO `lr_china_city` VALUES ('2658', '2655', '岳池县', '511621', null, '0');
INSERT INTO `lr_china_city` VALUES ('2659', '2655', '武胜县', '511622', null, '0');
INSERT INTO `lr_china_city` VALUES ('2660', '2655', '邻水县', '511623', null, '0');
INSERT INTO `lr_china_city` VALUES ('2661', '2655', '华蓥市', '511681', null, '0');
INSERT INTO `lr_china_city` VALUES ('2662', '2523', '达州市', '511700', null, '0');
INSERT INTO `lr_china_city` VALUES ('2664', '2662', '通川区', '511702', null, '0');
INSERT INTO `lr_china_city` VALUES ('2665', '2662', '达县', '511721', null, '0');
INSERT INTO `lr_china_city` VALUES ('2666', '2662', '宣汉县', '511722', null, '0');
INSERT INTO `lr_china_city` VALUES ('2667', '2662', '开江县', '511723', null, '0');
INSERT INTO `lr_china_city` VALUES ('2668', '2662', '大竹县', '511724', null, '0');
INSERT INTO `lr_china_city` VALUES ('2669', '2662', '渠县', '511725', null, '0');
INSERT INTO `lr_china_city` VALUES ('2670', '2662', '万源市', '511781', null, '0');
INSERT INTO `lr_china_city` VALUES ('2671', '2523', '雅安市', '511800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2673', '2671', '雨城区', '511802', null, '0');
INSERT INTO `lr_china_city` VALUES ('2674', '2671', '名山县', '511821', null, '0');
INSERT INTO `lr_china_city` VALUES ('2675', '2671', '荥经县', '511822', null, '0');
INSERT INTO `lr_china_city` VALUES ('2676', '2671', '汉源县', '511823', null, '0');
INSERT INTO `lr_china_city` VALUES ('2677', '2671', '石棉县', '511824', null, '0');
INSERT INTO `lr_china_city` VALUES ('2678', '2671', '天全县', '511825', null, '0');
INSERT INTO `lr_china_city` VALUES ('2679', '2671', '芦山县', '511826', null, '0');
INSERT INTO `lr_china_city` VALUES ('2680', '2671', '宝兴县', '511827', null, '0');
INSERT INTO `lr_china_city` VALUES ('2681', '2523', '巴中市', '511900', null, '0');
INSERT INTO `lr_china_city` VALUES ('2683', '2681', '巴州区', '511902', null, '0');
INSERT INTO `lr_china_city` VALUES ('2684', '2681', '通江县', '511921', null, '0');
INSERT INTO `lr_china_city` VALUES ('2685', '2681', '南江县', '511922', null, '0');
INSERT INTO `lr_china_city` VALUES ('2686', '2681', '平昌县', '511923', null, '0');
INSERT INTO `lr_china_city` VALUES ('2687', '2523', '资阳市', '512000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2689', '2687', '雁江区', '512002', null, '0');
INSERT INTO `lr_china_city` VALUES ('2690', '2687', '安岳县', '512021', null, '0');
INSERT INTO `lr_china_city` VALUES ('2691', '2687', '乐至县', '512022', null, '0');
INSERT INTO `lr_china_city` VALUES ('2692', '2687', '简阳市', '512081', null, '0');
INSERT INTO `lr_china_city` VALUES ('2693', '2523', '阿坝藏族羌族自治州', '513200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2694', '2693', '汶川县', '513221', null, '0');
INSERT INTO `lr_china_city` VALUES ('2695', '2693', '理县', '513222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2696', '2693', '茂县', '513223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2697', '2693', '松潘县', '513224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2698', '2693', '九寨沟县', '513225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2699', '2693', '金川县', '513226', null, '0');
INSERT INTO `lr_china_city` VALUES ('2700', '2693', '小金县', '513227', null, '0');
INSERT INTO `lr_china_city` VALUES ('2701', '2693', '黑水县', '513228', null, '0');
INSERT INTO `lr_china_city` VALUES ('2702', '2693', '马尔康县', '513229', null, '0');
INSERT INTO `lr_china_city` VALUES ('2703', '2693', '壤塘县', '513230', null, '0');
INSERT INTO `lr_china_city` VALUES ('2704', '2693', '阿坝县', '513231', null, '0');
INSERT INTO `lr_china_city` VALUES ('2705', '2693', '若尔盖县', '513232', null, '0');
INSERT INTO `lr_china_city` VALUES ('2706', '2693', '红原县', '513233', null, '0');
INSERT INTO `lr_china_city` VALUES ('2707', '2523', '甘孜藏族自治州', '513300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2708', '2707', '康定县', '513321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2709', '2707', '泸定县', '513322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2710', '2707', '丹巴县', '513323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2711', '2707', '九龙县', '513324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2712', '2707', '雅江县', '513325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2713', '2707', '道孚县', '513326', null, '0');
INSERT INTO `lr_china_city` VALUES ('2714', '2707', '炉霍县', '513327', null, '0');
INSERT INTO `lr_china_city` VALUES ('2715', '2707', '甘孜县', '513328', null, '0');
INSERT INTO `lr_china_city` VALUES ('2716', '2707', '新龙县', '513329', null, '0');
INSERT INTO `lr_china_city` VALUES ('2717', '2707', '德格县', '513330', null, '0');
INSERT INTO `lr_china_city` VALUES ('2718', '2707', '白玉县', '513331', null, '0');
INSERT INTO `lr_china_city` VALUES ('2719', '2707', '石渠县', '513332', null, '0');
INSERT INTO `lr_china_city` VALUES ('2720', '2707', '色达县', '513333', null, '0');
INSERT INTO `lr_china_city` VALUES ('2721', '2707', '理塘县', '513334', null, '0');
INSERT INTO `lr_china_city` VALUES ('2722', '2707', '巴塘县', '513335', null, '0');
INSERT INTO `lr_china_city` VALUES ('2723', '2707', '乡城县', '513336', null, '0');
INSERT INTO `lr_china_city` VALUES ('2724', '2707', '稻城县', '513337', null, '0');
INSERT INTO `lr_china_city` VALUES ('2725', '2707', '得荣县', '513338', null, '0');
INSERT INTO `lr_china_city` VALUES ('2726', '2523', '凉山彝族自治州', '513400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2727', '2726', '西昌市', '513401', null, '0');
INSERT INTO `lr_china_city` VALUES ('2728', '2726', '木里藏族自治县', '513422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2729', '2726', '盐源县', '513423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2730', '2726', '德昌县', '513424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2731', '2726', '会理县', '513425', null, '0');
INSERT INTO `lr_china_city` VALUES ('2732', '2726', '会东县', '513426', null, '0');
INSERT INTO `lr_china_city` VALUES ('2733', '2726', '宁南县', '513427', null, '0');
INSERT INTO `lr_china_city` VALUES ('2734', '2726', '普格县', '513428', null, '0');
INSERT INTO `lr_china_city` VALUES ('2735', '2726', '布拖县', '513429', null, '0');
INSERT INTO `lr_china_city` VALUES ('2736', '2726', '金阳县', '513430', null, '0');
INSERT INTO `lr_china_city` VALUES ('2737', '2726', '昭觉县', '513431', null, '0');
INSERT INTO `lr_china_city` VALUES ('2738', '2726', '喜德县', '513432', null, '0');
INSERT INTO `lr_china_city` VALUES ('2739', '2726', '冕宁县', '513433', null, '0');
INSERT INTO `lr_china_city` VALUES ('2740', '2726', '越西县', '513434', null, '0');
INSERT INTO `lr_china_city` VALUES ('2741', '2726', '甘洛县', '513435', null, '0');
INSERT INTO `lr_china_city` VALUES ('2742', '2726', '美姑县', '513436', null, '0');
INSERT INTO `lr_china_city` VALUES ('2743', '2726', '雷波县', '513437', null, '0');
INSERT INTO `lr_china_city` VALUES ('2744', '0', '贵州省', '520000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2745', '2744', '贵阳市', '520100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2747', '2745', '南明区', '520102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2748', '2745', '云岩区', '520103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2749', '2745', '花溪区', '520111', null, '0');
INSERT INTO `lr_china_city` VALUES ('2750', '2745', '乌当区', '520112', null, '0');
INSERT INTO `lr_china_city` VALUES ('2751', '2745', '白云区', '520113', null, '0');
INSERT INTO `lr_china_city` VALUES ('2752', '2745', '小河区', '520114', null, '0');
INSERT INTO `lr_china_city` VALUES ('2753', '2745', '开阳县', '520121', null, '0');
INSERT INTO `lr_china_city` VALUES ('2754', '2745', '息烽县', '520122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2755', '2745', '修文县', '520123', null, '0');
INSERT INTO `lr_china_city` VALUES ('2756', '2745', '清镇市', '520181', null, '0');
INSERT INTO `lr_china_city` VALUES ('2757', '2744', '六盘水市', '520200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2758', '2757', '钟山区', '520201', null, '0');
INSERT INTO `lr_china_city` VALUES ('2759', '2757', '六枝特区', '520203', null, '0');
INSERT INTO `lr_china_city` VALUES ('2760', '2757', '水城县', '520221', null, '0');
INSERT INTO `lr_china_city` VALUES ('2761', '2757', '盘县', '520222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2762', '2744', '遵义市', '520300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2764', '2762', '红花岗区', '520302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2765', '2762', '汇川区', '520303', null, '0');
INSERT INTO `lr_china_city` VALUES ('2766', '2762', '遵义县', '520321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2767', '2762', '桐梓县', '520322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2768', '2762', '绥阳县', '520323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2769', '2762', '正安县', '520324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2770', '2762', '道真仡佬族苗族自治县', '520325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2771', '2762', '务川仡佬族苗族自治县', '520326', null, '0');
INSERT INTO `lr_china_city` VALUES ('2772', '2762', '凤冈县', '520327', null, '0');
INSERT INTO `lr_china_city` VALUES ('2773', '2762', '湄潭县', '520328', null, '0');
INSERT INTO `lr_china_city` VALUES ('2774', '2762', '余庆县', '520329', null, '0');
INSERT INTO `lr_china_city` VALUES ('2775', '2762', '习水县', '520330', null, '0');
INSERT INTO `lr_china_city` VALUES ('2776', '2762', '赤水市', '520381', null, '0');
INSERT INTO `lr_china_city` VALUES ('2777', '2762', '仁怀市', '520382', null, '0');
INSERT INTO `lr_china_city` VALUES ('2778', '2744', '安顺市', '520400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2780', '2778', '西秀区', '520402', null, '0');
INSERT INTO `lr_china_city` VALUES ('2781', '2778', '平坝县', '520421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2782', '2778', '普定县', '520422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2783', '2778', '镇宁布依族苗族自治县', '520423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2784', '2778', '关岭布依族苗族自治县', '520424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2785', '2778', '紫云苗族布依族自治县', '520425', null, '0');
INSERT INTO `lr_china_city` VALUES ('2786', '2744', '铜仁地区', '522200', null, '0');
INSERT INTO `lr_china_city` VALUES ('2787', '2786', '铜仁市', '522201', null, '0');
INSERT INTO `lr_china_city` VALUES ('2788', '2786', '江口县', '522222', null, '0');
INSERT INTO `lr_china_city` VALUES ('2789', '2786', '玉屏侗族自治县', '522223', null, '0');
INSERT INTO `lr_china_city` VALUES ('2790', '2786', '石阡县', '522224', null, '0');
INSERT INTO `lr_china_city` VALUES ('2791', '2786', '思南县', '522225', null, '0');
INSERT INTO `lr_china_city` VALUES ('2792', '2786', '印江土家族苗族自治县', '522226', null, '0');
INSERT INTO `lr_china_city` VALUES ('2793', '2786', '德江县', '522227', null, '0');
INSERT INTO `lr_china_city` VALUES ('2794', '2786', '沿河土家族自治县', '522228', null, '0');
INSERT INTO `lr_china_city` VALUES ('2795', '2786', '松桃苗族自治县', '522229', null, '0');
INSERT INTO `lr_china_city` VALUES ('2796', '2786', '万山特区', '522230', null, '0');
INSERT INTO `lr_china_city` VALUES ('2797', '2744', '黔西南布依族苗族自治州', '522300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2798', '2797', '兴义市', '522301', null, '0');
INSERT INTO `lr_china_city` VALUES ('2799', '2797', '兴仁县', '522322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2800', '2797', '普安县', '522323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2801', '2797', '晴隆县', '522324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2802', '2797', '贞丰县', '522325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2803', '2797', '望谟县', '522326', null, '0');
INSERT INTO `lr_china_city` VALUES ('2804', '2797', '册亨县', '522327', null, '0');
INSERT INTO `lr_china_city` VALUES ('2805', '2797', '安龙县', '522328', null, '0');
INSERT INTO `lr_china_city` VALUES ('2806', '2744', '毕节地区', '522400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2807', '2806', '毕节市', '522401', null, '0');
INSERT INTO `lr_china_city` VALUES ('2808', '2806', '大方县', '522422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2809', '2806', '黔西县', '522423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2810', '2806', '金沙县', '522424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2811', '2806', '织金县', '522425', null, '0');
INSERT INTO `lr_china_city` VALUES ('2812', '2806', '纳雍县', '522426', null, '0');
INSERT INTO `lr_china_city` VALUES ('2813', '2806', '威宁彝族回族苗族自治县', '522427', null, '0');
INSERT INTO `lr_china_city` VALUES ('2814', '2806', '赫章县', '522428', null, '0');
INSERT INTO `lr_china_city` VALUES ('2815', '2744', '黔东南苗族侗族自治州', '522600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2816', '2815', '凯里市', '522601', null, '0');
INSERT INTO `lr_china_city` VALUES ('2817', '2815', '黄平县', '522622', null, '0');
INSERT INTO `lr_china_city` VALUES ('2818', '2815', '施秉县', '522623', null, '0');
INSERT INTO `lr_china_city` VALUES ('2819', '2815', '三穗县', '522624', null, '0');
INSERT INTO `lr_china_city` VALUES ('2820', '2815', '镇远县', '522625', null, '0');
INSERT INTO `lr_china_city` VALUES ('2821', '2815', '岑巩县', '522626', null, '0');
INSERT INTO `lr_china_city` VALUES ('2822', '2815', '天柱县', '522627', null, '0');
INSERT INTO `lr_china_city` VALUES ('2823', '2815', '锦屏县', '522628', null, '0');
INSERT INTO `lr_china_city` VALUES ('2824', '2815', '剑河县', '522629', null, '0');
INSERT INTO `lr_china_city` VALUES ('2825', '2815', '台江县', '522630', null, '0');
INSERT INTO `lr_china_city` VALUES ('2826', '2815', '黎平县', '522631', null, '0');
INSERT INTO `lr_china_city` VALUES ('2827', '2815', '榕江县', '522632', null, '0');
INSERT INTO `lr_china_city` VALUES ('2828', '2815', '从江县', '522633', null, '0');
INSERT INTO `lr_china_city` VALUES ('2829', '2815', '雷山县', '522634', null, '0');
INSERT INTO `lr_china_city` VALUES ('2830', '2815', '麻江县', '522635', null, '0');
INSERT INTO `lr_china_city` VALUES ('2831', '2815', '丹寨县', '522636', null, '0');
INSERT INTO `lr_china_city` VALUES ('2832', '2744', '黔南布依族苗族自治州', '522700', null, '0');
INSERT INTO `lr_china_city` VALUES ('2833', '2832', '都匀市', '522701', null, '0');
INSERT INTO `lr_china_city` VALUES ('2834', '2832', '福泉市', '522702', null, '0');
INSERT INTO `lr_china_city` VALUES ('2835', '2832', '荔波县', '522722', null, '0');
INSERT INTO `lr_china_city` VALUES ('2836', '2832', '贵定县', '522723', null, '0');
INSERT INTO `lr_china_city` VALUES ('2837', '2832', '瓮安县', '522725', null, '0');
INSERT INTO `lr_china_city` VALUES ('2838', '2832', '独山县', '522726', null, '0');
INSERT INTO `lr_china_city` VALUES ('2839', '2832', '平塘县', '522727', null, '0');
INSERT INTO `lr_china_city` VALUES ('2840', '2832', '罗甸县', '522728', null, '0');
INSERT INTO `lr_china_city` VALUES ('2841', '2832', '长顺县', '522729', null, '0');
INSERT INTO `lr_china_city` VALUES ('2842', '2832', '龙里县', '522730', null, '0');
INSERT INTO `lr_china_city` VALUES ('2843', '2832', '惠水县', '522731', null, '0');
INSERT INTO `lr_china_city` VALUES ('2844', '2832', '三都水族自治县', '522732', null, '0');
INSERT INTO `lr_china_city` VALUES ('2845', '0', '云南省', '530000', null, '0');
INSERT INTO `lr_china_city` VALUES ('2846', '2845', '昆明市', '530100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2848', '2846', '五华区', '530102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2849', '2846', '盘龙区', '530103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2850', '2846', '官渡区', '530111', null, '0');
INSERT INTO `lr_china_city` VALUES ('2851', '2846', '西山区', '530112', null, '0');
INSERT INTO `lr_china_city` VALUES ('2852', '2846', '东川区', '530113', null, '0');
INSERT INTO `lr_china_city` VALUES ('2853', '2846', '呈贡县', '530121', null, '0');
INSERT INTO `lr_china_city` VALUES ('2854', '2846', '晋宁县', '530122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2855', '2846', '富民县', '530124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2856', '2846', '宜良县', '530125', null, '0');
INSERT INTO `lr_china_city` VALUES ('2857', '2846', '石林彝族自治县', '530126', null, '0');
INSERT INTO `lr_china_city` VALUES ('2858', '2846', '嵩明县', '530127', null, '0');
INSERT INTO `lr_china_city` VALUES ('2859', '2846', '禄劝彝族苗族自治县', '530128', null, '0');
INSERT INTO `lr_china_city` VALUES ('2860', '2846', '寻甸回族彝族自治县', '530129', null, '0');
INSERT INTO `lr_china_city` VALUES ('2861', '2846', '安宁市', '530181', null, '0');
INSERT INTO `lr_china_city` VALUES ('2862', '2845', '曲靖市', '530300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2864', '2862', '麒麟区', '530302', null, '0');
INSERT INTO `lr_china_city` VALUES ('2865', '2862', '马龙县', '530321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2866', '2862', '陆良县', '530322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2867', '2862', '师宗县', '530323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2868', '2862', '罗平县', '530324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2869', '2862', '富源县', '530325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2870', '2862', '会泽县', '530326', null, '0');
INSERT INTO `lr_china_city` VALUES ('2871', '2862', '沾益县', '530328', null, '0');
INSERT INTO `lr_china_city` VALUES ('2872', '2862', '宣威市', '530381', null, '0');
INSERT INTO `lr_china_city` VALUES ('2873', '2845', '玉溪市', '530400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2875', '2873', '红塔区', '530402', null, '0');
INSERT INTO `lr_china_city` VALUES ('2876', '2873', '江川县', '530421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2877', '2873', '澄江县', '530422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2878', '2873', '通海县', '530423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2879', '2873', '华宁县', '530424', null, '0');
INSERT INTO `lr_china_city` VALUES ('2880', '2873', '易门县', '530425', null, '0');
INSERT INTO `lr_china_city` VALUES ('2881', '2873', '峨山彝族自治县', '530426', null, '0');
INSERT INTO `lr_china_city` VALUES ('2882', '2873', '新平彝族傣族自治县', '530427', null, '0');
INSERT INTO `lr_china_city` VALUES ('2883', '2873', '元江哈尼族彝族傣族自治县', '530428', null, '0');
INSERT INTO `lr_china_city` VALUES ('2884', '2845', '保山市', '530500', null, '0');
INSERT INTO `lr_china_city` VALUES ('2886', '2884', '隆阳区', '530502', null, '0');
INSERT INTO `lr_china_city` VALUES ('2887', '2884', '施甸县', '530521', null, '0');
INSERT INTO `lr_china_city` VALUES ('2888', '2884', '腾冲县', '530522', null, '0');
INSERT INTO `lr_china_city` VALUES ('2889', '2884', '龙陵县', '530523', null, '0');
INSERT INTO `lr_china_city` VALUES ('2890', '2884', '昌宁县', '530524', null, '0');
INSERT INTO `lr_china_city` VALUES ('2891', '2845', '昭通市', '530600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2893', '2891', '昭阳区', '530602', null, '0');
INSERT INTO `lr_china_city` VALUES ('2894', '2891', '鲁甸县', '530621', null, '0');
INSERT INTO `lr_china_city` VALUES ('2895', '2891', '巧家县', '530622', null, '0');
INSERT INTO `lr_china_city` VALUES ('2896', '2891', '盐津县', '530623', null, '0');
INSERT INTO `lr_china_city` VALUES ('2897', '2891', '大关县', '530624', null, '0');
INSERT INTO `lr_china_city` VALUES ('2898', '2891', '永善县', '530625', null, '0');
INSERT INTO `lr_china_city` VALUES ('2899', '2891', '绥江县', '530626', null, '0');
INSERT INTO `lr_china_city` VALUES ('2900', '2891', '镇雄县', '530627', null, '0');
INSERT INTO `lr_china_city` VALUES ('2901', '2891', '彝良县', '530628', null, '0');
INSERT INTO `lr_china_city` VALUES ('2902', '2891', '威信县', '530629', null, '0');
INSERT INTO `lr_china_city` VALUES ('2903', '2891', '水富县', '530630', null, '0');
INSERT INTO `lr_china_city` VALUES ('2904', '2845', '丽江市', '530700', null, '0');
INSERT INTO `lr_china_city` VALUES ('2906', '2904', '古城区', '530702', null, '0');
INSERT INTO `lr_china_city` VALUES ('2907', '2904', '玉龙纳西族自治县', '530721', null, '0');
INSERT INTO `lr_china_city` VALUES ('2908', '2904', '永胜县', '530722', null, '0');
INSERT INTO `lr_china_city` VALUES ('2909', '2904', '华坪县', '530723', null, '0');
INSERT INTO `lr_china_city` VALUES ('2910', '2904', '宁蒗彝族自治县', '530724', null, '0');
INSERT INTO `lr_china_city` VALUES ('2911', '2845', '普洱市', '530800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2913', '2911', '思茅区', '530802', null, '0');
INSERT INTO `lr_china_city` VALUES ('2914', '2911', '宁洱哈尼族彝族自治县', '530821', null, '0');
INSERT INTO `lr_china_city` VALUES ('2915', '2911', '墨江哈尼族自治县', '530822', null, '0');
INSERT INTO `lr_china_city` VALUES ('2916', '2911', '景东彝族自治县', '530823', null, '0');
INSERT INTO `lr_china_city` VALUES ('2917', '2911', '景谷傣族彝族自治县', '530824', null, '0');
INSERT INTO `lr_china_city` VALUES ('2918', '2911', '镇沅彝族哈尼族拉祜族自治县', '530825', null, '0');
INSERT INTO `lr_china_city` VALUES ('2919', '2911', '江城哈尼族彝族自治县', '530826', null, '0');
INSERT INTO `lr_china_city` VALUES ('2920', '2911', '孟连傣族拉祜族佤族自治县', '530827', null, '0');
INSERT INTO `lr_china_city` VALUES ('2921', '2911', '澜沧拉祜族自治县', '530828', null, '0');
INSERT INTO `lr_china_city` VALUES ('2922', '2911', '西盟佤族自治县', '530829', null, '0');
INSERT INTO `lr_china_city` VALUES ('2923', '2845', '临沧市', '530900', null, '0');
INSERT INTO `lr_china_city` VALUES ('2925', '2923', '临翔区', '530902', null, '0');
INSERT INTO `lr_china_city` VALUES ('2926', '2923', '凤庆县', '530921', null, '0');
INSERT INTO `lr_china_city` VALUES ('2927', '2923', '云县', '530922', null, '0');
INSERT INTO `lr_china_city` VALUES ('2928', '2923', '永德县', '530923', null, '0');
INSERT INTO `lr_china_city` VALUES ('2929', '2923', '镇康县', '530924', null, '0');
INSERT INTO `lr_china_city` VALUES ('2930', '2923', '双江拉祜族佤族布朗族傣族自治县', '530925', null, '0');
INSERT INTO `lr_china_city` VALUES ('2931', '2923', '耿马傣族佤族自治县', '530926', null, '0');
INSERT INTO `lr_china_city` VALUES ('2932', '2923', '沧源佤族自治县', '530927', null, '0');
INSERT INTO `lr_china_city` VALUES ('2933', '2845', '楚雄彝族自治州', '532300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2934', '2933', '楚雄市', '532301', null, '0');
INSERT INTO `lr_china_city` VALUES ('2935', '2933', '双柏县', '532322', null, '0');
INSERT INTO `lr_china_city` VALUES ('2936', '2933', '牟定县', '532323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2937', '2933', '南华县', '532324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2938', '2933', '姚安县', '532325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2939', '2933', '大姚县', '532326', null, '0');
INSERT INTO `lr_china_city` VALUES ('2940', '2933', '永仁县', '532327', null, '0');
INSERT INTO `lr_china_city` VALUES ('2941', '2933', '元谋县', '532328', null, '0');
INSERT INTO `lr_china_city` VALUES ('2942', '2933', '武定县', '532329', null, '0');
INSERT INTO `lr_china_city` VALUES ('2943', '2933', '禄丰县', '532331', null, '0');
INSERT INTO `lr_china_city` VALUES ('2944', '2845', '红河哈尼族彝族自治州', '532500', null, '0');
INSERT INTO `lr_china_city` VALUES ('2945', '2944', '个旧市', '532501', null, '0');
INSERT INTO `lr_china_city` VALUES ('2946', '2944', '开远市', '532502', null, '0');
INSERT INTO `lr_china_city` VALUES ('2947', '2944', '蒙自县', '532522', null, '0');
INSERT INTO `lr_china_city` VALUES ('2948', '2944', '屏边苗族自治县', '532523', null, '0');
INSERT INTO `lr_china_city` VALUES ('2949', '2944', '建水县', '532524', null, '0');
INSERT INTO `lr_china_city` VALUES ('2950', '2944', '石屏县', '532525', null, '0');
INSERT INTO `lr_china_city` VALUES ('2951', '2944', '弥勒县', '532526', null, '0');
INSERT INTO `lr_china_city` VALUES ('2952', '2944', '泸西县', '532527', null, '0');
INSERT INTO `lr_china_city` VALUES ('2953', '2944', '元阳县', '532528', null, '0');
INSERT INTO `lr_china_city` VALUES ('2954', '2944', '红河县', '532529', null, '0');
INSERT INTO `lr_china_city` VALUES ('2955', '2944', '金平苗族瑶族傣族自治县', '532530', null, '0');
INSERT INTO `lr_china_city` VALUES ('2956', '2944', '绿春县', '532531', null, '0');
INSERT INTO `lr_china_city` VALUES ('2957', '2944', '河口瑶族自治县', '532532', null, '0');
INSERT INTO `lr_china_city` VALUES ('2958', '2845', '文山壮族苗族自治州', '532600', null, '0');
INSERT INTO `lr_china_city` VALUES ('2959', '2958', '文山县', '532621', null, '0');
INSERT INTO `lr_china_city` VALUES ('2960', '2958', '砚山县', '532622', null, '0');
INSERT INTO `lr_china_city` VALUES ('2961', '2958', '西畴县', '532623', null, '0');
INSERT INTO `lr_china_city` VALUES ('2962', '2958', '麻栗坡县', '532624', null, '0');
INSERT INTO `lr_china_city` VALUES ('2963', '2958', '马关县', '532625', null, '0');
INSERT INTO `lr_china_city` VALUES ('2964', '2958', '丘北县', '532626', null, '0');
INSERT INTO `lr_china_city` VALUES ('2965', '2958', '广南县', '532627', null, '0');
INSERT INTO `lr_china_city` VALUES ('2966', '2958', '富宁县', '532628', null, '0');
INSERT INTO `lr_china_city` VALUES ('2967', '2845', '西双版纳傣族自治州', '532800', null, '0');
INSERT INTO `lr_china_city` VALUES ('2968', '2967', '景洪市', '532801', null, '0');
INSERT INTO `lr_china_city` VALUES ('2969', '2967', '勐海县', '532822', null, '0');
INSERT INTO `lr_china_city` VALUES ('2970', '2967', '勐腊县', '532823', null, '0');
INSERT INTO `lr_china_city` VALUES ('2971', '2845', '大理白族自治州', '532900', null, '0');
INSERT INTO `lr_china_city` VALUES ('2972', '2971', '大理市', '532901', null, '0');
INSERT INTO `lr_china_city` VALUES ('2973', '2971', '漾濞彝族自治县', '532922', null, '0');
INSERT INTO `lr_china_city` VALUES ('2974', '2971', '祥云县', '532923', null, '0');
INSERT INTO `lr_china_city` VALUES ('2975', '2971', '宾川县', '532924', null, '0');
INSERT INTO `lr_china_city` VALUES ('2976', '2971', '弥渡县', '532925', null, '0');
INSERT INTO `lr_china_city` VALUES ('2977', '2971', '南涧彝族自治县', '532926', null, '0');
INSERT INTO `lr_china_city` VALUES ('2978', '2971', '巍山彝族回族自治县', '532927', null, '0');
INSERT INTO `lr_china_city` VALUES ('2979', '2971', '永平县', '532928', null, '0');
INSERT INTO `lr_china_city` VALUES ('2980', '2971', '云龙县', '532929', null, '0');
INSERT INTO `lr_china_city` VALUES ('2981', '2971', '洱源县', '532930', null, '0');
INSERT INTO `lr_china_city` VALUES ('2982', '2971', '剑川县', '532931', null, '0');
INSERT INTO `lr_china_city` VALUES ('2983', '2971', '鹤庆县', '532932', null, '0');
INSERT INTO `lr_china_city` VALUES ('2984', '2845', '德宏傣族景颇族自治州', '533100', null, '0');
INSERT INTO `lr_china_city` VALUES ('2985', '2984', '瑞丽市', '533102', null, '0');
INSERT INTO `lr_china_city` VALUES ('2986', '2984', '潞西市', '533103', null, '0');
INSERT INTO `lr_china_city` VALUES ('2987', '2984', '梁河县', '533122', null, '0');
INSERT INTO `lr_china_city` VALUES ('2988', '2984', '盈江县', '533123', null, '0');
INSERT INTO `lr_china_city` VALUES ('2989', '2984', '陇川县', '533124', null, '0');
INSERT INTO `lr_china_city` VALUES ('2990', '2845', '怒江傈僳族自治州', '533300', null, '0');
INSERT INTO `lr_china_city` VALUES ('2991', '2990', '泸水县', '533321', null, '0');
INSERT INTO `lr_china_city` VALUES ('2992', '2990', '福贡县', '533323', null, '0');
INSERT INTO `lr_china_city` VALUES ('2993', '2990', '贡山独龙族怒族自治县', '533324', null, '0');
INSERT INTO `lr_china_city` VALUES ('2994', '2990', '兰坪白族普米族自治县', '533325', null, '0');
INSERT INTO `lr_china_city` VALUES ('2995', '2845', '迪庆藏族自治州', '533400', null, '0');
INSERT INTO `lr_china_city` VALUES ('2996', '2995', '香格里拉县', '533421', null, '0');
INSERT INTO `lr_china_city` VALUES ('2997', '2995', '德钦县', '533422', null, '0');
INSERT INTO `lr_china_city` VALUES ('2998', '2995', '维西傈僳族自治县', '533423', null, '0');
INSERT INTO `lr_china_city` VALUES ('2999', '0', '西藏自治区', '540000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3000', '2999', '拉萨市', '540100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3002', '3000', '城关区', '540102', null, '0');
INSERT INTO `lr_china_city` VALUES ('3003', '3000', '林周县', '540121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3004', '3000', '当雄县', '540122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3005', '3000', '尼木县', '540123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3006', '3000', '曲水县', '540124', null, '0');
INSERT INTO `lr_china_city` VALUES ('3007', '3000', '堆龙德庆县', '540125', null, '0');
INSERT INTO `lr_china_city` VALUES ('3008', '3000', '达孜县', '540126', null, '0');
INSERT INTO `lr_china_city` VALUES ('3009', '3000', '墨竹工卡县', '540127', null, '0');
INSERT INTO `lr_china_city` VALUES ('3010', '2999', '昌都地区', '542100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3011', '3010', '昌都县', '542121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3012', '3010', '江达县', '542122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3013', '3010', '贡觉县', '542123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3014', '3010', '类乌齐县', '542124', null, '0');
INSERT INTO `lr_china_city` VALUES ('3015', '3010', '丁青县', '542125', null, '0');
INSERT INTO `lr_china_city` VALUES ('3016', '3010', '察雅县', '542126', null, '0');
INSERT INTO `lr_china_city` VALUES ('3017', '3010', '八宿县', '542127', null, '0');
INSERT INTO `lr_china_city` VALUES ('3018', '3010', '左贡县', '542128', null, '0');
INSERT INTO `lr_china_city` VALUES ('3019', '3010', '芒康县', '542129', null, '0');
INSERT INTO `lr_china_city` VALUES ('3020', '3010', '洛隆县', '542132', null, '0');
INSERT INTO `lr_china_city` VALUES ('3021', '3010', '边坝县', '542133', null, '0');
INSERT INTO `lr_china_city` VALUES ('3022', '2999', '山南地区', '542200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3023', '3022', '乃东县', '542221', null, '0');
INSERT INTO `lr_china_city` VALUES ('3024', '3022', '扎囊县', '542222', null, '0');
INSERT INTO `lr_china_city` VALUES ('3025', '3022', '贡嘎县', '542223', null, '0');
INSERT INTO `lr_china_city` VALUES ('3026', '3022', '桑日县', '542224', null, '0');
INSERT INTO `lr_china_city` VALUES ('3027', '3022', '琼结县', '542225', null, '0');
INSERT INTO `lr_china_city` VALUES ('3028', '3022', '曲松县', '542226', null, '0');
INSERT INTO `lr_china_city` VALUES ('3029', '3022', '措美县', '542227', null, '0');
INSERT INTO `lr_china_city` VALUES ('3030', '3022', '洛扎县', '542228', null, '0');
INSERT INTO `lr_china_city` VALUES ('3031', '3022', '加查县', '542229', null, '0');
INSERT INTO `lr_china_city` VALUES ('3032', '3022', '隆子县', '542231', null, '0');
INSERT INTO `lr_china_city` VALUES ('3033', '3022', '错那县', '542232', null, '0');
INSERT INTO `lr_china_city` VALUES ('3034', '3022', '浪卡子县', '542233', null, '0');
INSERT INTO `lr_china_city` VALUES ('3035', '2999', '日喀则地区', '542300', null, '0');
INSERT INTO `lr_china_city` VALUES ('3036', '3035', '日喀则市', '542301', null, '0');
INSERT INTO `lr_china_city` VALUES ('3037', '3035', '南木林县', '542322', null, '0');
INSERT INTO `lr_china_city` VALUES ('3038', '3035', '江孜县', '542323', null, '0');
INSERT INTO `lr_china_city` VALUES ('3039', '3035', '定日县', '542324', null, '0');
INSERT INTO `lr_china_city` VALUES ('3040', '3035', '萨迦县', '542325', null, '0');
INSERT INTO `lr_china_city` VALUES ('3041', '3035', '拉孜县', '542326', null, '0');
INSERT INTO `lr_china_city` VALUES ('3042', '3035', '昂仁县', '542327', null, '0');
INSERT INTO `lr_china_city` VALUES ('3043', '3035', '谢通门县', '542328', null, '0');
INSERT INTO `lr_china_city` VALUES ('3044', '3035', '白朗县', '542329', null, '0');
INSERT INTO `lr_china_city` VALUES ('3045', '3035', '仁布县', '542330', null, '0');
INSERT INTO `lr_china_city` VALUES ('3046', '3035', '康马县', '542331', null, '0');
INSERT INTO `lr_china_city` VALUES ('3047', '3035', '定结县', '542332', null, '0');
INSERT INTO `lr_china_city` VALUES ('3048', '3035', '仲巴县', '542333', null, '0');
INSERT INTO `lr_china_city` VALUES ('3049', '3035', '亚东县', '542334', null, '0');
INSERT INTO `lr_china_city` VALUES ('3050', '3035', '吉隆县', '542335', null, '0');
INSERT INTO `lr_china_city` VALUES ('3051', '3035', '聂拉木县', '542336', null, '0');
INSERT INTO `lr_china_city` VALUES ('3052', '3035', '萨嘎县', '542337', null, '0');
INSERT INTO `lr_china_city` VALUES ('3053', '3035', '岗巴县', '542338', null, '0');
INSERT INTO `lr_china_city` VALUES ('3054', '2999', '那曲地区', '542400', null, '0');
INSERT INTO `lr_china_city` VALUES ('3055', '3054', '那曲县', '542421', null, '0');
INSERT INTO `lr_china_city` VALUES ('3056', '3054', '嘉黎县', '542422', null, '0');
INSERT INTO `lr_china_city` VALUES ('3057', '3054', '比如县', '542423', null, '0');
INSERT INTO `lr_china_city` VALUES ('3058', '3054', '聂荣县', '542424', null, '0');
INSERT INTO `lr_china_city` VALUES ('3059', '3054', '安多县', '542425', null, '0');
INSERT INTO `lr_china_city` VALUES ('3060', '3054', '申扎县', '542426', null, '0');
INSERT INTO `lr_china_city` VALUES ('3061', '3054', '索县', '542427', null, '0');
INSERT INTO `lr_china_city` VALUES ('3062', '3054', '班戈县', '542428', null, '0');
INSERT INTO `lr_china_city` VALUES ('3063', '3054', '巴青县', '542429', null, '0');
INSERT INTO `lr_china_city` VALUES ('3064', '3054', '尼玛县', '542430', null, '0');
INSERT INTO `lr_china_city` VALUES ('3065', '2999', '阿里地区', '542500', null, '0');
INSERT INTO `lr_china_city` VALUES ('3066', '3065', '普兰县', '542521', null, '0');
INSERT INTO `lr_china_city` VALUES ('3067', '3065', '札达县', '542522', null, '0');
INSERT INTO `lr_china_city` VALUES ('3068', '3065', '噶尔县', '542523', null, '0');
INSERT INTO `lr_china_city` VALUES ('3069', '3065', '日土县', '542524', null, '0');
INSERT INTO `lr_china_city` VALUES ('3070', '3065', '革吉县', '542525', null, '0');
INSERT INTO `lr_china_city` VALUES ('3071', '3065', '改则县', '542526', null, '0');
INSERT INTO `lr_china_city` VALUES ('3072', '3065', '措勤县', '542527', null, '0');
INSERT INTO `lr_china_city` VALUES ('3073', '2999', '林芝地区', '542600', null, '0');
INSERT INTO `lr_china_city` VALUES ('3074', '3073', '林芝县', '542621', null, '0');
INSERT INTO `lr_china_city` VALUES ('3075', '3073', '工布江达县', '542622', null, '0');
INSERT INTO `lr_china_city` VALUES ('3076', '3073', '米林县', '542623', null, '0');
INSERT INTO `lr_china_city` VALUES ('3077', '3073', '墨脱县', '542624', null, '0');
INSERT INTO `lr_china_city` VALUES ('3078', '3073', '波密县', '542625', null, '0');
INSERT INTO `lr_china_city` VALUES ('3079', '3073', '察隅县', '542626', null, '0');
INSERT INTO `lr_china_city` VALUES ('3080', '3073', '朗县', '542627', null, '0');
INSERT INTO `lr_china_city` VALUES ('3081', '0', '陕西省', '610000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3082', '3081', '西安市', '610100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3084', '3082', '新城区', '610102', null, '0');
INSERT INTO `lr_china_city` VALUES ('3085', '3082', '碑林区', '610103', null, '0');
INSERT INTO `lr_china_city` VALUES ('3086', '3082', '莲湖区', '610104', null, '0');
INSERT INTO `lr_china_city` VALUES ('3087', '3082', '灞桥区', '610111', null, '0');
INSERT INTO `lr_china_city` VALUES ('3088', '3082', '未央区', '610112', null, '0');
INSERT INTO `lr_china_city` VALUES ('3089', '3082', '雁塔区', '610113', null, '0');
INSERT INTO `lr_china_city` VALUES ('3090', '3082', '阎良区', '610114', null, '0');
INSERT INTO `lr_china_city` VALUES ('3091', '3082', '临潼区', '610115', null, '0');
INSERT INTO `lr_china_city` VALUES ('3092', '3082', '长安区', '610116', null, '0');
INSERT INTO `lr_china_city` VALUES ('3093', '3082', '蓝田县', '610122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3094', '3082', '周至县', '610124', null, '0');
INSERT INTO `lr_china_city` VALUES ('3095', '3082', '户县', '610125', null, '0');
INSERT INTO `lr_china_city` VALUES ('3096', '3082', '高陵县', '610126', null, '0');
INSERT INTO `lr_china_city` VALUES ('3097', '3081', '铜川市', '610200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3099', '3097', '王益区', '610202', null, '0');
INSERT INTO `lr_china_city` VALUES ('3100', '3097', '印台区', '610203', null, '0');
INSERT INTO `lr_china_city` VALUES ('3101', '3097', '耀州区', '610204', null, '0');
INSERT INTO `lr_china_city` VALUES ('3102', '3097', '宜君县', '610222', null, '0');
INSERT INTO `lr_china_city` VALUES ('3103', '3081', '宝鸡市', '610300', null, '0');
INSERT INTO `lr_china_city` VALUES ('3105', '3103', '渭滨区', '610302', null, '0');
INSERT INTO `lr_china_city` VALUES ('3106', '3103', '金台区', '610303', null, '0');
INSERT INTO `lr_china_city` VALUES ('3107', '3103', '陈仓区', '610304', null, '0');
INSERT INTO `lr_china_city` VALUES ('3108', '3103', '凤翔县', '610322', null, '0');
INSERT INTO `lr_china_city` VALUES ('3109', '3103', '岐山县', '610323', null, '0');
INSERT INTO `lr_china_city` VALUES ('3110', '3103', '扶风县', '610324', null, '0');
INSERT INTO `lr_china_city` VALUES ('3111', '3103', '眉县', '610326', null, '0');
INSERT INTO `lr_china_city` VALUES ('3112', '3103', '陇县', '610327', null, '0');
INSERT INTO `lr_china_city` VALUES ('3113', '3103', '千阳县', '610328', null, '0');
INSERT INTO `lr_china_city` VALUES ('3114', '3103', '麟游县', '610329', null, '0');
INSERT INTO `lr_china_city` VALUES ('3115', '3103', '凤县', '610330', null, '0');
INSERT INTO `lr_china_city` VALUES ('3116', '3103', '太白县', '610331', null, '0');
INSERT INTO `lr_china_city` VALUES ('3117', '3081', '咸阳市', '610400', null, '0');
INSERT INTO `lr_china_city` VALUES ('3119', '3117', '秦都区', '610402', null, '0');
INSERT INTO `lr_china_city` VALUES ('3120', '3117', '杨凌区', '610403', null, '0');
INSERT INTO `lr_china_city` VALUES ('3121', '3117', '渭城区', '610404', null, '0');
INSERT INTO `lr_china_city` VALUES ('3122', '3117', '三原县', '610422', null, '0');
INSERT INTO `lr_china_city` VALUES ('3123', '3117', '泾阳县', '610423', null, '0');
INSERT INTO `lr_china_city` VALUES ('3124', '3117', '乾县', '610424', null, '0');
INSERT INTO `lr_china_city` VALUES ('3125', '3117', '礼泉县', '610425', null, '0');
INSERT INTO `lr_china_city` VALUES ('3126', '3117', '永寿县', '610426', null, '0');
INSERT INTO `lr_china_city` VALUES ('3127', '3117', '彬县', '610427', null, '0');
INSERT INTO `lr_china_city` VALUES ('3128', '3117', '长武县', '610428', null, '0');
INSERT INTO `lr_china_city` VALUES ('3129', '3117', '旬邑县', '610429', null, '0');
INSERT INTO `lr_china_city` VALUES ('3130', '3117', '淳化县', '610430', null, '0');
INSERT INTO `lr_china_city` VALUES ('3131', '3117', '武功县', '610431', null, '0');
INSERT INTO `lr_china_city` VALUES ('3132', '3117', '兴平市', '610481', null, '0');
INSERT INTO `lr_china_city` VALUES ('3133', '3081', '渭南市', '610500', null, '0');
INSERT INTO `lr_china_city` VALUES ('3135', '3133', '临渭区', '610502', null, '0');
INSERT INTO `lr_china_city` VALUES ('3136', '3133', '华县', '610521', null, '0');
INSERT INTO `lr_china_city` VALUES ('3137', '3133', '潼关县', '610522', null, '0');
INSERT INTO `lr_china_city` VALUES ('3138', '3133', '大荔县', '610523', null, '0');
INSERT INTO `lr_china_city` VALUES ('3139', '3133', '合阳县', '610524', null, '0');
INSERT INTO `lr_china_city` VALUES ('3140', '3133', '澄城县', '610525', null, '0');
INSERT INTO `lr_china_city` VALUES ('3141', '3133', '蒲城县', '610526', null, '0');
INSERT INTO `lr_china_city` VALUES ('3142', '3133', '白水县', '610527', null, '0');
INSERT INTO `lr_china_city` VALUES ('3143', '3133', '富平县', '610528', null, '0');
INSERT INTO `lr_china_city` VALUES ('3144', '3133', '韩城市', '610581', null, '0');
INSERT INTO `lr_china_city` VALUES ('3145', '3133', '华阴市', '610582', null, '0');
INSERT INTO `lr_china_city` VALUES ('3146', '3081', '延安市', '610600', null, '0');
INSERT INTO `lr_china_city` VALUES ('3148', '3146', '宝塔区', '610602', null, '0');
INSERT INTO `lr_china_city` VALUES ('3149', '3146', '延长县', '610621', null, '0');
INSERT INTO `lr_china_city` VALUES ('3150', '3146', '延川县', '610622', null, '0');
INSERT INTO `lr_china_city` VALUES ('3151', '3146', '子长县', '610623', null, '0');
INSERT INTO `lr_china_city` VALUES ('3152', '3146', '安塞县', '610624', null, '0');
INSERT INTO `lr_china_city` VALUES ('3153', '3146', '志丹县', '610625', null, '0');
INSERT INTO `lr_china_city` VALUES ('3154', '3146', '吴起县', '610626', null, '0');
INSERT INTO `lr_china_city` VALUES ('3155', '3146', '甘泉县', '610627', null, '0');
INSERT INTO `lr_china_city` VALUES ('3156', '3146', '富县', '610628', null, '0');
INSERT INTO `lr_china_city` VALUES ('3157', '3146', '洛川县', '610629', null, '0');
INSERT INTO `lr_china_city` VALUES ('3158', '3146', '宜川县', '610630', null, '0');
INSERT INTO `lr_china_city` VALUES ('3159', '3146', '黄龙县', '610631', null, '0');
INSERT INTO `lr_china_city` VALUES ('3160', '3146', '黄陵县', '610632', null, '0');
INSERT INTO `lr_china_city` VALUES ('3161', '3081', '汉中市', '610700', null, '0');
INSERT INTO `lr_china_city` VALUES ('3163', '3161', '汉台区', '610702', null, '0');
INSERT INTO `lr_china_city` VALUES ('3164', '3161', '南郑县', '610721', null, '0');
INSERT INTO `lr_china_city` VALUES ('3165', '3161', '城固县', '610722', null, '0');
INSERT INTO `lr_china_city` VALUES ('3166', '3161', '洋县', '610723', null, '0');
INSERT INTO `lr_china_city` VALUES ('3167', '3161', '西乡县', '610724', null, '0');
INSERT INTO `lr_china_city` VALUES ('3168', '3161', '勉县', '610725', null, '0');
INSERT INTO `lr_china_city` VALUES ('3169', '3161', '宁强县', '610726', null, '0');
INSERT INTO `lr_china_city` VALUES ('3170', '3161', '略阳县', '610727', null, '0');
INSERT INTO `lr_china_city` VALUES ('3171', '3161', '镇巴县', '610728', null, '0');
INSERT INTO `lr_china_city` VALUES ('3172', '3161', '留坝县', '610729', null, '0');
INSERT INTO `lr_china_city` VALUES ('3173', '3161', '佛坪县', '610730', null, '0');
INSERT INTO `lr_china_city` VALUES ('3174', '3081', '榆林市', '610800', null, '0');
INSERT INTO `lr_china_city` VALUES ('3176', '3174', '榆阳区', '610802', null, '0');
INSERT INTO `lr_china_city` VALUES ('3177', '3174', '神木县', '610821', null, '0');
INSERT INTO `lr_china_city` VALUES ('3178', '3174', '府谷县', '610822', null, '0');
INSERT INTO `lr_china_city` VALUES ('3179', '3174', '横山县', '610823', null, '0');
INSERT INTO `lr_china_city` VALUES ('3180', '3174', '靖边县', '610824', null, '0');
INSERT INTO `lr_china_city` VALUES ('3181', '3174', '定边县', '610825', null, '0');
INSERT INTO `lr_china_city` VALUES ('3182', '3174', '绥德县', '610826', null, '0');
INSERT INTO `lr_china_city` VALUES ('3183', '3174', '米脂县', '610827', null, '0');
INSERT INTO `lr_china_city` VALUES ('3184', '3174', '佳县', '610828', null, '0');
INSERT INTO `lr_china_city` VALUES ('3185', '3174', '吴堡县', '610829', null, '0');
INSERT INTO `lr_china_city` VALUES ('3186', '3174', '清涧县', '610830', null, '0');
INSERT INTO `lr_china_city` VALUES ('3187', '3174', '子洲县', '610831', null, '0');
INSERT INTO `lr_china_city` VALUES ('3188', '3081', '安康市', '610900', null, '0');
INSERT INTO `lr_china_city` VALUES ('3190', '3188', '汉滨区', '610902', null, '0');
INSERT INTO `lr_china_city` VALUES ('3191', '3188', '汉阴县', '610921', null, '0');
INSERT INTO `lr_china_city` VALUES ('3192', '3188', '石泉县', '610922', null, '0');
INSERT INTO `lr_china_city` VALUES ('3193', '3188', '宁陕县', '610923', null, '0');
INSERT INTO `lr_china_city` VALUES ('3194', '3188', '紫阳县', '610924', null, '0');
INSERT INTO `lr_china_city` VALUES ('3195', '3188', '岚皋县', '610925', null, '0');
INSERT INTO `lr_china_city` VALUES ('3196', '3188', '平利县', '610926', null, '0');
INSERT INTO `lr_china_city` VALUES ('3197', '3188', '镇坪县', '610927', null, '0');
INSERT INTO `lr_china_city` VALUES ('3198', '3188', '旬阳县', '610928', null, '0');
INSERT INTO `lr_china_city` VALUES ('3199', '3188', '白河县', '610929', null, '0');
INSERT INTO `lr_china_city` VALUES ('3200', '3081', '商洛市', '611000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3202', '3200', '商州区', '611002', null, '0');
INSERT INTO `lr_china_city` VALUES ('3203', '3200', '洛南县', '611021', null, '0');
INSERT INTO `lr_china_city` VALUES ('3204', '3200', '丹凤县', '611022', null, '0');
INSERT INTO `lr_china_city` VALUES ('3205', '3200', '商南县', '611023', null, '0');
INSERT INTO `lr_china_city` VALUES ('3206', '3200', '山阳县', '611024', null, '0');
INSERT INTO `lr_china_city` VALUES ('3207', '3200', '镇安县', '611025', null, '0');
INSERT INTO `lr_china_city` VALUES ('3208', '3200', '柞水县', '611026', null, '0');
INSERT INTO `lr_china_city` VALUES ('3209', '0', '甘肃省', '620000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3210', '3209', '兰州市', '620100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3212', '3210', '城关区', '620102', null, '0');
INSERT INTO `lr_china_city` VALUES ('3213', '3210', '七里河区', '620103', null, '0');
INSERT INTO `lr_china_city` VALUES ('3214', '3210', '西固区', '620104', null, '0');
INSERT INTO `lr_china_city` VALUES ('3215', '3210', '安宁区', '620105', null, '0');
INSERT INTO `lr_china_city` VALUES ('3216', '3210', '红古区', '620111', null, '0');
INSERT INTO `lr_china_city` VALUES ('3217', '3210', '永登县', '620121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3218', '3210', '皋兰县', '620122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3219', '3210', '榆中县', '620123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3220', '3209', '嘉峪关市', '620200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3222', '3209', '金昌市', '620300', null, '0');
INSERT INTO `lr_china_city` VALUES ('3224', '3222', '金川区', '620302', null, '0');
INSERT INTO `lr_china_city` VALUES ('3225', '3222', '永昌县', '620321', null, '0');
INSERT INTO `lr_china_city` VALUES ('3226', '3209', '白银市', '620400', null, '0');
INSERT INTO `lr_china_city` VALUES ('3228', '3226', '白银区', '620402', null, '0');
INSERT INTO `lr_china_city` VALUES ('3229', '3226', '平川区', '620403', null, '0');
INSERT INTO `lr_china_city` VALUES ('3230', '3226', '靖远县', '620421', null, '0');
INSERT INTO `lr_china_city` VALUES ('3231', '3226', '会宁县', '620422', null, '0');
INSERT INTO `lr_china_city` VALUES ('3232', '3226', '景泰县', '620423', null, '0');
INSERT INTO `lr_china_city` VALUES ('3233', '3209', '天水市', '620500', null, '0');
INSERT INTO `lr_china_city` VALUES ('3235', '3233', '秦州区', '620502', null, '0');
INSERT INTO `lr_china_city` VALUES ('3236', '3233', '麦积区', '620503', null, '0');
INSERT INTO `lr_china_city` VALUES ('3237', '3233', '清水县', '620521', null, '0');
INSERT INTO `lr_china_city` VALUES ('3238', '3233', '秦安县', '620522', null, '0');
INSERT INTO `lr_china_city` VALUES ('3239', '3233', '甘谷县', '620523', null, '0');
INSERT INTO `lr_china_city` VALUES ('3240', '3233', '武山县', '620524', null, '0');
INSERT INTO `lr_china_city` VALUES ('3241', '3233', '张家川回族自治县', '620525', null, '0');
INSERT INTO `lr_china_city` VALUES ('3242', '3209', '武威市', '620600', null, '0');
INSERT INTO `lr_china_city` VALUES ('3244', '3242', '凉州区', '620602', null, '0');
INSERT INTO `lr_china_city` VALUES ('3245', '3242', '民勤县', '620621', null, '0');
INSERT INTO `lr_china_city` VALUES ('3246', '3242', '古浪县', '620622', null, '0');
INSERT INTO `lr_china_city` VALUES ('3247', '3242', '天祝藏族自治县', '620623', null, '0');
INSERT INTO `lr_china_city` VALUES ('3248', '3209', '张掖市', '620700', null, '0');
INSERT INTO `lr_china_city` VALUES ('3250', '3248', '甘州区', '620702', null, '0');
INSERT INTO `lr_china_city` VALUES ('3251', '3248', '肃南裕固族自治县', '620721', null, '0');
INSERT INTO `lr_china_city` VALUES ('3252', '3248', '民乐县', '620722', null, '0');
INSERT INTO `lr_china_city` VALUES ('3253', '3248', '临泽县', '620723', null, '0');
INSERT INTO `lr_china_city` VALUES ('3254', '3248', '高台县', '620724', null, '0');
INSERT INTO `lr_china_city` VALUES ('3255', '3248', '山丹县', '620725', null, '0');
INSERT INTO `lr_china_city` VALUES ('3256', '3209', '平凉市', '620800', null, '0');
INSERT INTO `lr_china_city` VALUES ('3258', '3256', '崆峒区', '620802', null, '0');
INSERT INTO `lr_china_city` VALUES ('3259', '3256', '泾川县', '620821', null, '0');
INSERT INTO `lr_china_city` VALUES ('3260', '3256', '灵台县', '620822', null, '0');
INSERT INTO `lr_china_city` VALUES ('3261', '3256', '崇信县', '620823', null, '0');
INSERT INTO `lr_china_city` VALUES ('3262', '3256', '华亭县', '620824', null, '0');
INSERT INTO `lr_china_city` VALUES ('3263', '3256', '庄浪县', '620825', null, '0');
INSERT INTO `lr_china_city` VALUES ('3264', '3256', '静宁县', '620826', null, '0');
INSERT INTO `lr_china_city` VALUES ('3265', '3209', '酒泉市', '620900', null, '0');
INSERT INTO `lr_china_city` VALUES ('3267', '3265', '肃州区', '620902', null, '0');
INSERT INTO `lr_china_city` VALUES ('3268', '3265', '金塔县', '620921', null, '0');
INSERT INTO `lr_china_city` VALUES ('3269', '3265', '瓜州县', '620922', null, '0');
INSERT INTO `lr_china_city` VALUES ('3270', '3265', '肃北蒙古族自治县', '620923', null, '0');
INSERT INTO `lr_china_city` VALUES ('3271', '3265', '阿克塞哈萨克族自治县', '620924', null, '0');
INSERT INTO `lr_china_city` VALUES ('3272', '3265', '玉门市', '620981', null, '0');
INSERT INTO `lr_china_city` VALUES ('3273', '3265', '敦煌市', '620982', null, '0');
INSERT INTO `lr_china_city` VALUES ('3274', '3209', '庆阳市', '621000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3276', '3274', '西峰区', '621002', null, '0');
INSERT INTO `lr_china_city` VALUES ('3277', '3274', '庆城县', '621021', null, '0');
INSERT INTO `lr_china_city` VALUES ('3278', '3274', '环县', '621022', null, '0');
INSERT INTO `lr_china_city` VALUES ('3279', '3274', '华池县', '621023', null, '0');
INSERT INTO `lr_china_city` VALUES ('3280', '3274', '合水县', '621024', null, '0');
INSERT INTO `lr_china_city` VALUES ('3281', '3274', '正宁县', '621025', null, '0');
INSERT INTO `lr_china_city` VALUES ('3282', '3274', '宁县', '621026', null, '0');
INSERT INTO `lr_china_city` VALUES ('3283', '3274', '镇原县', '621027', null, '0');
INSERT INTO `lr_china_city` VALUES ('3284', '3209', '定西市', '621100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3286', '3284', '安定区', '621102', null, '0');
INSERT INTO `lr_china_city` VALUES ('3287', '3284', '通渭县', '621121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3288', '3284', '陇西县', '621122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3289', '3284', '渭源县', '621123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3290', '3284', '临洮县', '621124', null, '0');
INSERT INTO `lr_china_city` VALUES ('3291', '3284', '漳县', '621125', null, '0');
INSERT INTO `lr_china_city` VALUES ('3292', '3284', '岷县', '621126', null, '0');
INSERT INTO `lr_china_city` VALUES ('3293', '3209', '陇南市', '621200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3295', '3293', '武都区', '621202', null, '0');
INSERT INTO `lr_china_city` VALUES ('3296', '3293', '成县', '621221', null, '0');
INSERT INTO `lr_china_city` VALUES ('3297', '3293', '文县', '621222', null, '0');
INSERT INTO `lr_china_city` VALUES ('3298', '3293', '宕昌县', '621223', null, '0');
INSERT INTO `lr_china_city` VALUES ('3299', '3293', '康县', '621224', null, '0');
INSERT INTO `lr_china_city` VALUES ('3300', '3293', '西和县', '621225', null, '0');
INSERT INTO `lr_china_city` VALUES ('3301', '3293', '礼县', '621226', null, '0');
INSERT INTO `lr_china_city` VALUES ('3302', '3293', '徽县', '621227', null, '0');
INSERT INTO `lr_china_city` VALUES ('3303', '3293', '两当县', '621228', null, '0');
INSERT INTO `lr_china_city` VALUES ('3304', '3209', '临夏回族自治州', '622900', null, '0');
INSERT INTO `lr_china_city` VALUES ('3305', '3304', '临夏市', '622901', null, '0');
INSERT INTO `lr_china_city` VALUES ('3306', '3304', '临夏县', '622921', null, '0');
INSERT INTO `lr_china_city` VALUES ('3307', '3304', '康乐县', '622922', null, '0');
INSERT INTO `lr_china_city` VALUES ('3308', '3304', '永靖县', '622923', null, '0');
INSERT INTO `lr_china_city` VALUES ('3309', '3304', '广河县', '622924', null, '0');
INSERT INTO `lr_china_city` VALUES ('3310', '3304', '和政县', '622925', null, '0');
INSERT INTO `lr_china_city` VALUES ('3311', '3304', '东乡族自治县', '622926', null, '0');
INSERT INTO `lr_china_city` VALUES ('3312', '3304', '积石山保安族东乡族撒拉族自治县', '622927', null, '0');
INSERT INTO `lr_china_city` VALUES ('3313', '3209', '甘南藏族自治州', '623000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3314', '3313', '合作市', '623001', null, '0');
INSERT INTO `lr_china_city` VALUES ('3315', '3313', '临潭县', '623021', null, '0');
INSERT INTO `lr_china_city` VALUES ('3316', '3313', '卓尼县', '623022', null, '0');
INSERT INTO `lr_china_city` VALUES ('3317', '3313', '舟曲县', '623023', null, '0');
INSERT INTO `lr_china_city` VALUES ('3318', '3313', '迭部县', '623024', null, '0');
INSERT INTO `lr_china_city` VALUES ('3319', '3313', '玛曲县', '623025', null, '0');
INSERT INTO `lr_china_city` VALUES ('3320', '3313', '碌曲县', '623026', null, '0');
INSERT INTO `lr_china_city` VALUES ('3321', '3313', '夏河县', '623027', null, '0');
INSERT INTO `lr_china_city` VALUES ('3322', '0', '青海省', '630000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3323', '3322', '西宁市', '630100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3325', '3323', '城东区', '630102', null, '0');
INSERT INTO `lr_china_city` VALUES ('3326', '3323', '城中区', '630103', null, '0');
INSERT INTO `lr_china_city` VALUES ('3327', '3323', '城西区', '630104', null, '0');
INSERT INTO `lr_china_city` VALUES ('3328', '3323', '城北区', '630105', null, '0');
INSERT INTO `lr_china_city` VALUES ('3329', '3323', '大通回族土族自治县', '630121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3330', '3323', '湟中县', '630122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3331', '3323', '湟源县', '630123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3332', '3322', '海东地区', '632100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3333', '3332', '平安县', '632121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3334', '3332', '民和回族土族自治县', '632122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3335', '3332', '乐都县', '632123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3336', '3332', '互助土族自治县', '632126', null, '0');
INSERT INTO `lr_china_city` VALUES ('3337', '3332', '化隆回族自治县', '632127', null, '0');
INSERT INTO `lr_china_city` VALUES ('3338', '3332', '循化撒拉族自治县', '632128', null, '0');
INSERT INTO `lr_china_city` VALUES ('3339', '3322', '海北藏族自治州', '632200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3340', '3339', '门源回族自治县', '632221', null, '0');
INSERT INTO `lr_china_city` VALUES ('3341', '3339', '祁连县', '632222', null, '0');
INSERT INTO `lr_china_city` VALUES ('3342', '3339', '海晏县', '632223', null, '0');
INSERT INTO `lr_china_city` VALUES ('3343', '3339', '刚察县', '632224', null, '0');
INSERT INTO `lr_china_city` VALUES ('3344', '3322', '黄南藏族自治州', '632300', null, '0');
INSERT INTO `lr_china_city` VALUES ('3345', '3344', '同仁县', '632321', null, '0');
INSERT INTO `lr_china_city` VALUES ('3346', '3344', '尖扎县', '632322', null, '0');
INSERT INTO `lr_china_city` VALUES ('3347', '3344', '泽库县', '632323', null, '0');
INSERT INTO `lr_china_city` VALUES ('3348', '3344', '河南蒙古族自治县', '632324', null, '0');
INSERT INTO `lr_china_city` VALUES ('3349', '3322', '海南藏族自治州', '632500', null, '0');
INSERT INTO `lr_china_city` VALUES ('3350', '3349', '共和县', '632521', null, '0');
INSERT INTO `lr_china_city` VALUES ('3351', '3349', '同德县', '632522', null, '0');
INSERT INTO `lr_china_city` VALUES ('3352', '3349', '贵德县', '632523', null, '0');
INSERT INTO `lr_china_city` VALUES ('3353', '3349', '兴海县', '632524', null, '0');
INSERT INTO `lr_china_city` VALUES ('3354', '3349', '贵南县', '632525', null, '0');
INSERT INTO `lr_china_city` VALUES ('3355', '3322', '果洛藏族自治州', '632600', null, '0');
INSERT INTO `lr_china_city` VALUES ('3356', '3355', '玛沁县', '632621', null, '0');
INSERT INTO `lr_china_city` VALUES ('3357', '3355', '班玛县', '632622', null, '0');
INSERT INTO `lr_china_city` VALUES ('3358', '3355', '甘德县', '632623', null, '0');
INSERT INTO `lr_china_city` VALUES ('3359', '3355', '达日县', '632624', null, '0');
INSERT INTO `lr_china_city` VALUES ('3360', '3355', '久治县', '632625', null, '0');
INSERT INTO `lr_china_city` VALUES ('3361', '3355', '玛多县', '632626', null, '0');
INSERT INTO `lr_china_city` VALUES ('3362', '3322', '玉树藏族自治州', '632700', null, '0');
INSERT INTO `lr_china_city` VALUES ('3363', '3362', '玉树县', '632721', null, '0');
INSERT INTO `lr_china_city` VALUES ('3364', '3362', '杂多县', '632722', null, '0');
INSERT INTO `lr_china_city` VALUES ('3365', '3362', '称多县', '632723', null, '0');
INSERT INTO `lr_china_city` VALUES ('3366', '3362', '治多县', '632724', null, '0');
INSERT INTO `lr_china_city` VALUES ('3367', '3362', '囊谦县', '632725', null, '0');
INSERT INTO `lr_china_city` VALUES ('3368', '3362', '曲麻莱县', '632726', null, '0');
INSERT INTO `lr_china_city` VALUES ('3369', '3322', '海西蒙古族藏族自治州', '632800', null, '0');
INSERT INTO `lr_china_city` VALUES ('3370', '3369', '格尔木市', '632801', null, '0');
INSERT INTO `lr_china_city` VALUES ('3371', '3369', '德令哈市', '632802', null, '0');
INSERT INTO `lr_china_city` VALUES ('3372', '3369', '乌兰县', '632821', null, '0');
INSERT INTO `lr_china_city` VALUES ('3373', '3369', '都兰县', '632822', null, '0');
INSERT INTO `lr_china_city` VALUES ('3374', '3369', '天峻县', '632823', null, '0');
INSERT INTO `lr_china_city` VALUES ('3375', '0', '宁夏回族自治区', '640000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3376', '3375', '银川市', '640100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3378', '3376', '兴庆区', '640104', null, '0');
INSERT INTO `lr_china_city` VALUES ('3379', '3376', '西夏区', '640105', null, '0');
INSERT INTO `lr_china_city` VALUES ('3380', '3376', '金凤区', '640106', null, '0');
INSERT INTO `lr_china_city` VALUES ('3381', '3376', '永宁县', '640121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3382', '3376', '贺兰县', '640122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3383', '3376', '灵武市', '640181', null, '0');
INSERT INTO `lr_china_city` VALUES ('3384', '3375', '石嘴山市', '640200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3386', '3384', '大武口区', '640202', null, '0');
INSERT INTO `lr_china_city` VALUES ('3387', '3384', '惠农区', '640205', null, '0');
INSERT INTO `lr_china_city` VALUES ('3388', '3384', '平罗县', '640221', null, '0');
INSERT INTO `lr_china_city` VALUES ('3389', '3375', '吴忠市', '640300', null, '0');
INSERT INTO `lr_china_city` VALUES ('3391', '3389', '利通区', '640302', null, '0');
INSERT INTO `lr_china_city` VALUES ('3392', '3389', '盐池县', '640323', null, '0');
INSERT INTO `lr_china_city` VALUES ('3393', '3389', '同心县', '640324', null, '0');
INSERT INTO `lr_china_city` VALUES ('3394', '3389', '青铜峡市', '640381', null, '0');
INSERT INTO `lr_china_city` VALUES ('3395', '3375', '固原市', '640400', null, '0');
INSERT INTO `lr_china_city` VALUES ('3397', '3395', '原州区', '640402', null, '0');
INSERT INTO `lr_china_city` VALUES ('3398', '3395', '西吉县', '640422', null, '0');
INSERT INTO `lr_china_city` VALUES ('3399', '3395', '隆德县', '640423', null, '0');
INSERT INTO `lr_china_city` VALUES ('3400', '3395', '泾源县', '640424', null, '0');
INSERT INTO `lr_china_city` VALUES ('3401', '3395', '彭阳县', '640425', null, '0');
INSERT INTO `lr_china_city` VALUES ('3402', '3375', '中卫市', '640500', null, '0');
INSERT INTO `lr_china_city` VALUES ('3404', '3402', '沙坡头区', '640502', null, '0');
INSERT INTO `lr_china_city` VALUES ('3405', '3402', '中宁县', '640521', null, '0');
INSERT INTO `lr_china_city` VALUES ('3406', '3402', '海原县', '640522', null, '0');
INSERT INTO `lr_china_city` VALUES ('3407', '0', '新疆维吾尔自治区', '650000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3408', '3407', '乌鲁木齐市', '650100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3410', '3408', '天山区', '650102', null, '0');
INSERT INTO `lr_china_city` VALUES ('3411', '3408', '沙依巴克区', '650103', null, '0');
INSERT INTO `lr_china_city` VALUES ('3412', '3408', '新市区', '650104', null, '0');
INSERT INTO `lr_china_city` VALUES ('3413', '3408', '水磨沟区', '650105', null, '0');
INSERT INTO `lr_china_city` VALUES ('3414', '3408', '头屯河区', '650106', null, '0');
INSERT INTO `lr_china_city` VALUES ('3415', '3408', '达坂城区', '650107', null, '0');
INSERT INTO `lr_china_city` VALUES ('3416', '3408', '米东区', '650109', null, '0');
INSERT INTO `lr_china_city` VALUES ('3417', '3408', '乌鲁木齐县', '650121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3418', '3407', '克拉玛依市', '650200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3420', '3418', '独山子区', '650202', null, '0');
INSERT INTO `lr_china_city` VALUES ('3421', '3418', '克拉玛依区', '650203', null, '0');
INSERT INTO `lr_china_city` VALUES ('3422', '3418', '白碱滩区', '650204', null, '0');
INSERT INTO `lr_china_city` VALUES ('3423', '3418', '乌尔禾区', '650205', null, '0');
INSERT INTO `lr_china_city` VALUES ('3424', '3407', '吐鲁番地区', '652100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3425', '3424', '吐鲁番市', '652101', null, '0');
INSERT INTO `lr_china_city` VALUES ('3426', '3424', '鄯善县', '652122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3427', '3424', '托克逊县', '652123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3428', '3407', '哈密地区', '652200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3429', '3428', '哈密市', '652201', null, '0');
INSERT INTO `lr_china_city` VALUES ('3430', '3428', '巴里坤哈萨克自治县', '652222', null, '0');
INSERT INTO `lr_china_city` VALUES ('3431', '3428', '伊吾县', '652223', null, '0');
INSERT INTO `lr_china_city` VALUES ('3432', '3407', '昌吉回族自治州', '652300', null, '0');
INSERT INTO `lr_china_city` VALUES ('3433', '3432', '昌吉市', '652301', null, '0');
INSERT INTO `lr_china_city` VALUES ('3434', '3432', '阜康市', '652302', null, '0');
INSERT INTO `lr_china_city` VALUES ('3435', '3432', '呼图壁县', '652323', null, '0');
INSERT INTO `lr_china_city` VALUES ('3436', '3432', '玛纳斯县', '652324', null, '0');
INSERT INTO `lr_china_city` VALUES ('3437', '3432', '奇台县', '652325', null, '0');
INSERT INTO `lr_china_city` VALUES ('3438', '3432', '吉木萨尔县', '652327', null, '0');
INSERT INTO `lr_china_city` VALUES ('3439', '3432', '木垒哈萨克自治县', '652328', null, '0');
INSERT INTO `lr_china_city` VALUES ('3440', '3407', '博尔塔拉蒙古自治州', '652700', null, '0');
INSERT INTO `lr_china_city` VALUES ('3441', '3440', '博乐市', '652701', null, '0');
INSERT INTO `lr_china_city` VALUES ('3442', '3440', '精河县', '652722', null, '0');
INSERT INTO `lr_china_city` VALUES ('3443', '3440', '温泉县', '652723', null, '0');
INSERT INTO `lr_china_city` VALUES ('3444', '3407', '巴音郭楞蒙古自治州', '652800', null, '0');
INSERT INTO `lr_china_city` VALUES ('3445', '3444', '库尔勒市', '652801', null, '0');
INSERT INTO `lr_china_city` VALUES ('3446', '3444', '轮台县', '652822', null, '0');
INSERT INTO `lr_china_city` VALUES ('3447', '3444', '尉犁县', '652823', null, '0');
INSERT INTO `lr_china_city` VALUES ('3448', '3444', '若羌县', '652824', null, '0');
INSERT INTO `lr_china_city` VALUES ('3449', '3444', '且末县', '652825', null, '0');
INSERT INTO `lr_china_city` VALUES ('3450', '3444', '焉耆回族自治县', '652826', null, '0');
INSERT INTO `lr_china_city` VALUES ('3451', '3444', '和静县', '652827', null, '0');
INSERT INTO `lr_china_city` VALUES ('3452', '3444', '和硕县', '652828', null, '0');
INSERT INTO `lr_china_city` VALUES ('3453', '3444', '博湖县', '652829', null, '0');
INSERT INTO `lr_china_city` VALUES ('3454', '3407', '阿克苏地区', '652900', null, '0');
INSERT INTO `lr_china_city` VALUES ('3455', '3454', '阿克苏市', '652901', null, '0');
INSERT INTO `lr_china_city` VALUES ('3456', '3454', '温宿县', '652922', null, '0');
INSERT INTO `lr_china_city` VALUES ('3457', '3454', '库车县', '652923', null, '0');
INSERT INTO `lr_china_city` VALUES ('3458', '3454', '沙雅县', '652924', null, '0');
INSERT INTO `lr_china_city` VALUES ('3459', '3454', '新和县', '652925', null, '0');
INSERT INTO `lr_china_city` VALUES ('3460', '3454', '拜城县', '652926', null, '0');
INSERT INTO `lr_china_city` VALUES ('3461', '3454', '乌什县', '652927', null, '0');
INSERT INTO `lr_china_city` VALUES ('3462', '3454', '阿瓦提县', '652928', null, '0');
INSERT INTO `lr_china_city` VALUES ('3463', '3454', '柯坪县', '652929', null, '0');
INSERT INTO `lr_china_city` VALUES ('3464', '3407', '克孜勒苏柯尔克孜自治州', '653000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3465', '3464', '阿图什市', '653001', null, '0');
INSERT INTO `lr_china_city` VALUES ('3466', '3464', '阿克陶县', '653022', null, '0');
INSERT INTO `lr_china_city` VALUES ('3467', '3464', '阿合奇县', '653023', null, '0');
INSERT INTO `lr_china_city` VALUES ('3468', '3464', '乌恰县', '653024', null, '0');
INSERT INTO `lr_china_city` VALUES ('3469', '3407', '喀什地区', '653100', null, '0');
INSERT INTO `lr_china_city` VALUES ('3470', '3469', '喀什市', '653101', null, '0');
INSERT INTO `lr_china_city` VALUES ('3471', '3469', '疏附县', '653121', null, '0');
INSERT INTO `lr_china_city` VALUES ('3472', '3469', '疏勒县', '653122', null, '0');
INSERT INTO `lr_china_city` VALUES ('3473', '3469', '英吉沙县', '653123', null, '0');
INSERT INTO `lr_china_city` VALUES ('3474', '3469', '泽普县', '653124', null, '0');
INSERT INTO `lr_china_city` VALUES ('3475', '3469', '莎车县', '653125', null, '0');
INSERT INTO `lr_china_city` VALUES ('3476', '3469', '叶城县', '653126', null, '0');
INSERT INTO `lr_china_city` VALUES ('3477', '3469', '麦盖提县', '653127', null, '0');
INSERT INTO `lr_china_city` VALUES ('3478', '3469', '岳普湖县', '653128', null, '0');
INSERT INTO `lr_china_city` VALUES ('3479', '3469', '伽师县', '653129', null, '0');
INSERT INTO `lr_china_city` VALUES ('3480', '3469', '巴楚县', '653130', null, '0');
INSERT INTO `lr_china_city` VALUES ('3481', '3469', '塔什库尔干塔吉克自治县', '653131', null, '0');
INSERT INTO `lr_china_city` VALUES ('3482', '3407', '和田地区', '653200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3483', '3482', '和田市', '653201', null, '0');
INSERT INTO `lr_china_city` VALUES ('3484', '3482', '和田县', '653221', null, '0');
INSERT INTO `lr_china_city` VALUES ('3485', '3482', '墨玉县', '653222', null, '0');
INSERT INTO `lr_china_city` VALUES ('3486', '3482', '皮山县', '653223', null, '0');
INSERT INTO `lr_china_city` VALUES ('3487', '3482', '洛浦县', '653224', null, '0');
INSERT INTO `lr_china_city` VALUES ('3488', '3482', '策勒县', '653225', null, '0');
INSERT INTO `lr_china_city` VALUES ('3489', '3482', '于田县', '653226', null, '0');
INSERT INTO `lr_china_city` VALUES ('3490', '3482', '民丰县', '653227', null, '0');
INSERT INTO `lr_china_city` VALUES ('3491', '3407', '伊犁哈萨克自治州', '654000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3492', '3491', '伊宁市', '654002', null, '0');
INSERT INTO `lr_china_city` VALUES ('3493', '3491', '奎屯市', '654003', null, '0');
INSERT INTO `lr_china_city` VALUES ('3494', '3491', '伊宁县', '654021', null, '0');
INSERT INTO `lr_china_city` VALUES ('3495', '3491', '察布查尔锡伯自治县', '654022', null, '0');
INSERT INTO `lr_china_city` VALUES ('3496', '3491', '霍城县', '654023', null, '0');
INSERT INTO `lr_china_city` VALUES ('3497', '3491', '巩留县', '654024', null, '0');
INSERT INTO `lr_china_city` VALUES ('3498', '3491', '新源县', '654025', null, '0');
INSERT INTO `lr_china_city` VALUES ('3499', '3491', '昭苏县', '654026', null, '0');
INSERT INTO `lr_china_city` VALUES ('3500', '3491', '特克斯县', '654027', null, '0');
INSERT INTO `lr_china_city` VALUES ('3501', '3491', '尼勒克县', '654028', null, '0');
INSERT INTO `lr_china_city` VALUES ('3502', '3407', '塔城地区', '654200', null, '0');
INSERT INTO `lr_china_city` VALUES ('3503', '3502', '塔城市', '654201', null, '0');
INSERT INTO `lr_china_city` VALUES ('3504', '3502', '乌苏市', '654202', null, '0');
INSERT INTO `lr_china_city` VALUES ('3505', '3502', '额敏县', '654221', null, '0');
INSERT INTO `lr_china_city` VALUES ('3506', '3502', '沙湾县', '654223', null, '0');
INSERT INTO `lr_china_city` VALUES ('3507', '3502', '托里县', '654224', null, '0');
INSERT INTO `lr_china_city` VALUES ('3508', '3502', '裕民县', '654225', null, '0');
INSERT INTO `lr_china_city` VALUES ('3509', '3502', '和布克赛尔蒙古自治县', '654226', null, '0');
INSERT INTO `lr_china_city` VALUES ('3510', '3407', '阿勒泰地区', '654300', null, '0');
INSERT INTO `lr_china_city` VALUES ('3511', '3510', '阿勒泰市', '654301', null, '0');
INSERT INTO `lr_china_city` VALUES ('3512', '3510', '布尔津县', '654321', null, '0');
INSERT INTO `lr_china_city` VALUES ('3513', '3510', '富蕴县', '654322', null, '0');
INSERT INTO `lr_china_city` VALUES ('3514', '3510', '福海县', '654323', null, '0');
INSERT INTO `lr_china_city` VALUES ('3515', '3510', '哈巴河县', '654324', null, '0');
INSERT INTO `lr_china_city` VALUES ('3516', '3510', '青河县', '654325', null, '0');
INSERT INTO `lr_china_city` VALUES ('3517', '3510', '吉木乃县', '654326', null, '0');
INSERT INTO `lr_china_city` VALUES ('3518', '3407', '自治区直辖县级行政区划', '659000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3519', '3518', '石河子市', '659001', null, '0');
INSERT INTO `lr_china_city` VALUES ('3520', '3518', '阿拉尔市', '659002', null, '0');
INSERT INTO `lr_china_city` VALUES ('3521', '3518', '图木舒克市', '659003', null, '0');
INSERT INTO `lr_china_city` VALUES ('3522', '3518', '五家渠市', '659004', null, '0');
INSERT INTO `lr_china_city` VALUES ('3523', '0', '台湾省', '710000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3524', '0', '香港特别行政区', '810000', null, '0');
INSERT INTO `lr_china_city` VALUES ('3525', '0', '澳门特别行政区', '820000', null, '0');

-- ----------------------------
-- Table structure for `lr_course`
-- ----------------------------
DROP TABLE IF EXISTS `lr_course`;
CREATE TABLE `lr_course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '培训课程表',
  `title` varchar(200) NOT NULL COMMENT '课程名称',
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '价格',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `intro` varchar(255) DEFAULT NULL COMMENT '简介摘要',
  `opentime` int(11) NOT NULL DEFAULT '0' COMMENT '开课时间',
  `class_hour` varchar(20) NOT NULL COMMENT '课时',
  `people` varchar(200) DEFAULT NULL COMMENT '针对人群',
  `teach_goals` varchar(200) DEFAULT NULL COMMENT '教学目的',
  `content` text COMMENT '课程介绍',
  `num` int(11) DEFAULT '0' COMMENT '报名人数',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `del` tinyint(2) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_course
-- ----------------------------
INSERT INTO `lr_course` VALUES ('1', '宠物美容班A级班', '35000.00', 'UploadFiles/course/20170523/1495528544321330.jpg', '巩固B级课程，并且加强深度与广度。顶级赛犬的护理、修剪美容、牵犬、训犬、繁殖以及怎样参加各种犬赛并获得成绩的贴心指导', '0', '3个月', '爱犬人士，想深入学习宠物美容以及创业的人士', '培养有能力胜任 宠物店美容师工作的高级人才', '&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170523/201705231635306069.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170523/201705231635401378.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/p&gt;', '0', '1495528544', '0');
INSERT INTO `lr_course` VALUES ('2', '宠物美容师C级标准班', '6600.00', 'UploadFiles/course/20170523/1495529318884886.jpg', '', '0', '4周', '爱犬人士、有意创业人群', '培养有能力胜任宠物美容师的人才', '&lt;p align=&quot;center&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:2.5;&quot;&gt;课程内容：&lt;/span&gt; &lt;/p&gt;&lt;span style=&quot;font-size:18px;line-height:2.5;&quot;&gt;&lt;/span&gt; &lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 宠物美容概论&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 宠物美容工具的使用和护理（实操）&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 常见宠物犬的日常美容护理：（实操）&lt;/span&gt; &lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 包括宠物犬的指甲修剪、脚底毛的修剪、耳朵卫生清理、腹底毛的修剪、肛门腺的清理、洗澡沐浴、毛发梳理拉直&lt;/span&gt; &lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 贵宾犬的美容造型与修剪：标准造型修剪（实操）&lt;/span&gt; &lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 贵宾犬的美容造型与修剪：宠物可爱造型修剪（实操）&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 比熊犬的美容造型与修剪（实操）&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 大型犬美容方法及注意事项（实操）&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 雪纳瑞犬的美容造型与修剪（实操）&lt;/span&gt; &lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 博美犬的美容造型与修剪（实操）&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 宠物专用SPA的原理与实操（实操）&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 全自动吹毛机的操作方法与实操（实操）&lt;/span&gt; &lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 宠物时尚创意染色与造型（实操）&lt;/span&gt; &lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 弱点加强与训练（实操）&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 犬只日常行为与训练&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 宠物店的经营与管理&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span style=&quot;font-size:18px;line-height:3;&quot;&gt;&lt;br /&gt;&lt;/span&gt; &lt;/p&gt;', '0', '1495529318', '0');
INSERT INTO `lr_course` VALUES ('3', '宠物美容师C级精修班', '11800.00', 'UploadFiles/course/20170523/1495529403812839.jpg', '', '0', '8周', '爱犬人士、及有意创业人士', '培养优秀的宠物美容师的人才', '&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170523/201705231649546783.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '1', '1495529403', '0');
INSERT INTO `lr_course` VALUES ('4', '宠物美容师B级班', '15800.00', 'UploadFiles/course/20170523/1495529783214952.jpg', '贵宾犬的赛级美容，比熊的赛级美容，大型犬的赛级美容，赛级的专业管理与训练，牵犬、包毛护毛等示范教学。着重线条及速度，为以后考取A级证书做准备', '0', '2个月', '有C级宠物美容师证的爱犬人士', '培养有能力获取宠物美容师B级，有志于宠物行业发展的人才', '&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170523/201705231656169025.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '0', '1495529783', '0');
INSERT INTO `lr_course` VALUES ('6', '宠物美容师C+B班', '21800.00', 'UploadFiles/course/20170525/1495684752521993.jpg', '工具的使用和护理，宠物美容的洗狗、拉毛、吹毛、宠物医疗与护理常识，贵宾犬的美容；比熊的美容；雪纳瑞的美容，专业赛级犬美容知识。C级线条加强，赛级贵宾PUPPY装修翦,长毛犬护理包毛，赛级犬的牵引，犬赛赛制讲解', '1496016000', '3个月', '爱犬人士，想充实宠物美容工作以及创业的人士', '培养有能力成为资深美容师的人才', '&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251159003230.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '0', '1495684752', '0');
INSERT INTO `lr_course` VALUES ('7', '宠物日系造型班', '5800.00', 'UploadFiles/course/20170525/1495684939875551.jpg', '当前最流行宠物造型修剪，及学员要求要学习的更多造型', '1496019600', '2周', '有一定宠物美容基础，想要进修学习', '培养有一定美容基础功底美容师，对宠物造型变化的多样性，独立完成宠物主人对各种造型的修剪要求，给每一只宠物都有它专属造型', '&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251202062629.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251202131145.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '0', '1495684940', '0');

-- ----------------------------
-- Table structure for `lr_fankui`
-- ----------------------------
DROP TABLE IF EXISTS `lr_fankui`;
CREATE TABLE `lr_fankui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `message` varchar(255) NOT NULL COMMENT '反馈内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_fankui
-- ----------------------------
INSERT INTO `lr_fankui` VALUES ('1', '5', '反馈测试', '1483924572');

-- ----------------------------
-- Table structure for `lr_glide`
-- ----------------------------
DROP TABLE IF EXISTS `lr_glide`;
CREATE TABLE `lr_glide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费流水表',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `top_one_id` int(11) DEFAULT NULL COMMENT '第一级',
  `top_two_id` int(11) DEFAULT NULL COMMENT '第二级',
  `top_three_id` int(11) DEFAULT NULL COMMENT '第三级',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `est_price` double(11,2) DEFAULT NULL COMMENT '预估分佣',
  `act_price` double(11,2) DEFAULT NULL COMMENT '实际分佣',
  `explain` varchar(255) DEFAULT NULL COMMENT '说明',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `status` int(11) DEFAULT '0' COMMENT '0为未提现  1为待审核  2为提现通过  3为提现驳回',
  `save_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_glide
-- ----------------------------
INSERT INTO `lr_glide` VALUES ('44', '1', null, null, null, '2018-09-29 14:40:16', '-0.01', '-0.01', '消费', null, null, '0', null);
INSERT INTO `lr_glide` VALUES ('45', '1', null, null, null, '2018-09-29 14:40:20', '1.00', '233.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', null, null, '0', null);
INSERT INTO `lr_glide` VALUES ('46', '1', null, null, null, '2018-09-29 14:40:23', '1.00', '1.00', '下级消费返佣0.00', null, null, '0', null);
INSERT INTO `lr_glide` VALUES ('47', '1', null, null, null, '2018-09-30 18:11:56', '0.00', '0.00', '消费', null, null, '0', null);
INSERT INTO `lr_glide` VALUES ('48', '2', null, null, null, '2018-09-30 18:11:56', '0.00', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', null, null, '0', null);
INSERT INTO `lr_glide` VALUES ('49', '3', null, null, null, '2018-09-30 18:11:56', '0.00', '0.00', '下级消费返佣0.00', '38', '269', '0', null);
INSERT INTO `lr_glide` VALUES ('50', '1', null, null, null, '2018-10-09 16:45:41', '-200.00', '-200.00', '消费', '38', '269', '0', null);
INSERT INTO `lr_glide` VALUES ('51', '2', null, null, null, '2018-10-09 16:45:41', '24.00', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', '38', '269', '0', null);
INSERT INTO `lr_glide` VALUES ('52', '3', null, null, null, '2018-10-09 16:45:41', '24.00', '24.00', '下级消费返佣0.00', '38', '268', '2', '2018-11-13 09:48:15');
INSERT INTO `lr_glide` VALUES ('53', '1', null, null, null, '2018-10-09 17:00:20', '-200.00', '-200.00', '消费', '38', '269', '0', null);
INSERT INTO `lr_glide` VALUES ('54', '2', null, null, null, '2018-10-09 17:00:20', '24.00', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', '38', '269', '0', null);
INSERT INTO `lr_glide` VALUES ('55', '3', null, null, null, '2018-10-09 17:00:20', '24.00', '24.00', '下级消费返佣24.00', '38', '269', '2', '2018-11-13 09:48:15');
INSERT INTO `lr_glide` VALUES ('56', '1', null, null, null, '2018-11-03 10:48:07', '-213.00', '-213.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('57', '2', null, null, null, '2018-11-03 10:48:07', '25.56', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('58', '3', null, null, null, '2018-11-03 10:48:07', '25.56', '25.56', '下级消费返佣25.56', '42', '290', '2', '2018-11-13 09:48:15');
INSERT INTO `lr_glide` VALUES ('59', '1', null, null, null, '2018-11-03 10:49:00', '-213.00', '-213.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('60', '2', null, null, null, '2018-11-03 10:49:00', '25.56', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('61', '3', null, null, null, '2018-11-03 10:49:00', '25.56', '25.56', '下级消费返佣25.56', '42', '290', '2', '2018-11-13 09:48:15');
INSERT INTO `lr_glide` VALUES ('62', '1', null, null, null, '2018-11-03 10:50:21', '-213.00', '-213.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('63', '2', null, null, null, '2018-11-03 10:50:21', '25.56', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('64', '3', null, null, null, '2018-11-03 10:50:21', '25.56', '25.56', '下级消费返佣25.56', '42', '290', '2', '2018-11-13 09:48:15');
INSERT INTO `lr_glide` VALUES ('65', '1', null, null, null, '2018-11-03 10:51:50', '-699.00', '-699.00', '消费', '42', '281', '0', null);
INSERT INTO `lr_glide` VALUES ('66', '2', null, null, null, '2018-11-03 10:51:50', '0.00', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', '42', '281', '0', null);
INSERT INTO `lr_glide` VALUES ('67', '3', null, null, null, '2018-11-03 10:51:50', '0.00', '2.00', '下级消费返佣0.00', '42', '281', '0', '2019-01-10 17:37:09');
INSERT INTO `lr_glide` VALUES ('68', '1', null, null, null, '2018-11-03 11:17:54', '-213.00', '-213.00', '消费', '40', '281', '0', null);
INSERT INTO `lr_glide` VALUES ('69', '2', null, null, null, '2018-11-03 11:17:54', '0.00', '0.00', '因超过当前会员等级最大周佣金,实际获得佣金0.00', '40', '281', '0', null);
INSERT INTO `lr_glide` VALUES ('70', '3', null, null, null, '2018-11-03 11:17:54', '0.00', '0.00', '下级消费返佣0.00', '40', '281', '0', null);
INSERT INTO `lr_glide` VALUES ('71', '1', null, null, null, '2018-11-03 11:23:25', '-699.00', '-699.00', '消费', '42', '281', '0', null);
INSERT INTO `lr_glide` VALUES ('72', '1', null, null, null, '2018-11-03 11:27:29', '-699.00', '-699.00', '消费', '42', '281', '0', null);
INSERT INTO `lr_glide` VALUES ('73', '2', null, null, null, '2018-11-13 17:59:44', '-3000.00', '-3000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('74', '3', null, null, null, '2018-11-13 17:59:45', '660.00', '660.00', '下级消费返佣660.00', '42', '290', '0', '2019-01-10 17:37:08');
INSERT INTO `lr_glide` VALUES ('75', '2', null, null, null, '2018-11-13 18:02:19', '-3000.00', '-3000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('76', '2', null, null, null, '2018-11-13 18:03:04', '-3000.00', '-3000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('77', '2', null, null, null, '2018-11-13 18:45:02', '-3000.00', '-3000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('78', '2', null, null, null, '2018-11-13 18:45:31', '-3000.00', '-3000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('79', '2', null, null, null, '2018-11-13 18:45:46', '-3000.00', '-3000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('80', '3', null, null, null, '2018-11-13 18:45:47', '660.00', '598.00', '下级消费返佣598.00', '42', '290', '0', '2019-01-10 17:37:07');
INSERT INTO `lr_glide` VALUES ('81', '2', null, null, null, '2018-11-13 18:54:42', '-1000.00', '-1000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('82', '3', null, null, null, '2018-11-13 18:54:42', '220.00', '220.00', '下级消费返佣220.00', '42', '290', '0', '2019-01-10 17:37:05');
INSERT INTO `lr_glide` VALUES ('83', '2', null, null, null, '2018-11-13 18:56:43', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('84', '3', null, null, null, '2018-11-13 18:56:43', '1320.00', '1000.00', '下级消费返佣1000.00', '42', '290', '0', '2019-01-10 17:37:04');
INSERT INTO `lr_glide` VALUES ('85', '2', null, null, null, '2018-11-13 18:57:22', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('86', '3', null, null, null, '2018-11-13 18:57:22', '1320.00', '1000.00', '下级消费返佣1000.00', '42', '290', '0', '2019-01-10 17:37:03');
INSERT INTO `lr_glide` VALUES ('87', '2', null, null, null, '2018-11-13 19:05:01', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('88', '3', null, null, null, '2018-11-13 19:05:01', '1320.00', '1000.00', '下级消费返佣1000.00', '42', '290', '0', '2019-01-10 17:37:02');
INSERT INTO `lr_glide` VALUES ('89', '2', null, null, null, '2018-11-13 19:17:25', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('90', '3', null, null, null, '2018-11-13 19:17:25', '1320.00', '500.00', '因超过当前会员等级最大周佣金,实际获得佣金500.00', '42', '290', '0', '2019-01-10 17:37:01');
INSERT INTO `lr_glide` VALUES ('91', '2', null, null, null, '2019-01-10 15:30:15', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('92', '3', null, null, null, '2019-01-10 15:30:15', '1710.00', '950.00', '下级消费返佣950.00', '42', '290', '0', '2019-01-10 17:37:00');
INSERT INTO `lr_glide` VALUES ('93', '2', null, null, null, '2019-01-10 17:32:14', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('94', '3', null, null, null, '2019-01-10 17:32:14', '1710.00', '950.00', '下级消费返佣950.00', '42', '290', '0', '2019-01-10 17:36:59');
INSERT INTO `lr_glide` VALUES ('95', '1', null, null, null, '2019-01-11 16:49:05', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('96', '2', null, null, null, '2019-01-11 16:49:05', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('97', '3', null, null, null, '2019-01-11 16:49:05', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('98', '1', null, null, null, '2019-01-11 16:52:46', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('99', '2', null, null, null, '2019-01-11 16:52:46', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('100', '3', null, null, null, '2019-01-11 16:52:46', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('101', '1', null, null, null, '2019-01-11 18:19:13', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('102', '2', null, null, null, '2019-01-11 18:19:13', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('103', '3', null, null, null, '2019-01-11 18:19:13', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('104', '1', null, null, null, '2019-01-11 18:37:26', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('105', '2', null, null, null, '2019-01-11 18:37:26', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('106', '3', null, null, null, '2019-01-11 18:37:26', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('107', '1', null, null, null, '2019-01-11 18:42:34', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('108', '2', null, null, null, '2019-01-11 18:42:34', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('109', '3', null, null, null, '2019-01-11 18:42:34', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('110', '1', null, null, null, '2019-01-11 18:46:19', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('111', '2', null, null, null, '2019-01-11 18:46:19', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('112', '3', null, null, null, '2019-01-11 18:46:19', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('113', '1', null, null, null, '2019-01-11 18:47:14', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('114', '1', null, null, null, '2019-01-11 18:47:16', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('115', '1', null, null, null, '2019-01-11 18:49:21', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('116', '1', null, null, null, '2019-01-11 18:49:55', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('117', '1', null, null, null, '2019-01-11 18:50:36', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('118', '3', null, null, null, '2019-01-11 18:50:36', '285.00', '285.00', '来自区县区域的下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('119', '2', null, null, null, '2019-01-11 18:50:36', '285.00', '285.00', '来自市区域下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('120', '1', null, null, null, '2019-01-11 18:52:06', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('121', '2', null, null, null, '2019-01-11 18:52:06', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('122', '3', null, null, null, '2019-01-11 18:52:06', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('123', '3', null, null, null, '2019-01-11 18:52:06', '285.00', '285.00', '来自区县区域的下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('124', '2', null, null, null, '2019-01-11 18:52:06', '285.00', '285.00', '来自市区域下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('125', '1', null, null, null, '2019-01-11 18:53:07', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('126', '2', null, null, null, '2019-01-11 18:53:07', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('127', '3', null, null, null, '2019-01-11 18:53:07', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('128', '3', null, null, null, '2019-01-11 18:53:07', '285.00', '285.00', '来自区县区域的下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('129', '2', null, null, null, '2019-01-11 18:53:07', '285.00', '285.00', '来自市区域下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('130', '1', null, null, null, '2019-01-11 18:56:32', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('131', '2', null, null, null, '2019-01-11 18:56:32', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('132', '3', null, null, null, '2019-01-11 18:56:32', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('133', '3', null, null, null, '2019-01-11 18:56:32', '285.00', '285.00', '来自区县区域的下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('134', '2', null, null, null, '2019-01-11 18:56:32', '285.00', '285.00', '来自市区域下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('135', '1', null, null, null, '2019-01-11 19:00:32', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('136', '2', null, null, null, '2019-01-11 19:00:32', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('137', '3', null, null, null, '2019-01-11 19:00:32', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('138', '3', null, null, null, '2019-01-11 19:00:32', '285.00', '285.00', '来自区县区域的下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('139', '2', null, null, null, '2019-01-11 19:00:32', '285.00', '285.00', '来自市区域下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('140', '1', null, null, null, '2019-01-11 19:00:34', '-6000.00', '-6000.00', '消费', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('141', '2', null, null, null, '2019-01-11 19:00:34', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('142', '3', null, null, null, '2019-01-11 19:00:34', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('143', '3', null, null, null, '2019-01-11 19:00:34', '285.00', '285.00', '来自区县区域的下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('144', '2', null, null, null, '2019-01-11 19:00:34', '285.00', '285.00', '来自市区域下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('145', '1', null, null, null, '2019-01-11 19:20:21', '-6000.00', '-6000.00', '消费6000.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('146', '2', null, null, null, '2019-01-11 19:20:21', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('147', '3', null, null, null, '2019-01-11 19:20:21', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('148', '3', null, null, null, '2019-01-11 19:20:21', '285.00', '285.00', '来自区县区域的下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('149', '2', null, null, null, '2019-01-11 19:20:21', '285.00', '285.00', '来自市区域下级消费返佣285.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('150', '1', null, null, null, '2019-01-14 11:40:32', '-6000.00', '-6000.00', '消费6000.00', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('151', '2', null, null, null, '2019-01-14 11:40:32', '1710.00', '568.10', '下级消费返佣568.10', '42', '290', '0', null);
INSERT INTO `lr_glide` VALUES ('152', '3', null, null, null, '2019-01-14 11:40:32', '1140.00', '950.00', '下级消费返佣950.00', '42', '290', '0', null);

-- ----------------------------
-- Table structure for `lr_group_joins`
-- ----------------------------
DROP TABLE IF EXISTS `lr_group_joins`;
CREATE TABLE `lr_group_joins` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团购用户信息表',
  `hid` int(11) NOT NULL DEFAULT '0' COMMENT 'hot id 团购id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `jointime` int(10) NOT NULL DEFAULT '0' COMMENT '参团时间',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0:报名中 1:待付款 2:已经生成订单 3:取消 4:过期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_group_joins
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_guanggao`
-- ----------------------------
DROP TABLE IF EXISTS `lr_guanggao`;
CREATE TABLE `lr_guanggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子页广告管理表',
  `name` varchar(20) DEFAULT NULL COMMENT '广告名称',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `sort` int(11) NOT NULL DEFAULT '0',
  `type` enum('product','news','partner','index') DEFAULT 'index' COMMENT '广告类型',
  `action` varchar(255) NOT NULL COMMENT '链接值',
  `position` tinyint(2) unsigned DEFAULT '1' COMMENT '广告位置 1首页轮播',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_guanggao
-- ----------------------------
INSERT INTO `lr_guanggao` VALUES ('2', '滚动广告图2', 'UploadFiles/adv/20170524/1495589027693993.jpg', '0', '2', '', '', '1');
INSERT INTO `lr_guanggao` VALUES ('5', '首页轮播', 'UploadFiles/adv/20170525/1495684434521009.jpg', '0', '3', '', '', '1');
INSERT INTO `lr_guanggao` VALUES ('9', '首页轮播', 'UploadFiles/adv/20170524/1495589261959572.jpg', '0', '1', '', '', '1');
INSERT INTO `lr_guanggao` VALUES ('10', '首页轮播', 'UploadFiles/adv/20170524/1495588800716222.jpg', '1493349922', '4', '', '', '1');
INSERT INTO `lr_guanggao` VALUES ('12', null, 'UploadFiles/adv/20180918/1537264103989194.jpg', '1537264103', '11', 'index', '', '1');

-- ----------------------------
-- Table structure for `lr_guige`
-- ----------------------------
DROP TABLE IF EXISTS `lr_guige`;
CREATE TABLE `lr_guige` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `pid` int(11) NOT NULL COMMENT '产品id',
  `attr_id` int(11) DEFAULT '0' COMMENT '产品属性id',
  `name` varchar(50) NOT NULL COMMENT '规格名称',
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '规格价格',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `img` varchar(100) DEFAULT NULL COMMENT '属性图片',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_guige
-- ----------------------------
INSERT INTO `lr_guige` VALUES ('1', '270', '3', '类型1', '1.00', '4', 'UploadFiles/attribute/20170426/1493200933326487.jpg', '1493200341');
INSERT INTO `lr_guige` VALUES ('2', '270', '3', '类型2', '2.00', '4', null, '1493200341');
INSERT INTO `lr_guige` VALUES ('3', '270', '4', '口味1', '3.00', '4', null, '1493200341');
INSERT INTO `lr_guige` VALUES ('4', '270', '4', '口味2', '4.00', '4', null, '1493200341');
INSERT INTO `lr_guige` VALUES ('5', '270', '6', '规格1', '0.20', '4', 'UploadFiles/attribute/20170426/1493200949147573.jpg', '1493200341');
INSERT INTO `lr_guige` VALUES ('6', '270', '6', '规格2', '0.20', '4', null, '1493200341');
INSERT INTO `lr_guige` VALUES ('7', '270', '6', '规格3', '0.20', '4', null, '1493200341');
INSERT INTO `lr_guige` VALUES ('8', '271', '1', '大一号', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('9', '271', '1', '小一号', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('10', '271', '1', '中号', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('11', '271', '1', '小号', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('12', '271', '1', '超大号', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('13', '271', '2', '红色', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('14', '271', '2', '灰色', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('15', '271', '2', '蓝色', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('16', '271', '3', '迷你型', '0.20', '2', null, '1493201823');
INSERT INTO `lr_guige` VALUES ('17', '271', '3', '儿童型', '0.20', '2', null, '1493201823');

-- ----------------------------
-- Table structure for `lr_hot`
-- ----------------------------
DROP TABLE IF EXISTS `lr_hot`;
CREATE TABLE `lr_hot` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '团购商品表',
  `pid` int(8) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `price` decimal(8,2) DEFAULT '0.00' COMMENT '价格',
  `start` int(10) DEFAULT '0' COMMENT '开团时间',
  `end` int(10) DEFAULT '0' COMMENT '结束时间',
  `addtime` int(10) DEFAULT '0' COMMENT '添加时间',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `type` int(2) DEFAULT '0',
  `amount` int(5) DEFAULT '0' COMMENT '团购 开团的数量',
  `count` int(6) DEFAULT '0' COMMENT '团购 参团人数',
  `hstatus` int(2) DEFAULT '0' COMMENT '是否被删除 1已被删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_hot
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_indeximg`
-- ----------------------------
DROP TABLE IF EXISTS `lr_indeximg`;
CREATE TABLE `lr_indeximg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类产品',
  `photo` varchar(100) NOT NULL COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_indeximg
-- ----------------------------
INSERT INTO `lr_indeximg` VALUES ('1', '0', '新闻资讯', 'UploadFiles/category/indeximg/20170626/1498465212860355.png', '1');
INSERT INTO `lr_indeximg` VALUES ('2', '0', '教学优势', 'UploadFiles/category/indeximg/20170626/1498465226783855.png', '2');
INSERT INTO `lr_indeximg` VALUES ('3', '0', '学员风采', 'UploadFiles/category/indeximg/20170626/1498465239176044.png', '3');
INSERT INTO `lr_indeximg` VALUES ('4', '0', '关于我们', 'UploadFiles/category/indeximg/20170626/1498465246720048.png', '4');

-- ----------------------------
-- Table structure for `lr_integral_record`
-- ----------------------------
DROP TABLE IF EXISTS `lr_integral_record`;
CREATE TABLE `lr_integral_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分流水表',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `price` double(11,2) DEFAULT NULL COMMENT '所用积分',
  `explain` varchar(255) DEFAULT NULL COMMENT '描述',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_integral_record
-- ----------------------------
INSERT INTO `lr_integral_record` VALUES ('3', '3', '9000.00', '下级消费返积分9000.00', '2019-01-10 15:30:15');
INSERT INTO `lr_integral_record` VALUES ('2', '3', '-2000.00', '兑换这是积分商城的产品消费2000.00积分', '2019-01-09 17:27:07');
INSERT INTO `lr_integral_record` VALUES ('4', null, '-2000.00', '兑换这是积分商城的产品消费2000.00积分', '2019-01-10 16:03:50');
INSERT INTO `lr_integral_record` VALUES ('5', '3', '-2000.00', '兑换这是积分商城的产品消费2000.00积分', '2019-01-10 16:16:54');
INSERT INTO `lr_integral_record` VALUES ('6', '3', '9000.00', '下级消费返积分9000.00', '2019-01-10 17:32:14');
INSERT INTO `lr_integral_record` VALUES ('7', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 16:49:05');
INSERT INTO `lr_integral_record` VALUES ('8', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 16:49:05');
INSERT INTO `lr_integral_record` VALUES ('9', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 16:52:46');
INSERT INTO `lr_integral_record` VALUES ('10', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 16:52:46');
INSERT INTO `lr_integral_record` VALUES ('11', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 18:19:13');
INSERT INTO `lr_integral_record` VALUES ('12', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 18:19:13');
INSERT INTO `lr_integral_record` VALUES ('13', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 18:37:26');
INSERT INTO `lr_integral_record` VALUES ('14', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 18:37:26');
INSERT INTO `lr_integral_record` VALUES ('15', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 18:42:34');
INSERT INTO `lr_integral_record` VALUES ('16', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 18:42:34');
INSERT INTO `lr_integral_record` VALUES ('17', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 18:46:19');
INSERT INTO `lr_integral_record` VALUES ('18', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 18:46:19');
INSERT INTO `lr_integral_record` VALUES ('19', '3', '1500.00', '来自区县区域的下级消费返积分1500.00', '2019-01-11 18:50:36');
INSERT INTO `lr_integral_record` VALUES ('20', '2', '1500.00', '来自市区域下级消费返积分1500.00', '2019-01-11 18:50:36');
INSERT INTO `lr_integral_record` VALUES ('21', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 18:52:06');
INSERT INTO `lr_integral_record` VALUES ('22', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 18:52:06');
INSERT INTO `lr_integral_record` VALUES ('23', '3', '1500.00', '来自区县区域的下级消费返积分1500.00', '2019-01-11 18:52:06');
INSERT INTO `lr_integral_record` VALUES ('24', '2', '1500.00', '来自市区域下级消费返积分1500.00', '2019-01-11 18:52:06');
INSERT INTO `lr_integral_record` VALUES ('25', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 18:53:07');
INSERT INTO `lr_integral_record` VALUES ('26', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 18:53:07');
INSERT INTO `lr_integral_record` VALUES ('27', '3', '1500.00', '来自区县区域的下级消费返积分1500.00', '2019-01-11 18:53:07');
INSERT INTO `lr_integral_record` VALUES ('28', '2', '1500.00', '来自市区域下级消费返积分1500.00', '2019-01-11 18:53:07');
INSERT INTO `lr_integral_record` VALUES ('29', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 18:56:32');
INSERT INTO `lr_integral_record` VALUES ('30', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 18:56:32');
INSERT INTO `lr_integral_record` VALUES ('31', '3', '1500.00', '来自区县区域的下级消费返积分1500.00', '2019-01-11 18:56:32');
INSERT INTO `lr_integral_record` VALUES ('32', '2', '1500.00', '来自市区域下级消费返积分1500.00', '2019-01-11 18:56:32');
INSERT INTO `lr_integral_record` VALUES ('33', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 19:00:32');
INSERT INTO `lr_integral_record` VALUES ('34', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 19:00:32');
INSERT INTO `lr_integral_record` VALUES ('35', '3', '1500.00', '来自区县区域的下级消费返积分1500.00', '2019-01-11 19:00:32');
INSERT INTO `lr_integral_record` VALUES ('36', '2', '1500.00', '来自市区域下级消费返积分1500.00', '2019-01-11 19:00:32');
INSERT INTO `lr_integral_record` VALUES ('37', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 19:00:34');
INSERT INTO `lr_integral_record` VALUES ('38', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 19:00:34');
INSERT INTO `lr_integral_record` VALUES ('39', '3', '1500.00', '来自区县区域的下级消费返积分1500.00', '2019-01-11 19:00:34');
INSERT INTO `lr_integral_record` VALUES ('40', '2', '1500.00', '来自市区域下级消费返积分1500.00', '2019-01-11 19:00:34');
INSERT INTO `lr_integral_record` VALUES ('41', '2', '9000.00', '下级消费返积分9000.00', '2019-01-11 19:20:21');
INSERT INTO `lr_integral_record` VALUES ('42', '3', '6000.00', '下级消费返积分6000.00', '2019-01-11 19:20:21');
INSERT INTO `lr_integral_record` VALUES ('43', '3', '1500.00', '来自区县区域的下级消费返积分1500.00', '2019-01-11 19:20:21');
INSERT INTO `lr_integral_record` VALUES ('44', '2', '1500.00', '来自市区域下级消费返积分1500.00', '2019-01-11 19:20:21');
INSERT INTO `lr_integral_record` VALUES ('45', '2', '9000.00', '下级消费返积分9000.00', '2019-01-14 11:40:32');
INSERT INTO `lr_integral_record` VALUES ('46', '3', '6000.00', '下级消费返积分6000.00', '2019-01-14 11:40:32');

-- ----------------------------
-- Table structure for `lr_integral_record_copy`
-- ----------------------------
DROP TABLE IF EXISTS `lr_integral_record_copy`;
CREATE TABLE `lr_integral_record_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分流水表',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `photo_x` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `num` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL COMMENT '所用积分',
  `save_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_integral_record_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_level`
-- ----------------------------
DROP TABLE IF EXISTS `lr_level`;
CREATE TABLE `lr_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL COMMENT '会员等级名称',
  `level_price` double(11,2) DEFAULT NULL COMMENT '会员等级所需的金额',
  `level_max_price` double(11,2) DEFAULT NULL COMMENT '会员所享受的分成额度',
  `save_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `one_order_price` double(11,2) DEFAULT NULL COMMENT '单次交易封顶额度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_level
-- ----------------------------
INSERT INTO `lr_level` VALUES ('1', '黄金会员', '598.00', '6300.00', '2019-01-11 20:10:21', '598.00');
INSERT INTO `lr_level` VALUES ('2', '白金会员', '1688.00', '18000.00', '2018-11-13 17:31:48', '1000.00');
INSERT INTO `lr_level` VALUES ('3', '钻石会员', '6987.00', '80000.00', '2018-11-13 17:31:55', '999999.00');

-- ----------------------------
-- Table structure for `lr_news`
-- ----------------------------
DROP TABLE IF EXISTS `lr_news`;
CREATE TABLE `lr_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新闻分类ID',
  `name` varchar(50) NOT NULL COMMENT '新闻标题',
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '新闻内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '发表时间',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `pinglun` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `photo` varchar(100) DEFAULT NULL COMMENT '简介图片',
  `source` varchar(20) DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_news
-- ----------------------------
INSERT INTO `lr_news` VALUES ('1', '4', '宝宝和狗狗怎么和谐相处', ' 对于一只被饲养很长时间的宠物狗来说，宝宝的到来总会让它产生各种不同的情绪', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;br /&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 对于一只被饲养很长时间的宠物狗来说，宝宝的到来总会让它产生各种不同的情绪。对于狗狗而言，宝宝是家里新来的客人，面对宝宝有些狗狗爱护有加相处下来也非常的和谐。而也有些狗狗会变得更加的淘气。那么，作为家长应该如何让宝宝和狗狗和谐相处呢？&lt;/p&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其实，从狗狗的眼中来看这个世界，它们是看不出宝宝是人类的，它们会单纯的判断宝宝就是一个新的动物。有时候当狗狗看到主人如此疼爱、关心这个新生命的时候，狗狗也不免会吃醋，慢慢地它会对宝宝产生敌意。然而，很多动物行为专家认为，只要通过一些有计划的安排和调整，宝宝和狗狗也是可以和谐相处的。&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 首先，当宠物狗待在宝宝身边的时候，请家长不要紧张着急，不要盲目的担心狗狗可能会伤害它。此时，家长应该保持冷静，你可以保持一定的距离静静地坐着，看护着它们。同时，当狗狗在宝宝身边表现非常友善的时候，你一定要奖励表扬它。&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其次，在带宝宝回家之前，最好能现将有关宝宝气味的东西，如衣服等等让狗狗闻闻。让它能提前适应，不至于突然带宝宝回家而刺激到宠物狗。同时，在宝宝熟睡的时候，你可以花些时间陪伴狗狗，做游戏玩耍都可以。当宠物狗知道你同样重视它，爱护它。&lt;br /&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 此外，宝宝与狗狗相处毕竟没有什么方法，在日常生活中，也不要让狗狗和宝宝单独相处。因为你不知道宝宝的哪种状态和行为会刺激到狗狗，所以，以防万一还是不要让狗狗和宝宝单独相处了。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '1494834322', '4', '0', '10', 'UploadFiles/news/20170525/1495705799154839.jpg', '雷米高');
INSERT INTO `lr_news` VALUES ('2', '4', '狗狗耳朵一高一低怎么回事', '狗狗的耳朵一高一低的情况并不少见，对于一只健康的宠物狗来说，应该是有一个标准的身型，健壮的身躯', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;br /&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 狗狗的耳朵一高一低的情况并不少见，对于一只健康的宠物狗来说，应该是有一个标准的身型，健壮的身躯，当然眼睛，鼻子，嘴巴，耳朵也应该标准健康。那么，狗狗的耳朵一高一低可能是怎么回事呢？&lt;/p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 有主人认为，狗狗耳朵一高一低是不是抽筋了。抽筋是扯动身体肌肉，就会导致本应该对称的两只耳朵出现不一样的情况。一高一低是比较常见的，当然能及时的处理狗狗耳朵抽筋的情况，狗狗这种耳朵一高一低的现象也能很快的消失。但是做为家长，还是应该找到狗狗耳朵抽筋的原因，然后在想办法解决。&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 有时候狗狗耳朵一高一低的情况也可能是受螨虫的影响，为了缓解耳朵的不适，狗狗会不停的摇头晃脑，对抽搐自己的耳朵。正常情况下，能及时的为宠物狗清洁耳朵内的螨虫，确保狗狗耳朵健康，那么狗狗这种耳朵一高一低的现象也可以得到解决。&lt;br /&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其实，宠物狗出现耳朵一高一低的现象，其原因是比较多。除了以上两种之外，遗传因素（天生就两只耳朵位置不一样），后天成长营养不良（缺钙等也可能导致耳朵生长不良，出现一高一低的情况），这些原因都有可能导致狗狗耳朵出现一高一低的情况。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '1494837978', '0', '0', '2', 'UploadFiles/news/20170525/1495705336855474.jpg', '雷米高');
INSERT INTO `lr_news` VALUES ('3', '1', '宠物美容包括什么内容', '所谓的宠物美容，不只是替狗儿洗澡而已，而是借着顶级的美发用品，和精湛的修剪技法为为它们遮掩体形缺失，增添美感', '&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;所谓的宠物美容，不只是替狗儿洗澡而已，而是借着顶级的美发用品，和精湛的修剪技法为为它们遮掩体形缺失，增添美感。所以美容师需要辛苦的拜师学艺、考证照、更要不断吸收新知以拥有一流的专业技艺和独到的造形设计。&lt;br /&gt;　　美容的发展缘由&lt;br /&gt;　　美容技术的起源来自于贵宾犬，最早期贵宾犬原作为担任鸟猎犬的工作，必须在树林里，矮木树丛中穿梭，而它一身浓密的卷毛很容易被树枝勾住，相当的不方便，主人为了改善这些困扰，特地将它的一身卷毛剪短，渐渐的就发展出各式各样有趣的造型来。&lt;br /&gt;　　比赛狗的造型&lt;br /&gt;　　既然将到美容，当然要说到比赛犬的造型喽！我们常常在狗种比赛时看到许多体格矫健，体态优美的参赛狗，可知道，每一只参展的犬只在国际公认上，都有针对其外观造型所制定的美容标准。&lt;br /&gt;　　例如：　　&lt;br /&gt;&amp;nbsp; 垂耳猎犬的头顶与背部的被毛要剃除，双耳与四肢、胸腹部分的披毛则要留长。&lt;br /&gt;&amp;nbsp; 雪纳瑞的背毛不可用剃的，只能用专业刮刀剥除，眉毛和胡须不仅要留长，而且要按规定适&lt;br /&gt;　　度修剪。&lt;br /&gt;　贵宾犬，幼犬有幼犬的披毛造型，成犬有成犬的造型，形态上也有多种的款式。&lt;br /&gt;　　这些都是特有的犬种所必须维持的标准造型，那短毛狗是否就不需要美容？那可错了，胡子需要修剪、肛门四周、尾巴内侧的披毛需要修饰，耳朵要清理，披毛要维持光亮，甚至有些因掉毛或皮肤问题所造成的外观上的瑕疵，还得依赖专门色料去修补哩。也就是说，每只只狗儿都有属于自己犬种造型上的要求，名犬的养成和维持可是要花费许多的心血，耐心整理和保养，才能有那光鲜亮丽的外表，可不是件简单的事呢！！&lt;br /&gt;　　居家宠物的美容&lt;br /&gt;　再来就是说到家里的那只宝贝爱狗了，一只披毛长逸及地的西施犬或马尔济斯是相当吸引人、而且是赏心悦目的。不过想将一身亮力的披毛整理的一丝不茍，可就不是一般人可做的到了。&lt;br /&gt;　像可卡及大多数的梗类，必须一直维持着那副独特的造型，因为经过刻意修剪出的漂亮外型，才是它们的迷人所在。要不然，一段长时间不修剪毛发时，外型会截然不同，可能丑的让你无法接受，就像只流浪狗一般，你可能完全分不出它的品种为何。&lt;br /&gt;　一般的宠物，可以依家人的需求或喜爱，来为它修剪出各种造型，或是嫌造型麻烦时索性剃光，但是剃光的爱犬虽然好整理，可是它所呈现的模样可能就是剪短后的那副笨拙的外观，除了属于狗儿的自身灵性外，毫无美感而言。&lt;br /&gt;　其实美容只要是整理干净，清爽，保留原有的造型即可。尽管麻烦，但是能够让你的爱犬始终光显亮丽，花点心血、花一点钱，请专门的美容师代劳，装扮的漂亮出色，作为主人的你，岂不是也能感受到那种骄傲。&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '1494838076', '0', '0', '3', 'UploadFiles/news/20170525/1495705107438290.jpg', '雷米高');
INSERT INTO `lr_news` VALUES ('4', '1', '宠物美容培训就业前景如何', ' 如果问道什么职业是目前最受欢迎的话那么想当然的要算上宠物美容培训师了，这个职业是教会那些想要学习宠物美容方面的，同时这份职业的门槛也比较低', '&lt;p style=&quot;display:float;&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 如果问道什么职业是目前最受欢迎的话那么想当然的要算上宠物美容培训师了，这个职业是教会那些想要学习宠物美容方面的，同时这份职业的门槛也比较低。&lt;br /&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 只要你对照顾宠物有一定的经验和想法那么你都可以经过系统的学习再从事。很多人都在好奇这份职业的就业前景怎么样，对此网络上也出现了不同的两种看法。一种看法就是认为宠物美容培训这份职业基本上以后就业会困难，网友给出的原因就是虽然我国的经济水平在这几年已经有了很大的发展。&lt;br /&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 但是这只是整体水平，各地的经济水平完全不同，人们如果连基本的生活都得不到保障的话那么谁还有心情饲养宠物呢？还有一种看法就是人们的享受生活的意识也在不断提高，因此人们也开始养一只宠物陪伴自己。如果出于这样的情况那么在将来这一类的宠物美容师也一定有更好的发展。&lt;br /&gt;&amp;nbsp;&lt;br /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 其实任何职业都可以说有着很好的就业前景的，宠物美容培训也是一样。哪怕从事的人再多只要你有着更为勤奋、认真的态度那么老板迟早都是会赏识你的，要知道金子在哪里都是会发光的。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '1494842317', '1', '0', '4', 'UploadFiles/news/20170525/1495704945258293.jpg', '雷米高');
INSERT INTO `lr_news` VALUES ('5', '3', '职教联盟，送教到校', '职教联盟，送教到校', '&lt;div align=&quot;center&quot;&gt;&lt;br /&gt;&lt;br /&gt;匠人匠心，技能筑梦&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;br /&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251143032190.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;center&quot;&gt;茂名市交通高级技工学校第八届技能节今天已经完满结束。&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251143434366.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;center&quot;&gt;雷米高宠物美容师学校携着匠人匠心的精神送教到校&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251144109576.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;&lt;div align=&quot;center&quot;&gt;为宠物美容行业培养更多优秀人才&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251144363160.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;秉承&amp;quot;雷米高之心、待宠如亲&amp;quot;的服务理念，积极宏扬科学养宠的宠物文化&lt;br /&gt;&lt;br /&gt;&lt;div align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251145019718.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;p style=&quot;text-align:center;&quot;&gt;帮助更多宠物行业受好者找到自己的职业发展方向&lt;/p&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;&lt;br /&gt;&lt;/div&gt;', '1494842586', '5', '0', '5', 'UploadFiles/news/20170525/1495706012512654.jpg', '雷米高');
INSERT INTO `lr_news` VALUES ('6', '3', ' 广州6月不平凡，雷米高宠物美容师学校助你冲刺CKU', '广州6月不平凡，雷米高宠物美容师学校助你冲刺CKU，CKU考前培训招生中', '&lt;p align=&quot;center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;广州6月不平凡，雷米高宠物美容师学校助你冲刺CKU，CKU考前培训招生中&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;color:#6B6C6E;font-family:微软雅黑;font-size:24px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;color:#3E3E3E;line-height:20.8px;background-color:#FFFFFF;&quot;&gt;CKU宠物美容师鉴定考将于6月23日在广州举行，届时数百名宠物美容师将会同场竞技，&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;color:#6B6C6E;font-family:微软雅黑;font-size:24px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;color:#3E3E3E;line-height:20.8px;background-color:#FFFFFF;&quot;&gt;接受审核，争取专业美容师的荣誉。&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color:#6B6C6E;font-family:微软雅黑;font-size:24px;text-align:center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#000000;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#3E3E3E;font-size:16px;line-height:20.8px;background-color:#FFFFFF;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;line-height:20.8px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;line-height:20.8px;&quot;&gt;CKU宠物美容师鉴定考考前培训&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;选择雷米高宠物美容师学校&amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color:#6B6C6E;font-family:微软雅黑;font-size:24px;text-align:center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;color:#000000;&quot;&gt;&lt;strong&gt;&amp;nbsp;&lt;strong&gt;&lt;span style=&quot;font-size:18px;color:#000000;&quot;&gt;高通过率 是你信心的保证&lt;/span&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251117132616.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251118016641.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '1494842820', '14', '0', '6', 'UploadFiles/news/20170525/1495682319721593.png', '雷米高');
INSERT INTO `lr_news` VALUES ('7', '6', '如何开一家成功的宠物店', '你想做信用的，你想做高质量的，你想做好售后口碑的，你想永续经营的，我们来一起完成这个梦想，请你加入我们的团队，一起成功', '&lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;一&amp;nbsp;、开设一家宠物店，它的营收来自4大板块：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、宠物销售，&lt;/strong&gt;最会赚钱的项目，也是最赔钱的项目，更是不好做信用的项目；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、美容收入，&lt;/strong&gt;是最容易保本的项目，也是最辛苦的项目，做好的关键在专业技术水平；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、用品销售，&lt;/strong&gt;前两项做好了，用品销售自然好，最大问题在库存；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、寄养收入，&lt;/strong&gt;最容易赚钱的项目，也是会出现最不好处理问题的项目。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;二、一个完整宠物店的10大系统：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、&lt;/strong&gt;定位及选址：定位不清楚，店就不知选在哪里？如何装修？花费多少？&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、&lt;/strong&gt;每日的清洁卫生和防疫：整洁卫生是每日随时要做的，规划不好，耗时耗力效果差。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、&lt;/strong&gt;宠物狗的进货：狗的进货，有两个灶门，这是大部分业主无法突破的，一年365天，天天要有高质量的狗（质量越高，数量越小，质量越高，越难买到。二是所有卖给客户的狗，都不会有狗瘟和细小，能突破这两个灶门，才能做出你的品牌，才能不用与同行比价格。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、&lt;/strong&gt;喂养：30日龄的狗如何喂养，生病的狗如何喂养，大病初愈的狗如何喂养，如何喂养出健康的狗？&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;5、&lt;/strong&gt;宠物护理：宠物店要解决90%的皮肤病、呼吸道及消化道的疾病问题，做不好，会损失很多盈利。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;6、&lt;/strong&gt;美容：美容师的不稳定，技术的落差，造成生意的落差，这是美容室生意比较难解决的问题，美容室有一个很好赚钱的地方就是治疗皮肤病。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;7、&lt;/strong&gt;用品进货：宠物用品的货，不下千项，如何进货，不造成你的压货。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;8、&lt;/strong&gt;寄养：你知道什么狗不能收寄养？你知道因为收了寄养，让宠物店蒙受了惨重损失。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;9、&lt;/strong&gt;销售及管理：你知道你一个月赚多少吗？如何做好进货表，销货表，日报表、月报表（那一切很简单，因为我们是个体户）&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;10、&lt;/strong&gt;销售技巧（业务能力）：你具备了专业知识吗？你懂销售心理学吗？如何天天卖狗，如何一天售出七八条狗，销售技巧你准备好了吗？&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;三、欢迎加入我们&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;你想做信用的，你想做高质量的，你想做好售后口碑的，你想永续经营的，我们来一起完成这个梦想，请你加入我们的团队，一起成功！&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:黑体;&quot;&gt;加入我们团队的好处：&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、&lt;/strong&gt;有完整的规划性（生意定位、选址、开业、运营策划、促销、品牌等等）&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、&lt;/strong&gt;有完整的教育性（业主的教育进入特训，帮忙完成业主的培训和美容师的培训或者美容师的调度资源。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、&lt;/strong&gt;有完整的支持性（自己品牌及旗下单位的支持，让加盟商享受低收费，高档的宠物健康保障服务）。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、&lt;/strong&gt;有完整的进货性（尤其是高质量的狗，一个月内对狗瘟和细小的保证，让业主也可给客户一个月的保证）。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;5、&lt;/strong&gt;有完整的库存回收性（卖不动的狗和用品，可换货）&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;6、&lt;/strong&gt;有完整的销售企划性（不定时的企划案，可以全面的推动，众志成城，胜过业主的单打独斗，呵呵，不成功也难！&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;因为加入我们的团队，有品牌性，有团队性，不用经验学好了，店的名声可能做臭了，不用花费不当的钱，造成资金周转不善，不会因为小店经营，而人手困难，不用组织进货的困难而造成成本增加，开店当老板，想必人人喜欢，但要当一个成功的老板，未必人人能够达到，而我们用一个团队的力量，来一起实现。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-family:黑体;font-size:18px;&quot;&gt;&lt;strong&gt;四、国内宠物业者的经营困境概况&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;1、&lt;/strong&gt;狗的品质和来源不稳定，健康没保证，客户抱怨，疲于奔命。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;2、&lt;/strong&gt;没有经验就开宠物店，拿客人来当实验，经验学到了，名声也做臭了。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;3、&lt;/strong&gt;店主事事须亲力亲为，造成长期的劳累，但结果呢，店越做，人越少，获利少，业主越做心越小，客人越来越少，后来业主无心经营；&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;4、&lt;/strong&gt;不当进货，造成资金周转困难，旧狗卖不动，新狗进不来。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;5、&lt;/strong&gt;招不到人才，留不住人才，待遇和工作环境、发展和前途，都留不到人的，久而久之，放弃了这个生意。&lt;/span&gt;&lt;/p&gt; &lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;70%的单打独斗的宠物店，营业不会坚持两年，为什么，就是因为上述原因。通过加入我们，我们就会有另一片天，不断发展，越做越省心。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;LINE-HEIGHT: 2&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;br /&gt;&lt;/span&gt;&lt;/p&gt;', '1495705587', '0', '0', '3', 'UploadFiles/news/20170525/1495705587677525.jpg', '雷米高');

-- ----------------------------
-- Table structure for `lr_news_cat`
-- ----------------------------
DROP TABLE IF EXISTS `lr_news_cat`;
CREATE TABLE `lr_news_cat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻分类表',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_news_cat
-- ----------------------------
INSERT INTO `lr_news_cat` VALUES ('1', '行业资讯', '1494582033');
INSERT INTO `lr_news_cat` VALUES ('4', '宠物百科', '1494839440');
INSERT INTO `lr_news_cat` VALUES ('3', '最新动态', '1494839412');
INSERT INTO `lr_news_cat` VALUES ('5', '开班信息', '1494839454');
INSERT INTO `lr_news_cat` VALUES ('6', '开店秘籍', '1495531391');

-- ----------------------------
-- Table structure for `lr_notice`
-- ----------------------------
DROP TABLE IF EXISTS `lr_notice`;
CREATE TABLE `lr_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页通知',
  `title` varchar(255) DEFAULT NULL COMMENT '通知的消息',
  `url` varchar(255) DEFAULT NULL COMMENT '通知的链接',
  `is_nav` int(11) DEFAULT '1' COMMENT '是否显示 1为显示 2为不显示',
  `srot` int(11) DEFAULT NULL COMMENT '排序',
  `save_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_notice
-- ----------------------------
INSERT INTO `lr_notice` VALUES ('1', '今晚八点半,长江电影院....', null, '2', null, null, null);
INSERT INTO `lr_notice` VALUES ('2', '今晚八点半,长江电影院....', null, '1', null, null, null);

-- ----------------------------
-- Table structure for `lr_order`
-- ----------------------------
DROP TABLE IF EXISTS `lr_order`;
CREATE TABLE `lr_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `pay_sn` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `amount` decimal(9,2) DEFAULT '0.00' COMMENT '优惠后价格',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '购买时间',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `type` enum('weixin','alipay','cash') DEFAULT 'weixin' COMMENT '支付方式',
  `price_h` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '真实支付金额',
  `status` tinyint(2) NOT NULL DEFAULT '10' COMMENT ' 订单状态{0,已取消10未付款 20待发货 30待收货 31顾客已自取 32暂时不发货 40待评价50交易完成51交易关闭  ',
  `vid` int(11) DEFAULT '0' COMMENT '优惠券ID',
  `receiver` varchar(15) NOT NULL COMMENT '收货人',
  `tel` char(15) NOT NULL COMMENT '联系方式',
  `address_xq` varchar(50) NOT NULL COMMENT '地址详情',
  `code` int(11) NOT NULL COMMENT '邮编',
  `post` int(11) DEFAULT NULL COMMENT '快递ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '买家留言',
  `post_remark` varchar(255) NOT NULL COMMENT '邮费信息',
  `product_num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '微信交易单号',
  `kuaidi_name` varchar(10) DEFAULT NULL COMMENT '快递名称',
  `kuaidi_num` varchar(20) DEFAULT NULL COMMENT '运单号',
  `back` enum('1','2','0') DEFAULT '0' COMMENT '标识客户是否有发起退款1申请退款 2已退款',
  `back_remark` varchar(255) DEFAULT NULL COMMENT '退款原因',
  `back_addtime` int(11) DEFAULT '0' COMMENT '申请退款时间',
  `order_type` tinyint(2) DEFAULT '1' COMMENT '订单类型 1普通订单 2抢购订单',
  `wx_trade_no` varchar(255) DEFAULT NULL COMMENT '微信支付回调的参数',
  `is_comment` int(11) DEFAULT '1' COMMENT '是否已评论',
  `pay_time` varchar(255) DEFAULT NULL COMMENT '支付时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_order
-- ----------------------------
INSERT INTO `lr_order` VALUES ('1', '2527542452', '242542563653', '1', '1', '20.00', '20.00', '1493342432', '1', 'weixin', '200.00', '20', '0', 'eer', '13454565656', '问问投入法国恢复大飞哥', '0', null, null, '', '1', null, null, null, '2', '朔方南街', '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('2', '2017050810256495', null, '0', '1', '0.10', '0.10', '1494212943', '0', 'weixin', '0.00', '20', '0', '小程序', '13422334455', '吉林省 白山市 江源区 胜多负少的想法地方小高层上大学非常棒', '220605', '0', 'aaaa', '', '1', null, '顺丰快递', '43214321423', '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('3', '2017051010257975', null, '39', '1', '114.50', '0.00', '1494408303', '0', 'weixin', '0.00', '30', '2', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', '0', '测试', '', '14', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('4', '2017052556525397', null, '48', '1', '9.00', '9.00', '1495710472', '0', 'weixin', '0.00', '30', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', '0', '哈哈', '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('5', '2017052652101575', null, '0', '1', '470.00', '470.00', '1495782164', '0', 'weixin', '0.00', '40', '0', '小小', '13455882266', '浙江省 丽水市 莲都区 什么街道什么路什么号什么附近', '331102', '0', '235', '', '2', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('6', '20180920101226955697', null, '0', '1', '174.00', '174.00', '1538204895', '0', 'weixin', '174.00', '40', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '9000', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('7', '20180920101543646817', null, '0', '1', '174.00', '174.00', '1538204895', '0', 'weixin', '174.00', '50', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '9000', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('17', '20180920111852205661', null, '0', '1', '586.00', '586.00', '1537413532', '0', 'weixin', '586.00', '50', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '3', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('18', '20180920111907866955', null, '0', '1', '586.00', '586.00', '1537413547', '0', 'weixin', '0.01', '50', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '3', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('19', '20180920115334445629', null, '0', '1', '174.00', '174.00', '1537415614', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('20', '20180920161051305307', null, '0', '1', '174.00', '174.00', '1537431051', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('21', '20180920161211485620', null, '0', '1', '174.00', '174.00', '1537431131', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('22', '20180920161247425497', null, '0', '1', '174.00', '174.00', '1537431167', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('23', '20180920161304603887', null, '0', '1', '174.00', '174.00', '1537431184', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('24', '20180920161348280230', null, '0', '1', '174.00', '174.00', '1527431228', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('25', '20180920161404651568', null, '0', '1', '174.00', '174.00', '1537431244', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('26', '20180920161428677880', null, '0', '3', '174.00', '174.00', '1537431268', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('27', '20180920161436100109', null, '0', '3', '174.00', '174.00', '1537431276', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('28', '20180920161440426678', null, '0', '3', '174.00', '174.00', '1537431280', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('29', '20180920161552515173', null, '0', '3', '174.00', '174.00', '1537431352', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('30', '20180920161718941690', null, '0', '3', '174.00', '174.00', '1537431438', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('31', '20180920161755443899', null, '0', '3', '174.00', '174.00', '1537431475', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('32', '20180920162052860473', null, '0', '3', '174.00', '174.00', '1537431652', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('33', '20180920162303190087', null, '0', '2', '174.00', '174.00', '1537431783', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('34', '20180920162609832376', null, '0', '2', '174.00', '174.00', '1537431969', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('35', '20180920162709325247', null, '0', '2', '174.00', '174.00', '1537432029', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('36', '20180920163306888214', null, '0', '2', '174.00', '174.00', '1537432386', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('37', '20180920163454831442', null, '0', '2', '174.00', '174.00', '1537432494', '0', 'weixin', '174.00', '10', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('38', '20180920163704627426', null, '0', '2', '174.00', '174.00', '1537432624', '0', 'weixin', '174.00', '50', '0', '传承', '13699887744', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', null, null, '', '1', null, null, null, '0', null, '1493344432', '1', null, null, '1493344432', null);
INSERT INTO `lr_order` VALUES ('39', '20181009215205878298', null, '0', '1', '213.00', '213.00', '1539093125', '0', 'weixin', '213.00', '10', '0', 'fgd ', '11', '北京市 东城区 21sdfasd fs', '123232', null, null, '', '1', null, null, null, '0', null, '0', '1', null, '1', '1539093125', null);
INSERT INTO `lr_order` VALUES ('40', '20181009215653296243', null, '0', '1', '213.00', '213.00', '1539093413', '0', 'weixin', '213.00', '10', '0', 'fgd ', '11', '北京市 东城区 21sdfasd fs', '123232', null, null, '', '1', null, null, null, '0', null, '0', '1', null, '1', '1539093413', null);
INSERT INTO `lr_order` VALUES ('41', '20181009215657459527', null, '0', '1', '213.00', '213.00', '1539093417', '0', 'weixin', '213.00', '10', '0', 'fgd ', '11', '北京市 东城区 21sdfasd fs', '123232', null, null, '', '1', null, '测试室快递', '23424324234234', '0', null, '0', '1', null, '1', '1539093417', null);
INSERT INTO `lr_order` VALUES ('42', '20181009215702852096', null, '0', '1', '1000.00', '213.00', '1539093422', '0', 'weixin', '6000.00', '31', '0', 'fgd ', '11', '北京市 东城区 21sdfasd fs', '123232', '27', null, '', '3', null, '让他g', '4 发给好', '0', null, '0', '1', null, '1', '1539093422', '');
INSERT INTO `lr_order` VALUES ('43', '20190110160350610671', null, '0', '3', '2000.00', '2000.00', '1547107430', '0', 'weixin', '2000.00', '20', '0', '发', '放到', '北京市 东城区 舒服点', '0', '36', null, '', '1', null, null, null, '0', null, '0', '1', null, '1', null, null);
INSERT INTO `lr_order` VALUES ('44', '20190110161654878683', null, '0', '3', '2000.00', '2000.00', '1547108214', '0', 'weixin', '2000.00', '20', '0', '发', '放到', '北京市 东城区 舒服点', '0', '36', null, '', '1', null, null, null, '0', null, '0', '1', null, '1', null, null);

-- ----------------------------
-- Table structure for `lr_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `lr_order_product`;
CREATE TABLE `lr_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品信息表',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `pay_sn` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `photo_x` varchar(100) DEFAULT NULL COMMENT '商品图',
  `pro_buff` varchar(255) DEFAULT NULL COMMENT '产品属性',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  `pro_guige` varchar(50) NOT NULL DEFAULT '' COMMENT '规格id和规格名称',
  `order_sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_order_product
-- ----------------------------
INSERT INTO `lr_order_product` VALUES ('1', '2', '242542563653', '1', '发表差别v', '20.00', 'UploadFiles/product/20170428/1493342431423135.jpg', null, '1493342432', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('2', '277', null, '2', '抢购产品设置测试这里是标题', '0.10', 'UploadFiles/product/20170506/1494037725840566.jpg', null, '1494212943', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('3', '272', null, '3', '不是开心果 胜似开心果', '2.00', 'UploadFiles/product/20170508/1494231242827074.jpg', '', '1494408303', '6', '', null);
INSERT INTO `lr_order_product` VALUES ('4', '274', null, '3', '给自己一个惊喜，给世界一个惊喜', '15.00', 'UploadFiles/product/20170428/1493342431423135.jpg', '', '1494408303', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('5', '269', null, '3', '国外进口 还是熟悉的饼干味', '12.50', 'UploadFiles/product/20170508/1494231776498205.jpg', '', '1494408303', '7', '', null);
INSERT INTO `lr_order_product` VALUES ('6', '264', null, '4', '过去，平淡无奇；而未来，却多姿多彩', '9.00', 'UploadFiles/product/20170508/1494234169630484.jpg', '', '1495710472', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('7', '269', null, '5', '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇20kg 金毛狗粮', '235.00', 'UploadFiles/product/20170526/1495777671397934.jpg', '', '1495782164', '2', '', null);
INSERT INTO `lr_order_product` VALUES ('15', '269', null, '38', '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇20kg 金毛狗粮', '235.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('16', '0', null, '37', '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇20kg 金毛狗粮', '12.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('17', '0', null, '36', '国外进口 还是熟悉的饼干味', '2.00', 'UploadFiles/product/20170526/1495777671397934.jpgUploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('18', '0', null, '35', '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇20kg 金毛狗粮', '3.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('19', '0', null, '34', '国外进口 还是熟悉的饼干味', '4.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('20', '0', null, '33', '国外进口 还是熟悉的饼干味', '5.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('21', '0', null, '32', '国外进口 还是熟悉的饼干味', '12.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('22', '0', null, '31', '给自己一个惊喜，给世界一个惊喜', '6.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('23', '0', null, '30', '给自己一个惊喜，给世界一个惊喜', '34.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('24', '0', null, '29', '给自己一个惊喜，给世界一个惊喜', '56.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('25', '0', null, '28', '给自己一个惊喜，给世界一个惊喜', '6.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('26', '0', null, '27', '给自己一个惊喜，给世界一个惊喜', '56.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('27', '0', null, '26', '给自己一个惊喜，给世界一个惊喜', '77.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('28', '0', null, '25', '给自己一个惊喜，给世界一个惊喜', '765.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('29', '0', null, '24', '给自己一个惊喜，给世界一个惊喜', '342.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('30', '0', null, '23', '给自己一个惊喜，给世界一个惊喜', '23.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('31', '0', null, '22', '给自己一个惊喜，给世界一个惊喜', '0.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('32', '0', null, '21', '给自己一个惊喜，给世界一个惊喜', '2323.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('33', '0', null, '20', '给自己一个惊喜，给世界一个惊喜', '32.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('34', '0', null, '19', '给自己一个惊喜，给世界一个惊喜', '332.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('35', '279', null, '18', '给自己一个惊喜，给世界一个惊喜', '3.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('36', '0', null, '17', '给自己一个惊喜，给世界一个惊喜', '23.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '0', '1', '', null);
INSERT INTO `lr_order_product` VALUES ('37', '290', null, '39', '测试', '213.00', 'UploadFiles/product/20180912/1536745681568246.jpg', null, '1539093125', '1', '', '201810092152058782989508');
INSERT INTO `lr_order_product` VALUES ('38', '290', null, '40', '测试', '213.00', 'UploadFiles/product/20180912/1536745681568246.jpg', null, '1539093413', '1', '', '201810092156532962432821');
INSERT INTO `lr_order_product` VALUES ('39', '290', null, '41', '测试', '213.00', 'UploadFiles/product/20180912/1536745681568246.jpg', null, '1539093417', '1', '', '201810092156574595275808');
INSERT INTO `lr_order_product` VALUES ('40', '290', null, '42', '测试', '213.00', 'UploadFiles/product/20180912/1536745681568246.jpg', null, '1539093422', '1', '', '201810092157028520965522');
INSERT INTO `lr_order_product` VALUES ('41', '0', null, '43', '手动阀阿斯顿发送到发', '32.00', 'UploadFiles/product/20170526/1495777671397934.jpg', null, '1539093422', '1', '', '201810092157028520965522');
INSERT INTO `lr_order_product` VALUES ('42', '295', null, '44', '这是积分商城的产品', '2000.00', 'UploadFiles/product/20190108/1546947104627573.jpg', null, '1547108214', '1', '', '201901101616548786834712');

-- ----------------------------
-- Table structure for `lr_post`
-- ----------------------------
DROP TABLE IF EXISTS `lr_post`;
CREATE TABLE `lr_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流快递表',
  `name` varchar(20) NOT NULL COMMENT '快递名称',
  `price` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '价格',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `price_max` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '满多少包邮',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_post
-- ----------------------------
INSERT INTO `lr_post` VALUES ('1', '顺丰快递（满388包邮）', '12', '0', '388', '0');
INSERT INTO `lr_post` VALUES ('2', 'EMS', '22', '0', '0', '0');
INSERT INTO `lr_post` VALUES ('3', '顺丰生鲜', '0', '0', '0', '44');

-- ----------------------------
-- Table structure for `lr_product`
-- ----------------------------
DROP TABLE IF EXISTS `lr_product`;
CREATE TABLE `lr_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺id',
  `brand_id` int(11) unsigned DEFAULT NULL COMMENT '品牌ID',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `intro` varchar(100) DEFAULT NULL COMMENT '广告语',
  `pro_number` varchar(100) DEFAULT NULL COMMENT '产品编号',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `price_yh` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `price_jf` int(11) NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `photo_x` varchar(100) DEFAULT NULL COMMENT '小图',
  `photo_d` varchar(100) DEFAULT NULL COMMENT '大图',
  `photo_string` text COMMENT '图片组',
  `content` text COMMENT '商品详情',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NOT NULL COMMENT '修改时间',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `renqi` int(11) NOT NULL DEFAULT '0' COMMENT '人气',
  `shiyong` int(11) NOT NULL DEFAULT '0' COMMENT '购买数',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐 1推荐  0不推荐',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `del_time` int(10) DEFAULT '0' COMMENT '删除时间',
  `pro_buff` varchar(255) DEFAULT NULL COMMENT '产品属性',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `company` char(10) DEFAULT NULL COMMENT '单位',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否新品',
  `is_down` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '下架状态',
  `is_hot` tinyint(1) unsigned DEFAULT '0' COMMENT '是否热卖',
  `is_sale` tinyint(1) DEFAULT '0' COMMENT '是否折扣',
  `start_time` int(11) DEFAULT '0' COMMENT '抢购开始时间',
  `end_time` int(11) unsigned DEFAULT '0' COMMENT '抢购结束时间',
  `pro_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '产品类型 1普通 2抢购产品',
  `maid_one` int(11) DEFAULT '0' COMMENT '第一级白银分成',
  `maid_two` int(11) DEFAULT '0' COMMENT '第二级黄金分成',
  `maid_three` int(11) DEFAULT '0' COMMENT '第三级钻石分成',
  `shop_type` int(11) DEFAULT '1' COMMENT '所属商城',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_product
-- ----------------------------
INSERT INTO `lr_product` VALUES ('264', '0', '6', '雷米高新澳丽得猫粮海洋鱼味英国短毛折耳猫猫粮去毛球幼猫粮500g', '雷米高新澳丽得猫粮海洋鱼味英国短毛折耳猫猫粮去毛球幼猫粮500g', '90066013', '19.00', '13.00', '6', 'UploadFiles/product/20170526/1495762229304939.jpg', 'UploadFiles/product/20170526/1495762231681695.jpg', ',UploadFiles/product/20170526/1495762739695509.jpg,UploadFiles/product/20170526/1495762740619202.jpg,UploadFiles/product/20170526/1495762740388968.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260937453721.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260937564020.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938113668.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938319655.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938402220.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260938487013.jpg\" alt=\"\" width=\"100%\" />', '1478742144', '1495762739', '0', '889', '32', '90000', '1', '1', '1498824033', null, '15', '500g', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('265', '0', '4', '狗狗沐浴露宠物专业护理香波八合一泰迪金毛比熊犬猫抑菌除臭止痒', '天然滋养 全效护理 美毛护毛留香 狗狗沐浴露宠物专业护理香波八合一', 'ft011004025', '59.00', '37.90', '18', 'UploadFiles/product/20170526/1495771391625836.jpg', 'UploadFiles/product/20170526/1495771392693529.jpg', ',UploadFiles/product/20170526/1495771392559257.jpg,UploadFiles/product/20170526/1495771392113053.jpg,UploadFiles/product/20170526/1495771392237398.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201254306.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201359239.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201427312.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261201534401.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202054250.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202238139.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202429482.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202519517.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261202583892.jpg\" alt=\"\" width=\"100%\" />', '1478742214', '1495771390', '0', '123', '3234', '10000', '1', '1', '1498824042', null, '9', '件', '1', '0', '0', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('268', '0', '1', '雷米高 狗狗牛奶粉 宠物奶粉泰迪 贵宾幼犬奶粉 营养小狗牛奶粉', '强化奶粉 增强抵抗力 营养易吸收 雷米高 狗狗牛奶粉', 'ft01105010', '113.00', '45.00', '22', 'UploadFiles/product/20170526/1495767947517514.jpg', 'UploadFiles/product/20170526/1495767950396434.jpg', ',UploadFiles/product/20170526/1495767950543783.jpg,UploadFiles/product/20170526/1495767950281402.jpg,UploadFiles/product/20170526/1495767950778504.jpg,UploadFiles/product/20170526/1495767950531297.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261104046491.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261104198889.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261104477209.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261105027640.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261105132624.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261105255578.jpg\" alt=\"\" width=\"100%\" />', '1479720083', '1495767947', '0', '600', '3434', '10000', '0', '1', '1498824052', null, '5', '件', '0', '0', '1', '0', '0', '0', '1', '12', '13', '14', '1');
INSERT INTO `lr_product` VALUES ('269', '0', '2', '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇20kg 金毛狗粮', '雷米高狗粮成犬 澳宝 德牧边牧苏牧阿拉斯加哈士奇 警犬用粮澳洲原料20省包邮', '无', '586.00', '235.00', '117', 'UploadFiles/product/20170526/1495777671397934.jpg', 'UploadFiles/product/20170526/1495777677874266.jpg', ',UploadFiles/product/20170526/1495777678397043.jpg,UploadFiles/product/20170526/1495777678489070.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261346118808.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261346435207.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261346536153.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261347048671.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261347256898.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261347327676.jpg\" alt=\"\" width=\"100%\" />', '1479891357', '1495777671', '0', '800', '1412', '99998', '1', '1', '1498824024', null, '8', '20000g', '1', '0', '1', '0', '0', '0', '1', '10', '15', '16', '1');
INSERT INTO `lr_product` VALUES ('270', '0', '3', '本地测试产品（勿拍，不发货）', '本地测试产品（勿拍，不发货）', 'SCC1212', '0.30', '0.01', '0', 'UploadFiles/product/20170526/1495778290121085.jpg', 'UploadFiles/product/20170526/1495778296990190.jpg', ',UploadFiles/product/20170526/1495778296780911.jpg', '本地测试产品（勿拍，不发货）', '1482053270', '1495778290', '0', '0', '643', '1000', '0', '1', '1498824062', '3,4,6', '14', '件', '0', '0', '0', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('271', '0', '4', '雷米高宠物沐浴露狗狗沐浴露 除蚤用品 猫洗澡香波400ml包邮26省', '雷米高宠物沐浴露狗狗沐浴露 除蚤用品 猫洗澡香波400ml包邮26省', 'ft011004001', '45.00', '21.00', '10', 'UploadFiles/product/20170526/1495763622406793.jpg', 'UploadFiles/product/20170526/1495763625265531.jpg', ',UploadFiles/product/20170526/1495763626202044.jpg,UploadFiles/product/20170526/1495763626400295.jpg,UploadFiles/product/20170526/1495763626684997.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260952099310.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260952354111.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260952529620.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260953098394.jpg\" alt=\"\" width=\"100%\" />', '1482053708', '1495763621', '0', '0', '1231', '7000', '0', '1', '1498824072', '1,2,3', '17', '件', '0', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('272', '0', '1', '雷米高狗狗钙片 补钙营养品维力克200片 幼犬猫宠物钙片 26省包邮', '补钙快 易吸收 全效乳钙 促生长 雷米高狗狗钙片 补钙 保健', 'ft011050004', '91.00', '37.00', '18', 'UploadFiles/product/20170526/1495766526146777.jpg', 'UploadFiles/product/20170526/1495766532856705.jpg', ',UploadFiles/product/20170526/1495766532718395.jpg,UploadFiles/product/20170526/1495766532649462.jpg,UploadFiles/product/20170526/1495766532515891.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261039494648.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261040081674.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261040265180.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261040578912.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261041089338.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261041168305.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261041238984.jpg\" alt=\"\" width=\"100%\" />', '1482216408', '1495766526', '0', '142', '923', '20000', '1', '1', '1498824082', '', '16', '件', '0', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('273', '0', '1', '雷米高狗零食高钙磨牙除口臭饼干500g狗狗饼干泰迪宠物零食', '雷米高狗零食高钙磨牙除口臭饼干500g狗狗饼干泰迪宠物零食', '2017010602', '30.00', '15.00', '7', 'UploadFiles/product/20170526/1495770206696360.jpg', 'UploadFiles/product/20170526/1495770218907047.jpg', ',UploadFiles/product/20170526/1495770218888408.jpg,UploadFiles/product/20170526/1495770218135820.jpg,UploadFiles/product/20170526/1495770218928706.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261141577345.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142167605.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142257662.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142347287.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142442978.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261142554691.png\" alt=\"\" width=\"100%\" />', '1482309559', '1495770206', '0', '450', '132412', '30', '0', '1', '1498824092', '', '13', '件', '0', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('274', '0', '2', '雷米高澳宝狗粮幼犬天然牛肉味通用型狗粮泰迪金毛博美比熊小型犬', '雷米高澳宝狗粮幼犬天然牛肉味通用型狗粮泰迪金毛博美比熊小型犬', '无', '31.00', '14.00', '7', 'UploadFiles/product/20170526/1495765398905975.jpg', 'UploadFiles/product/20170526/1495765405182645.jpg', ',UploadFiles/product/20170526/1495765405320796.jpg,UploadFiles/product/20170526/1495765405245042.jpg,UploadFiles/product/20170526/1495765405106585.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261020427148.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261020546632.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021072904.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021202061.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021333901.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261021509876.jpg\" alt=\"\" width=\"100%\" />', '1493342432', '1495765397', '0', '55', '1312', '90000', '1', '1', '1498824102', null, '8', '500g', '0', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('278', '0', '5', '雷米高 赛极号功能粮天然幼猫怀孕母猫粮挑嘴猫咪主粮包邮1.5kg', '天然配方粮适口性极佳营养精调理肠胃 赛极号功能粮天然幼猫怀孕母猫粮', '2014101604', '237.00', '95.00', '47', 'UploadFiles/product/20170526/1495764457604174.jpg', 'UploadFiles/product/20170526/1495764459217869.jpg', ',UploadFiles/product/20170526/1495764459711428.jpg,UploadFiles/product/20170526/1495764459287197.jpg,UploadFiles/product/20170526/1495764459704689.jpg', '<img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261006399451.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261006547530.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261007112668.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705261007232470.jpg\" alt=\"\" width=\"100%\" />', '1494295901', '1495764457', '0', '100', '42', '90000', '0', '0', '0', null, '15', '1500g', '0', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('279', '0', '6', '贵宾狗粮E冠雷米高狗粮成犬泰迪狗粮小型犬天然粮2.5kg包邮', '贵宾狗粮E冠雷米高狗粮成犬泰迪狗粮小型犬天然粮2.5kg包邮', '1021132', '174.00', '72.00', '36', 'UploadFiles/product/20170526/1495760445110489.jpg', 'UploadFiles/product/20170526/1495760448234038.jpg', ',UploadFiles/product/20170526/1495760448897946.jpg,UploadFiles/product/20170526/1495760448281318.jpg,UploadFiles/product/20170526/1495760448437075.jpg', '<p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858018112.jpg\" alt=\"\" width=\"100%\" /></p><p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858299679.jpg\" alt=\"\" width=\"100%\" /></p><p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858381787.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260858548953.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260859056212.jpg\" alt=\"\" width=\"100%\" /><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170526/201705260859168125.jpg\" alt=\"\" width=\"100%\" /></p><p><br /></p><p><br /></p>', '1494296286', '1495760445', '441', '119', '321', '9000', '1', '0', '0', null, '8', '2500g', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('280', '0', '3', '测试产品', '哈哈哈瞄瞄上', '110903', '1000.00', '0.01', '200', 'UploadFiles/product/20170629/1498732885604290.jpg', 'UploadFiles/product/20170629/1498732885249312.jpg', ',UploadFiles/product/20170629/1498732885225811.jpg,UploadFiles/product/20170629/1498732885753626.jpg,UploadFiles/product/20170629/1498732886562046.jpg', '互联网', '1498732886', '1498732885', '0', '100', '42', '999999', '0', '1', '1498824015', null, '8', '只', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('281', '0', '7', 'Xiaomi/小米 红米手机4A ', '超长待机超薄迷你学生机智能机老人机', '110903', '699.00', '599.00', '599', 'UploadFiles/product/20170630/1498820794749927.jpg', 'UploadFiles/product/20170630/1498820794117920.jpg', ',UploadFiles/product/20170630/1498820794813219.jpg', '<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2UOBZeTAKh1JjSZFDXXbKlFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB29Ih5vbtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2wm0tztFopuFjSZFHXXbSlXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2z.suzhtmpuFjSZFqXXbHFpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2_w2evmJjpuFjy0FdXXXmoFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2c1UqfSvHfKJjSZFPXXbttpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB28dXIvbXlpuFjSszfXXcSGXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2PR0AzEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2seaLXbdvt1JjSZFuXXXG0FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2TqpQztRopuFjSZFtXXcanpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2m84AzEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2AapczstnpuFjSZFKXXalFFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2e73YzkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fVxPvgxlpuFjSszgXXcJdpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2RkWHcjm2.eBjSZFtXXX56VXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kFfMbNmI.eBjy0FlXXbgkVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2viKLcheK.eBjSZFuXXcT4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2nsGHcgCN.eBjSZFoXXXj0FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2dDCJcfSM.eBjSZFNXXbgYpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2t2ODcX5N.eBjSZFKXXX_QVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2_CSFcmiK.eBjSZFsXXbxZpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2WryAcduO.eBjSZFCXXXULFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2N14_auNOdeFjSZFBXXctzXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2WlWLccCO.eBjSZFzXXaRiVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2F_WDciGO.eBjSZFEXXcy9VXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2kK8_auNOdeFjSZFBXXctzXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2ZUCsclyN.eBjSZFIXXXbUVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB27ECsclyN.eBjSZFIXXXbUVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px;\">商品系统中“规格参数”由系统自动生成，实际参数请以详情页面中描述为准<img alt=\"\" width=\"100%\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fsWHc3hJc1FjSZFDXXbvnFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 10px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" /></span></span></span></p>', '1498820794', '1498820794', '0', '0', '2324', '999999', '1', '0', '0', null, '15', '台', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('282', '0', '4', 'Xiaomi/小米 小米笔记本AIR ', '12.5英寸 M3 4G 256G 超薄电脑游戏本', '78045380', '3899.00', '3899.00', '3899', 'UploadFiles/product/20170630/1498820925308628.jpg', 'UploadFiles/product/20170630/1498820926851847.jpg', ',UploadFiles/product/20170630/1498820926923500.jpg', '<img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2pghejHRkpuFjSspmXXc.9XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2zCkJjrBkpuFjy1zkXXbSpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lLs_jC0jpuFjy0FlXXc0bpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2PPX8lstnpuFjSZFvXXbcTpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2zjQMfhRDOuFjSZFzXXcIipXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2ZohvlxtmpuFjSZFqXXbHFpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2IIhTlxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2sq8UlstnpuFjSZFKXXalFFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2MW8UlstnpuFjSZFKXXalFFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2v.Oolr4npuFjSZFmXXXl4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB20_j6pdhvOuFjSZFBXXcZgFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2x7lyvstnpuFjSZFvXXbcTpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2Ru4jjMJlpuFjSspjXXcT.pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Rll7lEhnpuFjSZFEXXX0PFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hstTlxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB21GM7jrtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2UqM7jwxlpuFjSszbXXcSVpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28WQ7jrtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB29OkYjwxlpuFjSszgXXcJdpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2ynUTjxXkpuFjy0FiXXbUfFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB22vdjjMJlpuFjSspjXXcT.pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br />', '1498820926', '1498820925', '0', '900', '242', '999999', '0', '0', '0', null, '9', '台', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('283', '0', '3', '小米路由器 ', 'Pro智能无线千兆网口家用稳定穿墙四天线高速wifi路由', '4343143f', '499.00', '499.00', '499', 'UploadFiles/product/20170630/1498823086228577.jpg', 'UploadFiles/product/20170630/1498823086133085.jpg', ',UploadFiles/product/20170630/1498823086145540.jpg', '<br /><br /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28gdCgbplpuFjSspiXXcdfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB25kVHgbRkpuFjSspmXXc.9XXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hBxngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kJF0gmJjpuFjy0FdXXXmoFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2B7RrgbFlpuFjy0FgXXbRBVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2is4mghXkpuFjy0FiXXbUfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2IRFngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2fL4jgmBjpuFjSsplXXa5MVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2T.XuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2VMluhxBmpuFjSZFDXXXD8pXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2DzJghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2jU8Fhr4npuFjSZFmXXXl4FXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2qEluhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2URtthxxmpuFjSZFNXXXrRXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2cMFthstnpuFjSZFvXXbcTpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2Fmw2hhtmpuFjSZFqXXbHFpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2yztBhrxmpuFjSZJiXXXauVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2hntzhC8mpuFjSZFMXXaxpVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2MupthrlmpuFjSZFlXXbdQXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB27z4ghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Kv4JhxlmpuFjSZPfXXc9iXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2bD3QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2PldthtRopuFjSZFtXXcanpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2yg01b5C9MuFjSZFoXXbUzFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2uD7QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2eTxuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2Ubxfgg0kpuFjSspdXXX4YXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hHdNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lgBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2EMBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2eYhNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Mh4Ggl8lpuFjSspaXXXJKpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2SKo8f3JkpuFjSszcXXXfsFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /><div style=\"top: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28gdCgbplpuFjSspiXXcdfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB25kVHgbRkpuFjSspmXXc.9XXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hBxngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kJF0gmJjpuFjy0FdXXXmoFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2B7RrgbFlpuFjy0FgXXbRBVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2is4mghXkpuFjy0FiXXbUfFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2IRFngl0lpuFjSszdXXcdxFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2fL4jgmBjpuFjSsplXXa5MVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2T.XuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2VMluhxBmpuFjSZFDXXXD8pXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2DzJghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2jU8Fhr4npuFjSZFmXXXl4FXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2qEluhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2URtthxxmpuFjSZFNXXXrRXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2cMFthstnpuFjSZFvXXbcTpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2Fmw2hhtmpuFjSZFqXXbHFpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2yztBhrxmpuFjSZJiXXXauVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2hntzhC8mpuFjSZFMXXaxpVXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2MupthrlmpuFjSZFlXXbdQXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB27z4ghxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Kv4JhxlmpuFjSZPfXXc9iXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2bD3QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2PldthtRopuFjSZFtXXcanpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2yg01b5C9MuFjSZFoXXbUzFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2uD7QhkqvpuFjSZFhXXaOgXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2eTxuhxhmpuFjSZFyXXcLdFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2Ubxfgg0kpuFjSspdXXX4YXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2hHdNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lgBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2EMBGgl0kpuFjSsppXXcGTXXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2eYhNgbFkpuFjy1XcXXclapXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Mh4Ggl8lpuFjSspaXXXJKpXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2SKo8f3JkpuFjSszcXXXfsFXa-1714128138.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /></div>', '1498823086', '1498823086', '0', '0', '242', '999999', '0', '0', '0', null, '5', '台', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('284', '0', '7', 'Xiaomi/小米 小米手机5c ', '4g松果芯片超薄迷你智能拍照学生手机', '1299', '1299.00', '1299.00', '1299', 'UploadFiles/product/20170630/1498823358368715.jpg', 'UploadFiles/product/20170630/1498823358298522.jpg', ',UploadFiles/product/20170630/1498823358651873.jpg', '<img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2sGPTg00opuFjSZFxXXaDNVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2LXA1fHRkpuFjSspmXXc.9XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2VXUtbyC9MuFjSZFoXXbUzFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2T4MMfSxjpuFjSszeXXaeMVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2gaP6g9FmpuFjSZFrXXayOXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB285.DfSBjpuFjSsplXXa5MVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2BPnkg7qvpuFjSZFhXXaOgXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2o1.FfR0kpuFjSsziXXa.oVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2oOALfMxlpuFjSszgXXcJdpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB28mEVfHVkpuFjSspcXXbSMVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2jUAYfR0kpuFjy1XaXXaFkVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2ODoPfMRkpuFjy1zeXXc.6FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2pdZCfMNlpuFjy0FfXXX3CpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fgISfHtlpuFjSspoXXbcDpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2X3AkgY4npuFjSZFmXXXl4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2lgAkgY4npuFjSZFmXXXl4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2vi68g.hnpuFjSZFEXXX0PFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2oZv5g0FopuFjSZFHXXbSlXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB24vLCg0BopuFjSZPcXXc9EpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2qIb8g5RnpuFjSZFCXXX2DXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2nN4of9JjpuFjy0FdXXXmoFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2NTP.g4BmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2NY7RfStkpuFjy0FhXXXQzFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2ExU8fR0kpuFjy1XaXXaFkVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2ZplXmYlmpuFjSZFlXXbdQXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2PXJbm4BmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2G5sjkHplpuFjSspiXXcdfFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2dZUwkR8lpuFjy0FnXXcZyXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2JOBKhyC9MuFjSZFoXXbUzFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br />', '1498823358', '1498823358', '0', '299', '43', '999999', '0', '0', '0', null, '8', '台', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('285', '0', '7', 'Xiaomi/小米 小米手机6 ', '全网通 四曲面机身变焦双摄拍照智能手机', '100fdsa', '3199.00', '3199.00', '100', 'UploadFiles/product/20170630/1498823546796301.jpg', 'UploadFiles/product/20170630/1498823547542774.jpg', ',UploadFiles/product/20170630/1498823547229972.jpg', '<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2vS9moNBmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB25DQbmmxjpuFjSszeXXaeMVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2oF0AoNtmpuFjSZFqXXbHFpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2FTamoNBmpuFjSZFDXXXD8pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2CyOeoUdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2WISjoOlnpuFjSZFgXXbi7FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2ksGhoNxmpuFjSZFNXXXrRXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2t_v0jetTMeFjSZFOXXaTiVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2p0pUoSVmpuFjSZFFXXcZApXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2M8GhoUhnpuFjSZFEXXX0PFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB23lmeoOpnpuFjSZFIXXXh2VXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2HMUFmb8kpuFjy0FcXXaUhpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2RbHJmmXlpuFjy0FeXXcJbFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2iY.pmgFkpuFjSspnXXb4qFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2NpcimbJkpuFjy1zcXXa5FFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB24Ucwml8lpuFjSspaXXXJKpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2QpvTmhdkpuFjy0FbXXaNnpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2kYXyeH_0UKFjy1XaXXbKfXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB29GxdmwxlpuFjy0FoXXa.lXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2TJGzoS8mpuFjSZFMXXaxpVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><br style=\"margin: 0px; padding: 0px;\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2rUCKoUlnpuFjSZFjXXXTaVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2WPZRortlpuFjSspfXXXLUpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2AVK3rrBmpuFjSZFAXXaQ0pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2VfxboMxlpuFjSszbXXcSVpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p>', '1498823547', '1498823546', '0', '33', '4545', '999999', '0', '0', '0', null, '15', '台', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('286', '0', '7', 'Xiaomi/小米 小米手机5S ', '64G 超薄迷你智能指纹解锁拍照学生手机', '432143214', '1999.00', '1999.00', '1999', 'UploadFiles/product/20170630/1498823755863174.jpg', 'UploadFiles/product/20170630/1498823755285774.jpg', ',UploadFiles/product/20170630/1498823755795695.jpg', '<p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB24ibfzCVmpuFjSZFFXXcZApXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2RYMHbY1J.eBjy1zeXXX9kVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2GasEcEOO.eBjSZFLXXcxmXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2L2ICb4aJ.eBjSsziXXaJ_XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB27csIcCiK.eBjSZFyXXaS4pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2uWkAcA1M.eBjSZFFXXc3vVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2uPICcA5M.eBjSZFrXXXPgVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB265zUcOKO.eBjSZPhXXXqcpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2UH4va4Rzc1FjSZFPXXcGAFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2AKTMcxaK.eBjSZFAXXczFXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img alt=\"\" width=\"100%\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2GdXddmiJ.eBjSspoXXcpMFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2PnE_c91I.eBjy0FjXXabfXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB278bZcBaM.eBjSZFMXXcypVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2LF_ScwCN.eBjSZFoXXXj0FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2Qb6NcxaK.eBjSZFwXXXjsFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB26TLKcEWO.eBjSZPcXXbopVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2tmTNcpOP.eBjSZFHXXXQnpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2OLYUcvSM.eBjSZFNXXbgYpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2m8_NcByN.eBjSZFgXXXmGXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2l9ZYcp5N.eBjSZFmXXboSXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2DQDTbYWJ.eBjSspdXXXiXFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB29L6Zb4eJ.eBjy1zdXXXfmFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB27bbZb31I.eBjSszeXXc2hpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p><p style=\"margin: 1.12em 0px; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2iF_0l3NlpuFjy0FfXXX3CpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2kGY9lY0kpuFjy0FjXXcBbVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\" alt=\"\" width=\"100%\" /></p>', '1498823755', '1498823754', '0', '199', '423', '999999', '0', '0', '0', null, '15', '台', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('287', '0', '4', 'Xiaomi/小米 小米笔记本AIR ', '12.5英寸 i5 8G 256G便携电脑轻薄本', '431543654', '4799.00', '4799.00', '100', 'UploadFiles/product/20170630/1498823891591969.jpg', 'UploadFiles/product/20170630/1498823891539731.jpg', ',UploadFiles/product/20170630/1498823891947929.jpg', '<br /><br /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2o1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2P1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2kwGApHRkpuFjSspmXXc.9XXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2KONMpNdkpuFjy0FbXXaNnpXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2OExRXcPRfKJjSZFOXXbKEVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB28ZxApRNkpuFjy0FaXXbRCVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2HVGRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2nFKRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2slW2sJFopuFjSZFHXXbSlXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2aiS7sORnpuFjSZFCXXX2DXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /><div style=\"top: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2o1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2P1zxpMxlpuFjy0FoXXa.lXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2kwGApHRkpuFjSspmXXc.9XXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2KONMpNdkpuFjy0FbXXaNnpXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2OExRXcPRfKJjSZFOXXbKEVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB28ZxApRNkpuFjy0FaXXbRCVXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2HVGRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2nFKRsItnpuFjSZFKXXalFFXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2slW2sJFopuFjSZFHXXbSlXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2aiS7sORnpuFjSZFCXXX2DXXa-1714128138.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br /></div>', '1498823892', '1498823891', '0', '199', '45', '999999', '0', '0', '0', null, '9', '台', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('288', '0', '6', '小米无线鼠标', '女生办公家用笔记本电脑游戏便携迷你鼠标', '100342', '64.00', '65.00', '100', 'UploadFiles/product/20170630/1498823998129871.jpg', 'UploadFiles/product/20170630/1498823998992272.jpg', ',UploadFiles/product/20170630/1498823999249234.jpg', '<img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2.Q9klrBnpuFjSZFGXXX51pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2XZ9QlyRnpuFjSZFCXXX2DXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2Fha2lrBmpuFjSZFuXXaG_XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2o79MlEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2t0FwfxRDOuFjSZFzXXcIipXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2GRaMlEdnpuFjSZPhXXbChpXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2fhm2lrBmpuFjSZFuXXaG_XXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2mLa0lCFmpuFjSZFrXXayOXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2J.KRlylnpuFjSZFgXXbi7FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB28n5ClxBmpuFjSZFsXXcXpFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2RG8XjMJkpuFjSszcXXXfsFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px;\" alt=\"\" width=\"100%\" /><br />', '1498823999', '1498823998', '0', '100', '4545', '999999', '0', '0', '0', null, '17', '只', '1', '0', '1', '0', '0', '0', '1', null, null, null, '1');
INSERT INTO `lr_product` VALUES ('290', '0', null, '测试', '测试', '01111', '1000.00', '1000.00', '1000', 'UploadFiles/product/20180912/1536745681568246.jpg', 'UploadFiles/product/20180912/1536745681656939.jpg', ',UploadFiles/product/20180928/1538135896255413.jpg', '发地方个梵蒂冈发鬼地方个df', '1536745681', '1538136002', '0', '133', '4', '999999', '1', '0', '0', null, '0', '次', '1', '0', '1', '0', '0', '0', '1', '22', '22', '22', '1');
INSERT INTO `lr_product` VALUES ('292', '0', null, '122222', '22222', '222', '23222.00', '222.00', '222', null, null, null, '', '1539738240', '1539738240', '0', '0', '1176', '999999', '0', '0', '0', null, '0', '223', '0', '0', '0', '0', '0', '0', '1', '22', '22', '22', '1');
INSERT INTO `lr_product` VALUES ('293', '0', null, '这是一个黄金商城的产品', '这是一个黄金商城的产品', '123', '200.00', '149.00', '0', 'UploadFiles/product/20190108/1546915649951079.png', 'UploadFiles/product/20190108/1546915649661776.png', ',UploadFiles/product/20190108/1546915649578482.jpg', '打发说不定发生的发生的发生的发生的发生的发生的发生的发生的发生的发生的发', '1546915649', '1546916865', '0', '0', '1237', '999999', '0', '0', '0', null, '0', '个', '1', '0', '1', '0', '0', '0', '1', '0', '0', '0', '4');
INSERT INTO `lr_product` VALUES ('294', '0', null, '这是黄金商城的商品', '这是黄金商城的商品', '22', '200.00', '100.00', '0', 'UploadFiles/product/20190108/1546947018800547.jpg', 'UploadFiles/product/20190108/1546947018644141.jpg', ',UploadFiles/product/20190108/1546947018352468.jpg', '大发送到发生的发送的', '1546947018', '1546947018', '0', '0', '1267', '999999', '0', '0', '0', null, '0', '个', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '2');
INSERT INTO `lr_product` VALUES ('295', '0', null, '这是积分商城的产品', '这是积分商城的产品', '21', '2000.00', '1900.00', '0', 'UploadFiles/product/20190108/1546947104627573.jpg', 'UploadFiles/product/20190108/1546947104202740.jpg', ',UploadFiles/product/20190108/1546947104725091.jpg', '沙发垫发手动阀手动阀是', '1546947104', '1546947104', '0', '0', '1318', '999999', '1', '0', '0', null, '0', '个', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '5');
INSERT INTO `lr_product` VALUES ('296', '0', null, '这是白金商城的产品', '这是白金商城的产品', '12', '288.00', '188.00', '0', 'UploadFiles/product/20190108/1546947166720835.jpg', 'UploadFiles/product/20190108/1546947166426862.jpg', ',UploadFiles/product/20190108/1546947166974778.jpg', '发生的发多少发发阿什顿发发阿什顿发但是发', '1546947166', '1546947166', '0', '0', '1376', '999999', '1', '0', '0', null, '0', '个', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '3');

-- ----------------------------
-- Table structure for `lr_product_dp`
-- ----------------------------
DROP TABLE IF EXISTS `lr_product_dp`;
CREATE TABLE `lr_product_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品评论表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` int(11) DEFAULT '0' COMMENT '评论订单id',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '评分数',
  `concent` varchar(255) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `reply_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '回复状态',
  `reply_content` text COMMENT '回复内容',
  `reply_time` int(11) NOT NULL DEFAULT '0' COMMENT '回复时间',
  `is_nav` int(11) DEFAULT '1' COMMENT '是否显示 1为显示 2为隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_product_dp
-- ----------------------------
INSERT INTO `lr_product_dp` VALUES ('1', '1', '264', '0', '10', '非常好', '1470212647', '0', '0', null, '0', null);
INSERT INTO `lr_product_dp` VALUES ('2', '1', '265', '0', '10', '口感非常好，野生即食很方便', '1470223379', '0', '0', null, '0', null);
INSERT INTO `lr_product_dp` VALUES ('3', '1', '268', '0', '10', '功能强大，好评！', '1477715118', '0', '0', null, '0', null);
INSERT INTO `lr_product_dp` VALUES ('4', '2', '269', '0', '10', '居家养老好帮手，高科技产品，很好用！', '1477715176', '0', '0', '放到', '1536838237', null);
INSERT INTO `lr_product_dp` VALUES ('5', '2', '282', '0', '10', '好评', '1479596161', '0', '0', null, '0', null);
INSERT INTO `lr_product_dp` VALUES ('6', '3', '271', '0', '9', '好评', '1479596179', '0', '0', null, '0', null);
INSERT INTO `lr_product_dp` VALUES ('7', '3', '281', '0', '9', '不错', '1479596208', '0', '0', '介意', '1539164814', null);
INSERT INTO `lr_product_dp` VALUES ('10', '3', '281', '109', '8', '东西非常不错，给力！', '1470223379', '0', '0', null, '0', null);

-- ----------------------------
-- Table structure for `lr_product_sc`
-- ----------------------------
DROP TABLE IF EXISTS `lr_product_sc`;
CREATE TABLE `lr_product_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品收藏表',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1正常 0删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_product_sc
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_program`
-- ----------------------------
DROP TABLE IF EXISTS `lr_program`;
CREATE TABLE `lr_program` (
  `id` int(11) unsigned NOT NULL COMMENT '小程序配置表',
  `title` varchar(20) NOT NULL COMMENT '小程序名称',
  `name` varchar(20) NOT NULL COMMENT '负责人',
  `describe` varchar(200) DEFAULT NULL COMMENT '简单描述',
  `logo` varchar(100) DEFAULT NULL COMMENT 'logo',
  `copyright` varchar(100) DEFAULT NULL COMMENT '版权信息',
  `service_wx` varchar(50) DEFAULT NULL COMMENT '平台客服微信号',
  `tel` varchar(20) DEFAULT NULL COMMENT '平台客服电话',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `uptime` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_program
-- ----------------------------
INSERT INTO `lr_program` VALUES ('1', '宠物美容学校22', '宠物美容学校11', '宠物美容学校', 'UploadFiles/logo/1495530723265238.png', 'Copyright © 2016 ramicalschool', '', '4006551365', '2872815158@qq.com', '1498809573');

-- ----------------------------
-- Table structure for `lr_province`
-- ----------------------------
DROP TABLE IF EXISTS `lr_province`;
CREATE TABLE `lr_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT '' COMMENT '地区名',
  `zoneId` int(11) DEFAULT '0' COMMENT '地区ID',
  `parentId` int(11) DEFAULT NULL COMMENT '上级ID',
  `parentId2` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `isValid` bit(1) DEFAULT b'1',
  `level` int(11) DEFAULT '0' COMMENT '地区等级 1:省 2:市 3:区/县',
  `level2` int(11) DEFAULT '0',
  `englishChar` varchar(32) DEFAULT '' COMMENT '地区名字拼音首字母',
  `isHot` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_PROVINCE_ENUM_PARENTID_ID` (`parentId`),
  CONSTRAINT `FK_PROVINCE_ENUM_PARENTID_ID` FOREIGN KEY (`parentId`) REFERENCES `lr_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_province
-- ----------------------------
INSERT INTO `lr_province` VALUES ('1', '北京', '1', null, null, '2015-05-22 15:17:17', '', '1', '1', 'B', '0');
INSERT INTO `lr_province` VALUES ('2', '北京市', '1', '1', '1', '2015-05-22 15:17:18', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3', '东城区', '1', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('4', '西城区', '2', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('5', '崇文区', '3', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('6', '宣武区', '4', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('7', '朝阳区', '5', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('8', '丰台区', '6', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('9', '石景山区', '7', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('11', '门头沟区', '9', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('12', '房山区', '10', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('13', '通州区', '11', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('14', '顺义区', '12', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('15', '昌平区', '13', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('16', '大兴区', '14', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('17', '怀柔区', '15', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('18', '平谷区', '16', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('19', '密云县', '17', '2', '1', '2015-05-22 15:17:18', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('20', '延庆县', '18', '2', '1', '2015-05-22 15:17:18', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('21', '天津', '2', null, null, '2015-05-22 15:17:18', '', '1', '1', 'T', '0');
INSERT INTO `lr_province` VALUES ('22', '天津市', '2', '21', '21', '2015-05-22 15:17:18', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('23', '和平区', '19', '22', '22', '2015-05-22 15:17:18', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('24', '河东区', '20', '22', '22', '2015-05-22 15:17:18', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('25', '河西区', '21', '22', '22', '2015-05-22 15:17:18', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('26', '南开区', '22', '22', '22', '2015-05-22 15:17:18', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('27', '河北区', '23', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('28', '红桥区', '24', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('29', '塘沽区', '25', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('30', '汉沽区', '26', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('31', '大港区', '27', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('32', '东丽区', '28', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('33', '西青区', '29', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('34', '津南区', '30', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('35', '北辰区', '31', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('36', '武清区', '32', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('37', '宝坻区', '33', '22', '22', '2015-05-22 15:17:19', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('38', '宁河县', '34', '22', '21', '2015-05-22 15:17:19', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('39', '静海县', '35', '22', '21', '2015-05-22 15:17:19', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('40', '蓟县', '36', '22', '21', '2015-05-22 15:17:19', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('41', '河北', '3', null, null, '2015-05-22 15:17:19', '', '1', '1', 'H', '0');
INSERT INTO `lr_province` VALUES ('42', '石家庄市', '3', '41', '41', '2015-05-22 15:17:19', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('43', '长安区', '37', '42', '42', '2015-05-22 15:17:19', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('44', '桥东区', '38', '42', '42', '2015-05-22 15:17:19', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('45', '桥西区', '39', '42', '42', '2015-05-22 15:17:19', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('46', '新华区', '40', '42', '42', '2015-05-22 15:17:19', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('47', '井陉矿区', '41', '42', '42', '2015-05-22 15:17:19', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('48', '裕华区', '42', '42', '42', '2015-05-22 15:17:19', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('49', '井陉县', '43', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('50', '正定县', '44', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('51', '栾城县', '45', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('52', '行唐县', '46', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('53', '灵寿县', '47', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('54', '高邑县', '48', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('55', '深泽县', '49', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('56', '赞皇县', '50', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('57', '无极县', '51', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('58', '平山县', '52', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('59', '元氏县', '53', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('60', '赵县', '54', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('61', '辛集市', '55', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('62', '藁城市', '56', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('63', '晋州市', '57', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('64', '新乐市', '58', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('65', '鹿泉市', '59', '42', '41', '2015-05-22 15:17:19', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('66', '唐山市', '4', '41', '41', '2015-05-22 15:17:19', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('67', '路南区', '60', '66', '66', '2015-05-22 15:17:20', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('68', '路北区', '61', '66', '66', '2015-05-22 15:17:20', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('69', '古冶区', '62', '66', '66', '2015-05-22 15:17:20', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('70', '开平区', '63', '66', '66', '2015-05-22 15:17:20', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('71', '丰南区', '64', '66', '66', '2015-05-22 15:17:20', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('72', '丰润区', '65', '66', '66', '2015-05-22 15:17:20', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('73', '滦县', '66', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('74', '滦南县', '67', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('75', '乐亭县', '68', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('76', '迁西县', '69', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('77', '玉田县', '70', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('78', '唐海县', '71', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('79', '遵化市', '72', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('80', '迁安市', '73', '66', '41', '2015-05-22 15:17:20', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('81', '秦皇岛市', '5', '41', '41', '2015-05-22 15:17:20', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('82', '海港区', '74', '81', '81', '2015-05-22 15:17:20', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('83', '山海关区', '75', '81', '81', '2015-05-22 15:17:20', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('84', '北戴河区', '76', '81', '81', '2015-05-22 15:17:20', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('85', '青龙满族自治县', '77', '81', '41', '2015-05-22 15:17:20', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('86', '昌黎县', '78', '81', '41', '2015-05-22 15:17:20', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('87', '抚宁县', '79', '81', '41', '2015-05-22 15:17:20', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('88', '卢龙县', '80', '81', '41', '2015-05-22 15:17:20', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('89', '邯郸市', '6', '41', '41', '2015-05-22 15:17:20', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('90', '邯山区', '81', '89', '89', '2015-05-22 15:17:20', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('91', '丛台区', '82', '89', '89', '2015-05-22 15:17:20', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('92', '复兴区', '83', '89', '89', '2015-05-22 15:17:20', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('93', '峰峰矿区', '84', '89', '89', '2015-05-22 15:17:20', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('94', '邯郸县', '85', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('95', '临漳县', '86', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('96', '成安县', '87', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('97', '大名县', '88', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('98', '涉县', '89', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('99', '磁县', '90', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('100', '肥乡县', '91', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('101', '永年县', '92', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('102', '邱县', '93', '89', '41', '2015-05-22 15:17:20', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('103', '鸡泽县', '94', '89', '41', '2015-05-22 15:17:21', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('104', '广平县', '95', '89', '41', '2015-05-22 15:17:21', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('105', '馆陶县', '96', '89', '41', '2015-05-22 15:17:21', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('106', '魏县', '97', '89', '41', '2015-05-22 15:17:21', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('107', '曲周县', '98', '89', '41', '2015-05-22 15:17:21', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('108', '武安市', '99', '89', '41', '2015-05-22 15:17:21', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('109', '邢台市', '7', '41', '41', '2015-05-22 15:17:21', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('110', '桥东区', '100', '109', '109', '2015-05-22 15:17:21', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('111', '桥西区', '101', '109', '109', '2015-05-22 15:17:21', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('112', '邢台县', '102', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('113', '临城县', '103', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('114', '内丘县', '104', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('115', '柏乡县', '105', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('116', '隆尧县', '106', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('117', '任县', '107', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('118', '南和县', '108', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('119', '宁晋县', '109', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('120', '巨鹿县', '110', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('121', '新河县', '111', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('122', '广宗县', '112', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('123', '平乡县', '113', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('124', '威县', '114', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('125', '清河县', '115', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('126', '临西县', '116', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('127', '南宫市', '117', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('128', '沙河市', '118', '109', '41', '2015-05-22 15:17:21', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('129', '保定市', '8', '41', '41', '2015-05-22 15:17:21', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('130', '新市区', '119', '129', '129', '2015-05-22 15:17:21', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('131', '北市区', '120', '129', '129', '2015-05-22 15:17:21', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('132', '南市区', '121', '129', '129', '2015-05-22 15:17:21', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('133', '满城县', '122', '129', '41', '2015-05-22 15:17:21', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('134', '清苑县', '123', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('135', '涞水县', '124', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('136', '阜平县', '125', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('137', '徐水县', '126', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('138', '定兴县', '127', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('139', '唐县', '128', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('140', '高阳县', '129', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('141', '容城县', '130', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('142', '涞源县', '131', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('143', '望都县', '132', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('144', '安新县', '133', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('145', '易县', '134', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('146', '曲阳县', '135', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('147', '蠡县', '136', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('148', '顺平县', '137', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('149', '博野县', '138', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('150', '雄县', '139', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('151', '涿州市', '140', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('152', '定州市', '141', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('153', '安国市', '142', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('154', '高碑店市', '143', '129', '41', '2015-05-22 15:17:22', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('155', '张家口市', '9', '41', '41', '2015-05-22 15:17:22', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('156', '桥东区', '144', '155', '155', '2015-05-22 15:17:22', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('157', '桥西区', '145', '155', '155', '2015-05-22 15:17:22', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('158', '宣化区', '146', '155', '155', '2015-05-22 15:17:22', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('159', '下花园区', '147', '155', '155', '2015-05-22 15:17:22', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('160', '宣化县', '148', '155', '41', '2015-05-22 15:17:22', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('161', '张北县', '149', '155', '41', '2015-05-22 15:17:22', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('162', '康保县', '150', '155', '41', '2015-05-22 15:17:22', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('163', '沽源县', '151', '155', '41', '2015-05-22 15:17:22', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('164', '尚义县', '152', '155', '41', '2015-05-22 15:17:22', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('165', '蔚县', '153', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('166', '阳原县', '154', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('167', '怀安县', '155', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('168', '万全县', '156', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('169', '怀来县', '157', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('170', '涿鹿县', '158', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('171', '赤城县', '159', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('172', '崇礼县', '160', '155', '41', '2015-05-22 15:17:23', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('173', '承德市', '10', '41', '41', '2015-05-22 15:17:23', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('174', '双桥区', '161', '173', '173', '2015-05-22 15:17:23', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('175', '双滦区', '162', '173', '173', '2015-05-22 15:17:23', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('176', '鹰手营子矿区', '163', '173', '173', '2015-05-22 15:17:23', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('177', '承德县', '164', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('178', '兴隆县', '165', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('179', '平泉县', '166', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('180', '滦平县', '167', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('181', '隆化县', '168', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('182', '丰宁满族自治县', '169', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('183', '宽城满族自治县', '170', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('184', '围场满族蒙古族自治县', '171', '173', '41', '2015-05-22 15:17:23', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('185', '沧州市', '11', '41', '41', '2015-05-22 15:17:23', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('186', '新华区', '172', '185', '185', '2015-05-22 15:17:24', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('187', '运河区', '173', '185', '185', '2015-05-22 15:17:24', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('188', '沧县', '174', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('189', '青县', '175', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('190', '东光县', '176', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('191', '海兴县', '177', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('192', '盐山县', '178', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('193', '肃宁县', '179', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('194', '南皮县', '180', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('195', '吴桥县', '181', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('196', '献县', '182', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('197', '孟村回族自治县', '183', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('198', '泊头市', '184', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('199', '任丘市', '185', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('200', '黄骅市', '186', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('201', '河间市', '187', '185', '41', '2015-05-22 15:17:24', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('202', '廊坊市', '12', '41', '41', '2015-05-22 15:17:24', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('203', '安次区', '188', '202', '202', '2015-05-22 15:17:24', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('204', '广阳区', '189', '202', '202', '2015-05-22 15:17:24', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('205', '固安县', '190', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('206', '永清县', '191', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('207', '香河县', '192', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('208', '大城县', '193', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('209', '文安县', '194', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('210', '大厂回族自治县', '195', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('211', '霸州市', '196', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('212', '三河市', '197', '202', '41', '2015-05-22 15:17:24', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('213', '衡水市', '13', '41', '41', '2015-05-22 15:17:24', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('214', '桃城区', '198', '213', '213', '2015-05-22 15:17:24', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('215', '枣强县', '199', '213', '41', '2015-05-22 15:17:24', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('216', '武邑县', '200', '213', '41', '2015-05-22 15:17:24', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('217', '武强县', '201', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('218', '饶阳县', '202', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('219', '安平县', '203', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('220', '故城县', '204', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('221', '景县', '205', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('222', '阜城县', '206', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('223', '冀州市', '207', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('224', '深州市', '208', '213', '41', '2015-05-22 15:17:25', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('225', '山西', '4', null, null, '2015-05-22 15:17:25', '', '1', '1', 'S', '0');
INSERT INTO `lr_province` VALUES ('226', '太原市', '14', '225', '225', '2015-05-22 15:17:25', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('227', '小店区', '209', '226', '226', '2015-05-22 15:17:25', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('228', '迎泽区', '210', '226', '226', '2015-05-22 15:17:25', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('229', '杏花岭区', '211', '226', '226', '2015-05-22 15:17:25', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('230', '尖草坪区', '212', '226', '226', '2015-05-22 15:17:25', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('231', '万柏林区', '213', '226', '226', '2015-05-22 15:17:25', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('232', '晋源区', '214', '226', '226', '2015-05-22 15:17:25', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('233', '清徐县', '215', '226', '225', '2015-05-22 15:17:25', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('234', '阳曲县', '216', '226', '225', '2015-05-22 15:17:25', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('235', '娄烦县', '217', '226', '225', '2015-05-22 15:17:25', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('236', '古交市', '218', '226', '225', '2015-05-22 15:17:25', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('237', '大同市', '15', '225', '225', '2015-05-22 15:17:25', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('238', '城区', '219', '237', '237', '2015-05-22 15:17:25', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('239', '矿区', '220', '237', '237', '2015-05-22 15:17:25', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('240', '南郊区', '221', '237', '237', '2015-05-22 15:17:25', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('241', '新荣区', '222', '237', '237', '2015-05-22 15:17:25', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('242', '阳高县', '223', '237', '225', '2015-05-22 15:17:25', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('243', '天镇县', '224', '237', '225', '2015-05-22 15:17:25', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('244', '广灵县', '225', '237', '225', '2015-05-22 15:17:25', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('245', '灵丘县', '226', '237', '225', '2015-05-22 15:17:25', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('246', '浑源县', '227', '237', '225', '2015-05-22 15:17:26', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('247', '左云县', '228', '237', '225', '2015-05-22 15:17:26', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('248', '大同县', '229', '237', '225', '2015-05-22 15:17:26', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('249', '阳泉市', '16', '225', '225', '2015-05-22 15:17:26', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('250', '城区', '230', '249', '249', '2015-05-22 15:17:26', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('251', '矿区', '231', '249', '249', '2015-05-22 15:17:26', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('252', '郊区', '232', '249', '249', '2015-05-22 15:17:26', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('253', '平定县', '233', '249', '225', '2015-05-22 15:17:26', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('254', '盂县', '234', '249', '225', '2015-05-22 15:17:26', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('255', '长治市', '17', '225', '225', '2015-05-22 15:17:26', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('256', '城区', '235', '255', '255', '2015-05-22 15:17:26', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('257', '郊区', '236', '255', '255', '2015-05-22 15:17:26', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('258', '长治县', '237', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('259', '襄垣县', '238', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('260', '屯留县', '239', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('261', '平顺县', '240', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('262', '黎城县', '241', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('263', '壶关县', '242', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('264', '长子县', '243', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('265', '武乡县', '244', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('266', '沁县', '245', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('267', '沁源县', '246', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('268', '潞城市', '247', '255', '225', '2015-05-22 15:17:26', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('269', '晋城市', '18', '225', '225', '2015-05-22 15:17:26', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('270', '城区', '248', '269', '269', '2015-05-22 15:17:26', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('271', '沁水县', '249', '269', '225', '2015-05-22 15:17:26', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('272', '阳城县', '250', '269', '225', '2015-05-22 15:17:26', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('273', '陵川县', '251', '269', '225', '2015-05-22 15:17:26', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('274', '泽州县', '252', '269', '225', '2015-05-22 15:17:26', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('275', '高平市', '253', '269', '225', '2015-05-22 15:17:26', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('276', '朔州市', '19', '225', '225', '2015-05-22 15:17:26', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('277', '朔城区', '254', '276', '276', '2015-05-22 15:17:26', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('278', '平鲁区', '255', '276', '276', '2015-05-22 15:17:26', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('279', '山阴县', '256', '276', '225', '2015-05-22 15:17:26', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('280', '应县', '257', '276', '225', '2015-05-22 15:17:27', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('281', '右玉县', '258', '276', '225', '2015-05-22 15:17:27', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('282', '怀仁县', '259', '276', '225', '2015-05-22 15:17:27', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('283', '晋中市', '20', '225', '225', '2015-05-22 15:17:27', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('284', '榆次区', '260', '283', '283', '2015-05-22 15:17:27', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('285', '榆社县', '261', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('286', '左权县', '262', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('287', '和顺县', '263', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('288', '昔阳县', '264', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('289', '寿阳县', '265', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('290', '太谷县', '266', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('291', '祁县', '267', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('292', '平遥县', '268', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('293', '灵石县', '269', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('294', '介休市', '270', '283', '225', '2015-05-22 15:17:27', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('295', '运城市', '21', '225', '225', '2015-05-22 15:17:27', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('296', '盐湖区', '271', '295', '295', '2015-05-22 15:17:27', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('297', '临猗县', '272', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('298', '万荣县', '273', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('299', '闻喜县', '274', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('300', '稷山县', '275', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('301', '新绛县', '276', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('302', '绛县', '277', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('303', '垣曲县', '278', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('304', '夏县', '279', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('305', '平陆县', '280', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('306', '芮城县', '281', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('307', '永济市', '282', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('308', '河津市', '283', '295', '225', '2015-05-22 15:17:27', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('309', '忻州市', '22', '225', '225', '2015-05-22 15:17:28', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('310', '忻府区', '284', '309', '309', '2015-05-22 15:17:28', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('311', '定襄县', '285', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('312', '五台县', '286', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('313', '代县', '287', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('314', '繁峙县', '288', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('315', '宁武县', '289', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('316', '静乐县', '290', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('317', '神池县', '291', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('318', '五寨县', '292', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('319', '岢岚县', '293', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('320', '河曲县', '294', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('321', '保德县', '295', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('322', '偏关县', '296', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('323', '原平市', '297', '309', '225', '2015-05-22 15:17:28', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('324', '临汾市', '23', '225', '225', '2015-05-22 15:17:28', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('325', '尧都区', '298', '324', '324', '2015-05-22 15:17:28', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('326', '曲沃县', '299', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('327', '翼城县', '300', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('328', '襄汾县', '301', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('329', '洪洞县', '302', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('330', '古县', '303', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('331', '安泽县', '304', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('332', '浮山县', '305', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('333', '吉县', '306', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('334', '乡宁县', '307', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('335', '大宁县', '308', '324', '225', '2015-05-22 15:17:28', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('336', '隰县', '309', '324', '225', '2015-05-22 15:17:29', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('337', '永和县', '310', '324', '225', '2015-05-22 15:17:29', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('338', '蒲县', '311', '324', '225', '2015-05-22 15:17:29', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('339', '汾西县', '312', '324', '225', '2015-05-22 15:17:29', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('340', '侯马市', '313', '324', '225', '2015-05-22 15:17:29', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('341', '霍州市', '314', '324', '225', '2015-05-22 15:17:29', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('342', '吕梁市', '24', '225', '225', '2015-05-22 15:17:29', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('343', '离石区', '315', '342', '342', '2015-05-22 15:17:29', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('344', '文水县', '316', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('345', '交城县', '317', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('346', '兴县', '318', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('347', '临县', '319', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('348', '柳林县', '320', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('349', '石楼县', '321', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('350', '岚县', '322', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('351', '方山县', '323', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('352', '中阳县', '324', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('353', '交口县', '325', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('354', '孝义市', '326', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('355', '汾阳市', '327', '342', '225', '2015-05-22 15:17:29', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('356', '内蒙古', '5', null, null, '2015-05-22 15:17:29', '', '1', '1', 'N', '0');
INSERT INTO `lr_province` VALUES ('357', '呼和浩特市', '25', '356', '356', '2015-05-22 15:17:29', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('358', '新城区', '328', '357', '357', '2015-05-22 15:17:29', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('359', '回民区', '329', '357', '357', '2015-05-22 15:17:29', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('360', '玉泉区', '330', '357', '357', '2015-05-22 15:17:29', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('361', '赛罕区', '331', '357', '357', '2015-05-22 15:17:29', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('362', '土默特左旗', '332', '357', '357', '2015-05-22 15:17:29', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('363', '托克托县', '333', '357', '356', '2015-05-22 15:17:29', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('364', '和林格尔县', '334', '357', '356', '2015-05-22 15:17:29', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('365', '清水河县', '335', '357', '356', '2015-05-22 15:17:29', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('366', '武川县', '336', '357', '356', '2015-05-22 15:17:29', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('367', '包头市', '26', '356', '356', '2015-05-22 15:17:29', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('368', '东河区', '337', '367', '367', '2015-05-22 15:17:29', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('369', '昆都仑区', '338', '367', '367', '2015-05-22 15:17:29', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('370', '青山区', '339', '367', '367', '2015-05-22 15:17:30', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('371', '石拐区', '340', '367', '367', '2015-05-22 15:17:30', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('372', '白云矿区', '341', '367', '367', '2015-05-22 15:17:30', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('373', '九原区', '342', '367', '367', '2015-05-22 15:17:30', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('374', '土默特右旗', '343', '367', '367', '2015-05-22 15:17:30', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('375', '固阳县', '344', '367', '356', '2015-05-22 15:17:30', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('376', '达尔罕茂明安联合旗', '345', '367', '367', '2015-05-22 15:17:30', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('377', '乌海市', '27', '356', '356', '2015-05-22 15:17:30', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('378', '海勃湾区', '346', '377', '377', '2015-05-22 15:17:30', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('379', '海南区', '347', '377', '377', '2015-05-22 15:17:30', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('380', '乌达区', '348', '377', '377', '2015-05-22 15:17:30', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('381', '赤峰市', '28', '356', '356', '2015-05-22 15:17:30', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('382', '红山区', '349', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('383', '元宝山区', '350', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('384', '松山区', '351', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('385', '阿鲁科尔沁旗', '352', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('386', '巴林左旗', '353', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('387', '巴林右旗', '354', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('388', '林西县', '355', '381', '356', '2015-05-22 15:17:30', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('389', '克什克腾旗', '356', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('390', '翁牛特旗', '357', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('391', '喀喇沁旗', '358', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('392', '宁城县', '359', '381', '356', '2015-05-22 15:17:30', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('393', '敖汉旗', '360', '381', '381', '2015-05-22 15:17:30', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('394', '通辽市', '29', '356', '356', '2015-05-22 15:17:30', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('395', '科尔沁区', '361', '394', '394', '2015-05-22 15:17:30', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('396', '科尔沁左翼中旗', '362', '394', '394', '2015-05-22 15:17:30', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('397', '科尔沁左翼后旗', '363', '394', '394', '2015-05-22 15:17:30', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('398', '开鲁县', '364', '394', '356', '2015-05-22 15:17:31', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('399', '库伦旗', '365', '394', '394', '2015-05-22 15:17:31', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('400', '奈曼旗', '366', '394', '394', '2015-05-22 15:17:31', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('401', '扎鲁特旗', '367', '394', '394', '2015-05-22 15:17:31', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('402', '霍林郭勒市', '368', '394', '356', '2015-05-22 15:17:31', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('403', '鄂尔多斯市', '30', '356', '356', '2015-05-22 15:17:31', '', '2', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('404', '东胜区', '369', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('405', '达拉特旗', '370', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('406', '准格尔旗', '371', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('407', '鄂托克前旗', '372', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('408', '鄂托克旗', '373', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('409', '杭锦旗', '374', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('410', '乌审旗', '375', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('411', '伊金霍洛旗', '376', '403', '403', '2015-05-22 15:17:31', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('412', '呼伦贝尔市', '31', '356', '356', '2015-05-22 15:17:31', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('413', '海拉尔区', '377', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('414', '阿荣旗', '378', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('415', '莫力达瓦达斡尔族自治旗', '379', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('416', '鄂伦春自治旗', '380', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('417', '鄂温克族自治旗', '381', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('418', '陈巴尔虎旗', '382', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('419', '新巴尔虎左旗', '383', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('420', '新巴尔虎右旗', '384', '412', '412', '2015-05-22 15:17:31', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('421', '满洲里市', '385', '412', '356', '2015-05-22 15:17:31', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('422', '牙克石市', '386', '412', '356', '2015-05-22 15:17:31', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('423', '扎兰屯市', '387', '412', '356', '2015-05-22 15:17:31', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('424', '额尔古纳市', '388', '412', '356', '2015-05-22 15:17:31', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('425', '根河市', '389', '412', '356', '2015-05-22 15:17:31', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('426', '巴彦淖尔市', '32', '356', '356', '2015-05-22 15:17:31', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('427', '临河区', '390', '426', '426', '2015-05-22 15:17:32', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('428', '五原县', '391', '426', '356', '2015-05-22 15:17:32', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('429', '磴口县', '392', '426', '356', '2015-05-22 15:17:32', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('430', '乌拉特前旗', '393', '426', '426', '2015-05-22 15:17:32', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('431', '乌拉特中旗', '394', '426', '426', '2015-05-22 15:17:32', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('432', '乌拉特后旗', '395', '426', '426', '2015-05-22 15:17:32', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('433', '杭锦后旗', '396', '426', '426', '2015-05-22 15:17:32', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('434', '乌兰察布市', '33', '356', '356', '2015-05-22 15:17:32', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('435', '集宁区', '397', '434', '434', '2015-05-22 15:17:32', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('436', '卓资县', '398', '434', '356', '2015-05-22 15:17:32', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('437', '化德县', '399', '434', '356', '2015-05-22 15:17:32', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('438', '商都县', '400', '434', '356', '2015-05-22 15:17:32', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('439', '兴和县', '401', '434', '356', '2015-05-22 15:17:32', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('440', '凉城县', '402', '434', '356', '2015-05-22 15:17:32', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('441', '察哈尔右翼前旗', '403', '434', '434', '2015-05-22 15:17:32', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('442', '察哈尔右翼中旗', '404', '434', '434', '2015-05-22 15:17:32', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('443', '察哈尔右翼后旗', '405', '434', '434', '2015-05-22 15:17:32', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('444', '四子王旗', '406', '434', '434', '2015-05-22 15:17:32', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('445', '丰镇市', '407', '434', '356', '2015-05-22 15:17:32', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('446', '兴安盟', '34', '356', '356', '2015-05-22 15:17:32', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('447', '乌兰浩特市', '408', '446', '356', '2015-05-22 15:17:32', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('448', '阿尔山市', '409', '446', '356', '2015-05-22 15:17:32', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('449', '科尔沁右翼前旗', '410', '446', '446', '2015-05-22 15:17:32', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('450', '科尔沁右翼中旗', '411', '446', '446', '2015-05-22 15:17:32', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('451', '扎赉特旗', '412', '446', '446', '2015-05-22 15:17:32', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('452', '突泉县', '413', '446', '356', '2015-05-22 15:17:32', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('453', '锡林郭勒盟', '35', '356', '356', '2015-05-22 15:17:32', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('454', '二连浩特市', '414', '453', '356', '2015-05-22 15:17:32', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('455', '锡林浩特市', '415', '453', '356', '2015-05-22 15:17:32', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('456', '阿巴嘎旗', '416', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('457', '苏尼特左旗', '417', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('458', '苏尼特右旗', '418', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('459', '东乌珠穆沁旗', '419', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('460', '西乌珠穆沁旗', '420', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('461', '太仆寺旗', '421', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('462', '镶黄旗', '422', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('463', '正镶白旗', '423', '453', '453', '2015-05-22 15:17:32', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('464', '正蓝旗', '424', '453', '453', '2015-05-22 15:17:33', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('465', '多伦县', '425', '453', '356', '2015-05-22 15:17:33', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('466', '阿拉善盟', '36', '356', '356', '2015-05-22 15:17:33', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('467', '阿拉善左旗', '426', '466', '466', '2015-05-22 15:17:33', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('468', '阿拉善右旗', '427', '466', '466', '2015-05-22 15:17:33', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('469', '额济纳旗', '428', '466', '466', '2015-05-22 15:17:33', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('470', '辽宁', '6', null, null, '2015-05-22 15:17:33', '', '1', '1', 'L', '0');
INSERT INTO `lr_province` VALUES ('471', '沈阳市', '37', '470', '470', '2015-05-22 15:17:33', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('472', '和平区', '429', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('473', '沈河区', '430', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('474', '大东区', '431', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('475', '皇姑区', '432', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('476', '铁西区', '433', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('477', '苏家屯区', '434', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('478', '东陵区', '435', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('479', '新城子区', '436', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('480', '于洪区', '437', '471', '471', '2015-05-22 15:17:33', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('481', '辽中县', '438', '471', '470', '2015-05-22 15:17:33', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('482', '康平县', '439', '471', '470', '2015-05-22 15:17:33', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('483', '法库县', '440', '471', '470', '2015-05-22 15:17:33', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('484', '新民市', '441', '471', '470', '2015-05-22 15:17:33', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('485', '大连市', '38', '470', '470', '2015-05-22 15:17:33', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('486', '中山区', '442', '485', '485', '2015-05-22 15:17:33', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('487', '西岗区', '443', '485', '485', '2015-05-22 15:17:33', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('488', '沙河口区', '444', '485', '485', '2015-05-22 15:17:33', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('489', '甘井子区', '445', '485', '485', '2015-05-22 15:17:33', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('490', '旅顺口区', '446', '485', '485', '2015-05-22 15:17:33', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('491', '金州区', '447', '485', '485', '2015-05-22 15:17:33', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('492', '长海县', '448', '485', '470', '2015-05-22 15:17:33', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('493', '瓦房店市', '449', '485', '470', '2015-05-22 15:17:33', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('494', '普兰店市', '450', '485', '470', '2015-05-22 15:17:33', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('495', '庄河市', '451', '485', '470', '2015-05-22 15:17:33', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('496', '鞍山市', '39', '470', '470', '2015-05-22 15:17:33', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('497', '铁东区', '452', '496', '496', '2015-05-22 15:17:33', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('498', '铁西区', '453', '496', '496', '2015-05-22 15:17:34', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('499', '立山区', '454', '496', '496', '2015-05-22 15:17:34', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('500', '千山区', '455', '496', '496', '2015-05-22 15:17:34', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('501', '台安县', '456', '496', '470', '2015-05-22 15:17:34', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('502', '岫岩满族自治县', '457', '496', '470', '2015-05-22 15:17:34', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('503', '海城市', '458', '496', '470', '2015-05-22 15:17:34', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('504', '抚顺市', '40', '470', '470', '2015-05-22 15:17:34', '', '2', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('505', '新抚区', '459', '504', '504', '2015-05-22 15:17:34', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('506', '东洲区', '460', '504', '504', '2015-05-22 15:17:34', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('507', '望花区', '461', '504', '504', '2015-05-22 15:17:34', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('508', '顺城区', '462', '504', '504', '2015-05-22 15:17:34', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('509', '抚顺县', '463', '504', '470', '2015-05-22 15:17:34', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('510', '新宾满族自治县', '464', '504', '470', '2015-05-22 15:17:34', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('511', '清原满族自治县', '465', '504', '470', '2015-05-22 15:17:34', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('512', '本溪市', '41', '470', '470', '2015-05-22 15:17:34', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('513', '平山区', '466', '512', '512', '2015-05-22 15:17:34', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('514', '溪湖区', '467', '512', '512', '2015-05-22 15:17:34', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('515', '明山区', '468', '512', '512', '2015-05-22 15:17:34', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('516', '南芬区', '469', '512', '512', '2015-05-22 15:17:34', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('517', '本溪满族自治县', '470', '512', '470', '2015-05-22 15:17:34', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('518', '桓仁满族自治县', '471', '512', '470', '2015-05-22 15:17:34', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('519', '丹东市', '42', '470', '470', '2015-05-22 15:17:34', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('520', '元宝区', '472', '519', '519', '2015-05-22 15:17:34', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('521', '振兴区', '473', '519', '519', '2015-05-22 15:17:34', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('522', '振安区', '474', '519', '519', '2015-05-22 15:17:34', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('523', '宽甸满族自治县', '475', '519', '470', '2015-05-22 15:17:34', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('524', '东港市', '476', '519', '470', '2015-05-22 15:17:34', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('525', '凤城市', '477', '519', '470', '2015-05-22 15:17:34', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('526', '锦州市', '43', '470', '470', '2015-05-22 15:17:34', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('527', '古塔区', '478', '526', '526', '2015-05-22 15:17:34', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('528', '凌河区', '479', '526', '526', '2015-05-22 15:17:34', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('529', '太和区', '480', '526', '526', '2015-05-22 15:17:34', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('530', '黑山县', '481', '526', '470', '2015-05-22 15:17:34', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('531', '义县', '482', '526', '470', '2015-05-22 15:17:34', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('532', '凌海市', '483', '526', '470', '2015-05-22 15:17:34', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('533', '北宁市', '484', '526', '470', '2015-05-22 15:17:34', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('534', '营口市', '44', '470', '470', '2015-05-22 15:17:34', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('535', '站前区', '485', '534', '534', '2015-05-22 15:17:34', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('536', '西市区', '486', '534', '534', '2015-05-22 15:17:34', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('537', '鲅鱼圈区', '487', '534', '534', '2015-05-22 15:17:35', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('538', '老边区', '488', '534', '534', '2015-05-22 15:17:35', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('539', '盖州市', '489', '534', '470', '2015-05-22 15:17:35', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('540', '大石桥市', '490', '534', '470', '2015-05-22 15:17:35', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('541', '阜新市', '45', '470', '470', '2015-05-22 15:17:35', '', '2', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('542', '海州区', '491', '541', '541', '2015-05-22 15:17:35', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('543', '新邱区', '492', '541', '541', '2015-05-22 15:17:35', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('544', '太平区', '493', '541', '541', '2015-05-22 15:17:35', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('545', '清河门区', '494', '541', '541', '2015-05-22 15:17:35', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('546', '细河区', '495', '541', '541', '2015-05-22 15:17:35', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('547', '阜新蒙古族自治县', '496', '541', '470', '2015-05-22 15:17:35', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('548', '彰武县', '497', '541', '470', '2015-05-22 15:17:35', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('549', '辽阳市', '46', '470', '470', '2015-05-22 15:17:35', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('550', '白塔区', '498', '549', '549', '2015-05-22 15:17:35', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('551', '文圣区', '499', '549', '549', '2015-05-22 15:17:35', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('552', '宏伟区', '500', '549', '549', '2015-05-22 15:17:35', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('553', '弓长岭区', '501', '549', '549', '2015-05-22 15:17:35', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('554', '太子河区', '502', '549', '549', '2015-05-22 15:17:35', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('555', '辽阳县', '503', '549', '470', '2015-05-22 15:17:35', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('556', '灯塔市', '504', '549', '470', '2015-05-22 15:17:35', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('557', '盘锦市', '47', '470', '470', '2015-05-22 15:17:35', '', '2', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('558', '双台子区', '505', '557', '557', '2015-05-22 15:17:35', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('559', '兴隆台区', '506', '557', '557', '2015-05-22 15:17:35', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('560', '大洼县', '507', '557', '470', '2015-05-22 15:17:35', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('561', '盘山县', '508', '557', '470', '2015-05-22 15:17:35', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('562', '铁岭市', '48', '470', '470', '2015-05-22 15:17:35', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('563', '银州区', '509', '562', '562', '2015-05-22 15:17:35', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('564', '清河区', '510', '562', '562', '2015-05-22 15:17:35', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('565', '铁岭县', '511', '562', '470', '2015-05-22 15:17:35', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('566', '西丰县', '512', '562', '470', '2015-05-22 15:17:35', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('567', '昌图县', '513', '562', '470', '2015-05-22 15:17:35', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('568', '调兵山市', '514', '562', '470', '2015-05-22 15:17:35', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('569', '开原市', '515', '562', '470', '2015-05-22 15:17:35', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('570', '朝阳市', '49', '470', '470', '2015-05-22 15:17:35', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('571', '双塔区', '516', '570', '570', '2015-05-22 15:17:36', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('572', '龙城区', '517', '570', '570', '2015-05-22 15:17:36', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('573', '朝阳县', '518', '570', '470', '2015-05-22 15:17:36', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('574', '建平县', '519', '570', '470', '2015-05-22 15:17:36', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('575', '喀喇沁左翼蒙古族自治县', '520', '570', '470', '2015-05-22 15:17:36', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('576', '北票市', '521', '570', '470', '2015-05-22 15:17:36', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('577', '凌源市', '522', '570', '470', '2015-05-22 15:17:36', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('578', '葫芦岛市', '50', '470', '470', '2015-05-22 15:17:36', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('579', '连山区', '523', '578', '578', '2015-05-22 15:17:36', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('580', '龙港区', '524', '578', '578', '2015-05-22 15:17:36', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('581', '南票区', '525', '578', '578', '2015-05-22 15:17:36', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('582', '绥中县', '526', '578', '470', '2015-05-22 15:17:36', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('583', '建昌县', '527', '578', '470', '2015-05-22 15:17:36', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('584', '兴城市', '528', '578', '470', '2015-05-22 15:17:36', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('585', '吉林', '7', null, null, '2015-05-22 15:17:36', '', '1', '1', 'J', '0');
INSERT INTO `lr_province` VALUES ('586', '长春市', '51', '585', '585', '2015-05-22 15:17:36', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('587', '南关区', '529', '586', '586', '2015-05-22 15:17:36', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('588', '宽城区', '530', '586', '586', '2015-05-22 15:17:36', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('589', '朝阳区', '531', '586', '586', '2015-05-22 15:17:36', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('590', '二道区', '532', '586', '586', '2015-05-22 15:17:36', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('591', '绿园区', '533', '586', '586', '2015-05-22 15:17:36', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('592', '双阳区', '534', '586', '586', '2015-05-22 15:17:36', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('593', '农安县', '535', '586', '585', '2015-05-22 15:17:36', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('594', '九台市', '536', '586', '585', '2015-05-22 15:17:36', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('595', '榆树市', '537', '586', '585', '2015-05-22 15:17:36', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('596', '德惠市', '538', '586', '585', '2015-05-22 15:17:36', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('597', '吉林市', '52', '585', '585', '2015-05-22 15:17:36', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('598', '昌邑区', '539', '597', '597', '2015-05-22 15:17:36', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('599', '龙潭区', '540', '597', '597', '2015-05-22 15:17:36', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('600', '船营区', '541', '597', '597', '2015-05-22 15:17:36', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('601', '丰满区', '542', '597', '597', '2015-05-22 15:17:36', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('602', '永吉县', '543', '597', '585', '2015-05-22 15:17:36', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('603', '蛟河市', '544', '597', '585', '2015-05-22 15:17:36', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('604', '桦甸市', '545', '597', '585', '2015-05-22 15:17:37', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('605', '舒兰市', '546', '597', '585', '2015-05-22 15:17:37', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('606', '磐石市', '547', '597', '585', '2015-05-22 15:17:37', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('607', '四平市', '53', '585', '585', '2015-05-22 15:17:37', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('608', '铁西区', '548', '607', '607', '2015-05-22 15:17:37', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('609', '铁东区', '549', '607', '607', '2015-05-22 15:17:37', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('610', '梨树县', '550', '607', '585', '2015-05-22 15:17:37', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('611', '伊通满族自治县', '551', '607', '585', '2015-05-22 15:17:37', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('612', '公主岭市', '552', '607', '585', '2015-05-22 15:17:37', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('613', '双辽市', '553', '607', '585', '2015-05-22 15:17:37', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('614', '辽源市', '54', '585', '585', '2015-05-22 15:17:37', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('615', '龙山区', '554', '614', '614', '2015-05-22 15:17:37', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('616', '西安区', '555', '614', '614', '2015-05-22 15:17:37', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('617', '东丰县', '556', '614', '585', '2015-05-22 15:17:37', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('618', '东辽县', '557', '614', '585', '2015-05-22 15:17:37', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('619', '通化市', '55', '585', '585', '2015-05-22 15:17:37', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('620', '东昌区', '558', '619', '619', '2015-05-22 15:17:37', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('621', '二道江区', '559', '619', '619', '2015-05-22 15:17:37', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('622', '通化县', '560', '619', '585', '2015-05-22 15:17:37', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('623', '辉南县', '561', '619', '585', '2015-05-22 15:17:37', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('624', '柳河县', '562', '619', '585', '2015-05-22 15:17:37', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('625', '梅河口市', '563', '619', '585', '2015-05-22 15:17:37', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('626', '集安市', '564', '619', '585', '2015-05-22 15:17:37', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('627', '白山市', '56', '585', '585', '2015-05-22 15:17:37', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('628', '八道江区', '565', '627', '627', '2015-05-22 15:17:37', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('629', '抚松县', '566', '627', '585', '2015-05-22 15:17:37', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('630', '靖宇县', '567', '627', '585', '2015-05-22 15:17:37', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('631', '长白朝鲜族自治县', '568', '627', '585', '2015-05-22 15:17:37', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('632', '江源县', '569', '627', '585', '2015-05-22 15:17:37', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('633', '临江市', '570', '627', '585', '2015-05-22 15:17:37', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('634', '松原市', '57', '585', '585', '2015-05-22 15:17:37', '', '2', '2', 'S', '1');
INSERT INTO `lr_province` VALUES ('635', '宁江区', '571', '634', '634', '2015-05-22 15:17:38', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('636', '前郭尔罗斯蒙古族自治县', '572', '634', '634', '2015-05-22 15:17:38', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('637', '长岭县', '573', '634', '585', '2015-05-22 15:17:38', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('638', '乾安县', '574', '634', '585', '2015-05-22 15:17:38', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('639', '扶余县', '575', '634', '585', '2015-05-22 15:17:38', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('640', '白城市', '58', '585', '585', '2015-05-22 15:17:38', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('641', '洮北区', '576', '640', '640', '2015-05-22 15:17:38', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('642', '镇赉县', '577', '640', '585', '2015-05-22 15:17:38', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('643', '通榆县', '578', '640', '585', '2015-05-22 15:17:38', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('644', '洮南市', '579', '640', '585', '2015-05-22 15:17:38', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('645', '大安市', '580', '640', '585', '2015-05-22 15:17:38', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('646', '延边', '59', '585', '585', '2015-05-22 15:17:38', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('647', '延吉市', '581', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('648', '图们市', '582', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('649', '敦化市', '583', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('650', '珲春市', '584', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('651', '龙井市', '585', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('652', '和龙市', '586', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('653', '汪清县', '587', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('654', '安图县', '588', '646', '585', '2015-05-22 15:17:38', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('655', '黑龙江', '8', null, null, '2015-05-22 15:17:38', '', '1', '1', 'H', '0');
INSERT INTO `lr_province` VALUES ('656', '哈尔滨市', '60', '655', '655', '2015-05-22 15:17:38', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('657', '道里区', '589', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('658', '南岗区', '590', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('659', '道外区', '591', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('660', '香坊区', '592', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('661', '动力区', '593', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('662', '平房区', '594', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('663', '松北区', '595', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('664', '呼兰区', '596', '656', '656', '2015-05-22 15:17:38', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('665', '依兰县', '597', '656', '655', '2015-05-22 15:17:38', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('666', '方正县', '598', '656', '655', '2015-05-22 15:17:38', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('667', '宾县', '599', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('668', '巴彦县', '600', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('669', '木兰县', '601', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('670', '通河县', '602', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('671', '延寿县', '603', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('672', '阿城市', '604', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('673', '双城市', '605', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('674', '尚志市', '606', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('675', '五常市', '607', '656', '655', '2015-05-22 15:17:39', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('676', '齐齐哈尔市', '61', '655', '655', '2015-05-22 15:17:39', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('677', '龙沙区', '608', '676', '676', '2015-05-22 15:17:39', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('678', '建华区', '609', '676', '676', '2015-05-22 15:17:39', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('679', '铁锋区', '610', '676', '676', '2015-05-22 15:17:39', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('680', '昂昂溪区', '611', '676', '676', '2015-05-22 15:17:39', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('681', '富拉尔基区', '612', '676', '676', '2015-05-22 15:17:39', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('682', '碾子山区', '613', '676', '676', '2015-05-22 15:17:39', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('683', '梅里斯达斡尔族区', '614', '676', '676', '2015-05-22 15:17:39', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('684', '龙江县', '615', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('685', '依安县', '616', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('686', '泰来县', '617', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('687', '甘南县', '618', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('688', '富裕县', '619', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('689', '克山县', '620', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('690', '克东县', '621', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('691', '拜泉县', '622', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('692', '讷河市', '623', '676', '655', '2015-05-22 15:17:39', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('693', '鸡西市', '62', '655', '655', '2015-05-22 15:17:39', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('694', '鸡冠区', '624', '693', '693', '2015-05-22 15:17:39', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('695', '恒山区', '625', '693', '693', '2015-05-22 15:17:39', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('696', '滴道区', '626', '693', '693', '2015-05-22 15:17:39', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('697', '梨树区', '627', '693', '693', '2015-05-22 15:17:39', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('698', '城子河区', '628', '693', '693', '2015-05-22 15:17:40', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('699', '麻山区', '629', '693', '693', '2015-05-22 15:17:40', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('700', '鸡东县', '630', '693', '655', '2015-05-22 15:17:40', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('701', '虎林市', '631', '693', '655', '2015-05-22 15:17:40', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('702', '密山市', '632', '693', '655', '2015-05-22 15:17:40', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('703', '鹤岗市', '63', '655', '655', '2015-05-22 15:17:40', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('704', '向阳区', '633', '703', '703', '2015-05-22 15:17:40', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('705', '工农区', '634', '703', '703', '2015-05-22 15:17:40', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('706', '南山区', '635', '703', '703', '2015-05-22 15:17:40', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('707', '兴安区', '636', '703', '703', '2015-05-22 15:17:40', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('708', '东山区', '637', '703', '703', '2015-05-22 15:17:40', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('709', '兴山区', '638', '703', '703', '2015-05-22 15:17:40', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('710', '萝北县', '639', '703', '655', '2015-05-22 15:17:40', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('711', '绥滨县', '640', '703', '655', '2015-05-22 15:17:40', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('712', '双鸭山市', '64', '655', '655', '2015-05-22 15:17:40', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('713', '尖山区', '641', '712', '712', '2015-05-22 15:17:40', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('714', '岭东区', '642', '712', '712', '2015-05-22 15:17:40', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('715', '四方台区', '643', '712', '712', '2015-05-22 15:17:40', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('716', '宝山区', '644', '712', '712', '2015-05-22 15:17:40', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('717', '集贤县', '645', '712', '655', '2015-05-22 15:17:40', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('718', '友谊县', '646', '712', '655', '2015-05-22 15:17:40', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('719', '宝清县', '647', '712', '655', '2015-05-22 15:17:40', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('720', '饶河县', '648', '712', '655', '2015-05-22 15:17:40', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('721', '大庆市', '65', '655', '655', '2015-05-22 15:17:40', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('722', '萨尔图区', '649', '721', '721', '2015-05-22 15:17:40', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('723', '龙凤区', '650', '721', '721', '2015-05-22 15:17:40', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('724', '让胡路区', '651', '721', '721', '2015-05-22 15:17:40', '', '3', '3', 'R', '0');
INSERT INTO `lr_province` VALUES ('725', '红岗区', '652', '721', '721', '2015-05-22 15:17:40', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('726', '大同区', '653', '721', '721', '2015-05-22 15:17:40', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('727', '肇州县', '654', '721', '655', '2015-05-22 15:17:40', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('728', '肇源县', '655', '721', '655', '2015-05-22 15:17:41', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('729', '林甸县', '656', '721', '655', '2015-05-22 15:17:41', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('730', '杜尔伯特蒙古族自治县', '657', '721', '655', '2015-05-22 15:17:41', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('731', '伊春市', '66', '655', '655', '2015-05-22 15:17:41', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('732', '伊春区', '658', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('733', '南岔区', '659', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('734', '友好区', '660', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('735', '西林区', '661', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('736', '翠峦区', '662', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('737', '新青区', '663', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('738', '美溪区', '664', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('739', '金山屯区', '665', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('740', '五营区', '666', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('741', '乌马河区', '667', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('742', '汤旺河区', '668', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('743', '带岭区', '669', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('744', '乌伊岭区', '670', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('745', '红星区', '671', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('746', '上甘岭区', '672', '731', '731', '2015-05-22 15:17:41', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('747', '嘉荫县', '673', '731', '655', '2015-05-22 15:17:41', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('748', '铁力市', '674', '731', '655', '2015-05-22 15:17:41', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('749', '佳木斯市', '67', '655', '655', '2015-05-22 15:17:41', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('750', '永红区', '675', '749', '749', '2015-05-22 15:17:41', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('751', '向阳区', '676', '749', '749', '2015-05-22 15:17:41', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('752', '前进区', '677', '749', '749', '2015-05-22 15:17:41', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('753', '东风区', '678', '749', '749', '2015-05-22 15:17:41', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('754', '郊区', '679', '749', '749', '2015-05-22 15:17:41', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('755', '桦南县', '680', '749', '655', '2015-05-22 15:17:41', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('756', '桦川县', '681', '749', '655', '2015-05-22 15:17:41', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('757', '汤原县', '682', '749', '655', '2015-05-22 15:17:41', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('758', '抚远县', '683', '749', '655', '2015-05-22 15:17:41', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('759', '同江市', '684', '749', '655', '2015-05-22 15:17:42', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('760', '富锦市', '685', '749', '655', '2015-05-22 15:17:42', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('761', '七台河市', '68', '655', '655', '2015-05-22 15:17:42', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('762', '新兴区', '686', '761', '761', '2015-05-22 15:17:42', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('763', '桃山区', '687', '761', '761', '2015-05-22 15:17:42', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('764', '茄子河区', '688', '761', '761', '2015-05-22 15:17:42', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('765', '勃利县', '689', '761', '655', '2015-05-22 15:17:42', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('766', '牡丹江市', '69', '655', '655', '2015-05-22 15:17:42', '', '2', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('767', '东安区', '690', '766', '766', '2015-05-22 15:17:42', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('768', '阳明区', '691', '766', '766', '2015-05-22 15:17:42', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('769', '爱民区', '692', '766', '766', '2015-05-22 15:17:42', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('770', '西安区', '693', '766', '766', '2015-05-22 15:17:42', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('771', '东宁县', '694', '766', '655', '2015-05-22 15:17:42', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('772', '林口县', '695', '766', '655', '2015-05-22 15:17:42', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('773', '绥芬河市', '696', '766', '655', '2015-05-22 15:17:42', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('774', '海林市', '697', '766', '655', '2015-05-22 15:17:42', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('775', '宁安市', '698', '766', '655', '2015-05-22 15:17:42', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('776', '穆棱市', '699', '766', '655', '2015-05-22 15:17:42', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('777', '黑河市', '70', '655', '655', '2015-05-22 15:17:42', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('778', '爱辉区', '700', '777', '777', '2015-05-22 15:17:42', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('779', '嫩江县', '701', '777', '655', '2015-05-22 15:17:42', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('780', '逊克县', '702', '777', '655', '2015-05-22 15:17:42', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('781', '孙吴县', '703', '777', '655', '2015-05-22 15:17:42', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('782', '北安市', '704', '777', '655', '2015-05-22 15:17:42', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('783', '五大连池市', '705', '777', '655', '2015-05-22 15:17:42', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('784', '绥化市', '71', '655', '655', '2015-05-22 15:17:42', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('785', '北林区', '706', '784', '784', '2015-05-22 15:17:42', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('786', '望奎县', '707', '784', '655', '2015-05-22 15:17:42', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('787', '兰西县', '708', '784', '655', '2015-05-22 15:17:42', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('788', '青冈县', '709', '784', '655', '2015-05-22 15:17:43', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('789', '庆安县', '710', '784', '655', '2015-05-22 15:17:43', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('790', '明水县', '711', '784', '655', '2015-05-22 15:17:43', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('791', '绥棱县', '712', '784', '655', '2015-05-22 15:17:43', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('792', '安达市', '713', '784', '655', '2015-05-22 15:17:43', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('793', '肇东市', '714', '784', '655', '2015-05-22 15:17:43', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('794', '海伦市', '715', '784', '655', '2015-05-22 15:17:43', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('795', '大兴安岭地区', '72', '655', '655', '2015-05-22 15:17:43', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('796', '呼玛县', '716', '795', '655', '2015-05-22 15:17:43', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('797', '塔河县', '717', '795', '655', '2015-05-22 15:17:43', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('798', '漠河县', '718', '795', '655', '2015-05-22 15:17:43', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('799', '上海', '9', null, null, '2015-05-22 15:17:43', '', '1', '1', 'S', '0');
INSERT INTO `lr_province` VALUES ('800', '上海市', '73', '799', '799', '2015-05-22 15:17:43', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('801', '黄浦区', '719', '800', '800', '2015-05-22 15:17:43', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('802', '卢湾区', '720', '800', '800', '2015-05-22 15:17:43', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('803', '徐汇区', '721', '800', '800', '2015-05-22 15:17:43', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('804', '长宁区', '722', '800', '800', '2015-05-22 15:17:43', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('805', '静安区', '723', '800', '800', '2015-05-22 15:17:43', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('806', '普陀区', '724', '800', '800', '2015-05-22 15:17:43', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('807', '闸北区', '725', '800', '800', '2015-05-22 15:17:43', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('808', '虹口区', '726', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('809', '杨浦区', '727', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('810', '闵行区', '728', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('811', '宝山区', '729', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('812', '嘉定区', '730', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('813', '浦东新区', '731', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('814', '金山区', '732', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('815', '松江区', '733', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('816', '青浦区', '734', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('817', '南汇区', '735', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('818', '奉贤区', '736', '800', '800', '2015-05-22 15:17:44', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('819', '崇明县', '737', '800', '799', '2015-05-22 15:17:44', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('820', '江苏', '10', null, null, '2015-05-22 15:17:44', '', '1', '1', 'J', '0');
INSERT INTO `lr_province` VALUES ('821', '南京市', '74', '820', '820', '2015-05-22 15:17:44', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('822', '玄武区', '738', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('823', '白下区', '739', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('824', '秦淮区', '740', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('825', '建邺区', '741', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('826', '鼓楼区', '742', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('827', '下关区', '743', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('828', '浦口区', '744', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('829', '栖霞区', '745', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('830', '雨花台区', '746', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('831', '江宁区', '747', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('832', '六合区', '748', '821', '821', '2015-05-22 15:17:44', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('833', '溧水县', '749', '821', '820', '2015-05-22 15:17:44', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('834', '高淳县', '750', '821', '820', '2015-05-22 15:17:44', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('835', '无锡市', '75', '820', '820', '2015-05-22 15:17:44', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('836', '崇安区', '751', '835', '835', '2015-05-22 15:17:45', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('837', '南长区', '752', '835', '835', '2015-05-22 15:17:45', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('838', '北塘区', '753', '835', '835', '2015-05-22 15:17:45', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('839', '锡山区', '754', '835', '835', '2015-05-22 15:17:45', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('840', '惠山区', '755', '835', '835', '2015-05-22 15:17:45', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('841', '滨湖区', '756', '835', '835', '2015-05-22 15:17:45', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('842', '江阴市', '757', '835', '820', '2015-05-22 15:17:45', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('843', '宜兴市', '758', '835', '820', '2015-05-22 15:17:45', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('844', '徐州市', '76', '820', '820', '2015-05-22 15:17:45', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('845', '鼓楼区', '759', '844', '844', '2015-05-22 15:17:45', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('846', '云龙区', '760', '844', '844', '2015-05-22 15:17:45', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('847', '九里区', '761', '844', '844', '2015-05-22 15:17:45', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('848', '贾汪区', '762', '844', '844', '2015-05-22 15:17:45', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('849', '泉山区', '763', '844', '844', '2015-05-22 15:17:45', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('850', '丰县', '764', '844', '820', '2015-05-22 15:17:45', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('851', '沛县', '765', '844', '820', '2015-05-22 15:17:45', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('852', '铜山县', '766', '844', '820', '2015-05-22 15:17:45', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('853', '睢宁县', '767', '844', '820', '2015-05-22 15:17:45', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('854', '新沂市', '768', '844', '820', '2015-05-22 15:17:45', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('855', '邳州市', '769', '844', '820', '2015-05-22 15:17:45', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('856', '常州市', '77', '820', '820', '2015-05-22 15:17:45', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('857', '天宁区', '770', '856', '856', '2015-05-22 15:17:45', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('858', '钟楼区', '771', '856', '856', '2015-05-22 15:17:45', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('859', '戚墅堰区', '772', '856', '856', '2015-05-22 15:17:45', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('860', '新北区', '773', '856', '856', '2015-05-22 15:17:45', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('861', '武进区', '774', '856', '856', '2015-05-22 15:17:45', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('862', '溧阳市', '775', '856', '820', '2015-05-22 15:17:46', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('863', '金坛市', '776', '856', '820', '2015-05-22 15:17:46', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('864', '苏州市', '78', '820', '820', '2015-05-22 15:17:46', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('865', '沧浪区', '777', '864', '864', '2015-05-22 15:17:46', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('866', '平江区', '778', '864', '864', '2015-05-22 15:17:46', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('867', '金阊区', '779', '864', '864', '2015-05-22 15:17:46', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('868', '虎丘区', '780', '864', '864', '2015-05-22 15:17:46', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('869', '吴中区', '781', '864', '864', '2015-05-22 15:17:46', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('870', '相城区', '782', '864', '864', '2015-05-22 15:17:46', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('871', '常熟市', '783', '864', '820', '2015-05-22 15:17:46', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('872', '张家港市', '784', '864', '820', '2015-05-22 15:17:46', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('873', '昆山市', '785', '864', '820', '2015-05-22 15:17:46', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('874', '吴江市', '786', '864', '820', '2015-05-22 15:17:46', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('875', '太仓市', '787', '864', '820', '2015-05-22 15:17:46', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('876', '南通市', '79', '820', '820', '2015-05-22 15:17:46', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('877', '崇川区', '788', '876', '876', '2015-05-22 15:17:46', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('878', '港闸区', '789', '876', '876', '2015-05-22 15:17:46', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('879', '海安县', '790', '876', '820', '2015-05-22 15:17:46', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('880', '如东县', '791', '876', '820', '2015-05-22 15:17:46', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('881', '启东市', '792', '876', '820', '2015-05-22 15:17:46', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('882', '如皋市', '793', '876', '820', '2015-05-22 15:17:46', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('883', '通州市', '794', '876', '820', '2015-05-22 15:17:46', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('884', '海门市', '795', '876', '820', '2015-05-22 15:17:46', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('885', '连云港市', '80', '820', '820', '2015-05-22 15:17:46', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('886', '连云区', '796', '885', '885', '2015-05-22 15:17:46', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('887', '新浦区', '797', '885', '885', '2015-05-22 15:17:46', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('888', '海州区', '798', '885', '885', '2015-05-22 15:17:46', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('889', '赣榆区', '799', '885', '885', '2015-05-22 15:17:46', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('890', '东海县', '800', '885', '820', '2015-05-22 15:17:46', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('891', '灌云县', '801', '885', '820', '2015-05-22 15:17:46', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('892', '灌南县', '802', '885', '820', '2015-05-22 15:17:47', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('893', '淮安市', '81', '820', '820', '2015-05-22 15:17:47', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('894', '清河区', '803', '893', '893', '2015-05-22 15:17:47', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('895', '楚州区', '804', '893', '893', '2015-05-22 15:17:47', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('896', '淮阴区', '805', '893', '893', '2015-05-22 15:17:47', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('897', '清浦区', '806', '893', '893', '2015-05-22 15:17:47', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('898', '涟水县', '807', '893', '820', '2015-05-22 15:17:47', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('899', '洪泽县', '808', '893', '820', '2015-05-22 15:17:47', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('900', '盱眙县', '809', '893', '820', '2015-05-22 15:17:47', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('901', '金湖县', '810', '893', '820', '2015-05-22 15:17:47', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('902', '盐城市', '82', '820', '820', '2015-05-22 15:17:47', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('903', '亭湖区', '811', '902', '902', '2015-05-22 15:17:47', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('904', '盐都区', '812', '902', '902', '2015-05-22 15:17:47', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('905', '响水县', '813', '902', '820', '2015-05-22 15:17:47', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('906', '滨海县', '814', '902', '820', '2015-05-22 15:17:47', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('907', '阜宁县', '815', '902', '820', '2015-05-22 15:17:47', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('908', '射阳县', '816', '902', '820', '2015-05-22 15:17:47', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('909', '建湖县', '817', '902', '820', '2015-05-22 15:17:47', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('910', '东台市', '818', '902', '820', '2015-05-22 15:17:47', '', '3', '2', 'D', '1');
INSERT INTO `lr_province` VALUES ('911', '大丰市', '819', '902', '820', '2015-05-22 15:17:47', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('912', '扬州市', '83', '820', '820', '2015-05-22 15:17:47', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('913', '广陵区', '820', '912', '912', '2015-05-22 15:17:47', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('914', '邗江区', '821', '912', '912', '2015-05-22 15:17:47', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('915', '维扬区', '822', '912', '912', '2015-05-22 15:17:47', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('916', '宝应县', '823', '912', '820', '2015-05-22 15:17:47', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('917', '仪征市', '824', '912', '820', '2015-05-22 15:17:47', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('918', '高邮市', '825', '912', '820', '2015-05-22 15:17:47', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('919', '江都市', '826', '912', '820', '2015-05-22 15:17:47', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('920', '镇江市', '84', '820', '820', '2015-05-22 15:17:48', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('921', '京口区', '827', '920', '920', '2015-05-22 15:17:48', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('922', '润州区', '828', '920', '920', '2015-05-22 15:17:48', '', '3', '3', 'R', '0');
INSERT INTO `lr_province` VALUES ('923', '丹徒区', '829', '920', '920', '2015-05-22 15:17:48', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('924', '丹阳市', '830', '920', '820', '2015-05-22 15:17:48', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('925', '扬中市', '831', '920', '820', '2015-05-22 15:17:48', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('926', '句容市', '832', '920', '820', '2015-05-22 15:17:48', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('927', '泰州市', '85', '820', '820', '2015-05-22 15:17:48', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('928', '海陵区', '833', '927', '927', '2015-05-22 15:17:48', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('929', '高港区', '834', '927', '927', '2015-05-22 15:17:48', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('930', '兴化市', '835', '927', '820', '2015-05-22 15:17:48', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('931', '靖江市', '836', '927', '820', '2015-05-22 15:17:48', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('932', '泰兴市', '837', '927', '820', '2015-05-22 15:17:48', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('933', '姜堰市', '838', '927', '820', '2015-05-22 15:17:48', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('934', '宿迁市', '86', '820', '820', '2015-05-22 15:17:48', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('935', '宿城区', '839', '934', '934', '2015-05-22 15:17:48', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('936', '宿豫区', '840', '934', '934', '2015-05-22 15:17:48', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('937', '沭阳县', '841', '934', '820', '2015-05-22 15:17:48', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('938', '泗阳县', '842', '934', '820', '2015-05-22 15:17:48', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('939', '泗洪县', '843', '934', '820', '2015-05-22 15:17:48', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('940', '浙江', '11', null, null, '2015-05-22 15:17:48', '', '1', '1', 'Z', '0');
INSERT INTO `lr_province` VALUES ('941', '杭州市', '87', '940', '940', '2015-05-22 15:17:48', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('942', '上城区', '844', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('943', '下城区', '845', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('944', '江干区', '846', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('945', '拱墅区', '847', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('946', '西湖区', '848', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('947', '滨江区', '849', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('948', '萧山区', '850', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('949', '余杭区', '851', '941', '941', '2015-05-22 15:17:48', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('950', '桐庐县', '852', '941', '940', '2015-05-22 15:17:48', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('951', '淳安县', '853', '941', '940', '2015-05-22 15:17:48', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('952', '建德市', '854', '941', '940', '2015-05-22 15:17:49', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('953', '富阳市', '855', '941', '940', '2015-05-22 15:17:49', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('954', '临安市', '856', '941', '940', '2015-05-22 15:17:49', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('955', '宁波市', '88', '940', '940', '2015-05-22 15:17:49', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('956', '海曙区', '857', '955', '955', '2015-05-22 15:17:49', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('957', '江东区', '858', '955', '955', '2015-05-22 15:17:49', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('958', '江北区', '859', '955', '955', '2015-05-22 15:17:49', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('959', '北仑区', '860', '955', '955', '2015-05-22 15:17:49', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('960', '镇海区', '861', '955', '955', '2015-05-22 15:17:49', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('961', '鄞州区', '862', '955', '955', '2015-05-22 15:17:49', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('962', '象山县', '863', '955', '940', '2015-05-22 15:17:49', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('963', '宁海县', '864', '955', '940', '2015-05-22 15:17:49', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('964', '余姚市', '865', '955', '940', '2015-05-22 15:17:49', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('965', '慈溪市', '866', '955', '940', '2015-05-22 15:17:49', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('966', '奉化市', '867', '955', '940', '2015-05-22 15:17:49', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('967', '温州市', '89', '940', '940', '2015-05-22 15:17:49', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('968', '鹿城区', '868', '967', '967', '2015-05-22 15:17:49', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('969', '龙湾区', '869', '967', '967', '2015-05-22 15:17:49', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('970', '瓯海区', '870', '967', '967', '2015-05-22 15:17:49', '', '3', '3', 'O', '0');
INSERT INTO `lr_province` VALUES ('971', '洞头县', '871', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('972', '永嘉县', '872', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('973', '平阳县', '873', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('974', '苍南县', '874', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('975', '文成县', '875', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('976', '泰顺县', '876', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('977', '瑞安市', '877', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('978', '乐清市', '878', '967', '940', '2015-05-22 15:17:49', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('979', '嘉兴市', '90', '940', '940', '2015-05-22 15:17:49', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('980', '秀城区', '879', '979', '979', '2015-05-22 15:17:49', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('981', '秀洲区', '880', '979', '979', '2015-05-22 15:17:49', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('982', '嘉善县', '881', '979', '940', '2015-05-22 15:17:50', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('983', '海盐县', '882', '979', '940', '2015-05-22 15:17:50', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('984', '海宁市', '883', '979', '940', '2015-05-22 15:17:50', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('985', '平湖市', '884', '979', '940', '2015-05-22 15:17:50', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('986', '桐乡市', '885', '979', '940', '2015-05-22 15:17:50', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('987', '湖州市', '91', '940', '940', '2015-05-22 15:17:50', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('988', '吴兴区', '886', '987', '987', '2015-05-22 15:17:50', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('989', '南浔区', '887', '987', '987', '2015-05-22 15:17:50', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('990', '德清县', '888', '987', '940', '2015-05-22 15:17:50', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('991', '长兴县', '889', '987', '940', '2015-05-22 15:17:50', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('992', '安吉县', '890', '987', '940', '2015-05-22 15:17:50', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('993', '绍兴市', '92', '940', '940', '2015-05-22 15:17:50', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('994', '越城区', '891', '993', '993', '2015-05-22 15:17:50', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('995', '绍兴县', '892', '993', '940', '2015-05-22 15:17:50', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('996', '新昌县', '893', '993', '940', '2015-05-22 15:17:50', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('997', '诸暨市', '894', '993', '940', '2015-05-22 15:17:50', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('998', '上虞市', '895', '993', '940', '2015-05-22 15:17:50', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('999', '嵊州市', '896', '993', '940', '2015-05-22 15:17:50', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1000', '金华市', '93', '940', '940', '2015-05-22 15:17:50', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1001', '婺城区', '897', '1000', '1000', '2015-05-22 15:17:50', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1002', '金东区', '898', '1000', '1000', '2015-05-22 15:17:50', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1003', '武义县', '899', '1000', '940', '2015-05-22 15:17:50', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1004', '浦江县', '900', '1000', '940', '2015-05-22 15:17:50', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1005', '磐安县', '901', '1000', '940', '2015-05-22 15:17:50', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1006', '兰溪市', '902', '1000', '940', '2015-05-22 15:17:50', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1007', '义乌市', '903', '1000', '940', '2015-05-22 15:17:50', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1008', '东阳市', '904', '1000', '940', '2015-05-22 15:17:51', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1009', '永康市', '905', '1000', '940', '2015-05-22 15:17:51', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1010', '衢州市', '94', '940', '940', '2015-05-22 15:17:51', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1011', '柯城区', '906', '1010', '1010', '2015-05-22 15:17:51', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('1012', '衢江区', '907', '1010', '1010', '2015-05-22 15:17:51', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1013', '常山县', '908', '1010', '940', '2015-05-22 15:17:51', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1014', '开化县', '909', '1010', '940', '2015-05-22 15:17:51', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('1015', '龙游县', '910', '1010', '940', '2015-05-22 15:17:51', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1016', '江山市', '911', '1010', '940', '2015-05-22 15:17:51', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1017', '舟山市', '95', '940', '940', '2015-05-22 15:17:51', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1018', '定海区', '912', '1017', '1017', '2015-05-22 15:17:51', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1019', '普陀区', '913', '1017', '1017', '2015-05-22 15:17:51', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('1020', '岱山县', '914', '1017', '940', '2015-05-22 15:17:51', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1021', '嵊泗县', '915', '1017', '940', '2015-05-22 15:17:51', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1022', '台州市', '96', '940', '940', '2015-05-22 15:17:51', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1023', '椒江区', '916', '1022', '1022', '2015-05-22 15:17:51', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1024', '黄岩区', '917', '1022', '1022', '2015-05-22 15:17:51', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1025', '路桥区', '918', '1022', '1022', '2015-05-22 15:17:51', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1026', '玉环县', '919', '1022', '940', '2015-05-22 15:17:51', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1027', '三门县', '920', '1022', '940', '2015-05-22 15:17:51', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1028', '天台县', '921', '1022', '940', '2015-05-22 15:17:51', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1029', '仙居县', '922', '1022', '940', '2015-05-22 15:17:51', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1030', '温岭市', '923', '1022', '940', '2015-05-22 15:17:51', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1031', '临海市', '924', '1022', '940', '2015-05-22 15:17:51', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1032', '丽水市', '97', '940', '940', '2015-05-22 15:17:51', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1033', '莲都区', '925', '1032', '1032', '2015-05-22 15:17:51', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1034', '青田县', '926', '1032', '940', '2015-05-22 15:17:51', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1035', '缙云县', '927', '1032', '940', '2015-05-22 15:17:51', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1036', '遂昌县', '928', '1032', '940', '2015-05-22 15:17:52', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1037', '松阳县', '929', '1032', '940', '2015-05-22 15:17:52', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1038', '云和县', '930', '1032', '940', '2015-05-22 15:17:52', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1039', '庆元县', '931', '1032', '940', '2015-05-22 15:17:52', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1040', '景宁畲族自治县', '932', '1032', '940', '2015-05-22 15:17:52', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1041', '龙泉市', '933', '1032', '940', '2015-05-22 15:17:52', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1042', '安徽', '12', null, null, '2015-05-22 15:17:52', '', '1', '1', 'A', '0');
INSERT INTO `lr_province` VALUES ('1043', '合肥市', '98', '1042', '1042', '2015-05-22 15:17:52', '', '2', '2', 'H', '1');
INSERT INTO `lr_province` VALUES ('1044', '瑶海区', '934', '1043', '1043', '2015-05-22 15:17:52', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1045', '庐阳区', '935', '1043', '1043', '2015-05-22 15:17:52', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1046', '蜀山区', '936', '1043', '1043', '2015-05-22 15:17:52', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1047', '包河区', '937', '1043', '1043', '2015-05-22 15:17:52', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1048', '长丰县', '938', '1043', '1042', '2015-05-22 15:17:52', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1049', '肥东县', '939', '1043', '1042', '2015-05-22 15:17:52', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1050', '庐江县', '1013', '1043', '1042', '2015-05-22 15:17:52', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1051', '巢湖市', '110', '1043', '1042', '2015-05-22 15:17:52', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1052', '肥西县', '940', '1043', '1042', '2015-05-22 15:17:52', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1053', '芜湖市', '99', '1042', '1042', '2015-05-22 15:17:52', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1054', '镜湖区', '941', '1053', '1053', '2015-05-22 15:17:52', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1055', '三山区', '942', '1053', '1053', '2015-05-22 15:17:52', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1056', '新芜区', '943', '1053', '1053', '2015-05-22 15:17:52', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1057', '鸠江区', '944', '1053', '1053', '2015-05-22 15:17:52', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1058', '芜湖县', '945', '1053', '1042', '2015-05-22 15:17:53', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1059', '繁昌县', '946', '1053', '1042', '2015-05-22 15:17:53', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1060', '无为县', '1014', '1053', '1042', '2015-05-22 15:17:53', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1061', '南陵县', '947', '1053', '1042', '2015-05-22 15:17:53', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1062', '蚌埠市', '100', '1042', '1042', '2015-05-22 15:17:53', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1063', '龙子湖区', '948', '1062', '1062', '2015-05-22 15:17:53', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1064', '蚌山区', '949', '1062', '1062', '2015-05-22 15:17:53', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1065', '禹会区', '950', '1062', '1062', '2015-05-22 15:17:53', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1066', '淮上区', '951', '1062', '1062', '2015-05-22 15:17:53', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1067', '怀远县', '952', '1062', '1042', '2015-05-22 15:17:53', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1068', '五河县', '953', '1062', '1042', '2015-05-22 15:17:53', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1069', '固镇县', '954', '1062', '1042', '2015-05-22 15:17:53', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1070', '淮南市', '101', '1042', '1042', '2015-05-22 15:17:53', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1071', '大通区', '955', '1070', '1070', '2015-05-22 15:17:53', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1072', '田家庵区', '956', '1070', '1070', '2015-05-22 15:17:53', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1073', '谢家集区', '957', '1070', '1070', '2015-05-22 15:17:53', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1074', '八公山区', '958', '1070', '1070', '2015-05-22 15:17:53', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1075', '潘集区', '959', '1070', '1070', '2015-05-22 15:17:53', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('1076', '凤台县', '960', '1070', '1042', '2015-05-22 15:17:53', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1077', '马鞍山市', '102', '1042', '1042', '2015-05-22 15:17:53', '', '2', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1078', '金家庄区', '961', '1077', '1077', '2015-05-22 15:17:53', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1079', '花山区', '962', '1077', '1077', '2015-05-22 15:17:53', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1080', '雨山区', '963', '1077', '1077', '2015-05-22 15:17:53', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1081', '当涂县', '964', '1077', '1042', '2015-05-22 15:17:53', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1082', '含山县', '1015', '1077', '1042', '2015-05-22 15:17:53', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1083', '和县', '1016', '1077', '1042', '2015-05-22 15:17:53', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1084', '淮北市', '103', '1042', '1042', '2015-05-22 15:17:53', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1085', '杜集区', '965', '1084', '1084', '2015-05-22 15:17:54', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1086', '相山区', '966', '1084', '1084', '2015-05-22 15:17:54', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1087', '烈山区', '967', '1084', '1084', '2015-05-22 15:17:54', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1088', '濉溪县', '968', '1084', '1042', '2015-05-22 15:17:54', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1089', '铜陵市', '104', '1042', '1042', '2015-05-22 15:17:54', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1090', '铜官山区', '969', '1089', '1089', '2015-05-22 15:17:54', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1091', '狮子山区', '970', '1089', '1089', '2015-05-22 15:17:54', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1092', '郊区', '971', '1089', '1089', '2015-05-22 15:17:54', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1093', '铜陵县', '972', '1089', '1042', '2015-05-22 15:17:54', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1094', '安庆市', '105', '1042', '1042', '2015-05-22 15:17:54', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1095', '迎江区', '973', '1094', '1094', '2015-05-22 15:17:54', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1096', '大观区', '974', '1094', '1094', '2015-05-22 15:17:54', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1097', '郊区', '975', '1094', '1094', '2015-05-22 15:17:54', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1098', '怀宁县', '976', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1099', '枞阳县', '977', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1100', '潜山县', '978', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1101', '太湖县', '979', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1102', '宿松县', '980', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1103', '望江县', '981', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1104', '岳西县', '982', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1105', '桐城市', '983', '1094', '1042', '2015-05-22 15:17:54', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1106', '黄山市', '106', '1042', '1042', '2015-05-22 15:17:54', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1107', '屯溪区', '984', '1106', '1106', '2015-05-22 15:17:54', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1108', '黄山区', '985', '1106', '1106', '2015-05-22 15:17:54', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1109', '徽州区', '986', '1106', '1106', '2015-05-22 15:17:54', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1110', '歙县', '987', '1106', '1042', '2015-05-22 15:17:54', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1111', '休宁县', '988', '1106', '1042', '2015-05-22 15:17:54', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1112', '黟县', '989', '1106', '1042', '2015-05-22 15:17:54', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1113', '祁门县', '990', '1106', '1042', '2015-05-22 15:17:54', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1114', '滁州市', '107', '1042', '1042', '2015-05-22 15:17:54', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1115', '琅琊区', '991', '1114', '1114', '2015-05-22 15:17:55', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1116', '南谯区', '992', '1114', '1114', '2015-05-22 15:17:55', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('1117', '来安县', '993', '1114', '1042', '2015-05-22 15:17:55', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1118', '全椒县', '994', '1114', '1042', '2015-05-22 15:17:55', '', '3', '2', 'Q', '1');
INSERT INTO `lr_province` VALUES ('1119', '定远县', '995', '1114', '1042', '2015-05-22 15:17:55', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1120', '凤阳县', '996', '1114', '1042', '2015-05-22 15:17:55', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1121', '天长市', '997', '1114', '1042', '2015-05-22 15:17:55', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1122', '明光市', '998', '1114', '1042', '2015-05-22 15:17:55', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1123', '阜阳市', '108', '1042', '1042', '2015-05-22 15:17:55', '', '2', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1124', '颍州区', '999', '1123', '1123', '2015-05-22 15:17:55', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1125', '颍东区', '1000', '1123', '1123', '2015-05-22 15:17:55', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1126', '颍泉区', '1001', '1123', '1123', '2015-05-22 15:17:55', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1127', '临泉县', '1002', '1123', '1042', '2015-05-22 15:17:55', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1128', '太和县', '1003', '1123', '1042', '2015-05-22 15:17:55', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1129', '阜南县', '1004', '1123', '1042', '2015-05-22 15:17:55', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1130', '颍上县', '1005', '1123', '1042', '2015-05-22 15:17:55', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1131', '界首市', '1006', '1123', '1042', '2015-05-22 15:17:55', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1132', '宿州市', '109', '1042', '1042', '2015-05-22 15:17:55', '', '2', '2', 'S', '1');
INSERT INTO `lr_province` VALUES ('1133', '埇桥区', '1007', '1132', '1132', '2015-05-22 15:17:55', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1134', '砀山县', '1008', '1132', '1042', '2015-05-22 15:17:55', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1135', '萧县', '1009', '1132', '1042', '2015-05-22 15:17:55', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1136', '灵璧县', '1010', '1132', '1042', '2015-05-22 15:17:55', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1137', '泗县', '1011', '1132', '1042', '2015-05-22 15:17:55', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1138', '六安市', '111', '1042', '1042', '2015-05-22 15:17:55', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1139', '金安区', '1017', '1138', '1138', '2015-05-22 15:17:55', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1140', '裕安区', '1018', '1138', '1138', '2015-05-22 15:17:55', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1141', '寿县', '1019', '1138', '1042', '2015-05-22 15:17:55', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1142', '霍邱县', '1020', '1138', '1042', '2015-05-22 15:17:55', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1143', '舒城县', '1021', '1138', '1042', '2015-05-22 15:17:55', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1144', '金寨县', '1022', '1138', '1042', '2015-05-22 15:17:56', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1145', '霍山县', '1023', '1138', '1042', '2015-05-22 15:17:56', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1146', '亳州市', '112', '1042', '1042', '2015-05-22 15:17:56', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1147', '谯城区', '1024', '1146', '1146', '2015-05-22 15:17:56', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1148', '涡阳县', '1025', '1146', '1042', '2015-05-22 15:17:56', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1149', '蒙城县', '1026', '1146', '1042', '2015-05-22 15:17:56', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1150', '利辛县', '1027', '1146', '1042', '2015-05-22 15:17:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1151', '池州市', '113', '1042', '1042', '2015-05-22 15:17:56', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1152', '贵池区', '1028', '1151', '1151', '2015-05-22 15:17:56', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('1153', '东至县', '1029', '1151', '1042', '2015-05-22 15:17:56', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1154', '石台县', '1030', '1151', '1042', '2015-05-22 15:17:56', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1155', '青阳县', '1031', '1151', '1042', '2015-05-22 15:17:56', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1156', '宣城市', '114', '1042', '1042', '2015-05-22 15:17:56', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1157', '宣州区', '1032', '1156', '1156', '2015-05-22 15:17:56', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1158', '郎溪县', '1033', '1156', '1042', '2015-05-22 15:17:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1159', '广德县', '1034', '1156', '1042', '2015-05-22 15:17:56', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1160', '泾县', '1035', '1156', '1042', '2015-05-22 15:17:56', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1161', '绩溪县', '1036', '1156', '1042', '2015-05-22 15:17:56', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1162', '旌德县', '1037', '1156', '1042', '2015-05-22 15:17:56', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1163', '宁国市', '1038', '1156', '1042', '2015-05-22 15:17:56', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1164', '福建', '13', null, null, '2015-05-22 15:17:56', '', '1', '1', 'F', '0');
INSERT INTO `lr_province` VALUES ('1165', '福州市', '115', '1164', '1164', '2015-05-22 15:17:56', '', '2', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1166', '鼓楼区', '1039', '1165', '1165', '2015-05-22 15:17:56', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('1167', '台江区', '1040', '1165', '1165', '2015-05-22 15:17:56', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1168', '仓山区', '1041', '1165', '1165', '2015-05-22 15:17:56', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1169', '马尾区', '1042', '1165', '1165', '2015-05-22 15:17:56', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('1170', '晋安区', '1043', '1165', '1165', '2015-05-22 15:17:56', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1171', '闽侯县', '1044', '1165', '1164', '2015-05-22 15:17:56', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1172', '连江县', '1045', '1165', '1164', '2015-05-22 15:17:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1173', '罗源县', '1046', '1165', '1164', '2015-05-22 15:17:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1174', '闽清县', '1047', '1165', '1164', '2015-05-22 15:17:56', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1175', '永泰县', '1048', '1165', '1164', '2015-05-22 15:17:57', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1176', '平潭县', '1049', '1165', '1164', '2015-05-22 15:17:57', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1177', '福清市', '1050', '1165', '1164', '2015-05-22 15:17:57', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1178', '长乐市', '1051', '1165', '1164', '2015-05-22 15:17:57', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1179', '厦门市', '116', '1164', '1164', '2015-05-22 15:17:57', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1180', '思明区', '1052', '1179', '1179', '2015-05-22 15:17:57', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1181', '海沧区', '1053', '1179', '1179', '2015-05-22 15:17:57', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1182', '湖里区', '1054', '1179', '1179', '2015-05-22 15:17:57', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1183', '集美区', '1055', '1179', '1179', '2015-05-22 15:17:57', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1184', '同安区', '1056', '1179', '1179', '2015-05-22 15:17:57', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1185', '翔安区', '1057', '1179', '1179', '2015-05-22 15:17:57', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1186', '莆田市', '117', '1164', '1164', '2015-05-22 15:17:57', '', '2', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1187', '城厢区', '1058', '1186', '1186', '2015-05-22 15:17:57', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1188', '涵江区', '1059', '1186', '1186', '2015-05-22 15:17:57', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1189', '荔城区', '1060', '1186', '1186', '2015-05-22 15:17:57', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1190', '秀屿区', '1061', '1186', '1186', '2015-05-22 15:17:57', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1191', '仙游县', '1062', '1186', '1164', '2015-05-22 15:17:57', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1192', '三明市', '118', '1164', '1164', '2015-05-22 15:17:57', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1193', '梅列区', '1063', '1192', '1192', '2015-05-22 15:17:57', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('1194', '三元区', '1064', '1192', '1192', '2015-05-22 15:17:57', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1195', '明溪县', '1065', '1192', '1164', '2015-05-22 15:17:57', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1196', '清流县', '1066', '1192', '1164', '2015-05-22 15:17:57', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1197', '宁化县', '1067', '1192', '1164', '2015-05-22 15:17:57', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1198', '大田县', '1068', '1192', '1164', '2015-05-22 15:17:57', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1199', '尤溪县', '1069', '1192', '1164', '2015-05-22 15:17:57', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1200', '沙县', '1070', '1192', '1164', '2015-05-22 15:17:57', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1201', '将乐县', '1071', '1192', '1164', '2015-05-22 15:17:58', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1202', '泰宁县', '1072', '1192', '1164', '2015-05-22 15:17:58', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1203', '建宁县', '1073', '1192', '1164', '2015-05-22 15:17:58', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1204', '永安市', '1074', '1192', '1164', '2015-05-22 15:17:58', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1205', '泉州市', '119', '1164', '1164', '2015-05-22 15:17:58', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1206', '鲤城区', '1075', '1205', '1205', '2015-05-22 15:17:58', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1207', '丰泽区', '1076', '1205', '1205', '2015-05-22 15:17:58', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1208', '洛江区', '1077', '1205', '1205', '2015-05-22 15:17:58', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1209', '泉港区', '1078', '1205', '1205', '2015-05-22 15:17:58', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1210', '惠安县', '1079', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1211', '安溪县', '1080', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1212', '永春县', '1081', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1213', '德化县', '1082', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1214', '金门县', '1083', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1215', '石狮市', '1084', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1216', '晋江市', '1085', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1217', '南安市', '1086', '1205', '1164', '2015-05-22 15:17:58', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1218', '漳州市', '120', '1164', '1164', '2015-05-22 15:17:58', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1219', '芗城区', '1087', '1218', '1218', '2015-05-22 15:17:58', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1220', '龙文区', '1088', '1218', '1218', '2015-05-22 15:17:58', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1221', '云霄县', '1089', '1218', '1164', '2015-05-22 15:17:58', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1222', '漳浦县', '1090', '1218', '1164', '2015-05-22 15:17:58', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1223', '诏安县', '1091', '1218', '1164', '2015-05-22 15:17:59', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1224', '长泰县', '1092', '1218', '1164', '2015-05-22 15:17:59', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1225', '东山县', '1093', '1218', '1164', '2015-05-22 15:17:59', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1226', '南靖县', '1094', '1218', '1164', '2015-05-22 15:17:59', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1227', '平和县', '1095', '1218', '1164', '2015-05-22 15:17:59', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1228', '华安县', '1096', '1218', '1164', '2015-05-22 15:17:59', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1229', '龙海市', '1097', '1218', '1164', '2015-05-22 15:17:59', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1230', '南平市', '121', '1164', '1164', '2015-05-22 15:17:59', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1231', '延平区', '1098', '1230', '1230', '2015-05-22 15:17:59', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1232', '顺昌县', '1099', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1233', '浦城县', '1100', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1234', '光泽县', '1101', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1235', '松溪县', '1102', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1236', '政和县', '1103', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1237', '邵武市', '1104', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1238', '武夷山市', '1105', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1239', '建瓯市', '1106', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1240', '建阳市', '1107', '1230', '1164', '2015-05-22 15:17:59', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1241', '龙岩市', '122', '1164', '1164', '2015-05-22 15:17:59', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1242', '新罗区', '1108', '1241', '1241', '2015-05-22 15:17:59', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1243', '长汀县', '1109', '1241', '1164', '2015-05-22 15:17:59', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1244', '永定县', '1110', '1241', '1164', '2015-05-22 15:17:59', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1245', '上杭县', '1111', '1241', '1164', '2015-05-22 15:17:59', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1246', '武平县', '1112', '1241', '1164', '2015-05-22 15:17:59', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1247', '连城县', '1113', '1241', '1164', '2015-05-22 15:17:59', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1248', '漳平市', '1114', '1241', '1164', '2015-05-22 15:17:59', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1249', '宁德市', '123', '1164', '1164', '2015-05-22 15:17:59', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1250', '蕉城区', '1115', '1249', '1249', '2015-05-22 15:18:00', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1251', '霞浦县', '1116', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1252', '古田县', '1117', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1253', '屏南县', '1118', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1254', '寿宁县', '1119', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1255', '周宁县', '1120', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1256', '柘荣县', '1121', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1257', '福安市', '1122', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1258', '福鼎市', '1123', '1249', '1164', '2015-05-22 15:18:00', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1259', '江西', '14', null, null, '2015-05-22 15:18:00', '', '1', '1', 'J', '0');
INSERT INTO `lr_province` VALUES ('1260', '南昌市', '124', '1259', '1259', '2015-05-22 15:18:00', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1261', '东湖区', '1124', '1260', '1260', '2015-05-22 15:18:00', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1262', '西湖区', '1125', '1260', '1260', '2015-05-22 15:18:00', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1263', '青云谱区', '1126', '1260', '1260', '2015-05-22 15:18:00', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1264', '湾里区', '1127', '1260', '1260', '2015-05-22 15:18:00', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1265', '青山湖区', '1128', '1260', '1260', '2015-05-22 15:18:00', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1266', '南昌县', '1129', '1260', '1259', '2015-05-22 15:18:00', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1267', '新建县', '1130', '1260', '1259', '2015-05-22 15:18:00', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1268', '安义县', '1131', '1260', '1259', '2015-05-22 15:18:00', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1269', '进贤县', '1132', '1260', '1259', '2015-05-22 15:18:00', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1270', '景德镇市', '125', '1259', '1259', '2015-05-22 15:18:00', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1271', '昌江区', '1133', '1270', '1270', '2015-05-22 15:18:00', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1272', '珠山区', '1134', '1270', '1270', '2015-05-22 15:18:00', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1273', '浮梁县', '1135', '1270', '1259', '2015-05-22 15:18:00', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1274', '乐平市', '1136', '1270', '1259', '2015-05-22 15:18:00', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1275', '萍乡市', '126', '1259', '1259', '2015-05-22 15:18:00', '', '2', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1276', '安源区', '1137', '1275', '1275', '2015-05-22 15:18:00', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('1277', '湘东区', '1138', '1275', '1275', '2015-05-22 15:18:00', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1278', '莲花县', '1139', '1275', '1259', '2015-05-22 15:18:00', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1279', '上栗县', '1140', '1275', '1259', '2015-05-22 15:18:01', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1280', '芦溪县', '1141', '1275', '1259', '2015-05-22 15:18:01', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1281', '九江市', '127', '1259', '1259', '2015-05-22 15:18:01', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1282', '庐山区', '1142', '1281', '1281', '2015-05-22 15:18:01', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1283', '浔阳区', '1143', '1281', '1281', '2015-05-22 15:18:01', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1284', '九江县', '1144', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1285', '武宁县', '1145', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1286', '修水县', '1146', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1287', '永修县', '1147', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1288', '德安县', '1148', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1289', '星子县', '1149', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1290', '都昌县', '1150', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1291', '湖口县', '1151', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1292', '彭泽县', '1152', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1293', '瑞昌市', '1153', '1281', '1259', '2015-05-22 15:18:01', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1294', '新余市', '128', '1259', '1259', '2015-05-22 15:18:01', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1295', '渝水区', '1154', '1294', '1294', '2015-05-22 15:18:01', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1296', '分宜县', '1155', '1294', '1259', '2015-05-22 15:18:01', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1297', '鹰潭市', '129', '1259', '1259', '2015-05-22 15:18:01', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1298', '月湖区', '1156', '1297', '1297', '2015-05-22 15:18:01', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1299', '余江县', '1157', '1297', '1259', '2015-05-22 15:18:01', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1300', '贵溪市', '1158', '1297', '1259', '2015-05-22 15:18:01', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1301', '赣州市', '130', '1259', '1259', '2015-05-22 15:18:01', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1302', '章贡区', '1159', '1301', '1301', '2015-05-22 15:18:01', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1303', '赣县', '1160', '1301', '1259', '2015-05-22 15:18:01', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1304', '信丰县', '1161', '1301', '1259', '2015-05-22 15:18:01', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1305', '大余县', '1162', '1301', '1259', '2015-05-22 15:18:01', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1306', '上犹县', '1163', '1301', '1259', '2015-05-22 15:18:01', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1307', '崇义县', '1164', '1301', '1259', '2015-05-22 15:18:01', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1308', '安远县', '1165', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1309', '龙南县', '1166', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1310', '定南县', '1167', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1311', '全南县', '1168', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1312', '宁都县', '1169', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1313', '于都县', '1170', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1314', '兴国县', '1171', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1315', '会昌县', '1172', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1316', '寻乌县', '1173', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1317', '石城县', '1174', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1318', '瑞金市', '1175', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1319', '南康市', '1176', '1301', '1259', '2015-05-22 15:18:02', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1320', '吉安市', '131', '1259', '1259', '2015-05-22 15:18:02', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1321', '吉州区', '1177', '1320', '1320', '2015-05-22 15:18:02', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1322', '青原区', '1178', '1320', '1320', '2015-05-22 15:18:02', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1323', '吉安县', '1179', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1324', '吉水县', '1180', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1325', '峡江县', '1181', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1326', '新干县', '1182', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1327', '永丰县', '1183', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1328', '泰和县', '1184', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1329', '遂川县', '1185', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1330', '万安县', '1186', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1331', '安福县', '1187', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1332', '永新县', '1188', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1333', '井冈山市', '1189', '1320', '1259', '2015-05-22 15:18:02', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1334', '宜春市', '132', '1259', '1259', '2015-05-22 15:18:02', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1335', '袁州区', '1190', '1334', '1334', '2015-05-22 15:18:02', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1336', '奉新县', '1191', '1334', '1259', '2015-05-22 15:18:02', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1337', '万载县', '1192', '1334', '1259', '2015-05-22 15:18:02', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1338', '上高县', '1193', '1334', '1259', '2015-05-22 15:18:02', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1339', '宜丰县', '1194', '1334', '1259', '2015-05-22 15:18:02', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1340', '靖安县', '1195', '1334', '1259', '2015-05-22 15:18:02', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1341', '铜鼓县', '1196', '1334', '1259', '2015-05-22 15:18:02', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1342', '丰城市', '1197', '1334', '1259', '2015-05-22 15:18:03', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1343', '樟树市', '1198', '1334', '1259', '2015-05-22 15:18:03', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1344', '高安市', '1199', '1334', '1259', '2015-05-22 15:18:03', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1345', '抚州市', '133', '1259', '1259', '2015-05-22 15:18:03', '', '2', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1346', '临川区', '1200', '1345', '1345', '2015-05-22 15:18:03', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1347', '南城县', '1201', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1348', '黎川县', '1202', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1349', '南丰县', '1203', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1350', '崇仁县', '1204', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1351', '乐安县', '1205', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1352', '宜黄县', '1206', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1353', '金溪县', '1207', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1354', '资溪县', '1208', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1355', '东乡县', '1209', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1356', '广昌县', '1210', '1345', '1259', '2015-05-22 15:18:03', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1357', '上饶市', '134', '1259', '1259', '2015-05-22 15:18:03', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1358', '信州区', '1211', '1357', '1357', '2015-05-22 15:18:03', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1359', '上饶县', '1212', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1360', '广丰县', '1213', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1361', '玉山县', '1214', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1362', '铅山县', '1215', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1363', '横峰县', '1216', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1364', '弋阳县', '1217', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1365', '余干县', '1218', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1366', '鄱阳县', '1219', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1367', '万年县', '1220', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1368', '婺源县', '1221', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1369', '德兴市', '1222', '1357', '1259', '2015-05-22 15:18:03', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1370', '山东', '15', null, null, '2015-05-22 15:18:03', '', '1', '1', 'S', '0');
INSERT INTO `lr_province` VALUES ('1371', '济南市', '135', '1370', '1370', '2015-05-22 15:18:03', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1372', '历下区', '1223', '1371', '1371', '2015-05-22 15:18:03', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1373', '市中区', '1224', '1371', '1371', '2015-05-22 15:18:04', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1374', '槐荫区', '1225', '1371', '1371', '2015-05-22 15:18:04', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1375', '天桥区', '1226', '1371', '1371', '2015-05-22 15:18:04', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1376', '历城区', '1227', '1371', '1371', '2015-05-22 15:18:04', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1377', '长清区', '1228', '1371', '1371', '2015-05-22 15:18:04', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1378', '平阴县', '1229', '1371', '1370', '2015-05-22 15:18:04', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1379', '济阳县', '1230', '1371', '1370', '2015-05-22 15:18:04', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1380', '商河县', '1231', '1371', '1370', '2015-05-22 15:18:04', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1381', '章丘市', '1232', '1371', '1370', '2015-05-22 15:18:04', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1382', '青岛市', '136', '1370', '1370', '2015-05-22 15:18:04', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1383', '市南区', '1233', '1382', '1382', '2015-05-22 15:18:04', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1384', '市北区', '1234', '1382', '1382', '2015-05-22 15:18:04', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1385', '四方区', '1235', '1382', '1382', '2015-05-22 15:18:04', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1386', '黄岛区', '1236', '1382', '1382', '2015-05-22 15:18:04', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1387', '崂山区', '1237', '1382', '1382', '2015-05-22 15:18:04', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1388', '李沧区', '1238', '1382', '1382', '2015-05-22 15:18:04', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1389', '城阳区', '1239', '1382', '1382', '2015-05-22 15:18:04', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1390', '胶州市', '1240', '1382', '1370', '2015-05-22 15:18:04', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1391', '即墨市', '1241', '1382', '1370', '2015-05-22 15:18:04', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1392', '平度市', '1242', '1382', '1370', '2015-05-22 15:18:04', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1393', '胶南市', '1243', '1382', '1370', '2015-05-22 15:18:04', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1394', '莱西市', '1244', '1382', '1370', '2015-05-22 15:18:04', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1395', '淄博市', '137', '1370', '1370', '2015-05-22 15:18:04', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1396', '淄川区', '1245', '1395', '1395', '2015-05-22 15:18:04', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1397', '张店区', '1246', '1395', '1395', '2015-05-22 15:18:04', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1398', '博山区', '1247', '1395', '1395', '2015-05-22 15:18:04', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1399', '临淄区', '1248', '1395', '1395', '2015-05-22 15:18:04', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1400', '周村区', '1249', '1395', '1395', '2015-05-22 15:18:04', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1401', '桓台县', '1250', '1395', '1370', '2015-05-22 15:18:04', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1402', '高青县', '1251', '1395', '1370', '2015-05-22 15:18:04', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1403', '沂源县', '1252', '1395', '1370', '2015-05-22 15:18:04', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1404', '枣庄市', '138', '1370', '1370', '2015-05-22 15:18:04', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1405', '市中区', '1253', '1404', '1404', '2015-05-22 15:18:04', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1406', '薛城区', '1254', '1404', '1404', '2015-05-22 15:18:05', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1407', '峄城区', '1255', '1404', '1404', '2015-05-22 15:18:05', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1408', '台儿庄区', '1256', '1404', '1404', '2015-05-22 15:18:05', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1409', '山亭区', '1257', '1404', '1404', '2015-05-22 15:18:05', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1410', '滕州市', '1258', '1404', '1370', '2015-05-22 15:18:05', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1411', '东营市', '139', '1370', '1370', '2015-05-22 15:18:05', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1412', '东营区', '1259', '1411', '1411', '2015-05-22 15:18:05', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1413', '河口区', '1260', '1411', '1411', '2015-05-22 15:18:05', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1414', '垦利县', '1261', '1411', '1370', '2015-05-22 15:18:05', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('1415', '利津县', '1262', '1411', '1370', '2015-05-22 15:18:05', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1416', '广饶县', '1263', '1411', '1370', '2015-05-22 15:18:05', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1417', '烟台市', '140', '1370', '1370', '2015-05-22 15:18:05', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1418', '芝罘区', '1264', '1417', '1417', '2015-05-22 15:18:05', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1419', '福山区', '1265', '1417', '1417', '2015-05-22 15:18:05', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1420', '牟平区', '1266', '1417', '1417', '2015-05-22 15:18:05', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('1421', '莱山区', '1267', '1417', '1417', '2015-05-22 15:18:05', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1422', '长岛县', '1268', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1423', '龙口市', '1269', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1424', '莱阳市', '1270', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1425', '莱州市', '1271', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1426', '蓬莱市', '1272', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1427', '招远市', '1273', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1428', '栖霞市', '1274', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1429', '海阳市', '1275', '1417', '1370', '2015-05-22 15:18:05', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1430', '潍坊市', '141', '1370', '1370', '2015-05-22 15:18:05', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1431', '潍城区', '1276', '1430', '1430', '2015-05-22 15:18:05', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1432', '寒亭区', '1277', '1430', '1430', '2015-05-22 15:18:05', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1433', '坊子区', '1278', '1430', '1430', '2015-05-22 15:18:05', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1434', '奎文区', '1279', '1430', '1430', '2015-05-22 15:18:05', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('1435', '临朐县', '1280', '1430', '1370', '2015-05-22 15:18:05', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1436', '昌乐县', '1281', '1430', '1370', '2015-05-22 15:18:06', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1437', '青州市', '1282', '1430', '1370', '2015-05-22 15:18:06', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1438', '诸城市', '1283', '1430', '1370', '2015-05-22 15:18:06', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1439', '寿光市', '1284', '1430', '1370', '2015-05-22 15:18:06', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1440', '安丘市', '1285', '1430', '1370', '2015-05-22 15:18:06', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1441', '高密市', '1286', '1430', '1370', '2015-05-22 15:18:06', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1442', '昌邑市', '1287', '1430', '1370', '2015-05-22 15:18:06', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1443', '济宁市', '142', '1370', '1370', '2015-05-22 15:18:06', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1444', '市中区', '1288', '1443', '1443', '2015-05-22 15:18:06', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1445', '任城区', '1289', '1443', '1443', '2015-05-22 15:18:06', '', '3', '3', 'R', '0');
INSERT INTO `lr_province` VALUES ('1446', '微山县', '1290', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1447', '鱼台县', '1291', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1448', '金乡县', '1292', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1449', '嘉祥县', '1293', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1450', '汶上县', '1294', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1451', '泗水县', '1295', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1452', '梁山县', '1296', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1453', '曲阜市', '1297', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1454', '兖州市', '1298', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1455', '邹城市', '1299', '1443', '1370', '2015-05-22 15:18:06', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1456', '泰安市', '143', '1370', '1370', '2015-05-22 15:18:06', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1457', '泰山区', '1300', '1456', '1456', '2015-05-22 15:18:06', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1458', '岱岳区', '1301', '1456', '1456', '2015-05-22 15:18:07', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1459', '宁阳县', '1302', '1456', '1370', '2015-05-22 15:18:07', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1460', '东平县', '1303', '1456', '1370', '2015-05-22 15:18:07', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1461', '新泰市', '1304', '1456', '1370', '2015-05-22 15:18:07', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1462', '肥城市', '1305', '1456', '1370', '2015-05-22 15:18:07', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1463', '威海市', '144', '1370', '1370', '2015-05-22 15:18:07', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1464', '环翠区', '1306', '1463', '1463', '2015-05-22 15:18:07', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1465', '文登市', '1307', '1463', '1370', '2015-05-22 15:18:07', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1466', '荣成市', '1308', '1463', '1370', '2015-05-22 15:18:07', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1467', '乳山市', '1309', '1463', '1370', '2015-05-22 15:18:07', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1468', '日照市', '145', '1370', '1370', '2015-05-22 15:18:07', '', '2', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1469', '东港区', '1310', '1468', '1468', '2015-05-22 15:18:07', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1470', '岚山区', '1311', '1468', '1468', '2015-05-22 15:18:07', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1471', '五莲县', '1312', '1468', '1370', '2015-05-22 15:18:07', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1472', '莒县', '1313', '1468', '1370', '2015-05-22 15:18:07', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1473', '莱芜市', '146', '1370', '1370', '2015-05-22 15:18:07', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1474', '莱城区', '1314', '1473', '1473', '2015-05-22 15:18:07', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1475', '钢城区', '1315', '1473', '1473', '2015-05-22 15:18:07', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('1476', '临沂市', '147', '1370', '1370', '2015-05-22 15:18:07', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1477', '兰山区', '1316', '1476', '1476', '2015-05-22 15:18:07', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1478', '罗庄区', '1317', '1476', '1476', '2015-05-22 15:18:07', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1479', '河东区', '1318', '1476', '1476', '2015-05-22 15:18:07', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1480', '沂南县', '1319', '1476', '1370', '2015-05-22 15:18:07', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1481', '郯城县', '1320', '1476', '1370', '2015-05-22 15:18:07', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1482', '沂水县', '1321', '1476', '1370', '2015-05-22 15:18:07', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1483', '苍山县', '1322', '1476', '1370', '2015-05-22 15:18:07', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1484', '费县', '1323', '1476', '1370', '2015-05-22 15:18:07', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1485', '平邑县', '1324', '1476', '1370', '2015-05-22 15:18:08', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1486', '莒南县', '1325', '1476', '1370', '2015-05-22 15:18:08', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1487', '蒙阴县', '1326', '1476', '1370', '2015-05-22 15:18:08', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1488', '临沭县', '1327', '1476', '1370', '2015-05-22 15:18:08', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1489', '德州市', '148', '1370', '1370', '2015-05-22 15:18:08', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1490', '德城区', '1328', '1489', '1489', '2015-05-22 15:18:08', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1491', '陵县', '1329', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1492', '宁津县', '1330', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1493', '庆云县', '1331', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1494', '临邑县', '1332', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1495', '齐河县', '1333', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1496', '平原县', '1334', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1497', '夏津县', '1335', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1498', '武城县', '1336', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1499', '乐陵市', '1337', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1500', '禹城市', '1338', '1489', '1370', '2015-05-22 15:18:08', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1501', '聊城市', '149', '1370', '1370', '2015-05-22 15:18:08', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1502', '东昌府区', '1339', '1501', '1501', '2015-05-22 15:18:08', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1503', '阳谷县', '1340', '1501', '1370', '2015-05-22 15:18:08', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1504', '莘县', '1341', '1501', '1370', '2015-05-22 15:18:08', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1505', '茌平县', '1342', '1501', '1370', '2015-05-22 15:18:08', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1506', '东阿县', '1343', '1501', '1370', '2015-05-22 15:18:08', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1507', '冠县', '1344', '1501', '1370', '2015-05-22 15:18:08', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1508', '高唐县', '1345', '1501', '1370', '2015-05-22 15:18:08', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1509', '临清市', '1346', '1501', '1370', '2015-05-22 15:18:08', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1510', '滨州市', '150', '1370', '1370', '2015-05-22 15:18:08', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1511', '滨城区', '1347', '1510', '1510', '2015-05-22 15:18:08', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1512', '惠民县', '1348', '1510', '1370', '2015-05-22 15:18:09', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1513', '阳信县', '1349', '1510', '1370', '2015-05-22 15:18:09', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1514', '无棣县', '1350', '1510', '1370', '2015-05-22 15:18:09', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1515', '沾化县', '1351', '1510', '1370', '2015-05-22 15:18:09', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1516', '博兴县', '1352', '1510', '1370', '2015-05-22 15:18:09', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1517', '邹平县', '1353', '1510', '1370', '2015-05-22 15:18:09', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1518', '荷泽市', '151', '1370', '1370', '2015-05-22 15:18:09', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1519', '牡丹区', '1354', '1518', '1518', '2015-05-22 15:18:09', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('1520', '曹县', '1355', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1521', '单县', '1356', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1522', '成武县', '1357', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1523', '巨野县', '1358', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1524', '郓城县', '1359', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1525', '鄄城县', '1360', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1526', '定陶县', '1361', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1527', '东明县', '1362', '1518', '1370', '2015-05-22 15:18:09', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1528', '河南', '16', null, null, '2015-05-22 15:18:09', '', '1', '1', 'H', '0');
INSERT INTO `lr_province` VALUES ('1529', '郑州市', '152', '1528', '1528', '2015-05-22 15:18:09', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1530', '中原区', '1363', '1529', '1529', '2015-05-22 15:18:09', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1531', '二七区', '1364', '1529', '1529', '2015-05-22 15:18:09', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('1532', '管城回族区', '1365', '1529', '1529', '2015-05-22 15:18:09', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('1533', '金水区', '1366', '1529', '1529', '2015-05-22 15:18:09', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1534', '上街区', '1367', '1529', '1529', '2015-05-22 15:18:09', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1535', '惠济区', '1368', '1529', '1529', '2015-05-22 15:18:09', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1536', '中牟县', '1369', '1529', '1528', '2015-05-22 15:18:09', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1537', '巩义市', '1370', '1529', '1528', '2015-05-22 15:18:09', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1538', '荥阳市', '1371', '1529', '1528', '2015-05-22 15:18:09', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1539', '新密市', '1372', '1529', '1528', '2015-05-22 15:18:10', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1540', '新郑市', '1373', '1529', '1528', '2015-05-22 15:18:10', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1541', '登封市', '1374', '1529', '1528', '2015-05-22 15:18:10', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1542', '开封市', '153', '1528', '1528', '2015-05-22 15:18:10', '', '2', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('1543', '龙亭区', '1375', '1542', '1542', '2015-05-22 15:18:10', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1544', '顺河回族区', '1376', '1542', '1542', '2015-05-22 15:18:10', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1545', '鼓楼区', '1377', '1542', '1542', '2015-05-22 15:18:10', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('1546', '南关区', '1378', '1542', '1542', '2015-05-22 15:18:10', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('1547', '郊区', '1379', '1542', '1542', '2015-05-22 15:18:10', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1548', '杞县', '1380', '1542', '1528', '2015-05-22 15:18:10', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1549', '通许县', '1381', '1542', '1528', '2015-05-22 15:18:10', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1550', '尉氏县', '1382', '1542', '1528', '2015-05-22 15:18:10', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1551', '开封县', '1383', '1542', '1528', '2015-05-22 15:18:10', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('1552', '兰考县', '1384', '1542', '1528', '2015-05-22 15:18:10', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1553', '洛阳市', '154', '1528', '1528', '2015-05-22 15:18:10', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1554', '老城区', '1385', '1553', '1553', '2015-05-22 15:18:10', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1555', '西工区', '1386', '1553', '1553', '2015-05-22 15:18:10', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1556', '廛河回族区', '1387', '1553', '1553', '2015-05-22 15:18:10', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1557', '涧西区', '1388', '1553', '1553', '2015-05-22 15:18:10', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1558', '吉利区', '1389', '1553', '1553', '2015-05-22 15:18:10', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1559', '洛龙区', '1390', '1553', '1553', '2015-05-22 15:18:10', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1560', '孟津县', '1391', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1561', '新安县', '1392', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1562', '栾川县', '1393', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1563', '嵩县', '1394', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1564', '汝阳县', '1395', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1565', '宜阳县', '1396', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1566', '洛宁县', '1397', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1567', '伊川县', '1398', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1568', '偃师市', '1399', '1553', '1528', '2015-05-22 15:18:10', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1569', '平顶山市', '155', '1528', '1528', '2015-05-22 15:18:10', '', '2', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1570', '新华区', '1400', '1569', '1569', '2015-05-22 15:18:10', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1571', '卫东区', '1401', '1569', '1569', '2015-05-22 15:18:10', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1572', '石龙区', '1402', '1569', '1569', '2015-05-22 15:18:11', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1573', '湛河区', '1403', '1569', '1569', '2015-05-22 15:18:11', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1574', '宝丰县', '1404', '1569', '1528', '2015-05-22 15:18:11', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1575', '叶县', '1405', '1569', '1528', '2015-05-22 15:18:11', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1576', '鲁山县', '1406', '1569', '1528', '2015-05-22 15:18:11', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1577', '郏县', '1407', '1569', '1528', '2015-05-22 15:18:11', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1578', '舞钢市', '1408', '1569', '1528', '2015-05-22 15:18:11', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1579', '汝州市', '1409', '1569', '1528', '2015-05-22 15:18:11', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1580', '安阳市', '156', '1528', '1528', '2015-05-22 15:18:11', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1581', '文峰区', '1410', '1580', '1580', '2015-05-22 15:18:11', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1582', '北关区', '1411', '1580', '1580', '2015-05-22 15:18:11', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1583', '殷都区', '1412', '1580', '1580', '2015-05-22 15:18:11', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1584', '龙安区', '1413', '1580', '1580', '2015-05-22 15:18:11', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1585', '安阳县', '1414', '1580', '1528', '2015-05-22 15:18:11', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1586', '汤阴县', '1415', '1580', '1528', '2015-05-22 15:18:11', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1587', '滑县', '1416', '1580', '1528', '2015-05-22 15:18:11', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1588', '内黄县', '1417', '1580', '1528', '2015-05-22 15:18:11', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1589', '林州市', '1418', '1580', '1528', '2015-05-22 15:18:11', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1590', '鹤壁市', '157', '1528', '1528', '2015-05-22 15:18:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1591', '鹤山区', '1419', '1590', '1590', '2015-05-22 15:18:11', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1592', '山城区', '1420', '1590', '1590', '2015-05-22 15:18:11', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1593', '淇滨区', '1421', '1590', '1590', '2015-05-22 15:18:11', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1594', '浚县', '1422', '1590', '1528', '2015-05-22 15:18:11', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1595', '淇县', '1423', '1590', '1528', '2015-05-22 15:18:11', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1596', '新乡市', '158', '1528', '1528', '2015-05-22 15:18:11', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1597', '红旗区', '1424', '1596', '1596', '2015-05-22 15:18:11', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1598', '卫滨区', '1425', '1596', '1596', '2015-05-22 15:18:11', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1599', '凤泉区', '1426', '1596', '1596', '2015-05-22 15:18:11', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1600', '牧野区', '1427', '1596', '1596', '2015-05-22 15:18:11', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('1601', '新乡县', '1428', '1596', '1528', '2015-05-22 15:18:11', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1602', '获嘉县', '1429', '1596', '1528', '2015-05-22 15:18:12', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1603', '原阳县', '1430', '1596', '1528', '2015-05-22 15:18:12', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1604', '延津县', '1431', '1596', '1528', '2015-05-22 15:18:12', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1605', '封丘县', '1432', '1596', '1528', '2015-05-22 15:18:12', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1606', '长垣县', '1433', '1596', '1528', '2015-05-22 15:18:12', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1607', '卫辉市', '1434', '1596', '1528', '2015-05-22 15:18:12', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1608', '辉县市', '1435', '1596', '1528', '2015-05-22 15:18:12', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1609', '焦作市', '159', '1528', '1528', '2015-05-22 15:18:12', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1610', '解放区', '1436', '1609', '1609', '2015-05-22 15:18:12', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1611', '中站区', '1437', '1609', '1609', '2015-05-22 15:18:12', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1612', '马村区', '1438', '1609', '1609', '2015-05-22 15:18:12', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('1613', '山阳区', '1439', '1609', '1609', '2015-05-22 15:18:12', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1614', '修武县', '1440', '1609', '1528', '2015-05-22 15:18:12', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1615', '博爱县', '1441', '1609', '1528', '2015-05-22 15:18:12', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1616', '武陟县', '1442', '1609', '1528', '2015-05-22 15:18:12', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1617', '温县', '1443', '1609', '1528', '2015-05-22 15:18:12', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1618', '济源市', '1444', '1609', '1528', '2015-05-22 15:18:12', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1619', '沁阳市', '1445', '1609', '1528', '2015-05-22 15:18:12', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1620', '孟州市', '1446', '1609', '1528', '2015-05-22 15:18:12', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1621', '濮阳市', '160', '1528', '1528', '2015-05-22 15:18:12', '', '2', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1622', '华龙区', '1447', '1621', '1621', '2015-05-22 15:18:12', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1623', '清丰县', '1448', '1621', '1528', '2015-05-22 15:18:12', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1624', '南乐县', '1449', '1621', '1528', '2015-05-22 15:18:12', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1625', '范县', '1450', '1621', '1528', '2015-05-22 15:18:12', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1626', '台前县', '1451', '1621', '1528', '2015-05-22 15:18:12', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1627', '濮阳县', '1452', '1621', '1528', '2015-05-22 15:18:12', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1628', '许昌市', '161', '1528', '1528', '2015-05-22 15:18:12', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1629', '魏都区', '1453', '1628', '1628', '2015-05-22 15:18:12', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1630', '许昌县', '1454', '1628', '1528', '2015-05-22 15:18:12', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1631', '鄢陵县', '1455', '1628', '1528', '2015-05-22 15:18:12', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1632', '襄城县', '1456', '1628', '1528', '2015-05-22 15:18:12', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1633', '禹州市', '1457', '1628', '1528', '2015-05-22 15:18:12', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1634', '长葛市', '1458', '1628', '1528', '2015-05-22 15:18:12', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1635', '漯河市', '162', '1528', '1528', '2015-05-22 15:18:13', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1636', '源汇区', '1459', '1635', '1635', '2015-05-22 15:18:13', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1637', '郾城区', '1460', '1635', '1635', '2015-05-22 15:18:13', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1638', '召陵区', '1461', '1635', '1635', '2015-05-22 15:18:13', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1639', '舞阳县', '1462', '1635', '1528', '2015-05-22 15:18:13', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1640', '临颍县', '1463', '1635', '1528', '2015-05-22 15:18:13', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1641', '三门峡市', '163', '1528', '1528', '2015-05-22 15:18:13', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1642', '市辖区', '1464', '1641', '1641', '2015-05-22 15:18:13', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1643', '湖滨区', '1465', '1641', '1641', '2015-05-22 15:18:13', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1644', '渑池县', '1466', '1641', '1528', '2015-05-22 15:18:13', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1645', '陕县', '1467', '1641', '1528', '2015-05-22 15:18:13', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1646', '卢氏县', '1468', '1641', '1528', '2015-05-22 15:18:13', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1647', '义马市', '1469', '1641', '1528', '2015-05-22 15:18:13', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1648', '灵宝市', '1470', '1641', '1528', '2015-05-22 15:18:13', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1649', '南阳市', '164', '1528', '1528', '2015-05-22 15:18:13', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1650', '宛城区', '1471', '1649', '1649', '2015-05-22 15:18:13', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1651', '卧龙区', '1472', '1649', '1649', '2015-05-22 15:18:13', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1652', '南召县', '1473', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1653', '方城县', '1474', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1654', '西峡县', '1475', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1655', '镇平县', '1476', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1656', '内乡县', '1477', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1657', '淅川县', '1478', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1658', '社旗县', '1479', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1659', '唐河县', '1480', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1660', '新野县', '1481', '1649', '1528', '2015-05-22 15:18:13', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1661', '桐柏县', '1482', '1649', '1528', '2015-05-22 15:18:14', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1662', '邓州市', '1483', '1649', '1528', '2015-05-22 15:18:14', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1663', '商丘市', '165', '1528', '1528', '2015-05-22 15:18:14', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1664', '梁园区', '1484', '1663', '1663', '2015-05-22 15:18:14', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1665', '睢阳区', '1485', '1663', '1663', '2015-05-22 15:18:14', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1666', '民权县', '1486', '1663', '1528', '2015-05-22 15:18:14', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1667', '睢县', '1487', '1663', '1528', '2015-05-22 15:18:14', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1668', '宁陵县', '1488', '1663', '1528', '2015-05-22 15:18:14', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1669', '柘城县', '1489', '1663', '1528', '2015-05-22 15:18:14', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1670', '虞城县', '1490', '1663', '1528', '2015-05-22 15:18:14', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1671', '夏邑县', '1491', '1663', '1528', '2015-05-22 15:18:14', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1672', '永城市', '1492', '1663', '1528', '2015-05-22 15:18:14', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1673', '信阳市', '166', '1528', '1528', '2015-05-22 15:18:14', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1674', '浉河区', '1493', '1673', '1673', '2015-05-22 15:18:14', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1675', '平桥区', '1494', '1673', '1673', '2015-05-22 15:18:14', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('1676', '罗山县', '1495', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1677', '光山县', '1496', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1678', '新县', '1497', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1679', '商城县', '1498', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1680', '固始县', '1499', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1681', '潢川县', '1500', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1682', '淮滨县', '1501', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1683', '息县', '1502', '1673', '1528', '2015-05-22 15:18:14', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1684', '周口市', '167', '1528', '1528', '2015-05-22 15:18:14', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1685', '川汇区', '1503', '1684', '1684', '2015-05-22 15:18:14', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1686', '扶沟县', '1504', '1684', '1528', '2015-05-22 15:18:14', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1687', '西华县', '1505', '1684', '1528', '2015-05-22 15:18:14', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1688', '商水县', '1506', '1684', '1528', '2015-05-22 15:18:15', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1689', '沈丘县', '1507', '1684', '1528', '2015-05-22 15:18:15', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1690', '郸城县', '1508', '1684', '1528', '2015-05-22 15:18:15', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1691', '淮阳县', '1509', '1684', '1528', '2015-05-22 15:18:15', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1692', '太康县', '1510', '1684', '1528', '2015-05-22 15:18:15', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1693', '鹿邑县', '1511', '1684', '1528', '2015-05-22 15:18:15', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1694', '项城市', '1512', '1684', '1528', '2015-05-22 15:18:15', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1695', '驻马店市', '168', '1528', '1528', '2015-05-22 15:18:15', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1696', '驿城区', '1513', '1695', '1695', '2015-05-22 15:18:15', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1697', '西平县', '1514', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1698', '上蔡县', '1515', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1699', '平舆县', '1516', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1700', '正阳县', '1517', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1701', '确山县', '1518', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1702', '泌阳县', '1519', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1703', '汝南县', '1520', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1704', '遂平县', '1521', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1705', '新蔡县', '1522', '1695', '1528', '2015-05-22 15:18:15', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1706', '湖北', '17', null, null, '2015-05-22 15:18:15', '', '1', '1', 'H', '0');
INSERT INTO `lr_province` VALUES ('1707', '武汉市', '169', '1706', '1706', '2015-05-22 15:18:15', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1708', '江岸区', '1523', '1707', '1707', '2015-05-22 15:18:15', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1709', '江汉区', '1524', '1707', '1707', '2015-05-22 15:18:15', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1710', '硚口区', '1525', '1707', '1707', '2015-05-22 15:18:15', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1711', '汉阳区', '1526', '1707', '1707', '2015-05-22 15:18:15', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1712', '武昌区', '1527', '1707', '1707', '2015-05-22 15:18:15', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1713', '青山区', '1528', '1707', '1707', '2015-05-22 15:18:15', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1714', '洪山区', '1529', '1707', '1707', '2015-05-22 15:18:16', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1715', '东西湖区', '1530', '1707', '1707', '2015-05-22 15:18:16', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1716', '汉南区', '1531', '1707', '1707', '2015-05-22 15:18:16', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1717', '蔡甸区', '1532', '1707', '1707', '2015-05-22 15:18:16', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1718', '江夏区', '1533', '1707', '1707', '2015-05-22 15:18:16', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1719', '黄陂区', '1534', '1707', '1707', '2015-05-22 15:18:16', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1720', '新洲区', '1535', '1707', '1707', '2015-05-22 15:18:16', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1721', '黄石市', '170', '1706', '1706', '2015-05-22 15:18:16', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1722', '黄石港区', '1536', '1721', '1721', '2015-05-22 15:18:16', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1723', '西塞山区', '1537', '1721', '1721', '2015-05-22 15:18:16', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1724', '下陆区', '1538', '1721', '1721', '2015-05-22 15:18:16', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1725', '铁山区', '1539', '1721', '1721', '2015-05-22 15:18:16', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1726', '阳新县', '1540', '1721', '1706', '2015-05-22 15:18:16', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1727', '大冶市', '1541', '1721', '1706', '2015-05-22 15:18:16', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1728', '十堰市', '171', '1706', '1706', '2015-05-22 15:18:16', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1729', '茅箭区', '1542', '1728', '1728', '2015-05-22 15:18:16', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('1730', '张湾区', '1543', '1728', '1728', '2015-05-22 15:18:16', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1731', '郧县', '1544', '1728', '1706', '2015-05-22 15:18:16', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1732', '郧西县', '1545', '1728', '1706', '2015-05-22 15:18:16', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1733', '竹山县', '1546', '1728', '1706', '2015-05-22 15:18:16', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1734', '竹溪县', '1547', '1728', '1706', '2015-05-22 15:18:16', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1735', '房县', '1548', '1728', '1706', '2015-05-22 15:18:16', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1736', '丹江口市', '1549', '1728', '1706', '2015-05-22 15:18:16', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1737', '宜昌市', '172', '1706', '1706', '2015-05-22 15:18:16', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1738', '西陵区', '1550', '1737', '1737', '2015-05-22 15:18:16', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1739', '伍家岗区', '1551', '1737', '1737', '2015-05-22 15:18:16', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1740', '点军区', '1552', '1737', '1737', '2015-05-22 15:18:16', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1741', '猇亭区', '1553', '1737', '1737', '2015-05-22 15:18:16', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1742', '夷陵区', '1554', '1737', '1737', '2015-05-22 15:18:16', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1743', '远安县', '1555', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1744', '兴山县', '1556', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1745', '秭归县', '1557', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1746', '长阳土家族自治县', '1558', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1747', '五峰土家族自治县', '1559', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1748', '宜都市', '1560', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1749', '当阳市', '1561', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1750', '枝江市', '1562', '1737', '1706', '2015-05-22 15:18:17', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1751', '襄樊市', '173', '1706', '1706', '2015-05-22 15:18:17', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1752', '襄城区', '1563', '1751', '1751', '2015-05-22 15:18:17', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1753', '樊城区', '1564', '1751', '1751', '2015-05-22 15:18:17', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1754', '襄阳区', '1565', '1751', '1751', '2015-05-22 15:18:17', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1755', '南漳县', '1566', '1751', '1706', '2015-05-22 15:18:17', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1756', '谷城县', '1567', '1751', '1706', '2015-05-22 15:18:17', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1757', '保康县', '1568', '1751', '1706', '2015-05-22 15:18:17', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1758', '老河口市', '1569', '1751', '1706', '2015-05-22 15:18:17', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1759', '枣阳市', '1570', '1751', '1706', '2015-05-22 15:18:17', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1760', '宜城市', '1571', '1751', '1706', '2015-05-22 15:18:17', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1761', '鄂州市', '174', '1706', '1706', '2015-05-22 15:18:17', '', '2', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('1762', '梁子湖区', '1572', '1761', '1761', '2015-05-22 15:18:17', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1763', '华容区', '1573', '1761', '1761', '2015-05-22 15:18:17', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1764', '鄂城区', '1574', '1761', '1761', '2015-05-22 15:18:17', '', '3', '3', 'E', '0');
INSERT INTO `lr_province` VALUES ('1765', '荆门市', '175', '1706', '1706', '2015-05-22 15:18:17', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1766', '东宝区', '1575', '1765', '1765', '2015-05-22 15:18:17', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1767', '掇刀区', '1576', '1765', '1765', '2015-05-22 15:18:17', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1768', '京山县', '1577', '1765', '1706', '2015-05-22 15:18:17', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1769', '沙洋县', '1578', '1765', '1706', '2015-05-22 15:18:17', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1770', '钟祥市', '1579', '1765', '1706', '2015-05-22 15:18:18', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1771', '孝感市', '176', '1706', '1706', '2015-05-22 15:18:18', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1772', '孝南区', '1580', '1771', '1771', '2015-05-22 15:18:18', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1773', '孝昌县', '1581', '1771', '1706', '2015-05-22 15:18:18', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1774', '大悟县', '1582', '1771', '1706', '2015-05-22 15:18:18', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1775', '云梦县', '1583', '1771', '1706', '2015-05-22 15:18:18', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1776', '应城市', '1584', '1771', '1706', '2015-05-22 15:18:18', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1777', '安陆市', '1585', '1771', '1706', '2015-05-22 15:18:18', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1778', '汉川市', '1586', '1771', '1706', '2015-05-22 15:18:18', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1779', '荆州市', '177', '1706', '1706', '2015-05-22 15:18:18', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1780', '沙市区', '1587', '1779', '1779', '2015-05-22 15:18:18', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1781', '荆州区', '1588', '1779', '1779', '2015-05-22 15:18:18', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1782', '公安县', '1589', '1779', '1706', '2015-05-22 15:18:18', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1783', '监利县', '1590', '1779', '1706', '2015-05-22 15:18:18', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1784', '江陵县', '1591', '1779', '1706', '2015-05-22 15:18:18', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1785', '石首市', '1592', '1779', '1706', '2015-05-22 15:18:18', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1786', '洪湖市', '1593', '1779', '1706', '2015-05-22 15:18:18', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1787', '松滋市', '1594', '1779', '1706', '2015-05-22 15:18:18', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1788', '黄冈市', '178', '1706', '1706', '2015-05-22 15:18:18', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1789', '黄州区', '1595', '1788', '1788', '2015-05-22 15:18:18', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1790', '团风县', '1596', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1791', '红安县', '1597', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1792', '罗田县', '1598', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1793', '英山县', '1599', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1794', '浠水县', '1600', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1795', '蕲春县', '1601', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1796', '黄梅县', '1602', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1797', '麻城市', '1603', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1798', '武穴市', '1604', '1788', '1706', '2015-05-22 15:18:18', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1799', '咸宁市', '179', '1706', '1706', '2015-05-22 15:18:18', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1800', '咸安区', '1605', '1799', '1799', '2015-05-22 15:18:18', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1801', '嘉鱼县', '1606', '1799', '1706', '2015-05-22 15:18:19', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1802', '通城县', '1607', '1799', '1706', '2015-05-22 15:18:19', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1803', '崇阳县', '1608', '1799', '1706', '2015-05-22 15:18:19', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1804', '通山县', '1609', '1799', '1706', '2015-05-22 15:18:19', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1805', '赤壁市', '1610', '1799', '1706', '2015-05-22 15:18:19', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1806', '随州市', '180', '1706', '1706', '2015-05-22 15:18:19', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1807', '曾都区', '1611', '1806', '1806', '2015-05-22 15:18:19', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1808', '广水市', '1612', '1806', '1706', '2015-05-22 15:18:19', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1809', '恩施', '181', '1706', '1706', '2015-05-22 15:18:19', '', '2', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('1810', '恩施市', '1613', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('1811', '利川市', '1614', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1812', '建始县', '1615', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1813', '巴东县', '1616', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1814', '宣恩县', '1617', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1815', '咸丰县', '1618', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1816', '来凤县', '1619', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1817', '鹤峰县', '1620', '1809', '1706', '2015-05-22 15:18:19', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1818', '神农架', '182', '1706', '1706', '2015-05-22 15:18:19', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1819', '仙桃市', '1621', '1818', '1706', '2015-05-22 15:18:19', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1820', '潜江市', '1622', '1818', '1706', '2015-05-22 15:18:19', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1821', '天门市', '1623', '1818', '1706', '2015-05-22 15:18:19', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1822', '神农架林区', '1624', '1818', '1818', '2015-05-22 15:18:19', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1823', '湖南', '18', null, null, '2015-05-22 15:18:19', '', '1', '1', 'H', '0');
INSERT INTO `lr_province` VALUES ('1824', '长沙市', '183', '1823', '1823', '2015-05-22 15:18:19', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1825', '芙蓉区', '1625', '1824', '1824', '2015-05-22 15:18:19', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1826', '天心区', '1626', '1824', '1824', '2015-05-22 15:18:19', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1827', '岳麓区', '1627', '1824', '1824', '2015-05-22 15:18:20', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1828', '开福区', '1628', '1824', '1824', '2015-05-22 15:18:20', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('1829', '雨花区', '1629', '1824', '1824', '2015-05-22 15:18:20', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1830', '长沙县', '1630', '1824', '1823', '2015-05-22 15:18:20', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1831', '望城县', '1631', '1824', '1823', '2015-05-22 15:18:20', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1832', '宁乡县', '1632', '1824', '1823', '2015-05-22 15:18:20', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1833', '浏阳市', '1633', '1824', '1823', '2015-05-22 15:18:20', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1834', '株洲市', '184', '1823', '1823', '2015-05-22 15:18:20', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1835', '荷塘区', '1634', '1834', '1834', '2015-05-22 15:18:20', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1836', '芦淞区', '1635', '1834', '1834', '2015-05-22 15:18:20', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1837', '石峰区', '1636', '1834', '1834', '2015-05-22 15:18:20', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1838', '天元区', '1637', '1834', '1834', '2015-05-22 15:18:20', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1839', '株洲县', '1638', '1834', '1823', '2015-05-22 15:18:20', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1840', '攸县', '1639', '1834', '1823', '2015-05-22 15:18:20', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1841', '茶陵县', '1640', '1834', '1823', '2015-05-22 15:18:20', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1842', '炎陵县', '1641', '1834', '1823', '2015-05-22 15:18:20', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1843', '醴陵市', '1642', '1834', '1823', '2015-05-22 15:18:20', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1844', '湘潭市', '185', '1823', '1823', '2015-05-22 15:18:20', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1845', '雨湖区', '1643', '1844', '1844', '2015-05-22 15:18:20', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1846', '岳塘区', '1644', '1844', '1844', '2015-05-22 15:18:20', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1847', '湘潭县', '1645', '1844', '1823', '2015-05-22 15:18:20', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1848', '湘乡市', '1646', '1844', '1823', '2015-05-22 15:18:20', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1849', '韶山市', '1647', '1844', '1823', '2015-05-22 15:18:20', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1850', '衡阳市', '186', '1823', '1823', '2015-05-22 15:18:20', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1851', '珠晖区', '1648', '1850', '1850', '2015-05-22 15:18:20', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1852', '雁峰区', '1649', '1850', '1850', '2015-05-22 15:18:20', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1853', '石鼓区', '1650', '1850', '1850', '2015-05-22 15:18:20', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1854', '蒸湘区', '1651', '1850', '1850', '2015-05-22 15:18:20', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1855', '南岳区', '1652', '1850', '1850', '2015-05-22 15:18:20', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('1856', '衡阳县', '1653', '1850', '1823', '2015-05-22 15:18:21', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1857', '衡南县', '1654', '1850', '1823', '2015-05-22 15:18:21', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1858', '衡山县', '1655', '1850', '1823', '2015-05-22 15:18:21', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1859', '衡东县', '1656', '1850', '1823', '2015-05-22 15:18:21', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1860', '祁东县', '1657', '1850', '1823', '2015-05-22 15:18:21', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1861', '耒阳市', '1658', '1850', '1823', '2015-05-22 15:18:21', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1862', '常宁市', '1659', '1850', '1823', '2015-05-22 15:18:21', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1863', '邵阳市', '187', '1823', '1823', '2015-05-22 15:18:21', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1864', '双清区', '1660', '1863', '1863', '2015-05-22 15:18:21', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1865', '大祥区', '1661', '1863', '1863', '2015-05-22 15:18:21', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1866', '北塔区', '1662', '1863', '1863', '2015-05-22 15:18:21', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1867', '邵东县', '1663', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1868', '新邵县', '1664', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1869', '邵阳县', '1665', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1870', '隆回县', '1666', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1871', '洞口县', '1667', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1872', '绥宁县', '1668', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1873', '新宁县', '1669', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1874', '城步苗族自治县', '1670', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1875', '武冈市', '1671', '1863', '1823', '2015-05-22 15:18:21', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1876', '岳阳市', '188', '1823', '1823', '2015-05-22 15:18:21', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1877', '岳阳楼区', '1672', '1876', '1876', '2015-05-22 15:18:21', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1878', '云溪区', '1673', '1876', '1876', '2015-05-22 15:18:21', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1879', '君山区', '1674', '1876', '1876', '2015-05-22 15:18:21', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1880', '岳阳县', '1675', '1876', '1823', '2015-05-22 15:18:22', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1881', '华容县', '1676', '1876', '1823', '2015-05-22 15:18:22', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1882', '湘阴县', '1677', '1876', '1823', '2015-05-22 15:18:22', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1883', '平江县', '1678', '1876', '1823', '2015-05-22 15:18:22', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('1884', '汨罗市', '1679', '1876', '1823', '2015-05-22 15:18:22', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1885', '临湘市', '1680', '1876', '1823', '2015-05-22 15:18:22', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1886', '常德市', '189', '1823', '1823', '2015-05-22 15:18:22', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1887', '武陵区', '1681', '1886', '1886', '2015-05-22 15:18:22', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1888', '鼎城区', '1682', '1886', '1886', '2015-05-22 15:18:22', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1889', '安乡县', '1683', '1886', '1823', '2015-05-22 15:18:22', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1890', '汉寿县', '1684', '1886', '1823', '2015-05-22 15:18:22', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1891', '澧县', '1685', '1886', '1823', '2015-05-22 15:18:22', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1892', '临澧县', '1686', '1886', '1823', '2015-05-22 15:18:22', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1893', '桃源县', '1687', '1886', '1823', '2015-05-22 15:18:22', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1894', '石门县', '1688', '1886', '1823', '2015-05-22 15:18:22', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1895', '津市市', '1689', '1886', '1823', '2015-05-22 15:18:22', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1896', '张家界市', '190', '1823', '1823', '2015-05-22 15:18:22', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1897', '永定区', '1690', '1896', '1896', '2015-05-22 15:18:22', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1898', '武陵源区', '1691', '1896', '1896', '2015-05-22 15:18:22', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1899', '慈利县', '1692', '1896', '1823', '2015-05-22 15:18:22', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1900', '桑植县', '1693', '1896', '1823', '2015-05-22 15:18:22', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1901', '益阳市', '191', '1823', '1823', '2015-05-22 15:18:22', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1902', '资阳区', '1694', '1901', '1901', '2015-05-22 15:18:22', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1903', '赫山区', '1695', '1901', '1901', '2015-05-22 15:18:22', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1904', '南县', '1696', '1901', '1823', '2015-05-22 15:18:22', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1905', '桃江县', '1697', '1901', '1823', '2015-05-22 15:18:23', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1906', '安化县', '1698', '1901', '1823', '2015-05-22 15:18:23', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1907', '沅江市', '1699', '1901', '1823', '2015-05-22 15:18:23', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1908', '郴州市', '192', '1823', '1823', '2015-05-22 15:18:23', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1909', '北湖区', '1700', '1908', '1908', '2015-05-22 15:18:23', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1910', '苏仙区', '1701', '1908', '1908', '2015-05-22 15:18:23', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('1911', '桂阳县', '1702', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1912', '宜章县', '1703', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1913', '永兴县', '1704', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1914', '嘉禾县', '1705', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1915', '临武县', '1706', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1916', '汝城县', '1707', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1917', '桂东县', '1708', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1918', '安仁县', '1709', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('1919', '资兴市', '1710', '1908', '1823', '2015-05-22 15:18:23', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1920', '永州市', '193', '1823', '1823', '2015-05-22 15:18:23', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1921', '芝山区', '1711', '1920', '1920', '2015-05-22 15:18:23', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1922', '冷水滩区', '1712', '1920', '1920', '2015-05-22 15:18:23', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1923', '祁阳县', '1713', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1924', '东安县', '1714', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1925', '双牌县', '1715', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1926', '道县', '1716', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('1927', '江永县', '1717', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1928', '宁远县', '1718', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1929', '蓝山县', '1719', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1930', '新田县', '1720', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1931', '江华瑶族自治县', '1721', '1920', '1823', '2015-05-22 15:18:23', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1932', '怀化市', '194', '1823', '1823', '2015-05-22 15:18:24', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1933', '鹤城区', '1722', '1932', '1932', '2015-05-22 15:18:24', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1934', '中方县', '1723', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1935', '沅陵县', '1724', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1936', '辰溪县', '1725', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('1937', '溆浦县', '1726', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1938', '会同县', '1727', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1939', '麻阳苗族自治县', '1728', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('1940', '新晃侗族自治县', '1729', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1941', '芷江侗族自治县', '1730', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1942', '靖州苗族侗族自治县', '1731', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1943', '通道侗族自治县', '1732', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('1944', '洪江市', '1733', '1932', '1823', '2015-05-22 15:18:24', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1945', '娄底市', '195', '1823', '1823', '2015-05-22 15:18:24', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1946', '娄星区', '1734', '1945', '1945', '2015-05-22 15:18:24', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1947', '双峰县', '1735', '1945', '1823', '2015-05-22 15:18:24', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1948', '新化县', '1736', '1945', '1823', '2015-05-22 15:18:24', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1949', '冷水江市', '1737', '1945', '1823', '2015-05-22 15:18:24', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1950', '涟源市', '1738', '1945', '1823', '2015-05-22 15:18:24', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1951', '湘西', '196', '1823', '1823', '2015-05-22 15:18:24', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1952', '吉首市', '1739', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('1953', '泸溪县', '1740', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1954', '凤凰县', '1741', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('1955', '花垣县', '1742', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('1956', '保靖县', '1743', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('1957', '古丈县', '1744', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('1958', '永顺县', '1745', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1959', '龙山县', '1746', '1951', '1823', '2015-05-22 15:18:24', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1960', '广东', '19', null, null, '2015-05-22 15:18:24', '', '1', '1', 'G', '0');
INSERT INTO `lr_province` VALUES ('1961', '广州市', '197', '1960', '1960', '2015-05-22 15:18:24', '', '2', '2', 'G', '1');
INSERT INTO `lr_province` VALUES ('1962', '荔湾区', '1748', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1963', '越秀区', '1749', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1964', '海珠区', '1750', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1965', '天河区', '1751', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('1966', '南沙区', '1752', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('1967', '白云区', '1753', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1968', '黄埔区', '1754', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1969', '番禺区', '1755', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1970', '花都区', '1756', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1971', '增城区', '1757', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1972', '从化区', '1758', '1961', '1961', '2015-05-22 15:18:25', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('1973', '韶关市', '198', '1960', '1960', '2015-05-22 15:18:25', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1974', '武江区', '1759', '1973', '1973', '2015-05-22 15:18:25', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('1975', '浈江区', '1760', '1973', '1973', '2015-05-22 15:18:25', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1976', '曲江区', '1761', '1973', '1973', '2015-05-22 15:18:25', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('1977', '始兴县', '1762', '1973', '1960', '2015-05-22 15:18:25', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1978', '仁化县', '1763', '1973', '1960', '2015-05-22 15:18:25', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1979', '翁源县', '1764', '1973', '1960', '2015-05-22 15:18:25', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('1980', '乳源瑶族自治县', '1765', '1973', '1960', '2015-05-22 15:18:25', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('1981', '新丰县', '1766', '1973', '1960', '2015-05-22 15:18:25', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('1982', '乐昌市', '1767', '1973', '1960', '2015-05-22 15:18:25', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('1983', '南雄市', '1768', '1973', '1960', '2015-05-22 15:18:25', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('1984', '深圳市', '199', '1960', '1960', '2015-05-22 15:18:25', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1985', '罗湖区', '1769', '1984', '1984', '2015-05-22 15:18:25', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1986', '福田区', '1770', '1984', '1984', '2015-05-22 15:18:25', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('1987', '南山区', '1771', '1984', '1984', '2015-05-22 15:18:25', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('1988', '宝安区', '1772', '1984', '1984', '2015-05-22 15:18:25', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('1989', '龙岗区', '1773', '1984', '1984', '2015-05-22 15:18:25', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1990', '盐田区', '1774', '1984', '1984', '2015-05-22 15:18:25', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('1991', '珠海市', '200', '1960', '1960', '2015-05-22 15:18:25', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('1992', '香洲区', '1775', '1991', '1991', '2015-05-22 15:18:25', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('1993', '斗门区', '1776', '1991', '1991', '2015-05-22 15:18:25', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('1994', '金湾区', '1777', '1991', '1991', '2015-05-22 15:18:26', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1995', '汕头市', '201', '1960', '1960', '2015-05-22 15:18:26', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('1996', '龙湖区', '1778', '1995', '1995', '2015-05-22 15:18:26', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('1997', '金平区', '1779', '1995', '1995', '2015-05-22 15:18:26', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('1998', '濠江区', '1780', '1995', '1995', '2015-05-22 15:18:26', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('1999', '潮阳区', '1781', '1995', '1995', '2015-05-22 15:18:26', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2000', '潮南区', '1782', '1995', '1995', '2015-05-22 15:18:26', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2001', '澄海区', '1783', '1995', '1995', '2015-05-22 15:18:26', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2002', '南澳县', '1784', '1995', '1960', '2015-05-22 15:18:26', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2003', '佛山市', '202', '1960', '1960', '2015-05-22 15:18:26', '', '2', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2004', '禅城区', '1785', '2003', '2003', '2015-05-22 15:18:26', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2005', '南海区', '1786', '2003', '2003', '2015-05-22 15:18:26', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('2006', '顺德区', '1787', '2003', '2003', '2015-05-22 15:18:26', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2007', '三水区', '1788', '2003', '2003', '2015-05-22 15:18:26', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2008', '高明区', '1789', '2003', '2003', '2015-05-22 15:18:26', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2009', '江门市', '203', '1960', '1960', '2015-05-22 15:18:26', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2010', '蓬江区', '1790', '2009', '2009', '2015-05-22 15:18:26', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('2011', '江海区', '1791', '2009', '2009', '2015-05-22 15:18:26', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2012', '新会区', '1792', '2009', '2009', '2015-05-22 15:18:26', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2013', '台山市', '1793', '2009', '1960', '2015-05-22 15:18:26', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2014', '开平市', '1794', '2009', '1960', '2015-05-22 15:18:26', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2015', '鹤山市', '1795', '2009', '1960', '2015-05-22 15:18:26', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2016', '恩平市', '1796', '2009', '1960', '2015-05-22 15:18:26', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('2017', '湛江市', '204', '1960', '1960', '2015-05-22 15:18:26', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2018', '赤坎区', '1797', '2017', '2017', '2015-05-22 15:18:26', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2019', '霞山区', '1798', '2017', '2017', '2015-05-22 15:18:26', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2020', '坡头区', '1799', '2017', '2017', '2015-05-22 15:18:26', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('2021', '麻章区', '1800', '2017', '2017', '2015-05-22 15:18:26', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('2022', '遂溪县', '1801', '2017', '1960', '2015-05-22 15:18:26', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2023', '徐闻县', '1802', '2017', '1960', '2015-05-22 15:18:26', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2024', '廉江市', '1803', '2017', '1960', '2015-05-22 15:18:26', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2025', '雷州市', '1804', '2017', '1960', '2015-05-22 15:18:26', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2026', '吴川市', '1805', '2017', '1960', '2015-05-22 15:18:27', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2027', '茂名市', '205', '1960', '1960', '2015-05-22 15:18:27', '', '2', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2028', '茂南区', '1806', '2027', '2027', '2015-05-22 15:18:27', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('2029', '茂港区', '1807', '2027', '2027', '2015-05-22 15:18:27', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('2030', '电白县', '1808', '2027', '1960', '2015-05-22 15:18:27', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2031', '高州市', '1809', '2027', '1960', '2015-05-22 15:18:27', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2032', '化州市', '1810', '2027', '1960', '2015-05-22 15:18:27', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2033', '信宜市', '1811', '2027', '1960', '2015-05-22 15:18:27', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2034', '肇庆市', '206', '1960', '1960', '2015-05-22 15:18:27', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2035', '端州区', '1812', '2034', '2034', '2015-05-22 15:18:27', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2036', '鼎湖区', '1813', '2034', '2034', '2015-05-22 15:18:27', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2037', '广宁县', '1814', '2034', '1960', '2015-05-22 15:18:27', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2038', '怀集县', '1815', '2034', '1960', '2015-05-22 15:18:27', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2039', '封开县', '1816', '2034', '1960', '2015-05-22 15:18:27', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2040', '德庆县', '1817', '2034', '1960', '2015-05-22 15:18:27', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2041', '高要市', '1818', '2034', '1960', '2015-05-22 15:18:27', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2042', '四会市', '1819', '2034', '1960', '2015-05-22 15:18:27', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2043', '惠州市', '207', '1960', '1960', '2015-05-22 15:18:27', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2044', '惠城区', '1820', '2043', '2043', '2015-05-22 15:18:27', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2045', '惠阳区', '1821', '2043', '2043', '2015-05-22 15:18:27', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2046', '博罗县', '1822', '2043', '1960', '2015-05-22 15:18:27', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2047', '惠东县', '1823', '2043', '1960', '2015-05-22 15:18:27', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2048', '龙门县', '1824', '2043', '1960', '2015-05-22 15:18:27', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2049', '梅州市', '208', '1960', '1960', '2015-05-22 15:18:27', '', '2', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2050', '梅江区', '1825', '2049', '2049', '2015-05-22 15:18:27', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('2051', '梅县', '1826', '2049', '1960', '2015-05-22 15:18:27', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2052', '大埔县', '1827', '2049', '1960', '2015-05-22 15:18:27', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2053', '丰顺县', '1828', '2049', '1960', '2015-05-22 15:18:27', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2054', '五华县', '1829', '2049', '1960', '2015-05-22 15:18:27', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2055', '平远县', '1830', '2049', '1960', '2015-05-22 15:18:27', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2056', '蕉岭县', '1831', '2049', '1960', '2015-05-22 15:18:27', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2057', '兴宁市', '1832', '2049', '1960', '2015-05-22 15:18:28', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2058', '汕尾市', '209', '1960', '1960', '2015-05-22 15:18:28', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2059', '城区', '1833', '2058', '2058', '2015-05-22 15:18:28', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2060', '海丰县', '1834', '2058', '1960', '2015-05-22 15:18:28', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2061', '陆河县', '1835', '2058', '1960', '2015-05-22 15:18:28', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2062', '陆丰市', '1836', '2058', '1960', '2015-05-22 15:18:28', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2063', '河源市', '210', '1960', '1960', '2015-05-22 15:18:28', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2064', '源城区', '1837', '2063', '2063', '2015-05-22 15:18:28', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2065', '紫金县', '1838', '2063', '1960', '2015-05-22 15:18:28', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2066', '龙川县', '1839', '2063', '1960', '2015-05-22 15:18:28', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2067', '连平县', '1840', '2063', '1960', '2015-05-22 15:18:28', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2068', '和平县', '1841', '2063', '1960', '2015-05-22 15:18:28', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2069', '东源县', '1842', '2063', '1960', '2015-05-22 15:18:28', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2070', '阳江市', '211', '1960', '1960', '2015-05-22 15:18:28', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2071', '江城区', '1843', '2070', '2070', '2015-05-22 15:18:28', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2072', '阳西县', '1844', '2070', '1960', '2015-05-22 15:18:28', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2073', '阳东县', '1845', '2070', '1960', '2015-05-22 15:18:28', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2074', '阳春市', '1846', '2070', '1960', '2015-05-22 15:18:28', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2075', '清远市', '212', '1960', '1960', '2015-05-22 15:18:28', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2076', '清城区', '1847', '2075', '2075', '2015-05-22 15:18:28', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2077', '佛冈县', '1848', '2075', '1960', '2015-05-22 15:18:28', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2078', '阳山县', '1849', '2075', '1960', '2015-05-22 15:18:28', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2079', '连山壮族瑶族自治县', '1850', '2075', '1960', '2015-05-22 15:18:28', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2080', '连南瑶族自治县', '1851', '2075', '1960', '2015-05-22 15:18:28', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2081', '清新县', '1852', '2075', '1960', '2015-05-22 15:18:28', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2082', '英德市', '1853', '2075', '1960', '2015-05-22 15:18:28', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2083', '连州市', '1854', '2075', '1960', '2015-05-22 15:18:28', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2084', '东莞市', '213', '1960', '1960', '2015-05-22 15:18:29', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2085', '莞城区', '2863', '2084', '2084', '2015-05-22 15:18:29', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2086', '南城区', '2864', '2084', '2084', '2015-05-22 15:18:29', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('2087', '东城区', '2865', '2084', '2084', '2015-05-22 15:18:29', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2088', '万江区', '2866', '2084', '2084', '2015-05-22 15:18:29', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2089', '厚街镇', '2867', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2090', '虎门镇', '2868', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2091', '长安镇', '2869', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2092', '沙田镇', '2870', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2093', '麻涌镇', '2871', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2094', '洪梅镇', '2872', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2095', '道滘镇', '2873', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2096', '中堂镇', '2874', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2097', '高埗镇', '2875', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2098', '石碣镇', '2876', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2099', '石龙镇', '2877', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2100', '茶山镇', '2878', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2101', '石排镇', '2879', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2102', '企石镇', '2880', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2103', '桥头镇', '2881', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2104', '常平镇', '2882', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2105', '横沥镇', '2883', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2106', '东坑镇', '2884', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2107', '寮步镇', '2885', '2084', '1960', '2015-05-22 15:18:29', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2108', '大朗镇', '2886', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2109', '黄江镇', '2887', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2110', '大岭山镇', '2888', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2111', '松山湖管委会', '2889', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2112', '樟木头镇', '2890', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2113', '清溪镇', '2891', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2114', '凤岗镇', '2892', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2115', '塘厦镇', '2893', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2116', '谢岗镇', '2894', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2117', '望牛墩镇', '2895', '2084', '1960', '2015-05-22 15:18:30', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2118', '中山市', '214', '1960', '1960', '2015-05-22 15:18:30', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2119', '火炬开发区', '2896', '2118', '2118', '2015-05-22 15:18:30', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2120', '石歧区', '2897', '2118', '2118', '2015-05-22 15:18:30', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2121', '东区', '2898', '2118', '2118', '2015-05-22 15:18:30', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2122', '南区', '2899', '2118', '2118', '2015-05-22 15:18:30', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('2123', '西区', '2900', '2118', '2118', '2015-05-22 15:18:30', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2124', '小榄镇', '2901', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2125', '南头镇', '2902', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2126', '黄圃镇', '2903', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2127', '古镇镇', '2904', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2128', '三角镇', '2905', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2129', '东凤镇', '2906', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2130', '东升镇', '2907', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2131', '阜沙镇', '2908', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2132', '民众镇', '2909', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2133', '港口镇', '2910', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2134', '沙溪镇', '2911', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2135', '横栏镇', '2912', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2136', '大涌镇', '2913', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2137', '三乡镇', '2914', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2138', '坦洲镇', '2915', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2139', '南朗镇', '2916', '2118', '1960', '2015-05-22 15:18:30', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2140', '神湾镇', '2917', '2118', '1960', '2015-05-22 15:18:31', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2141', '板芙镇', '2918', '2118', '1960', '2015-05-22 15:18:31', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2142', '五桂山镇', '2919', '2118', '1960', '2015-05-22 15:18:31', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2143', '潮州市', '215', '1960', '1960', '2015-05-22 15:18:31', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2144', '湘桥区', '1855', '2143', '2143', '2015-05-22 15:18:31', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2145', '潮安县', '1856', '2143', '1960', '2015-05-22 15:18:31', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2146', '饶平县', '1857', '2143', '1960', '2015-05-22 15:18:31', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2147', '揭阳市', '216', '1960', '1960', '2015-05-22 15:18:31', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2148', '榕城区', '1858', '2147', '2147', '2015-05-22 15:18:31', '', '3', '3', 'R', '0');
INSERT INTO `lr_province` VALUES ('2149', '揭东县', '1859', '2147', '1960', '2015-05-22 15:18:31', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2150', '揭西县', '1860', '2147', '1960', '2015-05-22 15:18:31', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2151', '惠来县', '1861', '2147', '1960', '2015-05-22 15:18:31', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2152', '普宁市', '1862', '2147', '1960', '2015-05-22 15:18:31', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2153', '云浮市', '217', '1960', '1960', '2015-05-22 15:18:31', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2154', '云城区', '1863', '2153', '2153', '2015-05-22 15:18:31', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2155', '新兴县', '1864', '2153', '1960', '2015-05-22 15:18:31', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2156', '郁南县', '1865', '2153', '1960', '2015-05-22 15:18:31', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2157', '云安县', '1866', '2153', '1960', '2015-05-22 15:18:31', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2158', '罗定市', '1867', '2153', '1960', '2015-05-22 15:18:31', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2159', '广西', '20', null, null, '2015-05-22 15:18:31', '', '1', '1', 'G', '0');
INSERT INTO `lr_province` VALUES ('2160', '南宁市', '218', '2159', '2159', '2015-05-22 15:18:31', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2161', '兴宁区', '1868', '2160', '2160', '2015-05-22 15:18:31', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2162', '青秀区', '1869', '2160', '2160', '2015-05-22 15:18:31', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2163', '江南区', '1870', '2160', '2160', '2015-05-22 15:18:31', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2164', '西乡塘区', '1871', '2160', '2160', '2015-05-22 15:18:31', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2165', '良庆区', '1872', '2160', '2160', '2015-05-22 15:18:31', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2166', '邕宁区', '1873', '2160', '2160', '2015-05-22 15:18:31', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2167', '武鸣县', '1874', '2160', '2159', '2015-05-22 15:18:31', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2168', '隆安县', '1875', '2160', '2159', '2015-05-22 15:18:31', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2169', '马山县', '1876', '2160', '2159', '2015-05-22 15:18:32', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2170', '上林县', '1877', '2160', '2159', '2015-05-22 15:18:32', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2171', '宾阳县', '1878', '2160', '2159', '2015-05-22 15:18:32', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2172', '横县', '1879', '2160', '2159', '2015-05-22 15:18:32', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2173', '柳州市', '219', '2159', '2159', '2015-05-22 15:18:32', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2174', '城中区', '1880', '2173', '2173', '2015-05-22 15:18:32', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2175', '鱼峰区', '1881', '2173', '2173', '2015-05-22 15:18:32', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2176', '柳南区', '1882', '2173', '2173', '2015-05-22 15:18:32', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2177', '柳北区', '1883', '2173', '2173', '2015-05-22 15:18:32', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2178', '柳江县', '1884', '2173', '2159', '2015-05-22 15:18:32', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2179', '柳城县', '1885', '2173', '2159', '2015-05-22 15:18:32', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2180', '鹿寨县', '1886', '2173', '2159', '2015-05-22 15:18:32', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2181', '融安县', '1887', '2173', '2159', '2015-05-22 15:18:32', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2182', '融水苗族自治县', '1888', '2173', '2159', '2015-05-22 15:18:32', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2183', '三江侗族自治县', '1889', '2173', '2159', '2015-05-22 15:18:32', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2184', '桂林市', '220', '2159', '2159', '2015-05-22 15:18:32', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2185', '秀峰区', '1890', '2184', '2184', '2015-05-22 15:18:32', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2186', '叠彩区', '1891', '2184', '2184', '2015-05-22 15:18:32', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2187', '象山区', '1892', '2184', '2184', '2015-05-22 15:18:32', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2188', '七星区', '1893', '2184', '2184', '2015-05-22 15:18:32', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2189', '雁山区', '1894', '2184', '2184', '2015-05-22 15:18:32', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2190', '阳朔县', '1895', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2191', '临桂县', '1896', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2192', '灵川县', '1897', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2193', '全州县', '1898', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2194', '兴安县', '1899', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2195', '永福县', '1900', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2196', '灌阳县', '1901', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2197', '龙胜各族自治县', '1902', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2198', '资源县', '1903', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2199', '平乐县', '1904', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2200', '荔蒲县', '1905', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2201', '恭城瑶族自治县', '1906', '2184', '2159', '2015-05-22 15:18:33', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2202', '梧州市', '221', '2159', '2159', '2015-05-22 15:18:33', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2203', '万秀区', '1907', '2202', '2202', '2015-05-22 15:18:33', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2204', '蝶山区', '1908', '2202', '2202', '2015-05-22 15:18:33', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2205', '长洲区', '1909', '2202', '2202', '2015-05-22 15:18:33', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2206', '苍梧县', '1910', '2202', '2159', '2015-05-22 15:18:33', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2207', '藤县', '1911', '2202', '2159', '2015-05-22 15:18:33', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2208', '蒙山县', '1912', '2202', '2159', '2015-05-22 15:18:33', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2209', '岑溪市', '1913', '2202', '2159', '2015-05-22 15:18:33', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2210', '北海市', '222', '2159', '2159', '2015-05-22 15:18:33', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2211', '海城区', '1914', '2210', '2210', '2015-05-22 15:18:33', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2212', '银海区', '1915', '2210', '2210', '2015-05-22 15:18:33', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2213', '铁山港区', '1916', '2210', '2210', '2015-05-22 15:18:33', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('2214', '合浦县', '1917', '2210', '2159', '2015-05-22 15:18:33', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2215', '防城港市', '223', '2159', '2159', '2015-05-22 15:18:33', '', '2', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2216', '港口区', '1918', '2215', '2215', '2015-05-22 15:18:33', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2217', '防城区', '1919', '2215', '2215', '2015-05-22 15:18:33', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('2218', '上思县', '1920', '2215', '2159', '2015-05-22 15:18:33', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2219', '东兴市', '1921', '2215', '2159', '2015-05-22 15:18:33', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2220', '钦州市', '224', '2159', '2159', '2015-05-22 15:18:33', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2221', '钦南区', '1922', '2220', '2220', '2015-05-22 15:18:34', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2222', '钦北区', '1923', '2220', '2220', '2015-05-22 15:18:34', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2223', '灵山县', '1924', '2220', '2159', '2015-05-22 15:18:34', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2224', '浦北县', '1925', '2220', '2159', '2015-05-22 15:18:34', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2225', '贵港市', '225', '2159', '2159', '2015-05-22 15:18:34', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2226', '港北区', '1926', '2225', '2225', '2015-05-22 15:18:34', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2227', '港南区', '1927', '2225', '2225', '2015-05-22 15:18:34', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2228', '覃塘区', '1928', '2225', '2225', '2015-05-22 15:18:34', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('2229', '平南县', '1929', '2225', '2159', '2015-05-22 15:18:34', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2230', '桂平市', '1930', '2225', '2159', '2015-05-22 15:18:34', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2231', '玉林市', '226', '2159', '2159', '2015-05-22 15:18:34', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2232', '玉州区', '1931', '2231', '2231', '2015-05-22 15:18:34', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2233', '容县', '1932', '2231', '2159', '2015-05-22 15:18:34', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2234', '陆川县', '1933', '2231', '2159', '2015-05-22 15:18:34', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2235', '博白县', '1934', '2231', '2159', '2015-05-22 15:18:34', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2236', '兴业县', '1935', '2231', '2159', '2015-05-22 15:18:34', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2237', '北流市', '1936', '2231', '2159', '2015-05-22 15:18:34', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2238', '百色市', '227', '2159', '2159', '2015-05-22 15:18:34', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2239', '右江区', '1937', '2238', '2238', '2015-05-22 15:18:34', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2240', '田阳县', '1938', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2241', '田东县', '1939', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2242', '平果县', '1940', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2243', '德保县', '1941', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2244', '靖西县', '1942', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2245', '那坡县', '1943', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2246', '凌云县', '1944', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2247', '乐业县', '1945', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2248', '田林县', '1946', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2249', '西林县', '1947', '2238', '2159', '2015-05-22 15:18:34', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2250', '隆林各族自治县', '1948', '2238', '2159', '2015-05-22 15:18:35', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2251', '贺州市', '228', '2159', '2159', '2015-05-22 15:18:35', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2252', '八步区', '1949', '2251', '2251', '2015-05-22 15:18:35', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2253', '昭平县', '1950', '2251', '2159', '2015-05-22 15:18:35', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2254', '钟山县', '1951', '2251', '2159', '2015-05-22 15:18:35', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2255', '富川瑶族自治县', '1952', '2251', '2159', '2015-05-22 15:18:35', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2256', '河池市', '229', '2159', '2159', '2015-05-22 15:18:35', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2257', '金城江区', '1953', '2256', '2256', '2015-05-22 15:18:35', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2258', '南丹县', '1954', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2259', '天峨县', '1955', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2260', '凤山县', '1956', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2261', '东兰县', '1957', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2262', '罗城仫佬族自治县', '1958', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2263', '环江毛南族自治县', '1959', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2264', '巴马瑶族自治县', '1960', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2265', '都安瑶族自治县', '1961', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2266', '大化瑶族自治县', '1962', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2267', '宜州市', '1963', '2256', '2159', '2015-05-22 15:18:35', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2268', '来宾市', '230', '2159', '2159', '2015-05-22 15:18:35', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2269', '兴宾区', '1964', '2268', '2268', '2015-05-22 15:18:35', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2270', '忻城县', '1965', '2268', '2159', '2015-05-22 15:18:35', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2271', '象州县', '1966', '2268', '2159', '2015-05-22 15:18:35', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2272', '武宣县', '1967', '2268', '2159', '2015-05-22 15:18:35', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2273', '金秀瑶族自治县', '1968', '2268', '2159', '2015-05-22 15:18:35', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2274', '合山市', '1969', '2268', '2159', '2015-05-22 15:18:36', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2275', '崇左市', '231', '2159', '2159', '2015-05-22 15:18:36', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2276', '江洲区', '1970', '2275', '2275', '2015-05-22 15:18:36', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2277', '扶绥县', '1971', '2275', '2159', '2015-05-22 15:18:36', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2278', '宁明县', '1972', '2275', '2159', '2015-05-22 15:18:36', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2279', '龙州县', '1973', '2275', '2159', '2015-05-22 15:18:36', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2280', '大新县', '1974', '2275', '2159', '2015-05-22 15:18:36', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2281', '天等县', '1975', '2275', '2159', '2015-05-22 15:18:36', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2282', '凭祥市', '1976', '2275', '2159', '2015-05-22 15:18:36', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2283', '海南', '21', null, null, '2015-05-22 15:18:36', '', '1', '1', 'H', '0');
INSERT INTO `lr_province` VALUES ('2284', '海口市', '232', '2283', '2283', '2015-05-22 15:18:36', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2285', '秀英区', '1977', '2284', '2284', '2015-05-22 15:18:36', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2286', '龙华区', '1978', '2284', '2284', '2015-05-22 15:18:36', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2287', '琼山区', '1979', '2284', '2284', '2015-05-22 15:18:36', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2288', '美兰区', '1980', '2284', '2284', '2015-05-22 15:18:36', '', '3', '3', 'M', '0');
INSERT INTO `lr_province` VALUES ('2289', '三亚市', '233', '2283', '2283', '2015-05-22 15:18:36', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2290', '五指山市', '1981', '3304', '2283', '2015-05-22 15:18:36', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2291', '琼海市', '1982', '3306', '2283', '2015-05-22 15:18:36', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2292', '儋州市', '1983', '3309', '2283', '2015-05-22 15:18:36', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2293', '文昌市', '1984', '3305', '2283', '2015-05-22 15:18:36', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2294', '万宁市', '1985', '3302', '2283', '2015-05-22 15:18:36', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2295', '东方市', '1986', '3303', '2283', '2015-05-22 15:18:36', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2296', '定安县', '1987', '3310', '2283', '2015-05-22 15:18:36', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2297', '屯昌县', '1988', '3310', '2283', '2015-05-22 15:18:37', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2298', '澄迈县', '1989', '3310', '2283', '2015-05-22 15:18:37', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2299', '临高县', '1990', '3310', '2283', '2015-05-22 15:18:37', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2300', '白沙黎族自治县', '1991', '3311', '2283', '2015-05-22 15:18:37', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2301', '昌江黎族自治县', '1992', '3311', '2283', '2015-05-22 15:18:37', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2302', '乐东黎族自治县', '1993', '3311', '2283', '2015-05-22 15:18:37', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2303', '陵水黎族自治县', '1994', '3311', '2283', '2015-05-22 15:18:37', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2304', '保亭黎族苗族自治县', '1995', '3311', '2283', '2015-05-22 15:18:37', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2305', '琼中黎族苗族自治县', '1996', '3311', '2283', '2015-05-22 15:18:37', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2306', '西沙群岛', '1997', '3307', '2283', '2015-05-22 15:18:37', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2307', '南沙群岛', '1998', '3307', '2283', '2015-05-22 15:18:37', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2308', '中沙群岛的岛礁及其海域', '1999', '3307', '2283', '2015-05-22 15:18:37', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2309', '重庆', '22', null, null, '2015-05-22 15:18:37', '', '1', '1', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2310', '重庆市', '234', '2309', '2309', '2015-05-22 15:18:37', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2311', '万州区', '2000', '2310', '2310', '2015-05-22 15:18:37', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2312', '涪陵区', '2001', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('2313', '渝中区', '2002', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2314', '大渡口区', '2003', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2315', '江北区', '2004', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2316', '沙坪坝区', '2005', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2317', '九龙坡区', '2006', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2318', '南岸区', '2007', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('2319', '北碚区', '2008', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2320', '万盛区', '2009', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2321', '双桥区', '2010', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2322', '渝北区', '2011', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2323', '巴南区', '2012', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2324', '黔江区', '2013', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2325', '长寿区', '2014', '2310', '2310', '2015-05-22 15:18:38', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2326', '綦江县', '2015', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2327', '潼南县', '2016', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2328', '铜梁县', '2017', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2329', '大足县', '2018', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2330', '荣昌县', '2019', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2331', '璧山县', '2020', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2332', '梁平县', '2021', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2333', '城口县', '2022', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2334', '丰都县', '2023', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2335', '垫江县', '2024', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2336', '武隆县', '2025', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2337', '忠县', '2026', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2338', '开县', '2027', '2310', '2309', '2015-05-22 15:18:38', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2339', '云阳县', '2028', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2340', '奉节县', '2029', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2341', '巫山县', '2030', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2342', '巫溪县', '2031', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2343', '石柱土家族自治县', '2032', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2344', '秀山土家族苗族自治县', '2033', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2345', '酉阳土家族苗族自治县', '2034', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2346', '彭水苗族土家族自治县', '2035', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2347', '江津市', '2036', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2348', '合川市', '2037', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2349', '永川市', '2038', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2350', '南川市', '2039', '2310', '2309', '2015-05-22 15:18:39', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2351', '四川', '23', null, null, '2015-05-22 15:18:39', '', '1', '1', 'S', '0');
INSERT INTO `lr_province` VALUES ('2352', '成都市', '235', '2351', '2351', '2015-05-22 15:18:39', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2353', '锦江区', '2040', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2354', '青羊区', '2041', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2355', '金牛区', '2042', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2356', '武侯区', '2043', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2357', '成华区', '2044', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2358', '龙泉驿区', '2045', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2359', '青白江区', '2046', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2360', '新都区', '2047', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2361', '温江区', '2048', '2352', '2352', '2015-05-22 15:18:39', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2362', '金堂县', '2049', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2363', '双流县', '2050', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2364', '郫县', '2051', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2365', '大邑县', '2052', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2366', '蒲江县', '2053', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2367', '新津县', '2054', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2368', '都江堰市', '2055', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2369', '彭州市', '2056', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2370', '邛崃市', '2057', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2371', '崇州市', '2058', '2352', '2351', '2015-05-22 15:18:40', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2372', '自贡市', '236', '2351', '2351', '2015-05-22 15:18:40', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2373', '自流井区', '2059', '2372', '2372', '2015-05-22 15:18:40', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2374', '贡井区', '2060', '2372', '2372', '2015-05-22 15:18:40', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2375', '大安区', '2061', '2372', '2372', '2015-05-22 15:18:40', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2376', '沿滩区', '2062', '2372', '2372', '2015-05-22 15:18:40', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2377', '荣县', '2063', '2372', '2351', '2015-05-22 15:18:40', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2378', '富顺县', '2064', '2372', '2351', '2015-05-22 15:18:40', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2379', '攀枝花市', '237', '2351', '2351', '2015-05-22 15:18:40', '', '2', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2380', '东区', '2065', '2379', '2379', '2015-05-22 15:18:40', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2381', '西区', '2066', '2379', '2379', '2015-05-22 15:18:40', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2382', '仁和区', '2067', '2379', '2379', '2015-05-22 15:18:40', '', '3', '3', 'R', '0');
INSERT INTO `lr_province` VALUES ('2383', '米易县', '2068', '2379', '2351', '2015-05-22 15:18:40', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2384', '盐边县', '2069', '2379', '2351', '2015-05-22 15:18:40', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2385', '泸州市', '238', '2351', '2351', '2015-05-22 15:18:40', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2386', '江阳区', '2070', '2385', '2385', '2015-05-22 15:18:40', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2387', '纳溪区', '2071', '2385', '2385', '2015-05-22 15:18:40', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('2388', '龙马潭区', '2072', '2385', '2385', '2015-05-22 15:18:40', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2389', '泸县', '2073', '2385', '2351', '2015-05-22 15:18:40', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2390', '合江县', '2074', '2385', '2351', '2015-05-22 15:18:41', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2391', '叙永县', '2075', '2385', '2351', '2015-05-22 15:18:41', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2392', '古蔺县', '2076', '2385', '2351', '2015-05-22 15:18:41', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2393', '德阳市', '239', '2351', '2351', '2015-05-22 15:18:41', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2394', '旌阳区', '2077', '2393', '2393', '2015-05-22 15:18:41', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2395', '中江县', '2078', '2393', '2351', '2015-05-22 15:18:41', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2396', '罗江县', '2079', '2393', '2351', '2015-05-22 15:18:41', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2397', '广汉市', '2080', '2393', '2351', '2015-05-22 15:18:41', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2398', '什邡市', '2081', '2393', '2351', '2015-05-22 15:18:41', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2399', '绵竹市', '2082', '2393', '2351', '2015-05-22 15:18:41', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2400', '绵阳市', '240', '2351', '2351', '2015-05-22 15:18:41', '', '2', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2401', '涪城区', '2083', '2400', '2400', '2015-05-22 15:18:41', '', '3', '3', 'F', '0');
INSERT INTO `lr_province` VALUES ('2402', '游仙区', '2084', '2400', '2400', '2015-05-22 15:18:41', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2403', '三台县', '2085', '2400', '2351', '2015-05-22 15:18:41', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2404', '盐亭县', '2086', '2400', '2351', '2015-05-22 15:18:41', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2405', '安县', '2087', '2400', '2351', '2015-05-22 15:18:41', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2406', '梓潼县', '2088', '2400', '2351', '2015-05-22 15:18:41', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2407', '北川羌族自治县', '2089', '2400', '2351', '2015-05-22 15:18:41', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2408', '平武县', '2090', '2400', '2351', '2015-05-22 15:18:41', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2409', '江油市', '2091', '2400', '2351', '2015-05-22 15:18:41', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2410', '广元市', '241', '2351', '2351', '2015-05-22 15:18:41', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2411', '市中区', '2092', '2410', '2410', '2015-05-22 15:18:41', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2412', '元坝区', '2093', '2410', '2410', '2015-05-22 15:18:41', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2413', '朝天区', '2094', '2410', '2410', '2015-05-22 15:18:41', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2414', '旺苍县', '2095', '2410', '2351', '2015-05-22 15:18:42', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2415', '青川县', '2096', '2410', '2351', '2015-05-22 15:18:42', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2416', '剑阁县', '2097', '2410', '2351', '2015-05-22 15:18:42', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2417', '苍溪县', '2098', '2410', '2351', '2015-05-22 15:18:42', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2418', '遂宁市', '242', '2351', '2351', '2015-05-22 15:18:42', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2419', '船山区', '2099', '2418', '2418', '2015-05-22 15:18:42', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2420', '安居区', '2100', '2418', '2418', '2015-05-22 15:18:42', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('2421', '蓬溪县', '2101', '2418', '2351', '2015-05-22 15:18:42', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2422', '射洪县', '2102', '2418', '2351', '2015-05-22 15:18:42', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2423', '大英县', '2103', '2418', '2351', '2015-05-22 15:18:42', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2424', '内江市', '243', '2351', '2351', '2015-05-22 15:18:42', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2425', '市中区', '2104', '2424', '2424', '2015-05-22 15:18:42', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2426', '东兴区', '2105', '2424', '2424', '2015-05-22 15:18:42', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2427', '威远县', '2106', '2424', '2351', '2015-05-22 15:18:42', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2428', '资中县', '2107', '2424', '2351', '2015-05-22 15:18:42', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2429', '隆昌县', '2108', '2424', '2351', '2015-05-22 15:18:42', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2430', '乐山市', '244', '2351', '2351', '2015-05-22 15:18:42', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2431', '市中区', '2109', '2430', '2430', '2015-05-22 15:18:42', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2432', '沙湾区', '2110', '2430', '2430', '2015-05-22 15:18:42', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2433', '五通桥区', '2111', '2430', '2430', '2015-05-22 15:18:42', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2434', '金口河区', '2112', '2430', '2430', '2015-05-22 15:18:42', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2435', '犍为县', '2113', '2430', '2351', '2015-05-22 15:18:42', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2436', '井研县', '2114', '2430', '2351', '2015-05-22 15:18:42', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2437', '夹江县', '2115', '2430', '2351', '2015-05-22 15:18:42', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2438', '沐川县', '2116', '2430', '2351', '2015-05-22 15:18:43', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2439', '峨边彝族自治县', '2117', '2430', '2351', '2015-05-22 15:18:43', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('2440', '马边彝族自治县', '2118', '2430', '2351', '2015-05-22 15:18:43', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2441', '峨眉山市', '2119', '2430', '2351', '2015-05-22 15:18:43', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('2442', '南充市', '245', '2351', '2351', '2015-05-22 15:18:43', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2443', '顺庆区', '2120', '2442', '2442', '2015-05-22 15:18:43', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2444', '高坪区', '2121', '2442', '2442', '2015-05-22 15:18:43', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2445', '嘉陵区', '2122', '2442', '2442', '2015-05-22 15:18:43', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2446', '南部县', '2123', '2442', '2351', '2015-05-22 15:18:43', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2447', '营山县', '2124', '2442', '2351', '2015-05-22 15:18:43', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2448', '蓬安县', '2125', '2442', '2351', '2015-05-22 15:18:43', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2449', '仪陇县', '2126', '2442', '2351', '2015-05-22 15:18:43', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2450', '西充县', '2127', '2442', '2351', '2015-05-22 15:18:43', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2451', '阆中市', '2128', '2442', '2351', '2015-05-22 15:18:43', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2452', '眉山市', '246', '2351', '2351', '2015-05-22 15:18:43', '', '2', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2453', '东坡区', '2129', '2452', '2452', '2015-05-22 15:18:43', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2454', '仁寿县', '2130', '2452', '2351', '2015-05-22 15:18:43', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2455', '彭山县', '2131', '2452', '2351', '2015-05-22 15:18:43', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2456', '洪雅县', '2132', '2452', '2351', '2015-05-22 15:18:43', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2457', '丹棱县', '2133', '2452', '2351', '2015-05-22 15:18:43', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2458', '青神县', '2134', '2452', '2351', '2015-05-22 15:18:43', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2459', '宜宾市', '247', '2351', '2351', '2015-05-22 15:18:43', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2460', '翠屏区', '2135', '2459', '2459', '2015-05-22 15:18:43', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2461', '宜宾县', '2136', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2462', '南溪县', '2137', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2463', '江安县', '2138', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2464', '长宁县', '2139', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2465', '高县', '2140', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2466', '珙县', '2141', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2467', '筠连县', '2142', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2468', '兴文县', '2143', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2469', '屏山县', '2144', '2459', '2351', '2015-05-22 15:18:44', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2470', '广安市', '248', '2351', '2351', '2015-05-22 15:18:44', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2471', '广安区', '2145', '2470', '2470', '2015-05-22 15:18:44', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2472', '岳池县', '2146', '2470', '2351', '2015-05-22 15:18:44', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2473', '武胜县', '2147', '2470', '2351', '2015-05-22 15:18:44', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2474', '邻水县', '2148', '2470', '2351', '2015-05-22 15:18:44', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2475', '华蓥市', '2149', '2470', '2351', '2015-05-22 15:18:44', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2476', '达州市', '249', '2351', '2351', '2015-05-22 15:18:44', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2477', '通川区', '2150', '2476', '2476', '2015-05-22 15:18:44', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('2478', '达县', '2151', '2476', '2351', '2015-05-22 15:18:44', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2479', '宣汉县', '2152', '2476', '2351', '2015-05-22 15:18:44', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2480', '开江县', '2153', '2476', '2351', '2015-05-22 15:18:44', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2481', '大竹县', '2154', '2476', '2351', '2015-05-22 15:18:44', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2482', '渠县', '2155', '2476', '2351', '2015-05-22 15:18:44', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2483', '万源市', '2156', '2476', '2351', '2015-05-22 15:18:44', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2484', '雅安市', '250', '2351', '2351', '2015-05-22 15:18:44', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2485', '雨城区', '2157', '2484', '2484', '2015-05-22 15:18:45', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2486', '名山县', '2158', '2484', '2351', '2015-05-22 15:18:45', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2487', '荥经县', '2159', '2484', '2351', '2015-05-22 15:18:45', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2488', '汉源县', '2160', '2484', '2351', '2015-05-22 15:18:45', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2489', '石棉县', '2161', '2484', '2351', '2015-05-22 15:18:45', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2490', '天全县', '2162', '2484', '2351', '2015-05-22 15:18:45', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2491', '芦山县', '2163', '2484', '2351', '2015-05-22 15:18:45', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2492', '宝兴县', '2164', '2484', '2351', '2015-05-22 15:18:45', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2493', '巴中市', '251', '2351', '2351', '2015-05-22 15:18:45', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2494', '巴州区', '2165', '2493', '2493', '2015-05-22 15:18:45', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2495', '通江县', '2166', '2493', '2351', '2015-05-22 15:18:45', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2496', '南江县', '2167', '2493', '2351', '2015-05-22 15:18:45', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2497', '平昌县', '2168', '2493', '2351', '2015-05-22 15:18:45', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2498', '资阳市', '252', '2351', '2351', '2015-05-22 15:18:45', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2499', '雁江区', '2169', '2498', '2498', '2015-05-22 15:18:45', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2500', '安岳县', '2170', '2498', '2351', '2015-05-22 15:18:45', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2501', '乐至县', '2171', '2498', '2351', '2015-05-22 15:18:45', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2502', '简阳市', '2172', '2498', '2351', '2015-05-22 15:18:45', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2503', '阿坝', '253', '2351', '2351', '2015-05-22 15:18:45', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2504', '汶川县', '2173', '2503', '2351', '2015-05-22 15:18:45', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2505', '理县', '2174', '2503', '2351', '2015-05-22 15:18:45', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2506', '茂县', '2175', '2503', '2351', '2015-05-22 15:18:45', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2507', '松潘县', '2176', '2503', '2351', '2015-05-22 15:18:45', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2508', '九寨沟县', '2177', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2509', '金川县', '2178', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2510', '小金县', '2179', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2511', '黑水县', '2180', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2512', '马尔康县', '2181', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2513', '壤塘县', '2182', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2514', '阿坝县', '2183', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2515', '若尔盖县', '2184', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2516', '红原县', '2185', '2503', '2351', '2015-05-22 15:18:46', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2517', '甘孜', '254', '2351', '2351', '2015-05-22 15:18:46', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2518', '康定县', '2186', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2519', '泸定县', '2187', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2520', '丹巴县', '2188', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2521', '九龙县', '2189', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2522', '雅江县', '2190', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2523', '道孚县', '2191', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2524', '炉霍县', '2192', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2525', '甘孜县', '2193', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2526', '新龙县', '2194', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2527', '德格县', '2195', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2528', '白玉县', '2196', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2529', '石渠县', '2197', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2530', '色达县', '2198', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2531', '理塘县', '2199', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2532', '巴塘县', '2200', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2533', '乡城县', '2201', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2534', '稻城县', '2202', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2535', '得荣县', '2203', '2517', '2351', '2015-05-22 15:18:46', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2536', '凉山', '255', '2351', '2351', '2015-05-22 15:18:46', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2537', '西昌市', '2204', '2536', '2351', '2015-05-22 15:18:46', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2538', '木里藏族自治县', '2205', '2536', '2351', '2015-05-22 15:18:46', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2539', '盐源县', '2206', '2536', '2351', '2015-05-22 15:18:46', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2540', '德昌县', '2207', '2536', '2351', '2015-05-22 15:18:46', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2541', '会理县', '2208', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2542', '会东县', '2209', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2543', '宁南县', '2210', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2544', '普格县', '2211', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2545', '布拖县', '2212', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2546', '金阳县', '2213', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2547', '昭觉县', '2214', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2548', '喜德县', '2215', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2549', '冕宁县', '2216', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2550', '越西县', '2217', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2551', '甘洛县', '2218', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2552', '美姑县', '2219', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2553', '雷波县', '2220', '2536', '2351', '2015-05-22 15:18:47', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2554', '贵州', '24', null, null, '2015-05-22 15:18:47', '', '1', '1', 'G', '0');
INSERT INTO `lr_province` VALUES ('2555', '贵阳市', '256', '2554', '2554', '2015-05-22 15:18:47', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2556', '南明区', '2221', '2555', '2555', '2015-05-22 15:18:47', '', '3', '3', 'N', '0');
INSERT INTO `lr_province` VALUES ('2557', '云岩区', '2222', '2555', '2555', '2015-05-22 15:18:47', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2558', '花溪区', '2223', '2555', '2555', '2015-05-22 15:18:47', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2559', '乌当区', '2224', '2555', '2555', '2015-05-22 15:18:47', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2560', '白云区', '2225', '2555', '2555', '2015-05-22 15:18:47', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2561', '小河区', '2226', '2555', '2555', '2015-05-22 15:18:47', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2562', '开阳县', '2227', '2555', '2554', '2015-05-22 15:18:47', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2563', '息烽县', '2228', '2555', '2554', '2015-05-22 15:18:47', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2564', '修文县', '2229', '2555', '2554', '2015-05-22 15:18:47', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2565', '清镇市', '2230', '2555', '2554', '2015-05-22 15:18:47', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2566', '六盘水市', '257', '2554', '2554', '2015-05-22 15:18:47', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2567', '钟山区', '2231', '2566', '2566', '2015-05-22 15:18:47', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2568', '六枝特区', '2232', '2566', '2566', '2015-05-22 15:18:47', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2569', '水城县', '2233', '2566', '2554', '2015-05-22 15:18:47', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2570', '盘县', '2234', '2566', '2554', '2015-05-22 15:18:47', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2571', '遵义市', '258', '2554', '2554', '2015-05-22 15:18:48', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2572', '红花岗区', '2235', '2571', '2571', '2015-05-22 15:18:48', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2573', '汇川区', '2236', '2571', '2571', '2015-05-22 15:18:48', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2574', '遵义县', '2237', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2575', '桐梓县', '2238', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2576', '绥阳县', '2239', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2577', '正安县', '2240', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2578', '道真仡佬族苗族自治县', '2241', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2579', '务川仡佬族苗族自治县', '2242', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2580', '凤冈县', '2243', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2581', '湄潭县', '2244', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2582', '余庆县', '2245', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2583', '习水县', '2246', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2584', '赤水市', '2247', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2585', '仁怀市', '2248', '2571', '2554', '2015-05-22 15:18:48', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2586', '安顺市', '259', '2554', '2554', '2015-05-22 15:18:48', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2587', '西秀区', '2249', '2586', '2586', '2015-05-22 15:18:48', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2588', '平坝县', '2250', '2586', '2554', '2015-05-22 15:18:48', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2589', '普定县', '2251', '2586', '2554', '2015-05-22 15:18:48', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2590', '镇宁布依族苗族自治县', '2252', '2586', '2554', '2015-05-22 15:18:48', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2591', '关岭布依族苗族自治县', '2253', '2586', '2554', '2015-05-22 15:18:48', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2592', '紫云苗族布依族自治县', '2254', '2586', '2554', '2015-05-22 15:18:48', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2593', '铜仁地区', '260', '2554', '2554', '2015-05-22 15:18:48', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2594', '铜仁市', '2255', '2593', '2554', '2015-05-22 15:18:48', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2595', '江口县', '2256', '2593', '2554', '2015-05-22 15:18:48', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2596', '玉屏侗族自治县', '2257', '2593', '2554', '2015-05-22 15:18:48', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2597', '石阡县', '2258', '2593', '2554', '2015-05-22 15:18:48', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2598', '思南县', '2259', '2593', '2554', '2015-05-22 15:18:48', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2599', '印江土家族苗族自治县', '2260', '2593', '2554', '2015-05-22 15:18:49', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2600', '德江县', '2261', '2593', '2554', '2015-05-22 15:18:49', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2601', '沿河土家族自治县', '2262', '2593', '2554', '2015-05-22 15:18:49', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2602', '松桃苗族自治县', '2263', '2593', '2554', '2015-05-22 15:18:49', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2603', '万山特区', '2264', '2593', '2593', '2015-05-22 15:18:49', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2604', '黔西', '261', '2554', '2554', '2015-05-22 15:18:49', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2605', '兴义市', '2265', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2606', '兴仁县', '2266', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2607', '普安县', '2267', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2608', '晴隆县', '2268', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2609', '贞丰县', '2269', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2610', '望谟县', '2270', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2611', '册亨县', '2271', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2612', '安龙县', '2272', '2604', '2554', '2015-05-22 15:18:49', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2613', '毕节地区', '262', '2554', '2554', '2015-05-22 15:18:49', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2614', '毕节市', '2273', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2615', '大方县', '2274', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2616', '黔西县', '2275', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2617', '金沙县', '2276', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2618', '织金县', '2277', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2619', '纳雍县', '2278', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2620', '威宁彝族回族苗族自治县', '2279', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2621', '赫章县', '2280', '2613', '2554', '2015-05-22 15:18:49', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2622', '黔东', '263', '2554', '2554', '2015-05-22 15:18:49', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2623', '凯里市', '2281', '2622', '2554', '2015-05-22 15:18:49', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2624', '黄平县', '2282', '2622', '2554', '2015-05-22 15:18:49', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2625', '施秉县', '2283', '2622', '2554', '2015-05-22 15:18:49', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2626', '三穗县', '2284', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2627', '镇远县', '2285', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2628', '岑巩县', '2286', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2629', '天柱县', '2287', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2630', '锦屏县', '2288', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2631', '剑河县', '2289', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2632', '台江县', '2290', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2633', '黎平县', '2291', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2634', '榕江县', '2292', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2635', '从江县', '2293', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2636', '雷山县', '2294', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2637', '麻江县', '2295', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2638', '丹寨县', '2296', '2622', '2554', '2015-05-22 15:18:50', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2639', '黔南', '264', '2554', '2554', '2015-05-22 15:18:50', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2640', '都匀市', '2297', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2641', '福泉市', '2298', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2642', '荔波县', '2299', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2643', '贵定县', '2300', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2644', '瓮安县', '2301', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2645', '独山县', '2302', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2646', '平塘县', '2303', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2647', '罗甸县', '2304', '2639', '2554', '2015-05-22 15:18:50', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2648', '长顺县', '2305', '2639', '2554', '2015-05-22 15:18:51', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2649', '龙里县', '2306', '2639', '2554', '2015-05-22 15:18:51', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2650', '惠水县', '2307', '2639', '2554', '2015-05-22 15:18:51', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2651', '三都水族自治县', '2308', '2639', '2554', '2015-05-22 15:18:51', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2652', '云南', '25', null, null, '2015-05-22 15:18:51', '', '1', '1', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2653', '昆明市', '265', '2652', '2652', '2015-05-22 15:18:51', '', '2', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2654', '五华区', '2309', '2653', '2653', '2015-05-22 15:18:51', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2655', '盘龙区', '2310', '2653', '2653', '2015-05-22 15:18:51', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('2656', '官渡区', '2311', '2653', '2653', '2015-05-22 15:18:51', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2657', '西山区', '2312', '2653', '2653', '2015-05-22 15:18:51', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2658', '东川区', '2313', '2653', '2653', '2015-05-22 15:18:51', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('2659', '呈贡县', '2314', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2660', '晋宁县', '2315', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2661', '富民县', '2316', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2662', '宜良县', '2317', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2663', '石林彝族自治县', '2318', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2664', '嵩明县', '2319', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2665', '禄劝彝族苗族自治县', '2320', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2666', '寻甸回族彝族自治县', '2321', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2667', '安宁市', '2322', '2653', '2652', '2015-05-22 15:18:51', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2668', '曲靖市', '266', '2652', '2652', '2015-05-22 15:18:51', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2669', '麒麟区', '2323', '2668', '2668', '2015-05-22 15:18:51', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2670', '马龙县', '2324', '2668', '2652', '2015-05-22 15:18:51', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2671', '陆良县', '2325', '2668', '2652', '2015-05-22 15:18:51', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2672', '师宗县', '2326', '2668', '2652', '2015-05-22 15:18:51', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2673', '罗平县', '2327', '2668', '2652', '2015-05-22 15:18:51', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2674', '富源县', '2328', '2668', '2652', '2015-05-22 15:18:52', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2675', '会泽县', '2329', '2668', '2652', '2015-05-22 15:18:52', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2676', '沾益县', '2330', '2668', '2652', '2015-05-22 15:18:52', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2677', '宣威市', '2331', '2668', '2652', '2015-05-22 15:18:52', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2678', '玉溪市', '267', '2652', '2652', '2015-05-22 15:18:52', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2679', '红塔区', '2332', '2678', '2678', '2015-05-22 15:18:52', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2680', '江川县', '2333', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2681', '澄江县', '2334', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2682', '通海县', '2335', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2683', '华宁县', '2336', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2684', '易门县', '2337', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2685', '峨山彝族自治县', '2338', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('2686', '新平彝族傣族自治县', '2339', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2687', '元江哈尼族彝族傣族自治县', '2340', '2678', '2652', '2015-05-22 15:18:52', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2688', '保山市', '268', '2652', '2652', '2015-05-22 15:18:52', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2689', '隆阳区', '2341', '2688', '2688', '2015-05-22 15:18:52', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2690', '施甸县', '2342', '2688', '2652', '2015-05-22 15:18:52', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2691', '腾冲县', '2343', '2688', '2652', '2015-05-22 15:18:52', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2692', '龙陵县', '2344', '2688', '2652', '2015-05-22 15:18:52', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2693', '昌宁县', '2345', '2688', '2652', '2015-05-22 15:18:52', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2694', '昭通市', '269', '2652', '2652', '2015-05-22 15:18:53', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2695', '昭阳区', '2346', '2694', '2694', '2015-05-22 15:18:53', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2696', '鲁甸县', '2347', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2697', '巧家县', '2348', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2698', '盐津县', '2349', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2699', '大关县', '2350', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2700', '永善县', '2351', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2701', '绥江县', '2352', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2702', '镇雄县', '2353', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2703', '彝良县', '2354', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2704', '威信县', '2355', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2705', '水富县', '2356', '2694', '2652', '2015-05-22 15:18:53', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2706', '丽江市', '270', '2652', '2652', '2015-05-22 15:18:53', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2707', '古城区', '2357', '2706', '2706', '2015-05-22 15:18:53', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('2708', '玉龙纳西族自治县', '2358', '2706', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2709', '永胜县', '2359', '2706', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2710', '华坪县', '2360', '2706', '2652', '2015-05-22 15:18:53', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2711', '宁蒗彝族自治县', '2361', '2706', '2652', '2015-05-22 15:18:53', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2712', '思茅市', '271', '2652', '2652', '2015-05-22 15:18:53', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2713', '翠云区', '2362', '2712', '2712', '2015-05-22 15:18:53', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2714', '普洱哈尼族彝族自治县', '2363', '2712', '2652', '2015-05-22 15:18:53', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2715', '墨江哈尼族自治县', '2364', '2712', '2652', '2015-05-22 15:18:53', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2716', '景东彝族自治县', '2365', '2712', '2652', '2015-05-22 15:18:53', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2717', '景谷傣族彝族自治县', '2366', '2712', '2652', '2015-05-22 15:18:53', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2718', '镇沅彝族哈尼族拉祜族自治县', '2367', '2712', '2652', '2015-05-22 15:18:53', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2719', '江城哈尼族彝族自治县', '2368', '2712', '2652', '2015-05-22 15:18:53', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2720', '孟连傣族拉祜族佤族自治县', '2369', '2712', '2652', '2015-05-22 15:18:53', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2721', '澜沧拉祜族自治县', '2370', '2712', '2652', '2015-05-22 15:18:54', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2722', '西盟佤族自治县', '2371', '2712', '2652', '2015-05-22 15:18:54', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2723', '临沧市', '272', '2652', '2652', '2015-05-22 15:18:54', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2724', '临翔区', '2372', '2723', '2723', '2015-05-22 15:18:54', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2725', '凤庆县', '2373', '2723', '2652', '2015-05-22 15:18:54', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2726', '云县', '2374', '2723', '2652', '2015-05-22 15:18:54', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2727', '永德县', '2375', '2723', '2652', '2015-05-22 15:18:54', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2728', '镇康县', '2376', '2723', '2652', '2015-05-22 15:18:54', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2729', '双江拉祜族佤族布朗族傣族自治县', '2377', '2723', '2652', '2015-05-22 15:18:54', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2730', '耿马傣族佤族自治县', '2378', '2723', '2652', '2015-05-22 15:18:54', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2731', '沧源佤族自治县', '2379', '2723', '2652', '2015-05-22 15:18:54', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2732', '楚雄', '273', '2652', '2652', '2015-05-22 15:18:54', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2733', '楚雄市', '2380', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2734', '双柏县', '2381', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2735', '牟定县', '2382', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2736', '南华县', '2383', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2737', '姚安县', '2384', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2738', '大姚县', '2385', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2739', '永仁县', '2386', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2740', '元谋县', '2387', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2741', '武定县', '2388', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2742', '禄丰县', '2389', '2732', '2652', '2015-05-22 15:18:54', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2743', '红河', '274', '2652', '2652', '2015-05-22 15:18:54', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2744', '个旧市', '2390', '2743', '2652', '2015-05-22 15:18:54', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2745', '开远市', '2391', '2743', '2652', '2015-05-22 15:18:54', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2746', '蒙自县', '2392', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2747', '屏边苗族自治县', '2393', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2748', '建水县', '2394', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2749', '石屏县', '2395', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2750', '弥勒县', '2396', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2751', '泸西县', '2397', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2752', '元阳县', '2398', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2753', '红河县', '2399', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2754', '金平苗族瑶族傣族自治县', '2400', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2755', '绿春县', '2401', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2756', '河口瑶族自治县', '2402', '2743', '2652', '2015-05-22 15:18:55', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2757', '文山', '275', '2652', '2652', '2015-05-22 15:18:55', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2758', '文山县', '2403', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2759', '砚山县', '2404', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2760', '西畴县', '2405', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2761', '麻栗坡县', '2406', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2762', '马关县', '2407', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2763', '丘北县', '2408', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2764', '广南县', '2409', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2765', '富宁县', '2410', '2757', '2652', '2015-05-22 15:18:55', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2766', '西双版纳', '276', '2652', '2652', '2015-05-22 15:18:55', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2767', '景洪市', '2411', '2766', '2652', '2015-05-22 15:18:55', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2768', '勐海县', '2412', '2766', '2652', '2015-05-22 15:18:55', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2769', '勐腊县', '2413', '2766', '2652', '2015-05-22 15:18:55', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2770', '大理', '277', '2652', '2652', '2015-05-22 15:18:55', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2771', '大理市', '2414', '2770', '2652', '2015-05-22 15:18:55', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2772', '漾濞彝族自治县', '2415', '2770', '2652', '2015-05-22 15:18:55', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2773', '祥云县', '2416', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2774', '宾川县', '2417', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2775', '弥渡县', '2418', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2776', '南涧彝族自治县', '2419', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2777', '巍山彝族回族自治县', '2420', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2778', '永平县', '2421', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2779', '云龙县', '2422', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2780', '洱源县', '2423', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('2781', '剑川县', '2424', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2782', '鹤庆县', '2425', '2770', '2652', '2015-05-22 15:18:56', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2783', '德宏', '278', '2652', '2652', '2015-05-22 15:18:56', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2784', '瑞丽市', '2426', '2783', '2652', '2015-05-22 15:18:56', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2785', '潞西市', '2427', '2783', '2652', '2015-05-22 15:18:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2786', '梁河县', '2428', '2783', '2652', '2015-05-22 15:18:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2787', '盈江县', '2429', '2783', '2652', '2015-05-22 15:18:56', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2788', '陇川县', '2430', '2783', '2652', '2015-05-22 15:18:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2789', '怒江', '279', '2652', '2652', '2015-05-22 15:18:56', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2790', '泸水县', '2431', '2789', '2652', '2015-05-22 15:18:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2791', '福贡县', '2432', '2789', '2652', '2015-05-22 15:18:56', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2792', '贡山独龙族怒族自治县', '2433', '2789', '2652', '2015-05-22 15:18:56', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2793', '兰坪白族普米族自治县', '2434', '2789', '2652', '2015-05-22 15:18:56', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2794', '迪庆', '280', '2652', '2652', '2015-05-22 15:18:56', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2795', '香格里拉县', '2435', '2794', '2652', '2015-05-22 15:18:56', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2796', '德钦县', '2436', '2794', '2652', '2015-05-22 15:18:56', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2797', '维西傈僳族自治县', '2437', '2794', '2652', '2015-05-22 15:18:56', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2798', '西藏', '26', null, null, '2015-05-22 15:18:56', '', '1', '1', 'X', '0');
INSERT INTO `lr_province` VALUES ('2799', '拉萨市', '281', '2798', '2798', '2015-05-22 15:18:56', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2800', '城关区', '2438', '2799', '2799', '2015-05-22 15:18:56', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2801', '林周县', '2439', '2799', '2798', '2015-05-22 15:18:57', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2802', '当雄县', '2440', '2799', '2798', '2015-05-22 15:18:57', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2803', '尼木县', '2441', '2799', '2798', '2015-05-22 15:18:57', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2804', '曲水县', '2442', '2799', '2798', '2015-05-22 15:18:57', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2805', '堆龙德庆县', '2443', '2799', '2798', '2015-05-22 15:18:57', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2806', '达孜县', '2444', '2799', '2798', '2015-05-22 15:18:57', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2807', '墨竹工卡县', '2445', '2799', '2798', '2015-05-22 15:18:57', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2808', '昌都地区', '282', '2798', '2798', '2015-05-22 15:18:57', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2809', '昌都县', '2446', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2810', '江达县', '2447', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2811', '贡觉县', '2448', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2812', '类乌齐县', '2449', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2813', '丁青县', '2450', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2814', '察雅县', '2451', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2815', '八宿县', '2452', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2816', '左贡县', '2453', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2817', '芒康县', '2454', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2818', '洛隆县', '2455', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2819', '边坝县', '2456', '2808', '2798', '2015-05-22 15:18:57', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2820', '山南地区', '283', '2798', '2798', '2015-05-22 15:18:57', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2821', '乃东县', '2457', '2820', '2798', '2015-05-22 15:18:57', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2822', '扎囊县', '2458', '2820', '2798', '2015-05-22 15:18:57', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2823', '贡嘎县', '2459', '2820', '2798', '2015-05-22 15:18:57', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2824', '桑日县', '2460', '2820', '2798', '2015-05-22 15:18:57', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2825', '琼结县', '2461', '2820', '2798', '2015-05-22 15:18:57', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2826', '曲松县', '2462', '2820', '2798', '2015-05-22 15:18:57', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2827', '措美县', '2463', '2820', '2798', '2015-05-22 15:18:58', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2828', '洛扎县', '2464', '2820', '2798', '2015-05-22 15:18:58', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2829', '加查县', '2465', '2820', '2798', '2015-05-22 15:18:58', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2830', '隆子县', '2466', '2820', '2798', '2015-05-22 15:18:58', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2831', '错那县', '2467', '2820', '2798', '2015-05-22 15:18:58', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2832', '浪卡子县', '2468', '2820', '2798', '2015-05-22 15:18:58', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2833', '日喀则地区', '284', '2798', '2798', '2015-05-22 15:18:58', '', '2', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2834', '日喀则市', '2469', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2835', '南木林县', '2470', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2836', '江孜县', '2471', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2837', '定日县', '2472', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2838', '萨迦县', '2473', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2839', '拉孜县', '2474', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2840', '昂仁县', '2475', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2841', '谢通门县', '2476', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2842', '白朗县', '2477', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2843', '仁布县', '2478', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2844', '康马县', '2479', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('2845', '定结县', '2480', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2846', '仲巴县', '2481', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2847', '亚东县', '2482', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2848', '吉隆县', '2483', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2849', '聂拉木县', '2484', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2850', '萨嘎县', '2485', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2851', '岗巴县', '2486', '2833', '2798', '2015-05-22 15:18:58', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2852', '那曲地区', '285', '2798', '2798', '2015-05-22 15:18:59', '', '2', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2853', '那曲县', '2487', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2854', '嘉黎县', '2488', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2855', '比如县', '2489', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2856', '聂荣县', '2490', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2857', '安多县', '2491', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2858', '申扎县', '2492', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2859', '索县', '2493', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2860', '班戈县', '2494', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2861', '巴青县', '2495', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2862', '尼玛县', '2496', '2852', '2798', '2015-05-22 15:18:59', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2863', '阿里地区', '286', '2798', '2798', '2015-05-22 15:18:59', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2864', '普兰县', '2497', '2863', '2798', '2015-05-22 15:18:59', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2865', '札达县', '2498', '2863', '2798', '2015-05-22 15:18:59', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2866', '噶尔县', '2499', '2863', '2798', '2015-05-22 15:18:59', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2867', '日土县', '2500', '2863', '2798', '2015-05-22 15:18:59', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('2868', '革吉县', '2501', '2863', '2798', '2015-05-22 15:18:59', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2869', '改则县', '2502', '2863', '2798', '2015-05-22 15:18:59', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2870', '措勤县', '2503', '2863', '2798', '2015-05-22 15:18:59', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2871', '林芝地区', '287', '2798', '2798', '2015-05-22 15:18:59', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2872', '林芝县', '2504', '2871', '2798', '2015-05-22 15:18:59', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2873', '工布江达县', '2505', '2871', '2798', '2015-05-22 15:18:59', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2874', '米林县', '2506', '2871', '2798', '2015-05-22 15:18:59', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2875', '墨脱县', '2507', '2871', '2798', '2015-05-22 15:18:59', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2876', '波密县', '2508', '2871', '2798', '2015-05-22 15:19:00', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2877', '察隅县', '2509', '2871', '2798', '2015-05-22 15:19:00', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2878', '朗县', '2510', '2871', '2798', '2015-05-22 15:19:00', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2879', '陕西', '27', null, null, '2015-05-22 15:19:00', '', '1', '1', 'S', '0');
INSERT INTO `lr_province` VALUES ('2880', '西安市', '288', '2879', '2879', '2015-05-22 15:19:00', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2881', '新城区', '2511', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('2882', '碑林区', '2512', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2883', '莲湖区', '2513', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2884', '灞桥区', '2514', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2885', '未央区', '2515', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2886', '雁塔区', '2516', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2887', '阎良区', '2517', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2888', '临潼区', '2518', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2889', '长安区', '2519', '2880', '2880', '2015-05-22 15:19:00', '', '3', '3', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2890', '蓝田县', '2520', '2880', '2879', '2015-05-22 15:19:00', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2891', '周至县', '2521', '2880', '2879', '2015-05-22 15:19:00', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2892', '户县', '2522', '2880', '2879', '2015-05-22 15:19:00', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2893', '高陵县', '2523', '2880', '2879', '2015-05-22 15:19:00', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2894', '铜川市', '289', '2879', '2879', '2015-05-22 15:19:01', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2895', '王益区', '2524', '2894', '2894', '2015-05-22 15:19:01', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2896', '印台区', '2525', '2894', '2894', '2015-05-22 15:19:01', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2897', '耀州区', '2526', '2894', '2894', '2015-05-22 15:19:01', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2898', '宜君县', '2527', '2894', '2879', '2015-05-22 15:19:01', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2899', '宝鸡市', '290', '2879', '2879', '2015-05-22 15:19:01', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2900', '渭滨区', '2528', '2899', '2899', '2015-05-22 15:19:01', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2901', '金台区', '2529', '2899', '2899', '2015-05-22 15:19:01', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('2902', '陈仓区', '2530', '2899', '2899', '2015-05-22 15:19:01', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('2903', '凤翔县', '2531', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2904', '岐山县', '2532', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2905', '扶风县', '2533', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2906', '眉县', '2534', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2907', '陇县', '2535', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2908', '千阳县', '2536', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2909', '麟游县', '2537', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2910', '凤县', '2538', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2911', '太白县', '2539', '2899', '2879', '2015-05-22 15:19:01', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2912', '咸阳市', '291', '2879', '2879', '2015-05-22 15:19:01', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2913', '秦都区', '2540', '2912', '2912', '2015-05-22 15:19:01', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2914', '杨凌区', '2541', '2912', '2912', '2015-05-22 15:19:01', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2915', '渭城区', '2542', '2912', '2912', '2015-05-22 15:19:01', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('2916', '三原县', '2543', '2912', '2879', '2015-05-22 15:19:01', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2917', '泾阳县', '2544', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2918', '乾县', '2545', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2919', '礼泉县', '2546', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2920', '永寿县', '2547', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2921', '彬县', '2548', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2922', '长武县', '2549', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2923', '旬邑县', '2550', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2924', '淳化县', '2551', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2925', '武功县', '2552', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2926', '兴平市', '2553', '2912', '2879', '2015-05-22 15:19:02', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2927', '渭南市', '292', '2879', '2879', '2015-05-22 15:19:02', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2928', '临渭区', '2554', '2927', '2927', '2015-05-22 15:19:02', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('2929', '华县', '2555', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2930', '潼关县', '2556', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('2931', '大荔县', '2557', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2932', '合阳县', '2558', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2933', '澄城县', '2559', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2934', '蒲城县', '2560', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2935', '白水县', '2561', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2936', '富平县', '2562', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2937', '韩城市', '2563', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2938', '华阴市', '2564', '2927', '2879', '2015-05-22 15:19:02', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2939', '延安市', '293', '2879', '2879', '2015-05-22 15:19:02', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2940', '宝塔区', '2565', '2939', '2939', '2015-05-22 15:19:03', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('2941', '延长县', '2566', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2942', '延川县', '2567', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2943', '子长县', '2568', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2944', '安塞县', '2569', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2945', '志丹县', '2570', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2946', '吴旗县', '2571', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2947', '甘泉县', '2572', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('2948', '富县', '2573', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2949', '洛川县', '2574', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2950', '宜川县', '2575', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2951', '黄龙县', '2576', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2952', '黄陵县', '2577', '2939', '2879', '2015-05-22 15:19:03', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2953', '汉中市', '294', '2879', '2879', '2015-05-22 15:19:03', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2954', '汉台区', '2578', '2953', '2953', '2015-05-22 15:19:03', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2955', '南郑县', '2579', '2953', '2879', '2015-05-22 15:19:03', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2956', '城固县', '2580', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('2957', '洋县', '2581', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2958', '西乡县', '2582', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2959', '勉县', '2583', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2960', '宁强县', '2584', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2961', '略阳县', '2585', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2962', '镇巴县', '2586', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2963', '留坝县', '2587', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2964', '佛坪县', '2588', '2953', '2879', '2015-05-22 15:19:04', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2965', '榆林市', '295', '2879', '2879', '2015-05-22 15:19:04', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2966', '榆阳区', '2589', '2965', '2965', '2015-05-22 15:19:04', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('2967', '神木县', '2590', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2968', '府谷县', '2591', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('2969', '横山县', '2592', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2970', '靖边县', '2593', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2971', '定边县', '2594', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2972', '绥德县', '2595', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2973', '米脂县', '2596', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('2974', '佳县', '2597', '2965', '2879', '2015-05-22 15:19:04', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('2975', '吴堡县', '2598', '2965', '2879', '2015-05-22 15:19:05', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('2976', '清涧县', '2599', '2965', '2879', '2015-05-22 15:19:05', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('2977', '子洲县', '2600', '2965', '2879', '2015-05-22 15:19:05', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2978', '安康市', '296', '2879', '2879', '2015-05-22 15:19:05', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('2979', '汉滨区', '2601', '2978', '2978', '2015-05-22 15:19:05', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('2980', '汉阴县', '2602', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('2981', '石泉县', '2603', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2982', '宁陕县', '2604', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('2983', '紫阳县', '2605', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2984', '岚皋县', '2606', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2985', '平利县', '2607', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('2986', '镇坪县', '2608', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2987', '旬阳县', '2609', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('2988', '白河县', '2610', '2978', '2879', '2015-05-22 15:19:05', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('2989', '商洛市', '297', '2879', '2879', '2015-05-22 15:19:05', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2990', '商州区', '2611', '2989', '2989', '2015-05-22 15:19:05', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('2991', '洛南县', '2612', '2989', '2879', '2015-05-22 15:19:05', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2992', '丹凤县', '2613', '2989', '2879', '2015-05-22 15:19:05', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('2993', '商南县', '2614', '2989', '2879', '2015-05-22 15:19:05', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2994', '山阳县', '2615', '2989', '2879', '2015-05-22 15:19:05', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('2995', '镇安县', '2616', '2989', '2879', '2015-05-22 15:19:05', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2996', '柞水县', '2617', '2989', '2879', '2015-05-22 15:19:05', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('2997', '甘肃', '28', null, null, '2015-05-22 15:19:05', '', '1', '1', 'G', '0');
INSERT INTO `lr_province` VALUES ('2998', '兰州市', '298', '2997', '2997', '2015-05-22 15:19:05', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('2999', '城关区', '2618', '2998', '2998', '2015-05-22 15:19:06', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('3000', '七里河区', '2619', '2998', '2998', '2015-05-22 15:19:06', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3001', '西固区', '2620', '2998', '2998', '2015-05-22 15:19:06', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('3002', '安宁区', '2621', '2998', '2998', '2015-05-22 15:19:06', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('3003', '红古区', '2622', '2998', '2998', '2015-05-22 15:19:06', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('3004', '永登县', '2623', '2998', '2997', '2015-05-22 15:19:06', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3005', '皋兰县', '2624', '2998', '2997', '2015-05-22 15:19:06', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3006', '榆中县', '2625', '2998', '2997', '2015-05-22 15:19:06', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3007', '嘉峪关市', '299', '2997', '2997', '2015-05-22 15:19:06', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3008', '金昌市', '300', '2997', '2997', '2015-05-22 15:19:06', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3009', '金川区', '2626', '3008', '3008', '2015-05-22 15:19:06', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('3010', '永昌县', '2627', '3008', '2997', '2015-05-22 15:19:06', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3011', '白银市', '301', '2997', '2997', '2015-05-22 15:19:06', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3012', '白银区', '2628', '3011', '3011', '2015-05-22 15:19:06', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('3013', '平川区', '2629', '3011', '3011', '2015-05-22 15:19:06', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('3014', '靖远县', '2630', '3011', '2997', '2015-05-22 15:19:06', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3015', '会宁县', '2631', '3011', '2997', '2015-05-22 15:19:06', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3016', '景泰县', '2632', '3011', '2997', '2015-05-22 15:19:06', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3017', '天水市', '302', '2997', '2997', '2015-05-22 15:19:06', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3018', '秦城区', '2633', '3017', '3017', '2015-05-22 15:19:06', '', '3', '3', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3019', '北道区', '2634', '3017', '3017', '2015-05-22 15:19:06', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('3020', '清水县', '2635', '3017', '2997', '2015-05-22 15:19:06', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3021', '秦安县', '2636', '3017', '2997', '2015-05-22 15:19:06', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3022', '甘谷县', '2637', '3017', '2997', '2015-05-22 15:19:06', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3023', '武山县', '2638', '3017', '2997', '2015-05-22 15:19:06', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3024', '张家川回族自治县', '2639', '3017', '2997', '2015-05-22 15:19:07', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3025', '武威市', '303', '2997', '2997', '2015-05-22 15:19:07', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3026', '凉州区', '2640', '3025', '3025', '2015-05-22 15:19:07', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('3027', '民勤县', '2641', '3025', '2997', '2015-05-22 15:19:07', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3028', '古浪县', '2642', '3025', '2997', '2015-05-22 15:19:07', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3029', '天祝藏族自治县', '2643', '3025', '2997', '2015-05-22 15:19:07', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3030', '张掖市', '304', '2997', '2997', '2015-05-22 15:19:07', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3031', '甘州区', '2644', '3030', '3030', '2015-05-22 15:19:07', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('3032', '肃南裕固族自治县', '2645', '3030', '2997', '2015-05-22 15:19:07', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3033', '民乐县', '2646', '3030', '2997', '2015-05-22 15:19:07', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3034', '临泽县', '2647', '3030', '2997', '2015-05-22 15:19:07', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3035', '高台县', '2648', '3030', '2997', '2015-05-22 15:19:07', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3036', '山丹县', '2649', '3030', '2997', '2015-05-22 15:19:07', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3037', '平凉市', '305', '2997', '2997', '2015-05-22 15:19:07', '', '2', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('3038', '崆峒区', '2650', '3037', '3037', '2015-05-22 15:19:07', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('3039', '泾川县', '2651', '3037', '2997', '2015-05-22 15:19:07', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3040', '灵台县', '2652', '3037', '2997', '2015-05-22 15:19:07', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3041', '崇信县', '2653', '3037', '2997', '2015-05-22 15:19:07', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('3042', '华亭县', '2654', '3037', '2997', '2015-05-22 15:19:07', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3043', '庄浪县', '2655', '3037', '2997', '2015-05-22 15:19:07', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3044', '静宁县', '2656', '3037', '2997', '2015-05-22 15:19:07', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3045', '酒泉市', '306', '2997', '2997', '2015-05-22 15:19:07', '', '2', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3046', '肃州区', '2657', '3045', '3045', '2015-05-22 15:19:07', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('3047', '金塔县', '2658', '3045', '2997', '2015-05-22 15:19:07', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3048', '安西县', '2659', '3045', '2997', '2015-05-22 15:19:07', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3049', '肃北蒙古族自治县', '2660', '3045', '2997', '2015-05-22 15:19:08', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3050', '阿克塞哈萨克族自治县', '2661', '3045', '2997', '2015-05-22 15:19:08', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3051', '玉门市', '2662', '3045', '2997', '2015-05-22 15:19:08', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3052', '敦煌市', '2663', '3045', '2997', '2015-05-22 15:19:08', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3053', '庆阳市', '307', '2997', '2997', '2015-05-22 15:19:08', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3054', '西峰区', '2664', '3053', '3053', '2015-05-22 15:19:08', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('3055', '庆城县', '2665', '3053', '2997', '2015-05-22 15:19:08', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3056', '环县', '2666', '3053', '2997', '2015-05-22 15:19:08', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3057', '华池县', '2667', '3053', '2997', '2015-05-22 15:19:08', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3058', '合水县', '2668', '3053', '2997', '2015-05-22 15:19:08', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3059', '正宁县', '2669', '3053', '2997', '2015-05-22 15:19:08', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3060', '宁县', '2670', '3053', '2997', '2015-05-22 15:19:08', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('3061', '镇原县', '2671', '3053', '2997', '2015-05-22 15:19:08', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3062', '定西市', '308', '2997', '2997', '2015-05-22 15:19:08', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3063', '安定区', '2672', '3062', '3062', '2015-05-22 15:19:08', '', '3', '3', 'A', '0');
INSERT INTO `lr_province` VALUES ('3064', '通渭县', '2673', '3062', '2997', '2015-05-22 15:19:08', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3065', '陇西县', '2674', '3062', '2997', '2015-05-22 15:19:08', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3066', '渭源县', '2675', '3062', '2997', '2015-05-22 15:19:08', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3067', '临洮县', '2676', '3062', '2997', '2015-05-22 15:19:08', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3068', '漳县', '2677', '3062', '2997', '2015-05-22 15:19:08', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3069', '岷县', '2678', '3062', '2997', '2015-05-22 15:19:08', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3070', '陇南市', '309', '2997', '2997', '2015-05-22 15:19:08', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3071', '武都区', '2679', '3070', '3070', '2015-05-22 15:19:08', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('3072', '成县', '2680', '3070', '2997', '2015-05-22 15:19:08', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('3073', '文县', '2681', '3070', '2997', '2015-05-22 15:19:08', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3074', '宕昌县', '2682', '3070', '2997', '2015-05-22 15:19:09', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3075', '康县', '2683', '3070', '2997', '2015-05-22 15:19:09', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3076', '西和县', '2684', '3070', '2997', '2015-05-22 15:19:09', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3077', '礼县', '2685', '3070', '2997', '2015-05-22 15:19:09', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3078', '徽县', '2686', '3070', '2997', '2015-05-22 15:19:09', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3079', '两当县', '2687', '3070', '2997', '2015-05-22 15:19:09', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3080', '临夏', '310', '2997', '2997', '2015-05-22 15:19:09', '', '2', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3081', '临夏市', '2688', '3080', '2997', '2015-05-22 15:19:09', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3082', '临夏县', '2689', '3080', '2997', '2015-05-22 15:19:09', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3083', '康乐县', '2690', '3080', '2997', '2015-05-22 15:19:09', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3084', '永靖县', '2691', '3080', '2997', '2015-05-22 15:19:10', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3085', '广河县', '2692', '3080', '2997', '2015-05-22 15:19:10', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3086', '和政县', '2693', '3080', '2997', '2015-05-22 15:19:10', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3087', '东乡族自治县', '2694', '3080', '2997', '2015-05-22 15:19:10', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3088', '积石山保安族东乡族撒拉族自治县', '2695', '3080', '2997', '2015-05-22 15:19:10', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3089', '甘南', '311', '2997', '2997', '2015-05-22 15:19:10', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3090', '合作市', '2696', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3091', '临潭县', '2697', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3092', '卓尼县', '2698', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3093', '舟曲县', '2699', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3094', '迭部县', '2700', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3095', '玛曲县', '2701', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3096', '碌曲县', '2702', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3097', '夏河县', '2703', '3089', '2997', '2015-05-22 15:19:10', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3098', '青海', '29', null, null, '2015-05-22 15:19:10', '', '1', '1', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3099', '西宁市', '312', '3098', '3098', '2015-05-22 15:19:10', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3100', '城东区', '2704', '3099', '3099', '2015-05-22 15:19:10', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('3101', '城中区', '2705', '3099', '3099', '2015-05-22 15:19:10', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('3102', '城西区', '2706', '3099', '3099', '2015-05-22 15:19:10', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('3103', '城北区', '2707', '3099', '3099', '2015-05-22 15:19:10', '', '3', '3', 'C', '0');
INSERT INTO `lr_province` VALUES ('3104', '大通回族土族自治县', '2708', '3099', '3098', '2015-05-22 15:19:10', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3105', '湟中县', '2709', '3099', '3098', '2015-05-22 15:19:10', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3106', '湟源县', '2710', '3099', '3098', '2015-05-22 15:19:10', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3107', '海东地区', '313', '3098', '3098', '2015-05-22 15:19:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3108', '平安县', '2711', '3107', '3098', '2015-05-22 15:19:11', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('3109', '民和回族土族自治县', '2712', '3107', '3098', '2015-05-22 15:19:11', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3110', '乐都县', '2713', '3107', '3098', '2015-05-22 15:19:11', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3111', '互助土族自治县', '2714', '3107', '3098', '2015-05-22 15:19:11', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3112', '化隆回族自治县', '2715', '3107', '3098', '2015-05-22 15:19:11', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3113', '循化撒拉族自治县', '2716', '3107', '3098', '2015-05-22 15:19:11', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3114', '海北', '314', '3098', '3098', '2015-05-22 15:19:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3115', '门源回族自治县', '2717', '3114', '3098', '2015-05-22 15:19:11', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3116', '祁连县', '2718', '3114', '3098', '2015-05-22 15:19:11', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3117', '海晏县', '2719', '3114', '3098', '2015-05-22 15:19:11', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3118', '刚察县', '2720', '3114', '3098', '2015-05-22 15:19:11', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3119', '黄南', '315', '3098', '3098', '2015-05-22 15:19:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3120', '同仁县', '2721', '3119', '3098', '2015-05-22 15:19:11', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3121', '尖扎县', '2722', '3119', '3098', '2015-05-22 15:19:11', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3122', '泽库县', '2723', '3119', '3098', '2015-05-22 15:19:11', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3123', '河南蒙古族自治县', '2724', '3119', '3098', '2015-05-22 15:19:11', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3124', '海南', '316', '3098', '3098', '2015-05-22 15:19:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3125', '共和县', '2725', '3124', '3098', '2015-05-22 15:19:11', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3126', '同德县', '2726', '3124', '3098', '2015-05-22 15:19:11', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3127', '贵德县', '2727', '3124', '3098', '2015-05-22 15:19:11', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3128', '兴海县', '2728', '3124', '3098', '2015-05-22 15:19:11', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3129', '贵南县', '2729', '3124', '3098', '2015-05-22 15:19:11', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3130', '果洛', '317', '3098', '3098', '2015-05-22 15:19:12', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3131', '玛沁县', '2730', '3130', '3098', '2015-05-22 15:19:12', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3132', '班玛县', '2731', '3130', '3098', '2015-05-22 15:19:12', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3133', '甘德县', '2732', '3130', '3098', '2015-05-22 15:19:12', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3134', '达日县', '2733', '3130', '3098', '2015-05-22 15:19:12', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3135', '久治县', '2734', '3130', '3098', '2015-05-22 15:19:12', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3136', '玛多县', '2735', '3130', '3098', '2015-05-22 15:19:12', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3137', '玉树', '318', '3098', '3098', '2015-05-22 15:19:12', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3138', '玉树县', '2736', '3137', '3098', '2015-05-22 15:19:12', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3139', '杂多县', '2737', '3137', '3098', '2015-05-22 15:19:12', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3140', '称多县', '2738', '3137', '3098', '2015-05-22 15:19:12', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('3141', '治多县', '2739', '3137', '3098', '2015-05-22 15:19:12', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3142', '囊谦县', '2740', '3137', '3098', '2015-05-22 15:19:12', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('3143', '曲麻莱县', '2741', '3137', '3098', '2015-05-22 15:19:12', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3144', '海西', '319', '3098', '3098', '2015-05-22 15:19:12', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3145', '格尔木市', '2742', '3144', '3098', '2015-05-22 15:19:12', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3146', '德令哈市', '2743', '3144', '3098', '2015-05-22 15:19:12', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3147', '乌兰县', '2744', '3144', '3098', '2015-05-22 15:19:12', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3148', '都兰县', '2745', '3144', '3098', '2015-05-22 15:19:12', '', '3', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3149', '天峻县', '2746', '3144', '3098', '2015-05-22 15:19:12', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3150', '宁夏', '30', null, null, '2015-05-22 15:19:12', '', '1', '1', 'N', '0');
INSERT INTO `lr_province` VALUES ('3151', '银川市', '320', '3150', '3150', '2015-05-22 15:19:12', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3152', '兴庆区', '2747', '3151', '3151', '2015-05-22 15:19:12', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('3153', '西夏区', '2748', '3151', '3151', '2015-05-22 15:19:12', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('3154', '金凤区', '2749', '3151', '3151', '2015-05-22 15:19:12', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('3155', '永宁县', '2750', '3151', '3150', '2015-05-22 15:19:13', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3156', '贺兰县', '2751', '3151', '3150', '2015-05-22 15:19:13', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3157', '灵武市', '2752', '3151', '3150', '2015-05-22 15:19:13', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3158', '石嘴山市', '321', '3150', '3150', '2015-05-22 15:19:13', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3159', '大武口区', '2753', '3158', '3158', '2015-05-22 15:19:13', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('3160', '惠农区', '2754', '3158', '3158', '2015-05-22 15:19:13', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('3161', '平罗县', '2755', '3158', '3150', '2015-05-22 15:19:13', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('3162', '吴忠市', '322', '3150', '3150', '2015-05-22 15:19:13', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3163', '利通区', '2756', '3162', '3162', '2015-05-22 15:19:13', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('3164', '盐池县', '2757', '3162', '3150', '2015-05-22 15:19:13', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3165', '同心县', '2758', '3162', '3150', '2015-05-22 15:19:13', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3166', '青铜峡市', '2759', '3162', '3150', '2015-05-22 15:19:13', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3167', '固原市', '323', '3150', '3150', '2015-05-22 15:19:13', '', '2', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3168', '原州区', '2760', '3167', '3167', '2015-05-22 15:19:13', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3169', '西吉县', '2761', '3167', '3150', '2015-05-22 15:19:13', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3170', '隆德县', '2762', '3167', '3150', '2015-05-22 15:19:13', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3171', '泾源县', '2763', '3167', '3150', '2015-05-22 15:19:13', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3172', '彭阳县', '2764', '3167', '3150', '2015-05-22 15:19:13', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('3173', '中卫市', '324', '3150', '3150', '2015-05-22 15:19:13', '', '2', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3174', '沙坡头区', '2765', '3173', '3173', '2015-05-22 15:19:13', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('3175', '中宁县', '2766', '3173', '3150', '2015-05-22 15:19:13', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3176', '海原县', '2767', '3173', '3150', '2015-05-22 15:19:13', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3177', '新疆', '31', null, null, '2015-05-22 15:19:13', '', '1', '1', 'X', '0');
INSERT INTO `lr_province` VALUES ('3178', '乌鲁木齐市', '325', '3177', '3177', '2015-05-22 15:19:13', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3179', '天山区', '2768', '3178', '3178', '2015-05-22 15:19:13', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('3180', '沙依巴克区', '2769', '3178', '3178', '2015-05-22 15:19:14', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('3181', '新市区', '2770', '3178', '3178', '2015-05-22 15:19:14', '', '3', '3', 'X', '0');
INSERT INTO `lr_province` VALUES ('3182', '水磨沟区', '2771', '3178', '3178', '2015-05-22 15:19:14', '', '3', '3', 'S', '0');
INSERT INTO `lr_province` VALUES ('3183', '头屯河区', '2772', '3178', '3178', '2015-05-22 15:19:14', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('3184', '达坂城区', '2773', '3178', '3178', '2015-05-22 15:19:14', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('3185', '东山区', '2774', '3178', '3178', '2015-05-22 15:19:14', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('3186', '乌鲁木齐县', '2775', '3178', '3177', '2015-05-22 15:19:14', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3187', '克拉玛依市', '326', '3177', '3177', '2015-05-22 15:19:14', '', '2', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3188', '独山子区', '2776', '3187', '3187', '2015-05-22 15:19:14', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('3189', '克拉玛依区', '2777', '3187', '3187', '2015-05-22 15:19:14', '', '3', '3', 'K', '0');
INSERT INTO `lr_province` VALUES ('3190', '白碱滩区', '2778', '3187', '3187', '2015-05-22 15:19:14', '', '3', '3', 'B', '0');
INSERT INTO `lr_province` VALUES ('3191', '乌尔禾区', '2779', '3187', '3187', '2015-05-22 15:19:14', '', '3', '3', 'W', '0');
INSERT INTO `lr_province` VALUES ('3192', '吐鲁番地区', '327', '3177', '3177', '2015-05-22 15:19:14', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3193', '吐鲁番市', '2780', '3192', '3177', '2015-05-22 15:19:14', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3194', '鄯善县', '2781', '3192', '3177', '2015-05-22 15:19:14', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3195', '托克逊县', '2782', '3192', '3177', '2015-05-22 15:19:14', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3196', '哈密地区', '328', '3177', '3177', '2015-05-22 15:19:14', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3197', '哈密市', '2783', '3196', '3177', '2015-05-22 15:19:14', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3198', '巴里坤哈萨克自治县', '2784', '3196', '3177', '2015-05-22 15:19:14', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3199', '伊吾县', '2785', '3196', '3177', '2015-05-22 15:19:14', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3200', '昌吉', '329', '3177', '3177', '2015-05-22 15:19:14', '', '2', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('3201', '昌吉市', '2786', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('3202', '阜康市', '2787', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('3203', '米泉市', '2788', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3204', '呼图壁县', '2789', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3205', '玛纳斯县', '2790', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3206', '奇台县', '2791', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3207', '吉木萨尔县', '2792', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3208', '木垒哈萨克自治县', '2793', '3200', '3177', '2015-05-22 15:19:15', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3209', '博尔塔拉', '330', '3177', '3177', '2015-05-22 15:19:15', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3210', '博乐市', '2794', '3209', '3177', '2015-05-22 15:19:15', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3211', '精河县', '2795', '3209', '3177', '2015-05-22 15:19:15', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3212', '温泉县', '2796', '3209', '3177', '2015-05-22 15:19:15', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3213', '巴音郭楞', '331', '3177', '3177', '2015-05-22 15:19:15', '', '2', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3214', '库尔勒市', '2797', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3215', '轮台县', '2798', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3216', '尉犁县', '2799', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3217', '若羌县', '2800', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'R', '0');
INSERT INTO `lr_province` VALUES ('3218', '且末县', '2801', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3219', '焉耆回族自治县', '2802', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3220', '和静县', '2803', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3221', '和硕县', '2804', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3222', '博湖县', '2805', '3213', '3177', '2015-05-22 15:19:15', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3223', '阿克苏地区', '332', '3177', '3177', '2015-05-22 15:19:16', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3224', '阿克苏市', '2806', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3225', '温宿县', '2807', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3226', '库车县', '2808', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3227', '沙雅县', '2809', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3228', '新和县', '2810', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3229', '拜城县', '2811', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3230', '乌什县', '2812', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3231', '阿瓦提县', '2813', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3232', '柯坪县', '2814', '3223', '3177', '2015-05-22 15:19:16', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3233', '克孜勒苏柯尔克孜', '333', '3177', '3177', '2015-05-22 15:19:16', '', '2', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3234', '阿图什市', '2815', '3233', '3177', '2015-05-22 15:19:16', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3235', '阿克陶县', '2816', '3233', '3177', '2015-05-22 15:19:16', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3236', '阿合奇县', '2817', '3233', '3177', '2015-05-22 15:19:16', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3237', '乌恰县', '2818', '3233', '3177', '2015-05-22 15:19:16', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3238', '喀什地区', '334', '3177', '3177', '2015-05-22 15:19:16', '', '2', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3239', '喀什市', '2819', '3238', '3177', '2015-05-22 15:19:16', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3240', '疏附县', '2820', '3238', '3177', '2015-05-22 15:19:16', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3241', '疏勒县', '2821', '3238', '3177', '2015-05-22 15:19:16', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3242', '英吉沙县', '2822', '3238', '3177', '2015-05-22 15:19:16', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3243', '泽普县', '2823', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3244', '莎车县', '2824', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3245', '叶城县', '2825', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3246', '麦盖提县', '2826', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3247', '岳普湖县', '2827', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3248', '伽师县', '2828', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3249', '巴楚县', '2829', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3250', '塔什库尔干塔吉克自治县', '2830', '3238', '3177', '2015-05-22 15:19:17', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3251', '和田地区', '335', '3177', '3177', '2015-05-22 15:19:17', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3252', '和田市', '2831', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3253', '和田县', '2832', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3254', '墨玉县', '2833', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3255', '皮山县', '2834', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'P', '0');
INSERT INTO `lr_province` VALUES ('3256', '洛浦县', '2835', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'L', '0');
INSERT INTO `lr_province` VALUES ('3257', '策勒县', '2836', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('3258', '于田县', '2837', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3259', '民丰县', '2838', '3251', '3177', '2015-05-22 15:19:17', '', '3', '2', 'M', '0');
INSERT INTO `lr_province` VALUES ('3260', '伊犁哈萨克', '336', '3177', '3177', '2015-05-22 15:19:18', '', '2', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3261', '伊宁市', '2839', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3262', '奎屯市', '2840', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'K', '0');
INSERT INTO `lr_province` VALUES ('3263', '伊宁县', '2841', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3264', '察布查尔锡伯自治县', '2842', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'C', '0');
INSERT INTO `lr_province` VALUES ('3265', '霍城县', '2843', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3266', '巩留县', '2844', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'G', '0');
INSERT INTO `lr_province` VALUES ('3267', '新源县', '2845', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3268', '昭苏县', '2846', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'Z', '0');
INSERT INTO `lr_province` VALUES ('3269', '特克斯县', '2847', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3270', '尼勒克县', '2848', '3260', '3177', '2015-05-22 15:19:18', '', '3', '2', 'N', '0');
INSERT INTO `lr_province` VALUES ('3271', '塔城地区', '337', '3177', '3177', '2015-05-22 15:19:18', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3272', '塔城市', '2849', '3271', '3177', '2015-05-22 15:19:18', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3273', '乌苏市', '2850', '3271', '3177', '2015-05-22 15:19:18', '', '3', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3274', '额敏县', '2851', '3271', '3177', '2015-05-22 15:19:18', '', '3', '2', 'E', '0');
INSERT INTO `lr_province` VALUES ('3275', '沙湾县', '2852', '3271', '3177', '2015-05-22 15:19:18', '', '3', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3276', '托里县', '2853', '3271', '3177', '2015-05-22 15:19:18', '', '3', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3277', '裕民县', '2854', '3271', '3177', '2015-05-22 15:19:18', '', '3', '2', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3278', '和布克赛尔蒙古自治县', '2855', '3271', '3177', '2015-05-22 15:19:18', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3279', '阿勒泰地区', '338', '3177', '3177', '2015-05-22 15:19:18', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3280', '阿勒泰市', '2856', '3279', '3177', '2015-05-22 15:19:18', '', '3', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3281', '布尔津县', '2857', '3279', '3177', '2015-05-22 15:19:18', '', '3', '2', 'B', '0');
INSERT INTO `lr_province` VALUES ('3282', '富蕴县', '2858', '3279', '3177', '2015-05-22 15:19:19', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('3283', '福海县', '2859', '3279', '3177', '2015-05-22 15:19:19', '', '3', '2', 'F', '0');
INSERT INTO `lr_province` VALUES ('3284', '哈巴河县', '2860', '3279', '3177', '2015-05-22 15:19:19', '', '3', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3285', '青河县', '2861', '3279', '3177', '2015-05-22 15:19:19', '', '3', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3286', '吉木乃县', '2862', '3279', '3177', '2015-05-22 15:19:19', '', '3', '2', 'J', '0');
INSERT INTO `lr_province` VALUES ('3287', '石河子市', '339', '3177', '3177', '2015-05-22 15:19:19', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3288', '阿拉尔市', '340', '3177', '3177', '2015-05-22 15:19:19', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3289', '图木舒克市', '341', '3177', '3177', '2015-05-22 15:19:19', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3290', '五家渠市', '342', '3177', '3177', '2015-05-22 15:19:19', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3291', '香港', '32', null, null, '2015-05-22 15:19:19', '', '1', '1', 'X', '0');
INSERT INTO `lr_province` VALUES ('3292', '香港', '343', '3291', '3291', '2015-05-22 15:19:19', '', '2', '2', 'X', '0');
INSERT INTO `lr_province` VALUES ('3293', '澳门', '33', null, null, '2015-05-22 15:19:19', '', '1', '1', 'A', '0');
INSERT INTO `lr_province` VALUES ('3294', '澳门', '344', '3293', '3293', '2015-05-22 15:19:19', '', '2', '2', 'A', '0');
INSERT INTO `lr_province` VALUES ('3295', '台湾', '34', null, null, '2015-05-22 15:19:19', '', '1', '1', 'T', '0');
INSERT INTO `lr_province` VALUES ('3296', '台湾', '345', '3295', '3295', '2015-05-22 15:19:19', '', '2', '2', 'T', '0');
INSERT INTO `lr_province` VALUES ('3297', '光明新区', null, '1984', '1984', '2015-09-21 18:24:00', '', '3', '3', 'G', '0');
INSERT INTO `lr_province` VALUES ('3298', '龙华新区', null, '1984', '1984', '2015-09-21 18:24:00', '', '3', '3', 'L', '0');
INSERT INTO `lr_province` VALUES ('3299', '坪山新区', null, '1984', '1984', '2015-09-21 18:24:00', '', '3', '3', 'P', '0');
INSERT INTO `lr_province` VALUES ('3300', '大鹏新区', null, '1984', '1984', '2015-09-21 18:24:00', '', '3', '3', 'D', '0');
INSERT INTO `lr_province` VALUES ('3301', '弋江区', null, '1053', '1053', '2015-11-03 14:12:09', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3302', '万宁市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3303', '东方市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3304', '五指山市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3305', '文昌市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'W', '0');
INSERT INTO `lr_province` VALUES ('3306', '琼海市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'Q', '0');
INSERT INTO `lr_province` VALUES ('3307', '三沙市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'S', '0');
INSERT INTO `lr_province` VALUES ('3308', '海南县级市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3309', '儋州市', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'D', '0');
INSERT INTO `lr_province` VALUES ('3310', '海南省管县', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3311', '海南自治县', null, '2283', '2283', '2015-11-05 21:00:11', '', '2', '2', 'H', '0');
INSERT INTO `lr_province` VALUES ('3312', '崖州区', null, '2289', '2289', '2015-11-05 21:00:11', '', '3', '3', 'Y', '0');
INSERT INTO `lr_province` VALUES ('3313', '天涯区', null, '2289', '2289', '2015-11-05 21:00:11', '', '3', '3', 'T', '0');
INSERT INTO `lr_province` VALUES ('3314', '吉阳区', null, '2289', '2289', '2015-11-05 21:00:11', '', '3', '3', 'J', '0');
INSERT INTO `lr_province` VALUES ('3315', '海棠区', null, '2289', '2289', '2015-11-05 21:00:11', '', '3', '3', 'H', '0');
INSERT INTO `lr_province` VALUES ('3316', '海淀区', '8', '2', '2', '2015-05-22 15:17:18', '', '3', '3', 'H', '0');

-- ----------------------------
-- Table structure for `lr_sccat`
-- ----------------------------
DROP TABLE IF EXISTS `lr_sccat`;
CREATE TABLE `lr_sccat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品品牌表',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `shop_id` int(11) unsigned DEFAULT '0' COMMENT '店铺id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_sccat
-- ----------------------------
INSERT INTO `lr_sccat` VALUES ('1', '美容院', '1494241343', '0');
INSERT INTO `lr_sccat` VALUES ('2', '养生馆', '1494241358', '0');

-- ----------------------------
-- Table structure for `lr_search_record`
-- ----------------------------
DROP TABLE IF EXISTS `lr_search_record`;
CREATE TABLE `lr_search_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '搜索记录表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `keyword` varchar(255) NOT NULL COMMENT '搜索内容',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '搜索次数',
  `addtime` int(11) DEFAULT '0' COMMENT '搜索时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_search_record
-- ----------------------------
INSERT INTO `lr_search_record` VALUES ('1', '1', '产品', '26', '1494054770');
INSERT INTO `lr_search_record` VALUES ('2', '2', '产品', '1', '1494057770');
INSERT INTO `lr_search_record` VALUES ('3', '5', '模拟', '6', '1494054970');
INSERT INTO `lr_search_record` VALUES ('4', '3', 'spa产品', '3', '1494059970');
INSERT INTO `lr_search_record` VALUES ('5', '4', '模拟', '1', '1494057970');
INSERT INTO `lr_search_record` VALUES ('6', '5', 'spa产品', '1', '1494064970');
INSERT INTO `lr_search_record` VALUES ('7', '6', 'coco', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('8', '7', '小孩子', '2', '1494054970');
INSERT INTO `lr_search_record` VALUES ('9', '8', '婴儿用品', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('10', '9', '婴儿用品', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('11', '10', '汽车', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('12', '9', '汽车', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('13', '1', '饼干', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('14', '12', '为什么', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('15', '13', '好的', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('16', '14', '玩具', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('17', '15', '好玩的', '1', '1494054970');
INSERT INTO `lr_search_record` VALUES ('18', '1', 'spa产品', '2', '1494555638');
INSERT INTO `lr_search_record` VALUES ('19', '1', '狗粮', '2', '1495781789');

-- ----------------------------
-- Table structure for `lr_shangchang`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shangchang`;
CREATE TABLE `lr_shangchang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0' COMMENT '店铺类别id',
  `name` varchar(20) NOT NULL COMMENT '店铺名称',
  `uname` varchar(10) NOT NULL COMMENT '负责人名称',
  `logo` varchar(100) DEFAULT NULL COMMENT '店铺LOGO',
  `vip_char` varchar(100) DEFAULT NULL COMMENT '店铺公告、广告图',
  `sheng` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `city` int(11) DEFAULT '0' COMMENT '市id',
  `quyu` int(11) DEFAULT '0' COMMENT '区域id',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `address_xq` varchar(255) DEFAULT NULL COMMENT '省市区+地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `location_x` varchar(20) NOT NULL DEFAULT '0' COMMENT '纬度',
  `location_y` varchar(20) NOT NULL DEFAULT '0' COMMENT '经度',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新日期',
  `content` text COMMENT '店铺介绍',
  `intro` varchar(200) DEFAULT NULL COMMENT '店铺广告语',
  `grade` int(2) NOT NULL DEFAULT '10' COMMENT '评分等级1~10',
  `tel` char(15) DEFAULT NULL COMMENT '联系电话',
  `utel` char(15) DEFAULT NULL COMMENT '负责人手机',
  `status` tinyint(2) DEFAULT '1' COMMENT '显示/隐藏',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `wx_appid` varchar(32) DEFAULT NULL COMMENT 'APPID',
  `wx_mch_id` varchar(32) DEFAULT NULL COMMENT '微信支付商户号',
  `wx_key` varchar(100) DEFAULT NULL COMMENT 'API密钥',
  `wx_secret` varchar(64) DEFAULT NULL COMMENT 'AppSecret是APPID对应的接口密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shangchang
-- ----------------------------
INSERT INTO `lr_shangchang` VALUES ('9', '1', '北京大帝都高级旗舰店', '串串香', 'UploadFiles/shop/logo/20170508/1494227348768908.jpg', 'UploadFiles/shop/20170508/1494227348490053.jpg', '1', '2', '3', '天安门广场附近王府井知道吗', '北京 北京 东城区 天安门广场附近王府井知道吗', '496', '116.417491', '39.924232', '1466825048', '1494227348', '<p><span style=\"font-size:18px;\">北京大帝都高级旗舰店</span></p><p><span style=\"font-size:12px;\">大帝都 就是飞讯呢</span><br /></p>', '大帝都 就是飞讯呢', '10', '13926154675', '13926154675', '1', '0', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('35', '2', 'CBD阿里斯门迪品牌店', '牛德福', 'UploadFiles/shop/logo/20170508/1494229934647258.jpg', 'UploadFiles/shop/20170508/1494230002408295.jpg', '2151', '2152', '2161', '什么路什么街什么商业中心附近', '广东省 广州市 花都区 什么路什么街什么商业中心附近', '400', '113.168356', '23.382594', '1467969795', '1494230002', '<span style=\"font-size:18px;\">CBD阿里斯门迪品牌店</span>', '什么品牌好 什么好品牌', '10', '13311112334', '13311112334', '1', '1', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('36', '1', '广州国际贸易进出口', 'nick张', 'UploadFiles/shop/logo/20170508/1494229710369534.jpg', 'UploadFiles/shop/20170508/1494230066358172.jpg', '2151', '2152', '2157', 'CBD国际金融中心大楼', '广东省 广州市 天河区 CBD国际金融中心大楼', '100', '113.327464', '23.137898', '1468026641', '1494230066', '<span style=\"font-size:18px;\">广州国际贸易进出口</span>', '国际品牌 你要的这里有', '10', '02044556678', '13928712222', '1', '0', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('39', '2', 'GGN乖乖女自营产品专营店', '曹先生', 'UploadFiles/shop/logo/20170508/1494229020632699.jpg', 'UploadFiles/shop/20170508/1494229020424246.png', '2151', '2152', '2159', '黄埔公园附近', '广东省 广州市 黄埔区 黄埔公园附近', '500', '113.456676', '23.104064', '1468217700', '1494229020', '<p><span style=\"font-size:18px;\">GGN乖乖女自营产品专营店</span></p><p><span style=\"font-size:18px;\"><br /></span></p>', '阿斯顿撒通过 健康不好', '10', '02022221145', '13654547676', '1', '1', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('45', '1', 'CBG藏宝阁搜索专营店', '白先生', 'UploadFiles/shop/logo/20170508/1494227020306856.jpg', 'UploadFiles/shop/20170508/1494227020836280.jpg', '2151', '2152', '2158', '你看着办白云山附近', '广东省 广州市 白云区 你看着办白云山附近', '48', '113.304324', '23.186209', '1472105436', '1494227020', '<p><span style=\"font-size:18px;\">CBG藏宝阁搜索专营店</span></p><p><span style=\"font-size:18px;\"><br /></span></p>', '呵呵呵呵呵 哈哈哈哈哈', '10', '02084796015', '13455568787', '1', '1', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('46', '2', 'KKBS维护卡斯马专营店', 'mini先生', 'UploadFiles/shop/logo/20170508/1494225499674202.jpg', 'UploadFiles/shop/20170508/1494225499169062.jpg', '2151', '2207', '2209', '东方广场还发广播站A区喽', '广东省 江门市 蓬江区 东方广场还发广播站A区喽', '150', '113.080682', '22.592643', '1473057266', '1494225499', '<p><span style=\"font-size:18px;\">东方广场还发广播站A区喽</span></p><p>曾经的曾经 现在的现在曾经的曾经 现在的现在曾经的曾经 现在的现在曾经的曾经 现在的现在<br /></p><p style=\"margin: 0px; padding: 0px;\"></p>', '曾经的曾经 现在的现在', '10', '13532323545', '13532323545', '1', '1', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('47', '1', 'KO打卡机阿斯顿旗舰店', '爱尚先生', 'UploadFiles/shop/logo/20170508/1494225236944805.jpg', 'UploadFiles/shop/20170508/1494225236615782.jpg', '2151', '2166', '2168', '步步高高对面街道cc', '广东省 韶关市 武江区 步步高高对面街道cc', '650', '113.601555', '24.826763', '1473842739', '1494225236', '&nbsp;易岛通（海南）旅游科技有限公司是一家旅游度假、养生休闲综合服务平台，总部位于海南的省会城市海口。<br />易岛通度假项目依托海南独特的地理区位、自然环境、天然资源等优势，建设丰富而又舒适的多元化度假场所，同时将海南岛纯天然的优质产品配套推出，开创全新的吃住玩一体化服务的“自助餐式”度假新体验。易岛通度假综合服务平台将通过大数据、云技术、物联网及各种领先的移动网络信息技术，全方位打造和提供线上线下预定、购买、交流、互动、互助服务模式，并将服务推向广大社区的千家万户。<br />&nbsp;<br />老人收住类型：生活自理<br />老人入住指南：三亚，乐东，琼海，琼中，文昌，五指山，万宁，儋州<br />房型：单人间、双人间、公寓<br />床位数：20000<br />收费标准： 999（七天） 9999（63天） 59800（2460天）<br />特色服务：接送服务，活动服务，棋牌室、麻将室、舞蹈室、排练厅、音像制作室<br />医疗护理（如果您机构可以提供）：基地有医疗人员<br /><p>保险：购买人身安全保险</p><p><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141646386637.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141646512845.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141646573553.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141647068364.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648064119.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648123339.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648189118.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648265046.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648311531.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648384419.jpg\" alt=\"\" /><img src=\"http://lscy5.caeac.com.cn/app/62/3057c1502ae5a4d514baec129f72948c266e/UploadFiles/day_160914/201609141648546246.jpg\" alt=\"\" /><br /></p>', '高高兴兴玩 开开心心买', '10', '13232454675', '13232454675', '1', '0', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('48', '2', 'MNMX模拟梦想直营店', '小先生', 'UploadFiles/shop/logo/20170508/1494215970977911.jpg', 'UploadFiles/shop/20170508/1494215970509487.jpg', '2151', '2152', '2157', '一片汪洋大海附近地址', '广东省 广州市 天河区 一片汪洋大海附近地址', '650', '113.344855', '23.125336', '1476168943', '1494231948', '<p><span style=\"font-family:Microsoft YaHei;font-size:18px;\">MNMX模拟梦想直营店&nbsp;</span></p><p><span style=\"font-size:12px;\">玩玩玩玩玩 买买买买买</span><br /></p>', '玩玩玩玩玩 买买买买买', '10', '13866544322', '13866544322', '1', '1', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('49', '1', 'SCC部分对方官方旗舰店', 'Mr . xiao', 'UploadFiles/shop/logo/20170508/1494215671720469.jpg', 'UploadFiles/shop/20170508/1494215671616059.jpg', '2151', '2152', '2160', '南村', '广东省 广州市 番禺区 南村', '200', '113.385674', '23.007963', '1477293664', '1494215671', 'SCC部分对方官方旗舰店', '吃吃吃吃吃 呜呜呜呜网', '10', '13755446677', '13755446677', '1', '0', '', null, null, null, null);
INSERT INTO `lr_shangchang` VALUES ('50', '2', 'ZHXZ最好选择我的店', '测试先生', 'UploadFiles/shop/logo/20170428/1493347023276929.jpg', 'UploadFiles/shop/20170428/1493347024426958.png', '2151', '2152', '2157', '好的味道好的街道好的号', '广东省 广州市 天河区 好的味道好的街道好的号', '88', '113.380159', '22.998499', '1493346749', '1494230955', '<span style=\"font-size:18px;\"><strong>ZHXZ最好选择我的店</strong></span>', '给自己一个惊喜，给世界一个惊喜', '10', '13812423423', '13412423423', '1', '0', '34536465', null, null, null, null);

-- ----------------------------
-- Table structure for `lr_shangchang_dp`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shangchang_dp`;
CREATE TABLE `lr_shangchang_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺收藏表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '评分数',
  `concent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `addtime` int(11) DEFAULT NULL,
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shangchang_dp
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_shangchang_sc`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shangchang_sc`;
CREATE TABLE `lr_shangchang_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员店铺收藏记录表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '收藏状态 1收藏 0删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shangchang_sc
-- ----------------------------
INSERT INTO `lr_shangchang_sc` VALUES ('1', '47', '5', '1');

-- ----------------------------
-- Table structure for `lr_shopping_char`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shopping_char`;
CREATE TABLE `lr_shopping_char` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `pid` int(11) NOT NULL COMMENT '商品ID',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `buff` varchar(255) NOT NULL COMMENT '属性（序列化格式）',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `gid` int(11) DEFAULT '0' COMMENT '规格id',
  `type` tinyint(2) DEFAULT '2' COMMENT '0是热卖，1是团购，2是普通商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shopping_char
-- ----------------------------
INSERT INTO `lr_shopping_char` VALUES ('1', '269', '235.00', '1', '', '1495779452', '3', '0', '0', '1');

-- ----------------------------
-- Table structure for `lr_shop_type`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shop_type`;
CREATE TABLE `lr_shop_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商城类型表',
  `shop_name` varchar(255) DEFAULT NULL COMMENT '商城名称',
  `one_into` int(11) DEFAULT NULL COMMENT '黄金分成',
  `two_into` int(11) DEFAULT NULL COMMENT '白金分成',
  `three_into` int(11) DEFAULT NULL,
  `daili_into` int(11) DEFAULT NULL COMMENT '代理分成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_shop_type
-- ----------------------------
INSERT INTO `lr_shop_type` VALUES ('1', '普通商城', '30', '20', '10', '6');
INSERT INTO `lr_shop_type` VALUES ('2', '黄金商城', '30', '20', '11', '5');
INSERT INTO `lr_shop_type` VALUES ('3', '白金商城', '30', '20', '10', '5');
INSERT INTO `lr_shop_type` VALUES ('4', '钻石商城', '30', '20', '10', '5');
INSERT INTO `lr_shop_type` VALUES ('5', '积分商城', '30', '20', '10', '5');

-- ----------------------------
-- Table structure for `lr_student_style`
-- ----------------------------
DROP TABLE IF EXISTS `lr_student_style`;
CREATE TABLE `lr_student_style` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '学员风采表',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `author` varchar(20) DEFAULT NULL,
  `source` varchar(30) DEFAULT NULL COMMENT '来源',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `content` text COMMENT '内容',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `del` tinyint(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_student_style
-- ----------------------------
INSERT INTO `lr_student_style` VALUES ('1', '第1期学员风采', 'UploadFiles/stustyle/20170523/1495533692924817.jpg', 'Andy', '雷米高', '72', '&lt;h2 align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/h2&gt;&lt;h2 align=&quot;center&quot;&gt;第1期学员风采&lt;/h2&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170523/201705231801236065.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;', '1495533693', '0');
INSERT INTO `lr_student_style` VALUES ('2', '第2期学员风采', 'UploadFiles/stustyle/20170524/1495619154855026.jpg', 'Andy', '雷米高', '67', '&lt;h2 align=&quot;center&quot;&gt;第2期学员风采&lt;/h2&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170524/201705241745091534.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;center&quot;&gt;&lt;br /&gt;&lt;/p&gt;', '1495619154', '0');
INSERT INTO `lr_student_style` VALUES ('3', '第3期学员风采', 'UploadFiles/stustyle/20170524/1495619351424870.jpg', 'Andy', '雷米高', '75', '&lt;h2 align=&quot;center&quot;&gt;第3期学员风采&lt;/h2&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170524/201705241749008780.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/p&gt;', '1495619351', '0');
INSERT INTO `lr_student_style` VALUES ('4', '第6期学员风采', 'UploadFiles/stustyle/20170525/1495691588447374.jpg', 'Andy', '雷米高', '49', '&lt;p&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;第3期学员风采&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251352457412.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;', '1495691588', '0');
INSERT INTO `lr_student_style` VALUES ('5', '第9期学员风采', 'UploadFiles/stustyle/20170525/1495700324168784.jpg', 'Andy', '雷米高', '76', '&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251614146792.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251614255325.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251615297312.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251615407510.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616078084.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616183453.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616273434.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616367894.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616475560.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251616583862.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251617349097.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251617449800.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251617599171.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251618083181.jpg&quot; alt=&quot;&quot; align=&quot;middle&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '1495700324', '0');

-- ----------------------------
-- Table structure for `lr_user`
-- ----------------------------
DROP TABLE IF EXISTS `lr_user`;
CREATE TABLE `lr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表：包括后台管理员、商家会员和普通会员',
  `name` varchar(20) NOT NULL COMMENT '登陆账号',
  `uname` varchar(10) DEFAULT NULL COMMENT '昵称',
  `pwd` varchar(50) NOT NULL COMMENT 'MD5密码',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `jifen` float(11,0) DEFAULT '0' COMMENT '积分',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `tel` char(15) DEFAULT NULL COMMENT '手机',
  `qq_id` varchar(20) NOT NULL COMMENT 'qq',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `openid` varchar(50) NOT NULL COMMENT '授权ID',
  `source` varchar(10) NOT NULL COMMENT '第三方平台(微信，QQ)',
  `level_id` int(11) DEFAULT '0' COMMENT '等级 0为普通会员 1为白银会员  2为黄金会员  3为钻石会员',
  `is_daili` int(11) DEFAULT '1' COMMENT '是否为代理  1为普通会员 2为代理  3为待审核',
  `daili_maid` int(11) DEFAULT NULL COMMENT '代理分成',
  `daili_type` int(11) DEFAULT NULL COMMENT '代理类型 1为省代  2为市代 3为区代',
  `state` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `area` varchar(255) DEFAULT NULL COMMENT '区',
  `store_location` varchar(255) NOT NULL COMMENT '门店具体位置',
  `save_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `top_id` int(11) DEFAULT NULL COMMENT '上级id',
  `week_commission` double(11,2) DEFAULT NULL COMMENT '周佣金',
  `can_withdraw` double(11,2) DEFAULT NULL COMMENT '可提现',
  `total` double(11,2) DEFAULT NULL COMMENT '总佣金',
  `total_money` double(11,2) DEFAULT NULL COMMENT '总消费',
  `introduce` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `postal_address` varchar(255) DEFAULT NULL COMMENT '通讯地址',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '开户行',
  `banks` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `code_img` varchar(255) DEFAULT NULL COMMENT '二维码',
  `code_time` varchar(255) DEFAULT NULL COMMENT '二维码到期时间',
  `total_score` double(11,2) DEFAULT '0.00' COMMENT '总积分,累积积分',
  `do_score` double(11,2) DEFAULT '0.00' COMMENT '可用积分',
  `state_id` int(11) DEFAULT NULL COMMENT '省id',
  `city_id` int(11) DEFAULT NULL COMMENT '市id',
  `area_id` int(11) DEFAULT NULL COMMENT '区县id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_user
-- ----------------------------
INSERT INTO `lr_user` VALUES ('1', '吴彦祖子', '小伙伴1', 'aa', '0', '0', 'http://thirdwx.qlogo.cn/mmopen/hJKF9kCDqyiafXgwib3ibe2eXC6HkswVgWTRmQCaKsp772fSETIe09fia5JIOiasria6bCmahX3hgEy8MRQZmWQib1dzJabQUiaQZynH/132', '17671853375', '0', '10627623849@qq.com', '0', '0', '', '', '1', '1', '12', '1', '广东省', '广州市', '黄埔区', '湖北省云梦县', '2019-01-19 15:43:25', '2', '853.10', '753.10', '853.10', null, '吴彦祖', '周学忠', '123123', '12313123', '123123', '123123', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEJ8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ3hxZGxMWkJlb2oxMDAwMDAwN0wAAgSiF-JbAwQAAAAA', '1546601514', '10500.00', '10500.00', '1960', '1960', null);
INSERT INTO `lr_user` VALUES ('2', '周', '小伙伴2', '', '1494210088', '0', 'http://thirdwx.qlogo.cn/mmopen/hJKF9kCDqyiafXgwib3ibe2eXC6HkswVgWTRmQCaKsp772fSETIe09fia5JIOiasria6bCmahX3hgEy8MRQZmWQib1dzJabQUiaQZynH/132', '17671822283', '1062787348', '10627623849@qq.com', '1', '0', 'oQukL0fa013osRbWSdIPaUt88JZE', 'wx', '1', '1', '0', '1', '广东', '广州市', '天河区', '奥体南路尤拓邦', '2019-01-14 11:40:32', '3', '1421.20', '1421.20', '1421.20', null, '我要申请代理', null, null, null, null, null, null, null, '19500.00', '19500.00', '1960', '1961', '1965');
INSERT INTO `lr_user` VALUES ('3', '周学忠', '小伙伴3', '', '1495264753', '0', 'http://thirdwx.qlogo.cn/mmopen/hJKF9kCDqyiafXgwib3ibe2eXC6HkswVgWTRmQCaKsp772fSETIe09fia5JIOiasria6bCmahX3hgEy8MRQZmWQib1dzJabQUiaQZynH/132', '17671853375', '1062763849', null, '1', '0', 'oQukL0fa013osRbWSdIPaUt88JZE', 'wx', '2', '1', '0', '3', '广东', '广州市', '荔湾区', '荔湾大厦', '2019-01-14 11:40:32', null, '2185.00', '2185.00', '2185.00', null, '我就是想申请个代理', '周学忠', '121', '师付的那份广发发给', '建设银行', '213123 3 4324 3 432432', null, null, '13500.00', '13500.00', '1960', '1961', '1962');
INSERT INTO `lr_user` VALUES ('6', '', null, '', '0', '0', null, null, '', null, '0', '0', '', '', '0', '1', null, null, null, null, null, 'sdf', '2019-01-09 19:06:18', '3', '0.00', null, null, null, null, null, null, null, null, null, null, null, '0.00', '0.00', null, null, null);

-- ----------------------------
-- Table structure for `lr_user_course`
-- ----------------------------
DROP TABLE IF EXISTS `lr_user_course`;
CREATE TABLE `lr_user_course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程报名表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程ID',
  `truename` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(2) DEFAULT '1' COMMENT '性别',
  `age` int(4) DEFAULT '0' COMMENT '年龄',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `weixin` varchar(30) DEFAULT NULL COMMENT '微信号',
  `tel` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) DEFAULT '1' COMMENT '状态：1报名中 2报名成功 3待定 4待定',
  `addtime` int(11) DEFAULT '0' COMMENT '报名时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_user_course
-- ----------------------------
INSERT INTO `lr_user_course` VALUES ('1', '1', '3', '小花', '2', '18', '354353', 'dfgdsg@126.com', 'weixinhao', '2147483647', '水电费给对方返回SDR官方认识人多', '没有备注', '2', '1495613076');

-- ----------------------------
-- Table structure for `lr_user_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `lr_user_voucher`;
CREATE TABLE `lr_user_voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员优惠券领取记录',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `vid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商铺ID',
  `full_money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '满多少钱',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '减多少钱',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '使用状态 1未使用 2已使用 3已失效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_user_voucher
-- ----------------------------
INSERT INTO `lr_user_voucher` VALUES ('3', '1', '3', '1', '200.00', '15.00', '1492444800', '1495123199', '1492498299', '1');
INSERT INTO `lr_user_voucher` VALUES ('4', '1', '2', '1', '100.00', '5.00', '1492444800', '1495123199', '1492498311', '1');
INSERT INTO `lr_user_voucher` VALUES ('5', '3', '5', '0', '100.00', '15.00', '1495641600', '1497110399', '1495672289', '1');
INSERT INTO `lr_user_voucher` VALUES ('6', '3', '4', '0', '200.00', '20.00', '1495641600', '1496851199', '1495672291', '1');

-- ----------------------------
-- Table structure for `lr_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `lr_voucher`;
CREATE TABLE `lr_voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺优惠券表',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `title` varchar(100) DEFAULT NULL COMMENT '优惠券名称',
  `full_money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '满多少钱',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '减多少钱',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `point` int(11) DEFAULT '0' COMMENT '所需积分',
  `count` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '发行数量',
  `receive_num` int(11) unsigned DEFAULT '0' COMMENT '领取数量',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠券类型',
  `del` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `proid` text COMMENT '产品ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_voucher
-- ----------------------------
INSERT INTO `lr_voucher` VALUES ('1', '1', '南沙自贸区', '100.00', '8.00', '1491062400', '1491580799', '100', '15', '0', '1491126577', '1', '0', '2,1');
INSERT INTO `lr_voucher` VALUES ('2', '1', '端午到，优惠券也到了', '100.00', '5.00', '1492444800', '1495123199', '0', '10', '2', '1492482339', '1', '0', 'all');
INSERT INTO `lr_voucher` VALUES ('3', '1', '端午到，优惠券也到了', '200.00', '15.00', '1492444800', '1495123199', '0', '10', '2', '1492482366', '1', '0', 'all');
INSERT INTO `lr_voucher` VALUES ('4', '0', '端午到，优惠券也到了', '200.00', '20.00', '1495641600', '1496851199', '0', '20', '1', '1495672098', '1', '0', 'all');
INSERT INTO `lr_voucher` VALUES ('5', '0', '端午优惠多, 先到就先得', '100.00', '15.00', '1495641600', '1497110399', '0', '20', '1', '1495672249', '1', '0', 'all');
INSERT INTO `lr_voucher` VALUES ('6', '0', '测试', '100.00', '0.01', '1498579200', '1498751999', '0', '1', '0', '1498642295', '1', '0', 'all');

-- ----------------------------
-- Table structure for `lr_web`
-- ----------------------------
DROP TABLE IF EXISTS `lr_web`;
CREATE TABLE `lr_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单网页信息表：关于我们、客服中心等',
  `pid` int(11) DEFAULT '0',
  `uname` varchar(255) DEFAULT NULL COMMENT '名称1',
  `ename` varchar(255) DEFAULT NULL COMMENT '名称2',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `concent` mediumtext COMMENT '内容介绍',
  `addtime` int(11) DEFAULT '0' COMMENT '发表时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_web
-- ----------------------------
INSERT INTO `lr_web` VALUES ('1', '0', '关于我们', '', '0', '<p><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; text-indent: 30px;\"></span></p><span style=\"font-family:宋体;\"><span style=\"font-size:16px;\"></span></span><p><span style=\"font-family:宋体;line-height: 24px;\"><span style=\"font-size:16px;\"><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251102322478.jpg\" alt=\"\" /><br /></span></span></p><p><span style=\"font-family:宋体;line-height: 24px;\"><span style=\"font-size:16px;\"><span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp; 雷米高宠物美容师学校成立于2012年初，由雷米高动物营养保健科技有限公司联合广州市技师学院（国家级公办示范职业技术学院），以校企合作的形式开设的宠物美容师培训学校，校企联办，企业化独立运营。<br />学校由台湾教师级领衔国内外A级师资团队教学，是一所具有海陆两岸专业宠物美容教学理念与技术于一体的学校，成立5年多来，累计培养C级美容师超2000人，B级、A级美容师超两百人。<br />学校定位为专业的宠物美容师技能培训和创业培训，参考国际标准，重点发展C级精修特色班（2个月及以上），让学员学习加实习，毕业就能完全胜任宠物美容师岗位及具备创业能力。<br />&nbsp; &nbsp; 学校拥有超过1000只模特犬的专业犬舍，保证学员天天有真狗实训，学美容就是学手艺，真狗实训，成就一流手艺。<br />&nbsp; &nbsp; 学校是华南地区最具影响力的学校，也是全国为数不多的千人大校。学员100%推荐就业，永久技术支持，提供专业的创业指导平台，并让学生有机会免费加盟哈宠联邦宠物连锁机构。<br />&nbsp; &nbsp; 多年来，雷米高一直致力打造宠物行业全产业链事业，旨在服务更多可爱宠物，并帮助更多宠物行业从业者成功创业。雷米高公司，是全国首家进行宠物全产业链打造的公司，五大系列产品的研发、生产与销售（犬猫粮、宠物药品、保健品、护理品、零食）；纯种犬繁育；宠物美容师培训教育；宠物医疗服务；宠物店连锁经营。<br />&nbsp; &nbsp; 雷米高学校的愿景是成为宠物美容师学校中的清华北大，以“提升职业技能、创业实现梦想”为基本理念，来雷米高学习美容，就是与宠物行业结缘，与雷米高结缘，共同长期在整个宠物行业中成为合作伙伴，资源整合，共享宠物行业高速发展的红利，共同服务于我们的家庭新成员--猫猫狗狗，让每一个宠物享有最尊荣的关爱，待宠如亲！</span></span><br /></span></span></p><p style=\"text-indent: 30px;\"><span style=\"font-family:宋体;\"><span style=\"font-size: 14px;\">&nbsp;</span></span></p>', '1495681384');
INSERT INTO `lr_web` VALUES ('2', '0', '教学优势', '', '0', '<p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251100326234.jpg\" alt=\"\" /></p><p><img src=\"/minipetmrschool/Data/UploadFiles/Uploads/day_170525/201705251100497245.jpg\" alt=\"\" /></p><p><span style=\"font-size:18px;line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 雷米高宠物美容师学校成立于2012年，由雷米高公司出资，联合广州市技师学院（国家级示范职业技术学院），以校企合作的形式开设的宠物美容师培训学校，校企联办，实现企业化运营，由台湾教师团队领衔教学，是一所具有海陆两岸专业宠物美容教学于一体的学校。成立近5年来，培养C级美容师近2000人，并有上百个B级、A级美容师毕业，是华南最具影响力的学校，也是全国为数不多的千人大校。</span></p><p><br /></p>', '1495681305');

-- ----------------------------
-- Table structure for `lr_wechat_config`
-- ----------------------------
DROP TABLE IF EXISTS `lr_wechat_config`;
CREATE TABLE `lr_wechat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公众号配置表',
  `name` varchar(255) DEFAULT NULL COMMENT '公众号名称',
  `user_name` varchar(255) DEFAULT NULL COMMENT '负责人',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo地址',
  `introduction` text COMMENT '公众号简介',
  `user_wechat` varchar(255) DEFAULT NULL COMMENT '客服微信号',
  `user_phone` varchar(255) DEFAULT NULL COMMENT '客服电话号',
  `user_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `copyright` varchar(255) DEFAULT NULL COMMENT '版权',
  `wx_url` varchar(255) DEFAULT NULL COMMENT 'URL(服务器地址)',
  `wx_token` varchar(255) DEFAULT NULL COMMENT 'Token(令牌)',
  `wx_coding_key` varchar(255) DEFAULT NULL COMMENT 'EncodingAESKey(消息加解密密钥)',
  `wx_appid` varchar(255) DEFAULT NULL COMMENT '微信appid',
  `wx_secret` varchar(255) DEFAULT NULL,
  `wx_mchid` varchar(255) DEFAULT NULL COMMENT '系统商户号',
  `wx_mchkey` varchar(255) DEFAULT NULL COMMENT '商户号密钥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_wechat_config
-- ----------------------------
INSERT INTO `lr_wechat_config` VALUES ('1', '环之旅', '周学忠', 'UploadFiles/logo/1536658038478922.jpg', '的能科股份能科股份开关机付款就赶快发几个开发尽快', '232sjkjdljl', 'jkfjlkj1lkk2j1kljkljklj33', '我打算', '到空间快乐十分发发送到', 'http://jifen.518wk.cn/api.php?id=1', 'ovsyh643e7kxthj0s6j0do7leg1deyuk', 'xpoFCA9r2maz1Md3O0XfbwHf1UQ4fNyyRbtmvIq2ZcG', 'wx3bd4a797938d1440', 'a4f8338196f873f3b5ea3185ebcf6463', '1489290722', 'I6m8mMp9YZ0IQDqLFK3eHNYBNUeiJ8pL');

-- ----------------------------
-- Table structure for `lr_weixin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `lr_weixin_menu`;
CREATE TABLE `lr_weixin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isvalid` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `key` varchar(255) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '回复的内容',
  `json` varchar(255) DEFAULT NULL COMMENT 'json',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单的id',
  `level` int(11) DEFAULT NULL COMMENT '菜单等级',
  `save_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `appid` varchar(255) DEFAULT NULL COMMENT '微信小程序的appid',
  `pagepath` varchar(255) DEFAULT NULL COMMENT '微信小程序的页面路径',
  `cate` int(11) DEFAULT NULL COMMENT 'click的类别',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片的链接',
  `image_title` varchar(255) DEFAULT NULL COMMENT '图文消息的标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_weixin_menu
-- ----------------------------
INSERT INTO `lr_weixin_menu` VALUES ('26', '1', '2018-09-11 19:28:20', null, '菜单一', 'view', 'wwwww3333', null, '佛挡杀佛', '{\"type\":\"view\",\"name\":\"菜单一\",\"url\":\"wwwww3333\"}', '0', '1', '2018-09-12 11:24:45', '', '', null, null, '');
INSERT INTO `lr_weixin_menu` VALUES ('27', '1', '2018-09-12 11:16:16', null, '大师傅', 'click', ' 火锅个hg', '大师傅', '火锅火锅更换个火锅火锅火锅火锅', '{\"type\":\"image_text\",\"name\":\"大师傅\",\"key\":\"大师傅\"}', '0', '1', '2018-11-05 17:55:54', '', '', '2', 'http://tour.com/data/uploadfiles/menu_img/2018-09-12/5b988719d2f33.jpg', '发gfgfg');
INSERT INTO `lr_weixin_menu` VALUES ('28', '1', '2018-09-12 11:22:04', null, '菜单2', 'menu', '', null, '', '{\"name\":\"菜单2\",\"sub_button\":[]}', '0', '1', null, '', '', null, null, '');
INSERT INTO `lr_weixin_menu` VALUES ('30', '1', '2018-09-12 15:26:04', null, 'sdf ', 'view', 'df ', null, '', '{\"type\":\"view\",\"name\":\"sdf \",\"url\":\"df \"}', '28', '2', null, '', '', null, null, '');

-- ----------------------------
-- Table structure for `lr_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `lr_withdraw`;
CREATE TABLE `lr_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现表',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `money` double(11,2) DEFAULT NULL,
  `orderids` text COMMENT '流水的id',
  `create_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '1为待审核  2为审核通过(提现成功) 3为审核驳回(提现失败) 4已审核待转账 5审核不通过',
  `save_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_withdraw
-- ----------------------------
INSERT INTO `lr_withdraw` VALUES ('6', '3', '124.68', '', '2018-11-05 15:43:18', '2', '2019-01-10 20:36:19');
INSERT INTO `lr_withdraw` VALUES ('7', '3', '124.68', '52,55,58,61,64', '2018-11-05 15:51:43', '2', '2019-01-10 20:36:17');
INSERT INTO `lr_withdraw` VALUES ('8', '3', '124.68', '52,55,58,61,64', '2018-11-05 15:52:50', '2', '2019-01-10 20:36:18');
INSERT INTO `lr_withdraw` VALUES ('9', '3', '124.68', '52,55,58,61,64', '2018-11-05 18:59:44', '2', '2018-11-05 19:02:42');
INSERT INTO `lr_withdraw` VALUES ('10', '3', '124.68', '52,55,58,61,64', '2018-11-05 19:03:19', '2', '2018-11-05 19:03:57');
INSERT INTO `lr_withdraw` VALUES ('11', '3', '124.68', '52,55,58,61,64', '2018-11-05 19:04:46', '3', '2018-11-05 19:04:56');
INSERT INTO `lr_withdraw` VALUES ('12', '3', '124.68', '52,55,58,61,64', '2018-11-05 19:05:34', '3', '2018-11-05 19:05:56');
INSERT INTO `lr_withdraw` VALUES ('13', '3', '124.68', '52,55,58,61,64', '2018-11-05 21:26:47', '4', '2018-11-13 09:46:58');
INSERT INTO `lr_withdraw` VALUES ('14', '3', '124.68', '52,55,58,61,64', '2018-11-12 18:15:17', '2', '2018-11-13 09:48:17');
INSERT INTO `lr_withdraw` VALUES ('16', '3', '6880.00', '67,74,80,82,84,86,88,90,92,94', '2019-01-10 17:35:30', '2', '2019-01-10 20:36:13');
INSERT INTO `lr_withdraw` VALUES ('17', '3', '1.00', null, '2019-01-10 20:37:24', '3', '2019-01-10 20:56:51');
INSERT INTO `lr_withdraw` VALUES ('18', '1', '100.00', null, '2019-01-19 15:43:25', '2', '2019-01-19 15:44:21');
