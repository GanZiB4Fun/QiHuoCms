/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : thinkphp

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2016-08-09 21:19:39
*/

DROP TABLE IF EXISTS `qh_administrator`;
CREATE TABLE `qh_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` char(3) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(100) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 登录名:admin
-- 密码:admin
INSERT INTO `think_administrator` VALUES
('1', 'Admin', 'admin', '0fdf6d8829854bedeaed992a6f3ad83a', '112', '13888888888', '1', '57a99128f2c90_thumb.jpg', '127.0.0.1', '1470748670', '1470777470', '1463362516', '1470748660');


DROP TABLE IF EXISTS `qh_posts`;
CREATE TABLE `qh_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_content` longtext,
  `post_title` text NOT NULL,
  `post_excerpt` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `feature_image` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`status`,`create_time`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 报名登记表
CREATE SCHEMA `qihuo` DEFAULT CHARACTER SET utf8 ;
CREATE TABLE `qihuo`.`qh_proposer` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '申请人ID',
  `nick_name` VARCHAR(45) NOT NULL COMMENT '用户昵称',
  `real_name` VARCHAR(45) NOT NULL COMMENT '用户真实姓名',
  `id_card_num` VARCHAR(45) NOT NULL COMMENT '身份证号',
  `phone` VARCHAR(45) NOT NULL COMMENT '手机号',
  `bank_num` VARCHAR(45) NOT NULL COMMENT '借记卡卡号',
  `bank` VARCHAR(45) NOT NULL COMMENT '开户银行',
  `status` INT NOT NULL COMMENT '状态：0:待审核、1:比赛中、2:未通过、3:已取消比赛资格',
  `sign_time` DATETIME NOT NULL COMMENT '申请时间',
  `audit_time` DATETIME NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`));

ALTER TABLE `qihuo`.`qh_proposer`
CHANGE COLUMN `audit_time` `audit_time` DATETIME NULL COMMENT '审核时间' ;

-- 参赛选手数据表
  CREATE TABLE `qihuo`.`qh_participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `proposer_id` INT NOT NULL,
  `ranking` DATETIME NOT NULL COMMENT '参赛时间',
  `nick_name` VARCHAR(45) NOT NULL COMMENT '用户昵称',
  `init_equity` VARCHAR(10) NOT NULL COMMENT '初始权益',
  `day_interest` VARCHAR(10) NOT NULL COMMENT '当日权益',
  `points` VARCHAR(10) NOT NULL COMMENT '综合积分',
  `acc_profit` VARCHAR(10) NOT NULL COMMENT '累计净利润',
  `cumulative` VARCHAR(10) NOT NULL COMMENT '累计收益率',
  `max_down` VARCHAR(10) NOT NULL COMMENT '最大回撤',
  `trading_day` DATETIME NOT NULL COMMENT '交易日',
  `status` INT NULL COMMENT '状态',
  PRIMARY KEY (`id`));


