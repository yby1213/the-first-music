/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : music

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-08-25 10:44:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for music_collect
-- ----------------------------
DROP TABLE IF EXISTS `music_collect`;
CREATE TABLE `music_collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏表id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `sheet_id` bigint(20) DEFAULT NULL COMMENT '歌单id',
  PRIMARY KEY (`id`),
  KEY `music_userid_user` (`user_id`),
  KEY `music_sheetid_sheet` (`sheet_id`),
  CONSTRAINT `music_sheetid_sheet` FOREIGN KEY (`sheet_id`) REFERENCES `music_sheet` (`id`),
  CONSTRAINT `music_userid_user` FOREIGN KEY (`user_id`) REFERENCES `music_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_collect
-- ----------------------------
INSERT INTO `music_collect` VALUES ('1', '1', null);
INSERT INTO `music_collect` VALUES ('29', '30', '49');
INSERT INTO `music_collect` VALUES ('30', '31', '50');
INSERT INTO `music_collect` VALUES ('31', '32', '51');
INSERT INTO `music_collect` VALUES ('32', '33', '52');
INSERT INTO `music_collect` VALUES ('33', '34', '53');
INSERT INTO `music_collect` VALUES ('34', '35', '54');
INSERT INTO `music_collect` VALUES ('35', '36', '55');
INSERT INTO `music_collect` VALUES ('36', '37', '56');
INSERT INTO `music_collect` VALUES ('37', '38', '57');
INSERT INTO `music_collect` VALUES ('41', '42', '61');
INSERT INTO `music_collect` VALUES ('42', '43', '62');
INSERT INTO `music_collect` VALUES ('43', '44', '63');
INSERT INTO `music_collect` VALUES ('61', '47', '88');
INSERT INTO `music_collect` VALUES ('62', '47', null);
INSERT INTO `music_collect` VALUES ('63', '47', '64');
INSERT INTO `music_collect` VALUES ('64', '47', '65');
INSERT INTO `music_collect` VALUES ('65', '47', '66');
INSERT INTO `music_collect` VALUES ('66', '47', '67');

-- ----------------------------
-- Table structure for music_comment
-- ----------------------------
DROP TABLE IF EXISTS `music_comment`;
CREATE TABLE `music_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论表id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `songs_id` bigint(20) DEFAULT NULL COMMENT '歌曲id',
  `songs_comment` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `comment_up` bigint(20) DEFAULT NULL COMMENT '评论点赞量',
  PRIMARY KEY (`id`),
  KEY `music_userId_comment` (`user_id`),
  KEY `music_songId_song` (`songs_id`),
  CONSTRAINT `music_songId_song` FOREIGN KEY (`songs_id`) REFERENCES `music_songs` (`id`),
  CONSTRAINT `music_userId_comment` FOREIGN KEY (`user_id`) REFERENCES `music_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_comment
-- ----------------------------

