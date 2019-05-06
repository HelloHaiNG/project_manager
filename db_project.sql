/*
Navicat MySQL Data Transfer

Source Server         : db
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : db_project

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2019-05-06 16:10:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('lucy', '3YFRgtw7MbqdL/wwi59kfw==', '1op4MUhS0eRYU76DNFncrw==', '2018-11-06 16:08:16');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `pid` int(20) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) DEFAULT NULL,
  `ptime` datetime DEFAULT NULL,
  `pdetail` varchar(100) DEFAULT NULL,
  `uid` int(20) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('3', '论坛项目', '2018-07-26 22:00:00', '武研论坛系统', '1');
INSERT INTO `t_project` VALUES ('4', '培训系统', '2018-07-26 12:00:00', '培训系统', '1');
INSERT INTO `t_project` VALUES ('5', '项目管理系统', '2017-07-27 12:00:00', '项目管理系统', '1');
INSERT INTO `t_project` VALUES ('6', '购物商城', '2018-07-21 14:04:53', '购物商城', '1');
INSERT INTO `t_project` VALUES ('7', '银行系统', '2018-06-28 02:00:00', '武汉银行系统', '1');
INSERT INTO `t_project` VALUES ('8', '超市系统', '2018-07-24 18:00:00', '超市系统', '1');
INSERT INTO `t_project` VALUES ('9', '网站监控', '2016-05-25 04:00:00', '网站监控', '1');
INSERT INTO `t_project` VALUES ('10', '住宿系统', '2017-11-26 18:00:00', '住宿系统', '1');
INSERT INTO `t_project` VALUES ('11', '薪酬系统', '2018-05-25 04:00:00', '薪酬系统', '1');
INSERT INTO `t_project` VALUES ('12', '案件考虑过骄傲而org', '2018-10-11 04:00:00', '的说法儿童噶尔', '1');
INSERT INTO `t_project` VALUES ('13', '案发微软gear', '2018-10-02 00:00:00', '法饿饭然而 ', '1');
INSERT INTO `t_project` VALUES ('14', '放大如果wear被阿根廷', '2018-10-16 00:00:00', 'Gerard', '1');
INSERT INTO `t_project` VALUES ('15', '热gear根本突然个案', '2018-10-02 00:00:00', '热爱给发噶热狗', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'lucy', '123');
INSERT INTO `t_user` VALUES ('20', 'jack', '123');
INSERT INTO `t_user` VALUES ('21', 'jet', '123');
INSERT INTO `t_user` VALUES ('22', 'lucy', '456');
INSERT INTO `t_user` VALUES ('23', 'lucy', '111');
INSERT INTO `t_user` VALUES ('24', '54', '123');
INSERT INTO `t_user` VALUES ('25', '5454', '123');

-- ----------------------------
-- Table structure for userconnection
-- ----------------------------
DROP TABLE IF EXISTS `userconnection`;
CREATE TABLE `userconnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(512) NOT NULL,
  `secret` varchar(512) DEFAULT NULL,
  `refreshToken` varchar(512) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userconnection
-- ----------------------------
