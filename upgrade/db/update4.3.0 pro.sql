DROP TABLE IF EXISTS `{{template}}`;
CREATE TABLE `{{template}}` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `tname` varchar(255) NOT NULL COMMENT '汇报模板名称',
  `autonumber` varchar(255) DEFAULT NULL COMMENT '自动文号',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='汇报模板表';

INSERT INTO `{{template}}` VALUES ('1', '周报', '', 'default', '2', '用于写周报', '1481088096', 'alldept', '', '', '', '', '', null, '1');
INSERT INTO `{{template}}` VALUES ('2', '月报', '', 'default', '2', '用于写周报', '1481088096', 'alldept', '', '', '', '', '', null, '1');
INSERT INTO `{{template}}` VALUES ('3', '季报', '', 'default', '2', '用于写季报', '1481088096', 'alldept', '', '', '', '', '', null, '1');
INSERT INTO `{{template}}` VALUES ('4', '年报', '', 'default', '2', '用于写年报', '1481088096', 'alldept', '', '', '', '', '', null, '1');

DROP TABLE IF EXISTS `{{template_field}}`;
CREATE TABLE `{{template_field}}` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段自增id',
  `tid` int(10) unsigned NOT NULL COMMENT '模板id',
  `fieldname` varchar(255) NOT NULL COMMENT '字段名称',
  `iswrite` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填，0表示不需要，1表示需要',
  `fieldtype` int(10) unsigned NOT NULL COMMENT '字段类型，1表示长文本，2表示短文本，3表示数字，4表示日期与时间，5表示时间，6表示日期，7表示下拉，8表示富文本',
  `fieldvalue` text COMMENT '字段值',
  `fieldsort` int(10) unsigned NOT NULL COMMENT '字段排序序号',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='汇报模板字段表';

INSERT INTO `{{template_field}}` VALUES ('1', '1', '原计划', '1', '1', '', '1');
INSERT INTO `{{template_field}}` VALUES ('2', '1', '计划外', '0', '1', '', '2');
INSERT INTO `{{template_field}}` VALUES ('3', '1', '工作总结', '1', '8', '', '3');
INSERT INTO `{{template_field}}` VALUES ('4', '1', '下次计划', '1', '1', '', '4');
INSERT INTO `{{template_field}}` VALUES ('5', '2', '原计划', '1', '1', '', '1');
INSERT INTO `{{template_field}}` VALUES ('6', '2', '计划外', '0', '1', '', '2');
INSERT INTO `{{template_field}}` VALUES ('7', '2', '工作总结', '1', '8', '', '3');
INSERT INTO `{{template_field}}` VALUES ('8', '2', '下次计划', '1', '1', '', '4');
INSERT INTO `{{template_field}}` VALUES ('9', '3', '原计划', '1', '1', '', '1');
INSERT INTO `{{template_field}}` VALUES ('10', '3', '计划外', '0', '1', '', '2');
INSERT INTO `{{template_field}}` VALUES ('11', '3', '工作总结', '1', '8', '', '3');
INSERT INTO `{{template_field}}` VALUES ('12', '3', '下次计划', '1', '1', '', '4');
INSERT INTO `{{template_field}}` VALUES ('13', '4', '原计划', '1', '1', '', '1');
INSERT INTO `{{template_field}}` VALUES ('14', '4', '计划外', '0', '1', '', '2');
INSERT INTO `{{template_field}}` VALUES ('15', '4', '工作总结', '1', '8', '', '3');
INSERT INTO `{{template_field}}` VALUES ('16', '4', '下次计划', '1', '1', '', '4');

DROP TABLE IF EXISTS `{{template_add}}`;
CREATE TABLE `{{template_add}}` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shoptid` int(10) unsigned NOT NULL COMMENT '模板商城模板id',
  `tid` int(10) unsigned NOT NULL COMMENT '添加模板id',
  `uid` int(10) unsigned NOT NULL COMMENT '添加这id',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='汇报模板字段表';

DROP TABLE IF EXISTS `{{template_category}}`;
CREATE TABLE `{{template_category}}` (
  `cateid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类自增id',
  `categoryname` varchar(255) NOT NULL COMMENT '分类名',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`cateid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='汇报模板分类表';

INSERT INTO `{{template_category}}` VALUES ('1', '个人模板', '1480489635');
INSERT INTO `{{template_category}}` VALUES ('2', '官方模板', '1480489636');
INSERT INTO `{{template_category}}` VALUES ('3', '服务业', '1480489637');
INSERT INTO `{{template_category}}` VALUES ('4', '餐饮业', '1480489638');
INSERT INTO `{{template_category}}` VALUES ('5', '建筑业', '1480489639');

DROP TABLE IF EXISTS `{{template_sort}}`;
CREATE TABLE `{{template_sort}}` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户uid',
  `tid` int(10) unsigned NOT NULL COMMENT '模板id',
  `sort` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '排序序号',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='汇报模板排序表';

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