-- ----------------------------
-- Table structure for music_list
-- ----------------------------
DROP TABLE IF EXISTS `music_list`;
CREATE TABLE `music_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `list_id` bigint(20) DEFAULT NULL COMMENT '歌单曲表id',
  `song_id` bigint(20) DEFAULT NULL COMMENT '歌曲id',
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`),
  KEY `music_songid_songs` (`song_id`),
  CONSTRAINT `music_songid_songs` FOREIGN KEY (`song_id`) REFERENCES `music_songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_list
-- ----------------------------
INSERT INTO `music_list` VALUES ('80', '30', null);
INSERT INTO `music_list` VALUES ('81', '31', null);
INSERT INTO `music_list` VALUES ('82', '32', null);
INSERT INTO `music_list` VALUES ('83', '33', null);
INSERT INTO `music_list` VALUES ('84', '34', null);
INSERT INTO `music_list` VALUES ('85', '35', null);
INSERT INTO `music_list` VALUES ('86', '36', null);
INSERT INTO `music_list` VALUES ('87', '37', null);
INSERT INTO `music_list` VALUES ('88', '38', null);
INSERT INTO `music_list` VALUES ('92', '42', null);
INSERT INTO `music_list` VALUES ('93', '43', null);
INSERT INTO `music_list` VALUES ('94', '44', null);
INSERT INTO `music_list` VALUES ('95', '378253116', null);
INSERT INTO `music_list` VALUES ('96', '378253116', '34');
INSERT INTO `music_list` VALUES ('97', '378253116', '33');
INSERT INTO `music_list` VALUES ('98', '378253116', '32');
INSERT INTO `music_list` VALUES ('99', '378253116', '31');
INSERT INTO `music_list` VALUES ('100', '378253116', '30');
INSERT INTO `music_list` VALUES ('101', '378253116', null);
INSERT INTO `music_list` VALUES ('102', '124812768', null);
INSERT INTO `music_list` VALUES ('103', '124812768', '38');
INSERT INTO `music_list` VALUES ('104', '124812768', '37');
INSERT INTO `music_list` VALUES ('105', '124812768', '36');
INSERT INTO `music_list` VALUES ('106', '124812768', '35');
INSERT INTO `music_list` VALUES ('107', '536732322', null);
INSERT INTO `music_list` VALUES ('108', '536732322', '44');
INSERT INTO `music_list` VALUES ('109', '536732322', '43');
INSERT INTO `music_list` VALUES ('110', '536732322', '42');
INSERT INTO `music_list` VALUES ('111', '536732322', '41');
INSERT INTO `music_list` VALUES ('112', '536732322', '40');
INSERT INTO `music_list` VALUES ('113', '536732322', '39');
INSERT INTO `music_list` VALUES ('114', '518100954', null);
INSERT INTO `music_list` VALUES ('115', '518100954', '48');
INSERT INTO `music_list` VALUES ('116', '518100954', '47');
INSERT INTO `music_list` VALUES ('117', '518100954', '46');
INSERT INTO `music_list` VALUES ('118', '518100954', null);
INSERT INTO `music_list` VALUES ('119', '980297835', null);
INSERT INTO `music_list` VALUES ('120', '980297835', '49');
INSERT INTO `music_list` VALUES ('121', '347176346', null);
INSERT INTO `music_list` VALUES ('122', '347176346', '53');
INSERT INTO `music_list` VALUES ('123', '347176346', '52');
INSERT INTO `music_list` VALUES ('124', '347176346', '51');
INSERT INTO `music_list` VALUES ('125', '347176346', '50');
INSERT INTO `music_list` VALUES ('126', '794978256', null);
INSERT INTO `music_list` VALUES ('127', '794978256', '57');
INSERT INTO `music_list` VALUES ('128', '794978256', '56');
INSERT INTO `music_list` VALUES ('129', '794978256', '55');
INSERT INTO `music_list` VALUES ('130', '794978256', '54');
INSERT INTO `music_list` VALUES ('131', '933352273', null);
INSERT INTO `music_list` VALUES ('132', '933352273', '60');
INSERT INTO `music_list` VALUES ('133', '933352273', '59');
INSERT INTO `music_list` VALUES ('134', '933352273', '58');
INSERT INTO `music_list` VALUES ('135', '281816627', null);
INSERT INTO `music_list` VALUES ('136', '281816627', '65');
INSERT INTO `music_list` VALUES ('137', '281816627', '64');
INSERT INTO `music_list` VALUES ('138', '281816627', '63');
INSERT INTO `music_list` VALUES ('139', '281816627', '62');
INSERT INTO `music_list` VALUES ('140', '281816627', '61');
INSERT INTO `music_list` VALUES ('141', '609016348', null);
INSERT INTO `music_list` VALUES ('142', '199621891', null);
INSERT INTO `music_list` VALUES ('143', '199621891', '71');
INSERT INTO `music_list` VALUES ('144', '199621891', '70');
INSERT INTO `music_list` VALUES ('145', '199621891', '69');
INSERT INTO `music_list` VALUES ('146', '199621891', '68');
INSERT INTO `music_list` VALUES ('147', '171050441', null);
INSERT INTO `music_list` VALUES ('148', '171050441', '76');
INSERT INTO `music_list` VALUES ('149', '171050441', '75');
INSERT INTO `music_list` VALUES ('150', '171050441', '74');
INSERT INTO `music_list` VALUES ('151', '171050441', '73');
INSERT INTO `music_list` VALUES ('152', '171050441', '72');
INSERT INTO `music_list` VALUES ('153', '256376562', null);
INSERT INTO `music_list` VALUES ('154', '256376562', '78');
INSERT INTO `music_list` VALUES ('155', '256376562', '77');
INSERT INTO `music_list` VALUES ('156', '256376562', '69');
INSERT INTO `music_list` VALUES ('157', '256376562', '65');
INSERT INTO `music_list` VALUES ('158', '256376562', '64');
INSERT INTO `music_list` VALUES ('159', '256376562', '63');
INSERT INTO `music_list` VALUES ('160', '256376562', '62');
INSERT INTO `music_list` VALUES ('161', '256376562', '57');
INSERT INTO `music_list` VALUES ('162', '256376562', '52');
INSERT INTO `music_list` VALUES ('163', '768721519', null);
INSERT INTO `music_list` VALUES ('164', '768721519', '79');
INSERT INTO `music_list` VALUES ('165', '492259100', null);
INSERT INTO `music_list` VALUES ('166', '492259100', '78');
INSERT INTO `music_list` VALUES ('167', '492259100', '70');
INSERT INTO `music_list` VALUES ('168', '492259100', '52');
INSERT INTO `music_list` VALUES ('169', '492259100', '40');
INSERT INTO `music_list` VALUES ('170', '492259100', '39');
INSERT INTO `music_list` VALUES ('171', '492259100', '29');
INSERT INTO `music_list` VALUES ('172', '663151281', null);
INSERT INTO `music_list` VALUES ('173', '663151281', '29');
INSERT INTO `music_list` VALUES ('174', '663151281', '68');
INSERT INTO `music_list` VALUES ('175', '663151281', '62');
INSERT INTO `music_list` VALUES ('176', '663151281', '50');
INSERT INTO `music_list` VALUES ('177', '663151281', '38');
INSERT INTO `music_list` VALUES ('178', '663151281', '35');
INSERT INTO `music_list` VALUES ('179', '663151281', '33');
INSERT INTO `music_list` VALUES ('180', '838969133', null);
INSERT INTO `music_list` VALUES ('181', '838969133', '73');
INSERT INTO `music_list` VALUES ('182', '838969133', '70');
INSERT INTO `music_list` VALUES ('183', '838969133', '65');
INSERT INTO `music_list` VALUES ('184', '838969133', '64');
INSERT INTO `music_list` VALUES ('185', '838969133', '63');
INSERT INTO `music_list` VALUES ('186', '838969133', '62');
INSERT INTO `music_list` VALUES ('187', '838969133', '61');
INSERT INTO `music_list` VALUES ('188', '838969133', '52');
INSERT INTO `music_list` VALUES ('189', '838969133', '34');
INSERT INTO `music_list` VALUES ('190', '850407994', null);
INSERT INTO `music_list` VALUES ('191', '850407994', '79');
INSERT INTO `music_list` VALUES ('192', '850407994', '78');
INSERT INTO `music_list` VALUES ('193', '850407994', '77');
INSERT INTO `music_list` VALUES ('194', '850407994', '76');
INSERT INTO `music_list` VALUES ('195', '850407994', '75');
INSERT INTO `music_list` VALUES ('196', '850407994', '74');
INSERT INTO `music_list` VALUES ('197', '850407994', '73');
INSERT INTO `music_list` VALUES ('198', '850407994', '72');
INSERT INTO `music_list` VALUES ('199', '850407994', '71');
INSERT INTO `music_list` VALUES ('200', '850407994', '70');
INSERT INTO `music_list` VALUES ('201', '850407994', '69');
INSERT INTO `music_list` VALUES ('202', '850407994', '68');
INSERT INTO `music_list` VALUES ('203', '850407994', '67');
INSERT INTO `music_list` VALUES ('204', '850407994', '66');
INSERT INTO `music_list` VALUES ('205', '850407994', '65');
INSERT INTO `music_list` VALUES ('206', '850407994', '64');
INSERT INTO `music_list` VALUES ('207', '850407994', '63');
INSERT INTO `music_list` VALUES ('208', '850407994', '62');
INSERT INTO `music_list` VALUES ('209', '850407994', '61');
INSERT INTO `music_list` VALUES ('210', '850407994', '60');
INSERT INTO `music_list` VALUES ('211', '850407994', '59');
INSERT INTO `music_list` VALUES ('212', '850407994', '58');
INSERT INTO `music_list` VALUES ('213', '850407994', '57');
INSERT INTO `music_list` VALUES ('214', '850407994', '56');
INSERT INTO `music_list` VALUES ('215', '850407994', '55');
INSERT INTO `music_list` VALUES ('216', '850407994', '54');
INSERT INTO `music_list` VALUES ('217', '850407994', '53');
INSERT INTO `music_list` VALUES ('218', '850407994', '52');
INSERT INTO `music_list` VALUES ('219', '850407994', '51');
INSERT INTO `music_list` VALUES ('220', '850407994', '50');
INSERT INTO `music_list` VALUES ('221', '850407994', '49');
INSERT INTO `music_list` VALUES ('222', '850407994', '48');
INSERT INTO `music_list` VALUES ('223', '850407994', '47');
INSERT INTO `music_list` VALUES ('224', '850407994', '46');
INSERT INTO `music_list` VALUES ('225', '850407994', '45');
INSERT INTO `music_list` VALUES ('226', '850407994', '44');
INSERT INTO `music_list` VALUES ('227', '850407994', '43');
INSERT INTO `music_list` VALUES ('228', '850407994', '42');
INSERT INTO `music_list` VALUES ('229', '850407994', '41');
INSERT INTO `music_list` VALUES ('230', '850407994', '40');
INSERT INTO `music_list` VALUES ('231', '850407994', '39');
INSERT INTO `music_list` VALUES ('232', '850407994', '38');
INSERT INTO `music_list` VALUES ('233', '850407994', '37');
INSERT INTO `music_list` VALUES ('234', '850407994', '36');
INSERT INTO `music_list` VALUES ('235', '850407994', '35');
INSERT INTO `music_list` VALUES ('236', '850407994', '34');
INSERT INTO `music_list` VALUES ('237', '850407994', '33');
INSERT INTO `music_list` VALUES ('238', '850407994', '32');
INSERT INTO `music_list` VALUES ('239', '850407994', '31');
INSERT INTO `music_list` VALUES ('240', '850407994', '30');
INSERT INTO `music_list` VALUES ('241', '850407994', '29');
INSERT INTO `music_list` VALUES ('242', '672035114', null);
INSERT INTO `music_list` VALUES ('243', '672035114', '79');
INSERT INTO `music_list` VALUES ('244', '672035114', '78');
INSERT INTO `music_list` VALUES ('245', '672035114', '77');
INSERT INTO `music_list` VALUES ('246', '672035114', '76');
INSERT INTO `music_list` VALUES ('247', '672035114', '75');
INSERT INTO `music_list` VALUES ('248', '672035114', '74');
INSERT INTO `music_list` VALUES ('249', '672035114', '73');
INSERT INTO `music_list` VALUES ('250', '672035114', '72');
INSERT INTO `music_list` VALUES ('251', '672035114', '71');
INSERT INTO `music_list` VALUES ('252', '672035114', '70');
INSERT INTO `music_list` VALUES ('253', '672035114', '69');
INSERT INTO `music_list` VALUES ('254', '672035114', '68');
INSERT INTO `music_list` VALUES ('255', '672035114', '67');
INSERT INTO `music_list` VALUES ('256', '672035114', '66');
INSERT INTO `music_list` VALUES ('257', '672035114', '65');
INSERT INTO `music_list` VALUES ('258', '672035114', '64');
INSERT INTO `music_list` VALUES ('259', '672035114', '63');
INSERT INTO `music_list` VALUES ('260', '672035114', '62');
INSERT INTO `music_list` VALUES ('261', '672035114', '61');
INSERT INTO `music_list` VALUES ('262', '672035114', '60');
INSERT INTO `music_list` VALUES ('263', '672035114', '59');
INSERT INTO `music_list` VALUES ('264', '672035114', '58');
INSERT INTO `music_list` VALUES ('265', '672035114', '57');
INSERT INTO `music_list` VALUES ('266', '672035114', '56');
INSERT INTO `music_list` VALUES ('267', '672035114', '55');
INSERT INTO `music_list` VALUES ('268', '672035114', '54');
INSERT INTO `music_list` VALUES ('269', '672035114', '53');
INSERT INTO `music_list` VALUES ('270', '672035114', '52');
INSERT INTO `music_list` VALUES ('271', '672035114', '51');
INSERT INTO `music_list` VALUES ('272', '672035114', '50');
INSERT INTO `music_list` VALUES ('273', '672035114', '49');
INSERT INTO `music_list` VALUES ('274', '672035114', '48');
INSERT INTO `music_list` VALUES ('275', '672035114', '47');
INSERT INTO `music_list` VALUES ('276', '672035114', '46');
INSERT INTO `music_list` VALUES ('277', '672035114', '45');
INSERT INTO `music_list` VALUES ('278', '672035114', '44');
INSERT INTO `music_list` VALUES ('279', '672035114', '43');
INSERT INTO `music_list` VALUES ('280', '672035114', '42');
INSERT INTO `music_list` VALUES ('281', '672035114', '41');
INSERT INTO `music_list` VALUES ('282', '672035114', '40');
INSERT INTO `music_list` VALUES ('283', '672035114', '39');
INSERT INTO `music_list` VALUES ('284', '672035114', '38');
INSERT INTO `music_list` VALUES ('285', '672035114', '37');
INSERT INTO `music_list` VALUES ('286', '672035114', '36');
INSERT INTO `music_list` VALUES ('287', '672035114', '35');
INSERT INTO `music_list` VALUES ('288', '672035114', '34');
INSERT INTO `music_list` VALUES ('289', '672035114', '33');
INSERT INTO `music_list` VALUES ('290', '672035114', '32');
INSERT INTO `music_list` VALUES ('291', '672035114', '31');
INSERT INTO `music_list` VALUES ('292', '672035114', '30');
INSERT INTO `music_list` VALUES ('293', '672035114', '29');
INSERT INTO `music_list` VALUES ('294', '378253116', null);
INSERT INTO `music_list` VALUES ('295', '378253116', '30');
INSERT INTO `music_list` VALUES ('296', '124812768', null);
INSERT INTO `music_list` VALUES ('297', '124812768', '31');
INSERT INTO `music_list` VALUES ('298', '124812768', '32');
INSERT INTO `music_list` VALUES ('313', '384289773', null);
INSERT INTO `music_list` VALUES ('314', '384289773', '29');
INSERT INTO `music_list` VALUES ('315', '384289773', '30');
INSERT INTO `music_list` VALUES ('316', '384289773', '31');
INSERT INTO `music_list` VALUES ('317', '384289773', '32');
INSERT INTO `music_list` VALUES ('318', '384289773', '33');
INSERT INTO `music_list` VALUES ('319', '384289773', '34');
INSERT INTO `music_list` VALUES ('320', '384289773', '35');
INSERT INTO `music_list` VALUES ('321', '384289773', '36');
INSERT INTO `music_list` VALUES ('322', '384289773', '37');
INSERT INTO `music_list` VALUES ('323', '384289773', '38');
INSERT INTO `music_list` VALUES ('335', '564852617', null);
INSERT INTO `music_list` VALUES ('336', '564852617', null);
INSERT INTO `music_list` VALUES ('337', '564852617', null);
INSERT INTO `music_list` VALUES ('347', '106446080', null);
INSERT INTO `music_list` VALUES ('348', '106446080', null);
INSERT INTO `music_list` VALUES ('349', '106446080', null);
INSERT INTO `music_list` VALUES ('355', '47', null);
INSERT INTO `music_list` VALUES ('356', '127764897', null);
INSERT INTO `music_list` VALUES ('357', '127764897', null);
INSERT INTO `music_list` VALUES ('358', '127764897', null);
INSERT INTO `music_list` VALUES ('359', '47', '34');

-- ----------------------------
-- Table structure for music_pay
-- ----------------------------
DROP TABLE IF EXISTS `music_pay`;
CREATE TABLE `music_pay` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `out_trade_no` int(20) NOT NULL,
  `total_amount` double(20,0) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `seller_id` varchar(50) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `order_save` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_pay
-- ----------------------------
INSERT INTO `music_pay` VALUES ('34', '343487206', '8', '2020-08-23 22:48:41', '2020-08-23 22:49:41', '2088621955030744', '29', '1');
INSERT INTO `music_pay` VALUES ('35', '274404654', null, null, null, null, '29', '0');
INSERT INTO `music_pay` VALUES ('36', '393467621', '88', '2020-08-24 01:31:25', '2020-08-24 01:34:25', '2088621955030744', '29', '1');
INSERT INTO `music_pay` VALUES ('37', '962530957', '96', '2020-08-24 08:45:15', '2020-08-24 08:46:15', '2088621955030744', '46', '1');

-- ----------------------------
-- Table structure for music_sheet
-- ----------------------------
DROP TABLE IF EXISTS `music_sheet`;
CREATE TABLE `music_sheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌单表id',
  `sheet_name` varchar(255) DEFAULT NULL COMMENT '歌单名字',
  `sheet_pic` varchar(255) DEFAULT NULL COMMENT '歌单名字',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `sheet_collect` bigint(20) DEFAULT NULL COMMENT '歌单收藏量',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `list_id` bigint(20) DEFAULT NULL COMMENT '歌单曲表id',
  PRIMARY KEY (`id`),
  KEY `music_sheet_userid` (`user_id`),
  KEY `music_sheet_listid` (`list_id`),
  CONSTRAINT `music_sheet_listid` FOREIGN KEY (`list_id`) REFERENCES `music_list` (`list_id`),
  CONSTRAINT `music_sheet_userid` FOREIGN KEY (`user_id`) REFERENCES `music_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_sheet
-- ----------------------------
INSERT INTO `music_sheet` VALUES ('49', '胖大海', '../../..\\uploadFile\\img\\5069883d.jpg', '2020-08-19 23:21:52', '6', '30', '30');
INSERT INTO `music_sheet` VALUES ('50', '有鱼丸', '../../..\\uploadFile\\img\\64876ecb.jpg', '2020-08-19 23:22:16', '12', '31', '31');
INSERT INTO `music_sheet` VALUES ('51', '萝卜蹲', '../../..\\uploadFile\\img\\35118ab6.jpg', '2020-08-19 23:22:35', '20', '32', '32');
INSERT INTO `music_sheet` VALUES ('52', 'new bee', '../../..\\uploadFile\\img\\b736e05d.jpg', '2020-08-19 23:22:53', '30', '33', '33');
INSERT INTO `music_sheet` VALUES ('53', '怪力少女', '../../..\\uploadFile\\img\\1bf9da79.jpg', '2020-08-19 23:23:17', '42', '34', '34');
INSERT INTO `music_sheet` VALUES ('54', '铁锤妹妹', '../../..\\uploadFile\\img\\6c7b9704.jpg', '2020-08-19 23:23:47', '56', '35', '35');
INSERT INTO `music_sheet` VALUES ('55', '萌面大虾', '../../..\\uploadFile\\img\\d9d3e1c3.jpg', '2020-08-19 23:24:05', '72', '36', '36');
INSERT INTO `music_sheet` VALUES ('56', '静如疯狗', '../../..\\uploadFile\\img\\17f4ac4d.jpg', '2020-08-19 23:24:27', '90', '37', '37');
INSERT INTO `music_sheet` VALUES ('57', '撩汉大婶', '../../..\\uploadFile\\img\\3c9563e7.jpg', '2020-08-19 23:25:17', '110', '38', '38');
INSERT INTO `music_sheet` VALUES ('61', '童靖军', '../../..\\uploadFile\\img\\e14bd823.jpg', '2020-08-19 23:29:40', '210', '42', '42');
INSERT INTO `music_sheet` VALUES ('62', '杨邦瑶', '../../..\\uploadFile\\img\\51a5804b.jpg', '2020-08-19 23:30:19', '240', '43', '43');
INSERT INTO `music_sheet` VALUES ('63', '赵佳', '../../..\\uploadFile\\img\\4c7d3a3d.jpg', '2020-08-19 23:32:20', '272', '44', '44');
INSERT INTO `music_sheet` VALUES ('64', '【VIP专享】一周新歌推荐', '../../..\\uploadFile\\img\\19258d41.jpg', '2020-08-19 23:38:16', '0', '1', '378253116');
INSERT INTO `music_sheet` VALUES ('65', '【爱的更久点】 两个人的浪漫 单身不要听', '../../..\\uploadFile\\img\\6e6b008b.jpg', '2020-08-19 23:40:34', '0', '1', '124812768');
INSERT INTO `music_sheet` VALUES ('66', '【宝藏男孩】值得你循环播放的男声', '../../..\\uploadFile\\img\\1a3c67b4.jpg', '2020-08-19 23:44:27', '0', '1', '536732322');
INSERT INTO `music_sheet` VALUES ('67', '【宝藏系女孩】值得你红心收藏的女声', '../../..\\uploadFile\\img\\9579896c.jpg', '2020-08-19 23:47:00', '0', '1', '518100954');
INSERT INTO `music_sheet` VALUES ('68', '【日系私人订制】最懂你的日系推荐', '../../..\\uploadFile\\img\\65122845.jpg', '2020-08-19 23:48:34', '0', '1', '980297835');
INSERT INTO `music_sheet` VALUES ('69', '【一周热歌】温柔嗓音哄你入睡', '../../..\\uploadFile\\img\\925cf027.jpg', '2020-08-19 23:51:36', '0', '1', '347176346');
INSERT INTO `music_sheet` VALUES ('70', '古风 l  恍惚间  谁拿了浮生 换了流年', '../../..\\uploadFile\\img\\29f4048.jpg', '2020-08-19 23:54:38', '0', '1', '794978256');
INSERT INTO `music_sheet` VALUES ('71', '减肥!跑步歌单(中文)', '../../..\\uploadFile\\img\\d8fdb6b1.jpg', '2020-08-19 23:56:54', '0', '1', '933352273');
INSERT INTO `music_sheet` VALUES ('72', '民谣l故事还很长 就别再失望', '../../..\\uploadFile\\img\\494cf8b4.jpg', '2020-08-20 00:00:06', '0', '1', '281816627');
INSERT INTO `music_sheet` VALUES ('73', '欧美l我们听过的那首歌,原来采样了它', '../../..\\uploadFile\\img\\366597de.jpg', '2020-08-20 00:02:16', '0', '1', '609016348');
INSERT INTO `music_sheet` VALUES ('74', '山河浪漫集l你是我藏在微风中的欢喜', '../../..\\uploadFile\\img\\93cb9dab.jpg', '2020-08-20 00:04:31', '0', '1', '199621891');
INSERT INTO `music_sheet` VALUES ('75', '听你爱的收敛 l 华语私人雷达', '../../..\\uploadFile\\img\\ea275afc.jpg', '2020-08-20 00:08:09', '0', '1', '171050441');
INSERT INTO `music_sheet` VALUES ('76', '一个双子座的民谣列表', '../../..\\uploadFile\\img\\cee402a4.jpg', '2020-08-20 00:09:46', '0', '1', '256376562');
INSERT INTO `music_sheet` VALUES ('77', '粤语女声l永远心仪', '../../..\\uploadFile\\img\\25287334.jpg', '2020-08-20 00:12:48', '0', '1', '768721519');
INSERT INTO `music_sheet` VALUES ('78', '如果你也喜欢【徐秉龙】', '../../..\\uploadFile\\img\\b26086f2.jpg', '2020-08-20 00:22:07', '0', '1', '492259100');
INSERT INTO `music_sheet` VALUES ('79', '每天的晚安，你收到了嘛', '../../..\\uploadFile\\img\\b2e43eff.jpg', '2020-08-20 00:26:13', '0', '1', '663151281');
INSERT INTO `music_sheet` VALUES ('80', '暖冬木吉他 用歌声温暖你的旅程', '../../..\\uploadFile\\img\\3f56e9f9.jpg', '2020-08-20 00:30:51', '0', '1', '838969133');
INSERT INTO `music_sheet` VALUES ('81', '【民谣】安静的听歌ღ安静的想你', '../../..\\uploadFile\\img\\a1ed60a1.jpg', '2020-08-20 00:36:29', '0', '1', '850407994');
INSERT INTO `music_sheet` VALUES ('82', '【官方推荐】全部歌曲', '../../..\\uploadFile\\img\\5bae60d6.jpg', '2020-08-20 00:40:03', '0', '1', '672035114');
INSERT INTO `music_sheet` VALUES ('88', '朱哥帅', '../../../uploadFile/img/39af94b0.jpg', '2020-08-24 08:52:08', '3776', '47', '47');

-- ----------------------------
-- Table structure for music_songs
-- ----------------------------
DROP TABLE IF EXISTS `music_songs`;
CREATE TABLE `music_songs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌曲表id',
  `song_singer` varchar(255) DEFAULT NULL COMMENT '歌曲歌手名字',
  `song_name` varchar(255) DEFAULT NULL COMMENT '歌曲歌名',
  `song_role` bigint(20) DEFAULT NULL COMMENT '歌的角色（0（普通）、1（会员））',
  `song_url` varchar(255) DEFAULT NULL COMMENT '歌曲地址',
  `song_pic` varchar(255) DEFAULT NULL COMMENT '歌曲图片连接',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `song_collect` varchar(255) DEFAULT NULL COMMENT '歌曲收藏量',
  `commentId` bigint(20) DEFAULT NULL COMMENT '评论表Id',
  PRIMARY KEY (`id`),
  KEY `music_songs_comment` (`commentId`),
  CONSTRAINT `music_songs_comment` FOREIGN KEY (`commentId`) REFERENCES `music_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_songs
-- ----------------------------
INSERT INTO `music_songs` VALUES ('29', '徐秉龙', '白羊', '1', '../../..\\uploadFile\\mp3\\2936ec1c.mp3', '../../..\\uploadFile\\img\\376fdd93.jpg', '2020-08-19 23:34:30', '0', null);
INSERT INTO `music_songs` VALUES ('30', '徐良', '飞机场', '1', '../../..\\uploadFile\\mp3\\b071ab58.mp3', '../../..\\uploadFile\\img\\d10507e8.jpg', '2020-08-19 23:34:55', '0', null);
INSERT INTO `music_songs` VALUES ('31', '张叶磊', '还是分开', '1', '../../..\\uploadFile\\mp3\\a77d4a67.mp3', '../../..\\uploadFile\\img\\46a1fac2.jpg', '2020-08-19 23:35:39', '0', null);
INSERT INTO `music_songs` VALUES ('32', '汪苏泷', '后会无期', '1', '../../..\\uploadFile\\mp3\\ed6213c8.mp3', '../../..\\uploadFile\\img\\fe7ac803.jpg', '2020-08-19 23:36:04', '0', null);
INSERT INTO `music_songs` VALUES ('33', '陈秋寒', '青梅竹马', '1', '../../..\\uploadFile\\mp3\\107f88b6.mp3', '../../..\\uploadFile\\img\\453044f7.jpg', '2020-08-19 23:36:37', '0', null);
INSERT INTO `music_songs` VALUES ('34', '张希', '认真的老去', '1', '../../..\\uploadFile\\mp3\\95968ab6.mp3', '../../..\\uploadFile\\img\\a35239bc.jpg', '2020-08-19 23:37:04', '0', null);
INSERT INTO `music_songs` VALUES ('35', '杨竹', '北极星的天空', '0', '../../..\\uploadFile\\mp3\\4e996f4b.mp3', '../../..\\uploadFile\\img\\7be70698.jpg', '2020-08-19 23:39:28', '0', null);
INSERT INTO `music_songs` VALUES ('36', '徐良', '创作者', '0', '../../..\\uploadFile\\mp3\\1de37b0a.mp3', '../../..\\uploadFile\\img\\c8c6ac25.jpg', '2020-08-19 23:39:43', '0', null);
INSERT INTO `music_songs` VALUES ('37', '徐良', '七秒钟的记忆', '0', '../../..\\uploadFile\\mp3\\977c1029.mp3', '../../..\\uploadFile\\img\\e8327bff.jpg', '2020-08-19 23:39:59', '0', null);
INSERT INTO `music_songs` VALUES ('38', '汪苏泷', '为你写诗', '0', '../../..\\uploadFile\\mp3\\1fd1e47.mp3', '../../..\\uploadFile\\img\\2e1aa55c.jpg', '2020-08-19 23:40:15', '0', null);
INSERT INTO `music_songs` VALUES ('39', '徐秉龙', '笨蛋', '0', '../../..\\uploadFile\\mp3\\b00b16d4.mp3', '../../..\\uploadFile\\img\\bf0aa520.jpg', '2020-08-19 23:41:35', '0', null);
INSERT INTO `music_songs` VALUES ('40', '徐秉龙', '不二臣', '0', '../../..\\uploadFile\\mp3\\60ba8d03.mp3', '../../..\\uploadFile\\img\\3da0936f.jpg', '2020-08-19 23:41:48', '0', null);
INSERT INTO `music_songs` VALUES ('41', '藤少', '那就这样吧', '0', '../../..\\uploadFile\\mp3\\6f355.mp3', '../../..\\uploadFile\\img\\6672c254.jpg', '2020-08-19 23:42:13', '0', null);
INSERT INTO `music_songs` VALUES ('42', '徐海俏', '南下', '0', '../../..\\uploadFile\\mp3\\ede552a5.mp3', '../../..\\uploadFile\\img\\5fe52342.jpg', '2020-08-19 23:42:45', '0', null);
INSERT INTO `music_songs` VALUES ('43', '烟把儿', '为你梳妆', '0', '../../..\\uploadFile\\mp3\\ea9641ca.mp3', '../../..\\uploadFile\\img\\2d111861.jpg', '2020-08-19 23:43:02', '0', null);
INSERT INTO `music_songs` VALUES ('44', '蒋铭杨', '一口气写完的歌', '0', '../../..\\uploadFile\\mp3\\640ab3b3.mp3', '../../..\\uploadFile\\img\\a6a86e3e.jpg', '2020-08-19 23:44:02', '0', null);
INSERT INTO `music_songs` VALUES ('45', '小嘉玲', '北木南', '0', '../../..\\uploadFile\\mp3\\8caea237.mp3', '../../..\\uploadFile\\img\\877cebaf.jpg', '2020-08-19 23:45:28', '0', null);
INSERT INTO `music_songs` VALUES ('46', '徐梦圆', '藏', '0', '../../..\\uploadFile\\mp3\\8cc35f91.mp3', '../../..\\uploadFile\\img\\67c92bd0.jpg', '2020-08-19 23:45:45', '0', null);
INSERT INTO `music_songs` VALUES ('47', '沈以诚', '失眠飞行', '0', '../../..\\uploadFile\\mp3\\77c6abd1.mp3', '../../..\\uploadFile\\img\\63161186.jpg', '2020-08-19 23:46:18', '0', null);
INSERT INTO `music_songs` VALUES ('48', '野小马', '失忆', '0', '../../..\\uploadFile\\mp3\\78d59064.mp3', '../../..\\uploadFile\\img\\5b8e2ee6.jpg', '2020-08-19 23:46:36', '0', null);
INSERT INTO `music_songs` VALUES ('49', ' 多多poi', 'Lemon', '0', '../../..\\uploadFile\\mp3\\2dbdbea8.mp3', '../../..\\uploadFile\\img\\42352947.jpg', '2020-08-19 23:48:20', '0', null);
INSERT INTO `music_songs` VALUES ('50', '一支榴莲', '懂', '0', '../../..\\uploadFile\\mp3\\633e6c29.mp3', '../../..\\uploadFile\\img\\c4e85133.jpg', '2020-08-19 23:49:27', '0', null);
INSERT INTO `music_songs` VALUES ('51', '锦零', '空山新雨后', '0', '../../..\\uploadFile\\mp3\\19d3469b.mp3', '../../..\\uploadFile\\img\\e79a621c.jpg', '2020-08-19 23:50:17', '0', null);
INSERT INTO `music_songs` VALUES ('52', '徐秉龙', '双子', '0', '../../..\\uploadFile\\mp3\\384f7776.mp3', '../../..\\uploadFile\\img\\5436efd7.jpg', '2020-08-19 23:50:40', '0', null);
INSERT INTO `music_songs` VALUES ('53', '九一川', '稚梦', '0', '../../..\\uploadFile\\mp3\\85c03297.mp3', '../../..\\uploadFile\\img\\239aa57c.jpg', '2020-08-19 23:51:18', '0', null);
INSERT INTO `music_songs` VALUES ('54', '花粥,王胜男', '出山', '0', '../../..\\uploadFile\\mp3\\43503aaf.mp3', '../../..\\uploadFile\\img\\57184947.jpg', '2020-08-19 23:52:29', '0', null);
INSERT INTO `music_songs` VALUES ('55', '阿YueYue', '画皮', '0', '../../..\\uploadFile\\mp3\\fd24493e.mp3', '../../..\\uploadFile\\img\\ab770bf0.jpg', '2020-08-19 23:52:53', '0', null);
INSERT INTO `music_songs` VALUES ('56', '音阙诗听,赵方倩', '芒种', '0', '../../..\\uploadFile\\mp3\\21b9c13a.mp3', '../../..\\uploadFile\\img\\3125342f.jpg', '2020-08-19 23:53:42', '0', null);
INSERT INTO `music_songs` VALUES ('57', '等什么君', '慕夏', '0', '../../..\\uploadFile\\mp3\\4448d348.mp3', '../../..\\uploadFile\\img\\b8c98325.jpg', '2020-08-19 23:54:18', '0', null);
INSERT INTO `music_songs` VALUES ('58', '于果', '侧脸', '0', '../../..\\uploadFile\\mp3\\290d8d70.mp3', '../../..\\uploadFile\\img\\bde3b7c0.jpg', '2020-08-19 23:55:34', '0', null);
INSERT INTO `music_songs` VALUES ('59', '陈翔', '烟火', '0', '../../..\\uploadFile\\mp3\\40699e74.mp3', '../../..\\uploadFile\\img\\7e68da6f.jpg', '2020-08-19 23:55:51', '0', null);
INSERT INTO `music_songs` VALUES ('60', '薛之谦', '意外', '0', '../../..\\uploadFile\\mp3\\456d8923.mp3', '../../..\\uploadFile\\img\\fc44b0d9.jpg', '2020-08-19 23:56:17', '0', null);
INSERT INTO `music_songs` VALUES ('61', '邵帅', '你是人间四月天', '0', '../../..\\uploadFile\\mp3\\eafb21d1.mp3', '../../..\\uploadFile\\img\\b54abc.jpg', '2020-08-19 23:57:47', '0', null);
INSERT INTO `music_songs` VALUES ('62', '柏松', '世间美好与你环环相扣', '0', '../../..\\uploadFile\\mp3\\b38f56dd.mp3', '../../..\\uploadFile\\img\\91a436b5.jpg', '2020-08-19 23:58:25', '0', null);
INSERT INTO `music_songs` VALUES ('63', '隔壁老樊', '四块五', '0', '../../..\\uploadFile\\mp3\\31c2ce2e.mp3', '../../..\\uploadFile\\img\\70a114c0.jpg', '2020-08-19 23:58:45', '0', null);
INSERT INTO `music_songs` VALUES ('64', '马良', '醒着醉', '0', '../../..\\uploadFile\\mp3\\e68e894e.mp3', '../../..\\uploadFile\\img\\e1e04bd3.jpg', '2020-08-19 23:59:04', '0', null);
INSERT INTO `music_songs` VALUES ('65', '枯木逢春', '这一生关于你的风景', '0', '../../..\\uploadFile\\mp3\\e51f847.mp3', '../../..\\uploadFile\\img\\2ab8d6d9.jpg', '2020-08-19 23:59:27', '0', null);
INSERT INTO `music_songs` VALUES ('66', 'ILLENIUM,Phoebe Ryan', 'Mine', '0', '../../..\\uploadFile\\mp3\\9ca71f52.mp3', '../../..\\uploadFile\\img\\3d273bc.jpg', '2020-08-20 00:01:31', '0', null);
INSERT INTO `music_songs` VALUES ('67', 'BEAUZ,Michi', 'Never Over ', '0', '../../..\\uploadFile\\mp3\\c606d6ea.mp3', '../../..\\uploadFile\\img\\6c3e50f0.jpg', '2020-08-20 00:01:56', '0', null);
INSERT INTO `music_songs` VALUES ('68', '毛不易', '哎呦', '0', '../../..\\uploadFile\\mp3\\4fbd5e91.mp3', '../../..\\uploadFile\\img\\b8fa89bd.jpg', '2020-08-20 00:02:42', '0', null);
INSERT INTO `music_songs` VALUES ('69', '花粥', '安眠咒', '0', '../../..\\uploadFile\\mp3\\df69f424.mp3', '../../..\\uploadFile\\img\\62c7adb3.jpg', '2020-08-20 00:03:04', '0', null);
INSERT INTO `music_songs` VALUES ('70', '徐秉龙,桃十五', '青柠', '0', '../../..\\uploadFile\\mp3\\e404f666.mp3', '../../..\\uploadFile\\img\\80377ec.jpg', '2020-08-20 00:03:30', '0', null);
INSERT INTO `music_songs` VALUES ('71', '阿肆', '喜欢', '0', '../../..\\uploadFile\\mp3\\dc7c16fe.mp3', '../../..\\uploadFile\\img\\35b06997.jpg', '2020-08-20 00:03:50', '0', null);
INSERT INTO `music_songs` VALUES ('72', '蔡健雅', '红色高跟鞋', '0', '../../..\\uploadFile\\mp3\\8d51e269.mp3', '../../..\\uploadFile\\img\\99535a34.jpg', '2020-08-20 00:05:21', '0', null);
INSERT INTO `music_songs` VALUES ('73', '焦迈奇', '哗啦啦少年再见', '0', '../../..\\uploadFile\\mp3\\c9309897.mp3', '../../..\\uploadFile\\img\\46f7281d.jpg', '2020-08-20 00:05:50', '0', null);
INSERT INTO `music_songs` VALUES ('74', '不够', '收敛', '0', '../../..\\uploadFile\\mp3\\e7af39fd.mp3', '../../..\\uploadFile\\img\\641941b2.jpg', '2020-08-20 00:06:10', '0', null);
INSERT INTO `music_songs` VALUES ('75', '陈一千', '心似烟火', '0', '../../..\\uploadFile\\mp3\\8772d965.mp3', '../../..\\uploadFile\\img\\10737645.jpg', '2020-08-20 00:07:24', '0', null);
INSERT INTO `music_songs` VALUES ('76', '孟凡明', '知秋', '0', '../../..\\uploadFile\\mp3\\243a7234.mp3', '../../..\\uploadFile\\img\\af7efc1b.jpg', '2020-08-20 00:07:44', '0', null);
INSERT INTO `music_songs` VALUES ('77', '刘昊霖', '儿时', '0', '../../..\\uploadFile\\mp3\\82c440e8.mp3', '../../..\\uploadFile\\img\\a700c1f5.jpg', '2020-08-20 00:09:12', '0', null);
INSERT INTO `music_songs` VALUES ('78', '徐秉龙1', '鸽子', '0', '../../..\\uploadFile\\mp3\\376f49d3.mp3', '../../..\\uploadFile\\img\\1a54354a.jpg', '2020-08-20 00:09:26', '0', null);
INSERT INTO `music_songs` VALUES ('79', '多多poi', '处处吻11', '0', '../../..\\uploadFile\\mp3\\b6bdc4ff.mp3', '../../..\\uploadFile\\img\\1de8c6ed.jpg', '2020-08-20 00:12:33', '0', null);

-- ----------------------------
-- Table structure for music_user
-- ----------------------------
DROP TABLE IF EXISTS `music_user`;
CREATE TABLE `music_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `userRole` bigint(10) DEFAULT NULL COMMENT '角色（1（管理员）、2（登录）、3（vip））',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `userPic` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `userPwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `collectId` bigint(20) DEFAULT NULL COMMENT '收藏id',
  PRIMARY KEY (`id`),
  KEY `music_user_collect` (`collectId`),
  CONSTRAINT `music_user_collect` FOREIGN KEY (`collectId`) REFERENCES `music_collect` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_user
-- ----------------------------
INSERT INTO `music_user` VALUES ('1', 'Admin', '1', '13738180133', '2020-08-13 10:00:14', '../../..\\uploadFile\\img\\a84a71db.jpg', '1', '1');
INSERT INTO `music_user` VALUES ('30', '胖大海', '2', '13738180100', '2020-08-19 23:21:52', '../../..\\uploadFile\\img\\5069883d.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('31', '有鱼丸', '2', '13738180102', '2020-08-19 23:22:16', '../../..\\uploadFile\\img\\64876ecb.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('32', '萝卜蹲', '2', '13738180103', '2020-08-19 23:22:35', '../../..\\uploadFile\\img\\35118ab6.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('33', 'new bee', '2', '13738180104', '2020-08-19 23:22:53', '../../..\\uploadFile\\img\\b736e05d.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('34', '怪力少女', '2', '13738180105', '2020-08-19 23:23:17', '../../..\\uploadFile\\img\\1bf9da79.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('35', '铁锤妹妹', '2', '13738180106', '2020-08-19 23:23:47', '../../..\\uploadFile\\img\\6c7b9704.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('36', '萌面大虾', '2', '13738180107', '2020-08-19 23:24:05', '../../..\\uploadFile\\img\\d9d3e1c3.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('37', '静如疯狗', '2', '13738180108', '2020-08-19 23:24:27', '../../..\\uploadFile\\img\\17f4ac4d.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('38', '撩汉大婶', '2', '13738180109', '2020-08-19 23:25:16', '../../..\\uploadFile\\img\\3c9563e7.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('42', '童靖军', '1', '13738180113', '2020-08-19 23:29:40', '../../..\\uploadFile\\img\\e14bd823.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('43', '杨邦瑶', '1', '13738180114', '2020-08-19 23:30:19', '../../..\\uploadFile\\img\\51a5804b.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('44', '赵佳', '1', '13738180115', '2020-08-19 23:32:20', '../../..\\uploadFile\\img\\4c7d3a3d.jpg', '111111', null);
INSERT INTO `music_user` VALUES ('47', '朱哥帅', '1', '13738180192', '2020-08-24 08:52:08', '../../..\\uploadFile\\img\\7d2e8bd6.jpg', '111111', null);
