/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : bi

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2017-08-25 12:06:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sy_brand`
-- ----------------------------
DROP TABLE IF EXISTS `sy_brand`;
CREATE TABLE `sy_brand` (
  `BrandId` int(11) NOT NULL AUTO_INCREMENT,
  `BrandCode` varchar(255) DEFAULT NULL,
  `BrandName` varchar(255) DEFAULT NULL,
  `BrandDesc` varchar(255) DEFAULT NULL,
  `BrandSeq` int(11) DEFAULT NULL,
  `pBrandId` int(11) NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`BrandId`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sy_brand
-- ----------------------------
INSERT INTO `sy_brand` VALUES ('0', '0', 'Root', 'Root', null, '-1', '0', '2017-08-21 16:06:49', '2017-08-21 16:06:51');
INSERT INTO `sy_brand` VALUES ('1', '10', '必胜客', '必胜客', null, '0', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('2', '20', '肯德基', '肯德基', null, '0', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('3', '30', '东方既白', '东方既白', null, '0', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('4', '1001', '必胜客1', '必胜客1', null, '1', '0', '2016-06-25 14:05:45', '2017-08-24 14:26:56');
INSERT INTO `sy_brand` VALUES ('5', '1002', '必胜客2', '必胜客2', null, '1', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('6', '1003', '必胜客3', '必胜客3', null, '1', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('7', '2001', '肯德基1', '肯德基1', null, '2', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('8', '2002', '肯德基2', '肯德基2', null, '2', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('9', '2003', '肯德基3', '肯德基3', null, '2', '0', '2016-06-25 14:05:45', '2016-06-25 14:05:45');
INSERT INTO `sy_brand` VALUES ('10', '3001', '东方既白1', '东方既白1', null, '3', '0', '2016-06-25 14:05:46', '2016-06-25 14:05:46');
INSERT INTO `sy_brand` VALUES ('11', '3002', '东方既白2', '东方既白2', null, '3', '0', '2016-06-25 14:05:46', '2016-06-25 14:05:46');
INSERT INTO `sy_brand` VALUES ('12', '3003', '东方既白3', '东方既白3', null, '3', '0', '2016-06-25 14:05:46', '2016-06-25 14:05:46');
