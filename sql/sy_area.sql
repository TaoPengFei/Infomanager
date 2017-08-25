/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : bi

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2017-08-25 16:01:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sy_area`
-- ----------------------------
DROP TABLE IF EXISTS `sy_area`;
CREATE TABLE `sy_area` (
  `AreaId` int(11) NOT NULL AUTO_INCREMENT,
  `AreaCode` varchar(255) DEFAULT NULL,
  `AreaName` varchar(255) DEFAULT NULL,
  `AreaDesc` varchar(255) DEFAULT NULL,
  `AreaSeq` int(11) DEFAULT NULL,
  `pAreaId` int(11) NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`AreaId`)
) ENGINE=InnoDB AUTO_INCREMENT=300114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sy_area
-- ----------------------------
INSERT INTO `sy_area` VALUES ('0', '0', 'Root', 'Root', null, '-1', null, '2017-08-22 17:17:07', '2017-08-22 17:17:09');
INSERT INTO `sy_area` VALUES ('1', '10', '华东区', '华东6省1市', null, '0', '0', '2016-08-02 16:03:22', '2017-08-25 15:58:47');
INSERT INTO `sy_area` VALUES ('2', '20', '华北区', '华北6省市', null, '0', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('3', '30', '华南区', '华南6省市', null, '0', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('11', '1001', '上海市', '上海市', null, '1', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('12', '1003', '江苏省', '江苏省', null, '1', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('13', '1002', '浙江省', '浙江省', null, '1', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('21', '2001', '北京市', '北京市', null, '2', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('22', '2002', '河北省', '河北省', null, '2', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('31', '3001', '广东省', '广东省', null, '3', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('100101', '100101', '上海市', '上海市', null, '11', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('100201', '100201', '苏州市', '苏州市', null, '12', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('100202', '100202', '南京市', '南京市', null, '12', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('100301', '100301', '杭州市', '杭州市', null, '13', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('200101', '200101', '北京市', '北京市', null, '21', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('200201', '200201', '邯郸市', '邯郸市', null, '22', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('200202', '200202', '唐山市', '唐山市', null, '22', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('300101', '300101', '广州市', '广州市', null, '31', '0', '2016-08-02 16:03:22', '2016-08-02 16:03:22');
INSERT INTO `sy_area` VALUES ('300102', '300102', '深圳市', '深圳市', null, '31', '0', '2016-08-02 16:03:23', '2016-08-02 16:03:23');
INSERT INTO `sy_area` VALUES ('300103', '300103', '厦门市', '厦门市', null, '31', '0', '2016-08-02 16:03:23', '2016-08-02 16:03:23');
