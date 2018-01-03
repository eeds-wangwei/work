DROP TABLE IF EXISTS `{{cron}}`;
CREATE TABLE `{{cron}}` (
  `cronid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `module` varchar(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`cronid`),
  KEY `nextrun` (`available`,`nextrun`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{process}}`;
CREATE TABLE `{{process}}` (
  `processid` char(32) NOT NULL COMMENT '进程id',
  `expiry` int(10) DEFAULT NULL DEFAULT '0' COMMENT '过期时间',
  `extra` int(10) DEFAULT NULL DEFAULT '0' COMMENT '扩展字段',
  PRIMARY KEY (`processid`),
  KEY `expiry` (`expiry`) USING HASH
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{session}}`;
CREATE TABLE `{{session}}` (
  `sid` char(6) NOT NULL DEFAULT '',
  `ip1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastolupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid` (`sid`),
  KEY `uid` (`uid`) USING HASH
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment}}`;
CREATE TABLE `{{attachment}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `tableid` tinyint(1) unsigned NOT NULL default '0' COMMENT '所属表id',
  `downloads` mediumint(8) unsigned NOT NULL default '0' COMMENT '下载次数',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_0}}`;
CREATE TABLE `{{attachment_0}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_1}}`;
CREATE TABLE `{{attachment_1}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_2}}`;
CREATE TABLE `{{attachment_2}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_3}}`;
CREATE TABLE `{{attachment_3}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_4}}`;
CREATE TABLE `{{attachment_4}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_5}}`;
CREATE TABLE `{{attachment_5}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_6}}`;
CREATE TABLE `{{attachment_6}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_7}}`;
CREATE TABLE `{{attachment_7}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_8}}`;
CREATE TABLE `{{attachment_8}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_9}}`;
CREATE TABLE `{{attachment_9}}` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件ID',
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  `attachment` varchar(255) NOT NULL,
  `isimage` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `aid` USING BTREE (`aid`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_edit}}`;
CREATE TABLE `{{attachment_edit}}` (
 `aid` mediumint(8) unsigned NOT NULL default '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '当前编辑用户',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{attachment_unused}}`;
