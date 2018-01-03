DROP TABLE IF EXISTS `{{vote}}`;
CREATE TABLE `{{vote}}` (
  `voteid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '投票描述',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `isvisible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '投票结果查看权限，0：所有人可见、1：投票后可见',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发布者UID',
  `deadlinetype` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '截至日期类型：0自定义，1周，2月，3半年，4年',
  `relatedmodule` varchar(64) NOT NULL DEFAULT '' COMMENT '模块名称',
  `relatedid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '该模块表下id列的值',
  `deptid` text NOT NULL COMMENT '阅读范围部门',
  `positionid` text NOT NULL COMMENT '阅读范围职位',
  `roleid` text NOT NULL COMMENT '阅读范围角色',
  `scopeuid` text NOT NULL COMMENT '阅读范围人员',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`voteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{vote_item}}`;
CREATE TABLE `{{vote_item}}` (
  `itemid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票项id',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '投票id',
  `topicid` int(11) unsigned NOT NULL COMMENT '投票题目 id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '投票项内容',
  `number` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '投票数',
  `picpath` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{vote_item_count}}`;
CREATE TABLE `{{vote_item_count}}` (
  `voteid` mediumint(9) unsigned NOT NULL COMMENT '投票 id',
  `topicid` mediumint(9) unsigned NOT NULL COMMENT '投票话题 id',
  `itemid` mediumint(8) unsigned NOT NULL COMMENT '投票项ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  UNIQUE KEY `itemid` (`itemid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{vote_topic}}`;
CREATE TABLE `{{vote_topic}}` (
  `topicid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `voteid` mediumint(8) unsigned NOT NULL COMMENT '投票 id',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '投票题目标题',
  `type` tinyint(4) NOT NULL COMMENT '投票题目类型：1、内容；2、图片',
  `maxselectnum` tinyint(4) unsigned NOT NULL COMMENT '是否多选: 0：单选；1：多选',
  `itemnum` tinyint(4) NOT NULL COMMENT '选项个数',
  PRIMARY KEY (`topicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `{{reader}}`  (
  `readerid` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(20) NOT NULL COMMENT '模块名',
  `moduleid` mediumint(8) unsigned NOT NULL COMMENT '关联模块 id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户 id',
  PRIMARY KEY (`readerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阅读记录表';

REPLACE INTO `{{setting}}` (`skey`,`svalue`) VALUES ('votethumbenable' , '0');
REPLACE INTO `{{setting}}` (`skey`,`svalue`) VALUES ('votethumbwh' , '0,0');
INSERT INTO `{{nav}}`(`pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`) VALUES ('5','调查投票','vote/default/index','0','1','0','7','vote');
INSERT INTO `{{menu}}`(`name`, `pid`, `m`, `c`, `a`, `param`, `sort`, `disabled`) VALUES ('调查投票','0','vote','dashboard','index','','15','0');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('vote_publish_message','投票发布提醒','vote','vote/default/New message title','vote/default/New message content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('vote_update_message','投票更新提醒','vote','vote/default/Update message title','vote/default/Update message content','1','1','1','2');

DROP TABLE IF EXISTS {{activity}};
CREATE TABLE IF NOT EXISTS {{activity}} (
  `activityid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `sponsor` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动发起者',
  `begin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `address` varchar(255) DEFAULT NULL COMMENT '活动地点',
  `whethersignup` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否开启报名（1.是，2.否）',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `attachmentid` text NOT NULL COMMENT '附件ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动类型，1为发布2为草稿3为归档',
  `deptid` text NOT NULL COMMENT '发布范围部门',
  `positionid` text NOT NULL COMMENT '发布范围职位',
  `roleid` text NOT NULL COMMENT '发布范围角色',
  `uid` text NOT NULL COMMENT '发布范围人员',
  PRIMARY KEY (`activityid`),
  KEY `TITLE` (`title`) USING BTREE,
  KEY `PROVIDER` (`sponsor`) USING BTREE,
  KEY `NEWS_TIME` (`addtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS {{form}};
CREATE TABLE {{form}} (
  `formid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动表单id',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '关联的模块',
  `moduleid` int(11) unsigned NOT NULL COMMENT '模块id',
  `formtitle` varchar(255) NOT NULL DEFAULT '' COMMENT '表单标题',
  `formname` varchar(255) NOT NULL DEFAULT '' COMMENT '表单名',
  `fieldmax` mediumint(8) unsigned NOT NULL COMMENT '字段的最大编号',
  `addtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`formid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '表单定义表';

DROP TABLE IF EXISTS {{form_field}};
CREATE TABLE {{form_field}} (
  `fieldid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段id',
  `formid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单id',
  `fieldtitle` varchar(255) NOT NULL DEFAULT '' COMMENT '字段标题',
  `fieldname` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名',
  `fieldtype` int(11) NOT NULL DEFAULT '0' COMMENT '字段类型。0单行文本、1多行文本、2数字、3布尔值',
  `fieldrule` int(11) NOT NULL DEFAULT '0' COMMENT '字段规则。0无规则、1不能为空、2选是则必填备注',
  `fieldattr` varchar(50) NOT NULL COMMENT '字段属性',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单字段定义表';


DROP TABLE IF EXISTS {{activity_uid}};
CREATE TABLE {{activity_uid}} (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activityid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活动、用户关联表';


INSERT INTO `{{nav}}`(`pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`) VALUES ('5','活动中心','activity/manage/index','0','1','0','6','activity');
INSERT INTO `{{menu}}`(`name`, `pid`, `m`, `c`, `a`, `param`, `sort`, `disabled`) VALUES ('活动中心','0','activity','dashboard','index','','16','0');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('activity_publish_message','活动发布提醒','activity','activity/default/New message title','activity/default/New message content','1','0','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('activity_arrangement_message','活动安排提醒','activity','activity/default/New arrange message title','activity/default/New arrange message content','1','0','1','2');
REPLACE INTO `{{setting}}`(`skey`, `svalue`) VALUES('activityconfig', 'a:7:{i:0;a:4:{s:10:"fieldtitle";s:6:"公司";s:9:"fieldname";s:5:"data1";s:9:"fieldtype";s:1:"0";s:9:"fieldrule";s:1:"1";}i:1;a:4:{s:10:"fieldtitle";s:6:"职位";s:9:"fieldname";s:5:"data2";s:9:"fieldtype";s:1:"0";s:9:"fieldrule";s:1:"1";}i:2;a:4:{s:10:"fieldtitle";s:18:"安排车辆前往";s:9:"fieldname";s:5:"data3";s:9:"fieldtype";s:1:"3";s:9:"fieldrule";s:1:"2";}i:3;a:4:{s:10:"fieldtitle";s:18:"安排车辆返回";s:9:"fieldname";s:5:"data4";s:9:"fieldtype";s:1:"3";s:9:"fieldrule";s:1:"2";}i:4;a:4:{s:10:"fieldtitle";s:12:"安排用餐";s:9:"fieldname";s:5:"data5";s:9:"fieldtype";s:1:"3";s:9:"fieldrule";s:1:"2";}i:5;a:4:{s:10:"fieldtitle";s:12:"安排住宿";s:9:"fieldname";s:5:"data6";s:9:"fieldtype";s:1:"3";s:9:"fieldrule";s:1:"2";}i:6;a:4:{s:10:"fieldtitle";s:12:"其他备注";s:9:"fieldname";s:5:"data7";s:9:"fieldtype";s:1:"3";s:9:"fieldrule";s:1:"2";}}');

INSERT INTO `{{node_related}}` VALUES ('1', 'vote', 'manager', '', '0'),
('1', 'vote', 'publish', '', '0'),
('1', 'vote', 'view', '', '0'),
('2', 'vote', 'manager', '', '0'),
('2', 'vote', 'publish', '', '0'),
('2', 'vote', 'view', '', '0'),
('3', 'vote', 'view', '', '0');

INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('vote_survey', '调查投票', 'vote', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');
INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('activity_center', '活动中心', 'activity', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');