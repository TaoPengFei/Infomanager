/*
Navicat MySQL Data Transfer

Source Server         : 10.200.40.76
Source Server Version : 50711
Source Host           : 10.200.40.76:3306
Source Database       : bi

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-07-25 15:46:44
*/

/**
 *  在本地创建一个bi数据库
 */

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dim_outlet`
-- ----------------------------
DROP TABLE IF EXISTS `dim_outlet`;
CREATE TABLE `dim_outlet` (
  `OutletId_t` bigint(20) NOT NULL AUTO_INCREMENT,
  `OutletId` int(11) DEFAULT NULL,
  `ShopId` int(11) DEFAULT NULL,
  `OutletCode` varchar(255) DEFAULT NULL,
  `OutletName` varchar(255) DEFAULT NULL,
  `OutletShortName` varchar(255) DEFAULT NULL,
  `OutletSeq` int(11) DEFAULT NULL,
  `ShopCode` varchar(255) DEFAULT NULL,
  `ShopName` varchar(255) DEFAULT NULL,
  `ShopShortName` varchar(255) DEFAULT NULL,
  `ShopSeq` int(11) DEFAULT NULL,
  `AreaId` int(11) DEFAULT NULL,
  `PlaceId` int(11) DEFAULT NULL,
  `BrandId` int(11) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Addr1` varchar(255) DEFAULT NULL,
  `Addr2` varchar(255) DEFAULT NULL,
  `Contract` varchar(255) DEFAULT NULL,
  `ExtInfo` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `WebSite` varchar(255) DEFAULT NULL,
  `CurrencySign` varchar(255) DEFAULT NULL,
  `CurrencyCode` varchar(255) DEFAULT NULL,
  `TableQty` int(11) DEFAULT NULL,
  `SeatQty` int(11) DEFAULT NULL,
  `EmpQty` int(11) DEFAULT NULL,
  `Area` decimal(16,2) DEFAULT '1.00',
  `Status` int(11) DEFAULT NULL,
  `EffectiveDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `VersionNo` int(11) DEFAULT NULL,
  `CurrVersionFlag` int(11) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `UpdateTime` datetime NOT NULL,
  PRIMARY KEY (`OutletId_t`),
  KEY `idx_Dim_Outlet_OutletId` (`OutletId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dim_outlet
