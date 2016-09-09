/*
Navicat MySQL Data Transfer

Source Server         : myconn
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : tbodb

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2015-09-28 17:34:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_basecode`
-- ----------------------------
DROP TABLE IF EXISTS `t_basecode`;
CREATE TABLE `t_basecode` (
  `Fid` varchar(40) NOT NULL,
  `FcategoryId` varchar(100) DEFAULT NULL,
  `FcategoryCode` varchar(6) DEFAULT NULL,
  `FcategoryName` varchar(30) DEFAULT NULL,
  `ForderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_basecode
-- ----------------------------
INSERT INTO `t_basecode` VALUES ('1eee820330975c260130979d00b30007', 'NEWS_STATE', '001', '已审核', '1');
INSERT INTO `t_basecode` VALUES ('1eee820330975c260130979e2a820008', 'NEWS_STATE', '002', '未审核', '2');
INSERT INTO `t_basecode` VALUES ('1eee820330975c26013097a00d4a000b', 'NEWS_SHOWLEVEL', '001', '公开', '1');

-- ----------------------------
-- Table structure for `t_basedict`
-- ----------------------------
DROP TABLE IF EXISTS `t_basedict`;
CREATE TABLE `t_basedict` (
  `Fid` varchar(40) NOT NULL,
  `FcategoryId` varchar(100) DEFAULT NULL,
  `FcategoryName` varchar(30) DEFAULT NULL,
  `FtypeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_basedict
-- ----------------------------
INSERT INTO `t_basedict` VALUES ('197A2FBF-1672-4B7F-B0AD-58B356832E77', 'NEWS_SHOWLEVEL', '新闻显示级别', null);
INSERT INTO `t_basedict` VALUES ('5231CAA7-E110-4635-9A77-CD6CA4B815D4', 'user_state', '用户状态', '');
INSERT INTO `t_basedict` VALUES ('8C0767D3-34CC-44C2-B701-D63EBDF5FE21', 'NEWS_STATE', '新闻状态', null);

-- ----------------------------
-- Table structure for `t_cityregion`
-- ----------------------------
DROP TABLE IF EXISTS `t_cityregion`;
CREATE TABLE `t_cityregion` (
  `Fid` varchar(40) NOT NULL,
  `Fname` varchar(30) DEFAULT NULL,
  `FareaCode` varchar(30) DEFAULT NULL,
  `Fcode` varchar(20) DEFAULT NULL,
  `FparentId` varchar(40) DEFAULT NULL,
  `FisParent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Fid`),
  KEY `FKB428490A7F58BDBC` (`FparentId`),
  CONSTRAINT `FKB428490A7F58BDBC` FOREIGN KEY (`FparentId`) REFERENCES `t_cityregion` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cityregion
-- ----------------------------
INSERT INTO `t_cityregion` VALUES ('0001', null, null, null, null, '');
INSERT INTO `t_cityregion` VALUES ('1eee82ff30886baa0130887a97940005', '郑州', null, 'CR010105', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '\0');
INSERT INTO `t_cityregion` VALUES ('7CA766E7-26E0-4FF5-B876-84DEA53F6412', '中国', null, 'CR01', '0001', '');
INSERT INTO `t_cityregion` VALUES ('7CA766E7-26E0-4FF5-B876-84DEA53F647B', '河南', null, 'CR0101', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '\0');

-- ----------------------------
-- Table structure for `t_items`
-- ----------------------------
DROP TABLE IF EXISTS `t_items`;
CREATE TABLE `t_items` (
  `Fid` varchar(40) NOT NULL,
  `FitemName` varchar(60) DEFAULT NULL,
  `Fcode` varchar(20) DEFAULT NULL,
  `FshortName` varchar(30) DEFAULT NULL,
  `Furl` varchar(200) DEFAULT NULL,
  `FimageFile` varchar(200) DEFAULT NULL,
  `Fcomments` varchar(200) DEFAULT NULL,
  `FcityRegionId` varchar(40) DEFAULT NULL,
  `FleagueId` varchar(40) DEFAULT NULL,
  `FparentId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Fid`),
  KEY `FK3A5BC1589EC5A59` (`FparentId`),
  KEY `FK3A5BC15D637CCF1` (`FcityRegionId`),
  KEY `FK3A5BC1557BF14F1` (`FleagueId`),
  CONSTRAINT `FK3A5BC1557BF14F1` FOREIGN KEY (`FleagueId`) REFERENCES `t_league` (`Fid`),
  CONSTRAINT `FK3A5BC1589EC5A59` FOREIGN KEY (`FparentId`) REFERENCES `t_items` (`Fid`),
  CONSTRAINT `FK3A5BC15D637CCF1` FOREIGN KEY (`FcityRegionId`) REFERENCES `t_cityregion` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_items
-- ----------------------------
INSERT INTO `t_items` VALUES ('0001', null, null, null, null, null, null, null, null, null);
INSERT INTO `t_items` VALUES ('0EBFE5B2-A13A-41B4-89AD-A93D2441EE4E', '总栏目', null, null, null, null, null, null, null, '0001');
INSERT INTO `t_items` VALUES ('1eee820330a1d06a0130a1ec998c000c', '公司资讯', 'ITEM00105', '', '/web/queryTrade.do?items.code=ITEM00105&page.pageIndex=1&menuid=6', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_items` VALUES ('1eee820330ad49aa0130ad4a6e770002', '业务中心', 'ITEM001', '', '', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '0EBFE5B2-A13A-41B4-89AD-A93D2441EE4E');
INSERT INTO `t_items` VALUES ('1eee820330ad49aa0130ad4f1a830007', '我们的服务', 'ITEM00101', '', '/web/queryTrade.do?items.code=ITEM00101&type=1&news.id=ff74ea23-dcd3-4fe1-bfe4-62c0cec912c3&menuid=2', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_items` VALUES ('1eee820330ad49aa0130ad4f99e80009', '服务及流程', 'ITEM00103', '', '/web/queryTrade.do?items.code=ITEM00103&type=1&news.id=18c4b6f2-2f64-4202-be8d-4bd3704c1668&menuid=4', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_items` VALUES ('1eee820330ad49aa0130ad4fcc70000a', '平台功能', 'ITEM00102', '', '/web/queryTrade.do?items.code=ITEM00102&type=1&news.id=40532f94-9585-4bcd-b245-5f01852ba4d4&menuid=3', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_items` VALUES ('1eee82f53418ae87013418b2bfbb1234', '关于天博', 'ITEM00107', '', '/web/queryTrade.do?items.code=ITEM00107&type=1&news.id=441fb84b-54c6-481c-8de4-72a1fdec5a20&menuid=8', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_items` VALUES ('1eee82f53418ae87013418b2bfbb1341', '成功案例', 'ITEM00106', '', '/web/queryTrade.do?items.code=ITEM00106&type=1&news.id=a24fbf3f-b288-4b56-9cc5-9233ae9778cb&menuid=7', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_items` VALUES ('1fceaedd-6344-41d4-9dc2-3520800d3a89', '新闻资讯', 'ITEM008', '', '', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '0EBFE5B2-A13A-41B4-89AD-A93D2441EE4E');
INSERT INTO `t_items` VALUES ('297e877e30a7dcab0130a7e1a0ef0003', '服务导航', 'ITEM009', '', '', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '0EBFE5B2-A13A-41B4-89AD-A93D2441EE4E');
INSERT INTO `t_items` VALUES ('297e877e30a7dcab0130a7e7c8250005', '联系我们', 'ITEM00901', '', '/web/queryTrade.do?items.code=ITEM00901&type=1&news.id=674d9711-3035-4d5e-a433-e271d0658dc8', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee82ff30886baa0130887bd1cc0007', '297e877e30a7dcab0130a7e1a0ef0003');
INSERT INTO `t_items` VALUES ('297e877e30a7dcab0130a7e882f40006', '网站地图', 'ITEM00902', '', '/web/queryTrade.do?items.code=ITEM00902&type=1&news.id=2d7ee08b-2cdd-4fa2-86f4-2e30c9494951', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee82ff30886baa0130887bd1cc0007', '297e877e30a7dcab0130a7e1a0ef0003');
INSERT INTO `t_items` VALUES ('88954135-8913-4ebf-9098-1900aa2b89dc', '最新资讯', 'ITEM00801', '', '/web/queryTrade.do?items.code=ITEM00801&page.pageIndex=1', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1fceaedd-6344-41d4-9dc2-3520800d3a89');
INSERT INTO `t_items` VALUES ('bd1b29bc34cc5afc01353173fe4804f5', '服务条款', 'ITEM00903', '', '/web/queryTrade.do?items.code=ITEM00903&type=1&news.id=7e9143bc-b913-4493-8f8c-641071231b10', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '297e877e30a7dcab0130a7e1a0ef0003');
INSERT INTO `t_items` VALUES ('bd1b29bc3550dc430135533846b200d2', '我们的特色', 'ITEM00104', '', '/web/queryTrade.do?items.code=ITEM00104&type=1&news.id=fc3b308b-f423-4fc8-b8a5-0f18b782d12e&menuid=5', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_items` VALUES ('bd1b29bc38aec2ca0138d682eb4401b8', '招贤纳士', 'ITEM00904', '', '/web/queryTrade.do?items.code=ITEM00903&type=1&news.id=6f62a5c2-818e-4015-a950-856e12d9a9b9', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '297e877e30a7dcab0130a7e1a0ef0003');

-- ----------------------------
-- Table structure for `t_league`
-- ----------------------------
DROP TABLE IF EXISTS `t_league`;
CREATE TABLE `t_league` (
  `Fid` varchar(40) NOT NULL,
  `Fname` varchar(60) DEFAULT NULL,
  `Fcontents` text,
  `FlogoFile` varchar(100) DEFAULT NULL,
  `FcityRegionId` varchar(40) DEFAULT NULL,
  `FshortName` varchar(20) DEFAULT NULL,
  `Fcode` varchar(20) DEFAULT NULL,
  `Fcomments` varchar(200) DEFAULT NULL,
  `FtemplateUrl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Fid`),
  KEY `FK755B087AD637CCF1` (`FcityRegionId`),
  CONSTRAINT `FK755B087AD637CCF1` FOREIGN KEY (`FcityRegionId`) REFERENCES `t_cityregion` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_league
-- ----------------------------
INSERT INTO `t_league` VALUES ('1eee82ff30886baa0130887bd1cc0007', '天博科技', '河南天博', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '', '001', '', '');

-- ----------------------------
-- Table structure for `t_loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_loginlog`;
CREATE TABLE `t_loginlog` (
  `fid` varchar(40) NOT NULL,
  `Faccount` varchar(30) DEFAULT NULL,
  `FloginTime` datetime DEFAULT NULL,
  `FlogoutTime` datetime DEFAULT NULL,
  `FregionId` varchar(40) DEFAULT NULL,
  `FleagueName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FKA60EE6A610277186` (`FregionId`),
  CONSTRAINT `FKA60EE6A610277186` FOREIGN KEY (`FregionId`) REFERENCES `t_cityregion` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loginlog
-- ----------------------------
INSERT INTO `t_loginlog` VALUES ('02e20a83-0e80-4b50-8e64-ace7cb878a5e', 'admin', '2012-09-25 23:19:03', null, null, null);
INSERT INTO `t_loginlog` VALUES ('0d017198-7b64-4cb6-9c70-824d977f6b73', 'admin', '2012-09-26 08:37:59', null, null, null);
INSERT INTO `t_loginlog` VALUES ('1315964e-a5a7-49e4-a27d-1bd050bd22dc', 'admin', '2012-09-28 11:03:34', null, null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82f539f6e4b70139f7fcd7820002', 'admin', '2012-09-24 19:15:06', null, null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82f539f87ba50139f87c05730000', 'admin', '2012-09-24 21:34:01', null, null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82f539f87ba50139f8e729830001', 'admin', '2012-09-24 23:31:02', '2012-09-24 23:36:28', null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82f539f87ba50139f8ec46c70002', 'admin', '2012-09-24 23:36:37', '2012-09-25 00:02:53', null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82f539f87ba50139f9046b750003', 'admin', '2012-09-25 00:03:00', null, null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82f539f87ba50139fac4a05a0004', 'admin', '2012-09-25 08:12:33', null, null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82fc39fad0480139fad087fe0000', 'admin', '2012-09-25 08:25:33', '2012-09-25 08:29:44', null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82fc39fad0480139fad472450001', 'admin', '2012-09-25 08:29:50', '2012-09-25 10:33:45', null, null);
INSERT INTO `t_loginlog` VALUES ('1eee82fc39fad0480139fb4601980006', 'admin', '2012-09-25 10:33:52', null, null, null);
INSERT INTO `t_loginlog` VALUES ('2436f83b-0698-4a94-a266-041a6aaac5c1', 'admin', '2015-09-28 17:27:37', null, null, null);
INSERT INTO `t_loginlog` VALUES ('2701999d-4c15-4e5a-96ae-920d99557c83', 'admin', '2012-10-11 15:00:19', null, null, null);
INSERT INTO `t_loginlog` VALUES ('2aa19e3d-54bd-4830-b934-524a6b8e6f91', 'admin', '2012-09-26 18:03:56', null, null, null);
INSERT INTO `t_loginlog` VALUES ('2ddbcfcb-3f26-4755-a809-16302aadcf03', 'admin', '2012-10-03 21:29:23', null, null, null);
INSERT INTO `t_loginlog` VALUES ('2e55ca1e-5ed2-4fcf-9c5f-22c48723f1a1', 'admin', '2012-09-28 10:03:13', null, null, null);
INSERT INTO `t_loginlog` VALUES ('342bcfaf-03dc-48c1-8905-582e8c2d7894', 'admin', '2012-09-25 17:53:25', null, null, null);
INSERT INTO `t_loginlog` VALUES ('382e92a2-ea89-4d04-9645-e566b6534280', 'admin', '2012-09-25 14:41:37', null, null, null);
INSERT INTO `t_loginlog` VALUES ('3e8877e4-9354-4711-bdab-6564d56b554d', 'admin', '2012-10-11 15:17:02', null, null, null);
INSERT INTO `t_loginlog` VALUES ('4540be11-976a-45f6-9b54-016eb17fafbd', 'admin', '2012-09-27 18:04:55', null, null, null);
INSERT INTO `t_loginlog` VALUES ('4599ff6f-86b9-4c6c-a3c6-69eed22598b8', 'admin', '2012-09-28 09:42:27', null, null, null);
INSERT INTO `t_loginlog` VALUES ('51409265-d01f-4578-afb9-71c96b7e901d', 'admin', '2012-10-11 15:13:57', null, null, null);
INSERT INTO `t_loginlog` VALUES ('56773b96-b398-4d73-aa4c-a3130b6f7c03', 'admin', '2012-10-11 15:24:11', null, null, null);
INSERT INTO `t_loginlog` VALUES ('593cbee8-19a3-43e2-aead-37b9f6c70b71', 'admin', '2012-09-26 09:29:16', null, null, null);
INSERT INTO `t_loginlog` VALUES ('5d65dc96-ee4c-4f8f-8a01-b545e1905520', 'admin', '2012-09-26 16:10:46', null, null, null);
INSERT INTO `t_loginlog` VALUES ('5da28dde-3aa5-4213-b040-f810aa476501', 'admin', '2012-09-28 10:49:45', null, null, null);
INSERT INTO `t_loginlog` VALUES ('5f017046-46eb-4e2f-8e74-f05bb4c92a2d', 'admin', '2012-09-26 15:21:05', '2012-09-26 15:36:00', null, null);
INSERT INTO `t_loginlog` VALUES ('5fb8a9d6-90f2-4896-abf6-f3c24a4e0570', 'admin', '2012-09-25 18:34:13', null, null, null);
INSERT INTO `t_loginlog` VALUES ('60c67f4a-7174-4f52-a3ef-0f2b2422830a', 'admin', '2012-09-26 18:01:48', null, null, null);
INSERT INTO `t_loginlog` VALUES ('62276bfb-101b-479b-a1c2-5376745d496c', 'admin', '2012-10-11 23:09:55', null, null, null);
INSERT INTO `t_loginlog` VALUES ('6527c159-3f94-4828-915c-f03ac9af6d83', 'admin', '2012-09-28 16:54:54', null, null, null);
INSERT INTO `t_loginlog` VALUES ('769dfc3c-ce8b-4565-a2c5-96108a422e0c', 'admin', '2012-09-27 18:15:09', null, null, null);
INSERT INTO `t_loginlog` VALUES ('84500dfd-db36-4f7f-82df-f7db71a3ab5e', 'admin', '2012-09-25 14:34:30', null, null, null);
INSERT INTO `t_loginlog` VALUES ('9ccf3b67-1b3c-4b71-ab43-8831f742a46f', 'admin', '2012-09-26 13:19:45', null, null, null);
INSERT INTO `t_loginlog` VALUES ('9cec6eae-e921-47cb-be72-4612aa17e9be', 'admin', '2012-09-28 10:48:09', null, null, null);
INSERT INTO `t_loginlog` VALUES ('9da15780-f8eb-4b90-b201-7f0159d8a8dc', 'admin', '2012-09-27 14:57:56', null, null, null);
INSERT INTO `t_loginlog` VALUES ('a0a823d4-a95b-4c6e-82bb-68f4f664941c', 'admin', '2012-09-28 10:10:17', null, null, null);
INSERT INTO `t_loginlog` VALUES ('a5f50a34-669e-437a-a6ea-aa7e70bdf76e', 'admin', '2015-09-28 16:48:55', '2015-09-28 17:27:30', null, null);
INSERT INTO `t_loginlog` VALUES ('a6421c97-0618-4bbd-b0c9-f0a6e6e8f667', 'admin', '2012-09-26 09:15:08', null, null, null);
INSERT INTO `t_loginlog` VALUES ('ab4b4c2a-cf42-49bc-80f5-b76ba44155ae', 'admin', '2012-09-26 16:03:18', '2012-09-26 16:09:48', null, null);
INSERT INTO `t_loginlog` VALUES ('ac0b464d-33ef-461b-a26b-915e03bd9620', 'admin', '2012-09-25 23:55:04', null, null, null);
INSERT INTO `t_loginlog` VALUES ('aded54c0-110d-44ff-8234-bb8f1c9861f8', 'shenhe', '2012-09-26 16:10:03', '2012-09-26 16:10:38', null, null);
INSERT INTO `t_loginlog` VALUES ('ae55e02a-ed5b-4bc8-a6f6-d765f286c60c', 'admin', '2012-09-26 18:02:25', '2012-09-26 18:03:55', null, null);
INSERT INTO `t_loginlog` VALUES ('b0a01009-44cc-407c-ab44-41524b564403', 'admin', '2015-09-28 16:43:19', '2015-09-28 16:48:48', null, null);
INSERT INTO `t_loginlog` VALUES ('b6bf3dc9-4fea-4447-863f-e6a5de1c5238', 'admin', '2012-09-28 13:38:56', null, null, null);
INSERT INTO `t_loginlog` VALUES ('bd2b0902-cf46-4040-8ce8-070b52a21bb3', 'admin', '2012-09-26 09:21:09', null, null, null);
INSERT INTO `t_loginlog` VALUES ('c799a108-68d7-4a97-9637-277ed12b7609', 'admin', '2012-09-25 15:01:20', null, null, null);
INSERT INTO `t_loginlog` VALUES ('dddc8d50-1369-4a90-823f-78f9a7144017', 'admin', '2012-09-26 18:01:10', null, null, null);
INSERT INTO `t_loginlog` VALUES ('e1c255bf-911b-4bea-80c8-2e6b79c2a2c3', 'admin', '2015-09-28 16:37:21', null, null, null);
INSERT INTO `t_loginlog` VALUES ('e467e11b-b7c0-49da-9174-38e92b08080e', 'admin', '2012-09-25 18:31:02', null, null, null);
INSERT INTO `t_loginlog` VALUES ('e8cb13e4-5f28-4210-978d-0054a4d50f79', 'admin', '2012-10-11 15:14:56', null, null, null);
INSERT INTO `t_loginlog` VALUES ('edbe8d14-60e6-4512-b017-dd3bbb4e509e', 'admin', '2012-09-28 10:37:21', null, null, null);
INSERT INTO `t_loginlog` VALUES ('f8cc62b6-08b3-4643-bce5-db45d20fdd55', 'admin', '2012-09-26 15:40:26', null, null, null);
INSERT INTO `t_loginlog` VALUES ('fad26f4d-ce28-4864-8c9e-2ee473493f93', 'shenhe', '2012-09-26 15:36:13', '2012-09-26 15:40:11', null, null);

-- ----------------------------
-- Table structure for `t_moudle`
-- ----------------------------
DROP TABLE IF EXISTS `t_moudle`;
CREATE TABLE `t_moudle` (
  `fid` varchar(40) NOT NULL,
  `FmoudleName` varchar(60) NOT NULL,
  `Fcode` varchar(60) NOT NULL,
  `Fgrade` int(11) DEFAULT NULL,
  `FparentId` varchar(40) DEFAULT NULL,
  `Fimage` varchar(60) DEFAULT NULL,
  `Furl` varchar(60) DEFAULT NULL,
  `FindexUrl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK77A5D73514A02561` (`FparentId`),
  CONSTRAINT `f1111kkkkkaa` FOREIGN KEY (`FparentId`) REFERENCES `t_moudle` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_moudle
-- ----------------------------
INSERT INTO `t_moudle` VALUES ('12942FDB-DFCC-4AD2-A11A-CC0369698DFE', '模块管理', 'sys3', '3', 'FDAE88B9-3547-4835-BA39-D8EE5876EF01', '', '/model/queryAction.do', '');
INSERT INTO `t_moudle` VALUES ('2645EE9A-DF12-4056-8116-0F8014C1552B', '操作日志', 'sys5', '5', 'FDAE88B9-3547-4835-BA39-D8EE5876EF01', '', '/log/queryOperateLogAction.do', '');
INSERT INTO `t_moudle` VALUES ('27186674-FBAF-4C72-A269-0A90E9083F33', '登录日志', 'sys4', '4', 'FDAE88B9-3547-4835-BA39-D8EE5876EF01', '', '/log/queryLoginLogAction.do', '');
INSERT INTO `t_moudle` VALUES ('2CBED236-2FFD-47E7-8D58-664E1E3EA1E8', '行业管理', 'base4', '4', '8B72F74B-B05B-4F8B-A3E2-1CC46B80A041', '', '/trade/transferToListAction.do', '');
INSERT INTO `t_moudle` VALUES ('318CAC2F-BEFE-4390-A905-BFC0D7856465', '新闻中心', 'new1', '1', 'B86724FA-D255-4C10-A2C6-E88B41671F1F', '', '/news/switchNewsItemsListFrameAction.do', '');
INSERT INTO `t_moudle` VALUES ('5BBBB51E-21F8-4AB2-83BF-B69FE44B1EC5', '数据字典', 'base1', '1', '8B72F74B-B05B-4F8B-A3E2-1CC46B80A041', '', '/baseData/listAction.do', '');
INSERT INTO `t_moudle` VALUES ('739B2861-1957-4718-84C4-DB1D2EC19D4E', '栏目管理', 'base3', '3', '8B72F74B-B05B-4F8B-A3E2-1CC46B80A041', '', '/tree/switchToItemAction.do', '');
INSERT INTO `t_moudle` VALUES ('856778CE-FF71-41EE-8892-6E4520A8941E', '新闻分类', 'new2', '2', 'B86724FA-D255-4C10-A2C6-E88B41671F1F', '', '/newstype/transferToNewsTypeListAction.do', '');
INSERT INTO `t_moudle` VALUES ('8B72F74B-B05B-4F8B-A3E2-1CC46B80A041', '基础数据', 'base', '4', null, '01.gif', '', '');
INSERT INTO `t_moudle` VALUES ('8D750B62-7B0A-480A-BD7E-13F3511EB5C2', '用户管理', 'sys1', '1', 'FDAE88B9-3547-4835-BA39-D8EE5876EF01', '', '/user/queryAction.do', '');
INSERT INTO `t_moudle` VALUES ('AC182097-530B-4AF8-AFCE-B4683CE50C7C', '网站信息', 'base5', '5', '8B72F74B-B05B-4F8B-A3E2-1CC46B80A041', '', '/league/transferToLeagueListAction.do', '');
INSERT INTO `t_moudle` VALUES ('B86724FA-D255-4C10-A2C6-E88B41671F1F', '新闻管理', 'new', '1', null, '02.gif', '', '');
INSERT INTO `t_moudle` VALUES ('E048A1B0-4DB4-49CD-9F58-775D998FC82D', '行政区管理', 'base2', '2', '8B72F74B-B05B-4F8B-A3E2-1CC46B80A041', '', '/region/switchToItemAction.do', '');
INSERT INTO `t_moudle` VALUES ('F87E1990-6CFD-4343-8F12-337B160D9E5C', '角色管理', 'sys2', '2', 'FDAE88B9-3547-4835-BA39-D8EE5876EF01', '', '/role/queryAction.do', '');
INSERT INTO `t_moudle` VALUES ('FDAE88B9-3547-4835-BA39-D8EE5876EF01', '系统管理', 'sys', '5', null, '07.gif', '', '');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `Fid` varchar(40) NOT NULL,
  `Ftitle` varchar(200) DEFAULT NULL,
  `FnewsContentsId` varchar(40) DEFAULT NULL,
  `Fcreator` varchar(40) DEFAULT NULL,
  `Fsource` varchar(60) DEFAULT NULL,
  `Fauthor` varchar(30) DEFAULT NULL,
  `Fmodifier` varchar(40) DEFAULT NULL,
  `FcreateTime` datetime DEFAULT NULL,
  `FmodifyTime` datetime DEFAULT NULL,
  `Fstatus` varchar(40) DEFAULT NULL,
  `FbrowseSum` int(11) DEFAULT NULL,
  `FnewsTypeId` varchar(40) DEFAULT NULL,
  `FisTop` bit(1) DEFAULT NULL,
  `FcityRegionId` varchar(40) DEFAULT NULL,
  `FtradeId` varchar(40) DEFAULT NULL,
  `FleagueId` varchar(40) DEFAULT NULL,
  `FitemsId` varchar(40) DEFAULT NULL,
  `FshowLevelId` varchar(40) DEFAULT NULL,
  `FimageFile` varchar(200) DEFAULT NULL,
  `FvideoFile` varchar(200) DEFAULT NULL,
  `Fsummary` longtext,
  `FpublishTime` datetime DEFAULT NULL,
  `FsubTitle` varchar(200) DEFAULT NULL,
  `FcommDocFile` varchar(200) DEFAULT NULL,
  `FshenheReason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Fid`),
  UNIQUE KEY `Fid` (`Fid`),
  KEY `FK94C557DE15D25E8C` (`FshowLevelId`),
  KEY `FK94C557DE941A20CF` (`FnewsTypeId`),
  KEY `FK94C557DE5771C69D` (`Fcreator`),
  KEY `FK94C557DEC34608F` (`FnewsContentsId`),
  KEY `FK94C557DE554FACAB` (`FtradeId`),
  KEY `FK94C557DED637CCF1` (`FcityRegionId`),
  KEY `FK94C557DE12777263` (`FitemsId`),
  KEY `FK94C557DEA4FFA2D4` (`Fmodifier`),
  KEY `FK94C557DE57BF14F1` (`FleagueId`),
  CONSTRAINT `FK94C557DE12777263` FOREIGN KEY (`FitemsId`) REFERENCES `t_items` (`Fid`),
  CONSTRAINT `FK94C557DE15D25E8C` FOREIGN KEY (`FshowLevelId`) REFERENCES `t_basecode` (`Fid`),
  CONSTRAINT `FK94C557DE554FACAB` FOREIGN KEY (`FtradeId`) REFERENCES `t_trade` (`Fid`),
  CONSTRAINT `FK94C557DE5771C69D` FOREIGN KEY (`Fcreator`) REFERENCES `t_user` (`fid`),
  CONSTRAINT `FK94C557DE57BF14F1` FOREIGN KEY (`FleagueId`) REFERENCES `t_league` (`Fid`),
  CONSTRAINT `FK94C557DE941A20CF` FOREIGN KEY (`FnewsTypeId`) REFERENCES `t_newstype` (`Fid`),
  CONSTRAINT `FK94C557DEA4FFA2D4` FOREIGN KEY (`Fmodifier`) REFERENCES `t_user` (`fid`),
  CONSTRAINT `FK94C557DEC34608F` FOREIGN KEY (`FnewsContentsId`) REFERENCES `t_newscontents` (`Fid`),
  CONSTRAINT `FK94C557DED637CCF1` FOREIGN KEY (`FcityRegionId`) REFERENCES `t_cityregion` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('18c4b6f2-2f64-4202-be8d-4bd3704c1668', '服务及流程', 'c85c8c3c-9bc4-4102-8926-07dec9f6b731', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 13:58:55', '2012-10-11 15:56:25', '未审核', '35', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4f99e80009', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('202c7714-d5b4-4167-8f5f-a8b485e964d2', '公司资讯二', '10e65ec0-8847-435f-bbcb-d739ccf3f92d', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', null, '2012-09-26 14:00:17', null, '已审核', '4', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '1eee820330a1d06a0130a1ec998c000c', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', null, '通过');
INSERT INTO `t_news` VALUES ('2d7ee08b-2cdd-4fa2-86f4-2e30c9494951', '网站地图', 'e6f2d45d-4605-493d-b2ad-5e2661c1ec88', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', null, '2012-09-26 14:15:55', null, '未审核', '7', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '297e877e30a7dcab0130a7e882f40006', '1eee820330975c26013097a00d4a000b', null, null, '', null, '', null, null);
INSERT INTO `t_news` VALUES ('40532f94-9585-4bcd-b245-5f01852ba4d4', '平台功能', 'c5980155-c82f-46cf-9bcb-714b02f4ad51', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 13:58:21', '2012-10-11 15:55:17', '未审核', '28', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4fcc70000a', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('441fb84b-54c6-481c-8de4-72a1fdec5a20', '关于天博', 'e35514a3-c12e-404c-83ea-73fab947001b', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 14:01:13', '2012-10-11 16:06:24', '未审核', '3', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '1eee82f53418ae87013418b2bfbb1234', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('668d148e-daec-4fa7-8076-0261b6001eaa', '这是公司的最新资讯', '28c793ca-7b56-4151-8d11-9c796a32e652', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', null, '2012-09-26 16:07:33', null, '已审核', '2', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '88954135-8913-4ebf-9098-1900aa2b89dc', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', null, '');
INSERT INTO `t_news` VALUES ('674d9711-3035-4d5e-a433-e271d0658dc8', '联系我们', '20d4e403-5fe4-4d93-ba9a-ebc2eb443030', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 14:15:25', '2012-10-11 16:11:38', '未审核', '3', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '297e877e30a7dcab0130a7e7c8250005', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('6f62a5c2-818e-4015-a950-856e12d9a9b9', '招贤纳士', 'f9773b1c-b6db-454e-845b-f4cecc1bc275', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 14:16:50', '2012-10-11 16:12:28', '未审核', '1', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', 'bd1b29bc38aec2ca0138d682eb4401b8', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('7e9143bc-b913-4493-8f8c-641071231b10', '服务条款', '5969b251-9e8a-4b6e-84e2-e44372bb3243', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', null, '2012-09-26 14:16:26', null, '未审核', '5', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', 'bd1b29bc34cc5afc01353173fe4804f5', '1eee820330975c26013097a00d4a000b', null, null, '', null, '', null, null);
INSERT INTO `t_news` VALUES ('957b4c1c-6bdb-4703-bc0e-1f85a80e84e2', '第二条新闻', 'b7c72535-6269-4b1c-8cf2-952b9fd657f1', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 16:08:05', '2015-09-28 16:43:31', '未审核', '0', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '88954135-8913-4ebf-9098-1900aa2b89dc', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('a24fbf3f-b288-4b56-9cc5-9233ae9778cb', '成功案例', '05fb9029-5ec2-46c0-856e-2d79de1324e0', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 14:00:45', '2012-09-28 15:56:38', '未审核', '18', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '1eee82f53418ae87013418b2bfbb1341', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('e06d2cb7-1efd-4855-9055-96dfacce3acb', '公司资讯一', '409a21ed-cd0c-4c6a-94f9-c52ac5c099dc', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', null, '2012-09-26 13:59:53', null, '已审核', '0', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '1eee820330a1d06a0130a1ec998c000c', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', null, '通过');
INSERT INTO `t_news` VALUES ('fc3b308b-f423-4fc8-b8a5-0f18b782d12e', '我们的特色', '1053637d-0c2b-4afc-b034-e8c490f12af4', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 14:01:52', '2012-10-11 16:03:55', '未审核', '17', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', 'bd1b29bc3550dc430135533846b200d2', '1eee820330975c26013097a00d4a000b', '', '', '', null, '', '', '');
INSERT INTO `t_news` VALUES ('ff74ea23-dcd3-4fe1-bfe4-62c0cec912c3', '我们的服务', '90a2041d-f98d-4b2b-9acf-6e7557c8d46d', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '天博科技', '匿名', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '2012-09-26 09:30:03', '2012-10-11 15:30:00', '未审核', '36', '1eee821f341b43c701341b5563ec0004', '\0', '7CA766E7-26E0-4FF5-B876-84DEA53F6412', '1eee821f341b43c701341b61a4f2000e', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4f1a830007', '1eee820330975c26013097a00d4a000b', '', '', '', '2012-08-28 00:00:00', '', '', '');

-- ----------------------------
-- Table structure for `t_newscontents`
-- ----------------------------
DROP TABLE IF EXISTS `t_newscontents`;
CREATE TABLE `t_newscontents` (
  `Fid` varchar(40) NOT NULL,
  `Fcontents` longtext,
  PRIMARY KEY (`Fid`),
  UNIQUE KEY `Fid` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_newscontents
-- ----------------------------
INSERT INTO `t_newscontents` VALUES ('05fb9029-5ec2-46c0-856e-2d79de1324e0', '<img width=\"685\" height=\"158\" src=\"/tbedu/userfiles/image/13488166465021627531822.jpg\" alt=\"\" /><br />\r\n<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"line-height: 26px;\">\r\n    <tbody>\r\n        <tr>\r\n            <td>&nbsp;</span><a target=\"_blank\" href=\"http://hn.gkwlpx.com/WebHngk\"><span style=\"line-height: 26px;\">►河南省机关事业单位工勤人员升级考核（继续教育）网络培训平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;<a target=\"_blank\" href=\"http://117.27.135.74:802/WebXmtjpc/Default.aspx\"><span style=\"line-height: 26px;\">►厦门市统计从业人员继续教育网络培训平台</span></a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;<a target=\"_blank\" href=\"http://www.fjcec.cn\">►福建省公务员和专业技术人员网络培训公共服务平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://gkpx.fjrs.gov.cn/\" target=\"_blank\">福建省机关事业单位工勤人员岗位继续教育网络培训平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;<a target=\"_blank\" href=\"http://117.27.135.74:802/WebXmtjpc/Default.aspx\">►</a>福建省军转干部适应性培训网络平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://www.fjwapx.com/\" target=\"_blank\">福建省信息网络安全知识普及教育网络培训平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://www.kjjxjy.com\" target=\"_blank\">福建省会计人员继续教育网络培训平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://www.ygjxjy.com/Webygj/\" target=\"_blank\">福建省道路运输从业人员继续教育网络平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►福建省档案人员继续教育网络学习平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://szjk.fj51e.cn/Web/\" target=\"_blank\">福建省生殖健康咨询师国家职业资格考试考前培训平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://yx.fjjcjy.com/\" target=\"_blank\">中小学教师（校长）远程研修平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►农村中小学现代远程教育工程省级骨干培训网络平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://www.fjjcjy.com/WebJcjy/\" target=\"_blank\">福建基础教育网</a>、<a href=\"http://ms.fjjcjy.com/WebMsw/\" target=\"_blank\">福建名师网</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://www.fj51e.cn/Default.aspx/\" target=\"_blank\">福建省终身学习在线</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►福州市人事考试中心网络教育服务平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►<a href=\"http://jxjy.xmcz.gov.cn/\" target=\"_blank\">厦门市会计人员继续教育培训平台</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►厦门市外汇业务培训平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►四川省生殖健康咨询师国家职业资格考试考前培训平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►山东省生殖健康咨询师国家职业资格考试考前培训平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;►江西省生殖健康咨询师国家职业资格考试考前培训平台</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;......</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<br />\r\n<br />');
INSERT INTO `t_newscontents` VALUES ('1053637d-0c2b-4afc-b034-e8c490f12af4', '<img width=\"685\" height=\"108\" alt=\"\" src=\"/tbedu/userfiles/image/choosepic.jpg\" /><br />\r\n<table width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td>\r\n            <h3><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">► 零投资</span></span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size: 14px;\"><span style=\"line-height: 26px;\">用户无需任何投资即可拥有满足其培训需求的个性化远程培训网络平台，拥有该平台的署名权、使用权、管 理权。而自建平台，则需要投资立项、需求分析、项目招标、项目开发、平台维护等一系列投入，一个大型 综合平台至少上千万投资。其后还将面临平台功能升级、日常服务器带宽投入以及技术维护等持续开支。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <h3><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">► 零风险</span></span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size: 14px;\"><span style=\"line-height: 26px;\">由天博为用户投资建设并交付给业主使用的网络培训平台，其先进性、稳定性、易用性，汇集E-LEARNING行 业应用的优秀成果，同时天博对平台功能持续投入研发、更新升级，避免了用户不可预估的IT信息化投资风险。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <h3><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">► 零维护</span></span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;<span style=\"line-height: 26px;\"><span style=\"font-size: 16px;\">&nbsp; </span><span style=\"font-size: 14px;\">天博为客户免费承担平台的日常技术支持、运行维护、软件升级、网络安全、数据备份、信息保密等服务， 免去客户的日常维护成本与后顾之忧。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <h3><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span></span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">► 一体化应用与一站式培训全过程服务</span></span><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp; <br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <h3><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            <span style=\"font-size: 18px;\">► 安全保障</span><br />\r\n            </span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;<span style=\"line-height: 26px;\"><span style=\"font-size: 16px;\">&nbsp; </span><span style=\"font-size: 14px;\">5A级的IDC机房保证平台的稳定和安全；平台具备防攻击、防病毒、防入侵、防非法内容等安全保障措施。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><span style=\"font-size: 16px;\"><br />\r\n            </span><span style=\"font-size: 18px;\">► 支持大规模并发的在线学习和考试</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size: 14px;\"><span style=\"line-height: 26px;\">集群主机平台、带宽、分布式流媒体系统，提供无限量的带宽，支持同时数十万人流畅、顺利地进行培训在 线学习和考试，平台至少满足年30万人次培训量。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>\r\n            <h3><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            ► 独立透明的报名缴费结算体系</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;&nbsp;&nbsp;<span style=\"font-size: 16px;\"><span style=\"line-height: 26px;\">&nbsp; </span></span><span style=\"font-size: 14px;\"><span style=\"line-height: 26px;\">支持线上线下缴费模式，线下缴款（转账、现金）、网络支付（网银、第三方支付、学习卡）、电信代缴款 （固话、宽带、小灵通）。网银支付支持30多家银行。领先的应用体验与专业服务团队低廉的服务价格。</span></span><span style=\"line-height: 22px;\"><br />\r\n            </span><hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<br />\r\n<br />');
INSERT INTO `t_newscontents` VALUES ('10e65ec0-8847-435f-bbcb-d739ccf3f92d', '公司资讯二<br />');
INSERT INTO `t_newscontents` VALUES ('20d4e403-5fe4-4d93-ba9a-ebc2eb443030', '<span style=\"color: rgb(0, 0, 255);\"><span style=\"font-size: 16px;\"><span style=\"line-height: 26px;\">服务电话：18838061533   <br />\r\nEmail：tboedu@sohu.com</span></span></span>');
INSERT INTO `t_newscontents` VALUES ('28c793ca-7b56-4151-8d11-9c796a32e652', '这是公司的最新资讯<br />');
INSERT INTO `t_newscontents` VALUES ('409a21ed-cd0c-4c6a-94f9-c52ac5c099dc', '公司资讯一<br />');
INSERT INTO `t_newscontents` VALUES ('5969b251-9e8a-4b6e-84e2-e44372bb3243', '服务条款<br />');
INSERT INTO `t_newscontents` VALUES ('90a2041d-f98d-4b2b-9acf-6e7557c8d46d', '&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"line-height: 22px;\"><span style=\"font-size: 14px;\">面向党政机关、事业单位、院校、军队等各类行业教学培训机构开展的继续教育、职业认证培训、             学历教育、企业内训提供含软硬件、带宽等一体化的&quot;云计算&quot;应用平台租赁与&quot;一站式&quot;在线             培训全业务流程服务。</span></span>\r\n<div style=\"text-align: center;\"><input width=\"643\" type=\"image\" height=\"663\" src=\"/tbedu/userfiles/image/ourbusspic.jpg\" /></div>');
INSERT INTO `t_newscontents` VALUES ('b7c72535-6269-4b1c-8cf2-952b9fd657f1', '<p> &nbsp; &nbsp; &nbsp; &nbsp;第二条新闻<br /></p>');
INSERT INTO `t_newscontents` VALUES ('c5980155-c82f-46cf-9bcb-714b02f4ad51', '<table width=\"700\" height=\"67\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n    <tbody>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" rowspan=\"2\" style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/1.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 16px;\"><span style=\"color: rgb(0, 0, 255);\"><span style=\"font-size: 18px;\">培训资讯管理系统</span></span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"font-size: 14px;\"><br />\r\n            发布培训及其相关信息，政策法规、行业动态以及培训结果公示等服务。</span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" rowspan=\"2\" style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/2.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">在线报名缴费系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"font-size: 14px;\"><br />\r\n            个人或集体报名、缴费、充值、结算。</span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/3.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">在线学习系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"line-height: 22px;\"><span style=\"font-size: 14px;\"><br />\r\n            在线选课、在线课程学习、在线笔记、在线作业、课堂练习、在线讨论、在线咨询、                 实时课堂、在线评价和投票等。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/4.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">考试评测系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"line-height: 22px;\"><span style=\"font-size: 14px;\"><br />\r\n            题库管理系统、测评和考试管理、测评统计和分析等。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/5.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">课件资源管理系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"font-size: 14px;\"><span style=\"line-height: 22px;\"><br />\r\n            课程和课件管理、知识库管理等。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/6.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">教务管理系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"font-size: 14px;\"><span style=\"line-height: 22px;\"><br />\r\n            师资管理、班级管理、作业和练习管理、作业和试卷批阅、答疑、结业审核等、学习记录等。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/7.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">培训信息管理系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"font-size: 14px;\"><span style=\"line-height: 22px;\"><br />\r\n            分级、分地区、分权限的培训信息管理。通过平台开展档案管理、培训机构管理、培训办班                 计划申报、核准、公布等工作，以及培训质量评估、培训需求情况调查等。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/8.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">知识社区管理系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"font-size: 14px;\"><span style=\"line-height: 22px;\"><br />\r\n            集在线答疑、博客日志、个人空间、群组功能、问题研讨、论坛社区、调查反馈、协同通讯、                 人生励志、积分奖励等功能在内的网上家园和交流社区。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/9.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">电子学时/学分/证书网络验证系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"font-size: 14px;\"><span style=\"line-height: 22px;\"><br />\r\n            对网上和现场的各类培训的学时学分进行统一整合管理，各级主管单位和社会公众可进行统                 一的学时学分认定和验证，并提供电子学时/学分和各类证书网上验证和查询。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"60\" valign=\"top\" height=\"60\" style=\"text-align: center;\" rowspan=\"2\"><span style=\"color: rgb(0, 0, 255);\"><img width=\"49\" height=\"44\" alt=\"\" src=\"/tbedu/userfiles/image/10.gif\" /><br />\r\n            </span></td>\r\n            <td>\r\n            <h3><span style=\"color: rgb(0, 0, 255);\"><br />\r\n            </span><span style=\"font-size: 18px;\"><span style=\"color: rgb(0, 0, 255);\">运营服务系统</span></span></h3>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td><span style=\"line-height: 22px;\"><span style=\"font-size: 14px;\"><br />\r\n            客服服务、答疑管理、批量数据处理、证书管理、统计管理、财务管理、系统管理等。</span></span><br />\r\n            <hr width=\"100%\" size=\"1\" color=\"#9f9990\" style=\"border:1 dashed #987cb9\" />\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<br />');
INSERT INTO `t_newscontents` VALUES ('c85c8c3c-9bc4-4102-8926-07dec9f6b731', '<div style=\"text-align: left;\"><img width=\"657\" height=\"1047\" src=\"/tbedu/userfiles/image/serverlc.gif\" alt=\"\" /></div>');
INSERT INTO `t_newscontents` VALUES ('e35514a3-c12e-404c-83ea-73fab947001b', '<span style=\"font-size: 15px;\"><span style=\"line-height: 26px;\">&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-size: 14px;\"><span style=\"line-height: 26px;\">河南天博科技发展有限公司的原名称为河南凯立达科技发展有限公司，于2002年进行了更名，主要从事智能安防、智能家居等物联网领域技术研发，电信帐务系统、 教育、煤矿、地理信息等方面的软件开发，网络通信工程设计、安装调试及技术培训、服务等工作。<br />\r\n&nbsp;&nbsp;&nbsp; 公司与河南财经政法大学、中国人民解放军信息工程大学等结为技术合作及战略联盟。<br />\r\n&nbsp;&nbsp;&nbsp; 公司的理念：以技术求质量，以创新求发展，以服务求信誉，以诚信求合作</span><br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; 服务电话：18838061533 <br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; Email：tboedu@sohu.com<br />\r\n</span><br />');
INSERT INTO `t_newscontents` VALUES ('e6f2d45d-4605-493d-b2ad-5e2661c1ec88', '网站地图<br />');
INSERT INTO `t_newscontents` VALUES ('f9773b1c-b6db-454e-845b-f4cecc1bc275', '招贤纳士<br />');

-- ----------------------------
-- Table structure for `t_newstype`
-- ----------------------------
DROP TABLE IF EXISTS `t_newstype`;
CREATE TABLE `t_newstype` (
  `Fid` varchar(40) NOT NULL,
  `Fname` varchar(60) DEFAULT NULL,
  `Fcode` varchar(20) DEFAULT NULL,
  `Ftype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Fid`),
  UNIQUE KEY `Fid` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_newstype
-- ----------------------------
INSERT INTO `t_newstype` VALUES ('1eee821f341b43c701341b5563ec0004', '省内', 'NEWTYPE1', '');
INSERT INTO `t_newstype` VALUES ('1eee821f341b6b3201341b6fd64f0002', '国内', 'NEWTYPE2', '');
INSERT INTO `t_newstype` VALUES ('1eee821f341b6b3201341b7031ec0003', '国外', 'NEWTYPE3', '');

-- ----------------------------
-- Table structure for `t_operatelog`
-- ----------------------------
DROP TABLE IF EXISTS `t_operatelog`;
CREATE TABLE `t_operatelog` (
  `fid` varchar(40) NOT NULL,
  `Faccount` varchar(30) DEFAULT NULL,
  `Fcontents` varchar(250) DEFAULT NULL,
  `FregionId` varchar(40) DEFAULT NULL,
  `FleagueName` varchar(60) DEFAULT NULL,
  `FcreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FKC7661BEB10277186` (`FregionId`),
  CONSTRAINT `FKC7661BEB10277186` FOREIGN KEY (`FregionId`) REFERENCES `t_cityregion` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operatelog
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `fid` varchar(40) NOT NULL,
  `FroleName` varchar(30) NOT NULL,
  `FregionId` varchar(40) DEFAULT NULL,
  `FleagueId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK94C74D8110277186` (`FregionId`),
  KEY `FK94C74D8157BF14F1` (`FleagueId`),
  CONSTRAINT `FK94C74D8110277186` FOREIGN KEY (`FregionId`) REFERENCES `t_cityregion` (`Fid`),
  CONSTRAINT `FK94C74D8157BF14F1` FOREIGN KEY (`FleagueId`) REFERENCES `t_league` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('40288b8a34219e9e013421a687eb0016', '新闻审核者', null, null);
INSERT INTO `t_role` VALUES ('43958C98-5DD9-4C50-B18B-F33017922041', '管理员', null, null);
INSERT INTO `t_role` VALUES ('bd1b29bc358670f30135e5a19f8e063d', '普通管理员', null, null);

-- ----------------------------
-- Table structure for `t_rolemoudle`
-- ----------------------------
DROP TABLE IF EXISTS `t_rolemoudle`;
CREATE TABLE `t_rolemoudle` (
  `fid` varchar(40) NOT NULL,
  `FmoudleId` varchar(40) DEFAULT NULL,
  `FroleId` varchar(40) DEFAULT NULL,
  `FoperateList` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK151575CBC6A32DA1` (`FmoudleId`),
  KEY `FK151575CB92FCDE39` (`FroleId`),
  CONSTRAINT `FK151575CB92FCDE39` FOREIGN KEY (`FroleId`) REFERENCES `t_role` (`fid`),
  CONSTRAINT `FK151575CBC6A32DA1` FOREIGN KEY (`FmoudleId`) REFERENCES `t_moudle` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rolemoudle
-- ----------------------------
INSERT INTO `t_rolemoudle` VALUES ('040C699F-3C1C-494E-8744-48025F275B81', '318CAC2F-BEFE-4390-A905-BFC0D7856465', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('167DFC36-6DDE-4DBA-ABCB-976A3BE2CFF0', 'E048A1B0-4DB4-49CD-9F58-775D998FC82D', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('1eee82fc39fad0480139fb4465e20003', 'B86724FA-D255-4C10-A2C6-E88B41671F1F', '40288b8a34219e9e013421a687eb0016', null);
INSERT INTO `t_rolemoudle` VALUES ('1eee82fc39fad0480139fb4465ff0004', '856778CE-FF71-41EE-8892-6E4520A8941E', '40288b8a34219e9e013421a687eb0016', null);
INSERT INTO `t_rolemoudle` VALUES ('1eee82fc39fad0480139fb4466280005', '318CAC2F-BEFE-4390-A905-BFC0D7856465', '40288b8a34219e9e013421a687eb0016', null);
INSERT INTO `t_rolemoudle` VALUES ('2EABC761-44DD-478C-AD02-0126A0EC50AE', 'AC182097-530B-4AF8-AFCE-B4683CE50C7C', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('2F7CA583-7464-450A-BD7D-298CDBB804F6', '8D750B62-7B0A-480A-BD7E-13F3511EB5C2', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('3D837591-1E05-4AC4-AEB6-6B6AA21842C3', '856778CE-FF71-41EE-8892-6E4520A8941E', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('3E03BFFD-C8D7-40C9-81D1-5E5ECB9CF724', '2645EE9A-DF12-4056-8116-0F8014C1552B', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('420E3F64-BF33-48C6-8056-7ADE48BD5B45', 'F87E1990-6CFD-4343-8F12-337B160D9E5C', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('49671583-8B88-4FA6-9F1F-BC34F8038484', '27186674-FBAF-4C72-A269-0A90E9083F33', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('5B0C7273-DC2A-430B-91FC-FD6C64FDBBB1', '12942FDB-DFCC-4AD2-A11A-CC0369698DFE', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('5C58E01D-03AB-4D57-9AED-3776C9D75A4D', '739B2861-1957-4718-84C4-DB1D2EC19D4E', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('615B31FD-CC31-479F-97D8-BE269E69100E', 'B86724FA-D255-4C10-A2C6-E88B41671F1F', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('713203BF-334C-43C3-A94C-DEDE6DF2F613', '5BBBB51E-21F8-4AB2-83BF-B69FE44B1EC5', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('A06D49FF-5243-4FA1-BA4C-08DF21997D51', '8B72F74B-B05B-4F8B-A3E2-1CC46B80A041', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('A2ABC563-C73E-4F4A-8F19-3A358D1C5C1F', '2CBED236-2FFD-47E7-8D58-664E1E3EA1E8', '43958C98-5DD9-4C50-B18B-F33017922041', '');
INSERT INTO `t_rolemoudle` VALUES ('A2DD2D17-FD44-4457-A847-DF374B69C21E', 'FDAE88B9-3547-4835-BA39-D8EE5876EF01', '43958C98-5DD9-4C50-B18B-F33017922041', '');

-- ----------------------------
-- Table structure for `t_trade`
-- ----------------------------
DROP TABLE IF EXISTS `t_trade`;
CREATE TABLE `t_trade` (
  `Fid` varchar(40) NOT NULL,
  `FtradeName` varchar(60) DEFAULT NULL,
  `Fcode` varchar(20) DEFAULT NULL,
  `FshortName` varchar(30) DEFAULT NULL,
  `Furl` varchar(200) DEFAULT NULL,
  `FimageFile` varchar(200) DEFAULT NULL,
  `Fcomments` varchar(200) DEFAULT NULL,
  `FcityRegionId` varchar(40) DEFAULT NULL,
  `FleagueId` varchar(40) DEFAULT NULL,
  `FitemId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Fid`),
  KEY `FK43FC5B9D637CCF1` (`FcityRegionId`),
  KEY `FK43FC5B9FE173802` (`FitemId`),
  KEY `FK43FC5B957BF14F1` (`FleagueId`),
  CONSTRAINT `FK43FC5B957BF14F1` FOREIGN KEY (`FleagueId`) REFERENCES `t_league` (`Fid`),
  CONSTRAINT `FK43FC5B9D637CCF1` FOREIGN KEY (`FcityRegionId`) REFERENCES `t_cityregion` (`Fid`),
  CONSTRAINT `FK43FC5B9FE173802` FOREIGN KEY (`FitemId`) REFERENCES `t_items` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade
-- ----------------------------
INSERT INTO `t_trade` VALUES ('1eee821f341b43c701341b61a4f2000e', '行业一', 'TRADE01', '', '', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_trade` VALUES ('1eee821f341b43c701341b6212fe000f', '行业二', 'TRADE02', '', '', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');
INSERT INTO `t_trade` VALUES ('1eee821f341b43c701341b62695c0010', '行业三', 'TRADE03', '', '', '', '', '7CA766E7-26E0-4FF5-B876-84DEA53F647B', '1eee82ff30886baa0130887bd1cc0007', '1eee820330ad49aa0130ad4a6e770002');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `fid` varchar(40) NOT NULL,
  `Faccount` varchar(30) NOT NULL,
  `Fname` varchar(60) NOT NULL,
  `Fpassword` varchar(255) NOT NULL,
  `FaccountType` varchar(20) NOT NULL,
  `Fsex` varchar(2) DEFAULT NULL,
  `Fage` int(11) DEFAULT NULL,
  `Ftelephone` varchar(20) DEFAULT NULL,
  `Femail` varchar(60) DEFAULT NULL,
  `Fstatus` varchar(6) DEFAULT NULL,
  `FregionId` varchar(40) DEFAULT NULL,
  `FleagueId` varchar(40) DEFAULT NULL,
  `FisAdmin` bit(1) DEFAULT NULL,
  `FloginSum` int(11) DEFAULT NULL,
  `FlastLoginTime` datetime DEFAULT NULL,
  `FcreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK94C8B8D610277186` (`FregionId`),
  KEY `FK94C8B8D657BF14F1` (`FleagueId`),
  CONSTRAINT `FK94C8B8D610277186` FOREIGN KEY (`FregionId`) REFERENCES `t_cityregion` (`Fid`),
  CONSTRAINT `FK94C8B8D657BF14F1` FOREIGN KEY (`FleagueId`) REFERENCES `t_league` (`Fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', 'admin', '系统管理员', 'MTIzNDU2', 'adm', null, '0', '', '', 's1', '1eee82ff30886baa0130887a97940005', null, '\0', '1024', '2015-09-28 17:27:37', '2011-05-31 15:54:34');
INSERT INTO `t_user` VALUES ('40288b8a34219e9e013421a6ebf60017', 'shenhe', '审核者', 'MTIzNDU2', 'mana', null, '0', '', '', 's1', '1eee82ff30886baa0130887a97940005', null, '\0', '1120', '2012-09-26 16:10:03', '2011-12-09 15:08:34');

-- ----------------------------
-- Table structure for `t_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `t_userrole`;
CREATE TABLE `t_userrole` (
  `fid` varchar(40) NOT NULL,
  `FuserId` varchar(40) DEFAULT NULL,
  `FroleId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FK1D9B526C985233A3` (`FuserId`),
  KEY `FK1D9B526C92FCDE39` (`FroleId`),
  CONSTRAINT `FK1D9B526C92FCDE39` FOREIGN KEY (`FroleId`) REFERENCES `t_role` (`fid`),
  CONSTRAINT `FK1D9B526C985233A3` FOREIGN KEY (`FuserId`) REFERENCES `t_user` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userrole
-- ----------------------------
INSERT INTO `t_userrole` VALUES ('1eee82fc39fad0480139fb42ad300002', '40288b8a34219e9e013421a6ebf60017', '40288b8a34219e9e013421a687eb0016');
INSERT INTO `t_userrole` VALUES ('A6561FC1-43FE-4151-95FD-345943D51C12', '06996C4A-8C50-4BBA-B7B7-B3340B04DE0B', '43958C98-5DD9-4C50-B18B-F33017922041');
