/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-14 16:19:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addfruit
-- ----------------------------
DROP TABLE IF EXISTS `addfruit`;
CREATE TABLE `addfruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telphone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `style` int(1) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `content` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of addfruit
-- ----------------------------

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(12) COLLATE utf8_bin NOT NULL,
  `telphone` varchar(11) COLLATE utf8_bin NOT NULL,
  `place` varchar(32) COLLATE utf8_bin NOT NULL,
  `address` varchar(32) COLLATE utf8_bin NOT NULL,
  `choose` int(1) NOT NULL COMMENT '是否默认',
  `uptime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of address
-- ----------------------------
-- ----------------------------
-- Table structure for classprice
-- ----------------------------
DROP TABLE IF EXISTS `classprice`;
CREATE TABLE `classprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `C_one` int(11) DEFAULT NULL,
  `C_two` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `voucher` decimal(10,0) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `statu` int(11) DEFAULT NULL,
  `choose` int(1) DEFAULT NULL,
  `image` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of classprice
-- ----------------------------

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `uptime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of focus
-- ----------------------------

-- ----------------------------
-- Table structure for f_exchange
-- ----------------------------
DROP TABLE IF EXISTS `f_exchange`;
CREATE TABLE `f_exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `num` float DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for f_goods
-- ----------------------------
DROP TABLE IF EXISTS `f_goods`;
CREATE TABLE `f_goods` (
  `id` int(11) DEFAULT NULL,
  `goods` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_goods
-- ----------------------------

-- ----------------------------
-- Table structure for f_harvest
-- ----------------------------
DROP TABLE IF EXISTS `f_harvest`;
CREATE TABLE `f_harvest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `treeid` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_harvest
-- ----------------------------

-- ----------------------------
-- Table structure for f_land
-- ----------------------------
DROP TABLE IF EXISTS `f_land`;
CREATE TABLE `f_land` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_land
-- ----------------------------
-- ----------------------------
-- Table structure for f_lowest
-- ----------------------------
DROP TABLE IF EXISTS `f_lowest`;
CREATE TABLE `f_lowest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `lownum` float DEFAULT '300',
  `content` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_lowest
-- ----------------------------

-- ----------------------------
-- Table structure for f_mygoods
-- ----------------------------
DROP TABLE IF EXISTS `f_mygoods`;
CREATE TABLE `f_mygoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fruit` decimal(9,2) DEFAULT '0.00',
  `voucher` decimal(9,2) DEFAULT '0.00',
  `tree` int(11) DEFAULT '0',
  `land` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_mygoods
-- ----------------------------

-- ----------------------------
-- Table structure for f_oldtree
-- ----------------------------
DROP TABLE IF EXISTS `f_oldtree`;
CREATE TABLE `f_oldtree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `oldtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_oldtree
-- ----------------------------

-- ----------------------------
-- Table structure for f_rate
-- ----------------------------
DROP TABLE IF EXISTS `f_rate`;
CREATE TABLE `f_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `land_num` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `cycle` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_rate
-- ----------------------------
INSERT INTO `f_rate` VALUES ('1', '1', '0.02', '0');
INSERT INTO `f_rate` VALUES ('2', '2', '0.022', '50');
INSERT INTO `f_rate` VALUES ('3', '3', '0.022', '22.72');
INSERT INTO `f_rate` VALUES ('4', '4', '0.022', '15.15');
INSERT INTO `f_rate` VALUES ('5', '5', '0.022', '11.36');
INSERT INTO `f_rate` VALUES ('6', '6', '0.022', '9.09');
INSERT INTO `f_rate` VALUES ('7', '7', '0.022', '0.01');
INSERT INTO `f_rate` VALUES ('8', '8', '0.024', '7.57');
INSERT INTO `f_rate` VALUES ('9', '9', '0.024', '6.49');
INSERT INTO `f_rate` VALUES ('10', '10', '0.024', '5.2');
INSERT INTO `f_rate` VALUES ('11', '11', '0.024', '4.62');
INSERT INTO `f_rate` VALUES ('12', '12', '0.024', '4.16');
INSERT INTO `f_rate` VALUES ('13', '13', '0.024', '3.78');
INSERT INTO `f_rate` VALUES ('14', '14', '0.024', '3.54');
INSERT INTO `f_rate` VALUES ('15', '15', '0.026', '3.34');
INSERT INTO `f_rate` VALUES ('16', '16', '0.026', '3.2');

