/*
Navicat MySQL Data Transfer

Source Server         : 10.200.40.76
Source Server Version : 50711
Source Host           : 10.200.40.76:3306
Source Database       : hibernate

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-07-20 13:28:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authorities`
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `AUTHORITY` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AUTHORITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('Admin', 'Super User');
INSERT INTO `authorities` VALUES ('Anonymous', 'User has not logged in');
INSERT INTO `authorities` VALUES ('Authenticated', 'User has logged in');
INSERT INTO `authorities` VALUES ('bb', 'bb');
INSERT INTO `authorities` VALUES ('cc', 'cc');
INSERT INTO `authorities` VALUES ('ceo', 'Chief Executive Officer');
INSERT INTO `authorities` VALUES ('cto', 'Chief Technology Officer');
INSERT INTO `authorities` VALUES ('dev', 'Developer');
INSERT INTO `authorities` VALUES ('devmgr', 'Development Manager');
INSERT INTO `authorities` VALUES ('GM', '');
INSERT INTO `authorities` VALUES ('IM', '');
INSERT INTO `authorities` VALUES ('is', 'Information Services');
INSERT INTO `authorities` VALUES ('Power User', 'Power User 5.0');
INSERT INTO `authorities` VALUES ('SM', '');
INSERT INTO `authorities` VALUES ('usa', 'usa');
INSERT INTO `authorities` VALUES ('w', null);
INSERT INTO `authorities` VALUES ('zhjuu', 'test');
INSERT INTO `authorities` VALUES ('报表_分析_仪表盘', '');

-- ----------------------------
-- Table structure for `authoritie_menus`
-- ----------------------------
DROP TABLE IF EXISTS `authoritie_menus`;
CREATE TABLE `authoritie_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authoritie` varchar(32) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authoritie_menus
-- ----------------------------
INSERT INTO `authoritie_menus` VALUES ('12', 'Admin', '1');
INSERT INTO `authoritie_menus` VALUES ('13', 'Admin', '2');
INSERT INTO `authoritie_menus` VALUES ('14', 'Admin', '3');
INSERT INTO `authoritie_menus` VALUES ('15', 'Admin', '1000');
INSERT INTO `authoritie_menus` VALUES ('16', 'Admin', '1001');
INSERT INTO `authoritie_menus` VALUES ('17', 'Admin', '1002');
INSERT INTO `authoritie_menus` VALUES ('18', 'Admin', '1003');
INSERT INTO `authoritie_menus` VALUES ('19', 'Admin', '1004');
INSERT INTO `authoritie_menus` VALUES ('20', 'Admin', '2001');
INSERT INTO `authoritie_menus` VALUES ('21', 'Admin', '2002');
INSERT INTO `authoritie_menus` VALUES ('22', 'Admin', '2003');
INSERT INTO `authoritie_menus` VALUES ('23', 'Admin', '2004');
INSERT INTO `authoritie_menus` VALUES ('24', 'Admin', '2005');
INSERT INTO `authoritie_menus` VALUES ('25', 'Admin', '2006');
INSERT INTO `authoritie_menus` VALUES ('26', 'Admin', '2007');
INSERT INTO `authoritie_menus` VALUES ('27', 'Admin', '2008');
INSERT INTO `authoritie_menus` VALUES ('28', 'Admin', '2009');
INSERT INTO `authoritie_menus` VALUES ('29', 'Admin', '3001');
INSERT INTO `authoritie_menus` VALUES ('30', 'Admin', '3002');
INSERT INTO `authoritie_menus` VALUES ('31', 'Admin', '3003');
INSERT INTO `authoritie_menus` VALUES ('32', 'Admin', '3004');
INSERT INTO `authoritie_menus` VALUES ('33', 'Admin', '3005');
INSERT INTO `authoritie_menus` VALUES ('34', 'Admin', '3006');
INSERT INTO `authoritie_menus` VALUES ('35', 'Admin', '3007');
INSERT INTO `authoritie_menus` VALUES ('36', 'Admin', '3008');
INSERT INTO `authoritie_menus` VALUES ('37', 'Admin', '3009');
INSERT INTO `authoritie_menus` VALUES ('38', 'Admin', '3010');
INSERT INTO `authoritie_menus` VALUES ('39', 'Admin', '3011');
INSERT INTO `authoritie_menus` VALUES ('40', 'Admin', '3012');
INSERT INTO `authoritie_menus` VALUES ('41', 'Admin', '3013');
INSERT INTO `authoritie_menus` VALUES ('42', 'Admin', '3014');
INSERT INTO `authoritie_menus` VALUES ('43', 'Admin', '3015');
INSERT INTO `authoritie_menus` VALUES ('44', 'ceo', '1000');
INSERT INTO `authoritie_menus` VALUES ('45', 'ceo', '1001');
INSERT INTO `authoritie_menus` VALUES ('46', 'ceo', '1002');
INSERT INTO `authoritie_menus` VALUES ('47', 'ceo', '1003');
INSERT INTO `authoritie_menus` VALUES ('48', 'ceo', '1004');
INSERT INTO `authoritie_menus` VALUES ('50', 'ceo', '1');
INSERT INTO `authoritie_menus` VALUES ('53', 'usa', '1');
INSERT INTO `authoritie_menus` VALUES ('54', 'usa', '1000');
INSERT INTO `authoritie_menus` VALUES ('55', 'bb', '1');
INSERT INTO `authoritie_menus` VALUES ('60', '报表_分析_仪表盘', '2');
INSERT INTO `authoritie_menus` VALUES ('61', '报表_分析_仪表盘', '3001');
INSERT INTO `authoritie_menus` VALUES ('62', '报表_分析_仪表盘', '3002');
INSERT INTO `authoritie_menus` VALUES ('63', '报表_分析_仪表盘', '3003');
INSERT INTO `authoritie_menus` VALUES ('64', '报表_分析_仪表盘', '1');
INSERT INTO `authoritie_menus` VALUES ('65', '报表_分析_仪表盘', '3');
INSERT INTO `authoritie_menus` VALUES ('66', '报表_分析_仪表盘', '1000');
INSERT INTO `authoritie_menus` VALUES ('67', '报表_分析_仪表盘', '1001');
INSERT INTO `authoritie_menus` VALUES ('68', '报表_分析_仪表盘', '1004');
INSERT INTO `authoritie_menus` VALUES ('69', '报表_分析_仪表盘', '2001');
INSERT INTO `authoritie_menus` VALUES ('70', '报表_分析_仪表盘', '2003');
INSERT INTO `authoritie_menus` VALUES ('71', '报表_分析_仪表盘', '3005');
INSERT INTO `authoritie_menus` VALUES ('72', '报表_分析_仪表盘', '3007');
INSERT INTO `authoritie_menus` VALUES ('91', 'Anonymous', '12');
INSERT INTO `authoritie_menus` VALUES ('92', 'Anonymous', '13');
INSERT INTO `authoritie_menus` VALUES ('93', 'Anonymous', '14');
INSERT INTO `authoritie_menus` VALUES ('94', 'Anonymous', '15');
INSERT INTO `authoritie_menus` VALUES ('95', 'Anonymous', '16');
INSERT INTO `authoritie_menus` VALUES ('96', 'Anonymous', '17');
INSERT INTO `authoritie_menus` VALUES ('97', 'Anonymous', '18');
INSERT INTO `authoritie_menus` VALUES ('98', 'Anonymous', '19');
INSERT INTO `authoritie_menus` VALUES ('99', 'Anonymous', '20');
INSERT INTO `authoritie_menus` VALUES ('100', 'Anonymous', '21');
INSERT INTO `authoritie_menus` VALUES ('101', 'Anonymous', '22');
INSERT INTO `authoritie_menus` VALUES ('102', 'Anonymous', '23');
INSERT INTO `authoritie_menus` VALUES ('103', 'Anonymous', '24');
INSERT INTO `authoritie_menus` VALUES ('104', 'Anonymous', '25');
INSERT INTO `authoritie_menus` VALUES ('105', 'Anonymous', '26');
INSERT INTO `authoritie_menus` VALUES ('106', 'Anonymous', '27');
INSERT INTO `authoritie_menus` VALUES ('107', 'Anonymous', '28');
INSERT INTO `authoritie_menus` VALUES ('108', 'Anonymous', '29');
INSERT INTO `authoritie_menus` VALUES ('109', 'Anonymous', '30');
INSERT INTO `authoritie_menus` VALUES ('110', 'Anonymous', '31');
INSERT INTO `authoritie_menus` VALUES ('123', 'Anonymous', '12');
INSERT INTO `authoritie_menus` VALUES ('124', 'Anonymous', '13');
INSERT INTO `authoritie_menus` VALUES ('125', 'Anonymous', '14');
INSERT INTO `authoritie_menus` VALUES ('126', 'Anonymous', '15');
INSERT INTO `authoritie_menus` VALUES ('127', 'Anonymous', '16');
INSERT INTO `authoritie_menus` VALUES ('128', 'Anonymous', '17');
INSERT INTO `authoritie_menus` VALUES ('129', 'Anonymous', '18');
INSERT INTO `authoritie_menus` VALUES ('130', 'Anonymous', '19');
INSERT INTO `authoritie_menus` VALUES ('131', 'Anonymous', '20');
INSERT INTO `authoritie_menus` VALUES ('132', 'Anonymous', '21');
INSERT INTO `authoritie_menus` VALUES ('133', 'Anonymous', '22');
INSERT INTO `authoritie_menus` VALUES ('134', 'Anonymous', '23');
INSERT INTO `authoritie_menus` VALUES ('135', 'Anonymous', '24');
INSERT INTO `authoritie_menus` VALUES ('136', 'Anonymous', '25');
INSERT INTO `authoritie_menus` VALUES ('137', 'Anonymous', '26');
INSERT INTO `authoritie_menus` VALUES ('138', 'Anonymous', '27');
INSERT INTO `authoritie_menus` VALUES ('146', 'Anonymous', '27');
INSERT INTO `authoritie_menus` VALUES ('147', 'Anonymous', '31');
INSERT INTO `authoritie_menus` VALUES ('148', 'Anonymous', '31');
INSERT INTO `authoritie_menus` VALUES ('149', 'Anonymous', '30');
INSERT INTO `authoritie_menus` VALUES ('156', 'Anonymous', '31');
INSERT INTO `authoritie_menus` VALUES ('157', 'Authenticated', '31');
INSERT INTO `authoritie_menus` VALUES ('158', 'Authenticated', '27');
INSERT INTO `authoritie_menus` VALUES ('174', 'Anonymous', '7');
INSERT INTO `authoritie_menus` VALUES ('175', 'Anonymous', '8');
INSERT INTO `authoritie_menus` VALUES ('176', 'Anonymous', '9');
INSERT INTO `authoritie_menus` VALUES ('177', 'Anonymous', '10');
INSERT INTO `authoritie_menus` VALUES ('178', 'Anonymous', '11');
INSERT INTO `authoritie_menus` VALUES ('179', 'Anonymous', '12');
INSERT INTO `authoritie_menus` VALUES ('180', 'Anonymous', '13');
INSERT INTO `authoritie_menus` VALUES ('181', 'Anonymous', '14');
INSERT INTO `authoritie_menus` VALUES ('182', 'Anonymous', '15');
INSERT INTO `authoritie_menus` VALUES ('183', 'Anonymous', '16');
INSERT INTO `authoritie_menus` VALUES ('184', 'Anonymous', '17');
INSERT INTO `authoritie_menus` VALUES ('185', 'Anonymous', '18');
INSERT INTO `authoritie_menus` VALUES ('186', 'Anonymous', '19');
INSERT INTO `authoritie_menus` VALUES ('187', 'Anonymous', '20');
INSERT INTO `authoritie_menus` VALUES ('188', 'Anonymous', '21');
INSERT INTO `authoritie_menus` VALUES ('189', 'Anonymous', '22');
INSERT INTO `authoritie_menus` VALUES ('190', 'Anonymous', '23');
INSERT INTO `authoritie_menus` VALUES ('191', 'Anonymous', '24');
INSERT INTO `authoritie_menus` VALUES ('192', 'Anonymous', '25');
INSERT INTO `authoritie_menus` VALUES ('193', 'Anonymous', '26');
INSERT INTO `authoritie_menus` VALUES ('194', 'Anonymous', '27');
INSERT INTO `authoritie_menus` VALUES ('255', 'zhjuu', '0');
INSERT INTO `authoritie_menus` VALUES ('256', 'zhjuu', '1');
INSERT INTO `authoritie_menus` VALUES ('257', 'zhjuu', '2');
INSERT INTO `authoritie_menus` VALUES ('258', 'zhjuu', '3');
INSERT INTO `authoritie_menus` VALUES ('259', 'zhjuu', '1000');
INSERT INTO `authoritie_menus` VALUES ('260', 'zhjuu', '1001');
INSERT INTO `authoritie_menus` VALUES ('261', 'zhjuu', '1002');
INSERT INTO `authoritie_menus` VALUES ('262', 'zhjuu', '1003');
INSERT INTO `authoritie_menus` VALUES ('263', 'zhjuu', '1004');
INSERT INTO `authoritie_menus` VALUES ('264', 'zhjuu', '2001');
INSERT INTO `authoritie_menus` VALUES ('265', 'zhjuu', '2002');
INSERT INTO `authoritie_menus` VALUES ('266', 'zhjuu', '2003');
INSERT INTO `authoritie_menus` VALUES ('267', 'zhjuu', '2004');
INSERT INTO `authoritie_menus` VALUES ('268', 'zhjuu', '2005');
INSERT INTO `authoritie_menus` VALUES ('269', 'zhjuu', '2006');
INSERT INTO `authoritie_menus` VALUES ('270', 'zhjuu', '2007');
INSERT INTO `authoritie_menus` VALUES ('271', 'zhjuu', '2008');
INSERT INTO `authoritie_menus` VALUES ('272', 'zhjuu', '2009');
INSERT INTO `authoritie_menus` VALUES ('273', 'zhjuu', '3001');
INSERT INTO `authoritie_menus` VALUES ('274', 'zhjuu', '3002');
INSERT INTO `authoritie_menus` VALUES ('275', 'zhjuu', '3003');
INSERT INTO `authoritie_menus` VALUES ('276', 'zhjuu', '3004');
INSERT INTO `authoritie_menus` VALUES ('277', 'zhjuu', '3005');
INSERT INTO `authoritie_menus` VALUES ('278', 'zhjuu', '3006');
INSERT INTO `authoritie_menus` VALUES ('279', 'zhjuu', '3007');
INSERT INTO `authoritie_menus` VALUES ('280', 'zhjuu', '3008');
INSERT INTO `authoritie_menus` VALUES ('281', 'zhjuu', '3009');
INSERT INTO `authoritie_menus` VALUES ('282', 'zhjuu', '3010');
INSERT INTO `authoritie_menus` VALUES ('283', 'zhjuu', '3011');
INSERT INTO `authoritie_menus` VALUES ('284', 'zhjuu', '3012');
INSERT INTO `authoritie_menus` VALUES ('285', 'zhjuu', '3013');
INSERT INTO `authoritie_menus` VALUES ('286', 'zhjuu', '3014');
INSERT INTO `authoritie_menus` VALUES ('287', 'Authenticated', '24');
INSERT INTO `authoritie_menus` VALUES ('288', 'Authenticated', '11');
INSERT INTO `authoritie_menus` VALUES ('302', 'Admin', '4005');
INSERT INTO `authoritie_menus` VALUES ('303', 'Admin', '3017');
INSERT INTO `authoritie_menus` VALUES ('304', 'Admin', '4001');
INSERT INTO `authoritie_menus` VALUES ('305', 'Admin', '4');
INSERT INTO `authoritie_menus` VALUES ('306', 'Admin', '4002');
INSERT INTO `authoritie_menus` VALUES ('307', 'Admin', '4003');
INSERT INTO `authoritie_menus` VALUES ('308', 'Admin', '4004');
INSERT INTO `authoritie_menus` VALUES ('309', 'Admin', '5');
INSERT INTO `authoritie_menus` VALUES ('310', 'Admin', '5001');
INSERT INTO `authoritie_menus` VALUES ('311', 'Admin', '5002');
INSERT INTO `authoritie_menus` VALUES ('312', 'Admin', '5003');
INSERT INTO `authoritie_menus` VALUES ('313', 'Admin', '5004');
INSERT INTO `authoritie_menus` VALUES ('314', 'Admin', '5005');
INSERT INTO `authoritie_menus` VALUES ('316', 'bb', '2');
INSERT INTO `authoritie_menus` VALUES ('317', '报表_分析_仪表盘', '4');
INSERT INTO `authoritie_menus` VALUES ('318', '报表_分析_仪表盘', '4002');
INSERT INTO `authoritie_menus` VALUES ('319', '报表_分析_仪表盘', '3011');
INSERT INTO `authoritie_menus` VALUES ('320', 'Admin', '5006');
INSERT INTO `authoritie_menus` VALUES ('321', 'Admin', '5007');
INSERT INTO `authoritie_menus` VALUES ('322', 'Admin', '1005');
INSERT INTO `authoritie_menus` VALUES ('323', 'Admin', '1006');
INSERT INTO `authoritie_menus` VALUES ('324', 'TaoPengFei', '1');
INSERT INTO `authoritie_menus` VALUES ('325', 'TaoPengFei', '1005');
INSERT INTO `authoritie_menus` VALUES ('326', 'bb', '4');
INSERT INTO `authoritie_menus` VALUES ('327', 'bb', '1005');
INSERT INTO `authoritie_menus` VALUES ('329', 'bb', '1007');
INSERT INTO `authoritie_menus` VALUES ('330', 'Admin', '1007');
INSERT INTO `authoritie_menus` VALUES ('331', 'Admin', '1008');
INSERT INTO `authoritie_menus` VALUES ('332', 'Admin', '1009');
INSERT INTO `authoritie_menus` VALUES ('333', 'Admin', '1010');
INSERT INTO `authoritie_menus` VALUES ('334', 'Admin', '1011');
INSERT INTO `authoritie_menus` VALUES ('335', 'Admin', '1012');
INSERT INTO `authoritie_menus` VALUES ('336', 'Admin', '1013');
INSERT INTO `authoritie_menus` VALUES ('337', 'Admin', '1014');
INSERT INTO `authoritie_menus` VALUES ('338', 'Admin', '1015');
INSERT INTO `authoritie_menus` VALUES ('339', 'Admin', '1016');
INSERT INTO `authoritie_menus` VALUES ('340', 'Admin', '5008');

-- ----------------------------
-- Table structure for `bdparams`
-- ----------------------------
DROP TABLE IF EXISTS `bdparams`;
CREATE TABLE `bdparams` (
  `ITEMID` varchar(100) NOT NULL,
  `PARAMVALUE` varchar(50) DEFAULT NULL,
  `PARAMKEY` varchar(50) NOT NULL,
  PRIMARY KEY (`ITEMID`,`PARAMKEY`),
  KEY `FK61733C48FA34BFDC` (`ITEMID`),
  CONSTRAINT `FK61733C48FA34BFDC` FOREIGN KEY (`ITEMID`) REFERENCES `rtelement` (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdparams
-- ----------------------------

-- ----------------------------
-- Table structure for `cdf_storage`
-- ----------------------------
DROP TABLE IF EXISTS `cdf_storage`;
CREATE TABLE `cdf_storage` (
  `storageid` int(11) NOT NULL AUTO_INCREMENT,
  `pentahouser` varchar(255) DEFAULT NULL,
  `storagevalue` longtext,
  `lastupdated` datetime NOT NULL,
  PRIMARY KEY (`storageid`),
  KEY `cdf_storage_user_idx` (`pentahouser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdf_storage
-- ----------------------------

-- ----------------------------
-- Table structure for `cplxparams`
-- ----------------------------
DROP TABLE IF EXISTS `cplxparams`;
CREATE TABLE `cplxparams` (
  `ITEMID` varchar(100) NOT NULL,
  `PARAMVALUE` longblob,
  `PARAMKEY` varchar(50) NOT NULL,
  PRIMARY KEY (`ITEMID`,`PARAMKEY`),
  KEY `FKD6D6E97FFA34BFDC` (`ITEMID`),
  CONSTRAINT `FKD6D6E97FFA34BFDC` FOREIGN KEY (`ITEMID`) REFERENCES `rtelement` (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cplxparams
-- ----------------------------

-- ----------------------------
-- Table structure for `datasource`
-- ----------------------------
DROP TABLE IF EXISTS `datasource`;
CREATE TABLE `datasource` (
  `NAME` varchar(50) NOT NULL,
  `MAXACTCONN` int(11) NOT NULL,
  `DRIVERCLASS` varchar(50) NOT NULL,
  `IDLECONN` int(11) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(150) DEFAULT NULL,
  `URL` varchar(512) NOT NULL,
  `QUERY` varchar(100) DEFAULT NULL,
  `WAIT` int(11) NOT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datasource
-- ----------------------------
INSERT INTO `datasource` VALUES ('SampleData', '20', 'org.hsqldb.jdbcDriver', '5', 'pentaho_user', 'cGFzc3dvcmQ=', 'jdbc:hsqldb:hsql://localhost:9001/sampledata', 'select count(*) from INFORMATION_SCHEMA.SYSTEM_SEQUENCES', '1000');

-- ----------------------------
-- Table structure for `dtparams`
-- ----------------------------
DROP TABLE IF EXISTS `dtparams`;
CREATE TABLE `dtparams` (
  `ITEMID` varchar(100) NOT NULL,
  `PARAMVALUE` datetime DEFAULT NULL,
  `PARAMKEY` varchar(50) NOT NULL,
  PRIMARY KEY (`ITEMID`,`PARAMKEY`),
  KEY `FK7F994A16FA34BFDC` (`ITEMID`),
  CONSTRAINT `FK7F994A16FA34BFDC` FOREIGN KEY (`ITEMID`) REFERENCES `rtelement` (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dtparams
-- ----------------------------

-- ----------------------------
-- Table structure for `granted_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `granted_authorities`;
CREATE TABLE `granted_authorities` (
  `USERNAME` varchar(50) NOT NULL,
  `AUTHORITY` varchar(50) NOT NULL,
  PRIMARY KEY (`USERNAME`,`AUTHORITY`),
  KEY `FK7471775D41B6DA97` (`AUTHORITY`),
  KEY `FK7471775DD9EDC77F` (`USERNAME`),
  CONSTRAINT `FK7471775D41B6DA97` FOREIGN KEY (`AUTHORITY`) REFERENCES `authorities` (`AUTHORITY`),
  CONSTRAINT `FK7471775DD9EDC77F` FOREIGN KEY (`USERNAME`) REFERENCES `users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of granted_authorities
-- ----------------------------
INSERT INTO `granted_authorities` VALUES ('admin', 'Admin');
INSERT INTO `granted_authorities` VALUES ('shao', 'Admin');
INSERT INTO `granted_authorities` VALUES ('zhujj', 'Admin');
INSERT INTO `granted_authorities` VALUES ('111', 'Anonymous');
INSERT INTO `granted_authorities` VALUES ('ceo1', 'Anonymous');
INSERT INTO `granted_authorities` VALUES ('admin', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('ceo1', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('gm', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('joe', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('pat', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('sm', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('suzy', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('tiffany', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('usa1', 'Authenticated');
INSERT INTO `granted_authorities` VALUES ('im', 'bb');
INSERT INTO `granted_authorities` VALUES ('qq', 'bb');
INSERT INTO `granted_authorities` VALUES ('TaoPengFei', 'bb');
INSERT INTO `granted_authorities` VALUES ('joe', 'ceo');
INSERT INTO `granted_authorities` VALUES ('suzy', 'cto');
INSERT INTO `granted_authorities` VALUES ('pat', 'dev');
INSERT INTO `granted_authorities` VALUES ('suzy', 'dev');
INSERT INTO `granted_authorities` VALUES ('tiffany', 'dev');
INSERT INTO `granted_authorities` VALUES ('tiffany', 'devmgr');
INSERT INTO `granted_authorities` VALUES ('ceo1', 'Power User');
INSERT INTO `granted_authorities` VALUES ('usa1', 'Power User');
INSERT INTO `granted_authorities` VALUES ('usa1', 'usa');
INSERT INTO `granted_authorities` VALUES ('zhujiejiao', 'zhjuu');
INSERT INTO `granted_authorities` VALUES ('aa', '报表_分析_仪表盘');
INSERT INTO `granted_authorities` VALUES ('tpf', '报表_分析_仪表盘');
INSERT INTO `granted_authorities` VALUES ('ywa', '报表_分析_仪表盘');

-- ----------------------------
-- Table structure for `lngparams`
-- ----------------------------
DROP TABLE IF EXISTS `lngparams`;
CREATE TABLE `lngparams` (
  `ITEMID` varchar(100) NOT NULL,
  `PARAMVALUE` bigint(20) DEFAULT NULL,
  `PARAMKEY` varchar(50) NOT NULL,
  PRIMARY KEY (`ITEMID`,`PARAMKEY`),
  KEY `FKE304FCCBFA34BFDC` (`ITEMID`),
  CONSTRAINT `FKE304FCCBFA34BFDC` FOREIGN KEY (`ITEMID`) REFERENCES `rtelement` (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lngparams
-- ----------------------------

-- ----------------------------
-- Table structure for `lsparams`
-- ----------------------------
DROP TABLE IF EXISTS `lsparams`;
CREATE TABLE `lsparams` (
  `ITEMID` varchar(100) NOT NULL,
  `PARAMVALUE` longtext,
  `PARAMKEY` varchar(50) NOT NULL,
  PRIMARY KEY (`ITEMID`,`PARAMKEY`),
  KEY `FK89BC75CDFA34BFDC` (`ITEMID`),
  CONSTRAINT `FK89BC75CDFA34BFDC` FOREIGN KEY (`ITEMID`) REFERENCES `rtelement` (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lsparams
-- ----------------------------

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `menuid` int(11) NOT NULL,
  `menuname` varchar(32) DEFAULT NULL,
  `menuurl` varchar(200) NOT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `deletetag` varchar(32) DEFAULT NULL COMMENT '1 删除  0 保留',
  `modifytime` datetime DEFAULT NULL,
  `menuname_en` varchar(200) NOT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('0', '管理平台', '', '-1', '0', 'icon-cloud', '0', '2016-11-11 15:25:47', 'Management Platform');
INSERT INTO `menus` VALUES ('1', '仪表盘', '1', '0', '1', 'fa-dashboard', '0', '2016-11-11 15:25:47', 'Dashboard');
INSERT INTO `menus` VALUES ('2', '综合报表', '1', '0', '2', 'fa-table', '0', '2016-11-11 15:25:47', 'Integrated Report');
INSERT INTO `menus` VALUES ('3', '数据分析', '1', '0', '3', 'fa-edit (alias)', '0', '2016-11-11 15:25:47', 'Data Analysis');
INSERT INTO `menus` VALUES ('4', '定制报表', '1', '0', '4', 'fa-table', '0', '2017-01-16 11:00:00', 'Custom Report');
INSERT INTO `menus` VALUES ('5', '技术测试', '1', '0', '5', 'fa-edit', '0', '2017-02-28 14:51:09', 'Technical Test');
INSERT INTO `menus` VALUES ('1000', '首页仪表盘', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard0.wcdf/generatedContent', '1', '1', 'fa-file', '0', '2016-11-11 15:25:47', 'Home Dashboard');
INSERT INTO `menus` VALUES ('1001', '营业总览', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard1.wcdf/generatedContent', '1', '1', 'fa-file', '0', '2016-11-11 15:25:47', 'Business Overview');
INSERT INTO `menus` VALUES ('1002', '前20餐品分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard2.wcdf/generatedContent', '1', '2', 'fa-file', '0', '2016-11-11 15:25:48', 'Analysis Of The Top 20 Items');
INSERT INTO `menus` VALUES ('1003', '分类销售分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard3.wcdf/generatedContent', '1', '3', 'fa-file', '0', '2016-11-11 15:25:48', 'Classified Sales Analysis');
INSERT INTO `menus` VALUES ('1004', '趋势分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard4.wcdf/generatedContent', '1', '4', 'fa-file', '0', '2016-11-11 15:25:48', 'Trend Analysis');
INSERT INTO `menus` VALUES ('1005', '运营总监', '/pentaho/api/repos/%3Apublic%3Adashboard%3AOperationsDirector%3AOperationsDirector.wcdf/generatedContent', '1', '5', 'fa-file', '0', '2017-05-08 14:13:17', 'Operations Director');
INSERT INTO `menus` VALUES ('1006', '常用报表分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3ATemplate7.wcdf/generatedContent', '1', '6', 'fa-file', '0', '2017-05-10 11:43:27', 'Template7');
INSERT INTO `menus` VALUES ('1007', '门店经营情况分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3AStoreOperation%3AStoreOperation.wcdf/generatedContent', '1', '7', 'fa-file', '0', '2017-05-11 09:56:19', 'Outlet Analysis');
INSERT INTO `menus` VALUES ('1008', '菜品销售分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard11.wcdf/generatedContent', '1', '8', 'fa-file', '0', '2017-05-12 10:22:10', 'Items Sales Analysis');
INSERT INTO `menus` VALUES ('1009', '财务总监', '/pentaho/api/repos/%3Apublic%3Adashboard%3AFinancialController%3AFinancialController.wcdf/generatedContent', '1', '9', 'fa-file', '0', '2017-05-12 10:52:56', 'Finance Director');
INSERT INTO `menus` VALUES ('1010', '销售数据分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3ATemplate8.wcdf/generatedContent', '1', '10', 'fa-file', '0', '2017-05-15 13:02:17', 'Sales Data Aanalysis');
INSERT INTO `menus` VALUES ('1011', '销售达成率分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3ATemplate9.wcdf/generatedContent', '1', '11', 'fa-file', '0', '2017-05-15 13:03:58', 'Sales Achievement Analysis');
INSERT INTO `menus` VALUES ('1012', '总体销售概况', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard12.wcdf/generatedContent', '1', '12', 'fa-file', '0', '2017-05-15 13:56:41', 'General Sales Overview');
INSERT INTO `menus` VALUES ('1013', '总经理', '/pentaho/api/repos/%3Apublic%3Adashboard%3AGeneralManager%3AGeneralManager.wcdf/generatedContent', '1', '13', 'fa-file', '0', '2017-05-16 11:25:47', 'General Manager');
INSERT INTO `menus` VALUES ('1014', '销售概况报表', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard14.wcdf/generatedContent', '1', '14', 'fa-file', '0', '2017-05-16 15:24:30', 'Sales Overview Report');
INSERT INTO `menus` VALUES ('1015', '时间分析', '/pentaho/api/repos/%3Apublic%3Adashboard%3Adashboard13.wcdf/generatedContent', '1', '15', 'fa-file', '0', '2017-05-17 13:54:08', 'Time Analysis');
INSERT INTO `menus` VALUES ('1016', '菜品分类销售额(按月)', '/pentaho/api/repos/%3Apublic%3Adashboard%3ATemplateComponent.wcdf/generatedContent', '1', '16', 'fa-file', '0', '2017-05-25 16:38:31', 'Template Component');
INSERT INTO `menus` VALUES ('2001', '门店销售分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3AOutletsale_yearmonth.saiku', '3', '1', 'fa-file', '0', '2016-11-11 15:25:48', 'Store Sales Analysis');
INSERT INTO `menus` VALUES ('2002', '餐品销售分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3Aclasssale_year.saiku', '3', '2', 'fa-file', '0', '2016-11-11 15:25:48', 'Meal Sales Analysis');
INSERT INTO `menus` VALUES ('2003', '客层分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3ACheckGrade_yearweek.saiku', '3', '3', 'fa-file', '0', '2016-11-11 15:25:48', 'Guest Layer Analysis');
INSERT INTO `menus` VALUES ('2004', '客层单品分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3Acheckitem_grade.saiku', '3', '4', 'fa-file', '0', '2016-11-11 15:25:48', 'Single Product Analysis');
INSERT INTO `menus` VALUES ('2005', '时间带分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3ACheckHour_yearWeek.saiku', '3', '5', 'fa-file', '0', '2016-11-11 15:25:48', 'Time Band Analysis');
INSERT INTO `menus` VALUES ('2006', '品类结构分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3Acategory_structrue.saiku', '3', '6', 'fa-file', '0', '2016-11-11 15:25:48', 'Category Structure Analysis');
INSERT INTO `menus` VALUES ('2007', '付款类型分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3Asale_pay.saiku', '3', '7', 'fa-file', '0', '2016-11-11 15:25:48', 'Payment Type Analysis');
INSERT INTO `menus` VALUES ('2008', '折扣类型分析', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3Asale_discount.saiku', '3', '8', 'fa-file', '0', '2016-11-11 15:25:48', 'Discount Type Analysis');
INSERT INTO `menus` VALUES ('2009', '销售预算达成率', '/pentaho/content/saiku-ui/index.html?biplugin5=true&dimension_prefetch=false#query/open/%3Apublic%3Aadmin%3Asale_budget.saiku', '3', '9', 'fa-file', '0', '2016-11-11 15:25:48', 'Sales Budget Analysis');
INSERT INTO `menus` VALUES ('3001', '营业日报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_daily_report_jsp.jsp/content', '2', '1', 'fa-file', '0', '2016-11-11 15:25:48', 'Business Daily');
INSERT INTO `menus` VALUES ('3002', '门店营业概况', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_outlet_summery_report_jsp.jsp/content', '2', '2', 'fa-file', '0', '2016-11-11 15:25:48', 'General Situation Of Store');
INSERT INTO `menus` VALUES ('3003', '销售趋势分析', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_sale_trend_analyze_jsp.jsp/content', '2', '3', 'fa-file', '0', '2016-11-11 15:25:48', 'Sales Trend Analysis');
INSERT INTO `menus` VALUES ('3004', '客层时间段报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_guest_hour_report_jsp.jsp/content', '2', '4', 'fa-file', '0', '2016-11-11 15:25:48', 'Guest Hour Report');
INSERT INTO `menus` VALUES ('3005', '营业综合分析', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_outlet_sale_summery_analyze_jsp.jsp/content', '2', '5', 'fa-file', '0', '2016-11-11 15:25:48', 'Business Summery Analysis');
INSERT INTO `menus` VALUES ('3006', '餐品销售综合分析', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_Item_sale_summery_analyze_jsp.jsp/content', '2', '6', 'fa-file', '0', '2016-11-11 15:25:48', 'Summery Analysis Of Sales');
INSERT INTO `menus` VALUES ('3007', '门店同比环比分析', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_sale_previous_compare_analyze_jsp.jsp/content', '2', '7', 'fa-file', '0', '2016-11-11 15:25:48', 'Store Chain Analysis');
INSERT INTO `menus` VALUES ('3008', '品类结构分析', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_category_structure_analyze_jsp.jsp/content', '2', '8', 'fa-file', '0', '2016-11-11 15:25:48', 'Category Structure Analysis');
INSERT INTO `menus` VALUES ('3009', '品类角色分析', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_category_role_report_jsp.jsp/content', '2', '9', 'fa-file', '0', '2016-11-11 15:25:48', 'Category Role Analysis');
INSERT INTO `menus` VALUES ('3010', '账单明细', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_CheckReceipt_Report_jsp.jsp/content', '2', '10', 'fa-file', '0', '2016-11-11 15:25:49', 'Bill Details Report');
INSERT INTO `menus` VALUES ('3011', '每日营业报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_daily_sales_report_jsp.jsp/content', '2', '11', 'fa-file', '0', '2016-11-11 15:25:49', 'Daily Business Report');
INSERT INTO `menus` VALUES ('3012', '异常报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_exception_report_jsp.jsp/content', '2', '12', 'fa-file', '0', '2016-11-11 15:25:49', 'Exception Report');
INSERT INTO `menus` VALUES ('3013', '餐品评级报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_Item_grade_report_jsp.jsp/content', '2', '13', 'fa-file', '0', '2016-11-11 15:25:49', 'Meal Rating Report');
INSERT INTO `menus` VALUES ('3014', '滞销报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_unsalable_report_jsp.jsp/content', '2', '14', 'fa-file', '0', '2016-11-11 15:25:49', 'Unsalable Report');
INSERT INTO `menus` VALUES ('3015', '营业记录报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_salesrecord_jsp.jsp/content', '2', '15', 'fa-file', '0', '2016-12-19 18:32:32', 'Business Record Report');
INSERT INTO `menus` VALUES ('3017', '每月收入报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_monthly_revenue_jsp.jsp/content', '2', '17', 'fa-file', '0', '2017-01-03 10:28:32', 'Monthly Iincome Statement Report');
INSERT INTO `menus` VALUES ('4001', '菜品销售报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_food_sales_report_jsp.jsp/content', '4', '1', 'fa-file', '0', '2017-01-16 10:43:32', 'Food Sales Report');
INSERT INTO `menus` VALUES ('4002', '营业收入报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_taking_report_jsp.jsp/content', '4', '2', 'fa-file', '0', '2017-01-18 10:00:00', 'Business Income Report');
INSERT INTO `menus` VALUES ('4003', '优惠折后汇总表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_discounttype_jsp.jsp/content', '4', '3', 'fa-file', '0', '2017-01-18 11:32:32', 'Summary Discount Report');
INSERT INTO `menus` VALUES ('4004', '退菜流水记录报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_back_item_record_jsp.jsp/content', '4', '4', 'fa-file', '0', '2017-01-18 11:38:32', 'Back Dish water Record Report');
INSERT INTO `menus` VALUES ('4005', '收款流水账报表', '/pentaho/api/repos/%3Apublic%3Areport%3Asy_receivable_jsp.jsp/content', '4', '5', 'fa-file', '0', '2016-12-28 10:16:32', 'Accounts Receivable Account Report');
INSERT INTO `menus` VALUES ('5001', '嵌入查询面板', '/pentaho/api/repos/%3Apublic%3Atest%3Asy_food_sales_report.prpt/viewer', '5', '1', 'fa-file', '0', '2017-02-28 14:54:21', 'Embedded Query Panel');
INSERT INTO `menus` VALUES ('5002', '增强版日期控件', '/pentaho/api/repos/%3Apublic%3Atest%3AReportDemo.jsp/content', '5', '2', 'fa-file', '0', '2017-03-16 18:19:21', 'Enhanced Date Range Picker');
INSERT INTO `menus` VALUES ('5003', '报表链接OLAP数据源', '/pentaho/api/repos/%3Apublic%3Atest%3Areport_link_olap.prpt/viewer', '5', '3', 'fa-file', '0', '2017-03-17 10:30:35', 'Report Link OLAP');
INSERT INTO `menus` VALUES ('5004', '仪表盘链接OLAP数据源', '/pentaho/api/repos/%3Apublic%3Atest%3Acde_link_olap%3Acde_link_olap.wcdf/generatedContent', '5', '4', 'fa-file', '0', '2017-03-17 10:39:21', 'Dashboard Link OLAP');
INSERT INTO `menus` VALUES ('5005', '树形查询', '/pentaho/api/repos/%3Apublic%3Atest%3AReportTrees.jsp/content', '5', '5', 'fa-file', '0', '2017-03-17 12:49:55', 'Tree Search');
INSERT INTO `menus` VALUES ('5006', '报表查询第二版页面', '/pentaho/api/repos/%3Apublic%3Atest%3Asy_food_sales_report_jsp.jsp/content', '5', '6', 'fa-file', '0', '2017-04-26 16:19:38', 'New Report UI');
INSERT INTO `menus` VALUES ('5007', '仪表盘布局模板', '/pentaho/api/repos/%3Apublic%3AUI%3ATemplate2%3ATemplate2.wcdf/generatedContent', '5', '7', 'fa-file', '0', '2017-05-05 13:12:43', 'Dashboard UI Template');
INSERT INTO `menus` VALUES ('5008', 'CDE新版查询面板', '/pentaho/api/repos/%3Apublic%3Adashboard%3APentahoCDEFilter%3APentahoCDEFilter.wcdf/generatedContent', '5', '8', 'fa-file', '0', '2017-06-30 16:28:19', 'New CDE Filter Panel');

-- ----------------------------
-- Table structure for `paramtypesmap`
-- ----------------------------
DROP TABLE IF EXISTS `paramtypesmap`;
CREATE TABLE `paramtypesmap` (
  `ITEMID` varchar(100) NOT NULL,
  `PARAMVALUE` varchar(25) DEFAULT NULL,
  `PARAMKEY` varchar(50) NOT NULL,
  PRIMARY KEY (`ITEMID`,`PARAMKEY`),
  KEY `FKD3EDA1B0FA34BFDC` (`ITEMID`),
  CONSTRAINT `FKD3EDA1B0FA34BFDC` FOREIGN KEY (`ITEMID`) REFERENCES `rtelement` (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paramtypesmap
-- ----------------------------

-- ----------------------------
-- Table structure for `pro_acls_list`
-- ----------------------------
DROP TABLE IF EXISTS `pro_acls_list`;
CREATE TABLE `pro_acls_list` (
  `ACL_ID` varchar(100) NOT NULL,
  `ACL_MASK` int(11) NOT NULL,
  `RECIP_TYPE` int(11) NOT NULL,
  `RECIPIENT` varchar(255) NOT NULL,
  `ACL_POSITION` int(11) NOT NULL,
  PRIMARY KEY (`ACL_ID`,`ACL_POSITION`),
  KEY `FKB65646C2B23C5D30` (`ACL_ID`),
  CONSTRAINT `FKB65646C2B23C5D30` FOREIGN KEY (`ACL_ID`) REFERENCES `pro_files` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_acls_list
-- ----------------------------

-- ----------------------------
-- Table structure for `pro_files`
-- ----------------------------
DROP TABLE IF EXISTS `pro_files`;
CREATE TABLE `pro_files` (
  `FILE_ID` varchar(100) NOT NULL,
  `revision` int(11) NOT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `fileName` varchar(255) NOT NULL,
  #`fullPath` varchar(767) NOT NULL,
  `fullPath` varchar(255) NOT NULL,
  `data` longblob,
  `directory` bit(1) NOT NULL,
  `lastModified` bigint(20) NOT NULL,
  `CHILD_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  UNIQUE KEY `fullPath` (`fullPath`),
  KEY `FK94A87E2569FABF5E` (`CHILD_ID`),
  KEY `FK94A87E25CBBBB0EA` (`parent`),
  CONSTRAINT `FK94A87E2569FABF5E` FOREIGN KEY (`CHILD_ID`) REFERENCES `pro_files` (`FILE_ID`),
  CONSTRAINT `FK94A87E25CBBBB0EA` FOREIGN KEY (`parent`) REFERENCES `pro_files` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_files
-- ----------------------------

-- ----------------------------
-- Table structure for `rtelement`
-- ----------------------------
DROP TABLE IF EXISTS `rtelement`;
CREATE TABLE `rtelement` (
  `INSTANCEID` varchar(100) NOT NULL,
  `REVISION` int(11) NOT NULL,
  `PARID` varchar(254) DEFAULT NULL,
  `PARTYPE` varchar(50) DEFAULT NULL,
  `SOLNID` varchar(254) DEFAULT NULL,
  `READONLY` bit(1) DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  PRIMARY KEY (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rtelement
-- ----------------------------

-- ----------------------------
-- Table structure for `ssparams`
-- ----------------------------
DROP TABLE IF EXISTS `ssparams`;
CREATE TABLE `ssparams` (
  `ITEMID` varchar(100) NOT NULL,
  `PARAMVALUE` varchar(254) DEFAULT NULL,
  `PARAMKEY` varchar(50) NOT NULL,
  PRIMARY KEY (`ITEMID`,`PARAMKEY`),
  KEY `FK60E4AFE6FA34BFDC` (`ITEMID`),
  CONSTRAINT `FK60E4AFE6FA34BFDC` FOREIGN KEY (`ITEMID`) REFERENCES `rtelement` (`INSTANCEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssparams
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('111', '1', '', '');
INSERT INTO `users` VALUES ('aa', 'aa', 'aa', '');
INSERT INTO `users` VALUES ('admin', '1', null, '');
INSERT INTO `users` VALUES ('ceo1', '123', '22222222222222222222', '');
INSERT INTO `users` VALUES ('gm', 'password', '', '');
INSERT INTO `users` VALUES ('im', '123456', '123456', '');
INSERT INTO `users` VALUES ('joe', '31002828', '', '');
INSERT INTO `users` VALUES ('pat', 'password', null, '');
INSERT INTO `users` VALUES ('qq', 'qq', '', '');
INSERT INTO `users` VALUES ('shao', '123456', '', '');
INSERT INTO `users` VALUES ('sm', 'password', '', '');
INSERT INTO `users` VALUES ('suzy', 'password', null, '');
INSERT INTO `users` VALUES ('TaoPengFei', '1', '', '');
INSERT INTO `users` VALUES ('tiffany', 'password', null, '');
INSERT INTO `users` VALUES ('tpf', '2', '', '');
INSERT INTO `users` VALUES ('usa1', '12345678', '', '');
INSERT INTO `users` VALUES ('ywa', '12', '', '');
INSERT INTO `users` VALUES ('zhujiejiao', '123', 'test', '');
INSERT INTO `users` VALUES ('zhujj', '123', '12345678', '');

-- ----------------------------
-- Table structure for `user_settings`
-- ----------------------------
DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE `user_settings` (
  `USER_SETTINGS_ID` bigint(20) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `SETTING_NAME` varchar(100) NOT NULL,
  `SETTING_VALUE` varchar(2048) NOT NULL,
  PRIMARY KEY (`USER_SETTINGS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_settings
-- ----------------------------
