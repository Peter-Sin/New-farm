/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-12 18:41:00
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
INSERT INTO `addfruit` VALUES ('1', '15238617326', null, '25', 'ceshi添加', '2018-04-08 18:01:47');
INSERT INTO `addfruit` VALUES ('6', '15238617326', null, '200', 'zengsong', '2018-04-11 17:58:31');
INSERT INTO `addfruit` VALUES ('7', '15617801519', null, '200', '15238617326充值赠送', '2018-04-11 17:58:31');
INSERT INTO `addfruit` VALUES ('8', '15238617326', null, '200', 'zengsong', '2018-04-11 18:02:19');
INSERT INTO `addfruit` VALUES ('9', '15617801519', null, '200', '15238617326充值赠送', '2018-04-11 18:02:19');
INSERT INTO `addfruit` VALUES ('10', '15238617326', null, '200', 'zengsong', '2018-04-11 18:04:28');
INSERT INTO `addfruit` VALUES ('11', '15617801519', null, '200', '15238617326充值赠送', '2018-04-11 18:04:28');
INSERT INTO `addfruit` VALUES ('12', '15238617326', null, '1000', 'sdasd', '2018-04-11 18:04:57');
INSERT INTO `addfruit` VALUES ('13', '15617801519', null, '1000', '15238617326充值赠送', '2018-04-11 18:04:57');
INSERT INTO `addfruit` VALUES ('14', '15238617326', null, '1000', 'sdasd', '2018-04-11 18:09:14');
INSERT INTO `addfruit` VALUES ('15', '15617801519', null, '1000', '15238617326充值赠送', '2018-04-11 18:09:14');
INSERT INTO `addfruit` VALUES ('16', '15238617326', null, '1000', 'sdasd', '2018-04-11 18:09:31');
INSERT INTO `addfruit` VALUES ('17', '15617801519', null, '1000', '15238617326充值赠送', '2018-04-11 18:09:31');
INSERT INTO `addfruit` VALUES ('18', '15238617326', null, '1000', 'sdasd', '2018-04-11 18:11:52');
INSERT INTO `addfruit` VALUES ('19', '15617801519', null, '1000', '15238617326充值赠送', '2018-04-11 18:11:52');
INSERT INTO `addfruit` VALUES ('20', '15238617326', null, '1000', 'sdasd', '2018-04-11 18:15:34');
INSERT INTO `addfruit` VALUES ('21', '15617801519', null, '1000', '15238617326充值赠送', '2018-04-11 18:15:34');
INSERT INTO `addfruit` VALUES ('22', '15238617326', null, '800', 'sgasgsdfgdzdgfzasdf1213', '2018-04-11 18:20:13');
INSERT INTO `addfruit` VALUES ('23', '15617801519', null, '800', '15238617326充值赠送', '2018-04-11 18:20:13');
INSERT INTO `addfruit` VALUES ('24', '15238617326', null, '400', 'aaaaaaaaaaaaaaaaaaaaag', '2018-04-11 18:21:04');
INSERT INTO `addfruit` VALUES ('25', '15617801519', null, '400', '15238617326充值赠送', '2018-04-11 18:21:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('15', '3', '花花', '17868417352', '萨芬撒打发斯蒂芬', '甘肃省/武威市/天祝藏族自治县', '0', '2018-03-15 19:39:58');
INSERT INTO `address` VALUES ('21', '3', '卡卡', '123123', '啊是发达省份123', '湖北省/恩施土家族苗族自治州/鹤峰县', '1', '2018-03-16 09:51:44');
INSERT INTO `address` VALUES ('24', '3', 'CVBS', '1242345325', '14321上午的发的所发生的', '贵州省/黔东南苗族侗族自治州/榕江县', '0', '2018-03-16 09:52:39');
INSERT INTO `address` VALUES ('25', '3', '代发货', '78967895484', '官方回复电话36456345', '青海省/海南藏族自治州/贵德县', '0', '2018-03-16 09:53:00');
INSERT INTO `address` VALUES ('27', '3', '花花一号', '17868417352', '萨芬撒打发斯蒂芬123123123123', '广东省/韶关市/曲江区', '0', '2018-03-16 09:59:06');
INSERT INTO `address` VALUES ('29', '3', '花花111', '17868417352', '萨芬撒打发斯蒂芬111', '甘肃省/武威市/天祝藏族自治县', '0', '2018-03-16 10:03:42');

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
INSERT INTO `classprice` VALUES ('1', '1', '2', '5', '300.00', '50', '1562', '1', '1', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('2', '1', '2', '6', '350.00', '55', '4563', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('3', '1', '2', '9', '400.00', '60', '856', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('4', '1', '2', '10', '500.00', '80', '1235', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('5', '1', '3', '5', '200.00', '50', '865', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('6', '1', '3', '6', '300.00', '60', '4568', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('7', '1', '3', '9', '400.00', '70', '5564', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('8', '1', '3', '10', '500.00', '80', '856', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('9', '1', '7', '5', '100.00', '60', '855', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('10', '1', '7', '6', '399.00', '70', '6554', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('11', '1', '7', '9', '400.00', '80', '766', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('12', '1', '7', '10', '500.00', '90', '1562', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('13', '1', '8', '5', '100.00', '70', '3241', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('14', '1', '8', '6', '200.00', '80', '5236', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('15', '1', '8', '9', '300.00', '90', '78', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('16', '1', '8', '10', '400.00', '100', '955', '1', '0', '1qw2we3e23ew.jpg');
INSERT INTO `classprice` VALUES ('17', '2', '12', '17', '2000.00', '100', '12', '1', '1', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('18', '2', '12', '18', '2000.00', '100', '23', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('19', '2', '12', '19', '2000.00', '100', '34', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('20', '2', '12', '20', '2000.00', '100', '45', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('21', '2', '13', '17', '3000.00', '120', '56', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('22', '2', '13', '18', '3000.00', '120', '234', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('23', '2', '13', '19', '3000.00', '120', '23', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('24', '2', '13', '20', '3000.00', '120', '45', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('25', '2', '14', '17', '4000.00', '150', '65', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('26', '2', '14', '18', '4000.00', '150', '657', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('27', '2', '14', '19', '4000.00', '150', '98', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('28', '2', '14', '20', '4000.00', '150', '78', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('29', '2', '15', '17', '5000.00', '180', '23', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('30', '2', '15', '18', '5000.00', '180', '12', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('31', '2', '15', '19', '5000.00', '180', '123', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('32', '2', '15', '20', '5000.00', '180', '56', '1', '0', '34t53rey43ey.jpg');
INSERT INTO `classprice` VALUES ('33', '3', '22', '27', '600.00', '50', '34', '1', '1', '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('34', '3', '22', '28', '800.00', '60', '23', '1', '0', '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('35', '3', '22', '29', '1000.00', '70', '50', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('36', '3', '22', '30', '1200.00', '80', '45', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('37', '3', '23', '27', '650.00', '50', '56', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('38', '3', '23', '28', '750.00', '50', '345', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('39', '3', '23', '29', '850.00', '50', '35', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('40', '3', '23', '30', '950.00', '50', '460', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('41', '3', '24', '27', '600.00', '80', '58', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('42', '3', '24', '28', '700.00', '80', '74', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('43', '3', '24', '29', '800.00', '80', '91', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('44', '3', '24', '30', '900.00', '80', '2', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('45', '3', '25', '27', '800.00', '100', '344', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('46', '3', '25', '28', '1000.00', '150', '62', '1', null, '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('47', '3', '25', '29', '1500.00', '200', '84', '1', '0', '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('48', '3', '25', '30', '1800.00', '300', '60', '1', '0', '45try45ytretyerty.jpg');
INSERT INTO `classprice` VALUES ('49', '4', '32', '37', '500.00', '50', '34', '1', '1', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('50', '4', '32', '38', '500.00', '60', '45', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('51', '4', '32', '39', '600.00', '70', '37', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('52', '4', '32', '40', '600.00', '80', '456', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('53', '4', '33', '37', '400.00', '50', '34', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('54', '4', '33', '38', '450.00', '60', '76', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('55', '4', '33', '39', '420.00', '70', '478', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('56', '4', '33', '40', '460.00', '80', '580', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('57', '4', '34', '37', '1000.00', '100', '52', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('58', '4', '34', '38', '1200.00', '100', '36', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('59', '4', '34', '39', '1450.00', '100', '474', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('60', '4', '34', '40', '1600.00', '100', '58', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('61', '4', '35', '37', '800.00', '120', '681', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('62', '4', '35', '38', '900.00', '120', '351', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('63', '4', '35', '39', '1100.00', '160', '46', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('64', '4', '35', '40', '1500.00', '200', '72', '1', '0', '1234567890.jpg');
INSERT INTO `classprice` VALUES ('65', '5', '42', '47', '20.00', '10', '267', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('66', '5', '42', '48', '30.00', '10', '37', '1', '1', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('67', '5', '42', '49', '40.00', '20', '665', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('68', '5', '42', '50', '50.00', '20', '381', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('69', '5', '43', '47', '55.00', '50', '44', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('70', '5', '43', '48', '65.00', '60', '25', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('71', '5', '43', '49', '75.00', '65', '386', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('72', '5', '43', '50', '85.00', '70', '52', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('73', '5', '44', '47', '100.00', '80', '366', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('74', '5', '44', '48', '120.00', '80', '25', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('75', '5', '44', '49', '140.00', '80', '366', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('76', '5', '44', '50', '180.00', '80', '72', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('77', '5', '45', '47', '40.00', '90', '556', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('78', '5', '45', '48', '50.00', '90', '46', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('79', '5', '45', '49', '60.00', '100', '62', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('80', '5', '45', '50', '80.00', '150', '736', '1', '0', 'qwe123weqwe12e.jpg');
INSERT INTO `classprice` VALUES ('81', '6', '52', '57', '200.00', '30', '42', '1', '1', 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('82', '6', '52', '58', '200.00', '40', '356', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('83', '6', '52', '59', '200.00', '50', '58', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('84', '6', '52', '60', '200.00', '60', '35', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('85', '6', '53', '57', '220.00', '100', '854', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('86', '6', '53', '58', '220.00', '120', '315', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('87', '6', '53', '59', '240.00', '150', '546', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('88', '6', '53', '60', '240.00', '180', '96', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('89', '6', '54', '57', '180.00', '200', '25', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('90', '6', '54', '58', '180.00', '220', '651', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('91', '6', '54', '59', '185.00', '280', '86', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('92', '6', '54', '60', '190.00', '300', '265', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('93', '6', '55', '57', '150.00', '200', '15', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('94', '6', '55', '58', '160.00', '210', '264', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('95', '6', '55', '59', '180.00', '220', '90', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('96', '6', '55', '60', '200.00', '240', '357', '1', null, 'qweq123123.jpg');
INSERT INTO `classprice` VALUES ('97', '7', '70', '75', '15.00', '5', '1234', '1', '0', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('105', '7', '70', '77', '20.00', '3', '68', '1', '0', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('104', '7', '70', '76', '20.00', '10', '60', '1', '0', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('106', '7', '71', '75', '99.00', '25', '101', '1', '0', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('107', '7', '72', '77', '203.00', '30', '63', '1', '1', '5aaf557d4ca90.jpg');

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
INSERT INTO `focus` VALUES ('1', '3', '1', '2018-03-01 08:18:22');
INSERT INTO `focus` VALUES ('2', '3', '1', '2018-03-17 09:45:29');
INSERT INTO `focus` VALUES ('3', '3', '1', '2018-03-17 09:45:31');
INSERT INTO `focus` VALUES ('4', '3', '1', '2018-03-17 09:45:37');
INSERT INTO `focus` VALUES ('5', '3', '1', '2018-03-17 09:45:54');

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
INSERT INTO `f_exchange` VALUES ('1', '3', '20', '2018-04-10 11:00:43');
INSERT INTO `f_exchange` VALUES ('2', '3', '20', '2018-04-10 11:03:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_harvest
-- ----------------------------
INSERT INTO `f_harvest` VALUES ('1', '3', '1', '0.02', '0', '2018-03-27 14:27:02');
INSERT INTO `f_harvest` VALUES ('2', '3', '2', '0.022', '0', '2018-03-27 10:27:23');
INSERT INTO `f_harvest` VALUES ('3', '21', '3', '0.02', '0', '2018-03-24 17:16:07');
INSERT INTO `f_harvest` VALUES ('58', '3', '1', '0.022', '6', '2018-03-31 11:12:21');
INSERT INTO `f_harvest` VALUES ('59', '3', '2', '0.022', '6.6', '2018-03-31 11:12:21');
INSERT INTO `f_harvest` VALUES ('60', '3', '40', '0.022', '0', '2018-03-31 17:07:20');
INSERT INTO `f_harvest` VALUES ('61', '3', '41', '0.022', '0', '2018-03-31 17:08:09');
INSERT INTO `f_harvest` VALUES ('62', '3', '42', '0.022', '0', '2018-03-31 17:17:48');
INSERT INTO `f_harvest` VALUES ('63', '3', '43', '0.022', '0', '2018-03-31 17:17:49');
INSERT INTO `f_harvest` VALUES ('64', '3', '1', '0.022', '6.6', '2018-04-02 14:34:25');
INSERT INTO `f_harvest` VALUES ('65', '3', '2', '0.022', '6.6', '2018-04-02 14:34:25');
INSERT INTO `f_harvest` VALUES ('66', '3', '42', '0.022', '6.6', '2018-04-02 14:34:25');
INSERT INTO `f_harvest` VALUES ('67', '3', '43', '0.022', '6.6', '2018-04-02 14:34:25');
INSERT INTO `f_harvest` VALUES ('68', '3', '44', '0.022', '0', '2018-04-02 15:41:50');
INSERT INTO `f_harvest` VALUES ('69', '3', '45', '0.022', '0', '2018-04-02 15:46:51');
INSERT INTO `f_harvest` VALUES ('70', '3', '46', '0.022', '0', '2018-04-02 16:12:18');
INSERT INTO `f_harvest` VALUES ('71', '3', '47', '0.022', '0', '2018-04-02 16:13:39');
INSERT INTO `f_harvest` VALUES ('72', '3', '48', '0.022', '0', '2018-04-02 16:23:15');
INSERT INTO `f_harvest` VALUES ('73', '3', '49', '0.022', '0', '2018-04-02 18:20:05');
INSERT INTO `f_harvest` VALUES ('74', '3', '50', '0.022', '0', '2018-04-02 18:22:19');
INSERT INTO `f_harvest` VALUES ('75', '3', '51', '0.022', '0', '2018-04-02 18:22:25');
INSERT INTO `f_harvest` VALUES ('76', '3', '52', '0.022', '0', '2018-04-02 18:44:52');
INSERT INTO `f_harvest` VALUES ('77', '3', '53', '0.022', '0', '2018-04-03 14:06:54');
INSERT INTO `f_harvest` VALUES ('78', '3', '54', '0.022', '0', '2018-04-03 14:10:02');
INSERT INTO `f_harvest` VALUES ('79', '3', '1', '0.022', '6.6', '2018-04-08 09:03:39');
INSERT INTO `f_harvest` VALUES ('80', '3', '2', '0.022', '6.6', '2018-04-08 09:03:39');
INSERT INTO `f_harvest` VALUES ('81', '3', '50', '0.022', '6.6', '2018-04-08 09:03:39');
INSERT INTO `f_harvest` VALUES ('82', '3', '54', '0.022', '6.6', '2018-04-08 09:03:39');
INSERT INTO `f_harvest` VALUES ('83', '3', '1', '0.022', '6.6', '2018-04-09 10:58:50');
INSERT INTO `f_harvest` VALUES ('84', '3', '2', '0.022', '6.6', '2018-04-09 10:58:50');
INSERT INTO `f_harvest` VALUES ('85', '3', '50', '0.022', '6.6', '2018-04-09 10:58:50');
INSERT INTO `f_harvest` VALUES ('86', '3', '54', '0.022', '6.6', '2018-04-09 10:58:50');
INSERT INTO `f_harvest` VALUES ('87', '3', '55', '0.022', '0', '2018-04-09 10:59:18');
INSERT INTO `f_harvest` VALUES ('88', '3', '56', '0.022', '0', '2018-04-09 10:59:19');
INSERT INTO `f_harvest` VALUES ('89', '3', '1', '0.022', '6.6', '2018-04-10 11:27:24');
INSERT INTO `f_harvest` VALUES ('90', '3', '2', '0.022', '6.6', '2018-04-10 11:27:24');
INSERT INTO `f_harvest` VALUES ('91', '3', '50', '0.022', '6.6', '2018-04-10 11:27:24');
INSERT INTO `f_harvest` VALUES ('92', '3', '55', '0.022', '6.6', '2018-04-10 11:27:24');
INSERT INTO `f_harvest` VALUES ('93', '3', '56', '0.022', '6.6', '2018-04-10 11:27:24');
INSERT INTO `f_harvest` VALUES ('94', '3', '57', '0.022', '0', '2018-04-10 14:54:46');
INSERT INTO `f_harvest` VALUES ('95', '3', '58', '0.022', '0', '2018-04-10 16:26:14');
INSERT INTO `f_harvest` VALUES ('96', '3', '59', '0.022', '0', '2018-04-10 16:26:19');
INSERT INTO `f_harvest` VALUES ('97', '3', '60', '0.022', '0', '2018-04-10 16:38:50');
INSERT INTO `f_harvest` VALUES ('98', '3', '61', '0.022', '0', '2018-04-10 16:39:16');
INSERT INTO `f_harvest` VALUES ('99', '3', '2', '0.022', '6.6', '2018-04-11 09:56:40');
INSERT INTO `f_harvest` VALUES ('100', '3', '62', '0.022', '0', '2018-04-11 09:59:15');
INSERT INTO `f_harvest` VALUES ('101', '3', '63', '0.022', '0', '2018-04-11 09:59:15');
INSERT INTO `f_harvest` VALUES ('102', '3', '64', '0.022', '0', '2018-04-11 09:59:29');
INSERT INTO `f_harvest` VALUES ('103', '3', '65', '0.022', '0', '2018-04-11 09:59:29');
INSERT INTO `f_harvest` VALUES ('104', '3', '66', '0.022', '0', '2018-04-11 09:59:29');
INSERT INTO `f_harvest` VALUES ('105', '3', '67', '0.022', '0', '2018-04-11 09:59:34');
INSERT INTO `f_harvest` VALUES ('106', '3', '68', '0.022', '0', '2018-04-11 10:58:06');
INSERT INTO `f_harvest` VALUES ('107', '3', '69', '0.022', '0', '2018-04-11 11:53:52');
INSERT INTO `f_harvest` VALUES ('108', '3', '70', '0.022', '0', '2018-04-12 10:04:39');
INSERT INTO `f_harvest` VALUES ('109', '21', '71', '0.022', '0', '2018-04-12 11:59:26');
INSERT INTO `f_harvest` VALUES ('110', '3', '60', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('111', '3', '62', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('112', '3', '63', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('113', '3', '64', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('114', '3', '65', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('115', '3', '66', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('116', '3', '67', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('117', '3', '68', '0.022', '6.6', '2018-04-12 16:11:03');
INSERT INTO `f_harvest` VALUES ('118', '3', '69', '0.022', '6.6', '2018-04-12 16:11:03');

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
INSERT INTO `f_land` VALUES ('1', '3', '2018-03-26 14:26:09');
INSERT INTO `f_land` VALUES ('2', '3', '2018-03-27 08:26:23');
INSERT INTO `f_land` VALUES ('3', '3', '2018-03-27 14:26:39');
INSERT INTO `f_land` VALUES ('4', '3', '2018-03-31 09:37:25');
INSERT INTO `f_land` VALUES ('6', '21', '2018-04-06 15:04:49');
INSERT INTO `f_land` VALUES ('7', '21', '2018-04-07 15:04:59');
INSERT INTO `f_land` VALUES ('8', '22', '2018-04-08 15:05:22');
INSERT INTO `f_land` VALUES ('11', '3', '2018-04-11 10:56:47');
INSERT INTO `f_land` VALUES ('12', '3', '2018-04-11 10:57:55');
INSERT INTO `f_land` VALUES ('16', '3', '2018-04-11 11:53:18');

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
INSERT INTO `f_lowest` VALUES ('1', '3', '500', 'ceshi添加');

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
INSERT INTO `f_mygoods` VALUES ('1', '3', '898965.90', '2040.00', '10', '8');
INSERT INTO `f_mygoods` VALUES ('2', '21', '9700.00', '3000.00', '2', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_oldtree
-- ----------------------------
INSERT INTO `f_oldtree` VALUES ('1', '10', '3', '4', '2018-03-31 00:57:15', '2018-03-31 00:36:17');
INSERT INTO `f_oldtree` VALUES ('2', '10', '3', '4', '2018-03-31 00:59:21', '2018-03-31 00:36:17');
INSERT INTO `f_oldtree` VALUES ('3', '10', '3', '4', '2018-03-31 01:00:36', '2018-03-31 00:36:17');
INSERT INTO `f_oldtree` VALUES ('4', '11', '3', '4', '2018-03-31 09:20:55', '2018-03-31 09:20:28');
INSERT INTO `f_oldtree` VALUES ('41', '17', '3', '4', '2018-03-31 10:18:59', '2018-03-31 09:44:36');
INSERT INTO `f_oldtree` VALUES ('42', '23', '3', '4', '2018-03-31 10:30:40', '2018-03-31 10:29:34');
INSERT INTO `f_oldtree` VALUES ('43', '24', '3', '3', '2018-03-31 10:30:57', '2018-03-31 10:29:46');
INSERT INTO `f_oldtree` VALUES ('44', '25', '3', '4', '2018-03-31 10:31:11', '2018-03-31 10:31:05');
INSERT INTO `f_oldtree` VALUES ('45', '27', '3', '3', '2018-03-31 10:31:12', '2018-03-31 10:31:07');
INSERT INTO `f_oldtree` VALUES ('46', '28', '3', '4', '2018-03-31 10:31:26', '2018-03-31 10:31:18');
INSERT INTO `f_oldtree` VALUES ('47', '29', '3', '3', '2018-03-31 10:31:35', '2018-03-31 10:31:19');
INSERT INTO `f_oldtree` VALUES ('53', '33', '3', '4', '2018-03-31 11:04:05', '2018-03-31 10:44:06');
INSERT INTO `f_oldtree` VALUES ('54', '35', '3', '4', '2018-03-31 11:06:50', '2018-03-31 11:06:33');
INSERT INTO `f_oldtree` VALUES ('55', '41', '3', '4', '2018-03-31 17:09:02', '2018-03-31 17:08:09');
INSERT INTO `f_oldtree` VALUES ('56', '40', '3', '3', '2018-03-31 17:09:09', '2018-03-31 17:07:20');
INSERT INTO `f_oldtree` VALUES ('57', '42', '3', '3', '2018-04-02 15:41:21', '2018-03-31 17:17:48');
INSERT INTO `f_oldtree` VALUES ('58', '44', '3', '3', '2018-04-02 15:44:43', '2018-04-02 15:41:50');
INSERT INTO `f_oldtree` VALUES ('59', '46', '3', '4', '2018-04-02 16:13:20', '2018-04-02 16:12:18');
INSERT INTO `f_oldtree` VALUES ('60', '45', '3', '3', '2018-04-02 16:13:26', '2018-04-02 15:46:51');
INSERT INTO `f_oldtree` VALUES ('61', '47', '3', '4', '2018-04-02 16:56:31', '2018-04-02 16:13:39');
INSERT INTO `f_oldtree` VALUES ('62', '49', '3', '4', '2018-04-02 18:20:17', '2018-04-02 18:20:05');
INSERT INTO `f_oldtree` VALUES ('63', '48', '3', '3', '2018-04-02 18:21:12', '2018-04-02 16:23:15');
INSERT INTO `f_oldtree` VALUES ('64', '51', '3', '4', '2018-04-02 18:22:57', '2018-04-02 18:22:25');
INSERT INTO `f_oldtree` VALUES ('65', '52', '3', '4', '2018-04-03 14:06:21', '2018-04-02 18:44:52');
INSERT INTO `f_oldtree` VALUES ('66', '53', '3', '4', '2018-04-03 14:09:39', '2018-04-03 14:06:54');
INSERT INTO `f_oldtree` VALUES ('67', '54', '3', '4', '2018-04-09 10:59:00', '2018-04-03 14:10:02');
INSERT INTO `f_oldtree` VALUES ('127', '55', '3', '4', '2018-04-10 14:52:58', '2018-04-09 10:59:18');
INSERT INTO `f_oldtree` VALUES ('128', '57', '3', '4', '2018-04-10 16:26:04', '2018-04-10 14:54:46');
INSERT INTO `f_oldtree` VALUES ('129', '50', '3', '3', '2018-04-10 16:26:10', '2018-04-02 18:22:19');
INSERT INTO `f_oldtree` VALUES ('130', '59', '3', '4', '2018-04-10 16:38:10', '2018-04-10 16:26:19');
INSERT INTO `f_oldtree` VALUES ('131', '1', '3', '1', '2018-04-10 16:38:35', '2018-03-26 14:27:02');
INSERT INTO `f_oldtree` VALUES ('132', '61', '3', '4', '2018-04-11 09:57:18', '2018-04-10 16:39:16');
INSERT INTO `f_oldtree` VALUES ('133', '58', '3', '3', '2018-04-11 09:57:24', '2018-04-10 16:26:14');
INSERT INTO `f_oldtree` VALUES ('134', '2', '3', '2', '2018-04-11 09:57:35', '2018-03-27 10:27:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_steal
-- ----------------------------
INSERT INTO `f_steal` VALUES ('1', '3', '21', '5', '2018-03-23 17:16:39');

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
INSERT INTO `f_trade` VALUES ('1', '3', '21', '1231', '1107', '2018-03-29 15:44:23');
INSERT INTO `f_trade` VALUES ('2', '21', '3', '1231', '1107', '2018-03-29 15:44:59');
INSERT INTO `f_trade` VALUES ('3', '3', '21', '1233', '1109', '2018-03-29 15:47:22');
INSERT INTO `f_trade` VALUES ('4', '3', '21', '11', '9', '2018-03-29 15:49:32');
INSERT INTO `f_trade` VALUES ('6', '3', '3', '10', '9', '2018-03-30 11:22:45');
INSERT INTO `f_trade` VALUES ('7', '3', '3', '10', '9', '2018-03-30 11:24:01');
INSERT INTO `f_trade` VALUES ('8', '3', '3', '10', '9', '2018-03-30 11:25:14');
INSERT INTO `f_trade` VALUES ('9', '3', '3', '1', '0.9', '2018-03-30 11:26:35');
INSERT INTO `f_trade` VALUES ('10', '3', '3', '1', '0.9', '2018-03-30 11:27:10');
INSERT INTO `f_trade` VALUES ('11', '3', '21', '220', '200', '2018-04-10 11:00:43');
INSERT INTO `f_trade` VALUES ('12', '3', '21', '220', '200', '2018-04-10 11:03:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_tree
-- ----------------------------
INSERT INTO `f_tree` VALUES ('3', '21', '1', '2018-03-21 17:27:39');
INSERT INTO `f_tree` VALUES ('60', '3', '1', '2018-04-10 16:38:50');
INSERT INTO `f_tree` VALUES ('62', '3', '2', '2018-04-11 09:59:15');
INSERT INTO `f_tree` VALUES ('63', '3', '2', '2018-04-11 09:59:15');
INSERT INTO `f_tree` VALUES ('64', '3', '3', '2018-04-11 09:59:29');
INSERT INTO `f_tree` VALUES ('65', '3', '3', '2018-04-11 09:59:29');
INSERT INTO `f_tree` VALUES ('66', '3', '3', '2018-04-11 09:59:29');
INSERT INTO `f_tree` VALUES ('67', '3', '4', '2018-04-11 09:59:34');
INSERT INTO `f_tree` VALUES ('68', '3', '6', '2018-04-11 10:58:06');
INSERT INTO `f_tree` VALUES ('69', '3', '5', '2018-04-11 11:53:52');
INSERT INTO `f_tree` VALUES ('70', '3', '7', '2018-04-12 10:04:39');
INSERT INTO `f_tree` VALUES ('71', '21', '2', '2018-04-12 11:59:26');

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
INSERT INTO `f_treecycle` VALUES ('1', '1', '110.00');
INSERT INTO `f_treecycle` VALUES ('2', '2', '100.00');
INSERT INTO `f_treecycle` VALUES ('3', '3', '90.00');
INSERT INTO `f_treecycle` VALUES ('4', '4', '80.00');
INSERT INTO `f_treecycle` VALUES ('5', '5', '70.00');
INSERT INTO `f_treecycle` VALUES ('6', '6', '60.00');
INSERT INTO `f_treecycle` VALUES ('7', '7', null);
INSERT INTO `f_treecycle` VALUES ('8', '8', null);
INSERT INTO `f_treecycle` VALUES ('9', '9', null);
INSERT INTO `f_treecycle` VALUES ('10', '10', null);
INSERT INTO `f_treecycle` VALUES ('11', '11', null);
INSERT INTO `f_treecycle` VALUES ('12', '12', null);
INSERT INTO `f_treecycle` VALUES ('13', '13', null);
INSERT INTO `f_treecycle` VALUES ('14', '14', null);
INSERT INTO `f_treecycle` VALUES ('15', '15', null);

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
INSERT INTO `gclassify` VALUES ('1', '1', '0', '0', '年份');
INSERT INTO `gclassify` VALUES ('2', '1', '1', '0,1', '1990');
INSERT INTO `gclassify` VALUES ('3', '1', '1', '0,1', '1991');
INSERT INTO `gclassify` VALUES ('4', '1', '0', '0', '规格');
INSERT INTO `gclassify` VALUES ('5', '1', '4', '0,4', '2瓶');
INSERT INTO `gclassify` VALUES ('6', '1', '4', '0,4', '4瓶');
INSERT INTO `gclassify` VALUES ('7', '1', '1', '0,1', '1992');
INSERT INTO `gclassify` VALUES ('8', '1', '1', '0,1', '1993');
INSERT INTO `gclassify` VALUES ('9', '1', '4', '0,4', '6瓶');
INSERT INTO `gclassify` VALUES ('10', '1', '4', '0,4', '8瓶');
INSERT INTO `gclassify` VALUES ('11', '2', '0', '0', '尺寸');
INSERT INTO `gclassify` VALUES ('12', '2', '11', '0,11', '2米');
INSERT INTO `gclassify` VALUES ('13', '2', '11', '0,11', '2.5米');
INSERT INTO `gclassify` VALUES ('14', '2', '11', '0,11', '3米');
INSERT INTO `gclassify` VALUES ('15', '2', '11', '0,11', '4米');
INSERT INTO `gclassify` VALUES ('16', '2', '0', '0', '颜色');
INSERT INTO `gclassify` VALUES ('17', '2', '16', '0,16', '红红');
INSERT INTO `gclassify` VALUES ('18', '2', '16', '0,16', '黄黄');
INSERT INTO `gclassify` VALUES ('19', '2', '16', '0,16', '蓝蓝');
INSERT INTO `gclassify` VALUES ('20', '2', '16', '0,16', '绿绿');
INSERT INTO `gclassify` VALUES ('21', '3', '0', '0', '品牌');
INSERT INTO `gclassify` VALUES ('22', '3', '21', '0,21', '海尔');
INSERT INTO `gclassify` VALUES ('23', '3', '21', '0,21', 'TCL');
INSERT INTO `gclassify` VALUES ('24', '3', '21', '0,21', '美的');
INSERT INTO `gclassify` VALUES ('25', '3', '21', '0,21', '小天鹅');
INSERT INTO `gclassify` VALUES ('26', '3', '0', '0', '规格');
INSERT INTO `gclassify` VALUES ('27', '3', '26', '0,26', '6公斤');
INSERT INTO `gclassify` VALUES ('28', '3', '26', '0,26', '8公斤');
INSERT INTO `gclassify` VALUES ('29', '3', '26', '0,26', '10公斤');
INSERT INTO `gclassify` VALUES ('30', '3', '26', '0,26', '12公斤');
INSERT INTO `gclassify` VALUES ('31', '4', '0', '0', '品牌');
INSERT INTO `gclassify` VALUES ('32', '4', '31', '0,31', 'ofo');
INSERT INTO `gclassify` VALUES ('33', '4', '31', '0,31', '摩拜');
INSERT INTO `gclassify` VALUES ('34', '4', '31', '0,31', '酷奇');
INSERT INTO `gclassify` VALUES ('35', '4', '31', '0,31', 'hello bike');
INSERT INTO `gclassify` VALUES ('36', '4', '0', '0', '颜色');
INSERT INTO `gclassify` VALUES ('37', '4', '36', '0,36', '红蓝');
INSERT INTO `gclassify` VALUES ('38', '4', '36', '0,36', '黑白');
INSERT INTO `gclassify` VALUES ('39', '4', '36', '0,36', '黄绿');
INSERT INTO `gclassify` VALUES ('40', '4', '36', '0,36', '紫橙');
INSERT INTO `gclassify` VALUES ('41', '5', '0', '0', '颜色');
INSERT INTO `gclassify` VALUES ('42', '5', '41', '0,41', '白色');
INSERT INTO `gclassify` VALUES ('43', '5', '41', '0,41', '黑色');
INSERT INTO `gclassify` VALUES ('44', '5', '41', '0,41', '灰色');
INSERT INTO `gclassify` VALUES ('45', '5', '41', '0,41', '彩色');
INSERT INTO `gclassify` VALUES ('46', '5', '0', '0', '品牌');
INSERT INTO `gclassify` VALUES ('47', '5', '46', '0,46', '菲克');
INSERT INTO `gclassify` VALUES ('48', '5', '46', '0,46', '懒熊');
INSERT INTO `gclassify` VALUES ('49', '5', '46', '0,46', '坦特');
INSERT INTO `gclassify` VALUES ('50', '5', '46', '0,46', '酷欧');
INSERT INTO `gclassify` VALUES ('51', '6', '0', '0', '品牌');
INSERT INTO `gclassify` VALUES ('52', '6', '51', '0,51', 'nike');
INSERT INTO `gclassify` VALUES ('53', '6', '51', '0,51', 'anta');
INSERT INTO `gclassify` VALUES ('54', '6', '51', '0,51', 'pike');
INSERT INTO `gclassify` VALUES ('55', '6', '51', '0,51', 'erke');
INSERT INTO `gclassify` VALUES ('56', '6', '0', '0', '尺码');
INSERT INTO `gclassify` VALUES ('57', '6', '56', '0,56', '36');
INSERT INTO `gclassify` VALUES ('58', '6', '56', '0,56', '38');
INSERT INTO `gclassify` VALUES ('59', '6', '56', '0,56', '40');
INSERT INTO `gclassify` VALUES ('60', '6', '56', '0,56', '42');
INSERT INTO `gclassify` VALUES ('69', '7', '0', '0', '颜色');
INSERT INTO `gclassify` VALUES ('70', '7', '69', '0,69', 'red');
INSERT INTO `gclassify` VALUES ('71', '7', '69', '0,69', 'yellow');
INSERT INTO `gclassify` VALUES ('72', '7', '69', '0,69', 'blue');
INSERT INTO `gclassify` VALUES ('73', '7', '69', '0,69', 'black');
INSERT INTO `gclassify` VALUES ('74', '7', '0', '0', '规格');
INSERT INTO `gclassify` VALUES ('75', '7', '74', '0,74', '单机');
INSERT INTO `gclassify` VALUES ('76', '7', '74', '0,74', '双击');
INSERT INTO `gclassify` VALUES ('77', '7', '74', '0,74', '三连击');

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
INSERT INTO `goods` VALUES ('1', '波多尔红酒', '1', '1', '9999000', '9999000', '1qw2we3e23ew.jpg', null, '9999', '2018-03-01 05:35:21');
INSERT INTO `goods` VALUES ('2', '阿斯蒂芬大沙发', '2', '17', '500', '50', '34t53rey43ey.jpg', null, '1000', '2018-03-03 16:25:40');
INSERT INTO `goods` VALUES ('3', '百转千回洗衣机', '3', '33', '200', '100', '45try45ytretyerty.jpg', null, '500', '2018-03-04 09:53:49');
INSERT INTO `goods` VALUES ('4', '皇家国际自行车', '2', '49', '600', '50', '1234567890.jpg', null, '1200', '2018-03-04 17:45:59');
INSERT INTO `goods` VALUES ('5', '奥斯卡绝代录音机', '3', '65', '300', '200', 'qwe123weqwe12e.jpg', null, '1000', '2018-03-05 10:01:18');
INSERT INTO `goods` VALUES ('6', '时代峻峰运动鞋', '4', '81', '800', '60', 'qweq123123.jpg', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE5BA8AE5898DE6988EE69C88E585893C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE79691E698AFE59CB0E4B88AE99C9C3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE4B8BEE5A4B4E69C9BE6988EE69C883C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE4BD8EE5A4B4E6809DE69585E4B9A13C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223E3C696D67207372633D222F75656469746F722F7068702F75706C6F61642F696D6167652F32303138303332312F313532313632383437363536373131352E6A706722207469746C653D22313532313632383437363536373131352E6A70672220616C743D22753D323233393134363530322C31363530313335313626616D703B666D3D323726616D703B67703D302E6A7067222077696474683D2231343722206865696768743D22313633222F3E3C2F703E, '1200', '2018-03-05 11:23:32');
INSERT INTO `goods` VALUES ('7', '精细化娱乐鼠标', '1', '107', '20', '10', '', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE7A6BBE7A6BBE58E9FE4B88AE88D893C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE4B880E5B281E4B880E69EAFE88DA33C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE9878EE781ABE783A7E4B88DE5B0BD3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE698A5E9A38EE590B9E58F88E7949F3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223E3C696D67207372633D222F75656469746F722F7068702F75706C6F61642F696D6167652F32303138303332312F313532313631383739353130373534392E6A706722207469746C653D22313532313631383739353130373534392E6A70672220616C743D22753D343136363732313839312C3135303334343437363026616D703B666D3D323726616D703B67703D302E6A7067222077696474683D2231363522206865696768743D22313638222F3E3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223E3C696D67207372633D222F75656469746F722F7068702F75706C6F61642F696D6167652F32303138303332312F313532313631383735303137323630302E6A706722207469746C653D22313532313631383735303137323630302E6A70672220616C743D22753D313132363338303034302C3333363634363532333326616D703B666D3D323726616D703B67703D302E6A7067222077696474683D2231383122206865696768743D22323131222F3E3C2F703E, '50', '2018-03-19 14:14:41');

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
INSERT INTO `goodsimg` VALUES ('1', '1', '1qw2we3e23ew.jpg', '2018-03-02 11:30:18');
INSERT INTO `goodsimg` VALUES ('2', '2', '34t53rey43ey.jpg', '2018-03-02 04:30:24');
INSERT INTO `goodsimg` VALUES ('3', '3', '45try45ytretyerty.jpg', '2018-03-03 17:30:31');
INSERT INTO `goodsimg` VALUES ('4', '4', '1234567890.jpg', '2018-03-04 11:35:40');
INSERT INTO `goodsimg` VALUES ('5', '5', 'qwe123weqwe12e.jpg', '2018-03-04 19:30:49');
INSERT INTO `goodsimg` VALUES ('6', '6', 'qweq123123.jpg', '2018-03-05 06:30:59');
INSERT INTO `goodsimg` VALUES ('7', '1', 'asdf32523345.jpg', '2018-03-16 11:32:33');
INSERT INTO `goodsimg` VALUES ('8', '2', 'wrtew2345234.jpg', '2018-03-16 11:32:58');
INSERT INTO `goodsimg` VALUES ('9', '3', 'rteert546745547.jpg', '2018-03-16 11:33:32');
INSERT INTO `goodsimg` VALUES ('10', '4', 'fghfd47645567.jpg', '2018-03-16 11:33:56');
INSERT INTO `goodsimg` VALUES ('11', '5', 'hgjkhk546754764567.jpg', '2018-03-16 11:34:18');
INSERT INTO `goodsimg` VALUES ('12', '6', 'ufghghj4764574567.jpg', '2018-03-16 11:34:40');
INSERT INTO `goodsimg` VALUES ('13', '1', 'sdfgsd3425636433245.jpg', '2018-03-16 11:35:01');
INSERT INTO `goodsimg` VALUES ('14', '2', 'dfgsdgsd4564375467.jpg', '2018-03-16 11:35:22');
INSERT INTO `goodsimg` VALUES ('15', '3', 'fdhdfh4754745546.jpg', '2018-03-16 11:35:40');
INSERT INTO `goodsimg` VALUES ('16', '6', '5aaf542605dc0.jpg', '2018-03-19 14:09:43');
INSERT INTO `goodsimg` VALUES ('17', '7', '5aaf556deec50.jpg', '2018-03-19 14:15:11');
INSERT INTO `goodsimg` VALUES ('18', '7', '5aaf557d4ca90.jpg', '2018-03-19 14:15:26');
INSERT INTO `goodsimg` VALUES ('19', '7', '5aaf558cf1f18.jpg', '2018-03-19 14:15:42');
INSERT INTO `goodsimg` VALUES ('20', '4', '5aaf5fc9e82d8.jpg', '2018-03-19 14:59:22');
INSERT INTO `goodsimg` VALUES ('21', '5', '5aaf5fdc6be90.jpg', '2018-03-19 14:59:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('1', '3', '4', '0', '4', '2018-04-03 14:06:21');
INSERT INTO `letter` VALUES ('2', '3', '2', '0', '4', '2018-04-03 14:06:54');
INSERT INTO `letter` VALUES ('3', '3', '4', '0', '4', '2018-04-03 14:09:39');
INSERT INTO `letter` VALUES ('4', '3', '2', '0', '4', '2018-04-03 14:10:02');
INSERT INTO `letter` VALUES ('5', '3', '3', '0', '26.4', '2018-04-08 09:03:39');
INSERT INTO `letter` VALUES ('6', '3', '7', '21', '0.3', '2018-04-08 09:40:06');
INSERT INTO `letter` VALUES ('7', '21', '8', '3', '0.3', '2018-04-08 09:40:06');
INSERT INTO `letter` VALUES ('8', '3', '3', '0', '26.4', '2018-04-09 10:58:50');
INSERT INTO `letter` VALUES ('9', '3', '4', '0', '4', '2018-04-09 10:59:00');
INSERT INTO `letter` VALUES ('10', '3', '2', '0', '4', '2018-04-09 10:59:18');
INSERT INTO `letter` VALUES ('11', '3', '2', '0', '4', '2018-04-09 10:59:19');
INSERT INTO `letter` VALUES ('12', '3', '7', '21', '0.3', '2018-04-09 18:32:02');
INSERT INTO `letter` VALUES ('13', '21', '8', '3', '0.3', '2018-04-09 18:32:02');
INSERT INTO `letter` VALUES ('14', '3', '7', '21', '0.3', '2018-04-10 10:01:01');
INSERT INTO `letter` VALUES ('15', '21', '8', '3', '0.3', '2018-04-10 10:01:01');
INSERT INTO `letter` VALUES ('16', '3', '7', '21', '0.3', '2018-04-10 10:05:55');
INSERT INTO `letter` VALUES ('17', '21', '8', '3', '0.3', '2018-04-10 10:05:55');
INSERT INTO `letter` VALUES ('18', '3', '5', '21', '220', '2018-04-10 11:00:43');
INSERT INTO `letter` VALUES ('19', '21', '6', '3', '200', '2018-04-10 11:00:43');
INSERT INTO `letter` VALUES ('20', '3', '11', '0', '20', '2018-04-10 11:00:43');
INSERT INTO `letter` VALUES ('21', '3', '5', '21', '220', '2018-04-10 11:03:21');
INSERT INTO `letter` VALUES ('22', '21', '6', '3', '200', '2018-04-10 11:03:21');
INSERT INTO `letter` VALUES ('23', '3', '11', '0', '20', '2018-04-10 11:03:21');
INSERT INTO `letter` VALUES ('24', '3', '3', '0', '33', '2018-04-10 11:27:24');
INSERT INTO `letter` VALUES ('25', '3', '4', '0', '4', '2018-04-10 14:52:58');
INSERT INTO `letter` VALUES ('26', '3', '2', '0', '4', '2018-04-10 14:54:46');
INSERT INTO `letter` VALUES ('27', '3', '4', '0', '4', '2018-04-10 16:26:04');
INSERT INTO `letter` VALUES ('28', '3', '4', '0', '3', '2018-04-10 16:26:10');
INSERT INTO `letter` VALUES ('29', '3', '2', '0', '3', '2018-04-10 16:26:14');
INSERT INTO `letter` VALUES ('30', '3', '2', '0', '4', '2018-04-10 16:26:19');
INSERT INTO `letter` VALUES ('31', '3', '4', '0', '4', '2018-04-10 16:38:10');
INSERT INTO `letter` VALUES ('32', '3', '4', '0', '1', '2018-04-10 16:38:35');
INSERT INTO `letter` VALUES ('33', '3', '2', '0', '1', '2018-04-10 16:38:50');
INSERT INTO `letter` VALUES ('34', '3', '2', '0', '4', '2018-04-10 16:39:16');
INSERT INTO `letter` VALUES ('35', '3', '3', '0', '6.6', '2018-04-11 09:56:40');
INSERT INTO `letter` VALUES ('36', '3', '4', '0', '4', '2018-04-11 09:57:18');
INSERT INTO `letter` VALUES ('37', '3', '4', '0', '3', '2018-04-11 09:57:24');
INSERT INTO `letter` VALUES ('38', '3', '4', '0', '2', '2018-04-11 09:57:35');
INSERT INTO `letter` VALUES ('39', '3', '2', '0', '2', '2018-04-11 09:59:15');
INSERT INTO `letter` VALUES ('40', '3', '2', '0', '2', '2018-04-11 09:59:15');
INSERT INTO `letter` VALUES ('41', '3', '2', '0', '3', '2018-04-11 09:59:29');
INSERT INTO `letter` VALUES ('42', '3', '2', '0', '3', '2018-04-11 09:59:29');
INSERT INTO `letter` VALUES ('43', '3', '2', '0', '3', '2018-04-11 09:59:29');
INSERT INTO `letter` VALUES ('44', '3', '2', '0', '4', '2018-04-11 09:59:34');
INSERT INTO `letter` VALUES ('45', '3', '2', '0', '6', '2018-04-11 10:58:06');
INSERT INTO `letter` VALUES ('46', '3', '2', '0', '5', '2018-04-11 11:53:52');
INSERT INTO `letter` VALUES ('47', '3', '2', '0', '7', '2018-04-12 10:04:39');
INSERT INTO `letter` VALUES ('48', '3', '7', '21', '0.3', '2018-04-12 11:00:31');
INSERT INTO `letter` VALUES ('49', '21', '8', '3', '0.3', '2018-04-12 11:00:31');
INSERT INTO `letter` VALUES ('50', '3', '7', '21', '0.3', '2018-04-12 11:00:46');
INSERT INTO `letter` VALUES ('51', '21', '8', '3', '0.3', '2018-04-12 11:00:46');
INSERT INTO `letter` VALUES ('52', '3', '7', '21', '0.3', '2018-04-12 11:03:59');
INSERT INTO `letter` VALUES ('53', '21', '8', '3', '0.3', '2018-04-12 11:03:59');
INSERT INTO `letter` VALUES ('54', '21', '2', '0', '2', '2018-04-12 11:59:26');
INSERT INTO `letter` VALUES ('55', '3', '3', '0', '59.4', '2018-04-12 16:11:03');

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
INSERT INTO `lootgoods` VALUES ('1', '3', '4', '6', '2018-03-20 15:51:00');
INSERT INTO `lootgoods` VALUES ('2', '3', '3', '16', '2018-03-20 16:08:19');
INSERT INTO `lootgoods` VALUES ('3', '3', '1', '71', '2018-04-02 15:53:01');
INSERT INTO `lootgoods` VALUES ('4', '3', '2', '100', '2018-03-26 16:43:59');
INSERT INTO `lootgoods` VALUES ('5', '21', '1', '4', '2018-03-20 16:38:17');
INSERT INTO `lootgoods` VALUES ('6', '21', '2', '6', '2018-03-20 16:38:23');

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
INSERT INTO `manager` VALUES ('1', '123456', '4297f44b13955235245b2497399d7a93', '1', '2018-03-17 21:46:55');
INSERT INTO `manager` VALUES ('2', 'qwe', '46f94c8de14fb36680850768ff1b7f2a', '0', '0000-00-00 00:00:00');

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
INSERT INTO `onemoney` VALUES ('1', '海飞丝护发套装', '300', '2018-04-02 10:40:01', '24', '75', '5ab89a2034008.jpg');
INSERT INTO `onemoney` VALUES ('2', '飘柔洗发露', '110', '2018-04-02 10:30:00', '48', '110', '5ab89a117d3e8.jpg');
INSERT INTO `onemoney` VALUES ('3', '云南白药牙膏', '200', '2018-04-02 11:28:00', '48', '16', '5ab899af3efd0.jpg');
INSERT INTO `onemoney` VALUES ('4', '蓝月亮洗衣液', '350', '2018-04-02 16:42:41', '24', '6', '5ab314c0f1748.jpg');

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
INSERT INTO `order` VALUES ('45', '3', '1', '5', '9', '1', '9a81db56e1ac4f72835e05ff6d2df450', '2018-03-18 00:20:21', '25');
INSERT INTO `order` VALUES ('46', '3', '1', '16', '2', '2', 'd1436e33059b42551c822b4c2f667b9b', '2018-03-18 00:20:21', '25');
INSERT INTO `order` VALUES ('47', '3', '1', '3', '1', '3', '51bf0c23429d68b745798320c56c285e', '2018-03-18 00:20:21', '25');
INSERT INTO `order` VALUES ('48', '3', '1', '2', '1', '1', '804615a96974ec300ef06442c6128e3d', '2018-03-18 00:20:21', '25');
INSERT INTO `order` VALUES ('49', '3', '1', '4', '6', '2', '22f4cc2d2460e035879ba3b1c3e2c8de', '2018-03-18 00:20:21', '25');
INSERT INTO `order` VALUES ('50', '3', '1', '5', '9', '1', 'e33dda8d324f4f804ed95dcf8727b467', '2018-03-18 00:20:49', '25');
INSERT INTO `order` VALUES ('51', '3', '1', '16', '2', '1', 'd614d8942cc46229f3cb4d29153f55eb', '2018-03-18 00:20:49', '25');
INSERT INTO `order` VALUES ('52', '3', '1', '3', '1', '3', '1e23400175731e6def761ce984311c84', '2018-03-18 00:20:49', '25');
INSERT INTO `order` VALUES ('53', '3', '1', '2', '1', '1', '9a18a6a325e66f643d7f6d0c6ceb99af', '2018-03-18 00:20:49', '25');
INSERT INTO `order` VALUES ('54', '3', '1', '4', '6', '2', 'fda70ab76651357721bd3336b481bf0c', '2018-03-18 00:20:49', '25');
INSERT INTO `order` VALUES ('55', '3', '1', '5', '9', '1', '4cd6ffda356c9545c14dae07d5e5a2b9', '2018-03-18 00:20:59', '25');
INSERT INTO `order` VALUES ('56', '3', '1', '16', '2', '3', '5f3e5f5c46f673c5a3ab6913d2b66d6c', '2018-03-18 00:20:59', '25');
INSERT INTO `order` VALUES ('57', '3', '1', '3', '1', '1', '8d057061fe9e5bc6b43eafaece8953a5', '2018-03-18 00:20:59', '25');
INSERT INTO `order` VALUES ('58', '3', '1', '2', '1', '3', 'f2bfa849ad398c0cad9b36c120d16e85', '2018-03-18 00:20:59', '25');
INSERT INTO `order` VALUES ('59', '3', '1', '4', '6', '1', 'cd0e21eac784cdab00012d3c060fb891', '2018-03-18 00:20:59', '25');
INSERT INTO `order` VALUES ('60', '3', '4', '49', '2', '1', 'c392a464efc103e23d27f5919f7cdfbf', '2018-03-19 18:56:13', '25');
INSERT INTO `order` VALUES ('61', '3', '5', '65', '2', '1', 'b85cd2175805e21afc51f51873969643', '2018-03-19 18:56:13', '25');
INSERT INTO `order` VALUES ('62', '3', '6', '81', '1', '1', '7b638afaf5ff464752941152ba2dcee2', '2018-03-19 18:56:13', '25');
INSERT INTO `order` VALUES ('63', '3', '4', '49', '2', '1', 'aad5b88ff0e76663957299193878b547', '2018-03-21 09:36:35', '25');
INSERT INTO `order` VALUES ('64', '3', '1', '7', '2', '1', '375c6aa9bd3ebc868261ead96f3410e1', '2018-03-21 09:44:40', '25');
INSERT INTO `order` VALUES ('65', '3', '5', '65', '2', '1', '020c3a5a3986963a8c19a42951fa9924', '2018-03-21 10:08:54', '25');
INSERT INTO `order` VALUES ('66', '3', '6', '81', '1', '1', '365a74d1f45ceed30d167ff9df62ac2d', '2018-03-21 10:08:54', '25');
INSERT INTO `order` VALUES ('67', '3', '1', '16', '5', '1', '5b5e26a5cbaabd0431b8440c2d331068', '2018-03-21 10:08:54', '25');
INSERT INTO `order` VALUES ('68', '3', '5', '65', '2', '1', '70f93f16c33c7d8d335d7b33e4c18b11', '2018-03-21 10:09:09', '25');
INSERT INTO `order` VALUES ('69', '3', '6', '81', '1', '1', 'f5c03ae9e69007e3efeae4f35e4f907f', '2018-03-21 10:09:09', '25');
INSERT INTO `order` VALUES ('70', '3', '1', '16', '5', '1', 'bf1f1d616b1842f839f2cc423196696f', '2018-03-21 10:09:09', '25');
INSERT INTO `order` VALUES ('71', '3', '6', '93', '3', '1', 'ad139712618ceb27f3e609402fc07700', '2018-03-21 10:18:17', '25');
INSERT INTO `order` VALUES ('72', '3', '4', '49', '2', '1', '723d82c173ab9420239217cca2b509e0', '2018-03-21 10:18:17', '25');
INSERT INTO `order` VALUES ('73', '3', '5', '65', '2', '1', '127e0b5d821f6964fc05db223a31472f', '2018-03-21 10:18:17', '25');
INSERT INTO `order` VALUES ('74', '3', '6', '81', '1', '1', '1b5f6a396475ca720da0aa5e2998774b', '2018-03-21 10:18:17', '25');
INSERT INTO `order` VALUES ('75', '3', '6', '93', '3', '1', 'c6276824d9604b2299c10e0badcfe99a', '2018-03-21 10:21:26', '25');
INSERT INTO `order` VALUES ('76', '3', '4', '49', '2', '1', 'becba8d14a3b2db0e4a15606ef64994b', '2018-03-21 10:21:26', '25');
INSERT INTO `order` VALUES ('77', '3', '5', '65', '2', '1', '118ae1d07a9c8341db62368f3c47828b', '2018-03-21 10:21:26', '25');
INSERT INTO `order` VALUES ('78', '3', '6', '81', '1', '1', 'e2b4f95890d6fd318f2d7b2b52d7b2a3', '2018-03-21 10:21:26', '25');
INSERT INTO `order` VALUES ('79', '3', '6', '93', '3', '1', '7af2cc4846f263d1292646ba3f621718', '2018-03-21 10:23:45', '25');
INSERT INTO `order` VALUES ('80', '3', '4', '49', '2', '1', '54b21984ee7716e643e16e9c29368122', '2018-03-21 10:23:45', '25');
INSERT INTO `order` VALUES ('81', '3', '5', '65', '2', '1', 'ad9d317a392e1e83f8de327d76f429b0', '2018-03-21 10:23:45', '25');
INSERT INTO `order` VALUES ('82', '3', '6', '81', '1', '1', '52209bb11d13d2395b0a55ec3ada88b8', '2018-03-21 10:23:45', '25');
INSERT INTO `order` VALUES ('83', '3', '6', '93', '3', '1', '23a6873fbce221804037a2553e3b5d94', '2018-03-21 10:25:59', '25');
INSERT INTO `order` VALUES ('84', '3', '4', '49', '2', '1', '4fdc1a7deedd243670ecbceb88af94d1', '2018-03-21 10:25:59', '25');
INSERT INTO `order` VALUES ('85', '3', '5', '65', '2', '1', '1af071ff9aaff370d2ea0c60ca5d6b9d', '2018-03-21 10:25:59', '25');
INSERT INTO `order` VALUES ('86', '3', '6', '81', '1', '1', '0f6e59f59c0f79be7364755cc17ca1b2', '2018-03-21 10:25:59', '25');
INSERT INTO `order` VALUES ('87', '3', '2', '17', '3', '1', '16c7a8a16fe01ba6f1a7147ceef74643', '2018-03-21 17:00:44', '21');
INSERT INTO `order` VALUES ('88', '3', '1', '3', '1', '1', '6ceae055e46a6b3640171f6d3f745c52', '2018-03-21 17:00:44', '21');
INSERT INTO `order` VALUES ('89', '3', '1', '2', '2', '1', '93218e8153f72bf4b30339d485402ce2', '2018-03-21 17:00:44', '21');
INSERT INTO `order` VALUES ('90', '3', '1', '2', '2', '1', '95701b027a3b9a9a345e9d451fd6a686', '2018-03-21 17:02:38', '21');

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
  `transaction_fee` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '交易手续费',
  `trading_limits` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '交易额度百分比',
  `user_steal` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '用户偷取百分比',
  `trade_exchange` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '交易兑换百分比',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('1', '330', '300', '果然农场', '30', '10', '300', '5', '10');

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
INSERT INTO `shopcar` VALUES ('5', '3', '1', '16', '5', '2018-03-14 15:27:26');
INSERT INTO `shopcar` VALUES ('20', '3', '3', '34', '1', '2018-03-18 00:47:35');
INSERT INTO `shopcar` VALUES ('15', '3', '1', '4', '6', '2018-03-17 12:43:10');
INSERT INTO `shopcar` VALUES ('16', '3', '1', '1', '7', '2018-03-17 12:47:07');
INSERT INTO `shopcar` VALUES ('25', '3', '5', '73', '2', '2018-03-18 01:21:28');
INSERT INTO `shopcar` VALUES ('26', '3', '6', '88', '3', '2018-03-18 01:23:03');
INSERT INTO `shopcar` VALUES ('27', '3', '7', '97', '2', '2018-03-19 18:04:55');
INSERT INTO `shopcar` VALUES ('28', '3', '1', '6', '1', '2018-03-20 09:38:34');
INSERT INTO `shopcar` VALUES ('29', '3', '1', '5', '1', '2018-03-21 09:41:26');
INSERT INTO `shopcar` VALUES ('30', '3', '6', '81', '5', '2018-03-31 14:31:43');
INSERT INTO `shopcar` VALUES ('31', '3', '2', '17', '1', '2018-04-02 16:28:07');

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
  `paypass` varchar(32) COLLATE utf8_bin NOT NULL,
  `referee` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '推荐人',
  `shopcar_num` int(11) NOT NULL,
  `registime` datetime NOT NULL COMMENT '注册时间',
  `faceimg` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `recomcode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '小桥流水人家', '6734d831b05187c6a73756786ed62a20', '撒旦法', '1', '15238617326', '15617801519', '356012', '6734d831b05187c6a73756786ed62a20', '15617801519', '4', '2018-03-13 06:50:26', '5abf4ba569e88.jpg', '20180331205059356012.jpg');
INSERT INTO `user` VALUES ('21', '15617801519', '6734d831b05187c6a73756786ed62a20', null, '1', '15617801519', null, '568792', '', '15238617326', '0', '2018-03-20 16:37:04', 'defaultfaceimg.png', null);
INSERT INTO `user` VALUES ('22', '西风瘦马', '', null, null, '123', null, '', '', '15238617326', '0', '0000-00-00 00:00:00', 'defaultfaceimg.png', null);
INSERT INTO `user` VALUES ('23', '北校寒风', '', null, null, '1234', null, '', '', '123', '0', '0000-00-00 00:00:00', null, null);
INSERT INTO `user` VALUES ('24', '风萧萧', '', null, null, '12', null, '', '', '1234', '0', '0000-00-00 00:00:00', null, null);
INSERT INTO `user` VALUES ('25', '江南吹雪', '', null, null, '156', null, '', '', '123', '0', '0000-00-00 00:00:00', null, null);
INSERT INTO `user` VALUES ('26', '沐风银蛇', '', null, null, '127', null, '', '', '1234', '0', '0000-00-00 00:00:00', null, null);
INSERT INTO `user` VALUES ('27', '冷无相求', '', null, null, '138', null, '', '', '', '0', '0000-00-00 00:00:00', null, null);

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
INSERT INTO `winer` VALUES ('1130', '1', '3', '2');
INSERT INTO `winer` VALUES ('1147', '4', '3www', '98');
INSERT INTO `winer` VALUES ('1151', '3', '岁月是把杀猪刀', '65');
