/*
Navicat MySQL Data Transfer

Source Server         : loaclhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-28 04:05:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food_table
-- ----------------------------
DROP TABLE IF EXISTS `food_table`;
CREATE TABLE `food_table` (
  `food_ID` int(32) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(32) NOT NULL,
  `food_price` decimal(10,0) NOT NULL,
  `food_img` varchar(64) DEFAULT NULL,
  `food_sale` int(32) NOT NULL,
  `buy` int(16) DEFAULT NULL,
  PRIMARY KEY (`food_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_table
-- ----------------------------
INSERT INTO `food_table` VALUES ('1', '蛋炒饭', '10', 'food/1.jpg', '2', '0');
INSERT INTO `food_table` VALUES ('2', '西红柿鸡蛋汤', '11', 'food/2.jpg', '3', '0');
INSERT INTO `food_table` VALUES ('3', '辣子鸡丁', '16', 'food/3.jpg', '0', '0');
INSERT INTO `food_table` VALUES ('4', '酸辣土豆丝', '10', 'food/4.jpg', '1', '0');
INSERT INTO `food_table` VALUES ('5', '大盆白饭', '5', 'food/5.jpg', '1', '0');
INSERT INTO `food_table` VALUES ('6', '板蓝根方便面', '10', 'food/6.jpg', '0', '0');
INSERT INTO `food_table` VALUES ('7', '尖椒炒月饼', '13', 'food/7.jpg', '0', '0');
INSERT INTO `food_table` VALUES ('8', '辣椒汤圆', '10', 'food/8.jpg', '0', '0');
INSERT INTO `food_table` VALUES ('9', '冰镇麻辣烫', '15', 'food/9.jpg', '0', '0');
INSERT INTO `food_table` VALUES ('10', '榴莲盖浇饭', '20', 'food/10.jpg', '0', '0');
INSERT INTO `food_table` VALUES ('11', '西瓜炒苹果', '9', 'food/11.jpg', '0', '0');
INSERT INTO `food_table` VALUES ('12', '妙脆角炒肉', '12', 'food/12.jpg', '0', '0');

-- ----------------------------
-- Table structure for order_table
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table` (
  `orderForm_ID` int(32) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `user_ID` varchar(32) NOT NULL COMMENT '下单用户',
  `orderFormContent` text NOT NULL COMMENT '下单列表',
  `date` varchar(70) NOT NULL COMMENT '下单日期',
  `total_price` decimal(10,0) NOT NULL COMMENT '总价',
  `remark` varchar(100) DEFAULT NULL COMMENT '目的地',
  `name` varchar(32) NOT NULL,
  `phone` int(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `date2` varchar(30) NOT NULL,
  `tap` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`orderForm_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_table
-- ----------------------------
INSERT INTO `order_table` VALUES ('23', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":1}', '1522086878560', '10', '', 'a123', '12312313', '123123156', '2018-03-27 01:54:38', '\0');
INSERT INTO `order_table` VALUES ('24', 'a123123', '{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":1}', '1522086897605', '11', '', 'dsadaas', '11561561', '516556', '2018-03-27 01:54:57', '\0');
INSERT INTO `order_table` VALUES ('25', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":3,\"food_name\":\"辣子鸡丁\",\"food_price\":16,\"food_img\":\"food/3.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":4,\"food_name\":\"酸辣土豆丝\",\"food_price\":10,\"food_img\":\"food/4.jpg\",\"food_sale\":0,\"buy\":1}', '1522088012877', '36', '', '阿达', '1561', '1515612', '2018-03-27 02:13:32', '\0');
INSERT INTO `order_table` VALUES ('26', 'a123123', '{\"food_ID\":7,\"food_name\":\"尖椒炒月饼\",\"food_price\":13,\"food_img\":\"food/7.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":9,\"food_name\":\"冰镇麻辣烫\",\"food_price\":15,\"food_img\":\"food/9.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":11,\"food_name\":\"西瓜炒苹果\",\"food_price\":9,\"food_img\":\"food/11.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":12,\"food_name\":\"妙脆角炒肉\",\"food_price\":12,\"food_img\":\"food/12.jpg\",\"food_sale\":0,\"buy\":2}', '1522089988230', '61', '', '阿萨德', '1231564', '1231564', '2018-03-27 02:46:28', '\0');
INSERT INTO `order_table` VALUES ('27', 'a123123', '{\"food_ID\":7,\"food_name\":\"尖椒炒月饼\",\"food_price\":13,\"food_img\":\"food/7.jpg\",\"food_sale\":0,\"buy\":2},{\"food_ID\":8,\"food_name\":\"辣椒汤圆\",\"food_price\":10,\"food_img\":\"food/8.jpg\",\"food_sale\":0,\"buy\":2},{\"food_ID\":9,\"food_name\":\"冰镇麻辣烫\",\"food_price\":15,\"food_img\":\"food/9.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":10,\"food_name\":\"榴莲盖浇饭\",\"food_price\":20,\"food_img\":\"food/10.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":11,\"food_name\":\"西瓜炒苹果\",\"food_price\":9,\"food_img\":\"food/11.jpg\",\"food_sale\":0,\"buy\":1}', '1522132218741', '90', '', '阿斯顿撒', '151561', '23132132', '2018-03-27 14:30:18', '\0');
INSERT INTO `order_table` VALUES ('28', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134680248', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:11:20', '\0');
INSERT INTO `order_table` VALUES ('29', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134684826', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:11:24', '\0');
INSERT INTO `order_table` VALUES ('30', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134722800', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:12:02', '\0');
INSERT INTO `order_table` VALUES ('31', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134723139', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:12:03', '\0');
INSERT INTO `order_table` VALUES ('32', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134736132', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:12:16', '\0');
INSERT INTO `order_table` VALUES ('33', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134791727', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:13:11', '\0');
INSERT INTO `order_table` VALUES ('34', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134819474', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:13:39', '\0');
INSERT INTO `order_table` VALUES ('35', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522134913772', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:15:13', '\0');
INSERT INTO `order_table` VALUES ('36', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":4},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522135070543', '62', '', 'dasdsa', '464564', 'dasd', '2018-03-27 15:17:50', '\0');
INSERT INTO `order_table` VALUES ('37', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":3},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2},{\"food_ID\":3,\"food_name\":\"辣子鸡丁\",\"food_price\":16,\"food_img\":\"food/3.jpg\",\"food_sale\":0,\"buy\":3}', '1522135130505', '100', '', '123123', '12313', '1232', '2018-03-27 15:18:50', '\0');
INSERT INTO `order_table` VALUES ('38', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":1},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":1}', '1522135198186', '21', '', '1a51d3', '123132', '123', '2018-03-27 15:19:58', '\0');
INSERT INTO `order_table` VALUES ('39', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":2},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":1}', '1522135281797', '31', '', 'dsad', '113251', '12132', '2018-03-27 15:21:21', '\0');
INSERT INTO `order_table` VALUES ('40', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":1}', '1522135371741', '10', '', 'dsad', '456456', '56456', '2018-03-27 15:22:51', '\0');
INSERT INTO `order_table` VALUES ('41', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":0,\"buy\":3},{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":0,\"buy\":2}', '1522135434913', '52', '', '132123', '123123', '1231', '2018-03-27 15:23:54', '\0');
INSERT INTO `order_table` VALUES ('42', 'a123123', '{\"food_ID\":1,\"food_name\":\"蛋炒饭\",\"food_price\":10,\"food_img\":\"food/1.jpg\",\"food_sale\":1,\"buy\":3}', '1522135991069', '30', '', 'dasd ', '1231', '156456', '2018-03-27 15:33:11', '\0');
INSERT INTO `order_table` VALUES ('43', 'a123123', '{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":1,\"buy\":2}', '1522136843864', '22', '', '多大的', '123123', '126456', '2018-03-27 15:47:23', '\0');
INSERT INTO `order_table` VALUES ('44', 'a123123', '{\"food_ID\":2,\"food_name\":\"西红柿鸡蛋汤\",\"food_price\":11,\"food_img\":\"food/2.jpg\",\"food_sale\":2,\"buy\":5},{\"food_ID\":4,\"food_name\":\"酸辣土豆丝\",\"food_price\":10,\"food_img\":\"food/4.jpg\",\"food_sale\":0,\"buy\":3},{\"food_ID\":5,\"food_name\":\"大盆白饭\",\"food_price\":5,\"food_img\":\"food/5.jpg\",\"food_sale\":0,\"buy\":3}', '1522156890419', '100', '', '撒旦', '13215', '123132', '2018-03-27 21:21:30', '\0');

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `user_ID` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `birthday` varchar(16) DEFAULT NULL,
  `picture` varchar(64) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `introduction` varchar(100) DEFAULT NULL,
  `is_root` varchar(10) DEFAULT NULL,
  `count` int(255) NOT NULL DEFAULT '0',
  `allpay` int(30) NOT NULL DEFAULT '0',
  `paycount` int(30) NOT NULL DEFAULT '0',
  `regtime` varchar(32) NOT NULL DEFAULT '2018-01-01 00:00:00',
  `lastlogintime` varchar(32) NOT NULL DEFAULT '2018-01-01 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_table
-- ----------------------------
INSERT INTO `user_table` VALUES ('1', 'a123123', '小姐姐', '123456', null, 'images/user_img/1.jpg', null, null, null, null, '71', '552', '11', '2018-01-01 00:00:00', '2018-03-28 04:04:57');
INSERT INTO `user_table` VALUES ('2', 'b123456', '派大星', '456789', null, 'images/user_img/2.jpg', null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('3', 'c123456', '小王', '123123', null, 'images/use_img/3.jpg', null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('4', 'a123', '123', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('5', 'b123', '123', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('6', 'x11', '44', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('7', 't11', '44', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('8', 't1111', '44', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('9', 'asdas', '123', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('10', 'kkk', 'kkk', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('11', 'undefined', 'undefined', 'undefined', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('12', 'vvv', '', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('13', 'vvj', '', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('14', 'ccc', '', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('15', 'undefined', '', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('16', 'undefined', '', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('17', 'aas', '', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('18', 'a159', '', '123', null, null, null, null, null, null, '2', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('19', 'fuck', 'cao ', '123', null, null, null, null, null, null, '2', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('20', 'bb1', '', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('21', 'bb12', 'dasdsa', '123', null, null, null, null, null, null, '1', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('22', 'kky', '', '123123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('23', 'vv3', '', '123456', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('24', 'cc', '', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('25', 'bbv', '', '123', null, null, null, null, null, null, '0', '0', '0', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('26', 'aacx', '', '123123', null, null, null, null, null, null, '0', '0', '0', '', '2018-01-01 00:00:00');
INSERT INTO `user_table` VALUES ('27', 'a157', '', '123123', null, null, null, null, null, null, '0', '0', '0', '2018-03-27 17:36:29', '2018-01-01 00:00:00');
