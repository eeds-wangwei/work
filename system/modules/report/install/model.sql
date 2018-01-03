DROP TABLE IF EXISTS `{{report}}`;
CREATE TABLE `{{report}}` (
  `repid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '总结id',
  `subject` varchar(255) NOT NULL COMMENT '标题',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '汇报人',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '汇报时间',
  `tid` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '汇报模板id，用户自己的模板',
  `remark` text NOT NULL COMMENT '汇报备注',
  `attachmentid` text NOT NULL COMMENT '附件id',
  `toid` text NOT NULL COMMENT '汇报对象',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '汇报状态',
  `stamp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '图章',
  `isreview` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已评阅',
  `lastcommenttime` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL COMMENT '评阅内容',
  `commentline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评阅时间戳',
  `replyer` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '评阅人',
  `reminddate` int(10) NOT NULL DEFAULT '0',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `place` varchar(255) DEFAULT NULL COMMENT '填写汇报的地点',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除，1表示已删除，0表示未删除',
  PRIMARY KEY (`repid`),
  UNIQUE KEY `REP_ID` (`repid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

  DROP TABLE IF EXISTS `{{template_category}}`;
CREATE TABLE `{{template_category}}` (
  `cateid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类自增id',
  `categoryname` varchar(255) NOT NULL COMMENT '分类名',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

 DROP TABLE IF EXISTS `{{template}}`;
CREATE TABLE `{{template}}` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `tname` varchar(255) NOT NULL COMMENT '汇报模板名称',
  `autonumber` varchar(255)  COMMENT '自动文号',
  `pictureurl` text NOT NULL COMMENT '模板图标url',
  `cateid` int(10) unsigned NOT NULL COMMENT '模板分类id',
  `description` text,
  `addtime` int(10) unsigned NOT NULL COMMENT '创建模板或者添加模板的时间',
  `deptid` text COMMENT '可用部门',
  `positionid` text COMMENT '可用职位',
  `roleid` text COMMENT '可用角色',
  `uid` text COMMENT '可用用户',
  `uptype` text COMMENT '主管类型，1表示一级主管，2表示二级主管，3表示三级主管，4表示四级主管，5表示五级主管',
  `upuid` text COMMENT '主管uid',
  `adduser` int(10) unsigned DEFAULT NULL COMMENT '添加系统模板和新建模板的用户id',
  `isnew` int(10) unsigned NOT NULL COMMENT '是不是最新的模板，1表示是，0表示不是',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

  DROP TABLE IF EXISTS `{{template_field}}`;
CREATE TABLE `{{template_field}}` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段自增id',
  `tid` int(10) unsigned NOT NULL COMMENT '模板id',
  `fieldname` varchar(255) NOT NULL COMMENT '字段名称',
  `iswrite` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填，0表示不需要，1表示需要',
  `fieldtype` int(10) unsigned NOT NULL COMMENT '字段类型，1表示长文本，2表示短文本，3表示数字，4表示日期与时间，5表示时间，6表示日期，7表示下拉',
  `fieldvalue` text COMMENT '字段值',
  `fieldsort` int(10) unsigned NOT NULL COMMENT '字段排序序号',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{template_add}}`;
CREATE TABLE `{{template_add}}` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shoptid` int(10) unsigned NOT NULL COMMENT '模板商城模板id',
  `tid` int(10) unsigned NOT NULL COMMENT '添加模板id',
  `uid` int(10) unsigned NOT NULL COMMENT '添加这id',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{template_sort}}`;
CREATE TABLE `{{template_sort}}` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户uid',
  `tid` int(10) unsigned NOT NULL COMMENT '模板id',
  `sort` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '排序序号',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{report_record}}`;
CREATE TABLE `{{report_record}}` (
  `recordid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `repid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '汇报id',
  `content` text COMMENT '字段内容',
  `fieldid` int(11) NOT NULL COMMENT '字段的id',
  `fieldname` varchar(255) NOT NULL COMMENT '字段名称',
  `iswrite` int(11) NOT NULL DEFAULT '0' COMMENT '是否必填，0表示不需要，1表示需要',
  `fieldtype` int(11) NOT NULL COMMENT '字段类型，1表示长文本，2表示短文本，3表示数字，4表示日期与时间，5表示时间，6表示日期，7表示下拉',
  `fieldvalue` text COMMENT '字段值',
  PRIMARY KEY (`recordid`),
  KEY `REP_ID` (`repid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{report_type}}`;
CREATE TABLE IF NOT EXISTS `{{report_type}}` (
  `typeid` int(11) unsigned NOT NULL auto_increment COMMENT '汇报类型id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型排序',
  `typename` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名字',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `intervaltype` tinyint(1) unsigned NOT NULL COMMENT '区间(0:周 1:月 2:季 3:半年 4:年 5:其他)',
  `intervals` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '自定义的间隔日期',
  `issystype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是系统自带类型',
  PRIMARY KEY  (`typeid`),
  UNIQUE KEY `TYPE_ID` (`typeid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

  DROP TABLE IF EXISTS `{{report_statistics}}`;
  CREATE TABLE `{{report_statistics}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `repid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总结ID',
  `tid` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '模板id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户UID',
  `stamp` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '图章id',
  `integration` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `scoretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评分时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_ID` (`repid`) USING BTREE,
  KEY `USER_ID` (`uid`) USING BTREE,
  KEY `SCORE_TIME` (`scoretime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{module_reader}}`;
CREATE TABLE `{{module_reader}}` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `module` varchar(255) NOT NULL COMMENT '关联模型',
  `relateid` int(11) NOT NULL COMMENT '关联id',
  `uid` int(11) NOT NULL COMMENT '读者id',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `readername` varchar(255) DEFAULT NULL COMMENT '读者真实名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO {{setting}} (`skey` ,`svalue`) VALUES ('reportconfig', 'a:6:{s:16:"reporttypemanage";s:0:"";s:11:"stampenable";i:1;s:11:"pointsystem";i:5;s:12:"stampdetails";s:40:"0:10,0:9,0:8,0:7,0:6,4:5,5:4,2:3,1:2,8:1";s:10:"autoreview";i:1;s:15:"autoreviewstamp";i:1;}');
INSERT INTO `{{nav}}`(`pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`) VALUES ('3','工作汇报','report/default/index','0','1','0','3','report');
INSERT INTO `{{menu}}`(`name`, `pid`, `m`, `c`, `a`, `param`, `sort`, `disabled`) VALUES ('汇报','0','report','dashboard','index','','10','0');
INSERT INTO `{{notify_node}}`(`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('report_message','工作汇报消息提醒','report','report/default/New message title','report/default/New message content','1','1','1','2');
INSERT INTO `{{credit_rule}}` (`rulename`, `action`, `cycletype`, `rewardnum`, `extcredits1`,`extcredits2`, `extcredits3`) VALUES ('发表工作汇报', 'addreport', '3', '2', '0', '2','1');
INSERT INTO `{{report_type}}`(`sort`, `typename`, `uid`, `intervaltype`, `intervals`, `issystype`) VALUES ('0','周总结与下周计划','0','0','0','1');
INSERT INTO `{{report_type}}`(`sort`, `typename`, `uid`, `intervaltype`, `intervals`, `issystype`) VALUES ('0','月总结与下月计划','0','1','0','1');
INSERT INTO `{{report_type}}`(`sort`, `typename`, `uid`, `intervaltype`, `intervals`, `issystype`) VALUES ('0','季总结与下季计划','0','2','0','1');
INSERT INTO `{{report_type}}`(`sort`, `typename`, `uid`, `intervaltype`, `intervals`, `issystype`) VALUES ('0','年总结与下年计划','0','4','0','1');
INSERT INTO `{{menu_common}}`( `module`, `name`, `url`, `description`, `sort`, `iscommon`) VALUES ('report','汇报','report/default/index','提供企业工作汇报','3','1');
INSERT INTO `{{template_category}}` (`cateid`, `categoryname`, `addtime`) VALUES ('1', '个人模板', '1480489635');
INSERT INTO `{{template_category}}` (`cateid`, `categoryname`, `addtime`) VALUES ('2', '官方模板', '1480489636');
INSERT INTO `{{template_category}}` (`cateid`, `categoryname`, `addtime`) VALUES ('3', '服务业', '1480489637');
INSERT INTO `{{template_category}}` (`cateid`, `categoryname`, `addtime`) VALUES ('4', '餐饮业', '1480489638');
INSERT INTO `{{template_category}}` (`cateid`, `categoryname`, `addtime`) VALUES ('5', '建筑业', '1480489639');
INSERT INTO `{{template}}` (`tid`, `tname`, `autonumber`, `pictureurl`, `cateid`, `description`, `addtime`, `deptid`, `positionid`, `roleid`, `uid`, `uptype`, `upuid`, `adduser`, `isnew`) VALUES ('36', '周报', '{U}-{T}', 'default', '0', NULL, '1486610594', 'alldept', NULL, NULL, '', '', '', '1', '1');
INSERT INTO `{{template_field}}` (`tid`, `fieldname`, `iswrite`, `fieldtype`, `fieldvalue`, `fieldsort`) VALUES ('36', '原计划', '0', '2', null, '1');
INSERT INTO `{{template_field}}` (`tid`, `fieldname`, `iswrite`, `fieldtype`, `fieldvalue`, `fieldsort`) VALUES ('36', '计划外', '0', '2', null, '1');
INSERT INTO `{{template_field}}` (`tid`, `fieldname`, `iswrite`, `fieldtype`, `fieldvalue`, `fieldsort`) VALUES ('36', '工作总结', '0', '1', null, '1');
INSERT INTO `{{template_field}}` (`tid`, `fieldname`, `iswrite`, `fieldtype`, `fieldvalue`, `fieldsort`) VALUES ('36', '工作计划', '0', '1', null, '1');