-- ----------------------------
INSERT INTO `dim_outlet` VALUES ('1', null, null, '', '', '', null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, '0.00', null, '1900-01-01 00:00:00', '2200-01-01 00:00:00', '1', null, '2016-08-04 15:26:08', '2016-08-04 15:26:08');
INSERT INTO `dim_outlet` VALUES ('2', '1', '1', '0001', 'Zhengnianqing Hubindian', 'Zhengnianqing Hubindian', '1', '0001', 'Zhengnianqing', null, '1', '100101', '1', '1', null, '1', null, null, '杭州市上城区解放路260号', '杭州市上城区解放路260号', null, null, '88050660', null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '1900-01-01 00:00:00', '2017-07-11 12:07:50', '1', null, '2017-04-28 12:20:54', '2017-04-28 12:20:54');
INSERT INTO `dim_outlet` VALUES ('3', '2', '1', '0002', '蒸年青五角场营业区', '蒸年青五角场营业区', '1', '0002', 'shop蒸年青五角场店', 'shop蒸年青五角场店', '1', '100101', '1', '1', null, null, null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '1900-01-01 00:00:00', '2017-01-10 16:03:09', '1', null, '2016-09-03 19:27:14', '2016-09-03 19:27:14');
INSERT INTO `dim_outlet` VALUES ('4', '3', '1', '1001', '锅殿五角场营业区', '锅殿五角场营业区', '1', '1001', 'shop锅殿五角场店', 'shop锅殿五角场店', '1', '100101', '2', '2', null, null, null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '1900-01-01 00:00:00', '2017-01-10 16:03:09', '1', null, '2016-09-03 19:27:14', '2016-09-03 19:27:14');
INSERT INTO `dim_outlet` VALUES ('5', '4', '1', '2001', '宴西湖杭州营业区', '宴西湖杭州营业区', '1', '2001', 'shop宴西湖杭州店', 'shop宴西湖杭州店', '1', '100301', '1', '2', null, null, null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '1900-01-01 00:00:00', '2017-01-10 16:03:09', '1', null, '2016-09-03 19:27:14', '2016-09-03 19:27:14');
INSERT INTO `dim_outlet` VALUES ('6', '5', '44', '0003', '蒸年轻海岸城营业区', null, '1', '0003', 'shop蒸年轻海岸城店', 'shop蒸年轻海岸城店', '1', '100301', '2', '1', null, null, null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '1900-01-01 00:00:00', '2017-01-10 16:03:09', '1', null, '2016-09-03 19:27:14', '2016-09-03 19:27:14');
INSERT INTO `dim_outlet` VALUES ('7', '2', '1', '0002', '蒸年青五角场店', '蒸年青五角场店', '1', '0002', '蒸年青五角场店', null, '2', '100101', '1', '1', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '2017-01-10 16:03:09', '2017-07-11 12:07:50', '2', null, '2017-04-28 12:20:54', '2017-04-28 12:20:54');
INSERT INTO `dim_outlet` VALUES ('8', '3', '1', '1001', '锅殿五角场店', '锅殿五角场店', '1', '1001', '锅殿五角场店', null, '3', '100101', '2', '2', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '2017-01-10 16:03:09', '2017-07-11 12:07:50', '2', null, '2017-04-28 12:20:54', '2017-04-28 12:20:54');
INSERT INTO `dim_outlet` VALUES ('9', '4', '1', '2001', '宴西湖杭州店', '宴西湖杭州店', '1', '2001', '宴西湖杭州店', null, '4', '100301', '1', '2', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '2017-01-10 16:03:09', '2017-07-11 12:07:50', '2', null, '2017-04-28 12:20:54', '2017-04-28 12:20:54');
INSERT INTO `dim_outlet` VALUES ('10', '5', '44', '0003', '蒸年轻海岸城店', null, '1', '0003', '蒸年轻海岸城店', null, '5', '100301', '2', '1', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '2017-01-10 16:03:09', '2017-07-11 12:07:50', '2', null, '2017-04-28 12:20:54', '2017-04-28 12:20:54');
INSERT INTO `dim_outlet` VALUES ('11', '1', '1', '01221', '百岁村大酒楼深圳北站店', null, '2', 'B01.22', '百岁村深圳北站店', null, '1', '100101', '1', '1', null, '1', null, null, null, null, null, null, '83822668', '83822662', null, '¥', 'CNY', '20', '100', '10', '200.00', '0', '2017-07-11 12:07:50', '2200-01-01 00:00:00', '2', null, '2017-07-11 12:07:50', '2017-07-11 12:07:50');
INSERT INTO `dim_outlet` VALUES ('12', '2', '1', '01225', '百岁村粮好餐点深圳北站店', null, '3', 'B01.22', '百岁村深圳北站店', null, '1', '100101', '1', '1', null, '1', null, null, null, null, null, null, '83822668', '83822662', null, '¥', 'CNY', '20', '100', '10', '200.00', '0', '2017-07-11 12:07:50', '2200-01-01 00:00:00', '3', null, '2017-07-11 12:07:50', '2017-07-11 12:07:50');
INSERT INTO `dim_outlet` VALUES ('13', '3', '1', '01223', '百岁村星歌咖啡深圳北站店', null, '1', 'B01.22', '百岁村深圳北站店', null, '1', '100101', '2', '2', null, '1', null, null, null, null, null, null, '83951666', null, null, '¥', 'CNY', '20', '100', '10', '200.00', '0', '2017-07-11 12:07:50', '2200-01-01 00:00:00', '3', null, '2017-07-11 12:07:50', '2017-07-11 12:07:50');
INSERT INTO `dim_outlet` VALUES ('14', '4', '1', '01224', '百岁村粮好饼点深圳北站店', null, '4', 'B01.22', '百岁村深圳北站店', null, '1', '100301', '1', '2', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '2017-07-11 12:07:50', '2200-01-01 00:00:00', '3', null, '2017-07-11 12:07:50', '2017-07-11 12:07:50');
INSERT INTO `dim_outlet` VALUES ('15', '5', '44', '01232', '百岁村中华料理深圳梅林店', null, '1', 'B01.23', '百岁村深圳梅林店', null, '2', '100301', '2', '1', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '20', '100', '10', '200.00', '0', '2017-07-11 12:07:50', '2200-01-01 00:00:00', '3', null, '2017-07-11 12:07:50', '2017-07-11 12:07:50');
INSERT INTO `dim_outlet` VALUES ('16', '6', '45', '01242', '百岁村中华料理深圳油松店', null, '1', 'B01.24', '百岁村深圳油松店', null, '3', '100301', '2', '2', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '1', '1', '1', '-999.00', '0', '1900-01-01 00:00:00', '2200-01-01 00:00:00', '1', null, '2017-07-11 12:07:50', '2017-07-11 12:07:50');
INSERT INTO `dim_outlet` VALUES ('17', '7', '46', '02062', '五稻香中华料理深圳横岗店', null, '1', 'B02.06', '五稻香深圳横岗店', null, '4', '100301', '2', '2', null, '1', null, null, null, null, null, null, null, null, null, '￥', 'CNY', '1', '1', '1', '-999.00', '0', '1900-01-01 00:00:00', '2200-01-01 00:00:00', '1', null, '2017-07-11 12:07:50', '2017-07-11 12:07:50');
INSERT INTO `dim_outlet` VALUES ('18', '8', '47', '01281', '百岁村大酒楼深圳民治店', null, '1', 'B01.28', '百岁村深圳民治店', null, '4', '-999', '-999', '-999', null, '1', null, null, '深圳市宝安区龙华镇民治大道民乐路 ', '深圳市宝安区龙华镇民治大道民乐路 ', null, null, '28181888', null, null, '¥', 'CNY', '1', '1', '1', '-999.00', '0', '1900-01-01 00:00:00', '2200-01-01 00:00:00', '1', null, '2017-07-21 16:27:04', '2017-07-21 16:27:04');
INSERT INTO `dim_outlet` VALUES ('19', '9', '47', '01283', '百岁村星歌咖啡深圳民治店', null, '2', 'B01.28', '百岁村深圳民治店', null, '4', '-999', '-999', '-999', null, '1', null, null, '深圳市龙华新区民治大道民乐路', '深圳市龙华新区民治大道民乐路', null, null, '28181888', null, null, '¥', 'CNY', '1', '1', '1', '-999.00', '0', '1900-01-01 00:00:00', '2200-01-01 00:00:00', '1', null, '2017-07-21 16:27:04', '2017-07-21 16:27:04');
INSERT INTO `dim_outlet` VALUES ('20', '10', '48', '01211', '百岁村大酒楼深圳万众城店', null, '1', 'B01.21', '百岁村深圳万众城店', null, '6', '-999', '-999', '-999', null, '1', null, null, '深圳市龙华新区民治大道牛栏前大厦', '深圳市龙华新区民治大道牛栏前大厦', null, null, '0755-85263188', '0755-88292290', null, '$', 'HKD', '1', '1', '1', '-999.00', '0', '1900-01-01 00:00:00', '2200-01-01 00:00:00', '1', null, '2017-07-21 16:27:04', '2017-07-21 16:27:04');

