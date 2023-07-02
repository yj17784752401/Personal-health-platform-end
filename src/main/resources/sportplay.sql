/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50730
Source Host           : localhost:3306
Source Database       : sportplay

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-07-02 17:19:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for easyuser
-- ----------------------------
DROP TABLE IF EXISTS `easyuser`;
CREATE TABLE `easyuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of easyuser
-- ----------------------------
INSERT INTO `easyuser` VALUES ('1', 'admin', '123456', '123456@qq.com', '超级管理员', '1');
INSERT INTO `easyuser` VALUES ('2', '余江', '2000', '1306879592@qq.com', '普通管理员', '1');
INSERT INTO `easyuser` VALUES ('3', '朱云川', '19982534', '114785@qq.com', '普通用户', '0');
INSERT INTO `easyuser` VALUES ('4', '秦鸿川', '1759', '145632@qq.com', '普通用户', '1');
INSERT INTO `easyuser` VALUES ('5', '王艳红', '2000', '789652@qq.com', '普通用户', '1');

-- ----------------------------
-- Table structure for mainmenu
-- ----------------------------
DROP TABLE IF EXISTS `mainmenu`;
CREATE TABLE `mainmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainmenu
-- ----------------------------
INSERT INTO `mainmenu` VALUES ('100', '权限管理', '/admin');
INSERT INTO `mainmenu` VALUES ('200', '运动平台', '/use');

-- ----------------------------
-- Table structure for submenu
-- ----------------------------
DROP TABLE IF EXISTS `submenu`;
CREATE TABLE `submenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submenu
-- ----------------------------
INSERT INTO `submenu` VALUES ('101', '用户列表', '/user', '100');
INSERT INTO `submenu` VALUES ('102', '修改权限', '/rights', '100');
INSERT INTO `submenu` VALUES ('103', '运动模块', '/sport', '100');
INSERT INTO `submenu` VALUES ('104', '商品模块', '/goods', '100');
INSERT INTO `submenu` VALUES ('201', '运动科普', '/introduction', '200');
INSERT INTO `submenu` VALUES ('202', '卡路里', '/calories', '200');
INSERT INTO `submenu` VALUES ('203', '营养配餐', '/food', '200');
