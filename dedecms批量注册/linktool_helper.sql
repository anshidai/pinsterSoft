/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : linktool_helper

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2018-05-18 14:13:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pre_account
-- ----------------------------
DROP TABLE IF EXISTS `pre_account`;
CREATE TABLE `pre_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `pwd` char(30) NOT NULL DEFAULT '' COMMENT '用户密码',
  `domain_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '网站id',
  `cookie` text COMMENT '记录登陆的cookie',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '启用状态 1正常 2异常 3删除',
  `push_status` tinyint(1) unsigned DEFAULT '1' COMMENT '发布状态 1未发布 2发布成功 3发布失败',
  `adddate` datetime NOT NULL COMMENT '添加时间',
  `editdate` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_domain_id_username` (`domain_id`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='账户表';

-- ----------------------------
-- Records of pre_account
-- ----------------------------

-- ----------------------------
-- Table structure for pre_domain
-- ----------------------------
DROP TABLE IF EXISTS `pre_domain`;
CREATE TABLE `pre_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(100) NOT NULL COMMENT '网站名称',
  `domain` varchar(100) NOT NULL COMMENT '网站网址',
  `start_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区间开始id',
  `end_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区间结束id',
  `last_comment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前采集区间id',
  `comment_page_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '采集帖子页面总数',
  `account_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帐号总数',
  `succeed_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成功发帖总数',
  `fail_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '失败发帖总数',
  `pre_push_date` datetime DEFAULT NULL COMMENT '上次发帖时间',
  `cur_push_date` datetime DEFAULT NULL COMMENT '最近发帖时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '启用状态 1正常 2异常 3删除',
  `error_msg` varchar(200) NOT NULL DEFAULT '' COMMENT '异常信息',
  `adddate` datetime DEFAULT NULL COMMENT '添加时间',
  `editdate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=gbk COMMENT='网站主表';

-- ----------------------------
-- Records of pre_domain
-- ----------------------------
INSERT INTO `pre_domain` VALUES ('1', '1', '中国居民健康卡服务网', 'http://zgjmjkk.com', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('2', '1', '家庭医生网', 'http://www.jthysh.com', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('3', '1', '信德海事网', 'http://www.xindemarinenews.com', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('4', '1', '红酒视野', 'http://www.hongjiushiye.com', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('64', '1', '农家良品', 'http://www.zizizu.com', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('65', '1', '沙县义工联合会', 'http://www.sx-yigong.com', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('66', '1', '新未来国际', 'http://www.new-lion.net', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('243', '1', '明智资源', 'http://jn1111.com', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pre_domain` VALUES ('244', '1', '四川洪海游网络科技有限公司', 'http://www.game7878.cn', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for pre_error_log
-- ----------------------------
DROP TABLE IF EXISTS `pre_error_log`;
CREATE TABLE `pre_error_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `domain_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '网站id',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帐号id',
  `linkurl` varchar(100) NOT NULL DEFAULT '' COMMENT '评论帖子url',
  `msg` text NOT NULL COMMENT '日志信息',
  `type` tinyint(2) unsigned DEFAULT '0' COMMENT '类型 1登录 2发帖',
  `adddate` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `idx_domain_id` (`domain_id`),
  KEY `idx_type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='操作错误日志表';

-- ----------------------------
-- Records of pre_error_log
-- ----------------------------

-- ----------------------------
-- Table structure for pre_user
-- ----------------------------
DROP TABLE IF EXISTS `pre_user`;
CREATE TABLE `pre_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL COMMENT '用户名',
  `pwd` char(32) NOT NULL COMMENT '用户密码',
  `salt` char(4) NOT NULL COMMENT '加密串',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '启用状态 1正常 2未审核通过 3删除',
  `adddate` datetime NOT NULL COMMENT '添加时间',
  `editdate` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk COMMENT='用户表';

-- ----------------------------
-- Records of pre_user
-- ----------------------------
INSERT INTO `pre_user` VALUES ('1', 'admin', '19d4d127ca959b695a03367405e9a3a4', 'L675', '1', '2018-04-18 13:58:16', '2018-04-18 13:58:18');