-- ----------------------------
-- Table structure for `dim_shop`
-- ----------------------------
DROP TABLE IF EXISTS `dim_shop`;
CREATE TABLE `dim_shop` (
  `ShopId` bigint(20) NOT NULL,
  `ShopCode` varchar(40) DEFAULT NULL,
  `ShopName` varchar(255) DEFAULT NULL,
  `ShopShortName` varchar(255) DEFAULT NULL,
  `ShopAddr` varchar(255) DEFAULT NULL,
  `ShopInfo` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Timezone` bigint(20) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `ShopSeq` bigint(20) DEFAULT NULL,
  `Status` bigint(20) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `UPdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ShopId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dim_shop
-- ----------------------------
INSERT INTO `dim_shop` VALUES ('1', 'B01.22', '深圳Demo', null, '0', null, null, null, '480', null, '1', null, '2017-01-11 14:50:46', '2017-07-25 10:03:28');
INSERT INTO `dim_shop` VALUES ('2', 'B01.01', '百岁村福华店', null, null, null, null, null, '480', null, '0', '0', '2017-01-11 14:50:46', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('3', 'B01.02', '百岁村国王店', null, null, null, null, null, '480', null, '0', '0', '2017-01-11 14:50:46', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('4', 'B01.03', '百岁村新洲店', null, null, null, null, null, '480', null, '0', '0', '2017-01-11 14:50:46', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('5', 'B01.04', '百岁村华南城店', null, null, null, null, null, '480', null, '0', '0', '2017-01-11 14:50:46', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('6', 'B01.05', '百岁村广州三元里店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('7', 'B01.06', '百岁村佛山南海大沥分店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('8', 'B01.07', '百岁村太仓店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('9', 'B01.08', '百岁村太原府西街店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('10', 'B01.09', '百岁村长沙国贸分店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('11', 'B01.10', '百岁村南昌站前路店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('12', 'B01.11', '百岁村武汉解放大道店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('13', 'B01.12', '百岁村杭州文晖路店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('14', 'B01.13', '百岁村东莞寮步店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('15', 'B01.14', '百岁村广州番禺分店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('16', 'B01.15', '百岁村襄阳中原路店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('17', 'B01.16', '百岁村北京咖啡店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('18', 'B01.17', '百岁村沈阳民族北街店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('19', 'B01.18', '百岁村清远连江路店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('20', 'B01.19', '百岁村南宁店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('21', 'B01.20', '百岁村阳朔店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('22', 'B01.21', '百岁村龙华万众城店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('23', 'B01.23', '百岁村梅林店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('24', 'B01.24', '百岁村油松店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('25', 'B01.25', '百岁村桂林中山店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('26', 'B01.26', '百岁村上海松江店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('27', 'B01.27', '百岁村福强店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('28', 'B01.28', '百岁村民治店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('29', 'B01.29', '百岁村沙井店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('30', 'B01.30', '百岁村大学城店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('31', 'B01.31', '百岁村爱榕店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('32', 'B02.01', '五稻香麒麟店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('33', 'B02.02', '五稻香天津店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('34', 'B02.03', '五稻香佛山店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('35', 'B02.04', '五稻香阳西店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('36', 'B02.05', '五稻香西安分公司', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('37', 'B02.06', '五稻香横岗新城店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('38', 'B02.07', '五稻香杭州东站店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('39', 'B02.08', '五稻香重庆宝圣大道店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('40', 'B02.09', '五稻香深圳机场一路店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('41', 'B02.10', '五稻香成都汇城店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('42', 'B03.01', '海湾店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('43', 'B04.01', '星歌咖啡大剧院店', null, null, null, null, null, '480', null, '0', '0', '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('44', 'B01.23', '百岁村深圳梅林店', null, null, null, null, null, '480', null, '2', null, '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('45', 'B01.24', '百岁村深圳油松店', null, null, null, null, null, '480', null, '3', null, '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('46', 'B02.06', '五稻香深圳横岗店', null, null, null, null, null, '480', null, '5', null, '2017-07-11 12:07:50', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('47', 'B01.28', '百岁村深圳民治店', null, '0', null, null, null, '480', null, '4', null, '2017-07-21 16:27:03', '2017-07-21 16:27:03');
INSERT INTO `dim_shop` VALUES ('48', 'B01.21', '百岁村深圳万众城店', null, '0', null, null, null, '480', null, '6', null, '2017-07-21 16:27:03', '2017-07-21 16:27:03');

-- ----------------------------
-- Table structure for `sy_empshoprela`
-- ----------------------------
DROP TABLE IF EXISTS `sy_empshoprela`;
CREATE TABLE `sy_empshoprela` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL COMMENT '如果一个empid对应所有酒店就写0',
  `status` int(11) NOT NULL COMMENT '0 申请 10在用 100淘汰',
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sy_empshoprela
-- ----------------------------
INSERT INTO `sy_empshoprela` VALUES ('1', 'admin', '1', '10', '2017-07-14 11:54:32');

-- ----------------------------
-- Table structure for `sy_empoutletrela`
-- ----------------------------
DROP TABLE IF EXISTS `sy_empoutletrela`;
CREATE TABLE `sy_empoutletrela` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `outletid` int(11) NOT NULL COMMENT '如果一个empid对应所有营业区就写0',
  `status` int(11) NOT NULL COMMENT '0 申请 10在用 100淘汰',
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sy_empoutletrela
-- ----------------------------
INSERT INTO `sy_empoutletrela` VALUES ('1', 'shao', '0', '10', '2017-07-14 11:48:45');
INSERT INTO `sy_empoutletrela` VALUES ('2', 'admin', '1', '10', '2017-07-14 11:48:58');


