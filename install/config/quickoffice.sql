DROP TABLE IF EXISTS `{{file}}`;
CREATE  TABLE IF NOT EXISTS `{{file}}` (
  `fid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '文件id' ,
  `pid` MEDIUMINT(8) NOT NULL DEFAULT '0' COMMENT '所属文件夹id' ,
  `uid` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id' ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '文件名' ,
  `type` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '类型：0文件，1文件夹' ,
  `remark` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '备注' ,
  `addtime` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间' ,
  `idpath` TEXT NOT NULL COMMENT '层级标识' ,
  `size` INT(10) NOT NULL DEFAULT '0' COMMENT '大小(单位kb)' ,
  `isdel` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否已删除到回收站' ,
  `belong` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属：0个人文件，1公司文件' ,
  `cloudid` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '对应云盘id（0表示本地）',
  PRIMARY KEY (`fid`) ,
  KEY `PID` (`pid`) USING BTREE,
  KEY `UID` (`uid`) USING BTREE,
  KEY `ISDEL` (`isdel`) USING BTREE,
  KEY `BELONG` (`belong`) USING BTREE,
  KEY `CLOUDID` (`cloudid`) USING BTREE
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '文件柜文件/文件夹信息表';

DROP TABLE IF EXISTS `{{file_detail}}`;
CREATE  TABLE IF NOT EXISTS `{{file_detail}}` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '流水id' ,
  `fid` INT(11) NOT NULL DEFAULT '0' COMMENT '关联file表fid' ,
  `attachmentid` INT(11) NOT NULL DEFAULT '0' COMMENT '附件id' ,
  `filetype` CHAR(10) NOT NULL DEFAULT '' COMMENT '文件类型' ,
  `mark` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标记' ,
  `thumb` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '缩略图地址',
  PRIMARY KEY (`id`) ,
  UNIQUE KEY (`fid`),
  KEY `MARK` (`mark`) USING BTREE
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '文件柜文件信息表';

DROP TABLE IF EXISTS `{{file_share}}`;
CREATE  TABLE IF NOT EXISTS `{{file_share}}` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '共享id' ,
  `fid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联file表fid' ,
  `fromuid` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '共享人uid' ,
  `touids` TEXT NOT NULL COMMENT '共享给哪些uid' ,
  `todeptids` TEXT NOT NULL COMMENT '共享给哪些部门' ,
  `toposids` TEXT NOT NULL COMMENT '共享给哪些岗位' ,
  `toroleids` TEXT NOT NULL COMMENT '共享给哪些岗位角色' ,
  `uptime` INT(10) NOT NULL DEFAULT '0' COMMENT '更新共享时间（只针对添加文件而记录的更新时间）' ,
  PRIMARY KEY (`id`) ,
  KEY `FID` (`fid`) USING BTREE,
  KEY `FROMUID` (`fromuid`) USING BTREE,
  KEY `UPTIME` (`uptime`) USING BTREE
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '文件柜共享';

DROP TABLE IF EXISTS `{{file_reader}}`;
CREATE  TABLE IF NOT EXISTS `{{file_reader}}` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '流水id' ,
  `fromuid` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '共享人uid' ,
  `uid` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '读者uid' ,
  `viewtime` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '查看时间' ,
  PRIMARY KEY (`id`),
  KEY `UID` (`uid`) USING BTREE,
  KEY `VIEWTIME` (`viewtime`) USING BTREE
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '文件柜文件共享已读信息存储';

DROP TABLE IF EXISTS `{{file_dir_access}}`;
CREATE  TABLE IF NOT EXISTS `{{file_dir_access}}` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '流水id' ,
  `fid` INT(11) NOT NULL COMMENT '文件夹id' ,
  `rdeptids` TEXT NOT NULL COMMENT '可读的部门ids' ,
  `rposids` TEXT NOT NULL COMMENT '可读的岗位ids' ,
  `ruids` TEXT NOT NULL COMMENT '可读的uids' ,
  `rroleids` TEXT NOT NULL COMMENT '可读的角色roleids' ,
  `wdeptids` TEXT NOT NULL COMMENT '可写的部门ids' ,
  `wposids` TEXT NOT NULL COMMENT '可写的岗位ids' ,
  `wuids` TEXT NOT NULL COMMENT '可写的uids' ,
  `wroleids` TEXT NOT NULL COMMENT '可写的roleids' ,
  PRIMARY KEY (`id`),
  UNIQUE KEY( `fid` )
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '公司文件柜读写权限（包括云盘权限）';

DROP TABLE IF EXISTS `{{file_trash}}`;
CREATE  TABLE IF NOT EXISTS `{{file_trash}}` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '流水' ,
  `fid` INT(11) NOT NULL DEFAULT '0' COMMENT '关联file表fid' ,
  `deltime` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间' ,
  PRIMARY KEY (`id`),
  KEY `FID` (`fid`) USING BTREE,
  KEY `DELTIME` (`deltime`) USING BTREE
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '回收站';

DROP TABLE IF EXISTS `{{file_cloud_set}}`;
CREATE  TABLE IF NOT EXISTS `{{file_cloud_set}}` (
  `id` SMALLINT(5) NOT NULL AUTO_INCREMENT COMMENT '流水id' ,
  `server` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '服务器' ,
  `keyid` CHAR(20) NOT NULL DEFAULT '' COMMENT '验证keyid' ,
  `keysecret` CHAR(50) NOT NULL DEFAULT '' COMMENT '验证码' ,
  `endpoint` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '终端请求连接' ,
  `bucket` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '云盘唯一标识符' ,
  `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否开通成功' ,
  PRIMARY KEY (`id`)
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '云盘设置';

DROP TABLE IF EXISTS `{{file_capacity}}`;
CREATE  TABLE IF NOT EXISTS `{{file_capacity}}` (
  `id` SMALLINT(5) NOT NULL AUTO_INCREMENT COMMENT '流水id' ,
  `size` INT(10) NOT NULL DEFAULT '0' COMMENT '大小(单位MB)' ,
  `deptids` TEXT NOT NULL COMMENT '部门ids' ,
  `posids` TEXT NOT NULL COMMENT '岗位ids' ,
  `uids` TEXT NOT NULL COMMENT 'uids' ,
  `roleids` TEXT NOT NULL COMMENT '角色ids' ,
  `addtime` INT(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ADDTIME` (`addtime`) USING BTREE
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '容量分配表';

DROP TABLE IF EXISTS `{{file_dynamic}}`;
CREATE  TABLE IF NOT EXISTS `{{file_dynamic}}` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '流水id' ,
  `fid` INT(11) NOT NULL DEFAULT '0' COMMENT '关联file表fid' ,
  `uid` MEDIUMINT(8) NOT NULL DEFAULT '0' COMMENT '所属用户id',
  `content` TEXT NOT NULL COMMENT '动态内容' ,
  `touids` TEXT NOT NULL COMMENT '用户id串' ,
  `todeptids` TEXT NOT NULL COMMENT '部门id串' ,
  `toposids` TEXT NOT NULL COMMENT '岗位id串' ,
  `time` INT(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `FID` (`fid`) USING BTREE,
  KEY `TIME` (`time`) USING BTREE
)ENGINE = MyISAM DEFAULT CHARACTER SET = utf8 COMMENT = '文件柜动态表';

REPLACE INTO {{setting}} (`skey` ,`svalue`) VALUES ('filedefsize', '50');
REPLACE INTO {{setting}} (`skey` ,`svalue`) VALUES ('filecompmanager', '');
REPLACE INTO {{setting}} (`skey` ,`svalue`) VALUES ('filecloudopen', '0');
REPLACE INTO {{setting}} (`skey` ,`svalue`) VALUES ('filecloudid', '0');
INSERT INTO `{{menu}}`(`name`, `pid`, `m`, `c`, `a`, `param`, `sort`, `disabled`) VALUES ('文件柜','0','file','dashboard','index','','4','0');
INSERT INTO `{{nav}}`(`pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`) VALUES ('3','文件柜','file/default/index','0','1','0','3','file');
INSERT INTO `{{menu_common}}`( `module`, `name`, `url`, `description`, `sort`, `iscommon`) VALUES ('file','文件柜','file/default/index','提供企业文件存储','13','0');
INSERT INTO `{{cron}}` (`available`, `type`,`module`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES ( '1', 'system','file', '清空文件柜回收站15天前的文件', 'CronFileTrash.php', '1393516800', '1393603200', '-1', '-1', '0', '0');

DROP TABLE IF EXISTS `{{assignment}}`;
CREATE TABLE IF NOT EXISTS `{{assignment}}` (
  `assignmentid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '指派任务id',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '任务主题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '任务描述',
  `designeeuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '指派人uid',
  `chargeuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '负责人uid',
  `participantuid` text NOT NULL COMMENT '参与者uid,逗号隔开字符串',
  `attachmentid` text NOT NULL COMMENT '附件id',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发起时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0:未读,1:进行中,2:已完成,3:已评价,4:取消)',
  `finishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `stamp` tinyint(3) unsigned NOT NULL DEFAULT '0'COMMENT '图章',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`assignmentid`),
  KEY `SUBJECT` (`subject`) USING BTREE,
  KEY `DESIGNEEUID` (`designeeuid`) USING BTREE,
  KEY `CHARGEUID` (`chargeuid`) USING BTREE,
  KEY `FINISHTIME` (`finishtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{assignment_apply}}`;
CREATE TABLE IF NOT EXISTS `{{assignment_apply}}` (
  `applyid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `assignmentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派任务id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '申请人uid',
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否任务延时申请',
  `delaystarttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请延时开始时间',
  `delayendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请延时结束时间',
  `delayreason` varchar(255) NOT NULL DEFAULT '' COMMENT '申请延时理由',
  `iscancel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否任务取消申请',
  `cancelreason` varchar(255) NOT NULL DEFAULT '' COMMENT '申请取消理由',
  PRIMARY KEY (`applyid`),
  KEY `ASSIGNMENTID` (`assignmentid`) USING BTREE,
  KEY `ISDELAY` (`isdelay`) USING BTREE,
  KEY `ISCANCEL` (`iscancel`) USING BTREE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{assignment_remind}}`;
CREATE TABLE IF NOT EXISTS `{{assignment_remind}}` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `assignmentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派任务id',
  `calendarid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日程的id',
  `remindtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提醒时间，时间戳',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '提醒人uid',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '提醒内容',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态。0 未提醒，1 已提醒',
  PRIMARY KEY (`id`),
  KEY `A_ID` (`assignmentid`) USING BTREE,
  KEY `C_ID` (`calendarid`) USING BTREE,
  KEY `U_ID` (`uid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `{{assignment_log}}`;
CREATE TABLE IF NOT EXISTS `{{assignment_log}}` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `assignmentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派任务id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录日志时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人IP地址',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '日志类型：(add-新建,del-删除,edit-修改,view-查看,push-推办任务,finish-完成任务,stamp-评价任务,restart-重启任务,delay-延期,applydelay-申请延期,agreedelay-同意延期,refusedelay-拒绝延期,cancel-取消,applycancel-申请取消,agreecancel-同意取消,refusecancel-拒绝取消)',
  `content` text NOT NULL COMMENT '日志信息',
  PRIMARY KEY (`logid`),
  KEY `ASSIGNMENTID` (`assignmentid`) USING BTREE
)ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_timing_message','任务提醒','assignment','assignment/default/Timing assign title','assignment/default/Timing assign content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_new_message','任务指派新任务提醒','assignment','assignment/default/New assign title','assignment/default/New assign content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_push_message','任务催办提醒','assignment','assignment/default/Push assign title','assignment/default/Push assign content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_finish_message','任务完成消息','assignment','assignment/default/Finish assign title','assignment/default/Finish assign content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_applydelay_message','任务延期申请消息','assignment','assignment/default/Applydelay assign title','assignment/default/Applydelay assign content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_applydelayresult_message','任务延期申请结果','assignment','assignment/default/Applydelayresult title','assignment/default/Applydelayresult content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_applycancel_message','任务取消申请消息','assignment','assignment/default/Applycancel assign title','assignment/default/Applycancel assign content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_applycancelresult_message','任务取消申请结果','assignment','assignment/default/Applycancelresult title','assignment/default/Applycancelresult content','1','1','1','2');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_appraisal_message','任务评价消息','assignment','assignment/default/Appraisal assign title','assignment/default/Appraisal assign content','1','1','1','2');
INSERT INTO `{{nav}}`(`pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`) VALUES ('3','任务指派','assignment/unfinished/index','0','1','0','1','assignment');
INSERT INTO `{{menu_common}}`( `module`, `name`, `url`, `description`, `sort`, `iscommon`) VALUES ('assignment','任务指派','assignment/unfinished/index','提供企业工作任务指派','10','0');
INSERT INTO `{{credit_rule}}` (`rulename`, `action`, `cycletype`, `rewardnum`, `extcredits1`,`extcredits2`, `extcredits3`) VALUES ('完成任务指派', 'finishassignment', '1', '0', '0', '1','1');
INSERT INTO `{{cron}}` (`available`, `type`,`module`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES ( '1', 'system','assignment', '任务指派定时提醒', 'CronAssignmentTimer.php', '1393516800', '1393603200', '-1', '-1', '-1', '*/1');


DROP TABLE IF EXISTS `{{diary}}`;
CREATE TABLE IF NOT EXISTS `{{diary}}` (
  `diaryid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `diarytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日志添加的当日时间',
  `nextdiarytime` int(10) NOT NULL DEFAULT '0' COMMENT '下一个日志添加时间',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `content` text NOT NULL COMMENT '日志内容',
  `attachmentid` text NOT NULL COMMENT '附件ID',
  `shareuid` text NOT NULL COMMENT '分享id',
  `readeruid` text NOT NULL COMMENT '阅读人员',
  `remark` text NOT NULL COMMENT '备注',
  `stamp` tinyint(3) unsigned NOT NULL DEFAULT '0'COMMENT '图章',
  `isreview` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已评阅',
  `attention` text NOT NULL COMMENT '谁关注了这篇日志',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`diaryid`),
  UNIQUE KEY `ID` (`diaryid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `DIA_DATE` (`diarytime`) USING BTREE,
  KEY `DIA_TIME` (`addtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `{{diary_record}}`;
CREATE TABLE IF NOT EXISTS `{{diary_record}}` (
  `recordid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `diaryid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日志ID',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '记录内容',
  `uid` int(8) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '完成标记(0为未完成1为已完成',
  `planflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '计划标记,1为原计划、0为计划外)',
  `schedule` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '进度',
  `plantime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '计划执行的时间',
  `timeremind` char(10) NOT NULL DEFAULT '' COMMENT '设置时间提醒',
  PRIMARY KEY (`recordid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `{{diary_share}}`;
CREATE TABLE IF NOT EXISTS {{diary_share}} (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `deftoid` text NOT NULL COMMENT '分享给谁',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `{{diary_attention}}`;
CREATE TABLE IF NOT EXISTS {{diary_attention}} (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登陆用户UID',
  `auid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '关注哪个用户的UID',
  PRIMARY KEY (`id`),
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `AT_USER_ID` (`auid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `{{diary_statistics}}`;
CREATE TABLE IF NOT EXISTS {{diary_statistics}} (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `diaryid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '日志ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登陆用户UID',
  `stamp` smallint(3) unsigned NOT NULL DEFAULT '0'COMMENT '图章id',
  `integration` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `scoretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评分时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `DIARY_ID` (`diaryid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `SCORE_TIME` (`scoretime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{diary_direct}}`;
CREATE TABLE IF NOT EXISTS {{diary_direct}} (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `direct` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否设置只看直属下属,1为是,0为否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

REPLACE INTO {{setting}} (`skey` ,`svalue`) VALUES ('diaryconfig', 'a:11:{s:7:"lockday";s:1:"0";s:14:"sharepersonnel";s:1:"1";s:12:"sharecomment";s:1:"1";s:9:"attention";s:1:"1";s:10:"autoreview";s:1:"1";s:15:"autoreviewstamp";s:1:"1";s:13:"remindcontent";s:0:"";s:11:"stampenable";s:1:"1";s:11:"pointsystem";s:1:"5";s:12:"stampdetails";s:40:"0:10,0:9,0:8,0:7,0:6,4:5,5:4,2:3,1:2,8:1";s:10:"reviewlock";i:0;}');
INSERT INTO `{{nav}}`(`pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`) VALUES ('3','工作日志','diary/default/index','0','1','0','2','diary');
INSERT INTO `{{menu}}`(`name`, `pid`, `m`, `c`, `a`, `param`, `sort`, `disabled`) VALUES ('工作日志','0','diary','dashboard','index','','10','0');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('diary_message','工作日志消息提醒','diary','diary/default/New message title','diary/default/New message content','1','1','1','2');
REPLACE INTO `{{credit_rule}}` (`rulename`, `action`, `cycletype`, `rewardnum`, `extcredits1`,`extcredits2`, `extcredits3`) VALUES ('发表工作日志', 'adddiary', '3', '2', '0', '2','1');
INSERT INTO `{{menu_common}}`( `module`, `name`, `url`, `description`, `sort`, `iscommon`) VALUES ('diary','日志','diary/default/index','提供企业工作日志发布','2','1');

REPLACE INTO `{{node_related}}` (`roleid`, `module`, `key`, `node`, `val`) VALUES ('1', 'file', 'company', '', '0'),
('1', 'file', 'persoanl', '', '0'),
('1', 'diary', 'statistics', '', '0'),
('1', 'diary', 'review', '', '0'),
('1', 'diary', 'diary', '', '0'),
('1', 'assignment', 'review', '', '0'),
('1', 'assignment', 'assignment', '', '0'),
('2', 'file', 'company', '', '0'),
('2', 'file', 'persoanl', '', '0'),
('2', 'diary', 'statistics', '', '0'),
('2', 'diary', 'review', '', '0'),
('2', 'diary', 'diary', '', '0'),
('2', 'assignment', 'review', '', '0'),
('2', 'assignment', 'assignment', '', '0'),
('3', 'file', 'company', '', '0'),
('3', 'file', 'persoanl', '', '0'),
('3', 'diary', 'statistics', '', '0'),
('3', 'diary', 'review', '', '0'),
('3', 'diary', 'diary', '', '0'),
('3', 'assignment', 'review', '', '0'),
('3', 'assignment', 'assignment', '', '0');

INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('assignment_task', '任务指派', 'assignment', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');