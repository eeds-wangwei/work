DROP TABLE IF EXISTS `{{crm_authority_limit}}`;
CREATE TABLE `{{crm_authority_limit}}` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` text NOT NULL,
  `positionid` text NOT NULL,
  `uid` text NOT NULL,
  `limit` varchar(255) NOT NULL DEFAULT '',
  `isdefault` int(11) NOT NULL DEFAULT '1' COMMENT '1是默认，0表示不是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;