-- ----------------------------
-- Table structure for f_steal
-- ----------------------------
DROP TABLE IF EXISTS `f_steal`;
CREATE TABLE `f_steal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `tuid` int(11) DEFAULT NULL,
  `num` float DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_steal
-- ----------------------------

-- ----------------------------
-- Table structure for f_trade
-- ----------------------------
DROP TABLE IF EXISTS `f_trade`;
CREATE TABLE `f_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `tuid` int(11) DEFAULT NULL,
  `num` float DEFAULT NULL,
  `realnum` float DEFAULT NULL COMMENT '实际获得数',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_trade
-- ----------------------------

-- ----------------------------
-- Table structure for f_tree
-- ----------------------------
DROP TABLE IF EXISTS `f_tree`;
CREATE TABLE `f_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_tree
-- ----------------------------

-- ----------------------------
-- Table structure for f_treecycle
-- ----------------------------
DROP TABLE IF EXISTS `f_treecycle`;
CREATE TABLE `f_treecycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `land` int(11) DEFAULT NULL,
  `cycle` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_treecycle
-- ----------------------------

-- ----------------------------
-- Table structure for gclassify
-- ----------------------------
DROP TABLE IF EXISTS `gclassify`;
CREATE TABLE `gclassify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `fid` int(11) NOT NULL COMMENT '父id',
  `path` varchar(12) COLLATE utf8_bin NOT NULL,
  `name` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of gclassify
-- ----------------------------
-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '商品分类      1果篮2穿戴3快消4电子',
  `classify` int(1) NOT NULL COMMENT '商品类别',
  `price` varchar(32) COLLATE utf8_bin NOT NULL,
  `voucher` int(11) NOT NULL COMMENT '代金券',
  `image` varchar(32) COLLATE utf8_bin NOT NULL,
  `contents` text COLLATE utf8_bin,
  `oprice` double NOT NULL,
  `uptime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
-- ----------------------------
-- Table structure for goodsimg
-- ----------------------------
DROP TABLE IF EXISTS `goodsimg`;
CREATE TABLE `goodsimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `uptime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goodsimg
-- ----------------------------
-- ----------------------------
-- Table structure for letter
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `classid` int(2) DEFAULT NULL,
  `tuid` int(11) DEFAULT NULL,
  `num` float DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of letter
-- ----------------------------
-- ----------------------------
-- Table structure for lootgoods
-- ----------------------------
DROP TABLE IF EXISTS `lootgoods`;
CREATE TABLE `lootgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL COMMENT '抢购数量',
  `loot_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of lootgoods
-- ----------------------------
-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `statu` int(1) NOT NULL,
  `uptime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '4297f44b13955235245b2497399d7a93', '1', '2018-03-17 21:46:55');
-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for onemoney
-- ----------------------------
DROP TABLE IF EXISTS `onemoney`;
CREATE TABLE `onemoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL COMMENT '可购买次数',
  `uptime` datetime DEFAULT NULL COMMENT '上线发布时间',
  `hour` float DEFAULT NULL COMMENT '在线时长   单位（小时）',
  `number` int(11) DEFAULT NULL COMMENT '参与人数',
  `image` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of onemoney
-- ----------------------------
-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `statu` int(1) NOT NULL COMMENT '1代付款 2代发货 3待收货',
  `ordernum` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `uptime` datetime NOT NULL,
  `addrid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order
-- ----------------------------
-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `land_price` decimal(10,0) DEFAULT NULL,
  `tree_price` decimal(10,0) DEFAULT NULL,
  `farm_name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '农场名称',
  `fruit_tree` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '果树生命值',
  `transaction_fee` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '交易手续费百分比',
  `trading_limits` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库最低保有量',
  `user_steal` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '用户偷取百分比',
  `trade_exchange` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '交易强制兑换百分比',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('1', '0', '300', '果然农场', '115', '10', '0', '5', '10');

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `uptime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `realname` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `telphone` varchar(11) COLLATE utf8_bin NOT NULL,
  `alipay` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `vipid` varchar(6) COLLATE utf8_bin NOT NULL,
  `paypass` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `referee` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐人',
  `registime` datetime NOT NULL COMMENT '注册时间',
  `faceimg` varchar(32) COLLATE utf8_bin NOT NULL,
  `recomcode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for winer
-- ----------------------------
DROP TABLE IF EXISTS `winer`;
CREATE TABLE `winer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `winer` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1152 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of winer
-- ----------------------------
