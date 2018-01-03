DROP TABLE IF EXISTS {{crm_attachment}};
CREATE TABLE `{{crm_attachment}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `key` char(60) NOT NULL DEFAULT '' COMMENT '记录ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  `name` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '附件名称',
  `module` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '附件所在模块',
  `format` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '附件格式',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序号（用于缩略图排序）',
  `isele` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是电子档，1是0否，默认0，表示普通附件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`key`,`aid`,`module`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='CRM附件记录表';

DROP TABLE IF EXISTS {{crm_authority}};
CREATE TABLE `{{crm_authority}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `roleid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `limit` int(10) unsigned DEFAULT '0' COMMENT '客户上限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限关联表';

DROP TABLE IF EXISTS {{crm_client}};
CREATE TABLE `{{crm_client}}` (
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '客户表',
  `leadid` char(60) NOT NULL DEFAULT '' COMMENT '线索ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `assignuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分配者ID',
  `assigntime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分配的时间',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的创建者ID',
  `editor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的最后编辑者ID',
  `lastuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后归属用户',
  `seaid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公海ID',
  `fullname` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户公司全称',
  `shortname` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户公司简称',
  `address` char(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户地址',
  `website` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户网站地址',
  `phone` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户电话',
  `email` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮件地址',
  `zipcode` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮政编码',
  `number` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户编号',
  `desc` text CHARACTER SET utf8 NOT NULL COMMENT '客户公司简介',
  `contacts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '联系人数',
  `opportunitys` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '机会数',
  `events` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '事件数',
  `snapshoots` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照数',
  `latestevent` char(60) NOT NULL DEFAULT '' COMMENT '最近的事件',
  `latesteventtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最近事件的时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料更新时间',
  `movetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '移入公海时间',
  `isunread` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新分配是否已读',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（扩展，暂未用到）',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签顺序（对应tag_related表，为了加快查询速度）',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户表';

DROP TABLE IF EXISTS {{crm_client_get}};
CREATE TABLE `{{crm_client_get}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `seaid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公海ID',
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '客户ID',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领取时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='领取客户记录表';

DROP TABLE IF EXISTS {{crm_client_index}};
CREATE TABLE `{{crm_client_index}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引流水ID',
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '客户流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分享用户ID',
  `shareuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '谁分享给你的用户UID',
  `edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有编辑权限',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分享权限',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分配权限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户索引表';

DROP TABLE IF EXISTS {{crm_client_snapshoot}};
CREATE TABLE `{{crm_client_snapshoot}}` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '快照流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照创建者ID',
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '客户表',
  `fullname` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户公司全称',
  `shortname` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户公司简称',
  `address` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户地址',
  `website` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户网站地址',
  `email` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮件地址',
  `phone` char(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '电话',
  `zipcode` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮政编码',
  `number` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户编号',
  `desc` char(150) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户公司简介',
  `bizscope` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '经营范围',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户公司注册时间',
  `regasset` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册公司资本',
  `licence` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '营业执照注册号',
  `licenceaddress` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '注册所在地',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照创建时间',
  PRIMARY KEY (`sid`)
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户详细记录快照表';

DROP TABLE IF EXISTS {{crm_client_to_contact}};
CREATE TABLE `{{crm_client_to_contact}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '客户ID',
  `contactid` char(60) NOT NULL DEFAULT '' COMMENT '联系人ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户与联系人关联表';

DROP TABLE IF EXISTS {{crm_client_to_contact_snapshoot}};
CREATE TABLE `{{crm_client_to_contact_snapshoot}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照ID',
  `contactid` char(60) NOT NULL DEFAULT '' COMMENT '联系人ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户与联系人关联快照表';

DROP TABLE IF EXISTS {{crm_contact}};
CREATE TABLE `{{crm_contact}}` (
  `contactid` char(60) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流水ID',
  `leadid` char(60) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '线索ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `assignuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分配者ID',
  `assigntime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分配的时间',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的创建者ID',
  `editor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的最后编辑者ID',
  `name` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` char(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系人手机号码',
  `company` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '公司名',
  `position` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '职务',
  `department` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '部门',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别 (0男1女2未知)',
  `avatar` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '原头像地址 ',
  `birthday` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生日时间戳',
  `hobby` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系人爱好',
  `number` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '编号',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '备注',
  `snapshoots` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照数',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料更新时间',
  `lasttouchtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后接触时间',
  `isunread` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '谁分配给你的标记，点击编辑后置零',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（扩展，暂未用到）',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签顺序（对应tag_related表，为了加快查询速度）',
  `initial` char(2) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系人首字母',
  PRIMARY KEY (`contactid`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='联系人表';

DROP TABLE IF EXISTS {{crm_contact_extend}};
CREATE TABLE `{{crm_contact_extend}}` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `contactid` char(60) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '联系人ID',
  `key` char(60) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '扩展字段键',
  `value` text CHARACTER SET utf8 NOT NULL COMMENT '扩展字段值',
  PRIMARY KEY (`id`),
  KEY `contactid` (`contactid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='联系人扩展表';

DROP TABLE IF EXISTS {{crm_contact_index}};
CREATE TABLE `{{crm_contact_index}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引流水ID',
  `contactid` char(60) NOT NULL DEFAULT '' COMMENT '联系人ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分享用户ID',
  `shareuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '谁分享给你的用户UID',
  `edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有编辑权限',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分享权限',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分配权限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='联系人索引表';

DROP TABLE IF EXISTS {{crm_contact_snapshoot}};
CREATE TABLE `{{crm_contact_snapshoot}}` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '快照流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照创建者ID',
  `contactid` char(60) NOT NULL DEFAULT '' COMMENT '联系人ID',
  `name` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `company` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '公司名',
  `position` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '职务',
  `department` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '部门',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别 (0男1女2未知)',
  `avatar` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '原头像地址',
  `birthday` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生日时间戳',
  `hobby` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系人爱好',
  `number` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '编号',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `lasttouchtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后接触时间',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='联系人快照表';

DROP TABLE IF EXISTS {{crm_contact_snapshoot_extend}};
CREATE TABLE `{{crm_contact_snapshoot_extend}}` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照ID',
  `key` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '扩展字段键',
  `value` text CHARACTER SET utf8 NOT NULL COMMENT '扩展字段值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='联系人快照扩展表';

DROP TABLE IF EXISTS {{crm_contract}};
CREATE TABLE `{{crm_contract}}` (
  `contractid` char(60) NOT NULL DEFAULT '' COMMENT '合同流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `name` varchar (255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '合同名称',
  `assignuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分配者ID',
  `assigntime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分配的时间',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的创建者ID',
  `editor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的最后编辑者ID',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '合同期限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料更新时间',
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '客户ID',
  `number` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '编号',
  `oid` char(60) NOT NULL DEFAULT '' COMMENT '机会ID',
  `signdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签约日期',
  `total` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '合同总额',
  `receipt` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已收款',
  `balance` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余款',
  `discount` float(2,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '折扣',
  `savemoney` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '打折优惠',
  `salesexpenses` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售费用',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '备注内容',
  `isunread` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新分配是否已读',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '合同状态（1：执行前，2：执行中，3：结束，4：终止）',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签顺序（对应tag_related表，为了加快查询速度）',
  PRIMARY KEY (`contractid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='合同表';

DROP TABLE IF EXISTS {{crm_contract_index}};
CREATE TABLE `{{crm_contract_index}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `contractid` char(60) NOT NULL DEFAULT '' COMMENT '合同id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分享用户ID',
  `shareuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享用户ID',
  `edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有编辑权限',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分享权限',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有分配权限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='合同索引表';

DROP TABLE IF EXISTS {{crm_contract_orderitem}};
CREATE TABLE `{{crm_contract_orderitem}}` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `contractid` char(60) NOT NULL DEFAULT '' COMMENT '合同ID',
  `productid` char(60) DEFAULT '' COMMENT '关联的产品流水ID（空时没有关联）',
  `name` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '产品名',
  `actualprice` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '成交价',
  `origprice` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价',
  `unit` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '产品单位',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS {{crm_event}};
CREATE TABLE `{{crm_event}}` (
  `eventid` char(60) NOT NULL DEFAULT '' COMMENT '事件流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `assignuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分配给你的用户ID',
  `assigntime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分配的时间',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的创建者ID',
  `editor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的最后编辑者ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料更新时间',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '事件内容',
  `location` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '事件发生地点',
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '客户ID',
  `contractid` char(60) NOT NULL DEFAULT '' COMMENT '合同ID',
  `oid` char(60) NOT NULL DEFAULT '' COMMENT '机会ID',
  `begin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '事件开始时间',
  `end` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '事件结束时间',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '事件类型（0：普通事件，1：系统自动生成事件 ， 2：月总结 ，4：周总结）',
  `isunread` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新分配是否已读',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（扩展，暂未用到）',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签顺序（对应tag_related表，为了加快查询速度）',
  `source` char(20) NOT NULL DEFAULT '' COMMENT '事件来源',
  `at` char(20) NOT NULL DEFAULT '' COMMENT 'at用户uid',
  PRIMARY KEY (`eventid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='事件表';

DROP TABLE IF EXISTS {{crm_event_index}};
CREATE TABLE `{{crm_event_index}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `eventid` char(60) NOT NULL DEFAULT '' COMMENT '事件ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分享用户ID',
  `shareuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '谁分享给你的用户UID',
  `edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有编辑权限',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分享权限',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分配权限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='事件索引表';

DROP TABLE IF EXISTS {{crm_event_to_contact}};
CREATE TABLE `{{crm_event_to_contact}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `eventid` char(60) NOT NULL DEFAULT '' COMMENT '事件ID',
  `contactid` char(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='事件与联系人关联表';

DROP TABLE IF EXISTS {{crm_highseas}};
CREATE TABLE `{{crm_highseas}}` (
  `seaid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公海流水ID',
  `name` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户公海名称',
  `uid` text CHARACTER SET utf8 NOT NULL COMMENT '公海可见范围-人员',
  `deptid` text CHARACTER SET utf8 NOT NULL COMMENT '公海可见范围-部门',
  `positionid` text CHARACTER SET utf8 NOT NULL COMMENT '公海可见范围-岗位',
  `roleid` text CHARACTER SET utf8 NOT NULL COMMENT '公海可见范围-角色',
  `limit` int(10) unsigned DEFAULT NULL COMMENT '客户数上限',
  `clients` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前客户数',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统自带',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0表示不转入，1表示没跟进转入，2表示没商机转入',
  `cday` int(10) DEFAULT NULL COMMENT '没事件多少天转入',
  `oday` int(10) DEFAULT NULL COMMENT '没有商机多少天转入',
  PRIMARY KEY (`seaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户公海表';

DROP TABLE IF EXISTS {{crm_lead}};
CREATE TABLE `{{crm_lead}}` (
  `leadid` char(60) NOT NULL DEFAULT '' COMMENT '线索流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `assignuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分配者ID',
  `assigntime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分配的时间',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的创建者ID',
  `editor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的最后编辑者ID',
  `client` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '客户',
  `contact` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机',
  `phone` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '电话',
  `email` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `address` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '地址',
  `website` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '网址',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `isunread` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新分配是否已读',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '转化状态（1：无法联系，2：已取消，3：丢失，4：不感兴趣）',
  `converttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '线索转化的时间',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  `reason` text CHARACTER SET utf8 NOT NULL COMMENT '关闭理由',
  PRIMARY KEY (`leadid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='线索表';

DROP TABLE IF EXISTS {{crm_lead_index}};
CREATE TABLE `{{crm_lead_index}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `leadid` char(60) NOT NULL DEFAULT '' COMMENT '线索ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分享用户ID',
  `shareuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '谁分享给你的用户UID',
  `edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有编辑权限',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分享权限',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分配权限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='线索索引表';

DROP TABLE IF EXISTS {{crm_opportunity}};
CREATE TABLE `{{crm_opportunity}}` (
  `oid` char(60) NOT NULL DEFAULT '' COMMENT '机会ID',
  `leadid` char(60) NOT NULL DEFAULT '' COMMENT '线索ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `assignuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分配者ID',
  `assigntime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分配的时间',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的创建者ID',
  `editor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的最后编辑者ID',
  `subject` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '机会主题',
  `cid` char(60) NOT NULL DEFAULT '' COMMENT '关联客户ID',
  `expectincome` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预期收入',
  `dealchance` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '成交几率',
  `number` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '机会编号',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `expectendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预期结束时间',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '机会备注',
  `actualincome` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际收入',
  `actualendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实际结束时间',
  `desc` char(150) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '成交结束描述',
  `snapshoots` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照数',
  `isunread` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新分配是否已读',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '机会状态（0：执行中，1：已成交，2：失败）',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签顺序（对应tag_related表，为了加快查询速度）',
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机会表';

DROP TABLE IF EXISTS {{crm_opportunity_index}};
CREATE TABLE `{{crm_opportunity_index}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `oid` char(60) NOT NULL DEFAULT '' COMMENT '机会ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分享用户ID',
  `shareuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '谁分享给你的用户UID',
  `edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有编辑权限',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分享权限',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分配权限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`oid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机会索引表';

DROP TABLE IF EXISTS {{crm_opportunity_snapshoot}};
CREATE TABLE `{{crm_opportunity_snapshoot}}` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '快照流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照创建者ID',
  `oid` char(60) NOT NULL DEFAULT '' COMMENT '机会ID',
  `subject` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '机会主题',
  `expectincome` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预期收入',
  `dealchance` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '成交几率',
  `number` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '机会编号',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expectendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预期结束时间',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '机会备注',
  `actualincome` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际收入',
  `actualendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实际结束时间',
  `desc` char(150) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '成交结束描述',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '机会状态（0：执行中，1：已成交，2：失败）',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机会快照表';

DROP TABLE IF EXISTS {{crm_opportunity_to_contact}};
CREATE TABLE `{{crm_opportunity_to_contact}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `oid` char(60) NOT NULL DEFAULT '' COMMENT '机会ID',
  `contactid` char(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机会与联系人关联表';

DROP TABLE IF EXISTS {{crm_opportunity_to_contact_snapshoot}};
CREATE TABLE `{{crm_opportunity_to_contact_snapshoot}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照ID',
  `contactid` char(60) NOT NULL DEFAULT '' COMMENT '联系人ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机会与联系人关联快照表';

DROP TABLE IF EXISTS {{crm_preset_condition}};
CREATE TABLE `{{crm_preset_condition}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '方案ID',
  `condition` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '方案条件',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '方案内排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预设方案条件表';

DROP TABLE IF EXISTS {{crm_preset_param}};
CREATE TABLE `{{crm_preset_param}}` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `name` char(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '方案名称',
  `limit` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '方案长度',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预设方案表';

DROP TABLE IF EXISTS {{crm_product}};
CREATE TABLE `{{crm_product}}` (
  `productid` char(60) NOT NULL DEFAULT '' COMMENT '产品流水ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `name` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '产品名称',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `cost` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '成本价格',
  `unit` char(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '产品单位',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `number` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '产品编号',
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '产品说明',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '产品状态',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  PRIMARY KEY (`productid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='产品表';

DROP TABLE IF EXISTS {{crm_product_category}};
CREATE TABLE `{{crm_product_category}}` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品分类流水ID',
  `name` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '产品分类名',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类父ID',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类状态',
  `inventory` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='产品分类表';

#ALTER TABLE `{{crm_query}}`
#DROP COLUMN `uid`,
#DROP COLUMN `shareuid`,
#ADD COLUMN `uid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '归属用户，uid为0表示系统自带' AFTER `groupid`,
#ADD COLUMN `shareuid`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被共享的uid，如1,2,3,4，共享者是uid字段' AFTER `uid`;
DROP TABLE IF EXISTS {{crm_query}};
CREATE TABLE `{{crm_query}}` (
  `queryid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `name` char(50) CHARACTER SET utf8 NOT NULL COMMENT '查询名称',
  `condformula` text CHARACTER SET utf8 NOT NULL COMMENT '查询表达式',
  `condtext` text CHARACTER SET utf8 NOT NULL COMMENT '查询表达式文字',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '组内排序号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统自带',
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查询组id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户，uid为0表示系统自带',
  `shareuid` text CHARACTER SET utf8 NOT NULL COMMENT '被共享的uid，如1,2,3,4，共享者是uid字段',
  PRIMARY KEY (`queryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询条件表';

DROP TABLE IF EXISTS {{crm_query_group}};
CREATE TABLE `{{crm_query_group}}` (
  `groupid` int(10) NOT NULL,
  `name` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '查询组名（扩展）',
  `default` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认选中查询ID',
  `module` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '所属模块',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统自带',
  `querys` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查询条件数',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询条件表';

DROP TABLE IF EXISTS {{crm_receipt}};
CREATE TABLE `{{crm_receipt}}` (
  `rid` char(60) NOT NULL DEFAULT '' COMMENT '收款流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '归属用户ID',
  `assignuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分配给你的用户ID',
  `assigntime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分配的时间',
  `creator` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的创建者ID',
  `editor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录的最后编辑者ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资料更新时间',
  `contractid` char(60) NOT NULL DEFAULT '' COMMENT '合同ID',
  `receive` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本次到账',
  `receivetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收款时间',
  `planreceive` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '计划收款数',
  `planreceivetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '计划收款时间',
  `paymethod` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '收款方式（1支票2现金3邮政汇款4电汇5网上转账6其他）',
  `billtype` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '票据类型',
  `billnumber` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '票据编号',
  `diff` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '计划中差额',
  `period` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收款计划分期信息',
  `isunread` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新分配是否已读',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（扩展，暂未用到）',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '主体是否已删除',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签顺序（对应tag_related表，为了加快查询速度）',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '收款备注',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收款记录表';

DROP TABLE IF EXISTS {{crm_receipt_index}};
CREATE TABLE `{{crm_receipt_index}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID ',
  `rid` char(60) NOT NULL DEFAULT '' COMMENT '收款记录id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被分享用户ID',
  `shareuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享用户ID',
  `edit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有编辑权限',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有再分享权限',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有分配权限',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收款记录索引表';

DROP TABLE IF EXISTS {{crm_sign_bill_condition}};
CREATE TABLE `{{crm_sign_bill_condition}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `oid` char(60) NOT NULL DEFAULT '' COMMENT '机会ID',
  `condition` text CHARACTER SET utf8 NOT NULL COMMENT '签单条件',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `isdone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已达到条件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='签单条件表';

DROP TABLE IF EXISTS {{crm_sign_bill_condition_snapshoot}};
CREATE TABLE `{{crm_sign_bill_condition_snapshoot}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照创建者ID',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '快照ID',
  `condition` text CHARACTER SET utf8 NOT NULL COMMENT '签单条件',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `isdone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已达到条件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='签单条件快照表';

DROP TABLE IF EXISTS {{crm_tag}};
CREATE TABLE `{{crm_tag}}` (
  `tagid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签流水ID',
  `name` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标签名称',
  `color` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标签颜色标识',
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签组ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签顺序（预留字段，可能以后会有需求<==已经用上了，用以优化好几个模块的查询）',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统自带',
  PRIMARY KEY (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签表';

DROP TABLE IF EXISTS {{crm_tag_group}};
CREATE TABLE `{{crm_tag_group}}` (
  `groupid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签组ID',
  `name` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标签组名',
  `default` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '默认选中标签ID',
  `tags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签数',
  `module` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'CRM子模块标识',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统自带',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签组表';

DROP TABLE IF EXISTS {{crm_tag_related}};
CREATE TABLE `{{crm_tag_related}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `key` char(60) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '记录ID',
  `tagid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签ID',
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签组ID',
  `module` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'CRM子模块标识',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联创建时间',
  PRIMARY KEY (`id`),
  KEY `key` (`key`) USING BTREE,
  KEY `tagid` (`tagid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签关联表';

DROP TABLE IF EXISTS {{crm_target}};
CREATE TABLE `{{crm_target}}` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `jan` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一月',
  `feb` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二月',
  `mar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三月',
  `apr` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '四月',
  `may` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '五月',
  `jun` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '六月',
  `jul` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '七月',
  `aug` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '八月',
  `sep` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '九月',
  `oct` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '十月',
  `nov` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '十一月',
  `dec` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '十二月',
  `firqua` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '第一季度',
  `secqua` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '第二季度',
  `thiqua` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '第三季度',
  `forqua` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '第四季度',
  `yearnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '年总数',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '目标类型',
  `year` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '年份',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='个人目标表';

DROP TABLE IF EXISTS `{{crm_authority_limit}}`;
CREATE TABLE `{{crm_authority_limit}}` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` text NOT NULL,
  `positionid` text NOT NULL,
  `uid` text NOT NULL,
  `limit` varchar(255) NOT NULL DEFAULT '',
  `isdefault` int(11) NOT NULL DEFAULT '1' COMMENT '1是默认，0表示不是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO {{crm_highseas}} VALUES ('1', '公用公海', '', '', '', '', '0', '0', '1', 0 , 0, 0);

INSERT INTO {{crm_tag_group}} ( `groupid`, `name`, `default` , `tags` , `module`, `system` ) VALUES ('1', '客户状态', '1', '6', 'client', '1'),
('2', '客户分级', '7', '5', 'client', '1'),
('3', '机会进度', '12', '5', 'opportunity', '1'),
('4', '合同类型', '17', '5', 'contract', '1'),
('5', '角色关系', '22', '5', 'contact', '1'),
('6', '亲密程度', '27', '4', 'contact', '1'),
('7', '销售事件', '31', '6', 'event', '1'),
('8', '事件结果', '37', '5', 'event', '1');

INSERT INTO `{{crm_product_category}}` (`catid`, `name`) VALUES ('1', '默认分类');

INSERT INTO `{{crm_query_group}}` VALUES ('1', '线索', '1', 'lead', '1', '8'),
('2', '客户', '9', 'client', '1', '5'),
('3', '联系人', '14', 'contact', '1', '5'),
('4', '机会', '19', 'opportunity', '1', '8'),
('5', '事件', '27', 'event', '1', '4'),
('6', '合同', '31', 'contract', '1', '5'),
('7', '收款', '36', 'receipt', '1', '6');

INSERT INTO `{{menu}}`(`name`, `pid`, `m`, `c`, `a`, `param`, `sort`, `disabled`) VALUES ('CRM','0','crm','dashboard','preferences','','10','0');

INSERT INTO `{{setting}}` (`skey`, `svalue`) VALUES ('crmclientrepeat', 'a:4:{s:6:"client";s:8:"fullname";s:7:"website";s:7:"website";s:5:"email";s:5:"email";s:7:"address";s:7:"address";}'),
('crmautoname', 'a:5:{s:6:"client";a:2:{s:4:"rule";s:25:"KH-{YYYY}{MM}{DD}-{00000}";s:4:"next";s:1:"1";}s:7:"contact";a:2:{s:4:"rule";s:26:"LXR-{YYYY}{MM}{DD}-{00000}";s:4:"next";s:1:"1";}s:11:"opportunity";a:2:{s:4:"rule";s:25:"JH-{YYYY}{MM}{DD}-{00000}";s:4:"next";s:1:"1";}s:7:"product";a:2:{s:4:"rule";s:25:"CP-{YYYY}{MM}{DD}-{00000}";s:4:"next";s:1:"1";}s:8:"contract";a:2:{s:4:"rule";s:25:"HT-{YYYY}{MM}{DD}-{00000}";s:4:"next";s:1:"1";}}'),
('crmlesstime', '7'),
('crmmoduleopen', 'a:3:{s:4:"lead";s:1:"1";s:8:"contract";s:1:"1";s:7:"receipt";s:1:"1";}');

INSERT INTO `{{nav}}` (`pid`, `name`, `url`, `targetnew`, `system`, `disabled`, `sort`, `module`, `type`, `pageid`) VALUES ('0', 'CRM', 'crm/index/index', '0', '1', '0', '8','crm','0', '0');

INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`,`sendemail`,`sendmessage`,`sendsms`,`type`) VALUES ('crm_all_notice', 'crm消息提醒', 'crm', 'crm/default/Crm all notice', '','1','1','1','2');

INSERT INTO `{{cron}}` (`available`, `type`,`module`, `name`, `filename`, `lastrun`, `nextrun`, `weekday`, `day`, `hour`, `minute`) VALUES ( '1', 'system','crm', 'crm消息提醒', 'CronCrmRemind.php', '1393516800', '1393603200', '-1', '-1', '-1', '*/15');

REPLACE INTO {{node_related}} ( `roleid`, `module`, `key`, `node`, `val`) VALUES ( '1', 'crm', 'events', 'add', '8'),
( '1', 'crm', 'products', '', '0'),
( '1', 'crm', 'tags', '', '0'),
( '1', 'crm', 'highseamanager', '', '0'),
( '1', 'crm', 'events', 'del', '8'),
( '1', 'crm', 'events', 'edit', '8'),
( '1', 'crm', 'events', 'index', '8'),
( '1', 'crm', 'events', '', '0'),
( '1', 'crm', 'receipts', 'del', '8'),
( '1', 'crm', 'receipts', 'edit', '8'),
( '1', 'crm', 'receipts', 'index', '8'),
( '1', 'crm', 'receipts', 'add', '8'),
( '1', 'crm', 'receipts', '', '0'),
( '1', 'crm', 'contracts', 'share', '8'),
( '1', 'crm', 'contracts', 'assign', '8'),
( '1', 'crm', 'contracts', 'del', '8'),
( '1', 'crm', 'contracts', 'edit', '8'),
( '1', 'crm', 'contracts', 'add', '8'),
( '1', 'crm', 'contracts', 'index', '8'),
( '1', 'crm', 'contracts', '', '0'),
( '1', 'crm', 'opportunitys', 'export', '0'),
( '1', 'crm', 'opportunitys', 'share', '8'),
( '1', 'crm', 'opportunitys', 'assign', '8'),
( '1', 'crm', 'opportunitys', 'del', '8'),
( '1', 'crm', 'opportunitys', 'edit', '8'),
( '1', 'crm', 'opportunitys', 'add', '8'),
( '1', 'crm', 'opportunitys', 'index', '8'),
( '1', 'crm', 'opportunitys', '', '0'),
( '1', 'crm', 'contacts', 'export', '0'),
( '1', 'crm', 'contacts', 'share', '8'),
( '1', 'crm', 'contacts', 'assign', '8'),
( '1', 'crm', 'contacts', 'del', '8'),
( '1', 'crm', 'contacts', 'edit', '8'),
( '1', 'crm', 'contacts', 'add', '8'),
( '1', 'crm', 'contacts', 'index', '8'),
( '1', 'crm', 'contacts', '', '0'),
( '1', 'crm', 'clients', 'export', '0'),
( '1', 'crm', 'clients', 'share', '8'),
( '1', 'crm', 'clients', 'assign', '8'),
( '1', 'crm', 'clients', 'del', '8'),
( '1', 'crm', 'clients', 'edit', '8'),
( '1', 'crm', 'clients', 'add', '8'),
( '1', 'crm', 'clients', 'index', '8'),
( '1', 'crm', 'clients', '', '0'),
( '1', 'crm', 'lead', 'export', '0'),
( '1', 'crm', 'lead', 'share', '8'),
( '1', 'crm', 'lead', 'assign', '8'),
( '1', 'crm', 'lead', 'del', '8'),
( '1', 'crm', 'lead', 'edit', '8'),
( '1', 'crm', 'lead', 'add', '8'),
( '1', 'crm', 'lead', 'index', '8'),
( '1', 'crm', 'lead', '', '0'),
( '1', 'crm', 'index', 'index', '8'),
( '1', 'crm', 'index', '', '0');

REPLACE INTO {{node_related}} ( `roleid`, `module`, `key`, `node`, `val`) VALUES ( '2', 'crm', 'products', '', '0'),
( '2', 'crm', 'tags', '', '0'),
( '2', 'crm', 'events', 'del', '2'),
( '2', 'crm', 'highseamanager', '', '0'),
( '2', 'crm', 'events', 'edit', '2'),
( '2', 'crm', 'events', 'add', '2'),
( '2', 'crm', 'events', 'index', '2'),
( '2', 'crm', 'events', '', '0'),
( '2', 'crm', 'receipts', 'del', '2'),
( '2', 'crm', 'receipts', 'edit', '2'),
( '2', 'crm', 'receipts', 'add', '2'),
( '2', 'crm', 'receipts', 'index', '2'),
( '2', 'crm', 'receipts', '', '0'),
( '2', 'crm', 'contracts', 'share', '2'),
( '2', 'crm', 'contracts', 'assign', '2'),
( '2', 'crm', 'contracts', 'del', '2'),
( '2', 'crm', 'contracts', 'edit', '2'),
( '2', 'crm', 'contracts', 'add', '2'),
( '2', 'crm', 'contracts', 'index', '2'),
( '2', 'crm', 'contracts', '', '0'),
( '2', 'crm', 'opportunitys', 'export', '0'),
( '2', 'crm', 'opportunitys', 'share', '2'),
( '2', 'crm', 'opportunitys', 'assign', '2'),
( '2', 'crm', 'opportunitys', 'del', '2'),
( '2', 'crm', 'opportunitys', 'edit', '2'),
( '2', 'crm', 'opportunitys', 'add', '2'),
( '2', 'crm', 'opportunitys', 'index', '2'),
( '2', 'crm', 'opportunitys', '', '0'),
( '2', 'crm', 'contacts', 'export', '0'),
( '2', 'crm', 'contacts', 'share', '2'),
( '2', 'crm', 'contacts', 'assign', '2'),
( '2', 'crm', 'contacts', 'del', '2'),
( '2', 'crm', 'contacts', 'edit', '2'),
( '2', 'crm', 'contacts', 'add', '2'),
( '2', 'crm', 'contacts', 'index', '2'),
( '2', 'crm', 'contacts', '', '0'),
( '2', 'crm', 'clients', 'export', '0'),
( '2', 'crm', 'clients', 'share', '2'),
( '2', 'crm', 'clients', 'assign', '2'),
( '2', 'crm', 'clients', 'del', '2'),
( '2', 'crm', 'clients', 'edit', '2'),
( '2', 'crm', 'clients', 'add', '2'),
( '2', 'crm', 'clients', 'index', '2'),
( '2', 'crm', 'clients', '', '0'),
( '2', 'crm', 'lead', 'export', '0'),
( '2', 'crm', 'lead', 'share', '2'),
( '2', 'crm', 'lead', 'assign', '2'),
( '2', 'crm', 'lead', 'del', '2'),
( '2', 'crm', 'lead', 'edit', '2'),
( '2', 'crm', 'lead', 'add', '2'),
( '2', 'crm', 'lead', 'index', '2'),
( '2', 'crm', 'lead', '', '0'),
( '2', 'crm', 'index', 'index', '2'),
( '2', 'crm', 'index', '', '0');

REPLACE INTO {{node_related}} ( `roleid`, `module`, `key`, `node`, `val`) VALUES ( '3', 'crm', 'contracts', 'edit', '1'),
( '3', 'crm', 'contracts', 'add', '1'),
( '3', 'crm', 'contracts', 'index', '1'),
( '3', 'crm', 'contracts', '', '0'),
( '3', 'crm', 'opportunitys', 'share', '1'),
( '3', 'crm', 'opportunitys', 'assign', '1'),
( '3', 'crm', 'opportunitys', 'del', '1'),
( '3', 'crm', 'opportunitys', 'edit', '1'),
( '3', 'crm', 'opportunitys', 'add', '1'),
( '3', 'crm', 'opportunitys', 'index', '1'),
( '3', 'crm', 'opportunitys', '', '0'),
( '3', 'crm', 'contacts', 'share', '1'),
( '3', 'crm', 'contacts', 'assign', '1'),
( '3', 'crm', 'contacts', 'del', '1'),
( '3', 'crm', 'contacts', 'edit', '1'),
( '3', 'crm', 'contacts', 'add', '1'),
( '3', 'crm', 'contacts', 'index', '1'),
( '3', 'crm', 'contacts', '', '0'),
( '3', 'crm', 'events', 'index', '1'),
( '3', 'crm', 'clients', 'share', '1'),
( '3', 'crm', 'events', 'del', '1'),
( '3', 'crm', 'events', 'edit', '1'),
( '3', 'crm', 'events', 'add', '1'),
( '3', 'crm', 'receipts', 'del', '1'),
( '3', 'crm', 'receipts', 'edit', '1'),
( '3', 'crm', 'receipts', 'add', '1'),
( '3', 'crm', 'receipts', 'index', '1'),
( '3', 'crm', 'clients', 'assign', '1'),
( '3', 'crm', 'contracts', 'share', '1'),
( '3', 'crm', 'contracts', 'assign', '1'),
( '3', 'crm', 'contracts', 'del', '1'),
( '3', 'crm', 'contracts', 'edit', '1'),
( '3', 'crm', 'contracts', 'add', '1'),
( '3', 'crm', 'contracts', 'index', '1'),
( '3', 'crm', 'clients', 'del', '1'),
( '3', 'crm', 'opportunitys', 'export', '0'),
( '3', 'crm', 'opportunitys', 'share', '1'),
( '3', 'crm', 'opportunitys', 'assign', '1'),
( '3', 'crm', 'opportunitys', 'del', '1'),
( '3', 'crm', 'opportunitys', 'edit', '1'),
( '3', 'crm', 'opportunitys', 'add', '1'),
( '3', 'crm', 'opportunitys', 'index', '1'),
( '3', 'crm', 'contacts', 'export', '0'),
( '3', 'crm', 'contacts', 'share', '1'),
( '3', 'crm', 'contacts', 'assign', '1'),
( '3', 'crm', 'contacts', 'del', '1'),
( '3', 'crm', 'contacts', 'edit', '1'),
( '3', 'crm', 'contacts', 'add', '1'),
( '3', 'crm', 'contacts', 'index', '1'),
( '3', 'crm', 'clients', 'edit', '1'),
( '3', 'crm', 'clients', 'export', '0'),
( '3', 'crm', 'clients', 'share', '1'),
( '3', 'crm', 'clients', 'assign', '1'),
( '3', 'crm', 'clients', 'del', '1'),
( '3', 'crm', 'clients', 'edit', '1'),
( '3', 'crm', 'clients', 'add', '1'),
( '3', 'crm', 'clients', 'index', '1'),
( '3', 'crm', 'lead', 'export', '0'),
( '3', 'crm', 'lead', 'share', '1'),
( '3', 'crm', 'lead', 'assign', '1'),
( '3', 'crm', 'lead', 'del', '1'),
( '3', 'crm', 'lead', 'edit', '1'),
( '3', 'crm', 'lead', 'add', '1'),
( '3', 'crm', 'lead', 'index', '1'),
( '3', 'crm', 'clients', 'add', '1'),
( '3', 'crm', 'index', 'index', '1'),
( '3', 'crm', 'clients', 'index', '1'),
( '3', 'crm', 'clients', '', '0'),
( '3', 'crm', 'lead', 'share', '1'),
( '3', 'crm', 'lead', 'assign', '1'),
( '3', 'crm', 'lead', 'del', '1'),
( '3', 'crm', 'lead', 'edit', '1'),
( '3', 'crm', 'lead', 'add', '1'),
( '3', 'crm', 'lead', 'index', '1'),
( '3', 'crm', 'lead', '', '0'),
( '3', 'crm', 'index', 'index', '1'),
( '3', 'crm', 'index', '', '0'),
( '3', 'crm', 'contracts', 'del', '1'),
( '3', 'crm', 'contracts', 'assign', '1'),
( '3', 'crm', 'contracts', 'share', '1'),
( '3', 'crm', 'receipts', '', '0'),
( '3', 'crm', 'receipts', 'index', '1'),
( '3', 'crm', 'receipts', 'add', '1'),
( '3', 'crm', 'receipts', 'edit', '1'),
( '3', 'crm', 'receipts', 'del', '1'),
( '3', 'crm', 'events', '', '0'),
( '3', 'crm', 'events', 'index', '1'),
( '3', 'crm', 'events', 'add', '1'),
( '3', 'crm', 'events', 'edit', '1'),
( '3', 'crm', 'events', 'del', '1'),
( '3', 'crm', 'highseamanager', '', '0'),
( '3', 'crm', 'tags', '', '0'),
( '3', 'crm', 'products', '', '0');

INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '9', '归属用户是我自己', '0', '1', '1', '2', '1',
" `c_cl`.`uid` = '{-ME-}'",
" 客户-归属用户ID = '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '10', '别人分配给我未读', '0', '2', '1', '2', '1',
" `c_cl`.`isunread` = '{-YES-}'\n
AND `c_cl`.`uid` = '{-ME-}'\n
AND `c_cl`.`assignuid` != '{-ME-}'",
" 客户-新分配的记录未读 = '是'\n
AND 客户-归属用户ID = '当前用户'\n
AND 客户-分配者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '11', '其他人共享给我的', '0', '3', '1', '2', '1',
" `c_cl_i`.`uid` = '{-ME-}'\n
AND `c_cl_i`.`shareuid` != '{-ME-}'",
" 客户-被分享用户ID = '当前用户'\n
AND 客户-分享者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '12', '我共享给其他人的', '0', '4', '1', '2', '1',
" `c_cl_i`.`shareuid` = '{-ME-}'\n
AND `c_cl_i`.`uid` != '{-ME-}'",
" 客户-分享者ID = '当前用户'\n
AND 客户-被分享用户ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '13', '本月新增加的客户', '0', '5', '1', '2', '1',
" `c_cl`.`createtime` < '{-THIS_MONTH.END-}'\n
AND `c_cl`.`createtime` >= '{-THIS_MONTH.START-}'",
" 客户-创建时间 < '这个月末'\n
AND 客户-创建时间 >= '这个月初' ", '0', '' );

INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '14', '归属用户是我自己', '0', '1', '1', '3', '1',
" `c_ct`.`uid` = '{-ME-}'",
" 联系人-归属用户ID = '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '15', '别人分配给我未读', '0', '2', '1', '3', '1',
" `c_ct`.`isunread` = '{-YES-}'\n
AND `c_ct`.`uid` = '{-ME-}'\n
AND `c_ct`.`assignuid` != '{-ME-}'",
" 联系人-新分配的记录未读 = '是'\n
AND 联系人-归属用户ID = '当前用户'\n
AND 联系人-分配者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '16', '其他人共享给我的', '0', '3', '1', '3', '1',
" `c_ct_i`.`uid` = '{-ME-}'\n
AND `c_ct_i`.`shareuid` != '{-ME-}'",
" 联系人-被分享用户ID = '当前用户'\n
AND 联系人-分享者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '17', '我共享给其他人的', '0', '4', '1', '3', '1',
" `c_ct_i`.`shareuid` = '{-ME-}'\n
AND `c_ct_i`.`uid` != '{-ME-}'",
" 联系人-分享者ID = '当前用户'\n
AND 联系人-被分享用户ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '18', '本月新增的联系人', '0', '5', '1', '3', '1',
" `c_ct`.`createtime` < '{-THIS_MONTH.END-}'\n
AND `c_ct`.`createtime` >= '{-THIS_MONTH.START-}'",
" 联系人-创建时间 < '这个月末'\n
AND 联系人-创建时间 >= '这个月初' ", '0', '' );

INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '31', '归属用户是我自己', '0', '1', '1', '6', '1',
" `c_ctr`.`uid` = '{-ME-}'",
" 合同-归属用户ID = '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '32', '别人分配给我未读', '0', '2', '1', '6', '1',
" `c_ctr`.`isunread` = '{-YES-}'\n
AND `c_ctr`.`uid` = '{-ME-}'\n
AND `c_ctr`.`assignuid` != '{-ME-}'",
" 合同-新分配的记录未读 = '是'\n
AND 合同-归属用户ID = '当前用户'\n
AND 合同-分配者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '33', '其他人共享给我的', '0', '3', '1', '6', '1',
" `c_ctr_i`.`uid` = '{-ME-}'\n
AND `c_ctr_i`.`shareuid` != '{-ME-}'",
" 合同-被分享用户ID = '当前用户'\n
AND 合同-分享者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '34', '我共享给其他人的', '0', '4', '1', '6', '1',
" `c_ctr_i`.`shareuid` = '{-ME-}'\n
AND `c_ctr_i`.`uid` != '{-ME-}'",
" 合同-分享者ID = '当前用户'\n
AND 合同-被分享用户ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '35', '本月新增加的合同', '0', '5', '1', '6', '1',
" `c_ctr`.`createtime` < '{-THIS_MONTH.END-}'\n
AND `c_ctr`.`createtime` >= '{-THIS_MONTH.START-}'",
" 合同-创建时间 < '这个月末'\n
AND 合同-创建时间 >= '这个月初' ", '0', '' );

INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '27', '归属用户是我自己', '0', '1', '1', '5', '1',
" `c_e`.`uid` = '{-ME-}'",
" 事件-归属用户ID = '当前用户'", '0', '');
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '28', '别人分配给我未读', '0', '2', '1', '5', '1',
" `c_e`.`isunread` = '{-YES-}'\n
AND `c_e`.`uid` = '{-ME-}'\n
AND `c_e`.`assignuid` != '{-ME-}'",
" 事件-新分配的记录未读 = '是'\n
 AND 事件-归属用户ID = '当前用户'\n
 AND 事件-分配者ID != '当前用户' ", '0', '');
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '29', '其他人共享给我的', '0', '3', '1', '5', '1',
" `c_e_i`.`uid` = '{-ME-}'\n
AND `c_e_i`.`shareuid` != '{-ME-}'",
" 事件-被分享用户ID = '当前用户'\n
 AND 事件-分享者ID != '当前用户' ", '0', '');
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '30', '我共享给其他人的', '0', '4', '1', '5', '1',
" `c_e_i`.`shareuid` = '{-ME-}'\n
AND `c_e_i`.`uid` != '{-ME-}'",
" 事件-分享者ID = '当前用户'\n
 AND 事件-被分享用户ID != '当前用户' ", '0', '');

INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '1', '归属用户是我自己', '0', '1', '1', '1', '1',
" `c_l`.`uid` = '{-ME-}'",
" 线索-归属用户ID = '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '2', '别人分配给我未读', '0', '2', '1', '1', '1',
" `c_l`.`isunread` = '{-YES-}'\n
AND `c_l`.`uid` = '{-ME-}'\n
AND `c_l`.`assignuid` != '{-ME-}'",
" 线索-新分配的记录未读 = '是'\n
  AND 线索-归属用户ID = '当前用户'\n
  AND 线索-分配者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '3', '其他人共享给我的', '0', '3', '1', '1', '1',
" `c_l_i`.`uid` = '{-ME-}'\n
AND `c_l_i`.`shareuid` != '{-ME-}'",
" 线索-被分享用户ID = '当前用户'\n
  AND 线索-分享者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '4', '我共享给其他人的', '0', '4', '1', '1', '1',
" `c_l_i`.`shareuid` = '{-ME-}'\n
AND `c_l_i`.`uid` != '{-ME-}'",
" 线索-分享者ID = '当前用户'\n
  AND 线索-被分享用户ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '5', '我的共享给其他人', '0', '5', '1', '1', '1',
" `c_l`.`uid` = '{-ME-}'\n
AND `c_l_i`.`shareuid` = '{-ME-}'\n
AND `c_l_i`.`uid` != '{-ME-}'",
" 线索-归属用户ID = '当前用户'\n
  AND 线索-分享者ID = '当前用户'\n
  AND 线索-被分享用户ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '6', '本月新增加的线索', '0', '6', '1', '1', '1',
" `c_l`.`createtime` < '{-THIS_MONTH.END-}'\n
AND `c_l`.`createtime` >= '{-THIS_MONTH.START-}'",
" 线索-创建时间 < '这个月末'\n
  AND 线索-创建时间 >= '这个月初' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '7', '本月已转化的线索', '0', '7', '1', '1', '1',
" `c_l`.`converttime` < '{-THIS_MONTH.END-}'\n
AND `c_l`.`converttime` >= '{-THIS_MONTH.START-}' ",
" 线索-转换时间 < '这个月末'\n
AND 线索-转换时间 >= '这个月初' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '8', '本月已丢失的线索', '0', '8', '1', '1', '1',
" `c_l`.`converttime` < '{-THIS_MONTH.END-}'\n
AND `c_l`.`converttime` >= '{-THIS_MONTH.START-}'\n
AND `c_l`.`status` = '{-LEAD_STATE.LOST-}'",
" 线索-转换时间 < '这个月末'\n
  AND 线索-转换时间 >= '这个月初'\n
  AND 线索-转换状态 = '丢失' ", '0', '' );

  INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '19', '归属用户是我自己', '0', '1', '1', '4', '1',
" `c_o`.`uid` = '{-ME-}'",
" 机会-归属用户ID = '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '20', '别人分配给我未读', '0', '2', '1', '4', '1',
" `c_o`.`isunread` = '{-YES-}'\n
AND `c_o`.`uid` = '{-ME-}'\n
AND `c_o`.`assignuid` != '{-ME-}'",
" 机会-新分配的记录未读 = '是'\n
  AND 机会-归属用户ID = '当前用户'\n
  AND 机会-分配者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '21', '其他人共享给我的', '0', '3', '1', '4', '1',
" `c_o_i`.`uid` = '{-ME-}'\n
AND `c_o_i`.`shareuid` != '{-ME-}'",
" 机会-被分享用户ID = '当前用户'\n
  AND 机会-分享者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '22', '我共享给其他人的', '0', '4', '1', '4', '1',
" `c_o_i`.`shareuid` = '{-ME-}'\n
AND `c_o_i`.`uid` != '{-ME-}'",
" 机会-分享者ID = '当前用户'\n
  AND 机会-被分享用户ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '23', '本月新增加的机会', '0', '5', '1', '4', '1',
" `c_o`.`createtime` < '{-THIS_MONTH.END-}'\n
AND `c_o`.`createtime` >= '{-THIS_MONTH.START-}'",
" 机会-创建时间 < '这个月末'\n
  AND 机会-创建时间 >= '这个月初' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '24', '预计本月结束机会', '0', '6', '1', '4', '1',
" `c_o`.`expectendtime` < '{-THIS_MONTH.END-}'\n
AND `c_o`.`expectendtime` >= '{-THIS_MONTH.START-}'",
" 机会-预期结束时间 < '这个月末'\n
  AND 机会-预期结束时间 >= '这个月初' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '25', '本月已失败的机会', '0', '7', '1', '4', '1',
" `c_o`.`createtime` < '{-THIS_MONTH.END-}'\n
AND `c_o`.`createtime` >= '{-THIS_MONTH.START-}'\n
AND `c_o`.`status` = '{-OPP_STATE.F-}'",
" 机会-创建时间 < '这个月末'\n
  AND 机会-创建时间 >= '这个月初'\n
  AND 机会-成交状态 = '失败' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '26', '本月已成功的机会', '0', '8', '1', '4', '1',
" `c_o`.`createtime` < '{-THIS_MONTH.END-}'\n
AND `c_o`.`createtime` >= '{-THIS_MONTH.START-}'\n
AND `c_o`.`status` = '{-OPP_STATE.S-}'",
" 机会-创建时间 < '这个月末'\n
  AND 机会-创建时间 >= '这个月初'\n
  AND 机会-成交状态 = '成功' ", '0', '' );

INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '36', '归属用户是我自己', '0', '1', '1', '7', '1',
" `c_rc`.`uid` = '{-ME-}'",
" 收款-归属用户ID = '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '37', '别人分配给我未读', '0', '2', '1', '7', '1',
" `c_rc`.`isunread` = '{-YES-}'\n
AND `c_rc`.`uid` = '{-ME-}'\n
AND `c_rc`.`assignuid` != '{-ME-}'",
" 收款-新分配的记录未读 = '是'\n
  AND 收款-归属用户ID = '当前用户'\n
  AND 收款-收款-分配者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '38', '其他人共享给我的', '0', '3', '1', '7', '1',
" `c_rc_i`.`uid` = '{-ME-}'\n
AND `c_rc_i`.`shareuid` != '{-ME-}'",
" 收款-分享者ID = '当前用户'\n
  AND 收款-分享者ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '39', '我共享给其他人的', '0', '4', '1', '7', '1',
" `c_rc_i`.`shareuid` = '{-ME-}'\n
AND `c_rc_i`.`uid` != '{-ME-}'",
" 收款-分享者ID = '当前用户'\n
  AND 收款-被分享用户ID != '当前用户' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '40', '本月已完成的收款', '0', '5', '1', '7', '1',
" `c_rc`.`receive` > '0'\n
AND `c_rc`.`receivetime` >= '{-THIS_MONTH.STRAT-}'\n
AND `c_rc`.`receivetime` < '{-THIS_MONTH.END-}'",
" 收款-到账金额 > '0'\n
  AND 收款-收款时间 >= '这个月末'\n
  AND 收款-收款时间 < '这个月初' ", '0', '' );
INSERT INTO `{{crm_query}}` ( `queryid`, `name`, `createtime`, `sort`, `status`, `groupid`, `system`, `condformula`, `condtext`, `uid`, `shareuid` ) VALUES ( '41', '预计本月完成收款', '0', '6', '1', '7', '1',
" `c_rc`.`planreceive` > '0'\n
AND `c_rc`.`planreceivetime` >= '{-THIS_MONTH.START-}'\n
AND `c_rc`.`planreceivetime` < '{-THIS_MONTH.END-}'",
" 收款-计划到账金额 > '0'\n
  AND 收款-计划收款时间 >= '这个月末'\n
  AND 收款-计划收款时间 < '这个月初' ", '0', '' );

INSERT INTO {{crm_tag}} ( `tagid`, `name`, `color` , `groupid` , `system` , `sort` ) VALUES ( '7', '未分级客户', 'rgb(218, 223, 230)', '2', '1', '1' ),
( '8', '小型客户', '#7AC2F3', '2', '1', '2' ),
( '9', '中型客户', '#A7D85A', '2', '1', '3' ),
( '10', '大型客户', '#FFBB6D', '2', '1', '4' ),
( '11', 'VIP客户', '#E88C73', '2', '1', '5' ),
( '1', '初步接触', 'rgb(218, 223, 230)', '1','1', '1' ),
( '2', '确定意向', '#7AC2F3', '1', '1', '2' ),
( '3', '重点跟进', '#A7D85A', '1', '1', '3' ),
( '4', '签约客户', '#FFBB6D', '1', '1', '4' ),
( '5', '停滞客户', '#FFE18F', '1', '1', '5' ),
( '6', '丢单客户', '#E88C73', '1', '1', '6' ),
( '27', '初相识', 'rgb(218, 223, 230)', '6', '1', '1' ),
( '28', '一般关系', '#7AC2F3', '6', '1', '2' ),
( '29', '朋友关系', '#A7D85A', '6', '1', '3' ),
( '30', '好友关系', '#FFBB6D', '6', '1', '4' ),
( '22', '经办人', 'rgb(218, 223, 230)', '5', '1', '1' ),
( '23', '决策人', '#7AC2F3', '5', '1', '2' ),
( '24', '使用人', '#A7D85A', '5', '1', '3' ),
( '25', '意见影响人', '#FFBB6D', '5', '1', '4' ),
( '26', '商务决策', '#E88C73', '5', '1', '5' ),
( '17', '产品订单', 'rgb(218, 223, 230)', '4', '1', '1' ),
( '18', '实施合同', '#7AC2F3', '4', '1', '2' ),
( '19', '服务合同', '#A7D85A', '4', '1', '3' ),
( '20', '续费合同', '#FFBB6D', '4', '1', '4' ),
( '21', '代理合同', '#E88C73', '4', '1', '5' ),
( '31', '汇报记录', 'rgb(218, 223, 230)', '7', '1', '1' ),
( '32', '电话联系', '#7AC2F3', '7', '1', '1' ),
( '33', '邮件联系', '#A7D85A', '7', '1', '2' ),
( '34', '短信沟通', '#FFBB6D', '7', '1', '3' ),
( '35', '上门洽谈', '#FFE18F', '7', '1', '4' ),
( '36', '公司会谈', '#E88C73', '7', '1', '5' ),
( '37', '客户满意', 'rgb(218, 223, 230)', '8', '1', '1' ),
( '38', '客户不满意', '#7AC2F3', '8', '1', '2' ),
( '39', '客户无表示', '#A7D85A', '8', '1', '3' ),
( '40', '无人接电话', '#FFBB6D', '8', '1', '4' ),
( '41', '未联系上联系人', '#E88C73', '8', '1', '5' ),
( '12', '1-前期接触', 'rgb(218, 223, 230)', '3', '1', '1' ),
( '13', '2-机会评估', '#7AC2F3', '3', '1', '2' ),
( '14', '3-需求分析', '#A7D85A', '3', '1', '3' ),
( '15', '4-方案提供', '#FFBB6D', '3', '1', '4' ),
( '16', '5-多方选择/评估', '#E88C73', '3', '1', '5' );

INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('event', '跟进', 'crm', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');
INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('contract', '合同', 'crm', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');
INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('client', '客户', 'crm', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');
INSERT INTO `{{notify_node}}` (`node`, `nodeinfo`, `module`, `titlekey`, `contentkey`, `sendemail`, `sendmessage`, `sendsms`, `type`) VALUES ('opportunity', '商机', 'crm', 'message/default/Alarm title', 'message/default/Alarm content', '1', '1', '1', '1');











