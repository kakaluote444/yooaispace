/*
Navicat MySQL Data Transfer

Source Server         : niaoyuan
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : yooai

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-09-12 15:18:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `catename` (`admin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'yooai', 'yooai');
INSERT INTO `admin` VALUES ('2', 'admin', 'admin');

-- ----------------------------
-- Table structure for agree
-- ----------------------------
DROP TABLE IF EXISTS `agree`;
CREATE TABLE `agree` (
  `say_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  PRIMARY KEY (`say_id`,`friend_id`),
  KEY `user_id` (`friend_id`),
  CONSTRAINT `agree_ibfk_1` FOREIGN KEY (`say_id`) REFERENCES `say` (`say_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agree_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agree
-- ----------------------------
INSERT INTO `agree` VALUES ('3', '1');
INSERT INTO `agree` VALUES ('14', '1');
INSERT INTO `agree` VALUES ('44', '1');
INSERT INTO `agree` VALUES ('47', '1');
INSERT INTO `agree` VALUES ('61', '1');
INSERT INTO `agree` VALUES ('62', '1');
INSERT INTO `agree` VALUES ('71', '1');
INSERT INTO `agree` VALUES ('82', '1');
INSERT INTO `agree` VALUES ('85', '1');
INSERT INTO `agree` VALUES ('1', '3');
INSERT INTO `agree` VALUES ('54', '3');
INSERT INTO `agree` VALUES ('57', '3');
INSERT INTO `agree` VALUES ('54', '4');
INSERT INTO `agree` VALUES ('54', '5');
INSERT INTO `agree` VALUES ('69', '5');
INSERT INTO `agree` VALUES ('71', '5');
INSERT INTO `agree` VALUES ('73', '5');
INSERT INTO `agree` VALUES ('74', '5');
INSERT INTO `agree` VALUES ('77', '5');
INSERT INTO `agree` VALUES ('1', '6');
INSERT INTO `agree` VALUES ('2', '6');
INSERT INTO `agree` VALUES ('63', '8');
INSERT INTO `agree` VALUES ('69', '8');
INSERT INTO `agree` VALUES ('71', '8');
INSERT INTO `agree` VALUES ('72', '8');
INSERT INTO `agree` VALUES ('1', '9');
INSERT INTO `agree` VALUES ('9', '9');
INSERT INTO `agree` VALUES ('1', '10');
INSERT INTO `agree` VALUES ('27', '10');
INSERT INTO `agree` VALUES ('29', '10');
INSERT INTO `agree` VALUES ('53', '23');
INSERT INTO `agree` VALUES ('86', '33');

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `user_id` (`log_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`log_id`) REFERENCES `log` (`log_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('9', '1', 'aaaaaaa');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collector_id` int(11) NOT NULL,
  `say_id` int(11) NOT NULL,
  PRIMARY KEY (`collector_id`,`say_id`),
  KEY `say_id` (`say_id`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`collector_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('2', '1');
INSERT INTO `collection` VALUES ('1', '2');
INSERT INTO `collection` VALUES ('6', '2');
INSERT INTO `collection` VALUES ('1', '14');
INSERT INTO `collection` VALUES ('1', '24');
INSERT INTO `collection` VALUES ('1', '47');
INSERT INTO `collection` VALUES ('23', '53');
INSERT INTO `collection` VALUES ('4', '54');
INSERT INTO `collection` VALUES ('5', '69');
INSERT INTO `collection` VALUES ('1', '71');
INSERT INTO `collection` VALUES ('5', '71');
INSERT INTO `collection` VALUES ('5', '74');
INSERT INTO `collection` VALUES ('1', '80');
INSERT INTO `collection` VALUES ('1', '81');
INSERT INTO `collection` VALUES ('1', '82');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `say_id` int(11) NOT NULL,
  `commenter_id` int(255) NOT NULL,
  `commentered_id` int(11) NOT NULL,
  `comment_conent` text,
  `comment_datatime` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `say_id` (`say_id`),
  KEY `comment_ibfk_2` (`commenter_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`say_id`) REFERENCES `say` (`say_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '2', '1', '可以的', '2016-08-16 23:01:09');
INSERT INTO `comment` VALUES ('2', '1', '1', '2', '你也可以的', '2016-08-16 23:15:18');
INSERT INTO `comment` VALUES ('3', '1', '2', '1', '666', '2016-08-17 09:45:26');
INSERT INTO `comment` VALUES ('4', '1', '3', '1', '好6啊', '2016-08-17 09:46:26');
INSERT INTO `comment` VALUES ('5', '1', '1', '3', '你也挺6的', '2016-08-17 09:47:26');
INSERT INTO `comment` VALUES ('6', '2', '3', '1', '在哪里浪啊', '2016-08-17 09:48:26');
INSERT INTO `comment` VALUES ('7', '2', '1', '3', '在厦门', '2016-08-17 09:49:26');
INSERT INTO `comment` VALUES ('8', '2', '3', '1', '爽啊，在海边呢', '2016-08-17 09:50:26');
INSERT INTO `comment` VALUES ('9', '2', '4', '1', '我也在厦门呢', '2016-08-17 09:51:26');
INSERT INTO `comment` VALUES ('10', '2', '1', '4', '你在岛内还是岛外？', '2016-08-17 09:52:26');
INSERT INTO `comment` VALUES ('11', '2', '4', '1', '岛外', '2016-08-17 09:53:26');
INSERT INTO `comment` VALUES ('12', '3', '6', '1', '这是哪儿', '2016-08-17 09:54:26');
INSERT INTO `comment` VALUES ('13', '3', '1', '6', '厦门观音山', '2016-08-17 09:55:26');
INSERT INTO `comment` VALUES ('14', '3', '6', '1', '风景好啊', '2016-08-17 09:56:26');
INSERT INTO `comment` VALUES ('15', '3', '5', '1', '好壮阔啊', '2016-08-17 09:57:26');
INSERT INTO `comment` VALUES ('16', '4', '7', '3', '这是什么游戏？', '2016-08-17 09:58:26');
INSERT INTO `comment` VALUES ('17', '4', '3', '7', '这是根据一部动漫改编的游戏', '2016-08-17 09:59:26');
INSERT INTO `comment` VALUES ('18', '4', '7', '3', '叫什么咯', '2016-08-17 10:45:26');
INSERT INTO `comment` VALUES ('19', '4', '3', '7', 'rewrite', '2016-08-17 10:48:26');
INSERT INTO `comment` VALUES ('20', '5', '2', '6', '五杀，叼', '2016-08-17 10:49:26');
INSERT INTO `comment` VALUES ('21', '5', '6', '2', '6不6', '2016-08-17 10:55:26');
INSERT INTO `comment` VALUES ('22', '5', '2', '6', '666', '2016-08-17 10:58:26');
INSERT INTO `comment` VALUES ('23', '5', '1', '2', '我强势奶妈带他五杀', '2016-08-17 11:25:26');
INSERT INTO `comment` VALUES ('24', '5', '2', '1', '666666', '2016-08-17 11:35:26');
INSERT INTO `comment` VALUES ('25', '6', '3', '1', '你是这种男生吗', '2016-08-17 09:56:26');
INSERT INTO `comment` VALUES ('26', '6', '1', '3', '你觉得呢', '2016-08-17 09:57:26');
INSERT INTO `comment` VALUES ('27', '6', '3', '1', '可能是', '2016-08-17 09:58:26');
INSERT INTO `comment` VALUES ('28', '7', '5', '2', '这游戏叼', '2016-08-17 10:54:26');
INSERT INTO `comment` VALUES ('29', '7', '2', '5', '一刀99级', '2016-08-17 10:55:26');
INSERT INTO `comment` VALUES ('30', '8', '4', '1', '很忙吗', '2016-08-17 11:46:26');
INSERT INTO `comment` VALUES ('31', '8', '1', '4', '挺忙的', '2016-08-17 11:47:26');
INSERT INTO `comment` VALUES ('32', '9', '1', '3', '做什么工作呢', '2016-08-17 19:26:26');
INSERT INTO `comment` VALUES ('33', '9', '3', '1', '辛苦的程序员', '2016-08-17 19:27:26');
INSERT INTO `comment` VALUES ('34', '10', '2', '3', '加油', '2016-08-17 19:46:26');
INSERT INTO `comment` VALUES ('35', '10', '3', '2', '我会努力的', '2016-08-17 19:47:26');
INSERT INTO `comment` VALUES ('36', '11', '1', '2', '好虚啊', '2016-08-17 20:24:26');
INSERT INTO `comment` VALUES ('37', '11', '2', '1', '是啊，好累啊', '2016-08-17 20:25:26');
INSERT INTO `comment` VALUES ('38', '12', '6', '1', '你很照顾你弟弟啊', '2016-08-17 21:46:26');
INSERT INTO `comment` VALUES ('39', '12', '1', '6', '我弟弟挺喜欢这面的', '2016-08-17 21:47:26');
INSERT INTO `comment` VALUES ('40', '13', '1', '2', '真的吗', '2016-08-27 11:26:40');
INSERT INTO `comment` VALUES ('43', '29', '7', '10', '来Solo', '2016-08-28 13:20:49');
INSERT INTO `comment` VALUES ('44', '12', '2', '1', '呵呵', '2016-08-28 13:26:46');
INSERT INTO `comment` VALUES ('45', '29', '2', '10', '乐乐觉得你是最棒的', '2016-08-29 09:51:34');
INSERT INTO `comment` VALUES ('46', '29', '1', '29', '卜铷也觉得你是最棒的', null);
INSERT INTO `comment` VALUES ('47', '29', '1', '29', '卜铷也觉得你是最棒的（重复）', '2016-08-29 10:03:22');
INSERT INTO `comment` VALUES ('48', '29', '1', '10', 'add comment test', '2016-08-29 10:51:32');
INSERT INTO `comment` VALUES ('49', '1', '2', '1', '哈哈，真是的', '2016-08-29 13:58:24');
INSERT INTO `comment` VALUES ('50', '2', '2', '1', '哈哈，真是的', '2016-08-29 14:53:07');
INSERT INTO `comment` VALUES ('51', '7', '1', '2', '这新张可以啊', '2016-08-29 17:28:48');
INSERT INTO `comment` VALUES ('60', '13', '1', '2', 'fsdgdsgf', '2016-08-30 04:18:26');
INSERT INTO `comment` VALUES ('61', '13', '1', '2', '999', '2016-08-30 08:33:12');
INSERT INTO `comment` VALUES ('62', '13', '1', '2', '789', '2016-08-30 09:07:36');
INSERT INTO `comment` VALUES ('63', '13', '1', '2', '654', '2016-08-30 09:07:45');
INSERT INTO `comment` VALUES ('64', '13', '1', '2', '7777', '2016-08-30 09:08:37');
INSERT INTO `comment` VALUES ('65', '10', '1', '3', '987', '2016-08-30 09:12:21');
INSERT INTO `comment` VALUES ('66', '8', '1', '1', '真心好', '2016-08-30 09:14:26');
INSERT INTO `comment` VALUES ('68', '12', '1', '1', '你也很帅', '2016-08-30 09:49:17');
INSERT INTO `comment` VALUES ('69', '12', '1', '1', 'java', '2016-08-30 09:54:34');
INSERT INTO `comment` VALUES ('70', '11', '2', '2', '累个鸡毛', '2016-08-30 09:55:22');
INSERT INTO `comment` VALUES ('71', '11', '2', '2', '啥？', '2016-08-30 10:08:54');
INSERT INTO `comment` VALUES ('72', '10', '1', '3', '987', '2016-08-30 10:11:36');
INSERT INTO `comment` VALUES ('73', '8', '3', '1', '666', '2016-08-30 10:11:57');
INSERT INTO `comment` VALUES ('74', '4', '4', '3', '654', '2016-08-30 10:12:37');
INSERT INTO `comment` VALUES ('75', '12', '1', '2', '法大师傅', '2016-08-30 10:15:25');
INSERT INTO `comment` VALUES ('103', '12', '6', '1', '3555', '2016-08-30 11:03:52');
INSERT INTO `comment` VALUES ('104', '29', '10', '10', '哎', '2016-08-30 16:26:13');
INSERT INTO `comment` VALUES ('105', '29', '10', '2', '好样的', '2016-08-30 16:26:26');
INSERT INTO `comment` VALUES ('106', '12', '1', '1', '。。。。', '2016-08-30 16:28:47');
INSERT INTO `comment` VALUES ('107', '51', '1', '1', '。。。。', '2016-08-30 16:29:12');
INSERT INTO `comment` VALUES ('108', '14', '1', '3', '66666', '2016-08-30 23:23:42');
INSERT INTO `comment` VALUES ('109', '10', '1', '3', '感到十分光滑', '2016-08-30 23:24:00');
INSERT INTO `comment` VALUES ('110', '12', '1', '0', '654', '2016-08-31 01:25:47');
INSERT INTO `comment` VALUES ('111', '12', '1', '0', '98954', '2016-08-31 01:25:55');
INSERT INTO `comment` VALUES ('112', '12', '1', '0', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦', '2016-08-31 01:27:05');
INSERT INTO `comment` VALUES ('113', '12', '1', '1', '65646', '2016-08-31 01:29:36');
INSERT INTO `comment` VALUES ('114', '51', '1', '1', '3333', '2016-08-31 01:39:57');
INSERT INTO `comment` VALUES ('115', '13', '1', '2', '987777', '2016-08-31 16:51:53');
INSERT INTO `comment` VALUES ('116', '47', '1', '1', '6666', '2016-08-31 20:59:53');
INSERT INTO `comment` VALUES ('117', '2', '4', '2', '爽肤水', '2016-08-31 21:44:31');
INSERT INTO `comment` VALUES ('118', '2', '4', '1', '动画', '2016-08-31 21:44:36');
INSERT INTO `comment` VALUES ('119', '59', '2', '4', '666', '2016-08-31 22:05:14');
INSERT INTO `comment` VALUES ('120', '61', '4', '4', '很强势', '2016-08-31 22:09:54');
INSERT INTO `comment` VALUES ('121', '61', '4', '4', '换个号航空', '2016-08-31 22:10:34');
INSERT INTO `comment` VALUES ('122', '62', '1', '4', '美呆了', '2016-08-31 23:23:56');
INSERT INTO `comment` VALUES ('123', '11', '1', '2', '飒爽的', '2016-09-01 00:21:45');
INSERT INTO `comment` VALUES ('124', '11', '1', '2', '散打', '2016-09-01 00:21:51');
INSERT INTO `comment` VALUES ('125', '11', '1', '2', '湿答答', '2016-09-01 00:21:56');
INSERT INTO `comment` VALUES ('126', '11', '1', '2', '苏打水', '2016-09-01 00:22:02');
INSERT INTO `comment` VALUES ('127', '82', '1', '6', '这武功好', '2016-09-01 08:20:54');
INSERT INTO `comment` VALUES ('128', '81', '1', '2', '我要举报了', '2016-09-01 08:21:07');
INSERT INTO `comment` VALUES ('129', '74', '4', '5', '威少吊', '2016-09-01 10:29:22');
INSERT INTO `comment` VALUES ('130', '74', '5', '4', '没什么', '2016-09-01 10:31:33');

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `honey` int(11) DEFAULT '0' COMMENT '亲密度',
  `special` int(11) DEFAULT '0' COMMENT '是否为特别关心（1：是   0：否）',
  PRIMARY KEY (`user_id`,`friend_id`),
  CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('1', '1', '30', '0');
INSERT INTO `friend` VALUES ('1', '2', '23', '0');
INSERT INTO `friend` VALUES ('1', '3', '35', '1');
INSERT INTO `friend` VALUES ('1', '4', '25', '1');
INSERT INTO `friend` VALUES ('1', '5', '51', '0');
INSERT INTO `friend` VALUES ('1', '6', '51', '1');
INSERT INTO `friend` VALUES ('1', '7', '71', '0');
INSERT INTO `friend` VALUES ('1', '8', '61', '0');
INSERT INTO `friend` VALUES ('1', '9', '82', '0');
INSERT INTO `friend` VALUES ('1', '33', '16', '0');
INSERT INTO `friend` VALUES ('2', '1', '74', '0');
INSERT INTO `friend` VALUES ('2', '2', '3', '0');
INSERT INTO `friend` VALUES ('2', '3', '46', '0');
INSERT INTO `friend` VALUES ('2', '4', '22', '0');
INSERT INTO `friend` VALUES ('2', '6', '40', '0');
INSERT INTO `friend` VALUES ('3', '1', '10', '0');
INSERT INTO `friend` VALUES ('3', '3', '1', '0');
INSERT INTO `friend` VALUES ('4', '1', '1', '0');
INSERT INTO `friend` VALUES ('4', '4', '2', '0');
INSERT INTO `friend` VALUES ('4', '5', '54', '0');
INSERT INTO `friend` VALUES ('5', '1', '0', '0');
INSERT INTO `friend` VALUES ('5', '4', '68', '0');
INSERT INTO `friend` VALUES ('5', '5', '1', '0');
INSERT INTO `friend` VALUES ('6', '1', '2', '0');
INSERT INTO `friend` VALUES ('6', '6', '0', '0');
INSERT INTO `friend` VALUES ('7', '1', '0', '0');
INSERT INTO `friend` VALUES ('7', '7', '0', '0');
INSERT INTO `friend` VALUES ('8', '1', '0', '0');
INSERT INTO `friend` VALUES ('8', '8', '0', '0');
INSERT INTO `friend` VALUES ('9', '1', '1', '0');
INSERT INTO `friend` VALUES ('9', '9', '1', '0');
INSERT INTO `friend` VALUES ('10', '10', '2', '0');
INSERT INTO `friend` VALUES ('22', '22', '0', '0');
INSERT INTO `friend` VALUES ('23', '23', '2', '0');
INSERT INTO `friend` VALUES ('24', '24', '0', '0');
INSERT INTO `friend` VALUES ('25', '25', '0', '0');
INSERT INTO `friend` VALUES ('27', '27', '0', '0');
INSERT INTO `friend` VALUES ('29', '29', '0', '0');
INSERT INTO `friend` VALUES ('31', '31', '0', '0');
INSERT INTO `friend` VALUES ('32', '32', '0', '0');
INSERT INTO `friend` VALUES ('33', '1', '15', '0');
INSERT INTO `friend` VALUES ('33', '33', '0', '0');
INSERT INTO `friend` VALUES ('34', '34', '1', '0');
INSERT INTO `friend` VALUES ('35', '35', '0', '0');
INSERT INTO `friend` VALUES ('36', '36', '0', '0');
INSERT INTO `friend` VALUES ('37', '37', '0', '0');

-- ----------------------------
-- Table structure for leavemsg
-- ----------------------------
DROP TABLE IF EXISTS `leavemsg`;
CREATE TABLE `leavemsg` (
  `lmsg_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `tourist_id` int(11) NOT NULL,
  `lmsg_content` text NOT NULL,
  `lmsg_datatime` datetime DEFAULT NULL,
  PRIMARY KEY (`lmsg_id`),
  KEY `host_id` (`host_id`),
  CONSTRAINT `leavemsg_ibfk_1` FOREIGN KEY (`host_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leavemsg
-- ----------------------------
INSERT INTO `leavemsg` VALUES ('1', '1', '2', '沙发', '2016-08-15 23:26:14');
INSERT INTO `leavemsg` VALUES ('2', '1', '3', '板凳', '2016-08-16 23:26:35');
INSERT INTO `leavemsg` VALUES ('3', '1', '4', '可以的', '2016-08-17 10:39:05');
INSERT INTO `leavemsg` VALUES ('4', '1', '5', '赞', '2016-08-17 10:39:18');
INSERT INTO `leavemsg` VALUES ('5', '1', '6', '666', '2016-08-17 10:39:31');
INSERT INTO `leavemsg` VALUES ('6', '1', '7', '行啊', '2016-08-17 10:39:45');
INSERT INTO `leavemsg` VALUES ('7', '1', '8', '真棒', '2016-08-17 10:39:57');
INSERT INTO `leavemsg` VALUES ('8', '2', '1', '你在哪儿呢', '2016-08-17 10:40:24');
INSERT INTO `leavemsg` VALUES ('9', '2', '3', '很久不见，打个招呼', '2016-08-17 10:40:34');
INSERT INTO `leavemsg` VALUES ('10', '3', '1', 'hello', '2016-08-17 10:40:48');
INSERT INTO `leavemsg` VALUES ('11', '3', '2', '想你', '2016-08-17 10:40:59');
INSERT INTO `leavemsg` VALUES ('13', '1', '5', '德玛西亚，无可匹敌', '2016-08-28 13:43:48');
INSERT INTO `leavemsg` VALUES ('14', '1', '5', '我又来了', '2016-08-28 13:49:06');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_title` varchar(255) DEFAULT NULL,
  `log_content` longtext,
  `log_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', '11111111111', '111111111111', '2016-08-24 09:55:58');
INSERT INTO `log` VALUES ('2', '1', '222222222222', '2222222222222', '2016-08-09 09:56:21');
INSERT INTO `log` VALUES ('3', '1', '33333', '3333333333', '2016-08-26 09:56:33');
INSERT INTO `log` VALUES ('4', '1', '44444444', '4444444444', '2016-08-16 09:56:51');
INSERT INTO `log` VALUES ('5', '1', '555555555', '5555555555', '2016-08-02 09:57:09');
INSERT INTO `log` VALUES ('6', '1', '6666666', '66666', '2016-08-16 09:57:17');
INSERT INTO `log` VALUES ('7', '1', '7', '777777777', '2016-08-16 09:57:25');
INSERT INTO `log` VALUES ('8', '1', '8', '8888888888', '2016-08-18 09:57:37');
INSERT INTO `log` VALUES ('9', '1', '9', '999999999', '2016-08-09 09:57:48');
INSERT INTO `log` VALUES ('10', '10', '10', '5', '2016-08-09 09:57:58');
INSERT INTO `log` VALUES ('13', '1', '11224272', '258', '2016-07-14 09:58:53');
INSERT INTO `log` VALUES ('14', '1', '日志标题', '日志内容', '2016-08-16 09:56:51');
INSERT INTO `log` VALUES ('15', '1', '日志标题', '日志内容', '2016-08-16 09:56:51');
INSERT INTO `log` VALUES ('16', '1', '日志标题', '日志内容', '2016-08-16 09:56:51');
INSERT INTO `log` VALUES ('17', '1', '日志标题0', '日志内容0', '2016-08-27 09:30:51');
INSERT INTO `log` VALUES ('18', '1', '日志标题1', '日志内容1', '2016-08-16 09:01:51');
INSERT INTO `log` VALUES ('19', '1', '日志标题2', '日志内容2', '2016-08-20 09:08:51');
INSERT INTO `log` VALUES ('20', '1', '日志标题3', '日志内容3', '2016-08-05 09:03:51');
INSERT INTO `log` VALUES ('21', '1', '日志标题4', '日志内容4', '2016-08-24 09:47:51');
INSERT INTO `log` VALUES ('23', '1', '日志标题6', '日志内容6', '2016-08-02 09:21:51');
INSERT INTO `log` VALUES ('24', '1', '日志标题7', '日志内容7', '2016-08-16 09:53:51');
INSERT INTO `log` VALUES ('25', '1', '日志标题8', '日志内容8', '2016-08-18 09:42:51');
INSERT INTO `log` VALUES ('26', '1', '日志标题9', '日志内容9', '2016-08-22 09:07:51');
INSERT INTO `log` VALUES ('27', '1', '日志标题10', '日志内容10', '2016-08-19 09:35:51');
INSERT INTO `log` VALUES ('28', '1', '日志标题11', '日志内容11', '2016-08-25 09:07:51');
INSERT INTO `log` VALUES ('29', '1', '日志标题12', '日志内容12', '2016-08-04 09:51:51');
INSERT INTO `log` VALUES ('30', '1', '日志标题13', '日志内容13', '2016-08-15 09:02:51');
INSERT INTO `log` VALUES ('31', '1', '日志标题14', '日志内容14', '2016-08-05 09:30:51');
INSERT INTO `log` VALUES ('32', '1', '日志标题15', '日志内容15', '2016-08-21 09:07:51');
INSERT INTO `log` VALUES ('33', '1', '日志标题16', '日志内容16', '2016-08-15 09:59:51');
INSERT INTO `log` VALUES ('34', '1', '日志标题17', '日志内容17', '2016-08-26 09:40:51');
INSERT INTO `log` VALUES ('35', '1', '日志标题18', '日志内容18', '2016-08-08 09:53:51');
INSERT INTO `log` VALUES ('36', '1', '日志标题19', '日志内容19', '2016-08-22 09:15:51');
INSERT INTO `log` VALUES ('37', '1', '日志标题20', '日志内容20', '2016-08-27 09:52:51');
INSERT INTO `log` VALUES ('38', '1', '日志标题21', '日志内容21', '2016-08-12 09:40:51');
INSERT INTO `log` VALUES ('39', '1', '日志标题22', '日志内容22', '2016-08-11 09:57:51');
INSERT INTO `log` VALUES ('40', '1', '日志标题23', '日志内容23', '2016-08-26 09:03:51');
INSERT INTO `log` VALUES ('41', '1', '日志标题24', '日志内容24', '2016-08-26 09:47:51');
INSERT INTO `log` VALUES ('42', '1', '日志标题25', '日志内容25', '2016-08-13 09:01:51');
INSERT INTO `log` VALUES ('43', '1', '日志标题26', '日志内容26', '2016-08-14 09:27:51');
INSERT INTO `log` VALUES ('44', '1', '日志标题27', '日志内容27', '2016-08-17 09:09:51');
INSERT INTO `log` VALUES ('45', '1', '日志标题28', '日志内容28', '2016-08-26 09:51:51');
INSERT INTO `log` VALUES ('46', '1', '日志标题29', '日志内容29', '2016-08-24 09:06:51');
INSERT INTO `log` VALUES ('47', '1', '日志标题30', '日志内容30', '2016-08-11 09:52:51');
INSERT INTO `log` VALUES ('48', '1', '日志标题31', '日志内容31', '2016-08-28 09:24:51');
INSERT INTO `log` VALUES ('49', '1', '日志标题32', '日志内容32', '2016-08-09 09:22:51');
INSERT INTO `log` VALUES ('50', '1', '日志标题33', '日志内容33', '2016-08-01 09:17:51');
INSERT INTO `log` VALUES ('52', '1', '日志标题35', '日志内容35', '2016-08-21 09:15:51');
INSERT INTO `log` VALUES ('53', '1', '日志标题36', '日志内容36', '2016-08-15 09:50:51');
INSERT INTO `log` VALUES ('54', '1', '日志标题37', '日志内容37', '2016-08-24 09:34:51');
INSERT INTO `log` VALUES ('55', '1', '日志标题38', '日志内容38', '2016-08-12 09:55:51');
INSERT INTO `log` VALUES ('56', '1', '日志标题39', '日志内容39', '2016-08-08 09:37:51');
INSERT INTO `log` VALUES ('57', '1', '日志标题40', '日志内容40', '2016-08-02 09:19:51');
INSERT INTO `log` VALUES ('58', '1', '日志标题41', '日志内容41', '2016-08-08 09:15:51');
INSERT INTO `log` VALUES ('59', '1', '日志标题42', '日志内容42', '2016-08-21 09:21:51');
INSERT INTO `log` VALUES ('61', '1', '日志标题44', '日志内容44', '2016-08-30 09:29:51');
INSERT INTO `log` VALUES ('62', '1', '日志标题45', '日志内容45', '2016-08-26 09:49:51');
INSERT INTO `log` VALUES ('63', '1', '日志标题46', '日志内容46', '2016-08-06 09:18:51');
INSERT INTO `log` VALUES ('64', '1', '日志标题47', '日志内容47', '2016-08-14 09:07:51');
INSERT INTO `log` VALUES ('65', '1', '日志标题48', '日志内容48', '2016-08-03 09:21:51');
INSERT INTO `log` VALUES ('66', '1', '日志标题49', '日志内容49', '2016-08-11 09:13:51');
INSERT INTO `log` VALUES ('67', '1', '日志标题50', '日志内容50', '2016-08-27 09:42:51');
INSERT INTO `log` VALUES ('68', '1', '日志标题51', '日志内容51', '2016-08-17 09:30:51');
INSERT INTO `log` VALUES ('69', '1', '日志标题52', '日志内容52', '2016-08-24 09:28:51');
INSERT INTO `log` VALUES ('70', '1', '日志标题53', '日志内容53', '2016-08-13 09:21:51');
INSERT INTO `log` VALUES ('71', '1', '日志标题54', '日志内容54', '2016-08-25 09:41:51');
INSERT INTO `log` VALUES ('72', '1', '日志标题55', '日志内容55', '2016-08-13 09:07:51');
INSERT INTO `log` VALUES ('73', '1', '日志标题56', '日志内容56', '2016-08-04 09:22:51');
INSERT INTO `log` VALUES ('74', '1', '日志标题57', '日志内容57', '2016-08-04 09:33:51');
INSERT INTO `log` VALUES ('75', '1', '日志标题58', '日志内容58', '2016-08-08 09:18:51');
INSERT INTO `log` VALUES ('76', '1', '日志标题59', '日志内容59', '2016-08-18 09:33:51');
INSERT INTO `log` VALUES ('77', '1', '日志标题60', '日志内容60', '2016-08-00 09:11:51');
INSERT INTO `log` VALUES ('78', '1', '日志标题61', '日志内容61', '2016-08-17 09:17:51');
INSERT INTO `log` VALUES ('79', '1', '日志标题62', '日志内容62', '2016-08-28 09:31:51');
INSERT INTO `log` VALUES ('80', '1', '日志标题63', '日志内容63', '2016-08-29 09:26:51');
INSERT INTO `log` VALUES ('81', '1', '日志标题64', '日志内容64', '2016-08-17 09:57:51');
INSERT INTO `log` VALUES ('82', '1', '日志标题65', '日志内容65', '2016-08-17 09:16:51');
INSERT INTO `log` VALUES ('84', '1', '日志标题67', '日志内容67', '2016-08-12 09:16:51');
INSERT INTO `log` VALUES ('85', '1', '日志标题68', '日志内容68', '2016-08-05 09:08:51');
INSERT INTO `log` VALUES ('86', '1', '日志标题69', '日志内容69', '2016-08-03 09:50:51');
INSERT INTO `log` VALUES ('87', '1', '日志标题70', '日志内容70', '2016-08-02 09:14:51');
INSERT INTO `log` VALUES ('88', '1', '日志标题71', '日志内容71', '2016-08-10 09:45:51');
INSERT INTO `log` VALUES ('89', '1', '日志标题72', '日志内容72', '2016-08-04 09:54:51');
INSERT INTO `log` VALUES ('90', '1', '日志标题73', '日志内容73', '2016-08-09 09:16:51');
INSERT INTO `log` VALUES ('91', '1', '日志标题74', '日志内容74', '2016-08-00 09:07:51');
INSERT INTO `log` VALUES ('92', '1', '日志标题75', '日志内容75', '2016-08-06 09:13:51');
INSERT INTO `log` VALUES ('94', '1', '日志标题77', '日志内容77', '2016-08-16 09:23:51');
INSERT INTO `log` VALUES ('95', '1', '日志标题78', '日志内容78', '2016-08-20 09:57:51');
INSERT INTO `log` VALUES ('96', '1', '日志标题79', '日志内容79', '2016-08-19 09:50:51');
INSERT INTO `log` VALUES ('97', '1', '日志标题80', '日志内容80', '2016-08-27 09:16:51');
INSERT INTO `log` VALUES ('98', '1', '日志标题81', '日志内容81', '2016-08-13 09:36:51');
INSERT INTO `log` VALUES ('99', '1', '日志标题82', '日志内容82', '2016-08-18 09:20:51');
INSERT INTO `log` VALUES ('100', '1', '日志标题83', '日志内容83', '2016-08-13 09:48:51');
INSERT INTO `log` VALUES ('101', '1', '日志标题84', '日志内容84', '2016-08-07 09:55:51');
INSERT INTO `log` VALUES ('102', '1', '日志标题85', '日志内容85', '2016-08-20 09:08:51');
INSERT INTO `log` VALUES ('103', '1', '日志标题86', '日志内容86', '2016-08-21 09:01:51');
INSERT INTO `log` VALUES ('104', '1', '日志标题87', '日志内容87', '2016-08-29 09:17:51');
INSERT INTO `log` VALUES ('105', '1', '日志标题88', '日志内容88', '2016-08-10 09:33:51');
INSERT INTO `log` VALUES ('106', '1', '日志标题89', '日志内容89', '2016-08-25 09:24:51');
INSERT INTO `log` VALUES ('107', '1', '日志标题90', '日志内容90', '2016-08-02 09:01:51');
INSERT INTO `log` VALUES ('108', '1', '日志标题91', '日志内容91', '2016-08-19 09:24:51');
INSERT INTO `log` VALUES ('109', '1', '日志标题92', '日志内容92', '2016-08-24 09:44:51');
INSERT INTO `log` VALUES ('110', '1', '日志标题93', '日志内容93', '2016-08-26 09:26:51');
INSERT INTO `log` VALUES ('111', '1', '日志标题94', '日志内容94', '2016-08-03 09:57:51');
INSERT INTO `log` VALUES ('112', '1', '日志标题95', '日志内容95', '2016-08-04 09:06:51');
INSERT INTO `log` VALUES ('113', '1', '日志标题96', '日志内容96', '2016-08-05 09:16:51');
INSERT INTO `log` VALUES ('114', '1', '日志标题97', '日志内容97', '2016-08-19 09:54:51');
INSERT INTO `log` VALUES ('115', '1', '日志标题98', '日志内容98', '2016-08-00 09:02:51');
INSERT INTO `log` VALUES ('116', '1', '日志标题99', '日志内容99', '2016-08-26 09:45:51');
INSERT INTO `log` VALUES ('117', '1', '今天我有喜了', '哈哈，我是骗你的，sb', '2016-08-30 09:06:51');
INSERT INTO `log` VALUES ('120', '1', '我里面有图片，戳我！（修改）', '<p>									</p><p><img src=\"http://localhost:8080/yooaispace/temp/log/imges/20160831/1472630670467004609.jpg\" title=\"1472630670467004609.jpg\" width=\"226\" height=\"231\"/></p><p><br/></p><p>这图片还行吧~</p><p><br/></p><p>\r\n					</p>', '2016-08-31 16:27:12');
INSERT INTO `log` VALUES ('121', '1', '哈哈哈哈', '<p><img src=\"http://localhost:8080/yooaispace/temp/log/imges/20160831/1472649228864044028.jpg\" title=\"1472649228864044028.jpg\" alt=\"head6.jpg\"/></p>', '2016-08-31 21:13:59');
INSERT INTO `log` VALUES ('122', '1', '2015唯美的图片日志说说心情短语', '<p>一、&nbsp;牵着你的手，无论是在哪里，我都感觉像是在朝天堂奔跑。</p><p><img alt=\"唯美的图片说说心情短语\" src=\"http://pic.365j.com/article/image/201504/16/bf56177777.jpg\"/></p><p>二、&nbsp;感觉一旦消失，承诺就只是一张白纸。</p><p><img alt=\"唯美的图片说说心情短语2\" src=\"http://pic.365j.com/article/image/201504/16//4841211381.jpg\"/></p><p>三、&nbsp;每件事情都会好起来。春风变的软软的，阳光像刚切开的浆果冻芝士一样甜腻鲜艳。最好不过人间四月。那样晴朗的天儿，适合和过去告个漂亮的别。</p><p><img alt=\"唯美的图片说说心情短语3\" src=\"http://www.gexings.com/uploads/allimg/150415/2-150415161314N4.jpg\"/></p><p>四、&nbsp;小疯子，你离开了我，我才知道，没有你的世界，一片黑暗。</p><p><img alt=\"唯美的图片说说心情短语4\" src=\"http://www.gexings.com/uploads/allimg/150415/2-1504151613395A.jpg\"/></p><p>五、&nbsp;唯美的爱情，是背后沧海桑田的故事</p><p><img alt=\"唯美的图片说说心情短语5\" src=\"http://www.gexings.com/uploads/allimg/150415/2-15041516135X55.jpg\"/></p><p>六、&nbsp;这世上有三样东西是别人抢不走的：一是吃进胃里的食物，二是藏在心中的梦想，三是读进大脑的书。</p><p><br/></p>', '2016-08-31 21:30:12');
INSERT INTO `log` VALUES ('123', '4', '重叠泪痕缄锦字，人生只有情难死', '<p><img alt=\"\" src=\"http://www.ok87.com/uploads/allimg/160711/1-160G12139432C.jpg\"/></p><p>　　1.</p><p>　　第一次和阿南说我喜欢你的时候，是在4月1日。</p><p>　　那天天气真的很好啊，适合牵手，适合表白，适合做一切心里一直想做却不敢做的事情。</p><p>　　然后我在十二点下课的时候，收到了阿南的微信。</p><p>　　我喜欢你。</p><p>　　就是这四个字，让我在记起了4月1日原来还是个节日。</p><p>　　然而我还是很高兴啊!</p><p>　　毕竟我一辈子都没有指望过现实中我的男神会跟我说这几个字，即使我曾在脑海中想象过各种各样啊南某天突然向我表白的情景，即使这句话，只能在愚人节中以玩笑的形式存在。</p><p>　　可是，离愚人节过去，还有十二个小时啊!我还可以自欺欺人地认为，阿南在这十二个小时之中，是喜欢我的。今天是4月1日，没有人规定过，自己不能骗自己的吧。</p><p>　　我知道他很有可能把这句话发给了很多人，就像去年的圣诞节，我收到了他发来的一只苹果，满心欢喜之际去刷朋友圈的时候，发现他发了一条朋友圈，说他今天手动发了一千多个苹果，还在抱怨手好累啊一样。</p><p>　　我知道我应该回他一句:我也喜欢你啊!</p><p>　　就像平时的节日祝福一样，别人说:</p><p>　　“节日快乐!”</p><p>　　然后我也回一句:</p><p>　　“节日快乐!”</p><p>　　从此便无下文。</p><p>　　我知道他今天也收到了很多“我喜欢你”一类的表白，关注一个人，总是能在方方面面的蛛丝马迹中得到自己想知道的信息的。</p><p>　　我不清楚多少人在愚人节这天以玩笑的名义说出了对他的真心话，可是他啊，一定是知道的。</p><p>　　五分钟后，我回了他一句:</p><p>　　“怎么办，我当真了”</p><p>　　没有加上任何我平时跟别人聊天时惯用的表情。</p><p>　　表情太容易泄露一个人说话的语气，我到底是认真的还是在开玩笑，你自己看着理解吧!</p><p>　　下午的时候，看到阿南在群里说话了，然而却没有再回我的信息。</p><p>　　我想，大概就这样了吧。</p><p>　　晚上十点多的时候，看到微信窗口上备注着阿南男神名字的头像上的那个小红1的时候，激动到情不自禁地傻傻笑了出来。</p><p>　　“哈哈，是真的啊!”</p><p>　　“那正是太巧了”</p><p>　　“我也喜欢你啊!”</p><p>　　好巧啊，世界那么大，人那么多，可是，我喜欢的人恰好也喜欢我。</p><p>　　零点一过，我知道自己再也找不到喜欢我的那个阿南，可是，不管是昨天的我，还是今天的我，或者明天的我，都是我啊——喜欢阿南的那个我。</p><p>　　2.</p><p>　　我觉得自己是个一往无前的胆小鬼。</p><p>　　没过多久，我又有了和阿南见面的机会。</p><p>　　那天部门办活动需要拉赞助，阿南死皮赖脸地跟我们部长说，我们这边人少，分两个小学妹过来呗!于是一脸得意地把我拉了过去。</p><p>　　我们四个人，兵分两路。阿南和我一组，于是我和阿南，难得又有了独处的机会。</p><p>　　初夏的太阳已经迫不及待对我们释放它的热情。</p><p>　　走到中午的时候，阿南说他去买饮料，让我乖乖站在这儿不要动。</p><p>　　一个大概和我们差不多大的男生走过来说他也是学生，在兼职，让我帮他扫一下二维码。我知道兼职也挺不容易的，所以这种情况下我都不会拒绝。</p><p>　　那个男生也是挺逗的，一副自来熟的样子，还问我有没有男朋友，我说没有，他还开玩笑说可以帮我介绍一个。</p><p>　　阿南这时候走过来了，我赶紧跟那个男生说再见，然后快步走到阿南身边。</p><p>　　阿南递给我一杯饮料。</p><p><br/></p>', '2016-08-31 21:42:08');
INSERT INTO `log` VALUES ('124', '2', '地球边缘发现神秘太空生物:形似人类胎儿', '<p>随着人类太空探索技术的不断进步，科学家越来越渴望与外星文明建立联系，而最新<a href=\"http://car.auto.ifeng.com/series/2087/\" target=\"_blank\">发现</a>揭示，事实上“外星人”一直就在我们身边，只是一直没有被发现而已。据介绍，这些太空生物是被发射的气象气球所带回，其漂浮于距离地表30公里的大气层当中。</p><p>随着人类太空探索技术的不断进步，科学家越来越渴望与外星文明建立联系，而最新发现揭示，事实上“外星人”一直就在我们身边，只是一直没有被发现而已。外媒报道称，科学家在地球大气层边缘发现了一些非常原始的太空生物，这些生物的外貌看起来非常的诡异，有些类似尚未成型的人类胎儿。研究人员对于这样劲爆的发现兴奋不已，并坚信这些原始生命身上存在这地球生命起源的秘密。据介绍，这些太空生物是被发射的气象气球所带回，其漂浮于距离地表30公里的大气层当中。对于这些生物从何而来，有人认为是外星陨石带来的，它们最初在陨石穿越大气层时被遗落在这里，之后随雨水降到地面，慢慢进化出了地球生物。但也有学者认为，这些生物其实还是来自地球本身，之所以会出现在大气层，是由于上升气流作用将它们从地表带到了高空。目前，研究者们正在努力揭开这些神秘生物的真实身份，而这个结果或许会让世人所震惊。</p><p><img src=\"http://www.liuburu.cn/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0026.gif\"/><img src=\"http://localhost:8080/yooaispace/temp/log/imges/20160831/1472652593080009119.jpg\" title=\"1472652593080009119.jpg\" alt=\"bc7cfd2d64f31f13-39dfd5370076ad3d-8ae6492db91d895a1157ddf98e7ac27d.jpg\"/></p>', '2016-08-31 22:10:03');
INSERT INTO `log` VALUES ('125', '1', '官方：曼城射手博尼租借加盟斯托克城', '<p>北京时间8月31日，英超球队斯托克城官方宣布，球队从曼城处租下了科特迪瓦射手博尼，租期为一个赛季。</p><p><img src=\"http://tu.qiumibao.com/uploads/day_160831/201608312004058852.png\" alt=\"\" width=\"500\"/></p><p>现年28岁的博尼职业生涯起步于捷克球队布拉格斯巴达，在转投荷甲维特斯后博尼迎来了爆发的两个半赛季，在73场比赛中打进53球，状态甚是火爆。</p><p>2013年夏天，博尼选择登陆英超加盟斯旺西，而他也凭借着出色的状态成为了球队的当家射手，在2014年他的状态更是惊人，当年度打进21粒联赛进球使得他成为了2014年度进球最多的英超球员。</p><p>2015年1月，博尼以2800万英镑的身价转会曼城，但在蓝月亮效力期间博尼逐渐失去了射手的嗅觉，代表球队出场了36场联赛，仅仅打进6球。</p><p><br/></p>', '2016-08-31 23:13:36');
INSERT INTO `log` VALUES ('126', '1', '【翻译组】科比5大经典形象 若为科比立雕像你选哪个', '<p>湖人主场斯台普斯球馆门口目前已经有了魔术师约翰逊、天勾贾巴尔以及logo男杰里-韦斯特的三座雕像，大鲨鱼奥尼尔的雕像也很快会被建造起来。</p><p>那么科比的雕像什么时候才会建造起来？别着急，湖人总裁珍妮-巴斯之前在接受采访时就说过一定会在斯台普斯球馆门口为科比立雕像，这只是早晚的事。</p><p>科比20年生涯有经典动作不在少数，《福克斯体育》近期盘点出了科比5大最经典的形象可供湖人挑选。</p><p><img alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608311044508050.jpg\"/></p><p><strong>&nbsp; 美如画后仰</strong></p><p>“你的后仰没有酒，我却醉的像条狗”这句话想必科密们都已经烂熟于心。</p><p>后仰跳投是科比在场上最犀利的武器，他用各种无解的跳投让对手无计可施。这样的武器绝对是经过千锤百炼才能练就。若要在斯台普斯门前为科比立一座雕像，他如教科书般的后仰跳投必定是第一选择。</p><p><img alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608311045037210.jpg\"/></p><p><strong>复仇绿凯 五冠手势</strong></p><p>2010年总决赛，黄绿大战，科比率领湖人最终拿下抢七大战，一场酣畅淋漓的复仇，这也是科比生涯第五座总冠军。科比跳上技术台，一手拿着篮球，一手比了一个5的手势，霸气十足。</p><p><img alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608311045355504.jpg\"/></p><p><strong>双绝杀太阳 扯球衣霸气怒吼</strong></p><p>2006年季后赛对阵太阳的第四场，科比在加时赛最后时刻命中绝杀后扯着球衣怒吼，就像81分之夜一样，让人难以忘怀。双绝杀，这是科比生涯最经典的高光时刻之一，黑曼巴的嗜血与好胜逐渐开始崭露头角。</p><p><img alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608311046391656.jpg\"/></p><p><strong>骑扣魔兽</strong></p><p>2004年，科比在一次对阵魔术的比赛中骑在霍华德头上完成了一记暴扣，这或许是魔兽最不愿回首的一刻，但这一扣也堪称科比生涯最漂亮的扣篮之一。</p><p><img alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608311046466858.jpg\"/></p><p><strong>吐舌</strong></p><p>吐舌头是MJ最标志的动作之一。科比一度被誉为最接近乔神的男人，早期的科比也在有意无意地向乔丹靠近。在今年儿童选择奖颁奖仪式中，科比全身被喷成了金色吐着舌头，这一幕也定格成了这个无神时代最偏执的追逐者经典时刻之一。但对于科密来说，科比就是科比，他谁也不像。</p><p><br/></p>', '2016-08-31 23:39:09');
INSERT INTO `log` VALUES ('129', '1', '官方：纳斯里租借加盟塞维利亚 租期一个赛季', '<p>北京时间8月31日，英超豪门曼城官方宣布中场纳斯里租借加盟塞维利亚，租期为一个赛季。</p><p><img width=\"500\" alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608311455328993.jpg\"/></p><p>曼城官方写到：法国中场萨米尔·纳斯里本赛季将租借加盟西甲的塞维利亚俱乐部直至赛季结束，曼城俱乐部祝他在西班牙一切好运。</p><p>纳斯里在2011年从阿森纳以2750万欧元转会费加盟了曼城，为蓝月亮效力了5年时间，他在曼城共出场176次，打进26个进球助攻40次，跟随曼城举起了2座英超奖杯，2座联赛杯奖杯和一座社区盾奖杯</p><p><br/></p>', '2016-08-31 23:40:15');
INSERT INTO `log` VALUES ('131', '1', '官方：国米与巴尔博萨签约五年', '<p><img width=\"500\" alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608310041001512.jpg\"/></p><p>北京时间今天，国米宣布与巴西前锋巴尔博萨签约至2021年，据悉转会费为2800万欧元。</p><p>巴尔博萨今年20岁，他刚刚岁巴西国奥队出战奥运后并拿到了冠军，他在6场比赛中贡献了2粒进球。而在俱乐部，他为桑托斯出场82次，打进了24球并助攻12次。</p><p>巴尔博萨可以出任前场的任何位置，相信他的到来对于国米的进攻线将是一个极好的补充。</p><p><br/></p>', '2016-08-31 23:40:58');
INSERT INTO `log` VALUES ('133', '1', '邮报：3200万镑，大卫路易斯接近回归切尔西', '<p><img width=\"500\" alt=\"\" src=\"http://tu.qiumibao.com/uploads/day_160831/201608312216432174.jpg\"/></p><p>《每日邮报》独家报道称，切尔西即将从巴黎圣日耳曼回签大卫路易斯，转会费大约为3200万英镑。切尔西可能会在转会截止（当地时间23点）后为大卫路易斯安排体检。</p><p>2014年，大卫路易斯以创纪录的5000万英镑的价格从斯坦福桥转投巴黎。而现在，这位巴西后卫和切尔西就个人条款达成一致。</p><p>如果转会最终发生，那么在足坛历史后卫转会榜前3中，路易斯将占据2个位置（另一个转会是斯通斯加盟曼城）。</p><p>不久前，切尔西曾求购那不勒斯后卫库利巴利以及AC米兰后卫罗马尼奥利，但是均遭到拒绝。此外，孔蒂还曾询价路易斯的队友马基尼奥斯。</p><p><br/></p>', '2016-08-31 23:41:48');
INSERT INTO `log` VALUES ('134', '1', '你还爱着的前女友，和别人上床了，你会是什么感受', '<p>之前和女朋友分手了，因为一些无奈的原因，今天突然想到这个问题，心里一阵绞痛，唉，不知道你们是什么感受。</p>', '2016-08-31 23:42:39');
INSERT INTO `log` VALUES ('135', '1', '女朋友老是不愿意和我亲热，求家人们帮忙分析', '<p>lz大二，女朋友大一，去年在一起的，然后去年年底第一次那啥之后，一直到今年五月份，因为异地所以断断续续的有过几次。结果暑假开始之后，我们几乎天天\r\n见面，她一直拒绝我，一开始说等姨妈过了就给我，后来又说反正快开学了，有的是时间（ps.女朋友今年转到我学校了），结果现在开学了，说她不想，就是不\r\n想…… JR们说这个会不会是性冷淡…还是说我欲望太强…现在非常苦恼啊…</p>', '2016-08-31 23:43:21');
INSERT INTO `log` VALUES ('136', '1', '女生胸大会驼背吗，规矩我懂', '<p>很好奇，胸大的话相对于重心的力矩会比较大，那是不是就会导致驼背呢？求各位老司机指点一下！</p><p><br/></p><p><br/></p><p></p><p><br/></p><p><br/></p><p></p><p><br/></p>', '2016-08-31 23:47:22');
INSERT INTO `log` VALUES ('137', '1', 'ZT 备胎突然有女朋友了，我该不该夺回来？有福利！', '<p>T 备胎突然有女朋友了，我该不该夺回来？有福利！ &nbsp;由 游侠官方 发表在<a href=\"http://www.hupu.com/\" target=\"_blank\">虎扑体育</a>·<a href=\"http://bbs.hupu.com/bxj\">步行街</a> <a href=\"http://bbs.hupu.com/bxj\">http://bbs.hupu.com/bxj</a></p><p>投票主题：备胎突然有女朋友了，我该不该夺回来？<br/>该<br/></p><p><a title=\"查看投此票的成员\">608票(7.6%)</a></p><p>不该！<br/></p><p><a title=\"查看投此票的成员\">646票(8.1%)</a></p><p>活该！<br/></p><p><a title=\"查看投此票的成员\">6764票(84.4%)</a></p><p>&nbsp;&nbsp;</p><p>&nbsp;&nbsp;<a>8018人参加投票</a></p><p>&nbsp; &nbsp; &nbsp; &nbsp;</p><p>&nbsp; &nbsp; &nbsp;<strong><em>有点担心小部分JRs的眼力啊！是转帖！后边也特别备注来源的。各位家人们，少撸点，眼力担忧啊，若是干活，耽误事啊！！！</em></strong></p><p><strong><em>&nbsp; &nbsp; &nbsp;</em>小结：大部分JR还是很正直的，28还是真28的，除了个别伪JR。三观堪忧、、</strong></p><p><strong>&nbsp; &nbsp;PS：作者：古的白</strong></p><p>&nbsp; &nbsp; &nbsp;说他是备胎有点过分，因为我对他也蛮有好感。我俩是同学认识了3年，<strong>他对我百般呵护，鞍前马后，而且特别懂我，我俩是无话不谈的好友，特别懂对方的心。</strong><br/><br/>&nbsp;\r\n &nbsp; &nbsp; \r\n作为一个女生是足够敏感的，我确定他是喜欢我的。因为我跟其他男生在一起时，他会表现的吃醋。在有其他男生追求我时，他也会不开心耍脾气。他总会在我最需\r\n要他的时候出现在我身边，无论是难过时，还是寂寞时。他是一个比较严肃的人，对任何其他女生都比较冷漠，唯独对我总是撒娇卖萌的状态，还有很多等等~&nbsp;<strong>我能明显的知道他是喜欢我的，至少暗恋我2年以上。</strong>&nbsp;我谈不上喜欢他，但至少觉得有些好感。<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp;我俩都属于不主动型，<strong>他一直觉得他配不上我</strong>，所以没有采取什么行动，只是<strong>默默陪着我</strong>&nbsp;可是一个暑假，<strong>他突然之间有了女朋友，而且女朋友居然还不错。</strong>我其实挺郁闷的，可又不好说什么，只是<strong>心里特别难过</strong>。不过他虽然有了女友，但对我依旧如旧，晚上陪我谈心聊天，各种<strong>体贴照顾</strong>。（他和女友是异地恋。） 可是她女友有一次知道了他对我的种种好，特别吃醋，大闹一场，要求他不理我。然后他<strong>居然</strong>就不理我了。。。。 有时候在学校碰到，他眼神明显就是喜欢我的，但又要无奈的回避。他总是看到我眼神一阵惊慌，然后低着头从我身边走过去。 我主动跟他打了两次招呼，他也简单回应了。&nbsp;<strong>可是我之前请他来家里吃饭，他却拒绝了 我真的很生气，我跟他又没发生什么过分行为，她女朋友为什么无理取闹。</strong>非得连话都说不了才满意吗 另外，我之前问他和女友关系怎么样，他总说就那样把，没有表现的对女友感情有多深。<br/><br/><strong>&nbsp; &nbsp; 我觉得心里不舒服，就像自己的</strong><strong><em>玩具&nbsp;</em></strong><strong>突然被别人抢了。</strong><br/><br/>&nbsp; &nbsp; &nbsp; 有时候在教室他会偷偷看我，而我一回头看他他就把目光赶紧移开。<strong>所以我有自信他依旧是喜欢我的。</strong>而且听同学说他总会跟别人打听我的近况。 如果他有女友后，对我特别冷漠厌恶我也就算了，可是看的出来即便现在，他心里也是有我的，他很想跟我像以前一样要好，<strong>只是</strong>碍于他女朋友，他不得不这样。<strong>而对于我，通过这次的绝交，才发现他对我有多么重要，想跟他好好在一起。</strong>都怪我以前不珍惜。 我该怎么办，我要不要再主动些，比如再请他吃饭，或者主动跟他聊天打招呼？</p><p><br/></p><p><strong>PS：作者：古的白</strong></p><p><br/></p><p>很多同学对热备，冷备，云备了解不深，我科普一下IT行业各种备份术语。以后别闹笑话了。<br/> 假设你是一位女性，你有一位男朋友，于此同时你和另外一位男生暧昧不清，比朋友 好，又不是恋人。你随时可以甩了现任男友，另外一位马上就能补上。这是冷备份。<br/> 假设你是一位女性，同时和两位男性在交往，两位都是你男朋友。并且他们还互不干涉，独立运行。这就是双机热备份。<br/> 假设你是一位女性，不安于男朋友给你的安全感。在遥远的男友未知的地方，和一位男生保持着联系，你告诉他你没有男朋友，你现在处于纠结期，一旦你和你男朋友分开了，你马上可以把自己感情转移到异地男人那里去。这是异地容灾备份。<br/> 假设你是一位女性，有一位男朋友，你又付了钱给一家婚姻介绍所，让他帮你留意好的资源，一旦你和你这位男朋友分开，婚姻介绍所马上给你安排资源，你感情不间断运行，这是云备份。。。。<br/> 数据安全大于一切，今天你把自己备份了吗？<br/><br/>根据评论区脑洞，再补几个。<br/> 假设你是一位女性，你怀疑男朋友对你的忠诚，在某宝购买了一个测试忠诚度的服务。这是灾难演练。友情提醒，在没有备份的情况下，切忌进行灾难演练，说不好会让你数据血本无归。。<br/> 假设你是一位女性，你有一位好到不能在好的闺蜜，好到你们可以共享一个男朋友，这是NAS。<br/> 假设你是一位女性，你男朋友活太好，你一个人根本hold不住，必须要姐妹帮忙才能稳住他。这是负载均衡，QOS。<br/> 假设你是一位女性，和A吃饭和B逛街和C*河蟹*。合起来是一个完整的男朋友。这。。这是超算集群。。。建议主频不高的女性不要这样做。会直接死机的。。</p><p><br/></p><p></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>', '2016-08-31 23:48:31');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `say_id` int(11) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `pictrue_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `say_id` (`say_id`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`say_id`) REFERENCES `say` (`say_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('13', '22', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('14', '22', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('15', '22', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('16', '22', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('40', '25', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('41', '25', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('42', '25', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('47', '27', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('48', '29', 'temp/imges/head53ef07027-8c3a-4819-bb06-d5844b9511b1.jpg', null);
INSERT INTO `picture` VALUES ('52', '44', 'temp/imges/0380b49bd-6a54-43a0-b0da-12073e947b8a.jpg', null);
INSERT INTO `picture` VALUES ('53', '47', 'temp/imges/test93e5f580-2455-43e1-a43c-87b5114de05d.jpg', null);
INSERT INTO `picture` VALUES ('54', '51', 'temp/imges/空间3d8ad7ddc-93ff-4e59-a882-28b3a58131ee.jpg', null);
INSERT INTO `picture` VALUES ('55', '51', 'temp/imges/空间3d8ad7ddc-93ff-4e59-a882-28b3a58131ee.jpg', null);
INSERT INTO `picture` VALUES ('56', '51', 'temp/imges/空间3d8ad7ddc-93ff-4e59-a882-28b3a58131ee.jpg', null);
INSERT INTO `picture` VALUES ('57', '53', 'temp/imges/head3971f1421-5c50-42b5-9127-75fb75dff45e.jpg', null);
INSERT INTO `picture` VALUES ('58', '54', 'temp/imges/head243665475-0c7d-4458-aa7e-034e3877324d.jpg', null);
INSERT INTO `picture` VALUES ('59', '54', 'temp/imges/head33b40c472-6298-4987-89f5-09ed3ffb0d6a.jpg', null);
INSERT INTO `picture` VALUES ('60', '54', 'temp/imges/head4f984e369-505d-4cee-9705-88f910e3f72f.jpg', null);
INSERT INTO `picture` VALUES ('66', '59', 'temp/imges/空间1d3f4c5b0-5549-4f96-a84d-a63144ae2750.jpg', null);
INSERT INTO `picture` VALUES ('67', '59', 'temp/imges/空间2d44bf903-7e82-4499-a4e1-b11cdd359a5b.jpg', null);
INSERT INTO `picture` VALUES ('68', '59', 'temp/imges/空间3d8ad7ddc-93ff-4e59-a882-28b3a58131ee.jpg', null);
INSERT INTO `picture` VALUES ('69', '60', 'temp/imges/43b944ada-323a-4ef1-ac36-9149370319dc.jpg', null);
INSERT INTO `picture` VALUES ('70', '60', 'temp/imges/53992b285-5766-49be-8a7a-31ff70289395.jpg', null);
INSERT INTO `picture` VALUES ('71', '61', 'temp/imges/7da69a06e-a6da-498c-a563-540247f54e92.jpg', null);
INSERT INTO `picture` VALUES ('72', '61', 'temp/imges/8f14a7a1f-c9e4-42ff-839c-b51e32129041.jpg', null);
INSERT INTO `picture` VALUES ('73', '62', 'temp/imges/1-160PH1525b531bad45ea-4884-4550-95f6-39c0919bdd59.jpg', null);
INSERT INTO `picture` VALUES ('74', '62', 'temp/imges/1-160PH153251138d63d260-8523-49dd-8567-7b1cf850dfbe.jpg', null);
INSERT INTO `picture` VALUES ('77', '68', 'temp/imges/147246775040b3ed2d30-258e-4e8d-a2d3-a366c93e43bd.jpg', null);
INSERT INTO `picture` VALUES ('78', '68', 'temp/imges/14724677555353b8f5db-eabc-4fdc-b224-bc63a4602628.jpg', null);
INSERT INTO `picture` VALUES ('79', '69', 'temp/imges/147204032365790458719-a04b-42f6-b47b-b9ea3c4bb215.jpg', null);
INSERT INTO `picture` VALUES ('80', '69', 'temp/imges/14720403503662ddef139-2688-40a4-b7b4-deec59c89ab2.jpg', null);
INSERT INTO `picture` VALUES ('81', '71', 'temp/imges/1469444933786d42dae11-735a-40ba-890f-a2dc0e7a65ba.jpg', null);
INSERT INTO `picture` VALUES ('82', '71', 'temp/imges/1469444953855c4b1b021-c0cf-4325-9440-7a6c14337855.jpg', null);
INSERT INTO `picture` VALUES ('83', '72', 'temp/imges/146839404255761aafc09-4ac4-438d-8706-3ea4afdf8574.jpg', null);
INSERT INTO `picture` VALUES ('84', '72', 'temp/imges/14683940476093468e1aa-f2ae-4f64-a7cf-ed0853608ed2.jpg', null);
INSERT INTO `picture` VALUES ('85', '73', 'temp/imges/1615180039-1233BA-0201-0063-00DF-0B-0556-0300-04d4eafe18-d681-4779-8082-3e6a4e727aa7.jpg', null);
INSERT INTO `picture` VALUES ('86', '74', 'temp/imges/1616464331-1097CD-0201-0056-003E-08-0556-0300-0254babd48-fd4d-48f2-b1ae-21d97fd0dd9c.jpg', null);
INSERT INTO `picture` VALUES ('90', '77', 'temp/imges/11e57d5336-c436-4d98-a433-efbda9f81c0d.jpg', null);
INSERT INTO `picture` VALUES ('91', '78', 'temp/imges/32_140106141414_1e55a5d43-1e60-427a-8187-c0649b3e8ae9.jpg', null);
INSERT INTO `picture` VALUES ('94', '80', 'temp/imges/777 - 副本3e263882-8cf7-4599-98c1-c2611b5c33c5.jpg', null);
INSERT INTO `picture` VALUES ('95', '80', 'temp/imges/66 - 副本720e8fc2-0df9-4439-8707-65dd846125af.jpg', null);
INSERT INTO `picture` VALUES ('96', '81', 'temp/imges/55555b9046e9b-e4d0-4628-a8e7-5613ecfadc41.jpg', null);
INSERT INTO `picture` VALUES ('97', '82', 'temp/imges/1113d74f671-1a82-4c1d-8ba2-c151154fd252.jpg', null);
INSERT INTO `picture` VALUES ('98', '83', 'temp/imges/0001042e83e-9df9-4fa1-ae6e-841c597123d1.jpg', null);
INSERT INTO `picture` VALUES ('101', '85', 'temp/imges/0d1a32b0d-41d4-43e6-9dd3-86e7b326cd86.jpg', null);
INSERT INTO `picture` VALUES ('102', '86', 'temp/imges/暴风截图2016612443721671a8dc5420-51fd-4685-b268-a8a3399339e7.jpg', null);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `accuser_id` int(11) NOT NULL,
  `defendant_id` int(11) NOT NULL,
  `say_id` int(11) NOT NULL,
  `report_content` text,
  PRIMARY KEY (`accuser_id`,`defendant_id`,`say_id`),
  KEY `defendant_id` (`defendant_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`accuser_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`defendant_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '1', '11', '太黄太暴力了');
INSERT INTO `report` VALUES ('1', '1', '47', '6654');
INSERT INTO `report` VALUES ('1', '2', '13', 'tretfsdgf');
INSERT INTO `report` VALUES ('2', '1', '1', '这条说说不够精彩');
INSERT INTO `report` VALUES ('3', '1', '54', 'mdzz！');
INSERT INTO `report` VALUES ('4', '1', '54', '太黄了');
INSERT INTO `report` VALUES ('10', '10', '29', '999999999999');
INSERT INTO `report` VALUES ('34', '34', '87', '我图网');

-- ----------------------------
-- Table structure for request
-- ----------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  `request_status` int(1) DEFAULT NULL,
  `response_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`request_id`,`response_id`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request
-- ----------------------------

-- ----------------------------
-- Table structure for say
-- ----------------------------
DROP TABLE IF EXISTS `say`;
CREATE TABLE `say` (
  `say_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '说说编号',
  `user_id` int(11) NOT NULL,
  `say_content` longtext NOT NULL COMMENT '说说内容',
  `say_views` int(11) DEFAULT '0' COMMENT '浏览量',
  `say_sendtime` timestamp NULL DEFAULT NULL COMMENT '发表时间',
  `say_lovers` int(11) DEFAULT '0' COMMENT '点赞数',
  `say_open` int(1) DEFAULT '1' COMMENT '是否公开(1:公开  -1：私密  0 ：好友可见)',
  `say_delete` int(1) DEFAULT '1' COMMENT '是否被管理员删除（-1：是的  1：不是）',
  `read_status` int(255) DEFAULT '0' COMMENT '是否阅览过这条说说（0：没有  1：阅览过）',
  `top` int(255) DEFAULT '0' COMMENT '默认不是置顶说说(1：表示置顶说说）',
  PRIMARY KEY (`say_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `say_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of say
-- ----------------------------
INSERT INTO `say` VALUES ('1', '1', '小明滚出去后，被罚跑操场10圈，老师见小明跑得慢，就骑电动车到屁股后面赶，到拐弯处小明一个劲的加速，老师也跟着加速，小明一个急停了下来，老师被吓一跳猛拐弯开翻了。结果老师进了医院，小明开除学籍处理！', '50', '2016-08-16 22:58:39', '26', '1', '1', '1', '0');
INSERT INTO `say` VALUES ('2', '1', '海边一游', '100', '2016-08-17 09:43:26', '21', '1', '1', '1', '0');
INSERT INTO `say` VALUES ('3', '1', '风景如画', '31', '2016-08-17 09:45:26', '11', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('4', '3', 'Get一个好玩的游戏', '33', '2016-08-17 09:49:26', '16', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('5', '6', '五杀金牌主播德莱文', '12', '2016-08-17 09:50:26', '11', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('6', '1', '有一种男生 嘴笨 不甜 但你心里无比清楚 他是那么真实地在爱着你', '34', '2016-08-17 09:55:26', '33', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('7', '2', '新时装效果，还+9999战力提成！【点击体验】', '31', '2016-08-17 10:53:26', '11', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('8', '1', '路漫漫其修远,任重而道远', '21', '2016-08-17 11:45:26', '20', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('9', '3', '又工作了这么久，加油', '11', '2016-08-17 19:25:26', '25', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('10', '3', '今天天气晴朗，心情都好多了，奋斗！', '22', '2016-08-17 19:45:26', '11', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('11', '2', '感觉身体被掏空', '11', '2016-08-17 20:23:26', '23', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('12', '1', '带着弟弟们煮面吃，味道不错哦！学会了煮面天赋。', '41', '2016-08-17 21:45:26', '44', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('13', '2', '今天心情不错', '50', '2016-08-27 11:20:51', '24', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('14', '3', '老子的底盘我做主', '53', '2016-08-27 12:29:09', '7', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('22', '10', '最近喜欢上这几张图片了<img src=\"http://localhost:8080/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0061.gif\" _src=\"http://localhost:8080/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0061.gif\">', '0', '2016-08-28 01:35:35', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('25', '10', '来讲一个幽默的冷笑话吧', '0', '2016-08-28 02:33:37', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('27', '10', '不开心<img src=\"http://localhost:8080/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0065.gif\" _src=\"http://localhost:8080/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0065.gif\">', '0', '2016-08-28 02:37:58', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('29', '10', '第一名，看样子没谁了', '0', '2016-08-28 02:39:23', '1', '1', '1', '0', '1');
INSERT INTO `say` VALUES ('34', '1', '删除我', '0', null, '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('35', '1', '删除我1', '0', null, '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('44', '1', '不用上课真好', '0', '2016-08-30 11:48:17', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('47', '1', '说点什么吧第三方', '0', '2016-08-30 13:57:10', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('51', '1', '说点什么吧', '0', '2016-08-30 14:10:55', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('52', '6', '今天心情不错', '0', '2016-08-30 16:31:44', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('53', '23', '说点什么吧', '0', '2016-08-31 20:57:36', '1', '1', '1', '0', '1');
INSERT INTO `say` VALUES ('54', '1', '酸甜苦辣我自己尝，喜怒哀乐我自己扛，我就是自己的太阳，无须凭借谁的光。', '0', '2016-08-31 21:32:39', '3', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('57', '3', '青春是像风筝', '0', '2016-08-31 21:52:02', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('58', '10', '钱包越来越扁，说明没有亏待自己，吃的用的都有。', '0', '2016-08-31 21:56:44', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('59', '4', '把握一个方向，再把它想的细一些，欲望是人类社会进步的推动力，更能够成为学习的推动力，我相信，只要你努力，执着，真的需要到一样东西到寝食难安的地步，一切的一切都不是问题，它检验的不是一个人学习的能力，而是一个人对一件事的执着和突破自我的能力，坚信执着是一切成功的钥匙，那就没有问题。', '0', '2016-08-31 22:01:50', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('60', '4', '做一个特别简单的人，好相处就处，不好相处就不处，不必对每个人都好。', '0', '2016-08-31 22:04:57', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('61', '4', '我可以让你荣华富贵，也可以让你街头下跪。\n太过迁就别人，别人就会变本加厉的为难你；太过忍让别人，别人就会得寸进尺的伤害你。事实上你所遇见的贱人，多数都是被你的“好”给惯出来的。', '0', '2016-08-31 22:08:11', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('62', '4', '不属于我的雨伞，我宁愿淋雨走路；不属于我的心，我不会挽留，不属于我的東西，我不会要，不是真心给我的東西，我不稀罕。我就是喜欢一边心如明镜知道一切实情，一边装傻充愣看你们演戏。', '0', '2016-08-31 22:09:28', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('63', '1', '疑似马蓉不雅照曝光，或为宋喆老婆所提证据', '0', '2016-08-31 23:15:11', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('68', '1', '心情不好的时候看看它们', '0', '2016-09-01 00:13:37', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('69', '1', '世界这么大 想去看一看', '0', '2016-09-01 00:14:59', '2', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('71', '1', '10年后我会站着这', '0', '2016-09-01 00:20:28', '3', '1', '1', '0', '1');
INSERT INTO `say` VALUES ('72', '1', '海水很漂亮', '0', '2016-09-01 00:23:18', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('73', '5', '酱菜第一光辉！！！', '0', '2016-09-01 00:31:14', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('74', '5', '5000场的德玛，就问你们怕不怕', '0', '2016-09-01 00:33:10', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('77', '4', '呵呵，5000场的德玛还是青铜，爸爸我100场上钻石！！！', '0', '2016-09-01 00:41:25', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('78', '4', '每个人都会经过这个阶段，见到一座山，就想知道山后面是什么。我很想告诉他，可能翻过山后面，你会发现没什么特别。回望之下，可能会觉得这一边更好。每个人都会坚持自己的信念，在别人看来，是浪费时间，她却觉得很重要。', '0', '2016-09-01 00:43:36', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('80', '3', '我是李超，我是超哥，我是宇宙无敌一拳超人and泰罗迪加奥特曼。我不熬夜，我不打撸，我不喝酒，我不抽烟，但我是个坏男人。因为我打呼！！！！', '0', '2016-09-01 00:49:02', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('81', '2', '我要举报两个人，一个是俊杰，一个是李超，一个攻一个受，超哥贼有钱，花了50块钱买到俊杰的屁股！！', '0', '2016-09-01 00:58:27', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('82', '6', '超哥，我终于找到了师傅留下的绝学了，今天晚上我们玩一个你追我的游戏！！！', '0', '2016-09-01 01:02:07', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('83', '7', '余宇， 11点了，小白不在，我们吃午饭去！我要先给自己定一个小目标，两个鸡腿饭，一份混沌，一份炒粉，大瓶可乐。', '0', '2016-09-01 01:08:55', '0', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('85', '8', '刚刚出炉的四杀，请查阅<img src=\"http://www.liuburu.cn/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0061.gif\" _src=\"http://www.liuburu.cn/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0061.gif\">', '0', '2016-09-01 08:34:01', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('86', '33', '我刚注册了一个账号，感觉还不错<img src=\"http://www.liuburu.cn/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0003.gif\" _src=\"http://www.liuburu.cn/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0003.gif\">', '0', '2016-09-01 08:38:42', '1', '1', '1', '0', '0');
INSERT INTO `say` VALUES ('87', '34', '<img src=\"http://www.liuburu.cn/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0010.gif\" _src=\"http://www.liuburu.cn/yooaispace/ueditor/dialogs/emotion/images/jx2/j_0010.gif\">答复我是个', '0', '2016-09-01 10:14:57', '0', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for say_type
-- ----------------------------
DROP TABLE IF EXISTS `say_type`;
CREATE TABLE `say_type` (
  `say_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`say_id`,`type_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `say_type_ibfk_1` FOREIGN KEY (`say_id`) REFERENCES `say` (`say_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `say_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of say_type
-- ----------------------------
INSERT INTO `say_type` VALUES ('5', '1');
INSERT INTO `say_type` VALUES ('7', '1');
INSERT INTO `say_type` VALUES ('13', '1');
INSERT INTO `say_type` VALUES ('14', '1');
INSERT INTO `say_type` VALUES ('29', '1');
INSERT INTO `say_type` VALUES ('34', '1');
INSERT INTO `say_type` VALUES ('35', '1');
INSERT INTO `say_type` VALUES ('85', '1');
INSERT INTO `say_type` VALUES ('86', '1');
INSERT INTO `say_type` VALUES ('34', '2');
INSERT INTO `say_type` VALUES ('61', '2');
INSERT INTO `say_type` VALUES ('1', '3');
INSERT INTO `say_type` VALUES ('25', '3');
INSERT INTO `say_type` VALUES ('63', '3');
INSERT INTO `say_type` VALUES ('1', '4');
INSERT INTO `say_type` VALUES ('2', '4');
INSERT INTO `say_type` VALUES ('6', '4');
INSERT INTO `say_type` VALUES ('8', '4');
INSERT INTO `say_type` VALUES ('9', '4');
INSERT INTO `say_type` VALUES ('10', '4');
INSERT INTO `say_type` VALUES ('11', '4');
INSERT INTO `say_type` VALUES ('12', '4');
INSERT INTO `say_type` VALUES ('27', '4');
INSERT INTO `say_type` VALUES ('44', '4');
INSERT INTO `say_type` VALUES ('47', '4');
INSERT INTO `say_type` VALUES ('53', '4');
INSERT INTO `say_type` VALUES ('54', '4');
INSERT INTO `say_type` VALUES ('57', '4');
INSERT INTO `say_type` VALUES ('58', '4');
INSERT INTO `say_type` VALUES ('59', '4');
INSERT INTO `say_type` VALUES ('63', '4');
INSERT INTO `say_type` VALUES ('80', '4');
INSERT INTO `say_type` VALUES ('81', '4');
INSERT INTO `say_type` VALUES ('82', '4');
INSERT INTO `say_type` VALUES ('83', '4');
INSERT INTO `say_type` VALUES ('6', '5');
INSERT INTO `say_type` VALUES ('8', '5');
INSERT INTO `say_type` VALUES ('9', '5');
INSERT INTO `say_type` VALUES ('10', '5');
INSERT INTO `say_type` VALUES ('11', '5');
INSERT INTO `say_type` VALUES ('27', '5');
INSERT INTO `say_type` VALUES ('53', '5');
INSERT INTO `say_type` VALUES ('54', '5');
INSERT INTO `say_type` VALUES ('57', '5');
INSERT INTO `say_type` VALUES ('59', '5');
INSERT INTO `say_type` VALUES ('60', '5');
INSERT INTO `say_type` VALUES ('61', '5');
INSERT INTO `say_type` VALUES ('62', '5');
INSERT INTO `say_type` VALUES ('78', '5');
INSERT INTO `say_type` VALUES ('4', '6');
INSERT INTO `say_type` VALUES ('7', '6');
INSERT INTO `say_type` VALUES ('22', '6');
INSERT INTO `say_type` VALUES ('44', '6');
INSERT INTO `say_type` VALUES ('47', '6');
INSERT INTO `say_type` VALUES ('62', '6');
INSERT INTO `say_type` VALUES ('73', '6');
INSERT INTO `say_type` VALUES ('74', '6');
INSERT INTO `say_type` VALUES ('77', '6');
INSERT INTO `say_type` VALUES ('85', '6');
INSERT INTO `say_type` VALUES ('87', '6');
INSERT INTO `say_type` VALUES ('2', '7');
INSERT INTO `say_type` VALUES ('3', '7');
INSERT INTO `say_type` VALUES ('5', '7');
INSERT INTO `say_type` VALUES ('51', '7');
INSERT INTO `say_type` VALUES ('52', '7');
INSERT INTO `say_type` VALUES ('87', '7');
INSERT INTO `say_type` VALUES ('3', '8');
INSERT INTO `say_type` VALUES ('22', '8');
INSERT INTO `say_type` VALUES ('51', '8');
INSERT INTO `say_type` VALUES ('52', '8');
INSERT INTO `say_type` VALUES ('60', '8');
INSERT INTO `say_type` VALUES ('68', '8');
INSERT INTO `say_type` VALUES ('69', '8');
INSERT INTO `say_type` VALUES ('71', '8');
INSERT INTO `say_type` VALUES ('72', '8');
INSERT INTO `say_type` VALUES ('4', '9');
INSERT INTO `say_type` VALUES ('22', '9');

-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion` (
  `suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `suggestion_content` text NOT NULL,
  `suggestion_datatime` datetime DEFAULT NULL,
  PRIMARY KEY (`suggestion_id`),
  KEY `host_id` (`user_id`),
  CONSTRAINT `suggestion_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suggestion
-- ----------------------------
INSERT INTO `suggestion` VALUES ('1', '1', '反馈意见1', '2016-08-15 23:26:14');
INSERT INTO `suggestion` VALUES ('2', '1', '3反馈意见', '2016-08-16 23:26:35');
INSERT INTO `suggestion` VALUES ('3', '1', '4反馈意见', '2016-08-17 10:39:05');
INSERT INTO `suggestion` VALUES ('4', '1', '5反馈意见', '2016-08-17 10:39:18');
INSERT INTO `suggestion` VALUES ('5', '1', '6反馈意见', '2016-08-17 10:39:31');
INSERT INTO `suggestion` VALUES ('6', '1', '7反馈意见', '2016-08-17 10:39:45');
INSERT INTO `suggestion` VALUES ('7', '1', '8反馈意见', '2016-08-17 10:39:57');
INSERT INTO `suggestion` VALUES ('8', '2', '1反馈意见', '2016-08-17 10:40:24');
INSERT INTO `suggestion` VALUES ('9', '2', '3反馈意见', '2016-08-17 10:40:34');
INSERT INTO `suggestion` VALUES ('10', '3', '1反馈意见', '2016-08-17 10:40:48');
INSERT INTO `suggestion` VALUES ('11', '3', '2反馈意见', '2016-08-17 10:40:59');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '推广');
INSERT INTO `type` VALUES ('2', '知识');
INSERT INTO `type` VALUES ('3', '幽默');
INSERT INTO `type` VALUES ('4', '生活');
INSERT INTO `type` VALUES ('5', '感悟');
INSERT INTO `type` VALUES ('6', '游戏');
INSERT INTO `type` VALUES ('7', '旅游');
INSERT INTO `type` VALUES ('8', '风景');
INSERT INTO `type` VALUES ('9', '动漫');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(15) NOT NULL COMMENT '用户名',
  `user_password` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT '',
  `user_email` varchar(25) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '用户性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `emotion_state` int(11) DEFAULT NULL COMMENT '感情状态（0：单身  1：恋爱中 2已婚）',
  `now_place` varchar(30) DEFAULT NULL COMMENT '现居地',
  `hobby` varchar(30) DEFAULT NULL COMMENT '兴趣爱好',
  `head_icon` varchar(60) DEFAULT 'temp/head/head9.jpg' COMMENT '头像地址',
  `level` int(255) DEFAULT '0' COMMENT '用户等级',
  `vistors` int(11) DEFAULT '0',
  `email_eable` int(11) DEFAULT '0' COMMENT '邮箱是否被激活',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `catename` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '刘卜铷', '123456', '我要用所有美好的一切，换走迩伤心的泪', '1099501218@qq.com', '1', '1994-11-12', '1', '厦门', '编程、游戏', 'temp/head/head1.jpg', '12', '32', '1');
INSERT INTO `user` VALUES ('2', '徐佳乐', '123456', '我要用所有美好的一切，换走迩伤心的泪', '2914207499@qq.com', '1', '1993-10-13', '0', '厦门', '游泳', 'temp/head/head2.jpg', '8', '53', '1');
INSERT INTO `user` VALUES ('3', '李超', '123456', '我要用所有美好的一切，换走迩伤心的泪', '123456@qq.com', '1', '1995-01-03', '0', '南昌', '漫画', 'temp/head/head3.jpg', '6', '75', '1');
INSERT INTO `user` VALUES ('4', '刘全盛', '123456', '我要用所有美好的一切，换走迩伤心的泪', '123456@qq.com', '1', '1995-08-17', '0', '厦门', '游戏', 'temp/head/head4.jpg', '5', '7587', '1');
INSERT INTO `user` VALUES ('5', '彭世威', '123456', '我要用所有美好的一切，换走迩伤心的泪', '123456@qq.com', '1', '1995-09-30', '0', '南昌', 'NBA', 'temp/head/head5.jpg', '7', '587', '1');
INSERT INTO `user` VALUES ('6', '刘俊杰', '123456', '我要用所有美好的一切，换走迩伤心的泪', '123456@qq.com', '1', '1995-03-09', '0', '厦门', '游戏', 'temp/head/head6.jpg', '20', '757', '1');
INSERT INTO `user` VALUES ('7', '赵建熊', '123456', '我要用所有美好的一切，换走迩伤心的泪', '123456@qq.com', '1', '1994-12-11', '1', '南昌', '交友', 'temp/head/head7.jpg', '5', '247', '1');
INSERT INTO `user` VALUES ('8', '余宇', '123456', '我要用所有美好的一切，换走迩伤心的泪', '123456@qq.com', '1', '1993-12-10', '0', '厦门', '游戏', 'temp/head/head8.jpg', '10', '725', '1');
INSERT INTO `user` VALUES ('9', '郑景元', '123456', '我要用所有美好的一切，换走迩伤心的泪', '123456@qq.com', '1', '1985-07-11', '1', '南昌', '跑步', 'temp/head/head9.jpg', '40', '785', '1');
INSERT INTO `user` VALUES ('10', 'liuburu', '123456', '我要用所有美好的一切，换走迩伤心的泪', 'liuburu@qq.com', null, '2016-08-20', null, null, null, 'temp/head/head10.jpg', '0', '2472', '1');
INSERT INTO `user` VALUES ('17', 'yooai', '123456', '我要用所有美好的一切，换走迩伤心的泪', '1099501218@qq.com', '1', '2016-08-04', '1', '厦门', '编程', 'temp/head/head11.jpg', '42', '7425', '1');
INSERT INTO `user` VALUES ('18', 'pengshiwei', '123456', '我要用所有美好的一切，换走迩伤心的泪', '1099501218@qq.com', null, null, null, null, null, null, '0', '635', '1');
INSERT INTO `user` VALUES ('19', 'whose1', '1234560', '', '1099501218com', null, null, null, null, null, null, '0', '0', '0');
INSERT INTO `user` VALUES ('20', 'test', '123456', '', '1099501218@qq.com', null, null, null, null, null, null, '0', '0', '1');
INSERT INTO `user` VALUES ('21', 'iloveyou', '123456', '', '1099501218@qq.com', null, null, null, null, null, null, '0', '0', '1');
INSERT INTO `user` VALUES ('22', 'fork', '123456', '', '348566760@qq.com', null, '2016-08-25', null, null, null, 'new.user_id', '0', '0', '1');
INSERT INTO `user` VALUES ('23', '卡卡罗特', '123456', '', '1099501218@qq.com', null, null, null, null, null, null, '0', '0', '1');
INSERT INTO `user` VALUES ('24', '徐佳天成', '123456', '', '930241857@qq.com', null, null, null, null, null, null, '0', '0', '0');
INSERT INTO `user` VALUES ('25', 'peng', 'psw588', '', '1059861451@qq.com', null, null, null, null, null, null, '0', '0', '1');
INSERT INTO `user` VALUES ('27', 'yyyy', 'yyyyyy', '', '1059861451@qq.com', null, null, null, null, null, null, '0', '0', '0');
INSERT INTO `user` VALUES ('29', 'ppppp', 'pppppp', '', '1059861451@qq.com', null, null, null, null, null, null, '0', '0', '0');
INSERT INTO `user` VALUES ('31', '早博得小鸟', '123456', '', '1059861451@qq.com', null, null, null, null, null, null, '0', '0', '0');
INSERT INTO `user` VALUES ('32', 'agfagf', '123456', '', '1099501218@qq.com', null, null, null, null, null, null, '0', '0', '1');
INSERT INTO `user` VALUES ('33', '装逼如我', '123456', '', '1099501218@qq.com', null, null, null, null, null, 'temp/head/head9.jpg', '0', '0', '1');
INSERT INTO `user` VALUES ('34', 'kakaluote', '123456', '', '2914207499@qq.com', null, null, null, null, null, 'temp/head/head9.jpg', '0', '0', '1');
INSERT INTO `user` VALUES ('35', 'admin', '123456', '', '54188@qq.com', null, null, null, null, null, 'temp/head/head9.jpg', '0', '0', '0');
INSERT INTO `user` VALUES ('36', 'apple', '123456', '', '1099501218@qq.com', null, null, null, null, null, 'temp/head/head9.jpg', '0', '0', '0');
INSERT INTO `user` VALUES ('37', 'shiyan', '123456', '', '1099501218@qq.com', null, null, null, null, null, 'temp/head/head9.jpg', '0', '0', '1');
DROP TRIGGER IF EXISTS `tri_agreeInsert`;
DELIMITER ;;
CREATE TRIGGER `tri_agreeInsert` BEFORE INSERT ON `agree` FOR EACH ROW begin
declare userId int;
set userId = (select s.say_id from say s WHERE s.say_id = new.say_id);
update friend set honey = honey + 1 where user_id = userId AND friend_id= friend_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_agree_after_Insert`;
DELIMITER ;;
CREATE TRIGGER `tri_agree_after_Insert` AFTER INSERT ON `agree` FOR EACH ROW begin
update say set say_lovers = say_lovers + 1 WHERE say_id = new.say_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_agreeDelete`;
DELIMITER ;;
CREATE TRIGGER `tri_agreeDelete` BEFORE DELETE ON `agree` FOR EACH ROW begin
declare userId int;
set userId = (select s.say_id from say s WHERE s.say_id = old.say_id);
update friend set honey = honey - 1 where user_id = userId AND friend_id= friend_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_agree_delete_after_Insert`;
DELIMITER ;;
CREATE TRIGGER `tri_agree_delete_after_Insert` AFTER DELETE ON `agree` FOR EACH ROW begin
update say set say_lovers = say_lovers -1 WHERE say_id = old.say_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_collection_insert`;
DELIMITER ;;
CREATE TRIGGER `tri_collection_insert` AFTER INSERT ON `collection` FOR EACH ROW begin
declare userId int;
declare collectorId int;
set userId = (SELECT s.user_id FROM say s WHERE s.say_id = new.say_id);
set collectorId = new.collector_id;
update friend set honey = honey + 1 where user_id = userId AND friend_id= collectorId;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_comment_insert`;
DELIMITER ;;
CREATE TRIGGER `tri_comment_insert` AFTER INSERT ON `comment` FOR EACH ROW begin
declare commenterId int;
declare commenteredId int;
set commenterId = new.commenter_id;
set commenteredId = new.commentered_id;
update friend set honey = honey +1 where user_id = commenteredId AND friend_id= commenterId;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_leavemsg_insert`;
DELIMITER ;;
CREATE TRIGGER `tri_leavemsg_insert` AFTER INSERT ON `leavemsg` FOR EACH ROW begin
declare hostId int;
declare touristId int;
set hostId = new.host_id;
set touristId = new.tourist_id;
update friend set honey = honey + 3 where user_id = hostId AND friend_id= touristId;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_user_insert`;
DELIMITER ;;
CREATE TRIGGER `tri_user_insert` AFTER INSERT ON `user` FOR EACH ROW begin
INSERT INTO friend(user_id,friend_id) VALUES(new.user_id,new.user_id);
end
;;
DELIMITER ;