CREATE TABLE `{{attachment_unused}}` (
 `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `dateline` int(10) unsigned NOT NULL default '0' COMMENT '时间戳',
  `filename` varchar(255) NOT NULL default '' COMMENT '文件名',
  `filesize` int(10) unsigned NOT NULL default '0',
  `attachment` varchar(255) NOT NULL default '' COMMENT '附件真实地址',
  `isimage` tinyint(1) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '' COMMENT '附件描述',
  PRIMARY KEY  (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{setting}}`;
CREATE TABLE `{{setting}}` (
  `skey` varchar(255) NOT NULL DEFAULT '' COMMENT '键',
  `svalue` text NOT NULL COMMENT '值',
  PRIMARY KEY (`skey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{module}}`;
CREATE TABLE `{{module}}` (
  `module` varchar(30) NOT NULL COMMENT '模块',
  `name` varchar(20) NOT NULL COMMENT '模块名',
  `url` varchar(100) NOT NULL COMMENT '链接地址',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否核心模块',
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '版本号',
  `icon` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图标文件存在与否',
  `category` varchar(30) NOT NULL COMMENT '模块所属分类',
  `description` varchar(255) NOT NULL COMMENT '模块描述',
  `config` text NOT NULL COMMENT '模块配置，数组形式',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序 ',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已禁用',
  `installdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装日期',
  `updatedate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新日期',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{regular}}`;
CREATE TABLE `{{regular}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证规则',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型索引',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '验证规则说明',
  `regex` text NOT NULL COMMENT '正则表达式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` USING BTREE (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{syscache}}`;
CREATE TABLE `{{syscache}}` (
  `name` varchar(32) NOT NULL COMMENT '缓存类型名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '缓存类型，1为数组，其余为0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳',
  `value` mediumblob NOT NULL COMMENT '值',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{module_guide}}`;
CREATE TABLE `{{module_guide}}` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `route` varchar(32) NOT NULL DEFAULT '' COMMENT '引导的页面id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '已经引导过的uid',
  PRIMARY KEY (`id`),
  KEY `route` (`route`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{menu_common}}`;
CREATE TABLE `{{menu_common}}` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `module` varchar(30) NOT NULL DEFAULT '' COMMENT '模块',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单显示描述',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `iscommon` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已设置为常用菜单',
  `iscustom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是自定义的快捷导航',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `openway` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '打开连接方式:0为新窗口,1当前页打开',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon文件名,在./data/icon/目录下',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '首页通用菜单设置';

DROP TABLE IF EXISTS `{{menu_personal}}`;
CREATE TABLE `{{menu_personal}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '设置菜单的uid',
  `common` text NOT NULL COMMENT '常用菜单，按顺序逗号隔开的menu_common模块id名称',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT '首页个人菜单设置';

INSERT INTO `{{setting}}` (`skey`, `svalue`) VALUES ('appclosed', '0'),
('unit', 'a:9:{s:7:"logourl";s:0:"";s:8:"fullname";s:9:"总公司";s:9:"shortname";s:9:"总公司";s:5:"phone";s:0:"";s:3:"fax";s:0:"";s:7:"zipcode";s:0:"";s:7:"address";s:0:"";s:9:"systemurl";s:0:"";s:10:"adminemail";s:0:"";}'),
('creditremind', '1'),
('creditsformula', 'extcredits2+extcredits1*2+extcredits3*3'),
('creditsformulaexp', '<span data-type="entry" data-value="经验" class="entry disabled">经验</span><span data-type="operator" data-value="+" class="operator">+</span><span data-type="entry" data-value="金钱" class="entry disabled">金钱</span><span data-type="operator" data-value="*" class="operator">*</span><span data-type="number" data-value="2" class="number">2</span><span data-type="operator" data-value="+" class="operator">+</span><span data-type="entry" data-value="威望" class="entry disabled">威望</span><span data-type="operator" data-value="*" class="operator">*</span><span data-type="number" data-value="3" class="number">3</span>'),
('sphinxhost', ''),
('sphinxport', ''),
('sphinxon', 'a:3:{s:5:"email";i:0;s:5:"diary";i:0;s:7:"article";i:0;}'),
('sphinxsubindex', 'a:3:{s:5:"email";s:0:"";s:5:"diary";s:0:"";s:7:"article";s:0:"";}'),
('sphinxmsgindex', 'a:3:{s:5:"email";s:0:"";s:5:"diary";s:0:"";s:7:"article";s:0:"";}'),
('sphinxmaxquerytime', 'a:3:{s:5:"email";s:0:"";s:5:"diary";s:0:"";s:7:"article";s:0:"";}'),
('sphinxlimit', 'a:3:{s:5:"email";s:0:"";s:5:"diary";s:0:"";s:7:"article";s:0:"";}'),
('sphinxrank', 'a:3:{s:5:"email";s:23:"SPH_RANK_PROXIMITY_BM25";s:5:"diary";s:23:"SPH_RANK_PROXIMITY_BM25";s:7:"article";s:23:"SPH_RANK_PROXIMITY_BM25";}'),
('dateformat', 'Y-n-j'),
('dateconvert', '1'),
('timeoffset', '8'),
('timeformat', 'H:i'),
('attachdir', 'data/attachment'),
('attachurl', 'data/attachment'),
('watermarkstatus', '0'),
('thumbquality', '100'),
('waterconfig', '{"watermarkminwidth":"120","watermarkminheight":"40","watermarktype":"text","watermarktrans":"50","watermarktext":{"text":"Welcome to use the IBOS!","size":"12","color":"0070c0","fontpath":"FetteSteinschrift.ttf"},"watermarkquality":"90","watermarkimg":"static/image/watermark_preview.jpg","watermarkposition":"9"}'),
('watermodule', '[]'),
('attachsize', '10'),
('filetype', 'csv, chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png, txt, doc, xls, ppt, docx, xlsx, pptx, htm, html'),
('im', 'a:2:{s:3:"rtx";a:8:{s:4:"open";i:0;s:6:"server";s:9:"127.0.0.1";s:7:"appport";i:8006;s:7:"sdkport";i:6000;s:4:"push";a:2:{s:4:"note";i:0;s:3:"msg";i:0;}s:3:"sso";i:0;s:14:"reverselanding";i:0;s:8:"syncuser";i:0;}s:2:"qq";a:10:{s:4:"open";i:0;s:2:"id";s:0:"";s:5:"token";s:0:"";s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:3:"sso";i:0;s:4:"push";a:2:{s:4:"note";i:0;s:3:"msg";i:0;}s:8:"syncuser";i:0;s:7:"syncorg";i:0;s:10:"showunread";i:0;}}'),
('custombackup', ''),
('mail', 'a:5:{s:8:"mailsend";i:1;s:6:"server";a:0:{}s:13:"maildelimiter";i:2;s:12:"mailusername";i:1;s:14:"sendmailsilent";i:1;}'),
('account', 'a:9:{s:10:"expiration";i:0;s:9:"minlength";i:5;s:5:"mixed";i:0;s:10:"errorlimit";i:1;s:11:"errorrepeat";i:5;s:9:"errortime";i:15;s:9:"autologin";i:0;s:10:"allowshare";i:1;s:7:"timeout";i:720;}'),
('license', ''),
('upgrade', ''),
('verhash', ''),
('smsenabled', '0'),
('smsinterface', '1'),
('smssetup', 'a:2:{s:9:"accesskey";s:0:"";s:9:"secretkey";s:0:"";}'),
('smsmodule', 'a:0:{}'),
('emailtable_info', 'a:2:{i:0;a:1:{s:4:"memo";s:0:"";}i:1;a:2:{s:4:"memo";s:0:"";s:11:"displayname";s:12:"默认归档";}}'),
('emailtableids', 'a:2:{i:0;i:0;i:1;i:1;}'),
('diarytable_info', 'a:2:{i:0;a:1:{s:4:"memo";s:0:"";}i:1;a:2:{s:4:"memo";s:0:"";s:11:"displayname";s:12:"默认归档";}}'),
('diarytableids', 'a:2:{i:0;i:0;i:1;i:1;}'),
('cronarchive', 'a:3:{s:11:"cronarchive";a:1:{s:5:"diary";a:3:{s:13:"sourcetableid";i:0;s:13:"targetabletid";s:1:"1";s:10:"conditions";a:2:{s:13:"sourcetableid";s:1:"0";s:9:"timerange";i:3;}}}s:5:"email";a:3:{s:13:"sourcetableid";i:0;s:13:"targettableid";s:1:"1";s:10:"conditions";a:2:{s:13:"sourcetableid";s:1:"0";s:9:"timerange";i:6;}}s:5:"diary";a:3:{s:13:"sourcetableid";i:0;s:13:"targettableid";s:1:"1";s:10:"conditions";a:2:{s:13:"sourcetableid";s:1:"0";s:9:"timerange";i:6;}}}'),
('logtableid', '0'),
('iboscloud', 'a:5:{s:5:"appid";s:0:"";s:6:"secret";s:0:"";s:6:"isopen";i:0;s:7:"apilist";a:0:{}s:3:"url";s:21:"http://cloud.ibos.cn/";}'),
('websiteuid', '0'),
('skin', 'white'),
('aeskey','0'),
('corpid','0'),
('qrcode','0'),
('cobinding','0'),
('coinfo',''),
('cacheuserstatus','1'),
('cacheuserconfig','{"offset":"0","limit":"1000","uid":"1"}'),
('version','4.4.2 open');
INSERT INTO `{{regular}}` (`type`, `desc`, `regex`) VALUES('notempty', '不能为空', ''),
('chinese', '只能为中文', ''),
('letter', '只能为英文', ''),
('num', '只能为数字', ''),
('idcard', '身份证', ''),
('mobile', '手机号码', ''),
('money', '金额', ''),
('tel', '电话号码', ''),
('zipcode', '邮政编码', ''),
('email', 'Email', '');
UPDATE `{{setting}}` SET `skey`='creditsformulaexp', `svalue`='<span data-type=\"entry\" data-value=\"经验\" class=\"entry disabled\">经验</span><span data-type=\"operator\" data-value=\"+\" class=\"operator\">+</span><span data-type=\"entry\" data-value=\"金钱\" class=\"entry disabled\">金钱</span><span data-type=\"operator\" data-value=\"*\" class=\"operator\">*</span><span data-type=\"number\" data-value=\"2\" class=\"number\">2</span><span data-type=\"operator\" data-value=\"+\" class=\"operator\">+</span><span data-type=\"entry\" data-value=\"贡献\" class=\"entry disabled\">贡献</span><span data-type=\"operator\" data-value=\"*\" class=\"operator\">*</span><span data-type=\"number\" data-value=\"3\" class=\"number\">3</span>' WHERE (`skey`='creditsformulaexp');

DROP TABLE IF EXISTS `{{menu}}`;
CREATE TABLE `{{menu}}` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `name` char(20) NOT NULL COMMENT '菜单显示名字',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `m` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `c` char(20) NOT NULL DEFAULT '' COMMENT '控制器',
  `a` char(20) NOT NULL DEFAULT '' COMMENT '动作',
  `param` char(100) NOT NULL DEFAULT '' COMMENT '要传递的参数',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{credit}}`;
CREATE TABLE `{{credit}}` (
  `cid` int(10) unsigned NOT NULL auto_increment COMMENT '积分id',
  `system` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否为系统自带：1为是；0为否',
  `name` varchar(50) NOT NULL COMMENT '积分名字',
  `initial` int(10) unsigned NOT NULL default '0' COMMENT '初始积分',
  `lower` int(10) unsigned NOT NULL default '0' COMMENT '积分下限',
  `enable` tinyint(1) unsigned NOT NULL default '1' COMMENT '是否启动：1为启动，0为不启用',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{credit_log}}`;
CREATE TABLE `{{credit_log}}` (
  `logid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `operation` char(3) NOT NULL DEFAULT '',
  `relatedid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `curcredits` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`),
  KEY `operation` (`operation`),
  KEY `relatedid` (`relatedid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{credit_rule}}`;
CREATE TABLE `{{credit_rule}}` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rulename` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(20) NOT NULL DEFAULT '',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0',
  `cycletime` int(10) NOT NULL DEFAULT '0',
  `rewardnum` smallint(5) NOT NULL DEFAULT '1',
  `norepeat` tinyint(1) NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `action` (`action`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{credit_rule_log}}`;
CREATE TABLE `{{credit_rule_log}}` (
  `clid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则记录id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `rid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '规则ID',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总积分',
  `cyclenum` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '周期次数',
  `extcredits1` int(10) NOT NULL DEFAULT '0' COMMENT '积分1',
  `extcredits2` int(10) NOT NULL DEFAULT '0' COMMENT '积分2',
  `extcredits3` int(10) NOT NULL DEFAULT '0' COMMENT '积分3',
  `extcredits4` int(10) NOT NULL DEFAULT '0' COMMENT '积分4',
  `extcredits5` int(10) NOT NULL DEFAULT '0' COMMENT '积分5',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录时间',
  PRIMARY KEY (`clid`),
  KEY `dateline` (`dateline`),
  KEY `uid` (`uid`,`rid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{credit_rule_log_field}}`;
CREATE TABLE `{{credit_rule_log_field}}` (
  `clid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `user` text NOT NULL,
  `app` text NOT NULL,
  PRIMARY KEY (`clid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{syscode}}`;
CREATE TABLE `{{syscode}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `number` varchar(50) NOT NULL COMMENT '代码',
  `sort` mediumint(8) unsigned NOT NULL COMMENT '排序',
  `name` varchar(50) NOT NULL COMMENT '系统代码描述',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统代码',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '系统代码图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`pid`,`number`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{nav}}`;
CREATE TABLE `{{nav}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(30) NOT NULL COMMENT '导航名字',
  `url` varchar(255) NOT NULL COMMENT '链接URL',
  `targetnew` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为本窗口打开，1为新窗口打开',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统内置',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '模块名',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为超链接，1为单页图文',
  `pageid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '单页图文关联id',
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{page}}`;
CREATE TABLE `{{page}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `template` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{announcement}}`;
CREATE TABLE `{{announcement}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型，0为内容，1为链接',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序号',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `message` text NOT NULL COMMENT '公告内容',
  PRIMARY KEY (`id`),
  KEY `timespan` (`starttime`,`endtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{ipbanned}}`;
CREATE TABLE `{{ipbanned}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` smallint(3) NOT NULL DEFAULT '0',
  `ip2` smallint(3) NOT NULL DEFAULT '0',
  `ip3` smallint(3) NOT NULL DEFAULT '0',
  `ip4` smallint(3) NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{stamp}}`;
CREATE TABLE `{{stamp}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '显示名称',
  `stamp` varchar(100) NOT NULL DEFAULT '' COMMENT '图章地址',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '图标地址',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统自带图章',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{login_template}}`;
CREATE TABLE `{{login_template}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统图片',
  `image` varchar(100) NOT NULL COMMENT '背景图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{cache}}`;
CREATE TABLE `{{cache}}` (
  `cachekey` varchar(255) NOT NULL DEFAULT '',
  `cachevalue` mediumblob NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cachekey)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{syscache}}`;
CREATE TABLE `{{syscache}}` (
  `name` varchar(32) NOT NULL COMMENT '缓存类型名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '缓存类型，1为数组，其余为0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳',
  `value` mediumblob NOT NULL COMMENT '值',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{approval}}`;
CREATE TABLE `{{approval}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '审批流程名称',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核等级,1-5级',
  `free` text NOT NULL COMMENT '免审核人uid，逗号隔开',
  `desc` text NOT NULL COMMENT '描述',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{approval_step}}`;
CREATE TABLE `{{approval_step}}` (
`id`  int NOT NULL AUTO_INCREMENT COMMENT '主键，自增 ID' ,
`aid`  int NOT NULL COMMENT '审批流程 ID' ,
`step`  tinyint NOT NULL COMMENT '处于流程中第几级步骤' ,
`uids`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前步骤审核人员 ID 串 1,2,3....' ,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{approval_record}}`;
CREATE TABLE `{{approval_record}}` (
`id`  int NOT NULL AUTO_INCREMENT COMMENT '主键，自增 ID' ,
`module` varchar(255) NOT NULL DEFAULT '' COMMENT '关联模型',
`relateid` int NOT NULL  COMMENT '关联ID',
`uid` int NOT NULL  COMMENT '用户ID',
`step` int NOT NULL  COMMENT '步骤',
`time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
`status` int NOT NULL  COMMENT '审核状态,0表示退回，1表示通过，2表示流程结束，3表示发起',
`reason` text NOT NULL COMMENT '原因，通过可以没有原因，退回一定有原因',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO {{credit}} VALUES ('1', '1', '经验', '0', '0', '1');
INSERT INTO {{credit}} VALUES ('2', '1', '金钱', '0', '0', '1');
INSERT INTO {{credit}} VALUES ('3', '1', '贡献', '0', '0', '1');

INSERT INTO `{{syscode}}` VALUES ('1', '0', 'RESUME_JOB_EDU', '1', '学历', '1', ''),
('2', '1', 'DOCTOR', '2', '博士', '1', ''),
('3', '1', 'MASTER', '3', '硕士', '1', ''),
('4', '1', 'BACHELOR_DEGREE', '4', '本科', '1', ''),
('5', '1', 'COLLEGE', '5', '大专', '1', ''),
('6', '1', 'SENIOR_HIGH', '6', '高中', '1', ''),
('7', '1', 'CHUNGCHI', '7', '中技', '1', ''),
('8', '1', 'TECHNICAL_SECONDARY', '8', '中专', '1', ''),
('9', '1', 'JUNIOR_HIGH', '9', '初中', '1', ''),
('10', '0', 'ENGLISH_LEVEL', '10', '英语水平', '1', ''),
('11', '10', 'VERY_GOOD', '11', '很好', '1', ''),
('12', '10', 'GOOD', '12', '较好', '1', ''),
('13', '10', 'ORDINARY', '13', '一般', '1', ''),
('14', '10', 'VERY_POOR', '14', '很差', '1', ''),
('15', '10', 'POOR', '15', '较差', '1', ''),
('16', '0', 'CONTACT_TYPE', '16', '联系类型', '1', ''),
('17', '16', 'GTALK', '17', 'Gtalk', '1', ''),
('18', '16', 'YY', '18', 'YY', '1', ''),
('19', '16', 'SKYPE', '19', 'Skype', '1', ''),
('20', '16', 'QQ', '20', 'QQ', '1', ''),
('21', '16', 'MSN', '21', 'MSN', '1', ''),
('22', '16', 'FETION', '22', '飞信', '1', ''),
('23', '16', 'BAIDU_HI', '23', '百度Hi', '1', ''),
('24', '16', 'WANGWANG', '24', '旺旺', '1', ''),
('25', '16', 'PAOPAO', '25', '泡泡', '1', ''),
('26', '16', 'UC', '26', 'UC', '1', ''),
('27', '0', 'SUPPLIER_TYPE', '27', '供应商类型', '1', ''),
('28', '27', 'INTERNAL_REFERRAL', '28', '内部推荐', '1', ''),
('29', '27', 'INTERMEDIARY', '29', '人才中介机构', '1', ''),
('30', '27', 'RECRUITMENT_SITE', '30', '招聘网站', '1', ''),
('31', '27', 'HEAD_HUNTING_COMPANY', '31', '猎头公司', '1', ''),
('69', '0', 'MEETING_ROOM_TYPE', '69', '会议室类型', '1', ''),
('70', '69', 'INTERVIEW_FORM', '70', '接见式', '1', ''),
('71', '69', 'T-SHAPED', '71', 'T型', '1', ''),
('72', '69', 'STEAMED_FORM', '72', '围桌', '1', ''),
('73', '69', 'THEATRE', '73', '剧院', '1', ''),
('74', '69', 'U-SHAPED', '74', 'U型', '1', ''),
('75', '69', 'BANQUET_HALL', '75', '宴会厅', '1', ''),
('76', '69', 'BOARD_OF_DIRECTORS_FORM', '76', '董事会式', '1', ''),
('77', '69', 'AMPHITHEATRE', '77', '阶梯型', '1', ''),
('78', '0', 'MEETING_ROOM_DEVICE_TYPE', '78', '会议室设备类型', '1', ''),
('79', '78', 'VIDICON', '79', '摄像机', '1', 'vidicon.png'),
('80', '78', 'NETBOOK', '80', '笔记本电脑', '1', 'netbook.png'),
('81', '78', 'RECORDER_PEN', '81', '录音笔', '1', 'recorder_pen.png'),
('82', '78', 'MICPHONE', '82', '麦克风', '1', 'micphone.png'),
('83', '78', 'WHITE_BOARD', '83', '白板', '1', 'white_board.png'),
('84', '78', 'WIRED_NETWORK', '84', '有线网络', '1', 'wired_network.png'),
('85', '78', 'WIRELESS_NETWORK', '85', '无线网络', '1', 'wireless_network.png'),
('86', '78', 'PROJECTOR', '86', '投影仪', '1', 'projector.png'),
('87', '78', 'LOUDSPEAKER_BOX', '87', '音箱', '1', 'loudspeaker_box.png'),
('88', '78', 'CAMERA', '88', '相机', '1', 'camera.png'),
('89', '78', 'SLIDE', '89', '幻灯片', '1', 'slide.png');

INSERT INTO `{{nav}}` (`id`, `pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`, `type`, `pageid`) VALUES ('1', '0', '首页', 'javascript:void(0)', '0', '1', '0', '1','','0', '0'),
('3', '0', '个人办公', 'javascript:void(0);', '0', '1', '0', '5','','0', '0'),
('5', '0', '综合办公', 'javascript:void(0);', '0', '1', '0', '6','','0', '0'),
('9', '0', '人力资源', 'javascript:void(0)', '0', '1', '1', '9','','0', '0'),
('10', '1', '个人门户', 'weibo/home/index', '0', '1', '0', '2','','0', '0'),
('11', '1', '办公门户', 'main/default/index', '0', '1', '0', '1','','0', '0');

INSERT INTO `{{stamp}}` VALUES ('1', '1', '已阅', 'data/stamp/001.png', 'data/stamp/001.small.png', '1'),
('2', '2', '有进步', 'data/stamp/002.png', 'data/stamp/002.small.png', '1'),
('3', '3', '继续努力', 'data/stamp/003.png', 'data/stamp/003.small.png', '1'),
('4', '4', '干得不错', 'data/stamp/004.png', 'data/stamp/004.small.png', '1'),
('5', '5', '很给力', 'data/stamp/005.png', 'data/stamp/005.small.png', '1'),
('6', '6', '非常赞', 'data/stamp/006.png', 'data/stamp/006.small.png', '1'),
('7', '7', '待提高', 'data/stamp/007.png', 'data/stamp/007.small.png', '1'),
('8', '8', '不理想', 'data/stamp/008.png', 'data/stamp/008.small.png', '1'),
('9', '9', '不给力', 'data/stamp/009.png', 'data/stamp/009.small.png', '1'),
('10', '10', '没完成', 'data/stamp/010.png', 'data/stamp/010.small.png', '1');

INSERT INTO `{{login_template}}` VALUES ('1', '1', '1', 'data/login/ibos_login1.jpg'),
('2', '0', '1', 'data/login/ibos_login2.jpg');

INSERT INTO `{{syscache}}` (`name`, `type`, `dateline`, `value`) VALUES ('setting', '1', '0', ''),
('nav', '1', '0', ''),
('creditrule', '1', '0', ''),
('ipbanned', '1', '0', ''),
('department', '1', '0', ''),
('notifyNode', '1', '0', ''),
('role', '1', '0', ''),
('position', '1', '0', ''),
('positioncategory', '1', '0', ''),
('authitem', '1', '0', ''),
('users', '1', '0', ''),
('usergroup', '1', '0', ''),
('cronnextrun', '1', '1393603200', '1393603200');

INSERT INTO `{{approval}}` (`id`, `name`, `level`, `free`, `desc`, `addtime`) VALUES (1, '一级审核', '1', '', '', '1402631014'),
(2, '二级审核', '2', '', '', '1402631014');

INSERT INTO `{{approval_step}}` (`aid`, `step`, `uids`) VALUES (1, 1, 1),(2, 1, 1),(2, 2, 1);

INSERT INTO `{{announcement}}` (`id`, `author`, `subject`, `type`, `sort`, `starttime`, `endtime`, `message`) VALUES (1, '管理员', '<span style=\'color: rgb(226, 111, 80);\'>请使用支持HTML5的浏览器登录！</span>', 0, 0, 1401552000, 1433088000, '');
INSERT INTO `{{cron}}` (`available`, `type`,`module`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES ('1', 'system', 'dashboard', '自动同步 IBOS 绑定酷办公用户列表', 'CronAutoSync.php', '1457661663', '1457748000', '-1', '-1', '10', '0'),
('1', 'system', 'dashboard', '自动补丁', 'CronAutoPatch.php', '1457661663', '1457748000', '-1', '-1', '10', '0');

DROP TABLE IF EXISTS `{{comment}}`;
CREATE TABLE `{{comment}}` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，评论编号',
  `module` char(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `table` varchar(50) NOT NULL DEFAULT '' COMMENT '被评论的内容所存储的表',
  `rowid` int(11) NOT NULL DEFAULT '0' COMMENT '应用进行评论的内容的编号',
  `moduleuid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '模块内进行评论的内容的作者的UID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '评论者UID',
  `content` text NOT NULL COMMENT '评论内容',
  `tocid` int(11) NOT NULL DEFAULT '0' COMMENT '被回复的评论的编号',
  `touid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '被回复的评论的作者的UID',
  `data` text NOT NULL COMMENT '所评论的内容的相关参数（序列化存储）',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '标记删除（0：没删除，1：已删除）',
  `from` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `commentcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '该评论回复数',
  `attachmentid` text NOT NULL COMMENT '附件id',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '连接地址',
  `detail` varchar(255) NOT NULL DEFAULT '' COMMENT '详细来源信息描述',
  PRIMARY KEY (`cid`),
  KEY `module` (`table`,`isdel`,`rowid`) USING BTREE,
  KEY `module2` (`uid`,`isdel`,`table`) USING BTREE,
  KEY `module3` (`uid`,`touid`,`isdel`,`table`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `{{notify_node}}`;
CREATE TABLE `{{notify_node}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `nodeinfo` varchar(50) NOT NULL COMMENT '节点描述',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `titlekey` varchar(50) NOT NULL COMMENT '标题key',
  `contentkey` varchar(50) NOT NULL COMMENT '内容key',
  `sendemail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送邮件',
  `sendmessage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送短消息',
  `sendsms` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否发送短信',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '信息类型：1 表示用户发送的 2表示是系统发送的',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `{{notify_message}}`;
CREATE TABLE `{{notify_message}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `body` text NOT NULL COMMENT '内容',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `isread` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接地址',
  `isalarm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为闹钟提醒',
  `senduid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主动提醒发送用户ID',
  PRIMARY KEY (`id`),
  KEY `uid_read` (`uid`,`isread`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `{{notify_sms}}`;
CREATE TABLE `{{notify_sms}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `return` varchar(255) NOT NULL,
  `posturl` varchar(255) NOT NULL,
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

DROP TABLE IF EXISTS `{{notify_email}}`;
CREATE TABLE `{{notify_email}}` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户UiD',
  `node` varchar(50) NOT NULL COMMENT '节点名称',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `email` varchar(250) NOT NULL COMMENT '邮件接受地址',
  `issend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已经发送',
  `title` varchar(250) NOT NULL COMMENT '邮件标题',
  `body` text NOT NULL COMMENT '邮件内容',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `sendtime` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{message_content}}`;
CREATE TABLE `{{message_content}}` (
  `messageid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信内对话ID',
  `listid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '私信ID',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会话发布者UID',
  `content` text COMMENT '会话内容',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除，0：否；1：是',
  `mtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会话发布时间',
  PRIMARY KEY (`messageid`),
  KEY `listid` (`listid`,`isdel`,`mtime`),
  KEY `listid2` (`listid`,`mtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `{{message_user}}`;
CREATE TABLE `{{message_user}}` (
  `listid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `new` smallint(8) NOT NULL DEFAULT '0' COMMENT '未读消息数',
  `messagenum` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '消息总数',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '该参与者最后会话时间',
  `listctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '私信最后会话时间',
  `isdel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除（假删）',
  PRIMARY KEY (`listid`,`uid`),
  KEY `new` (`new`),
  KEY `ctime` (`ctime`),
  KEY `listctime` (`listctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

DROP TABLE IF EXISTS `{{message_list}}`;
CREATE TABLE `{{message_list}}` (
  `listid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `fromuid` mediumint(8) unsigned NOT NULL COMMENT '私信发起者UID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '私信类别，1：一对一；2：多人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `usernum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '参与者数量',
  `minmax` varchar(255) DEFAULT NULL COMMENT '参与者UID正序排列，以下划线“_”链接',
  `mtime` int(11) unsigned NOT NULL COMMENT '发起时间戳',
  `lastmessage` text NOT NULL COMMENT '最新的一条会话',
  PRIMARY KEY (`listid`),
  KEY `type` (`type`),
  KEY `min_max` (`minmax`),
  KEY `fromuid` (`fromuid`,`mtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `{{atme}}`;
CREATE TABLE `{{atme}}` (
  `atid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，@我的编号',
  `module` char(30) NOT NULL COMMENT '所属模块',
  `table` char(15) NOT NULL COMMENT '存储内容的表名',
  `rowid` int(11) NOT NULL DEFAULT '0' COMMENT '模块内含有@的内容的编号',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '被@的用户编号',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '连接地址',
  `detail` varchar(255) NOT NULL DEFAULT '' COMMENT '详细来源信息描述',
  PRIMARY KEY (`atid`),
  KEY `module2` (`uid`,`table`),
  KEY `module3` (`table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

DROP TABLE IF EXISTS `{{feed}}`;
CREATE TABLE `{{feed}}` (
  `feedid` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `uid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '产生动态的用户UID',
  `type` char(50) DEFAULT NULL COMMENT 'feed类型.由发表feed的程序控制',
  `module` char(30) NOT NULL DEFAULT 'microblog' COMMENT 'feed来源的module',
  `table` varchar(50) NOT NULL DEFAULT 'feed' COMMENT '关联资源所在的表',
  `rowid` int(11) NOT NULL DEFAULT '0' COMMENT '关联的来源ID（如文章的id）',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '产生时间戳',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 默认为0',
  `from` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户端类型，0：网站；1：手机网页版；2：android；3：iphone',
  `commentcount` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `repostcount` int(10) DEFAULT '0' COMMENT '分享数',
  `commentallcount` int(10) DEFAULT '0' COMMENT '全部评论数目',
  `diggcount` int(11) unsigned DEFAULT '0' COMMENT '赞数',
  `isrepost` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否转发 0-否  1-是',
  `view` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '微博可见性 (0全公司可见 1仅自己可见 2我所在的部门可见 3自定义范围)',
  `userid` text NOT NULL COMMENT '可见用户ID',
  `deptid` text NOT NULL COMMENT '可见部门ID',
  `positionid` text NOT NULL COMMENT '可见岗位ID',
  `roleid` text NOT NULL COMMENT '可见角色ID',
  PRIMARY KEY (`feedid`),
  KEY `isdel` (`isdel`,`ctime`),
  KEY `uid` (`uid`,`isdel`,`ctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `{{feed_data}}`;
CREATE TABLE `{{feed_data}}` (
  `feedid` int(11) unsigned NOT NULL COMMENT '关联feed表，feedid',
  `feeddata` text COMMENT '关联feed表，动态数据，序列化保存',
  `clientip` char(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户端IP',
  `feedcontent` text COMMENT '纯微博内容',
  `fromdata` text COMMENT '微博来源',
  PRIMARY KEY (`feedid`),
  KEY `feedid` (`feedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `{{feed_digg}}`;
CREATE TABLE `{{feed_digg}}` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `feedid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '产生动态的ID',
  `ctime` int(11) DEFAULT NULL DEFAULT '0' COMMENT '赞的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

DROP TABLE IF EXISTS `{{user_data}}`;
CREATE TABLE `{{user_data}}` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` MEDIUMINT(8) NOT NULL DEFAULT '0' COMMENT '用户UID',
  `key` varchar(50) NOT NULL COMMENT 'Key',
  `value` text COMMENT '对应Key的 值',
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '当前时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user-key` (`uid`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{notify_alarm}}`;
CREATE TABLE `{{notify_alarm}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `node` varchar(50) NOT NULL COMMENT '事件节点',
  `module` char(30) NOT NULL COMMENT '模块名称',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `body` text NOT NULL COMMENT '内容',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接地址',
  `receiveuids` text NOT NULL COMMENT '接收提醒的用户ID,逗号隔开',
  `stime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '自定义发送时间',
  `alarmtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '提醒类型：0为自定义时间，1为关联事件时间',
  `issend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0未发送，1已发送',
  `diffetime` int(10) NOT NULL DEFAULT '0' COMMENT '差异量:分钟数,负数代表提前，正数代表增加',
  `eventid` varchar(60) NOT NULL DEFAULT '0' COMMENT '事件ID',
  `tablename` varchar(50) NOT NULL COMMENT '关联事件表名',
  `fieldname` varchar(50) NOT NULL COMMENT '关联事件时间字段名',
  `uptime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `idname` varchar(50) NOT NULL COMMENT '关联事件时间id名',
  `timenode` varchar(50) NOT NULL COMMENT '事件时间节点',
  PRIMARY KEY (`id`),
  KEY `notify_state` (`issend`) USING BTREE,
  KEY `notify_uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=775 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`,`sendemail`,`sendmessage`,`sendsms`,`type`) VALUES ('message_digg', '微博的赞', 'message', 'message/default/Digg message title', 'message/default/Digg message content','1','1','1','2'),
('message_empty_digg', '微博的无文字赞', 'message', 'message/default/Digg empty message title', 'message/default/Digg empty message content','1','1','1','2'),
('user_follow', '新粉丝提醒', 'message', 'message/default/Follow message title', 'message/default/Follow message content','1','1','1','2'),
('comment', '评论我的', 'message', 'message/default/Notify comment title', 'message/default/Notify comment content','0','0','0','1');

INSERT INTO `{{credit_rule}}` (`rulename`, `action`, `cycletype`, `rewardnum`,`extcredits1`, `extcredits2`) VALUES ('评论', 'addcomment', '3', '40','3','1'),
 ('被评论', 'getcomment', '3', '20', '2','1'),
('删除评论', 'delcomment', '3', '20', '-3','1');
INSERT INTO `{{cron}}` (`available`, `type`,`module`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES ( '1', 'system','message', '更新企业QQ授权有效期', 'CronUpdateBQQToken.php', '1391184000', '1393603200', '1', '-1', '0', '0');

DROP TABLE IF EXISTS `{{onlinetime}}`;
CREATE TABLE `{{onlinetime}}` (
  `uid` mediumint(8) unsigned NOT NULL default '0',
  `thismonth` smallint(6) unsigned NOT NULL default '0',
  `total` mediumint(8) unsigned NOT NULL default '0',
  `lastupdate` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{user}}`;
CREATE TABLE `{{user}}` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `isadministrator` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id标识: 0为非管理员，1为管理员',
  `deptid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `positionid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `roleid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `upuid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '直属领导id ',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `jobnumber` char(20) NOT NULL DEFAULT '' COMMENT '工号',
  `realname` char(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别\n(0女1男)',
  `weixin` varchar(100) NOT NULL DEFAULT '' COMMENT '微信号',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` char(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态，0正常、1锁定、2禁用',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `credits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总积分',
  `newcomer` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否新成员标识',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '用户身份验证码',
  `validationemail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证了邮件地址( (1为已验证0为未验证)',
  `validationmobile` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证了手机号码 (1为已验证0为未验证)',
  `lastchangepass` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改密码的时间',
  `guid` char(36) NOT NULL DEFAULT '' COMMENT '用户的唯一ID',
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `mobile` (`mobile`),
  KEY `email` (`email`),
  KEY `jobnumber` (`jobnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{user_count}}`;
CREATE TABLE `{{user_count}}` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `extcredits1` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分1',
  `extcredits2` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分2',
  `extcredits3` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分3',
  `extcredits4` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分4',
  `extcredits5` int(10) NOT NULL DEFAULT '0' COMMENT '扩展积分5',
  `attachsize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总附件大小',
  `oltime` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '在线时间',
  `feeds` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '动态数',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{user_group}}`;
CREATE TABLE `{{user_group}}` (
  `gid` smallint(6) unsigned NOT NULL auto_increment COMMENT '用户组ID',
  `grade` tinyint(3) unsigned NOT NULL default '0' COMMENT '等级',
  `title` varchar(255) NOT NULL default '' COMMENT '组头衔',
  `system` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否为系统自带：1为是；0为否',
  `creditshigher` int(10) NOT NULL default '0' COMMENT '该组的积分上限',
  `creditslower` int(10) NOT NULL default '0' COMMENT '该组的积分下限',
  PRIMARY KEY  (`gid`),
  KEY `creditsrange` USING BTREE (`creditshigher`,`creditslower`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{user_status}}`;
CREATE TABLE `{{user_status}}` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户UID',
  `regip` char(15) NOT NULL default '' COMMENT '注册IP',
  `lastip` char(15) NOT NULL default '' COMMENT '最后登录IP',
  `lastvisit` int(10) unsigned NOT NULL default '0' COMMENT '最后访问',
  `lastactivity` int(10) unsigned NOT NULL default '0' COMMENT '最后活动',
  `invisible` tinyint(1) NOT NULL default '0' COMMENT '是否隐身登录',
  PRIMARY KEY  (`uid`),
  KEY `lastactivity` USING BTREE (`lastactivity`,`invisible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户状态表';
DROP TABLE IF EXISTS `{{user_profile}}`;
CREATE TABLE `{{user_profile}}` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `birthday` int(11) unsigned NOT NULL DEFAULT '0',
  `telephone` varchar(255) NOT NULL DEFAULT '' COMMENT '住宅电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `qq` varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ',
  `bio` varchar(255) NOT NULL DEFAULT '' COMMENT '自我介绍',
  `remindsetting` text COMMENT '提醒设置',
  `avatar_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大头像',
  `avatar_middle` varchar(255) NOT NULL DEFAULT '' COMMENT '中头像',
  `avatar_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像',
  `bg_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大背景',
  `bg_middle` varchar(255) NOT NULL DEFAULT '' COMMENT '中背景',
  `bg_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小背景',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户资料表';

DROP TABLE IF EXISTS `{{user_binding}}`;
CREATE TABLE `{{user_binding}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `bindvalue` text NOT NULL COMMENT '绑定的值',
  `app` char(30) NOT NULL COMMENT '绑定的类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidandapp` (`uid`,`app`),
  KEY `uid` (`uid`),
  KEY `app` (`app`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{failedlogin}}`;
CREATE TABLE `{{failedlogin}}` (
  `ip` char(15) NOT NULL DEFAULT '',
  `username` char(32) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{failedip}}`;
CREATE TABLE `{{failedip}}` (
  `ip` char(7) NOT NULL DEFAULT '',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`,`lastupdate`),
  KEY `lastupdate` (`lastupdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{bg_template}}`;
CREATE TABLE `{{bg_template}}` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `desc` varchar(50) NOT NULL DEFAULT '' COMMENT '背景图描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否选中',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统图片',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '背景图片地址',
  `image_path` varchar(100) NOT NULL DEFAULT '' COMMENT '背景图片地址相对路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{cache_user_detail}}`;
CREATE TABLE `{{cache_user_detail}}` (
  `uid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'UID' ,
  `detail`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细信息' ,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `deadline`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '过期时间' ,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


INSERT INTO `{{user_group}}` (`grade`, `title`, `system`, `creditshigher`, `creditslower`) VALUES ('1', '乞丐', '1', '-9999999', '0'),
('2', '初入江湖', '1', '0', '50'),
('3', '小有名气', '1', '50', '200'),
('4', '江湖少侠', '1', '200', '500'),
('5', '江湖大侠', '1', '500', '1000'),
('6', '一派掌门', '1', '1000', '3000'),
('7', '一代宗师', '1', '3000', '999999999');

INSERT INTO `{{credit_rule}}` (`rulename`, `action`, `cycletype`, `extcredits2`) VALUES ('每天登录', 'daylogin', '3', '2');
INSERT INTO `{{credit_rule}}` (`rulename`, `action`, `cycletype`, `extcredits1`, `extcredits2`, `extcredits3`) VALUES ('验证邮箱', 'verifyemail', '1', '10', '10', '2');
INSERT INTO `{{credit_rule}}` (`rulename`, `action`, `cycletype`, `extcredits1`, `extcredits2`, `extcredits3`) VALUES ('验证手机', 'verifymobile', '1', '10', '10', '2');
INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('user_group_upgrade', '用户组升级', 'user', 'user/default/User group upgrade title', 'user/default/User group upgrade content', '0', '1', '0', '2');
INSERT INTO `{{cron}}` (`available`, `type`,`module`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES ( '1', 'system','user', '清空本月在线时间', 'CronOnlinetimeMonthly.php', '1391184000', '1393603200', '-1', '1', '0', '0');

INSERT INTO `{{bg_template}}` (`id`, `desc`, `status`, `system`, `image`) VALUES ('1', '默认背景', '0', '1', 'data/home/template1_bg_big.jpg'),
('2', '大气磅礴', '0', '1', 'data/home/template2_bg_big.jpg'),
('3', '青葱时光', '0', '1', 'data/home/template3_bg_big.jpg');

DROP TABLE IF EXISTS `{{department}}`;
CREATE TABLE `{{department}}` (
  `deptid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `deptname` char(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `manager` mediumint(8) NOT NULL DEFAULT '0' COMMENT '部门主管',
  `leader` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subleader` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tel` char(15) NOT NULL DEFAULT '' COMMENT '部门电话',
  `fax` char(15) NOT NULL DEFAULT '' COMMENT '部门传真',
  `addr` char(100) NOT NULL DEFAULT '' COMMENT '部门地址',
  `func` char(255) NOT NULL DEFAULT '' COMMENT '部门职能',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  `isbranch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否作为分支机构',
  PRIMARY KEY (`deptid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{department_related}}`;
CREATE TABLE `{{department_related}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `deptid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{department_binding}}`;
CREATE TABLE `{{department_binding}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `deptid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '部门ID',
  `bindvalue` text NOT NULL COMMENT '绑定的值',
  `app` char(30) NOT NULL COMMENT '绑定的类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deptidandapp` (`deptid`,`app`),
  KEY `deptid` (`deptid`),
  KEY `app` (`app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{position}}`;
CREATE TABLE `{{position}}` (
  `positionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `catid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '岗位分类',
  `posname` char(20) NOT NULL COMMENT '职位名称',
  `sort` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序序号',
  `goal` text NOT NULL COMMENT '职位权限',
  `minrequirement` text NOT NULL COMMENT '最低要求',
  `number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '在职人数',
  PRIMARY KEY (`positionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{position_category}}`;
CREATE TABLE `{{position_category}}` (
  `catid` mediumint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位分类id',
  `pid` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '岗位分类父id',
  `name` char(20) CHARACTER SET utf8 NOT NULL COMMENT '岗位分类名称',
  `sort` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序id',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{position_responsibility}}`;
CREATE TABLE `{{position_responsibility}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '职责范围与衡量标准id',
  `positionid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属岗位的id',
  `responsibility` text NOT NULL COMMENT '职责范围',
  `criteria` text NOT NULL COMMENT '衡量标准',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{position_related}}`;
CREATE TABLE `{{position_related}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `positionid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '岗位id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `{{position_category}}` (`catid`, `pid`, `name`, `sort`) VALUES ('1', '0', '默认分类', '1');
INSERT INTO `{{position}}` (`catid`, `posname`, `sort`, `goal`, `minrequirement`, `number`) VALUES ('1', '总经理', '1', '', '', '0'),
 ('1', '部门经理', '2', '', '', '0'),
('1', '职员', '3', '', '', '0');

DROP TABLE IF EXISTS `{{auth_item}}`;
CREATE TABLE `{{auth_item}}` (
  `name` varchar(64) NOT NULL COMMENT '项目名字',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL COMMENT '项目描述',
  `bizrule` text NOT NULL COMMENT '关联到这个项目的业务逻辑',
  `data` text NOT NULL COMMENT '当执行业务规则的时候所传递的额外的数据',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{auth_assignment}}`;
CREATE TABLE `{{auth_assignment}}` (
  `itemname` varchar(64) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `bizrule` text NOT NULL COMMENT '关联到这个项目的业务逻辑',
  `data` text NOT NULL COMMENT '当执行业务规则的时候所传递的额外的数据',
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{auth_item_child}}`;
CREATE TABLE `{{auth_item_child}}` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{node}}`;
CREATE TABLE `{{node}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `module` varchar(30) NOT NULL COMMENT '模块名',
  `key` varchar(20) NOT NULL COMMENT '授权节点key',
  `node` varchar(20) NOT NULL COMMENT '子节点(如果有)',
  `name` varchar(20) NOT NULL COMMENT '节点名称',
  `group` varchar(20) NOT NULL COMMENT '分组',
  `category` varchar(20) NOT NULL COMMENT '分类',
  `type` enum('data','node') NOT NULL DEFAULT 'node' COMMENT '节点类型',
  `routes` text NOT NULL COMMENT '路由',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{node_related}}`;
CREATE TABLE `{{node_related}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `roleid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `module` varchar(30) NOT NULL COMMENT '模块名称',
  `key` varchar(20) NOT NULL COMMENT '授权节点key',
  `node` varchar(20) NOT NULL COMMENT '节点（如果有）',
  `val` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '数据权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{role}}`;
CREATE TABLE `{{role}}` (
  `roleid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` char(20) NOT NULL COMMENT '角色名称',
  `roletype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '角色类型，默认0，普通角色0，普通管理员1',
  PRIMARY KEY (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `{{role_related}}`;
CREATE TABLE `{{role_related}}` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id',
  `roleid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `{{role}}` ( `roleid`, `rolename` ) VALUES ('1', '管理员'),('2', '编辑人员'),('3', '普通成员');

REPLACE INTO `{{node_related}}` (`roleid`, `module`, `key`, `node`, `val`) VALUES ('1', 'recruit', 'bgchecks', '', '0'),
('1', 'recruit', 'statistics', '', '0'),
('1', 'vote', 'view', '', '0'),
('1', 'vote', 'publish', '', '0'),
('1', 'vote', 'manager', '', '0'),
('1', 'workflow', 'use', '', '0'),
('1', 'workflow', 'entrust', '', '0'),
('1', 'workflow', 'destroy', '', '0'),
('1', 'workflow', 'flow', '', '0'),
('1', 'workflow', 'form', '', '0'),
('1', 'recruit', 'interview', '', '0'),
('1', 'recruit', 'contact', '', '0'),
('1', 'recruit', 'resume', '', '0'),
('1', 'contact', 'contact', '', '0'),
('1', 'thread', 'thread', '', '0'),
('1', 'thread', 'manager', '', '0'),
('1', 'meeting', 'room', '', '0'),
('1', 'meeting', 'manager', '', '0'),
('1', 'attendance', 'view', '', '0'),
('1', 'meeting', 'apply', '', '0'),
('1', 'attendance', 'arrange', '', '0'),
('1', 'attendance', 'shift', '', '0'),
('1', 'report', 'statistics', '', '0'),
('1', 'report', 'review', '', '0'),
('1', 'report', 'report', '', '0'),
('1', 'file', 'company', '', '0'),
('1', 'file', 'persoanl', '', '0'),
('1', 'email', 'webinbox', '', '0'),
('1', 'email', 'inbox', '', '0'),
('1', 'diary', 'statistics', '', '0'),
('1', 'diary', 'review', '', '0'),
('1', 'diary', 'diary', '', '0'),
('1', 'calendar', 'loop', '', '0'),
('1', 'calendar', 'task', '', '0'),
('1', 'calendar', 'schedule', '', '0'),
('1', 'assignment', 'review', '', '0'),
('1', 'assignment', 'assignment', '', '0'),
('1', 'officialdoc', 'manager', 'del', '8'),
('1', 'officialdoc', 'manager', 'edit', '8'),
('1', 'officialdoc', 'manager', '', '0'),
('1', 'officialdoc', 'category', '', '0'),
('1', 'officialdoc', 'publish', '', '0'),
('1', 'officialdoc', 'view', '', '0'),
('1', 'article', 'view', '', '0'),
('1', 'article', 'publish', '', '0'),
('1', 'article', 'category', '', '0'),
('1', 'article', 'manager', '', '0'),
('1', 'article', 'manager', 'edit', '8'),
('1', 'article', 'manager', 'del', '8');

REPLACE INTO `{{node_related}}` (`roleid`, `module`, `key`, `node`, `val`) VALUES ('2', 'workflow', 'form', '', '0'),
('2', 'workflow', 'flow', '', '0'),
('2', 'workflow', 'destroy', '', '0'),
('2', 'thread', 'manager', '', '0'),
('2', 'contact', 'contact', '', '0'),
('2', 'vote', 'view', '', '0'),
('2', 'vote', 'publish', '', '0'),
('2', 'vote', 'manager', '', '0'),
('2', 'workflow', 'use', '', '0'),
('2', 'workflow', 'entrust', '', '0'),
('2', 'thread', 'thread', '', '0'),
('2', 'meeting', 'room', '', '0'),
('2', 'meeting', 'manager', '', '0'),
('2', 'meeting', 'apply', '', '0'),
('2', 'report', 'statistics', '', '0'),
('2', 'report', 'review', '', '0'),
('2', 'report', 'report', '', '0'),
('2', 'file', 'company', '', '0'),
('2', 'file', 'persoanl', '', '0'),
('2', 'email', 'webinbox', '', '0'),
('2', 'email', 'inbox', '', '0'),
('2', 'diary', 'statistics', '', '0'),
('2', 'diary', 'review', '', '0'),
('2', 'diary', 'diary', '', '0'),
('2', 'calendar', 'loop', '', '0'),
('2', 'calendar', 'task', '', '0'),
('2', 'calendar', 'schedule', '', '0'),
('2', 'assignment', 'review', '', '0'),
('2', 'assignment', 'assignment', '', '0'),
('2', 'officialdoc', 'manager', 'del', '8'),
('2', 'officialdoc', 'manager', 'edit', '8'),
('2', 'officialdoc', 'manager', '', '0'),
('2', 'officialdoc', 'publish', '', '0'),
('2', 'officialdoc', 'view', '', '0'),
('2', 'article', 'manager', 'del', '8'),
('2', 'article', 'manager', 'edit', '8'),
('2', 'article', 'manager', '', '0'),
('2', 'article', 'publish', '', '0'),
('2', 'article', 'view', '', '0');

REPLACE INTO `{{node_related}}` (`roleid`, `module`, `key`, `node`, `val`) VALUES ('3', 'workflow', 'destroy', '', '0'),
('3', 'workflow', 'entrust', '', '0'),
('3', 'workflow', 'use', '', '0'),
('3', 'vote', 'view', '', '0'),
('3', 'contact', 'contact', '', '0'),
('3', 'thread', 'manager', '', '0'),
('3', 'thread', 'thread', '', '0'),
('3', 'meeting', 'room', '', '0'),
('3', 'meeting', 'manager', '', '0'),
('3', 'meeting', 'apply', '', '0'),
('3', 'report', 'statistics', '', '0'),
('3', 'report', 'review', '', '0'),
('3', 'report', 'report', '', '0'),
('3', 'file', 'company', '', '0'),
('3', 'file', 'persoanl', '', '0'),
('3', 'email', 'inbox', '', '0'),
('3', 'email', 'webinbox', '', '0'),
('3', 'diary', 'statistics', '', '0'),
('3', 'diary', 'review', '', '0'),
('3', 'diary', 'diary', '', '0'),
('3', 'calendar', 'loop', '', '0'),
('3', 'calendar', 'task', '', '0'),
('3', 'calendar', 'schedule', '', '0'),
('3', 'assignment', 'review', '', '0'),
('3', 'assignment', 'assignment', '', '0'),
('3', 'officialdoc', 'view', '', '0'),
('3', 'article', 'view', '', '0');

INSERT INTO `{{module}}` (`module`, `name`, `url`, `iscore`, `version`, `icon`, `category`, `description`, `config`, `sort`, `disabled`, `installdate`, `updatedate`) VALUES ('crm', 'CRM', 'crm/index/index', '0', '1.0', '1', 'CRM', '客户关系管理系统', '{\"param\":{\"name\":\"CRM\",\"category\":\"CRM\",\"description\":\"\\u5ba2\\u6237\\u5173\\u7cfb\\u7ba1\\u7406\\u7cfb\\u7edf\",\"author\":\"banyan @ IBOS Team Inc\",\"version\":\"1.0\",\"indexShow\":{\"link\":\"crm\\/index\\/index\"},\"icon\":1,\"url\":\"crm\\/index\\/index\"},\"config\":{\"modules\":{\"crm\":{\"class\":\"application\\\\modules\\\\crm\\\\CrmModule\"}},\"components\":{\"messages\":{\"extensionPaths\":{\"crm\":\"application.modules.crm.language\"}}}},\"authorization\":{\"index\":{\"type\":\"data\",\"name\":\"\\u9996\\u9875\",\"group\":\"\\u9996\\u9875\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"index\":[\"index\",\"getreport\",\"getsale\",\"getuser\",\"getdept\"],\"api\":[\"index\"],\"target\":[\"setting\",\"submit\",\"gettarget\",\"depttarget\"]}}}},\"lead\":{\"type\":\"data\",\"name\":\"\\u7ebf\\u7d22\",\"group\":\"\\u7ebf\\u7d22\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"lead\":[\"index\",\"getleadlist\"]}},\"add\":{\"name\":\"\\u521b\\u5efa\",\"controllerMap\":{\"lead\":[\"add\"]}},\"edit\":{\"name\":\"\\u7f16\\u8f91\",\"controllerMap\":{\"lead\":[\"edit\",\"trans\",\"changestatus\"]}},\"del\":{\"name\":\"\\u5220\\u9664\",\"controllerMap\":{\"lead\":[\"del\"]}},\"assign\":{\"name\":\"\\u5206\\u914d\",\"controllerMap\":{\"lead\":[\"assign\"]}},\"share\":{\"name\":\"\\u5206\\u4eab\",\"controllerMap\":{\"lead\":[\"share\"]}},\"export\":{\"name\":\"\\u5bfc\\u51fa\",\"controllerMap\":{\"lead\":[\"export\"]}}}},\"clients\":{\"type\":\"data\",\"name\":\"\\u5ba2\\u6237\",\"group\":\"\\u5ba2\\u6237\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"client\":[\"index\",\"getclientlist\",\"rule\",\"content\"],\"api\":[\"clientdetail\",\"clientlist\"]}},\"add\":{\"name\":\"\\u521b\\u5efa\",\"controllerMap\":{\"client\":[\"add\"],\"api\":[\"clientadd\"]}},\"edit\":{\"name\":\"\\u7f16\\u8f91\",\"controllerMap\":{\"client\":[\"edit\"],\"api\":[\"clientedit\"]}},\"del\":{\"name\":\"\\u5220\\u9664\",\"controllerMap\":{\"client\":[\"del\"],\"api\":[\"clientremove\"]}},\"assign\":{\"name\":\"\\u5206\\u914d\",\"controllerMap\":{\"client\":[\"assign\"]}},\"share\":{\"name\":\"\\u5206\\u4eab\",\"controllerMap\":{\"client\":[\"share\"]}},\"export\":{\"name\":\"\\u5bfc\\u51fa\",\"controllerMap\":{\"client\":[\"export\"]}}}},\"contacts\":{\"type\":\"data\",\"name\":\"\\u8054\\u7cfb\\u4eba\",\"group\":\"\\u8054\\u7cfb\\u4eba\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"contact\":[\"index\",\"getcontactlist\",\"getcontact\",\"content\"],\"api\":[\"contactdetail\",\"contactlist\"]}},\"add\":{\"name\":\"\\u521b\\u5efa\",\"controllerMap\":{\"contact\":[\"add\"],\"api\":[\"contactadd\"]}},\"edit\":{\"name\":\"\\u7f16\\u8f91\",\"controllerMap\":{\"contact\":[\"edit\"],\"api\":[\"contactedit\"]}},\"del\":{\"name\":\"\\u5220\\u9664\",\"controllerMap\":{\"contact\":[\"del\"],\"api\":[\"contactremove\"]}},\"assign\":{\"name\":\"\\u5206\\u914d\",\"controllerMap\":{\"contact\":[\"assign\"]}},\"share\":{\"name\":\"\\u5206\\u4eab\",\"controllerMap\":{\"contact\":[\"share\"]}},\"export\":{\"name\":\"\\u5bfc\\u51fa\",\"controllerMap\":{\"contact\":[\"export\"]}}}},\"opportunitys\":{\"type\":\"data\",\"name\":\"\\u5546\\u673a\",\"group\":\"\\u5546\\u673a\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"opportunity\":[\"index\",\"getopportunitylist\",\"content\"],\"api\":[\"oppdetail\",\"opplist\"]}},\"add\":{\"name\":\"\\u521b\\u5efa\",\"controllerMap\":{\"opportunity\":[\"add\"],\"api\":[\"oppadd\"]}},\"edit\":{\"name\":\"\\u7f16\\u8f91\",\"controllerMap\":{\"opportunity\":[\"edit\"],\"api\":[\"oppedit\"]}},\"del\":{\"name\":\"\\u5220\\u9664\",\"controllerMap\":{\"opportunity\":[\"del\"],\"api\":[\"oppremove\"]}},\"assign\":{\"name\":\"\\u5206\\u914d\",\"controllerMap\":{\"opportunity\":[\"assign\"]}},\"share\":{\"name\":\"\\u5206\\u4eab\",\"controllerMap\":{\"opportunity\":[\"share\"]}},\"export\":{\"name\":\"\\u5bfc\\u51fa\",\"controllerMap\":{\"opportunity\":[\"export\"]}}}},\"contracts\":{\"type\":\"data\",\"name\":\"\\u5408\\u540c\",\"group\":\"\\u5408\\u540c\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"contract\":[\"index\",\"getcontractlist\"]}},\"add\":{\"name\":\"\\u521b\\u5efa\",\"controllerMap\":{\"contract\":[\"add\"]}},\"edit\":{\"name\":\"\\u7f16\\u8f91\",\"controllerMap\":{\"contract\":[\"edit\"]}},\"del\":{\"name\":\"\\u5220\\u9664\",\"controllerMap\":{\"contract\":[\"del\"]}},\"assign\":{\"name\":\"\\u5206\\u914d\",\"controllerMap\":{\"contract\":[\"assign\"]}},\"share\":{\"name\":\"\\u5206\\u4eab\",\"controllerMap\":{\"contract\":[\"share\"]}}}},\"receipts\":{\"type\":\"data\",\"name\":\"\\u6536\\u6b3e\",\"group\":\"\\u6536\\u6b3e\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"receipt\":[\"index\",\"getreceiptlist\"]}},\"add\":{\"name\":\"\\u521b\\u5efa\",\"controllerMap\":{\"receipt\":[\"add\"]}},\"edit\":{\"name\":\"\\u7f16\\u8f91\",\"controllerMap\":{\"receipt\":[\"edit\"]}},\"del\":{\"name\":\"\\u5220\\u9664\",\"controllerMap\":{\"receipt\":[\"del\"]}}}},\"events\":{\"type\":\"data\",\"name\":\"\\u8ddf\\u8fdb\",\"group\":\"\\u8ddf\\u8fdb\",\"node\":{\"index\":{\"name\":\"\\u8bfb\\u53d6\",\"controllerMap\":{\"event\":[\"index\",\"geteventlist\"],\"api\":[\"eventdetail\",\"eventlist\"]}},\"add\":{\"name\":\"\\u521b\\u5efa\",\"controllerMap\":{\"event\":[\"add\"],\"api\":[\"eventadd\"]}},\"edit\":{\"name\":\"\\u7f16\\u8f91\",\"controllerMap\":{\"event\":[\"edit\"],\"api\":[\"eventedit\"]}},\"del\":{\"name\":\"\\u5220\\u9664\",\"controllerMap\":{\"event\":[\"del\"],\"api\":[\"eventremove\"]}}}},\"highseamanager\":{\"type\":\"node\",\"name\":\"\\u516c\\u6d77\\u7ba1\\u7406\",\"group\":\"\\u9ad8\\u7ea7\\u8bbe\\u7f6e\",\"controllerMap\":{\"highseas\":[\"add\",\"edit\",\"del\",\"index\"]}},\"tags\":{\"type\":\"node\",\"name\":\"\\u6807\\u7b7e\\u7ba1\\u7406\",\"group\":\"\\u9ad8\\u7ea7\\u8bbe\\u7f6e\",\"controllerMap\":{\"tag\":[\"index\",\"add\",\"edit\",\"del\"]}},\"products\":{\"type\":\"node\",\"name\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"group\":\"\\u9ad8\\u7ea7\\u8bbe\\u7f6e\",\"controllerMap\":{\"product\":[\"index\",\"add\",\"edit\",\"del\"]}}}}', '0', '0', '1510814744', '0'),
('dashboard', '后台管理', '', '1', '1.0', '1', '权限列表', '提供IBOS后台管理所需功能', '{\"param\":{\"name\":\"\\u540e\\u53f0\\u7ba1\\u7406\",\"category\":\"\\u6743\\u9650\\u5217\\u8868\",\"description\":\"\\u63d0\\u4f9bIBOS\\u540e\\u53f0\\u7ba1\\u7406\\u6240\\u9700\\u529f\\u80fd\",\"author\":\"banyanCheung @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"url\":\"\"},\"config\":{\"modules\":{\"dashboard\":{\"class\":\"application\\\\modules\\\\dashboard\\\\DashboardModule\"}},\"components\":{\"messages\":{\"extensionPaths\":{\"dashboard\":\"application.modules.dashboard.language\"}}}},\"authorization\":{\"cobindings\":{\"type\":\"node\",\"name\":\"\\u9177\\u529e\\u516c\\u7ed1\\u5b9a\",\"group\":\"\\u7ed1\\u5b9a\",\"controllerMap\":{\"cobinding\":[\"index\"],\"cosync\":[\"index\"]}},\"wxbindings\":{\"type\":\"node\",\"name\":\"\\u5fae\\u4fe1\\u4f01\\u4e1a\\u53f7\\u7ed1\\u5b9a\",\"group\":\"\\u7ed1\\u5b9a\",\"controllerMap\":{\"wxbinding\":[\"index\"]}},\"ims\":{\"type\":\"node\",\"name\":\"\\u5373\\u65f6\\u901a\\u8baf\\u7ed1\\u5b9a\",\"group\":\"\\u7ed1\\u5b9a\",\"controllerMap\":{\"im\":[\"index\"]}},\"globals\":{\"type\":\"node\",\"name\":\"\\u5355\\u4f4d\\u7ba1\\u7406\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"unit\":[\"index\"]}},\"credits\":{\"type\":\"node\",\"name\":\"\\u79ef\\u5206\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"credit\":[\"setup\"]}},\"usergroups\":{\"type\":\"node\",\"name\":\"\\u7528\\u6237\\u7ec4\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"usergroup\":[\"index\"]}},\"optimizes\":{\"type\":\"node\",\"name\":\"\\u6027\\u80fd\\u4f18\\u5316\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"optimize\":[\"cache\"]}},\"dates\":{\"type\":\"node\",\"name\":\"\\u65f6\\u95f4\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"date\":[\"index\"]}},\"uploads\":{\"type\":\"node\",\"name\":\"\\u4e0a\\u4f20\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"upload\":[\"index\"]}},\"smss\":{\"type\":\"node\",\"name\":\"\\u624b\\u673a\\u77ed\\u4fe1\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"sms\":[\"manager\"]}},\"syscodes\":{\"type\":\"node\",\"name\":\"\\u7cfb\\u7edf\\u4ee3\\u7801\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"syscode\":[\"index\"]}},\"emails\":{\"type\":\"node\",\"name\":\"\\u90ae\\u4ef6\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"email\":[\"setup\"]}},\"securitys\":{\"type\":\"node\",\"name\":\"\\u5b89\\u5168\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"security\":[\"setup\"]}},\"sysstamps\":{\"type\":\"node\",\"name\":\"\\u7cfb\\u7edf\\u56fe\\u7ae0\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"sysstamp\":[\"index\"]}},\"approvals\":{\"type\":\"node\",\"name\":\"\\u5ba1\\u6279\\u6d41\\u7a0b\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"approval\":[\"index\"]}},\"notifys\":{\"type\":\"node\",\"name\":\"\\u63d0\\u9192\\u7b56\\u7565\\u8bbe\\u7f6e\",\"group\":\"\\u5168\\u5c40\",\"controllerMap\":{\"notify\":[\"setup\"]}},\"users\":{\"type\":\"node\",\"name\":\"\\u90e8\\u95e8\\u7528\\u6237\\u7ba1\\u7406\",\"group\":\"\\u7528\\u6237\",\"controllerMap\":{\"user\":[\"index\"]}},\"roles\":{\"type\":\"node\",\"name\":\"\\u89d2\\u8272\\u6743\\u9650\\u7ba1\\u7406\",\"group\":\"\\u7528\\u6237\",\"controllerMap\":{\"role\":[\"index\"]}},\"positions\":{\"type\":\"node\",\"name\":\"\\u5c97\\u4f4d\\u7ba1\\u7406\",\"group\":\"\\u7528\\u6237\",\"controllerMap\":{\"position\":[\"index\"]}},\"roleadmins\":{\"type\":\"node\",\"name\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"group\":\"\\u7528\\u6237\",\"controllerMap\":{\"roleadmin\":[\"index\"]}},\"navs\":{\"type\":\"node\",\"name\":\"\\u9876\\u90e8\\u5bfc\\u822a\\u8bbe\\u7f6e\",\"group\":\"\\u754c\\u9762\",\"controllerMap\":{\"nav\":[\"index\"]}},\"quicknavs\":{\"type\":\"node\",\"name\":\"\\u5feb\\u6377\\u5bfc\\u822a\\u8bbe\\u7f6e\",\"group\":\"\\u754c\\u9762\",\"controllerMap\":{\"quicknav\":[\"index\"]}},\"logins\":{\"type\":\"node\",\"name\":\"\\u767b\\u5f55\\u9875\\u80cc\\u666f\\u8bbe\\u7f6e\",\"group\":\"\\u754c\\u9762\",\"controllerMap\":{\"login\":[\"index\"]}},\"backgrounds\":{\"type\":\"node\",\"name\":\"\\u7cfb\\u7edf\\u80cc\\u666f\\u8bbe\\u7f6e\",\"group\":\"\\u754c\\u9762\",\"controllerMap\":{\"backgroud\":[\"index\"]}},\"modules\":{\"type\":\"node\",\"name\":\"\\u6a21\\u5757\\u7ba1\\u7406\",\"group\":\"\\u6a21\\u5757\",\"controllerMap\":{\"module\":[\"manager\"]}},\"permissionss\":{\"type\":\"node\",\"name\":\"\\u6743\\u9650\\u8bbe\\u7f6e\",\"group\":\"\\u6a21\\u5757\",\"controllerMap\":{\"permissions\":[\"setup\"]}},\"updates\":{\"type\":\"node\",\"name\":\"\\u66f4\\u65b0\\u7f13\\u5b58\",\"group\":\"\\u7ba1\\u7406\",\"controllerMap\":{\"update\":[\"index\"]}},\"announcements\":{\"type\":\"node\",\"name\":\"\\u7cfb\\u7edf\\u516c\\u544a\",\"group\":\"\\u7ba1\\u7406\",\"controllerMap\":{\"announcement\":[\"setup\"]}},\"databases\":{\"type\":\"node\",\"name\":\"\\u6570\\u636e\\u5e93\",\"group\":\"\\u7ba1\\u7406\",\"controllerMap\":{\"database\":[\"backup\"]}},\"crons\":{\"type\":\"node\",\"name\":\"\\u8ba1\\u5212\\u4efb\\u52a1\",\"group\":\"\\u7ba1\\u7406\",\"controllerMap\":{\"cron\":[\"index\"]}},\"upgrades\":{\"type\":\"node\",\"name\":\"\\u5728\\u7ebf\\u5347\\u7ea7\",\"group\":\"\\u7ba1\\u7406\",\"controllerMap\":{\"upgrade\":[\"index\"]}},\"services\":{\"type\":\"node\",\"name\":\"\\u4e91\\u670d\\u52a1\",\"group\":\"\\u670d\\u52a1\",\"controllerMap\":{\"service\":[\"index\"]}}}}', '0', '0', '1510814744', '0'),
('department', '部门模块', '', '1', '1.0', '1', '', '提供IBOS部门管理所需功能', '{\"param\":{\"name\":\"\\u90e8\\u95e8\\u6a21\\u5757\",\"description\":\"\\u63d0\\u4f9bIBOS\\u90e8\\u95e8\\u7ba1\\u7406\\u6240\\u9700\\u529f\\u80fd\",\"author\":\"banyanCheung @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"category\":\"\",\"url\":\"\"},\"config\":{\"modules\":{\"department\":{\"class\":\"application\\\\modules\\\\department\\\\DepartmentModule\"}},\"components\":{\"messages\":{\"extensionPaths\":{\"department\":\"application.modules.department.language\"}}}}}', '0', '0', '1510814744', '0'),
('main', '核心模块', 'main/default/index', '1', '1.0', '1', '', '系统核心模块。提供IBOS程序核心流程初始化及处理', '{\"param\":{\"name\":\"\\u6838\\u5fc3\\u6a21\\u5757\",\"description\":\"\\u7cfb\\u7edf\\u6838\\u5fc3\\u6a21\\u5757\\u3002\\u63d0\\u4f9bIBOS\\u7a0b\\u5e8f\\u6838\\u5fc3\\u6d41\\u7a0b\\u521d\\u59cb\\u5316\\u53ca\\u5904\\u7406\",\"author\":\"banyanCheung @ IBOS Team Inc\",\"version\":\"1.0\",\"indexShow\":{\"widget\":[\"main\\/voiceConference\"],\"link\":\"main\\/default\\/index\"},\"icon\":1,\"category\":\"\",\"url\":\"main\\/default\\/index\"},\"config\":{\"modules\":{\"main\":{\"class\":\"application\\\\modules\\\\main\\\\MainModule\"}},\"components\":{\"setting\":{\"class\":\"application\\\\modules\\\\main\\\\components\\\\Setting\"},\"session\":{\"class\":\"application\\\\modules\\\\main\\\\components\\\\Session\"},\"cron\":{\"class\":\"application\\\\modules\\\\main\\\\components\\\\Cron\"},\"process\":{\"class\":\"application\\\\modules\\\\main\\\\components\\\\Process\"},\"errorHandler\":{\"errorAction\":\"main\\/default\\/error\"},\"messages\":{\"extensionPaths\":{\"main\":\"application.modules.main.language\"}}}},\"behaviors\":{\"onInitModule\":{\"class\":\"application\\\\modules\\\\main\\\\behaviors\\\\InitMainModule\"}}}', '0', '0', '1510814744', '0'),
('message', '消息模块', '', '1', '1.0', '1', '', '系统核心模块。提供IBOS程序消息体系的建立。包括@人，提醒,评论，私信，微博及动态', '{\"param\":{\"name\":\"\\u6d88\\u606f\\u6a21\\u5757\",\"description\":\"\\u7cfb\\u7edf\\u6838\\u5fc3\\u6a21\\u5757\\u3002\\u63d0\\u4f9bIBOS\\u7a0b\\u5e8f\\u6d88\\u606f\\u4f53\\u7cfb\\u7684\\u5efa\\u7acb\\u3002\\u5305\\u62ec@\\u4eba\\uff0c\\u63d0\\u9192,\\u8bc4\\u8bba\\uff0c\\u79c1\\u4fe1\\uff0c\\u5fae\\u535a\\u53ca\\u52a8\\u6001\",\"author\":\"banyanCheung @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"category\":\"\",\"url\":\"\"},\"config\":{\"modules\":{\"message\":{\"class\":\"application\\\\modules\\\\message\\\\MessageModule\"}},\"components\":{\"messages\":{\"extensionPaths\":{\"message\":\"application.modules.message.language\"}}}}}', '0', '0', '1510814744', '0'),
('mobile', 'IBOS移动平台', '', '1', '1.0', '1', '', '提供IBOS移动平台数据请求和处理相关功能', '{\"param\":{\"name\":\"IBOS\\u79fb\\u52a8\\u5e73\\u53f0\",\"description\":\"\\u63d0\\u4f9bIBOS\\u79fb\\u52a8\\u5e73\\u53f0\\u6570\\u636e\\u8bf7\\u6c42\\u548c\\u5904\\u7406\\u76f8\\u5173\\u529f\\u80fd\",\"author\":\"Aeolus @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"category\":\"\",\"url\":\"\"},\"config\":{\"modules\":{\"mobile\":{\"class\":\"application\\\\modules\\\\mobile\\\\MobileModule\"}},\"components\":{\"messages\":{\"extensionPaths\":{\"mobile\":\"application.modules.mobile.language\"}}}}}', '0', '0', '1510814744', '0'),
('position', '岗位模块', '', '1', '1.0', '1', '', '提供IBOS岗位管理所需功能', '{\"param\":{\"name\":\"\\u5c97\\u4f4d\\u6a21\\u5757\",\"description\":\"\\u63d0\\u4f9bIBOS\\u5c97\\u4f4d\\u7ba1\\u7406\\u6240\\u9700\\u529f\\u80fd\",\"author\":\"banyanCheung @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"category\":\"\",\"url\":\"\"},\"config\":{\"modules\":{\"position\":{\"class\":\"application\\\\modules\\\\position\\\\PositionModule\"}}}}', '0', '0', '1510814744', '0'),
('role', '角色模块', '', '1', '1.0', '1', '', '提供IBOS角色管理所需功能', '{\"param\":{\"name\":\"\\u89d2\\u8272\\u6a21\\u5757\",\"description\":\"\\u63d0\\u4f9bIBOS\\u89d2\\u8272\\u7ba1\\u7406\\u6240\\u9700\\u529f\\u80fd\",\"author\":\"banyanCheung @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"category\":\"\",\"url\":\"\"},\"config\":{\"modules\":{\"position\":{\"class\":\"application\\\\modules\\\\role\\\\RoleModule\"}}}}', '0', '0', '1510814744', '0'),
('user', '用户模块', '', '1', '1.0', '1', '', '核心模块。提供用户管理，登录验证等功能', '{\"param\":{\"name\":\"\\u7528\\u6237\\u6a21\\u5757\",\"description\":\"\\u6838\\u5fc3\\u6a21\\u5757\\u3002\\u63d0\\u4f9b\\u7528\\u6237\\u7ba1\\u7406\\uff0c\\u767b\\u5f55\\u9a8c\\u8bc1\\u7b49\\u529f\\u80fd\",\"author\":\"banyanCheung @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"category\":\"\",\"url\":\"\"},\"config\":{\"modules\":{\"user\":{\"class\":\"application\\\\modules\\\\user\\\\UserModule\"}},\"components\":{\"user\":{\"allowAutoLogin\":1,\"class\":\"application\\\\modules\\\\user\\\\components\\\\User\",\"loginUrl\":[\"user\\/default\\/login\"]},\"messages\":{\"extensionPaths\":{\"user\":\"application.modules.user.language\"}}}}}', '0', '0', '1510814744', '0'),
('weibo', '企业微博', '', '2', '1.0', '1', '', '企业微博', '{\"param\":{\"name\":\"\\u4f01\\u4e1a\\u5fae\\u535a\",\"description\":\"\\u4f01\\u4e1a\\u5fae\\u535a\",\"author\":\"banyan @ IBOS Team Inc\",\"version\":\"1.0\",\"icon\":1,\"category\":\"\",\"url\":\"\"},\"config\":{\"modules\":{\"weibo\":{\"class\":\"application\\\\modules\\\\weibo\\\\WeiboModule\"}},\"components\":{\"messages\":{\"extensionPaths\":{\"weibo\":\"application.modules.weibo.language\"}}}}}', '0', '0', '1510814744', '0');


INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('normal_alarm_notily', '普通提醒', 'message', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1'),
('meeting_management', '会议管理', 'meeting', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1'),
('fixed_assets', '固定资产', 'assets', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1'),
('project_thread', '项目主线', 'thread', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1'),
('handling_work', '办理工作', 'workflow', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');
INSERT INTO `{{cron}}` (`available`, `type`, `module`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES ('1', 'system', 'message', '发送通用提醒', 'CronSentNoifyAlarm.php', '1511160683', '1511160720', '-1', '-1', '-1', '*/1');