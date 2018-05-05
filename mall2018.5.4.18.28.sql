/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-04 18:28:52
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `addfruit` VALUES ('26', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:26');
INSERT INTO `addfruit` VALUES ('27', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:29');
INSERT INTO `addfruit` VALUES ('28', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:31');
INSERT INTO `addfruit` VALUES ('29', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:31');
INSERT INTO `addfruit` VALUES ('30', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:31');
INSERT INTO `addfruit` VALUES ('31', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:31');
INSERT INTO `addfruit` VALUES ('32', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:32');
INSERT INTO `addfruit` VALUES ('33', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:32');
INSERT INTO `addfruit` VALUES ('34', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:32');
INSERT INTO `addfruit` VALUES ('35', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:32');
INSERT INTO `addfruit` VALUES ('36', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:32');
INSERT INTO `addfruit` VALUES ('37', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:34');
INSERT INTO `addfruit` VALUES ('38', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:35');
INSERT INTO `addfruit` VALUES ('39', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:35');
INSERT INTO `addfruit` VALUES ('40', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:35');
INSERT INTO `addfruit` VALUES ('41', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:35');
INSERT INTO `addfruit` VALUES ('42', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:35');
INSERT INTO `addfruit` VALUES ('43', '15238617326', null, '200', '自由充值', '2018-04-20 10:10:47');
INSERT INTO `addfruit` VALUES ('44', '15617801519', null, '20', '15238617326充值赠送', '2018-04-20 10:10:47');
INSERT INTO `addfruit` VALUES ('45', '15238617326', null, '20', '果子充值', '2018-04-20 10:14:29');
INSERT INTO `addfruit` VALUES ('46', '15238617326', null, '20', '果子充值', '2018-04-20 10:15:27');
INSERT INTO `addfruit` VALUES ('47', '15238617326', null, '20', 'ZIYOUCHONGZHI', '2018-04-20 10:17:38');
INSERT INTO `addfruit` VALUES ('48', '15238617326', null, '-1', 'ZIYOUCHONGZHI', '2018-04-20 10:18:57');
INSERT INTO `addfruit` VALUES ('49', '15238617326', null, '-1', 'ZIYOUCHONGZHI', '2018-04-20 10:19:25');
INSERT INTO `addfruit` VALUES ('53', '15238617326', null, '1', '', '2018-04-20 10:25:16');
INSERT INTO `addfruit` VALUES ('54', '15617801519', null, '-1', '15238617326充值赠送', '2018-04-20 10:27:17');
INSERT INTO `addfruit` VALUES ('55', '15238617326', null, '300', '开地充值', '2018-05-04 11:46:35');
INSERT INTO `addfruit` VALUES ('56', '15238617326', null, '30000', '开地充值', '2018-05-04 14:37:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('15', '3', '花花', '17868417352', '萨芬撒打发斯蒂芬', '甘肃省/武威市/天祝藏族自治县', '0', '2018-03-15 19:39:58');
INSERT INTO `address` VALUES ('24', '3', 'CVBS', '1242345325', '14321上午的发的所发生的', '贵州省/黔东南苗族侗族自治州/榕江县', '0', '2018-03-16 09:52:39');
INSERT INTO `address` VALUES ('25', '3', '代发货', '78967895484', '官方回复电话36456345', '青海省/海南藏族自治州/贵德县', '0', '2018-03-16 09:53:00');
INSERT INTO `address` VALUES ('27', '3', '花花一号', '17868417352', '萨芬撒打发斯蒂芬123123123123', '广东省/韶关市/曲江区', '0', '2018-03-16 09:59:06');
INSERT INTO `address` VALUES ('29', '3', '花花', '17868417352', '萨芬撒打发斯蒂芬111', '甘肃省/武威市/天祝藏族自治县', '0', '2018-04-19 17:03:14');
INSERT INTO `address` VALUES ('37', '3', '1231', '15238317324', 'jkshaskjdfhsdkjghfdskgjh ', '安徽省/宿州市/萧县', '0', '2018-04-19 17:02:59');
INSERT INTO `address` VALUES ('38', '3', '123123', '15217139111', '龙门飞甲跃龙门', '黑龙江省/佳木斯市/抚远县', '0', '2018-04-14 14:47:03');
INSERT INTO `address` VALUES ('39', '3', 'qweqwe', '18937162544', 'nxz,vkjasdhkasf回家了都是法兰克福', '安徽省/铜陵市/铜官山区', '0', '2018-04-14 14:37:08');
INSERT INTO `address` VALUES ('40', '3', '卡卡', '15238614789', '最江路', '北京市/北京市/门头沟区', '0', '2018-04-19 17:04:28');
INSERT INTO `address` VALUES ('41', '29', '申毅', '15238617326', '未记录', '甘肃省/张掖市/山丹县', '0', '2018-05-04 10:50:53');
INSERT INTO `address` VALUES ('42', '29', '深深', '15238617326', '碧水兰删除', '广东省/深圳市/南山区', '0', '2018-05-04 11:26:17');
INSERT INTO `address` VALUES ('43', '29', '沈佳明', '15238617326', '绿牡丹一号', '吉林省/松原市/前郭尔罗斯蒙古族自治县', '0', '2018-05-04 11:28:51');
INSERT INTO `address` VALUES ('44', '29', '神宠文', '15238617326', '江南春雪号', '陕西省/榆林市/子洲县', '0', '2018-05-04 11:30:40');
INSERT INTO `address` VALUES ('45', '29', '神重大', '15238617326', '肯定干时间规划局', '甘肃省/张掖市/高台县', '1', '2018-05-04 11:38:06');

-- ----------------------------
-- Table structure for ceshi
-- ----------------------------
DROP TABLE IF EXISTS `ceshi`;
CREATE TABLE `ceshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `paysapi_id` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `realprice` decimal(10,0) DEFAULT NULL,
  `orderuid` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ceshi
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `classprice` VALUES ('64', '4', '35', '40', '1500.00', '200', '2', '1', '0', '1234567890.jpg');
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
INSERT INTO `classprice` VALUES ('104', '7', '70', '76', '20.00', '10', '60', '1', '0', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('105', '7', '70', '77', '20.00', '3', '68', '1', '0', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('106', '7', '71', '75', '99.00', '25', '101', '1', '0', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('107', '7', '72', '77', '203.00', '30', '63', '1', '1', '5aaf557d4ca90.jpg');
INSERT INTO `classprice` VALUES ('108', '8', '80', '82', '200.00', '10', '15', '1', '0', '5ad59e356f928.jpg');
INSERT INTO `classprice` VALUES ('109', '8', '81', '82', '30.00', '10', '100', '1', '1', '5ad59e58a19f0.jpg');
INSERT INTO `classprice` VALUES ('110', '9', '86', '0', '20.00', '5', '333330', '1', '0', '5ad5f14867c28.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('1', '3', '1', '2018-03-01 08:18:22');
INSERT INTO `focus` VALUES ('2', '3', '1', '2018-03-17 09:45:29');
INSERT INTO `focus` VALUES ('3', '3', '1', '2018-03-17 09:45:31');
INSERT INTO `focus` VALUES ('4', '3', '1', '2018-03-17 09:45:37');
INSERT INTO `focus` VALUES ('5', '3', '1', '2018-03-17 09:45:54');
INSERT INTO `focus` VALUES ('6', '3', '1', '2018-04-20 09:40:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_exchange
-- ----------------------------
INSERT INTO `f_exchange` VALUES ('1', '3', '20', '2018-04-10 11:00:43');
INSERT INTO `f_exchange` VALUES ('2', '3', '20', '2018-04-10 11:03:21');
INSERT INTO `f_exchange` VALUES ('5', '3', '80', '2018-04-14 17:58:42');
INSERT INTO `f_exchange` VALUES ('6', '3', '100', '2018-04-14 18:01:04');
INSERT INTO `f_exchange` VALUES ('7', '3', '10', '2018-04-26 15:25:26');
INSERT INTO `f_exchange` VALUES ('8', '3', '100', '2018-04-26 15:48:57');
INSERT INTO `f_exchange` VALUES ('9', '3', '10', '2018-04-27 09:24:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `f_harvest` VALUES ('119', '3', '72', '0.022', '0', '2018-04-13 14:31:54');
INSERT INTO `f_harvest` VALUES ('120', '3', '73', '0.022', '0', '2018-04-13 15:11:45');
INSERT INTO `f_harvest` VALUES ('121', '3', '60', '0.022', '6.27', '2018-04-13 17:16:50');
INSERT INTO `f_harvest` VALUES ('122', '3', '63', '0.022', '6.27', '2018-04-13 17:16:50');
INSERT INTO `f_harvest` VALUES ('123', '3', '66', '0.022', '6.27', '2018-04-13 17:16:50');
INSERT INTO `f_harvest` VALUES ('124', '3', '67', '0.022', '6.27', '2018-04-13 17:16:50');
INSERT INTO `f_harvest` VALUES ('125', '3', '68', '0.022', '6.27', '2018-04-13 17:16:50');
INSERT INTO `f_harvest` VALUES ('126', '3', '69', '0.022', '6.27', '2018-04-13 17:16:50');
INSERT INTO `f_harvest` VALUES ('154', '3', '60', '0.024', '6.6', '2018-04-14 23:25:39');
INSERT INTO `f_harvest` VALUES ('155', '3', '63', '0.024', '6.6', '2018-04-14 23:25:39');
INSERT INTO `f_harvest` VALUES ('156', '3', '66', '0.024', '6.6', '2018-04-14 23:25:39');
INSERT INTO `f_harvest` VALUES ('157', '3', '67', '0.024', '6.6', '2018-04-14 23:25:39');
INSERT INTO `f_harvest` VALUES ('158', '3', '68', '0.024', '6.6', '2018-04-14 23:25:39');
INSERT INTO `f_harvest` VALUES ('159', '3', '69', '0.024', '6.6', '2018-04-14 23:25:39');
INSERT INTO `f_harvest` VALUES ('160', '3', '73', '0.024', '6.6', '2018-04-14 23:25:39');
INSERT INTO `f_harvest` VALUES ('218', '3', '60', '0.024', '7.2', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('219', '3', '63', '0.024', '7.2', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('220', '3', '67', '0.024', '7.2', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('221', '3', '92', '0.024', '0', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('222', '3', '94', '0.024', '0', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('223', '3', '96', '0.024', '0', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('224', '3', '97', '0.024', '0', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('225', '3', '98', '0.024', '0', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('226', '3', '99', '0.024', '0', '2018-04-16 18:33:28');
INSERT INTO `f_harvest` VALUES ('227', '21', '3', '0.022', '5.7', '2018-04-16 18:36:53');
INSERT INTO `f_harvest` VALUES ('228', '21', '71', '0.022', '6.27', '2018-04-16 18:36:53');
INSERT INTO `f_harvest` VALUES ('229', '21', '3', '0.022', '6.6', '2018-04-19 15:27:51');
INSERT INTO `f_harvest` VALUES ('230', '21', '71', '0.022', '6.6', '2018-04-19 15:27:51');
INSERT INTO `f_harvest` VALUES ('231', '3', '60', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('232', '3', '63', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('233', '3', '67', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('234', '3', '92', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('235', '3', '94', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('236', '3', '96', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('237', '3', '97', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('238', '3', '98', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('239', '3', '99', '0.024', '7.2', '2018-04-19 15:40:39');
INSERT INTO `f_harvest` VALUES ('240', '3', '60', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('241', '3', '63', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('242', '3', '67', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('243', '3', '92', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('244', '3', '94', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('245', '3', '96', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('246', '3', '97', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('247', '3', '98', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('248', '3', '99', '0.024', '7.2', '2018-04-20 10:58:10');
INSERT INTO `f_harvest` VALUES ('249', '3', '60', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('250', '3', '63', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('251', '3', '67', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('252', '3', '92', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('253', '3', '94', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('254', '3', '96', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('255', '3', '97', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('256', '3', '98', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('257', '3', '99', '0.024', '7.2', '2018-04-23 09:03:30');
INSERT INTO `f_harvest` VALUES ('258', '3', '100', '0.024', '0', '2018-04-25 09:18:36');
INSERT INTO `f_harvest` VALUES ('259', '3', '60', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('260', '3', '63', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('261', '3', '67', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('262', '3', '92', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('263', '3', '94', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('264', '3', '96', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('265', '3', '97', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('266', '3', '98', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('267', '3', '99', '0.024', '7.2', '2018-04-25 09:18:42');
INSERT INTO `f_harvest` VALUES ('278', '3', '60', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('279', '3', '63', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('280', '3', '67', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('281', '3', '92', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('282', '3', '94', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('283', '3', '96', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('284', '3', '97', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('285', '3', '98', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('286', '3', '99', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('287', '3', '100', '0.024', '7.2', '2018-04-26 11:50:56');
INSERT INTO `f_harvest` VALUES ('288', '3', '101', '0.024', '0', '2018-04-26 16:01:22');
INSERT INTO `f_harvest` VALUES ('289', '3', '102', '0.024', '0', '2018-04-26 16:01:25');
INSERT INTO `f_harvest` VALUES ('290', '3', '103', '0.024', '0', '2018-04-26 16:01:29');
INSERT INTO `f_harvest` VALUES ('291', '3', '104', '0.024', '0', '2018-04-26 16:01:48');
INSERT INTO `f_harvest` VALUES ('292', '3', '105', '0.024', '0', '2018-04-26 16:01:58');
INSERT INTO `f_harvest` VALUES ('293', '3', '60', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('294', '3', '63', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('295', '3', '67', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('296', '3', '92', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('297', '3', '94', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('298', '3', '96', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('299', '3', '101', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('300', '3', '102', '0.024', '7.2', '2018-04-27 09:11:34');
INSERT INTO `f_harvest` VALUES ('301', '3', '103', '0.024', '0', '2018-04-27 15:09:23');
INSERT INTO `f_harvest` VALUES ('302', '3', '104', '0.024', '0', '2018-04-27 15:09:28');
INSERT INTO `f_harvest` VALUES ('303', '3', '60', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('304', '3', '63', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('305', '3', '67', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('306', '3', '92', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('307', '3', '94', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('308', '3', '96', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('309', '3', '101', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('310', '3', '102', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('311', '3', '103', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('312', '3', '104', '0.024', '7.2', '2018-04-28 14:56:31');
INSERT INTO `f_harvest` VALUES ('313', '3', '60', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('314', '3', '63', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('315', '3', '67', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('316', '3', '92', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('317', '3', '94', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('318', '3', '96', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('319', '3', '101', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('320', '3', '102', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('321', '3', '103', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('322', '3', '104', '0.024', '7.2', '2018-05-03 11:22:14');
INSERT INTO `f_harvest` VALUES ('323', '29', '105', '0.02', '0', '2018-05-04 11:47:14');
INSERT INTO `f_harvest` VALUES ('324', '29', '106', '0.02', '0', '2018-05-04 14:37:20');
INSERT INTO `f_harvest` VALUES ('325', '29', '107', '0.02', '0', '2018-05-04 14:37:38');
INSERT INTO `f_harvest` VALUES ('326', '29', '108', '0.02', '0', '2018-05-04 14:39:36');
INSERT INTO `f_harvest` VALUES ('327', '29', '109', '0.02', '0', '2018-05-04 16:25:04');

-- ----------------------------
-- Table structure for f_land
-- ----------------------------
DROP TABLE IF EXISTS `f_land`;
CREATE TABLE `f_land` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `f_land` VALUES ('17', '3', '2018-04-14 16:46:52');
INSERT INTO `f_land` VALUES ('18', '3', '2018-04-14 16:46:55');
INSERT INTO `f_land` VALUES ('19', '3', '2018-04-25 09:17:57');
INSERT INTO `f_land` VALUES ('20', '29', '2018-05-04 11:46:59');
INSERT INTO `f_land` VALUES ('21', '3', '2018-05-04 18:13:08');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_lowest
-- ----------------------------
INSERT INTO `f_lowest` VALUES ('1', '3', '500', 'ceshi添加');
INSERT INTO `f_lowest` VALUES ('2', '22', '33', '');
INSERT INTO `f_lowest` VALUES ('6', '28', '0', '默认');
INSERT INTO `f_lowest` VALUES ('4', '29', '0', '默认');
INSERT INTO `f_lowest` VALUES ('5', '30', '300', '默认');
INSERT INTO `f_lowest` VALUES ('7', '29', '0', '默认');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_mygoods
-- ----------------------------
INSERT INTO `f_mygoods` VALUES ('1', '3', '889355.42', '2340.00', '10', '12');
INSERT INTO `f_mygoods` VALUES ('2', '21', '9932.18', '4100.00', '2', '2');
INSERT INTO `f_mygoods` VALUES ('3', '28', '0.00', '0.00', '0', '0');
INSERT INTO `f_mygoods` VALUES ('4', '29', '28800.00', '0.00', '1', '1');
INSERT INTO `f_mygoods` VALUES ('5', '30', '0.00', '0.00', '0', '0');
INSERT INTO `f_mygoods` VALUES ('6', '22', '0.00', '0.00', '0', '0');
INSERT INTO `f_mygoods` VALUES ('7', '23', '6.55', '0.00', '0', '0');
INSERT INTO `f_mygoods` VALUES ('8', '24', '14.01', '0.00', '0', '0');
INSERT INTO `f_mygoods` VALUES ('9', '28', '0.00', '0.00', '0', '0');
INSERT INTO `f_mygoods` VALUES ('10', '29', '28800.00', '0.00', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `f_oldtree` VALUES ('135', '70', '3', '7', '2018-04-13 14:30:37', '2018-04-12 10:04:39');
INSERT INTO `f_oldtree` VALUES ('136', '72', '3', '7', '2018-04-13 15:11:38', '2018-04-13 14:31:54');
INSERT INTO `f_oldtree` VALUES ('137', '74', '3', '8', '2018-04-14 16:47:42', '2018-04-14 16:47:27');
INSERT INTO `f_oldtree` VALUES ('138', '76', '3', '9', '2018-04-14 18:04:13', '2018-04-14 18:04:08');
INSERT INTO `f_oldtree` VALUES ('139', '77', '3', '9', '2018-04-14 18:06:59', '2018-04-14 18:06:52');
INSERT INTO `f_oldtree` VALUES ('140', '78', '3', '9', '2018-04-14 18:15:53', '2018-04-14 18:07:08');
INSERT INTO `f_oldtree` VALUES ('141', '75', '3', '8', '2018-04-14 18:15:56', '2018-04-14 18:04:03');
INSERT INTO `f_oldtree` VALUES ('142', '74', '3', '8', '2018-04-14 19:15:59', '2018-04-14 19:15:46');
INSERT INTO `f_oldtree` VALUES ('143', '74', '3', '8', '2018-04-16 16:18:53', '2018-04-16 16:18:50');
INSERT INTO `f_oldtree` VALUES ('144', '75', '3', '8', '2018-04-16 16:21:06', '2018-04-16 16:21:03');
INSERT INTO `f_oldtree` VALUES ('145', '76', '3', '8', '2018-04-16 16:28:56', '2018-04-16 16:28:30');
INSERT INTO `f_oldtree` VALUES ('151', '78', '3', '9', '2018-04-16 17:12:38', '2018-04-16 17:02:05');
INSERT INTO `f_oldtree` VALUES ('152', '79', '3', '9', '2018-04-16 17:15:35', '2018-04-16 17:12:46');
INSERT INTO `f_oldtree` VALUES ('154', '77', '3', '8', '2018-04-16 17:17:11', '2018-04-16 16:34:09');
INSERT INTO `f_oldtree` VALUES ('155', '81', '3', '9', '2018-04-16 17:20:04', '2018-04-16 17:19:06');
INSERT INTO `f_oldtree` VALUES ('156', '73', '3', '7', '2018-04-16 17:21:27', '2018-04-13 15:11:45');
INSERT INTO `f_oldtree` VALUES ('157', '80', '3', '8', '2018-04-16 17:25:04', '2018-04-16 17:19:03');
INSERT INTO `f_oldtree` VALUES ('158', '68', '3', '6', '2018-04-16 17:25:28', '2018-04-11 10:58:06');
INSERT INTO `f_oldtree` VALUES ('160', '85', '3', '9', '2018-04-16 17:26:48', '2018-04-16 17:26:35');
INSERT INTO `f_oldtree` VALUES ('161', '84', '3', '8', '2018-04-16 17:28:23', '2018-04-16 17:26:31');
INSERT INTO `f_oldtree` VALUES ('163', '83', '3', '7', '2018-04-16 17:28:39', '2018-04-16 17:26:28');
INSERT INTO `f_oldtree` VALUES ('164', '88', '3', '9', '2018-04-16 17:29:09', '2018-04-16 17:29:02');
INSERT INTO `f_oldtree` VALUES ('165', '87', '3', '8', '2018-04-16 17:29:20', '2018-04-16 17:28:57');
INSERT INTO `f_oldtree` VALUES ('167', '86', '3', '7', '2018-04-16 17:29:52', '2018-04-16 17:28:54');
INSERT INTO `f_oldtree` VALUES ('169', '82', '3', '6', '2018-04-16 17:31:24', '2018-04-16 17:26:23');
INSERT INTO `f_oldtree` VALUES ('171', '69', '3', '5', '2018-04-16 17:31:43', '2018-04-11 11:53:52');
INSERT INTO `f_oldtree` VALUES ('173', '90', '3', '7', '2018-04-16 17:35:17', '2018-04-16 17:35:03');
INSERT INTO `f_oldtree` VALUES ('174', '66', '3', '3', '2018-04-16 17:35:31', '2018-04-11 09:59:29');
INSERT INTO `f_oldtree` VALUES ('175', '91', '3', '8', '2018-04-16 17:37:58', '2018-04-16 17:35:06');
INSERT INTO `f_oldtree` VALUES ('176', '95', '3', '9', '2018-04-16 17:38:06', '2018-04-16 17:37:48');
INSERT INTO `f_oldtree` VALUES ('177', '93', '3', '7', '2018-04-16 17:40:01', '2018-04-16 17:37:41');
INSERT INTO `f_oldtree` VALUES ('178', '89', '3', '6', '2018-04-16 17:40:06', '2018-04-16 17:34:59');
INSERT INTO `f_oldtree` VALUES ('179', '100', '3', '10', '2018-04-26 15:59:39', '2018-04-25 09:18:36');
INSERT INTO `f_oldtree` VALUES ('180', '99', '3', '9', '2018-04-26 15:59:52', '2018-04-16 17:40:19');
INSERT INTO `f_oldtree` VALUES ('181', '98', '3', '8', '2018-04-26 16:00:06', '2018-04-16 17:40:17');
INSERT INTO `f_oldtree` VALUES ('182', '97', '3', '7', '2018-04-26 16:00:33', '2018-04-16 17:40:13');
INSERT INTO `f_oldtree` VALUES ('188', '104', '3', '10', '2018-04-26 16:01:53', '2018-04-26 16:01:48');
INSERT INTO `f_oldtree` VALUES ('189', '105', '3', '10', '2018-04-26 16:03:14', '2018-04-26 16:01:58');
INSERT INTO `f_oldtree` VALUES ('190', '103', '3', '9', '2018-04-26 16:03:28', '2018-04-26 16:01:29');
INSERT INTO `f_oldtree` VALUES ('191', '105', '29', '1', '2018-05-04 11:47:42', '2018-05-04 11:47:14');
INSERT INTO `f_oldtree` VALUES ('192', '106', '29', '1', '2018-05-04 14:37:35', '2018-05-04 14:37:20');
INSERT INTO `f_oldtree` VALUES ('193', '107', '29', '1', '2018-05-04 14:39:32', '2018-05-04 14:37:38');
INSERT INTO `f_oldtree` VALUES ('194', '108', '29', '1', '2018-05-04 16:24:58', '2018-05-04 14:39:36');

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
INSERT INTO `f_rate` VALUES ('7', '7', '0.022', '7.57');
INSERT INTO `f_rate` VALUES ('8', '8', '0.024', '7.57');
INSERT INTO `f_rate` VALUES ('9', '9', '0.024', '6.45');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_steal
-- ----------------------------
INSERT INTO `f_steal` VALUES ('1', '3', '21', '5', '2018-03-23 17:16:39');
INSERT INTO `f_steal` VALUES ('2', '21', '3', '2.31', '2018-04-13 10:45:28');
INSERT INTO `f_steal` VALUES ('3', '3', '21', '0.63', '2018-04-16 12:50:43');
INSERT INTO `f_steal` VALUES ('4', '3', '21', '0.66', '2018-04-20 11:26:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `f_trade` VALUES ('13', '3', '21', '110', '100', '2018-04-26 15:25:26');
INSERT INTO `f_trade` VALUES ('14', '3', '21', '1100', '1000', '2018-04-26 15:48:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of f_tree
-- ----------------------------
INSERT INTO `f_tree` VALUES ('3', '21', '1', '2018-03-21 17:27:39');
INSERT INTO `f_tree` VALUES ('60', '3', '1', '2018-04-10 16:38:50');
INSERT INTO `f_tree` VALUES ('63', '3', '2', '2018-04-11 09:59:15');
INSERT INTO `f_tree` VALUES ('67', '3', '4', '2018-04-11 09:59:34');
INSERT INTO `f_tree` VALUES ('71', '21', '2', '2018-04-12 11:59:26');
INSERT INTO `f_tree` VALUES ('92', '3', '3', '2018-04-16 17:37:38');
INSERT INTO `f_tree` VALUES ('94', '3', '5', '2018-04-16 17:37:44');
INSERT INTO `f_tree` VALUES ('96', '3', '6', '2018-04-16 17:40:10');
INSERT INTO `f_tree` VALUES ('101', '3', '7', '2018-04-26 16:01:22');
INSERT INTO `f_tree` VALUES ('102', '3', '8', '2018-04-26 16:01:25');
INSERT INTO `f_tree` VALUES ('103', '3', '9', '2018-04-27 15:09:23');
INSERT INTO `f_tree` VALUES ('104', '3', '10', '2018-04-27 15:09:28');
INSERT INTO `f_tree` VALUES ('109', '29', '1', '2018-05-04 16:25:04');

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
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `gclassify` VALUES ('78', '8', '0', '0', '颜色');
INSERT INTO `gclassify` VALUES ('79', '8', '0', '0', '大小');
INSERT INTO `gclassify` VALUES ('80', '8', '78', '0,78', '红色');
INSERT INTO `gclassify` VALUES ('81', '8', '78', '0,78', '白色');
INSERT INTO `gclassify` VALUES ('82', '8', '79', '0,79', '一寸');
INSERT INTO `gclassify` VALUES ('83', '8', '78', '0,78', '绿色');
INSERT INTO `gclassify` VALUES ('84', '8', '79', '0,79', '2寸');
INSERT INTO `gclassify` VALUES ('85', '9', '0', '0', '种类');
INSERT INTO `gclassify` VALUES ('86', '9', '85', '0,85', 'baikafei');
INSERT INTO `gclassify` VALUES ('87', '9', '85', '0,85', '黑咖啡');

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
  `statu` int(1) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '波多尔红酒', '1', '1', '9999000', '9999000', '1qw2we3e23ew.jpg', null, '9999', '2018-03-01 05:35:21', '1', '5000');
INSERT INTO `goods` VALUES ('2', '阿斯蒂芬大沙发', '2', '17', '500', '50', '34t53rey43ey.jpg', null, '1000', '2018-03-03 16:25:40', '1', '4800');
INSERT INTO `goods` VALUES ('3', '百转千回洗衣机', '3', '33', '200', '100', '45try45ytretyerty.jpg', null, '500', '2018-03-04 09:53:49', '1', '3000');
INSERT INTO `goods` VALUES ('4', '皇家国际自行车', '2', '49', '600', '50', '1234567890.jpg', null, '1200', '2018-03-04 17:45:59', '1', '4100');
INSERT INTO `goods` VALUES ('5', '奥斯卡绝代录音机', '3', '65', '300', '200', 'qwe123weqwe12e.jpg', null, '1000', '2018-03-05 10:01:18', '1', '20000');
INSERT INTO `goods` VALUES ('6', '时代峻峰运动鞋', '4', '81', '800', '60', 'qweq123123.jpg', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE5BA8AE5898DE6988EE69C88E585893C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE79691E698AFE59CB0E4B88AE99C9C3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE4B8BEE5A4B4E69C9BE6988EE69C883C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE4BD8EE5A4B4E6809DE69585E4B9A13C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223E3C696D67207372633D222F75656469746F722F7068702F75706C6F61642F696D6167652F32303138303332312F313532313632383437363536373131352E6A706722207469746C653D22313532313632383437363536373131352E6A70672220616C743D22753D323233393134363530322C31363530313335313626616D703B666D3D323726616D703B67703D302E6A7067222077696474683D2231343722206865696768743D22313633222F3E3C2F703E, '1200', '2018-03-05 11:23:32', '1', '800');
INSERT INTO `goods` VALUES ('7', '精细化娱乐鼠标', '1', '107', '20', '10', '', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE7A6BBE7A6BBE58E9FE4B88AE88D893C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE4B880E5B281E4B880E69EAFE88DA33C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE9878EE781ABE783A7E4B88DE5B0BD3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223EE698A5E9A38EE590B9E58F88E7949F3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223E3C696D67207372633D222F75656469746F722F7068702F75706C6F61642F696D6167652F32303138303332312F313532313631383739353130373534392E6A706722207469746C653D22313532313631383739353130373534392E6A70672220616C743D22753D343136363732313839312C3135303334343437363026616D703B666D3D323726616D703B67703D302E6A7067222077696474683D2231363522206865696768743D22313638222F3E3C2F703E3C70207374796C653D22746578742D616C69676E3A2063656E7465723B223E3C696D67207372633D222F75656469746F722F7068702F75706C6F61642F696D6167652F32303138303332312F313532313631383735303137323630302E6A706722207469746C653D22313532313631383735303137323630302E6A70672220616C743D22753D313132363338303034302C3333363634363532333326616D703B666D3D323726616D703B67703D302E6A7067222077696474683D2231383122206865696768743D22323131222F3E3C2F703E, '50', '2018-03-19 14:14:41', '1', '3000');
INSERT INTO `goods` VALUES ('8', '21世纪新品桂花糕', '3', '109', '300', '50', '', 0x3C703EE998BFE696AFE9A1BFE58F91E7949FE58F91E5A4A7E6B0B4E58F91E68993E58F91E5A4A7E6B299E58F91E5A4A7E5B888E582853C2F703E3C703EE998BFE890A8E5BEB7E7A791E68A80E68AA4E882A4E5A4A7E5B888E7A9BAE997B4E58F91E68CA5E7A791E68A803C2F703E, '600', '2018-04-17 14:56:12', '1', '2000');
INSERT INTO `goods` VALUES ('9', '咖啡', '3', '0', '200', '10', '', 0x3C703EE5A4A7E6B299E58F91E4BB98E4BB98E4BB98E4BB98E4BB98E4BB98E4BB98E4BB98E4BB98E4BB983C2F703E, '500', '2018-04-17 15:58:15', '1', '8000');
INSERT INTO `goods` VALUES ('10', '手机', '2', '0', '1200', '300', '', 0x3C703EE889BEE696AFE5BEB7E696AFE5A49A3C2F703E3C703E617364617364E5958AE5AE9EE68993E5AE9EE79A843C2F703E3C703EE5A5A5E69CAFE5A4A7E5B888E5A4A7E68980E5A49A3C2F703E3C703E3C62722F3E3C2F703E3C703EE5A5A5E69CAFE5A4A7E5B888E5A4A7E68980E5A49AE68980E5A49A3C2F703E3C703E3C62722F3E3C2F703E3C703EE998BFE698AFE5A4A7E5B888E5A4A7E5B888E79A843C2F703E3C703E3C62722F3E3C2F703E3C703E6173646173646173646173646173643C2F703E3C703E61736461733C2F703E3C703EE788B1E4BB95E8BEBEE5A49AE5A49AE5A49AE5A49AE5A49AE5A49AE5A49AE5A49AE5A4A7E68980E5A4A7E68980E5A49AE998BFE890A8E5BEB73C2F703E3C703E3C62722F3E3C2F703E3C703EE5A5A5E69CAFE5A4A7E5B888E5A4A7E68980E5A4A73C2F703E, '1800', '2018-04-19 18:09:05', '1', '6425');

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `goodsimg` VALUES ('22', '8', '5ad59e7f52c38.jpg', '2018-04-17 15:13:03');
INSERT INTO `goodsimg` VALUES ('23', '9', '5ad5afb3d36d0.jpg', '2018-04-17 16:26:27');
INSERT INTO `goodsimg` VALUES ('24', '8', '5ad5d4c4e7338.jpg', '2018-04-17 19:04:36');
INSERT INTO `goodsimg` VALUES ('25', '10', '5ad86aeda88e0.jpg', '2018-04-19 18:09:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('4', '3', '2', '0', '4', '2018-04-03 14:10:02');
INSERT INTO `letter` VALUES ('5', '3', '3', '0', '26.4', '2018-04-08 09:03:39');
INSERT INTO `letter` VALUES ('6', '3', '7', '21', '0.3', '2018-04-08 09:40:06');
INSERT INTO `letter` VALUES ('8', '3', '3', '0', '26.4', '2018-04-09 10:58:50');
INSERT INTO `letter` VALUES ('9', '3', '4', '0', '4', '2018-04-09 10:59:00');
INSERT INTO `letter` VALUES ('10', '3', '2', '0', '4', '2018-04-09 10:59:18');
INSERT INTO `letter` VALUES ('11', '3', '2', '0', '4', '2018-04-09 10:59:19');
INSERT INTO `letter` VALUES ('12', '3', '7', '21', '0.3', '2018-04-09 18:32:02');
INSERT INTO `letter` VALUES ('14', '3', '7', '21', '0.3', '2018-04-10 10:01:01');
INSERT INTO `letter` VALUES ('16', '3', '7', '21', '0.3', '2018-04-10 10:05:55');
INSERT INTO `letter` VALUES ('18', '3', '5', '21', '220', '2018-04-10 11:00:43');
INSERT INTO `letter` VALUES ('21', '3', '5', '21', '220', '2018-04-10 11:03:21');
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
INSERT INTO `letter` VALUES ('50', '3', '7', '21', '0.3', '2018-04-12 11:00:46');
INSERT INTO `letter` VALUES ('52', '3', '7', '21', '0.3', '2018-04-12 11:03:59');
INSERT INTO `letter` VALUES ('55', '3', '3', '0', '59.4', '2018-04-12 16:11:03');
INSERT INTO `letter` VALUES ('57', '3', '8', '21', '2.31', '2018-04-13 10:45:28');
INSERT INTO `letter` VALUES ('58', '3', '4', '0', '7', '2018-04-13 14:30:37');
INSERT INTO `letter` VALUES ('59', '3', '2', '0', '7', '2018-04-13 14:31:54');
INSERT INTO `letter` VALUES ('60', '3', '4', '0', '7', '2018-04-13 15:11:38');
INSERT INTO `letter` VALUES ('61', '3', '2', '0', '7', '2018-04-13 15:11:45');
INSERT INTO `letter` VALUES ('62', '3', '3', '0', '37.62', '2018-04-13 17:16:50');
INSERT INTO `letter` VALUES ('63', '3', '3', '0', '46.2', '2018-04-14 10:31:43');
INSERT INTO `letter` VALUES ('64', '3', '2', '0', '8', '2018-04-14 16:47:27');
INSERT INTO `letter` VALUES ('65', '3', '4', '0', '8', '2018-04-14 16:47:42');
INSERT INTO `letter` VALUES ('66', '3', '11', '0', '80', '2018-04-14 17:58:42');
INSERT INTO `letter` VALUES ('67', '3', '11', '0', '100', '2018-04-14 18:01:04');
INSERT INTO `letter` VALUES ('68', '3', '2', '0', '8', '2018-04-14 18:04:03');
INSERT INTO `letter` VALUES ('69', '3', '2', '0', '9', '2018-04-14 18:04:08');
INSERT INTO `letter` VALUES ('70', '3', '4', '0', '9', '2018-04-14 18:04:13');
INSERT INTO `letter` VALUES ('71', '3', '2', '0', '9', '2018-04-14 18:06:52');
INSERT INTO `letter` VALUES ('72', '3', '4', '0', '9', '2018-04-14 18:06:59');
INSERT INTO `letter` VALUES ('73', '3', '2', '0', '9', '2018-04-14 18:07:08');
INSERT INTO `letter` VALUES ('74', '3', '4', '0', '9', '2018-04-14 18:15:53');
INSERT INTO `letter` VALUES ('75', '3', '4', '0', '8', '2018-04-14 18:15:56');
INSERT INTO `letter` VALUES ('76', '3', '2', '0', '8', '2018-04-14 19:15:46');
INSERT INTO `letter` VALUES ('77', '3', '4', '0', '8', '2018-04-14 19:15:59');
INSERT INTO `letter` VALUES ('78', null, '1', '0', '0', '2018-04-14 19:49:19');
INSERT INTO `letter` VALUES ('79', null, '1', '0', '0', '2018-04-14 19:51:38');
INSERT INTO `letter` VALUES ('80', null, '1', '0', '0', '2018-04-14 19:53:13');
INSERT INTO `letter` VALUES ('81', '3', '3', '0', '46.2', '2018-04-14 23:25:39');
INSERT INTO `letter` VALUES ('82', '3', '3', '0', '50.4', '2018-04-16 09:10:42');
INSERT INTO `letter` VALUES ('92', '3', '7', '21', '0.63', '2018-04-16 12:50:43');
INSERT INTO `letter` VALUES ('94', '3', '2', '0', '8', '2018-04-16 16:18:50');
INSERT INTO `letter` VALUES ('95', '3', '4', '0', '8', '2018-04-16 16:18:53');
INSERT INTO `letter` VALUES ('96', '3', '2', '0', '8', '2018-04-16 16:21:03');
INSERT INTO `letter` VALUES ('97', '3', '4', '0', '8', '2018-04-16 16:21:06');
INSERT INTO `letter` VALUES ('98', '3', '2', '0', '8', '2018-04-16 16:28:30');
INSERT INTO `letter` VALUES ('99', '3', '4', '0', '8', '2018-04-16 16:28:56');
INSERT INTO `letter` VALUES ('100', '3', '2', '0', '8', '2018-04-16 16:34:09');
INSERT INTO `letter` VALUES ('101', '3', '2', '0', '9', '2018-04-16 17:02:05');
INSERT INTO `letter` VALUES ('102', '3', '4', '0', '9', '2018-04-16 17:12:38');
INSERT INTO `letter` VALUES ('103', '3', '2', '0', '9', '2018-04-16 17:12:46');
INSERT INTO `letter` VALUES ('104', '3', '4', '0', '9', '2018-04-16 17:15:35');
INSERT INTO `letter` VALUES ('105', '3', '4', '0', '8', '2018-04-16 17:17:11');
INSERT INTO `letter` VALUES ('106', '3', '2', '0', '8', '2018-04-16 17:19:03');
INSERT INTO `letter` VALUES ('107', '3', '2', '0', '9', '2018-04-16 17:19:06');
INSERT INTO `letter` VALUES ('108', '3', '4', '0', '9', '2018-04-16 17:20:04');
INSERT INTO `letter` VALUES ('109', '3', '4', '0', '7', '2018-04-16 17:21:27');
INSERT INTO `letter` VALUES ('110', '3', '4', '0', '8', '2018-04-16 17:25:04');
INSERT INTO `letter` VALUES ('111', '3', '4', '0', '6', '2018-04-16 17:25:28');
INSERT INTO `letter` VALUES ('112', '3', '2', '0', '6', '2018-04-16 17:26:23');
INSERT INTO `letter` VALUES ('113', '3', '2', '0', '7', '2018-04-16 17:26:28');
INSERT INTO `letter` VALUES ('114', '3', '2', '0', '8', '2018-04-16 17:26:31');
INSERT INTO `letter` VALUES ('115', '3', '2', '0', '9', '2018-04-16 17:26:35');
INSERT INTO `letter` VALUES ('116', '3', '4', '0', '9', '2018-04-16 17:26:48');
INSERT INTO `letter` VALUES ('117', '3', '4', '0', '8', '2018-04-16 17:28:23');
INSERT INTO `letter` VALUES ('118', '3', '4', '0', '7', '2018-04-16 17:28:39');
INSERT INTO `letter` VALUES ('119', '3', '2', '0', '7', '2018-04-16 17:28:54');
INSERT INTO `letter` VALUES ('120', '3', '2', '0', '8', '2018-04-16 17:28:57');
INSERT INTO `letter` VALUES ('121', '3', '2', '0', '9', '2018-04-16 17:29:02');
INSERT INTO `letter` VALUES ('122', '3', '4', '0', '9', '2018-04-16 17:29:09');
INSERT INTO `letter` VALUES ('123', '3', '4', '0', '8', '2018-04-16 17:29:20');
INSERT INTO `letter` VALUES ('124', '3', '4', '0', '7', '2018-04-16 17:29:52');
INSERT INTO `letter` VALUES ('125', '3', '4', '0', '6', '2018-04-16 17:31:24');
INSERT INTO `letter` VALUES ('126', '3', '4', '0', '5', '2018-04-16 17:31:43');
INSERT INTO `letter` VALUES ('127', '3', '2', '0', '6', '2018-04-16 17:34:59');
INSERT INTO `letter` VALUES ('128', '3', '2', '0', '7', '2018-04-16 17:35:03');
INSERT INTO `letter` VALUES ('129', '3', '2', '0', '8', '2018-04-16 17:35:06');
INSERT INTO `letter` VALUES ('130', '3', '4', '0', '7', '2018-04-16 17:35:17');
INSERT INTO `letter` VALUES ('131', '3', '4', '0', '3', '2018-04-16 17:35:31');
INSERT INTO `letter` VALUES ('132', '3', '2', '0', '3', '2018-04-16 17:37:38');
INSERT INTO `letter` VALUES ('133', '3', '2', '0', '7', '2018-04-16 17:37:41');
INSERT INTO `letter` VALUES ('134', '3', '2', '0', '5', '2018-04-16 17:37:44');
INSERT INTO `letter` VALUES ('135', '3', '2', '0', '9', '2018-04-16 17:37:48');
INSERT INTO `letter` VALUES ('136', '3', '4', '0', '8', '2018-04-16 17:37:58');
INSERT INTO `letter` VALUES ('137', '3', '4', '0', '9', '2018-04-16 17:38:06');
INSERT INTO `letter` VALUES ('138', '3', '4', '0', '7', '2018-04-16 17:40:01');
INSERT INTO `letter` VALUES ('139', '3', '4', '0', '6', '2018-04-16 17:40:06');
INSERT INTO `letter` VALUES ('140', '3', '2', '0', '6', '2018-04-16 17:40:10');
INSERT INTO `letter` VALUES ('141', '3', '2', '0', '7', '2018-04-16 17:40:13');
INSERT INTO `letter` VALUES ('142', '3', '2', '0', '8', '2018-04-16 17:40:17');
INSERT INTO `letter` VALUES ('144', '3', '3', '0', '21.6', '2018-04-16 18:33:28');
INSERT INTO `letter` VALUES ('145', '21', '12', '3', '2.16', '2018-04-16 18:33:28');
INSERT INTO `letter` VALUES ('146', '24', '13', '3', '1.296', '2018-04-16 18:33:28');
INSERT INTO `letter` VALUES ('147', '21', '3', '0', '11.97', '2018-04-16 18:36:53');
INSERT INTO `letter` VALUES ('148', '24', '12', '21', '1.197', '2018-04-16 18:36:53');
INSERT INTO `letter` VALUES ('149', '21', '3', '0', '13.2', '2018-04-19 15:27:51');
INSERT INTO `letter` VALUES ('150', '24', '12', '21', '1.32', '2018-04-19 15:27:51');
INSERT INTO `letter` VALUES ('151', '3', '3', '0', '64.8', '2018-04-19 15:40:39');
INSERT INTO `letter` VALUES ('152', '21', '12', '3', '6.48', '2018-04-19 15:40:39');
INSERT INTO `letter` VALUES ('153', '24', '13', '3', '3.888', '2018-04-19 15:40:39');
INSERT INTO `letter` VALUES ('154', '3', '3', '0', '64.8', '2018-04-20 10:58:10');
INSERT INTO `letter` VALUES ('155', '21', '12', '3', '6.48', '2018-04-20 10:58:10');
INSERT INTO `letter` VALUES ('156', '3', '13', '3', '3.888', '2018-04-20 10:58:10');
INSERT INTO `letter` VALUES ('157', '3', '7', '21', '0.66', '2018-04-20 11:26:09');
INSERT INTO `letter` VALUES ('158', '21', '8', '3', '0.66', '2018-04-20 11:26:09');
INSERT INTO `letter` VALUES ('159', '3', '3', '0', '64.8', '2018-04-23 09:03:30');
INSERT INTO `letter` VALUES ('160', '21', '12', '3', '6.48', '2018-04-23 09:03:30');
INSERT INTO `letter` VALUES ('161', '3', '13', '3', '3.888', '2018-04-23 09:03:30');
INSERT INTO `letter` VALUES ('162', '3', '2', '0', '10', '2018-04-25 09:18:36');
INSERT INTO `letter` VALUES ('163', '3', '3', '0', '64.8', '2018-04-25 09:18:42');
INSERT INTO `letter` VALUES ('164', '21', '12', '3', '6.48', '2018-04-25 09:18:42');
INSERT INTO `letter` VALUES ('165', '3', '13', '3', '3.888', '2018-04-25 09:18:42');
INSERT INTO `letter` VALUES ('166', '3', '3', '0', '72', '2018-04-26 11:49:45');
INSERT INTO `letter` VALUES ('167', '21', '12', '3', '7.2', '2018-04-26 11:49:45');
INSERT INTO `letter` VALUES ('168', '3', '13', '3', '4.32', '2018-04-26 11:49:45');
INSERT INTO `letter` VALUES ('169', '3', '3', '0', '72', '2018-04-26 11:50:56');
INSERT INTO `letter` VALUES ('170', '21', '12', '3', '7.2', '2018-04-26 11:50:56');
INSERT INTO `letter` VALUES ('171', '3', '13', '3', '4.32', '2018-04-26 11:50:56');
INSERT INTO `letter` VALUES ('172', '3', '5', '21', '110', '2018-04-26 15:25:26');
INSERT INTO `letter` VALUES ('173', '21', '6', '3', '100', '2018-04-26 15:25:26');
INSERT INTO `letter` VALUES ('174', '3', '11', '0', '10', '2018-04-26 15:25:26');
INSERT INTO `letter` VALUES ('175', '3', '5', '21', '1100', '2018-04-26 15:48:57');
INSERT INTO `letter` VALUES ('176', '21', '6', '3', '1000', '2018-04-26 15:48:57');
INSERT INTO `letter` VALUES ('177', '3', '11', '0', '100', '2018-04-26 15:48:57');
INSERT INTO `letter` VALUES ('178', '3', '4', '0', '10', '2018-04-26 15:59:39');
INSERT INTO `letter` VALUES ('179', '3', '4', '0', '9', '2018-04-26 15:59:52');
INSERT INTO `letter` VALUES ('180', '3', '4', '0', '8', '2018-04-26 16:00:06');
INSERT INTO `letter` VALUES ('181', '3', '4', '0', '7', '2018-04-26 16:00:33');
INSERT INTO `letter` VALUES ('182', '3', '2', '0', '7', '2018-04-26 16:01:22');
INSERT INTO `letter` VALUES ('183', '3', '2', '0', '8', '2018-04-26 16:01:25');
INSERT INTO `letter` VALUES ('184', '3', '2', '0', '9', '2018-04-26 16:01:29');
INSERT INTO `letter` VALUES ('185', '3', '2', '0', '10', '2018-04-26 16:01:48');
INSERT INTO `letter` VALUES ('186', '3', '4', '0', '10', '2018-04-26 16:01:53');
INSERT INTO `letter` VALUES ('187', '3', '2', '0', '10', '2018-04-26 16:01:58');
INSERT INTO `letter` VALUES ('188', '3', '4', '0', '10', '2018-04-26 16:03:14');
INSERT INTO `letter` VALUES ('189', '3', '4', '0', '9', '2018-04-26 16:03:28');
INSERT INTO `letter` VALUES ('190', '3', '3', '0', '57.6', '2018-04-27 09:11:34');
INSERT INTO `letter` VALUES ('191', '21', '12', '3', '5.76', '2018-04-27 09:11:34');
INSERT INTO `letter` VALUES ('192', '3', '13', '3', '3.456', '2018-04-27 09:11:34');
INSERT INTO `letter` VALUES ('193', '3', '11', '0', '10', '2018-04-27 09:24:22');
INSERT INTO `letter` VALUES ('194', '3', '2', '0', '9', '2018-04-27 15:09:23');
INSERT INTO `letter` VALUES ('195', '3', '2', '0', '10', '2018-04-27 15:09:28');
INSERT INTO `letter` VALUES ('196', '3', '3', '0', '72', '2018-04-28 14:56:31');
INSERT INTO `letter` VALUES ('197', '21', '12', '3', '7.2', '2018-04-28 14:56:31');
INSERT INTO `letter` VALUES ('198', '3', '13', '3', '4.32', '2018-04-28 14:56:31');
INSERT INTO `letter` VALUES ('199', '3', '3', '0', '72', '2018-05-03 11:22:14');
INSERT INTO `letter` VALUES ('200', '21', '12', '3', '7.2', '2018-05-03 11:22:14');
INSERT INTO `letter` VALUES ('201', '3', '13', '3', '4.32', '2018-05-03 11:22:14');
INSERT INTO `letter` VALUES ('202', '28', '1', '0', '0', '2018-05-04 10:36:54');
INSERT INTO `letter` VALUES ('203', '29', '1', '0', '0', '2018-05-04 10:49:06');
INSERT INTO `letter` VALUES ('204', '29', '2', '0', '1', '2018-05-04 11:47:14');
INSERT INTO `letter` VALUES ('205', '29', '4', '0', '1', '2018-05-04 11:47:42');
INSERT INTO `letter` VALUES ('206', '29', '2', '0', '1', '2018-05-04 14:37:20');
INSERT INTO `letter` VALUES ('207', '29', '4', '0', '1', '2018-05-04 14:37:35');
INSERT INTO `letter` VALUES ('208', '29', '2', '0', '1', '2018-05-04 14:37:38');
INSERT INTO `letter` VALUES ('209', '29', '4', '0', '1', '2018-05-04 14:39:32');
INSERT INTO `letter` VALUES ('210', '29', '2', '0', '1', '2018-05-04 14:39:36');
INSERT INTO `letter` VALUES ('211', '29', '4', '0', '1', '2018-05-04 16:24:58');
INSERT INTO `letter` VALUES ('212', '29', '2', '0', '1', '2018-05-04 16:25:04');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of lootgoods
-- ----------------------------
INSERT INTO `lootgoods` VALUES ('1', '3', '4', '145', '2018-04-26 16:47:06');
INSERT INTO `lootgoods` VALUES ('2', '3', '3', '69', '2018-04-19 15:21:11');
INSERT INTO `lootgoods` VALUES ('3', '3', '1', '83', '2018-04-20 09:36:47');
INSERT INTO `lootgoods` VALUES ('4', '3', '2', '240', '2018-04-19 14:53:28');
INSERT INTO `lootgoods` VALUES ('5', '21', '1', '4', '2018-03-20 16:38:17');
INSERT INTO `lootgoods` VALUES ('6', '21', '2', '9', '2018-04-19 14:42:52');
INSERT INTO `lootgoods` VALUES ('18', '21', '4', '1', '2018-04-19 15:39:04');
INSERT INTO `lootgoods` VALUES ('17', '21', '3', '1', '2018-04-19 15:38:58');

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
  `online` int(1) DEFAULT NULL,
  `statu` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of onemoney
-- ----------------------------
INSERT INTO `onemoney` VALUES ('1', '海飞丝护发套装', '300', '2018-04-19 10:40:01', '24', '87', '5ab89a2034008.jpg', null, '1');
INSERT INTO `onemoney` VALUES ('2', '飘柔洗发露', '110', '2018-04-18 10:30:00', '48', '110', '5ab89a117d3e8.jpg', null, '1');
INSERT INTO `onemoney` VALUES ('3', '云南白药牙膏', '200', '2018-04-18 11:28:00', '24', '77', '5ab899af3efd0.jpg', null, '1');
INSERT INTO `onemoney` VALUES ('4', '蓝月亮洗衣液', '350', '2018-04-26 00:00:00', '28', '150', '5ab314c0f1748.jpg', null, '1');

-- ----------------------------
-- Table structure for online
-- ----------------------------
DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of online
-- ----------------------------
INSERT INTO `online` VALUES ('6', '客服二号', '123456789', '2018-04-17 10:57:11');
INSERT INTO `online` VALUES ('7', '客服一号', '1908148708', '2018-04-20 09:42:45');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `step` int(1) DEFAULT NULL COMMENT '0代付款   1已付款，待发货   2已发货，待收货  3已收货，待评价',
  `statu` int(1) NOT NULL DEFAULT '0',
  `ordernum` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `uptime` datetime NOT NULL,
  `addrid` int(11) DEFAULT NULL,
  `money` decimal(10,0) DEFAULT NULL,
  `voucher` decimal(10,0) DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `pay_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pay_return_no` int(11) DEFAULT NULL,
  `pay_return_sts` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `buyer_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pay_money` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('251', '3', '1', '0', 'e9dad1dcbfcbce232a1aca7872882487', '2018-04-18 15:31:27', '21', '30', '160', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('253', '3', '2', '0', '4e4a92942e5b2be219b482390df91cc1', '2018-04-18 15:32:09', '21', '570', '300', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('254', '3', '0', '0', '04d46505810d44c6e1500e62999a259c', '2018-04-18 16:30:32', '21', '2400', '2000', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('255', '3', '0', '0', '31f1ac7f0471e64687f05294dfaf5828', '2018-04-18 16:30:52', '21', '180', '200', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('257', '3', '2', '0', 'f90e20816ea6eab460e4788dce5c54ae', '2018-04-18 16:31:40', '21', '2460', '1000', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('258', '3', '0', '0', '742397ed2d1c4b8a498f1c2f919e5ebd', '2018-04-18 16:40:28', '15', '4000', '100', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('259', '3', '0', '0', '8ab9a01c4a652acbb42a9b4b9c8d38b9', '2018-04-18 19:06:46', '15', '20', '300', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('260', '3', '0', '0', '7088796742b424f0742c72f694730a09', '2018-04-18 19:34:17', '15', '1132', '200', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('261', '3', '0', '0', '748556cc1e6c73620d69e29e350a7ca4', '2018-04-18 19:34:50', '15', '8000', '300', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('262', '3', '0', '0', 'dffce515933fc225625a49cfbe7884e4', '2018-04-18 19:36:30', '15', '100', '180', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('263', '3', '0', '0', 'df47bd6c8142f4b6409e96ff411d434d', '2018-04-18 19:37:40', '15', '11020', '610', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('264', '3', '0', '0', '0fff0210672551939c007cd12efe57d1', '2018-04-19 17:25:07', '37', '800', '80', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('265', '3', '0', '0', '8f7dd02de55aa1d89a7df4f259be3caa', '2018-04-19 17:43:10', '37', '2800', '660', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('268', '3', '0', '0', '54ab87d8880382b520a1d3164a7fa7ca', '2018-04-19 18:05:33', '37', '10800', '440', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('269', '3', '0', '0', '2c7bd6fed340f3ca67a97c3155efc370', '2018-04-19 18:10:38', '37', '1200', '300', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('270', '3', '0', '0', '1373c23b828c88fb91a9296e592d2880', '2018-04-19 18:13:07', '37', '1200', '300', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('271', '3', '0', '0', 'c6376b65d2395095e9ec2efc566da0fa', '2018-04-19 18:13:19', '37', '1200', '300', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('272', '3', '0', '0', '33ac6d77cc2e098c5779579d6f474cb0', '2018-04-19 18:13:53', '37', '1400', '310', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('273', '3', '0', '0', '7391195fbf20283792c5d1b628423eff', '2018-04-19 18:15:16', '37', '2400', '600', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('274', '3', '0', '0', '602425c3645c90379ad9143adbea79a5', '2018-04-25 09:04:41', '15', '14000', '1500', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('277', '3', '0', '0', 'b2e92fb589d9043b464410cd1e5d0dcd', '2018-04-25 09:12:28', '25', '2000', '100', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('282', '3', '0', '0', '5dbc2ed3d0a05394ec2d12be297e44ec', '2018-04-25 09:30:21', '25', '400', '60', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('284', '3', '0', '0', 'afcc0363acac666c3fa5390e26a8f425', '2018-04-25 09:30:44', '25', '200', '10', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('286', '3', '0', '0', 'e1f65390f7428fc4962ef7cf220ef29e', '2018-04-25 09:34:23', '25', '1691', '300', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('288', '3', '0', '1', '1ab100913b8b566eef6ba5b5364c203e', '2018-04-25 17:05:40', '25', '600', '50', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('289', '3', '0', '0', '5eadfee67b9fbcbc784869801571ba7c', '2018-04-26 16:25:45', '15', '700', '80', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('295', '3', '0', '0', 'f2a1732b3a3f7c90a67f62a7187e14fa', '2018-04-26 16:28:12', '15', '20', '10', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('296', '3', '0', '0', '0ec69b242884b592a61811d2fa4546b4', '2018-04-26 16:28:46', '15', '390', '130', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('297', '3', '0', '0', 'b450cbe42ccbde727c7c272fd843f48b', '2018-04-26 16:33:25', '15', '800', '100', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('298', '3', '0', '0', '704ddf619d3a99e36a4600ef8d13d58e', '2018-04-27 11:39:31', '15', '3920', '340', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('299', '3', '0', '0', 'c1b1d2d567c5a1495ddbceac69ba80ac', '2018-04-27 14:47:18', '29', '649', '96', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('300', '3', '0', '0', '22bb6e1b034f0567e98e47a6fa806700', '2018-04-28 10:36:46', '39', '2000', '100', null, null, null, null, null, null);
INSERT INTO `order` VALUES ('301', '29', '0', '0', 'e39d699f2195fad6f52e1b479c5732b4', '2018-05-04 11:39:48', '45', '900', '150', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `ordernum` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('21', '8', '108', '37b2ca250e239feebf3ef04e02a7579f', '2');
INSERT INTO `orderinfo` VALUES ('22', '9', '110', '44dac181cd4b825c9ac3996ba107d70b', '1');
INSERT INTO `orderinfo` VALUES ('23', '7', '107', '44dac181cd4b825c9ac3996ba107d70b', '2');
INSERT INTO `orderinfo` VALUES ('24', '8', '109', 'e9dad1dcbfcbce232a1aca7872882487', '1');
INSERT INTO `orderinfo` VALUES ('26', '6', '92', '4e4a92942e5b2be219b482390df91cc1', '3');
INSERT INTO `orderinfo` VALUES ('27', '3', '43', '04d46505810d44c6e1500e62999a259c', '3');
INSERT INTO `orderinfo` VALUES ('28', '6', '90', '31f1ac7f0471e64687f05294dfaf5828', '1');
INSERT INTO `orderinfo` VALUES ('30', '9', '0', 'f90e20816ea6eab460e4788dce5c54ae', '2');
INSERT INTO `orderinfo` VALUES ('31', '8', '109', 'f90e20816ea6eab460e4788dce5c54ae', '2');
INSERT INTO `orderinfo` VALUES ('32', '2', '17', 'f90e20816ea6eab460e4788dce5c54ae', '1');
INSERT INTO `orderinfo` VALUES ('33', '2', '25', '742397ed2d1c4b8a498f1c2f919e5ebd', '1');
INSERT INTO `orderinfo` VALUES ('34', '9', '110', '8ab9a01c4a652acbb42a9b4b9c8d38b9', '1');
INSERT INTO `orderinfo` VALUES ('35', '1', '1', '7088796742b424f0742c72f694730a09', '1');
INSERT INTO `orderinfo` VALUES ('36', '5', '65', '7088796742b424f0742c72f694730a09', '1');
INSERT INTO `orderinfo` VALUES ('37', '7', '107', '7088796742b424f0742c72f694730a09', '4');
INSERT INTO `orderinfo` VALUES ('38', '2', '25', '748556cc1e6c73620d69e29e350a7ca4', '2');
INSERT INTO `orderinfo` VALUES ('39', '5', '78', 'dffce515933fc225625a49cfbe7884e4', '2');
INSERT INTO `orderinfo` VALUES ('40', '2', '17', 'df47bd6c8142f4b6409e96ff411d434d', '5');
INSERT INTO `orderinfo` VALUES ('41', '4', '49', 'df47bd6c8142f4b6409e96ff411d434d', '2');
INSERT INTO `orderinfo` VALUES ('42', '5', '65', 'df47bd6c8142f4b6409e96ff411d434d', '1');
INSERT INTO `orderinfo` VALUES ('43', '3', '33', '0fff0210672551939c007cd12efe57d1', '1');
INSERT INTO `orderinfo` VALUES ('44', '6', '81', '0fff0210672551939c007cd12efe57d1', '1');
INSERT INTO `orderinfo` VALUES ('45', '9', '0', '8f7dd02de55aa1d89a7df4f259be3caa', '1');
INSERT INTO `orderinfo` VALUES ('46', '1', '16', '8f7dd02de55aa1d89a7df4f259be3caa', '2');
INSERT INTO `orderinfo` VALUES ('47', '1', '5', '8f7dd02de55aa1d89a7df4f259be3caa', '9');
INSERT INTO `orderinfo` VALUES ('54', '6', '81', '54ab87d8880382b520a1d3164a7fa7ca', '1');
INSERT INTO `orderinfo` VALUES ('55', '3', '33', '54ab87d8880382b520a1d3164a7fa7ca', '1');
INSERT INTO `orderinfo` VALUES ('56', '2', '30', '54ab87d8880382b520a1d3164a7fa7ca', '2');
INSERT INTO `orderinfo` VALUES ('57', '10', '0', '2c7bd6fed340f3ca67a97c3155efc370', '1');
INSERT INTO `orderinfo` VALUES ('58', '10', '0', '1373c23b828c88fb91a9296e592d2880', '1');
INSERT INTO `orderinfo` VALUES ('59', '10', '0', 'c6376b65d2395095e9ec2efc566da0fa', '1');
INSERT INTO `orderinfo` VALUES ('60', '9', '0', '33ac6d77cc2e098c5779579d6f474cb0', '1');
INSERT INTO `orderinfo` VALUES ('61', '10', '0', '33ac6d77cc2e098c5779579d6f474cb0', '1');
INSERT INTO `orderinfo` VALUES ('62', '10', '0', '7391195fbf20283792c5d1b628423eff', '2');
INSERT INTO `orderinfo` VALUES ('63', '4', '49', '602425c3645c90379ad9143adbea79a5', '22');
INSERT INTO `orderinfo` VALUES ('64', '4', '64', '602425c3645c90379ad9143adbea79a5', '2');
INSERT INTO `orderinfo` VALUES ('69', '2', '17', 'b2e92fb589d9043b464410cd1e5d0dcd', '1');
INSERT INTO `orderinfo` VALUES ('74', '6', '81', '5dbc2ed3d0a05394ec2d12be297e44ec', '2');
INSERT INTO `orderinfo` VALUES ('76', '9', '0', 'afcc0363acac666c3fa5390e26a8f425', '1');
INSERT INTO `orderinfo` VALUES ('78', '7', '107', 'e1f65390f7428fc4962ef7cf220ef29e', '7');
INSERT INTO `orderinfo` VALUES ('79', '8', '109', 'e1f65390f7428fc4962ef7cf220ef29e', '9');
INSERT INTO `orderinfo` VALUES ('82', '3', '33', '1ab100913b8b566eef6ba5b5364c203e', '1');
INSERT INTO `orderinfo` VALUES ('83', '4', '49', '5eadfee67b9fbcbc784869801571ba7c', '1');
INSERT INTO `orderinfo` VALUES ('84', '6', '81', '5eadfee67b9fbcbc784869801571ba7c', '1');
INSERT INTO `orderinfo` VALUES ('91', '5', '65', 'f2a1732b3a3f7c90a67f62a7187e14fa', '1');
INSERT INTO `orderinfo` VALUES ('92', '8', '109', '0ec69b242884b592a61811d2fa4546b4', '13');
INSERT INTO `orderinfo` VALUES ('93', '3', '45', 'b450cbe42ccbde727c7c272fd843f48b', '1');
INSERT INTO `orderinfo` VALUES ('94', '9', '110', '704ddf619d3a99e36a4600ef8d13d58e', '6');
INSERT INTO `orderinfo` VALUES ('95', '9', '0', '704ddf619d3a99e36a4600ef8d13d58e', '1');
INSERT INTO `orderinfo` VALUES ('96', '3', '33', '704ddf619d3a99e36a4600ef8d13d58e', '6');
INSERT INTO `orderinfo` VALUES ('97', '7', '105', 'c1b1d2d567c5a1495ddbceac69ba80ac', '2');
INSERT INTO `orderinfo` VALUES ('98', '7', '107', 'c1b1d2d567c5a1495ddbceac69ba80ac', '3');
INSERT INTO `orderinfo` VALUES ('99', '2', '17', '22bb6e1b034f0567e98e47a6fa806700', '1');
INSERT INTO `orderinfo` VALUES ('100', '1', '1', 'e39d699f2195fad6f52e1b479c5732b4', '3');

-- ----------------------------
-- Table structure for ouser
-- ----------------------------
DROP TABLE IF EXISTS `ouser`;
CREATE TABLE `ouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telphone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `vipid` int(11) DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alipay` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `referee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `registime` datetime DEFAULT NULL,
  `faceimg` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `recomcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ouser
-- ----------------------------
INSERT INTO `ouser` VALUES ('1', '22', '西风瘦马', '123', '0', null, null, null, '15238617326', '0000-00-00 00:00:00', 'defaultfaceimg.png', null, '2018-04-14 23:12:26');

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
  `uprate` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `upuprate` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('1', '300', '300', '弥勒葡萄庄园', '30', '10', '300', '5', '10', '10', '6');

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
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES ('98', '3', '3', '34', '1', '2018-04-27 14:54:03');
INSERT INTO `shopcar` VALUES ('97', '3', '3', '48', '1', '2018-04-27 14:53:41');
INSERT INTO `shopcar` VALUES ('93', '3', '3', '33', '6', '2018-04-27 11:40:14');
INSERT INTO `shopcar` VALUES ('89', '3', '6', '81', '3', '2018-04-26 16:34:56');
INSERT INTO `shopcar` VALUES ('91', '3', '1', '1', '15', '2018-04-27 09:40:47');
INSERT INTO `shopcar` VALUES ('101', '3', '3', '43', '1', '2018-04-27 14:55:06');
INSERT INTO `shopcar` VALUES ('100', '3', '3', '44', '1', '2018-04-27 14:54:39');
INSERT INTO `shopcar` VALUES ('99', '3', '3', '47', '7', '2018-04-27 14:58:48');
INSERT INTO `shopcar` VALUES ('96', '3', '7', '97', '6', '2018-04-27 11:41:38');
INSERT INTO `shopcar` VALUES ('92', '3', '2', '17', '2', '2018-04-27 09:40:50');

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
  `statu` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '小桥流水人家', '6734d831b05187c6a73756786ed62a20', '撒旦法134', '1', '15238617326', '', '356012', 'e10adc3949ba59abbe56e057f20f883e', '', '2018-03-13 06:50:26', '5ad229b7de6ff.jpg', '1523724009356012.jpg', '0');
INSERT INTO `user` VALUES ('21', '15617801519', '6734d831b05187c6a73756786ed62a20', null, '1', '15617801519', '15238617326', '568792', '4297f44b13955235245b2497399d7a93', '15238617326', '2018-03-20 16:37:04', 'defaultfaceimg.png', null, '0');
INSERT INTO `user` VALUES ('23', '北校寒风', '6734d831b05187c6a73756786ed62a20', null, '1', '13938147521', '15617801519', '256891', 'e10adc3949ba59abbe56e057f20f883e', '15617801519', '2018-05-03 11:25:36', 'defaultfaceimg.png', null, '0');
INSERT INTO `user` VALUES ('24', '风萧萧', '', null, null, '12', '15238617326', '', '', '15238617326', '0000-00-00 00:00:00', '', null, '1');
INSERT INTO `user` VALUES ('25', '江南吹雪', '', null, null, '156', '15617801519', '', '', '15617801519', '0000-00-00 00:00:00', '', null, '1');
INSERT INTO `user` VALUES ('26', '沐风银蛇', '', null, null, '127', '15238617326', '', '', '15238617326', '0000-00-00 00:00:00', '', null, '1');
INSERT INTO `user` VALUES ('27', '冷无相求', '', null, null, '138', '15617801519', '', '', '1234', '0000-00-00 00:00:00', '', null, '1');
INSERT INTO `user` VALUES ('29', '15238617326', '6734d831b05187c6a73756786ed62a20', null, null, '1523861732', null, '278897', '', '', '2018-05-04 10:49:06', 'defaultfaceimg.png', null, '0');

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
