/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : film_ticket_database

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-01-04 10:33:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `film`
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `filmName` varchar(50) NOT NULL,
  `kindId` int(4) DEFAULT NULL,
  `ticketNum` int(11) DEFAULT NULL,
  `ticketPrice` float(8,0) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `detail` text,
  PRIMARY KEY (`id`),
  KEY `FK2FF584E5BF489E` (`kindId`),
  CONSTRAINT `film_kind` FOREIGN KEY (`kindId`) REFERENCES `kind` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2FF584E5BF489E` FOREIGN KEY (`kindId`) REFERENCES `kind` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('1', '三傻大闹好莱坞', '1', '255', '35', 'comedy_1.jpg', ' 法兰、拉杜与兰彻是皇家工程学院的学生，三人共居一室，结为好友。在以严格著称的学院里，兰彻是个非常与众不同的学生，他不死记硬背，甚至还公然顶撞校长“病毒”，质疑他的教学方法。他不仅鼓动法兰与拉杜去勇敢追寻理想，还劝说校长的二女儿碧雅离开满眼铜臭的未婚夫。兰彻的特立独行引起了模范学生“无声火”的不满，他约定十年后再与兰彻一决高下，看哪种生活方式更能取得成功。');
INSERT INTO `film` VALUES ('2', '地心引力', '2', '270', '30', 'adventure_1.jpg', '深邃浩瀚的外层空间，蔚蓝的地球与深不见底、漆黑一片的宇宙形成鲜明对比。一台隶属美国的空间站，数名宇航人员正进行太空漫步，对所属卫星做着例行检查。初上太空的瑞安·斯通博士在经验丰富的宇航员麦特·科沃斯基的协助下，有条不紊地检查每一个部件。此次是科沃斯基退休前的最后一次飞行，他幽默风趣地活跃着团队的氛围。就在此时，休士顿总部传来骇人消息，不久前行将废弃俄罗斯卫星被导弹击毁，碎片以超过子弹的速度在地球轨道上散开，并意外击中其他卫星，引起连锁反应制造了新的碎片。');
INSERT INTO `film` VALUES ('3', '十三度凶间', '3', '290', '20', 'fantasy_1.jpg', '十三，一个听起来就有些阴冷的数字。在一座大厦的第十三层，科学家道格拉斯•霍尔和汉农•富勒用电脑模拟出一个逼真的1937年的洛杉矶，他们可以通过电脑进入这个虚拟世界，真实地体验1937年的生活与自己。然而一个夜里，富勒被人杀死，种种线索都表明似乎是霍尔所为。可霍尔却对当天夜里的事情全无记忆。这时一个自称是富勒女儿的女人又神秘出现，可霍尔从未听富勒说过自己有女儿，为了找到凶手明晓真相');
INSERT INTO `film` VALUES ('4', '谍影重重5', '4', '300', '25', 'suspense_1.jpg', '在“后斯诺登时代”，伯恩重出江湖，对抗大反派Asset。故事最开始将在希腊展开，这里是民主政治的诞生地，同时这个国家现在面临严重的经济危机，足以对欧洲经济圈造成巨大威胁，最后故事将在拉斯维加斯结束。');
INSERT INTO `film` VALUES ('5', '完美的世界', '5', '300', '28', 'thrillers_1.jpg', '单亲孩子菲利普·佩里的母亲对他管教甚严，因此他失去了很多孩子应当得到的乐趣。一天，附近监狱里的两名逃犯闯入菲利普家。特里想对菲利普的母亲非礼，被另一个囚犯布什阻止了，俩人挟持菲利普作为人质匆匆逃走。 　　正面临大选的州长为了挽回自己的声誉和拉拢选票，立刻命令警方追捕逃犯。于是，警方成立了以瑞德·加尼特和女犯罪学专家萨利·格柏及神枪手三人为首的追捕小组。瑞德·加尼特与罪犯布什打过交道，那时布什尚是孩子，因为犯有暴力行为，瑞德把其父送入教养所，最终使布什也因无人教养而沦为罪犯。 　　两名逃犯因关系紧张而发生冲突，最终，布什杀死了特里并带着菲利普继续驾车逃跑。途中，布什与菲利普建立了一种如同父子般的关系，布什给小男孩带来了他从未享受过的生活乐趣。布什希望到阿拉斯加去开始新的生活，路上，布什让菲利普把母亲禁止他做的事一一列出并准备让他逐个尝试。他们闯入一户人家，用枪逼着主人拿出食品充饥；又偷了一套万圣节的脸谱和衣服让菲利普穿着玩；布什还让菲利普坐在车顶上享受开车乐趣。后来，他们遇到了黑人农工迈克并应邀到他家里过夜。');
INSERT INTO `film` VALUES ('6', '冲出亚马逊', '6', '300', '28', 'record_1.jpg', '1999年，两名中国特种兵参加了国际猎人学校的特种兵训练，他们经受了种种极端考验，为中国特种兵赢得了荣誉，本片根据他们的故事改编而成。1999年8月，中国特种兵王辉（侯勇 饰）与胡小龙（穆立新 饰）远赴拉美的亚马逊河流域，在科林少将的猎人学校中接受严酷的训练。猎人学校有着高达六成的淘汰率，为了不让国旗被降下，王辉与胡小龙决心坚持到底。猎人学校的生活就是训练，他们在真子弹飞过的战地穿梭、接受饥饿训练等近乎人体生理极限的挑战，连学校医官丽娜也不忍这种不人道的方式而频频向教官抗议。在教官们化装成匪徒的最终考验中，当地的黑社会因自感生存空间被压缩向猎人学校进攻，并绑架了科林的女儿丽娜，王辉与胡小龙运用智慧和勇敢，拯救了危局。');
INSERT INTO `film` VALUES ('7', '拯救大兵瑞恩', '7', '300', '35', 'war_1.jpg', '本片以1944年6月6日诺曼底登陆为背景：美国依阿华州瑞恩太太的三个儿子先后在战争中为国捐躯，小儿子瑞恩在前线又与部队失去了联系，下落不明，为了防止后方人民产生厌战情绪，美军决定派遣一支由上尉约翰.米勒（汤姆.汉克斯饰）率领的小分队深入敌后寻找瑞恩。8人冒着生命危险去寻找一个不知生死的人，迎接他们的将是战火的洗礼和生命价值的重新认识。');
INSERT INTO `film` VALUES ('8', '生死狙击', '8', '300', '25', 'west_1.jpg', '美国退役优秀狙击手鲍勃正在阿肯色州享受退役后的休闲时光，不料，平地生波，他的前上司前来拜访他，希望他能接受一项新的任务，在总统街头演讲那天充当隐形狙击手暗中保护总统。虽然十万分不情愿，但禁不住上司的游说，鲍勃最终答应了。总统演讲那天，鲍勃正在仔细观察着四周情况时，突然会场遭到枪手袭击，总统身边的衣索比亚主教被杀。鲍勃被当成暗杀者遭遇警方追捕。心知成了替罪羔羊，鲍勃在身中两枪的情况下奋力逃走了。鲍勃此时唯一的出路就是找出幕后的真凶，为自己洗刷罪名。');
INSERT INTO `film` VALUES ('9', '泰坦尼克号', '9', '300', '35', 'love_1.jpg', '影片以1912年泰坦尼克号邮轮在其处女启航时触礁冰山而沉没的事件为背景，描述了处于不同阶层的两个人——穷画家杰克和贵族女露丝抛弃世俗的偏见坠入爱河，最终杰克把生命的机会让给了露丝的感人故事。');
INSERT INTO `film` VALUES ('10', '肖申克的救赎', '10', '300', '37', 'story_1.jpg', '20世纪40年代末，小有成就的青年银行家安迪因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德，请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯人中间也渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进。而关于其罪行的真相，似乎更使这一切朝前推进了一步……本片根据著名作家斯蒂芬·金的原著改编。');

-- ----------------------------
-- Table structure for `kind`
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kindName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kind
-- ----------------------------
INSERT INTO `kind` VALUES ('1', '喜剧');
INSERT INTO `kind` VALUES ('2', '冒险');
INSERT INTO `kind` VALUES ('3', '幻想');
INSERT INTO `kind` VALUES ('4', '悬念');
INSERT INTO `kind` VALUES ('5', '惊悚');
INSERT INTO `kind` VALUES ('6', '记录');
INSERT INTO `kind` VALUES ('7', '战争');
INSERT INTO `kind` VALUES ('8', '西部');
INSERT INTO `kind` VALUES ('9', '爱情');
INSERT INTO `kind` VALUES ('10', '剧情');
INSERT INTO `kind` VALUES ('11', '恐怖');
INSERT INTO `kind` VALUES ('12', '动作');
INSERT INTO `kind` VALUES ('13', '科幻');
INSERT INTO `kind` VALUES ('14', '音乐');
INSERT INTO `kind` VALUES ('15', '家庭');
INSERT INTO `kind` VALUES ('16', '犯罪');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userId` int(4) DEFAULT NULL,
  `filmId` int(4) DEFAULT NULL,
  `snapTime` varchar(20) DEFAULT NULL,
  `ticketNum` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC8466C51DD34007E` (`filmId`),
  KEY `FKC8466C51F75D774C` (`userId`),
  CONSTRAINT `FKC8466C51DD34007E` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`),
  CONSTRAINT `FKC8466C51F75D774C` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `record_film` FOREIGN KEY (`filmId`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `record_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '1', '1', '2017-01-03 11:07', '1');
INSERT INTO `record` VALUES ('2', '2', '1', '2017-01-03 16:53', '10');
INSERT INTO `record` VALUES ('3', '2', '1', '2017-01-03 17:02', '10');
INSERT INTO `record` VALUES ('4', '3', '2', '2017-01-03 17:18', '10');
INSERT INTO `record` VALUES ('5', '4', '2', '2017-01-03 17:24', '10');
INSERT INTO `record` VALUES ('6', '3', '2', '2017-01-03 17:57', '10');
INSERT INTO `record` VALUES ('7', '3', '1', '2017-01-03 18:02', '10');
INSERT INTO `record` VALUES ('8', '2', '1', '2017-01-03 18:05', '1');
INSERT INTO `record` VALUES ('9', '2', '1', '2017-01-03 18:08', '1');
INSERT INTO `record` VALUES ('10', '3', '1', '2017-01-03 18:47', '10');
INSERT INTO `record` VALUES ('11', '4', '3', '2017-01-03 18:52', '10');
INSERT INTO `record` VALUES ('12', '3', '1', '2017-01-03 20:28', '1');
INSERT INTO `record` VALUES ('13', '3', '1', '2017-01-03 20:36', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123456@qq.com');
INSERT INTO `user` VALUES ('2', '123@qq.com');
INSERT INTO `user` VALUES ('3', '953045261@qq.com');
INSERT INTO `user` VALUES ('4', 'HaoBiaoSheng@163.com');
DROP TRIGGER IF EXISTS `film_record_trigger`;
DELIMITER ;;
CREATE TRIGGER `film_record_trigger` AFTER INSERT ON `record` FOR EACH ROW BEGIN
update film set ticketNum = ticketNum - new.ticketNum where id = new.filmId;
end
;;
DELIMITER ;
