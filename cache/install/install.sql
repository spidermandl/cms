DROP TABLE IF EXISTS `{dbprefix}comment`;
CREATE TABLE IF NOT EXISTS `{dbprefix}comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '配置信息',
  `field` text COMMENT '自定义字段信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论配置表';

DROP TABLE IF EXISTS `{dbprefix}admin_notice`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_notice` (
  `id` int(10) NOT NULL COMMENT 'id' AUTO_INCREMENT,
  `type` varchar(20) NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) NOT NULL COMMENT '对应的URI',
  `to_rid` smallint(5) NOT NULL COMMENT '指定角色组',
  `to_uid` int(10) NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int(10) NOT NULL COMMENT '处理人',
  `username` varchar(100) NOT NULL COMMENT '处理人',
  `updatetime` int(10) NOT NULL COMMENT '处理时间',
  `inputtime` int(10) NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `status` (`status`),
  KEY `to_uid` (`to_uid`),
  KEY `to_rid` (`to_rid`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台提醒表';

DROP TABLE IF EXISTS `{dbprefix}controller`;
CREATE TABLE IF NOT EXISTS `{dbprefix}controller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `app` varchar(100) NOT NULL COMMENT '网站,会员,后台',
  `type` tinyint(1) unsigned NOT NULL COMMENT '前台0会员1后台2',
  `cname` varchar(100) NOT NULL COMMENT '控制器名称',
  `file` varchar(100) NOT NULL COMMENT '文件路径',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `meta_title` varchar(255) NOT NULL COMMENT '网页标题',
  `meta_keywords` varchar(255) NOT NULL COMMENT '网页关键字',
  `meta_description` varchar(255) NOT NULL COMMENT '网页描述',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='自定义控制器表';

DROP TABLE IF EXISTS `{dbprefix}var`;
CREATE TABLE IF NOT EXISTS `{dbprefix}var` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(100) NOT NULL COMMENT '变量描述名称',
  `cname` varchar(100) NOT NULL COMMENT '变量名称',
  `type` tinyint(2) NOT NULL COMMENT '变量类型',
  `value` text CHARACTER SET utf8 NOT NULL COMMENT '变量值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义变量表';



DROP TABLE IF EXISTS `{dbprefix}module_form`;
CREATE TABLE IF NOT EXISTS `{dbprefix}module_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL COMMENT '模块目录',
  `name` varchar(50) NOT NULL COMMENT '表单名称',
  `table` varchar(50) NOT NULL COMMENT '表单表名称',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '是否禁用',
  `permission` text NOT NULL COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '表单配置',
  PRIMARY KEY (`id`),
  KEY `table` (`table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表单表';

DROP TABLE IF EXISTS `{dbprefix}admin_login`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登录日志记录';


DROP TABLE IF EXISTS `{dbprefix}member_login`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `oauthid` varchar(30) NOT NULL COMMENT '快捷登录方式',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登录日志记录';

DROP TABLE IF EXISTS `{dbprefix}downservers`;
CREATE TABLE IF NOT EXISTS `{dbprefix}downservers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '服务器名',
  `server` varchar(255) NOT NULL COMMENT '服务器地址',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载镜像服务器';

DROP TABLE IF EXISTS `{dbprefix}urlrule`;
CREATE TABLE IF NOT EXISTS `{dbprefix}urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='URL规则表' ;

DROP TABLE IF EXISTS `{dbprefix}member_notice_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_1`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_2`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';


DROP TABLE IF EXISTS `{dbprefix}member_notice_3`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_4`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_5`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_6`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_6` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_7`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_7` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_8`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_8` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_9`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_9` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_new_notice`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_new_notice` (
  `uid` smallint(8) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}cron_queue`;
CREATE TABLE IF NOT EXISTS `{dbprefix}cron_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) unsigned NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '值',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `error` varchar(255) NOT NULL COMMENT '错误信息',
  `updatetime` int(10) unsigned NOT NULL COMMENT '执行时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '写入时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务队列表';


DROP TABLE IF EXISTS `{dbprefix}application`;
CREATE TABLE IF NOT EXISTS `{dbprefix}application` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` text COMMENT '模块划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

DROP TABLE IF EXISTS `{dbprefix}member_menu`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `mark` varchar(50) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `target` tinyint(3) unsigned DEFAULT NULL COMMENT '新窗口',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` VARCHAR(30) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员菜单表';


DROP TABLE IF EXISTS `{dbprefix}admin`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  `color` text DEFAULT NULL COMMENT '定制权限',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员表';

REPLACE INTO `{dbprefix}admin` VALUES(1, '网站创始人', '', '');

DROP TABLE IF EXISTS `{dbprefix}mail_smtp`;
CREATE TABLE IF NOT EXISTS `{dbprefix}mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` TINYINT(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='邮件账户表';

DROP TABLE IF EXISTS `{dbprefix}mail_queue`;
CREATE TABLE IF NOT EXISTS `{dbprefix}mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL COMMENT '邮件地址',
  `subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `message` text NOT NULL COMMENT '邮件内容',
  `status` tinyint(1) unsigned NOT NULL COMMENT '发送状态',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='邮件队列表';

DROP TABLE IF EXISTS `{dbprefix}admin_menu`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(100) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

DROP TABLE IF EXISTS `{dbprefix}admin_role`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_role` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `site` text NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text NOT NULL COMMENT '角色组语言名称',
  `system` text NOT NULL COMMENT '系统权限',
  `module` text NOT NULL COMMENT '模块权限',
  `application` text NOT NULL COMMENT '应用权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台角色权限表';

REPLACE INTO `{dbprefix}admin_role` VALUES(1, '', '超级管理员', '', '', '');
REPLACE INTO `{dbprefix}admin_role` VALUES(2, '', '网站编辑员', '', '', '');

DROP TABLE IF EXISTS `{dbprefix}admin_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_verify` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '名称',
  `verify` text NOT NULL COMMENT '审核部署',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='审核管理表';

REPLACE INTO `{dbprefix}admin_verify` VALUES(1, '审核一次', 'a:1:{i:1;a:2:{i:0;s:1:\\"2\\";i:1;s:1:\\"3\\";}}');

DROP TABLE IF EXISTS `{dbprefix}attachment`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='附件表';


DROP TABLE IF EXISTS `{dbprefix}attachment_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_0` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表0';

DROP TABLE IF EXISTS `{dbprefix}attachment_1`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_1` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表1';


DROP TABLE IF EXISTS `{dbprefix}attachment_2`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_2` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表2';

DROP TABLE IF EXISTS `{dbprefix}attachment_3`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_3` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表3';

DROP TABLE IF EXISTS `{dbprefix}attachment_4`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_4` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表4';

DROP TABLE IF EXISTS `{dbprefix}attachment_5`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_5` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表5';

DROP TABLE IF EXISTS `{dbprefix}attachment_6`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_6` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表6';

DROP TABLE IF EXISTS `{dbprefix}attachment_7`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_7` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表7';

DROP TABLE IF EXISTS `{dbprefix}attachment_8`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_8` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表8';

DROP TABLE IF EXISTS `{dbprefix}attachment_9`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_9` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表9';

DROP TABLE IF EXISTS `{dbprefix}attachment_unused`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_unused` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='未使用的附件表';


DROP TABLE IF EXISTS `{dbprefix}field`;
CREATE TABLE IF NOT EXISTS `{dbprefix}field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint(1) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='字段表';


DROP TABLE IF EXISTS `{dbprefix}linkage`;
CREATE TABLE IF NOT EXISTS `{dbprefix}linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单表';

DROP TABLE IF EXISTS `{dbprefix}linkage_data_1`;
CREATE TABLE IF NOT EXISTS `{dbprefix}linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(1) unsigned DEFAULT NULL DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT NULL DEFAULT '0' COMMENT '前端隐藏',
  `childids` text DEFAULT NULL COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表';

DROP TABLE IF EXISTS `{dbprefix}member`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(40) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` char(10) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL COMMENT '头像地址',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '虚拟币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `adminid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `levelid` smallint(5) unsigned NOT NULL COMMENT '会员级别',
  `overdue` int(10) unsigned NOT NULL COMMENT '到期时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) unsigned NOT NULL COMMENT '随机验证码',
  `ismobile` tinyint(1) unsigned DEFAULT NULL COMMENT '手机认证标识',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `adminid` (`adminid`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表';

REPLACE INTO `{dbprefix}member` VALUES(1, '{email}', '{username}', '{password}', '{salt}', '', '', '', 9999.00, 0.00, 0.00, 10000, 10000, 1, 3, 4, 0, '', 0, 0, 0);

DROP TABLE IF EXISTS `{dbprefix}member_address`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `city` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `default` tinyint(1) unsigned NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`default`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员收货地址表';

DROP TABLE IF EXISTS `{dbprefix}member_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_data` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) unsigned NOT NULL COMMENT '完善资料标识',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证标识',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表';

DROP TABLE IF EXISTS `{dbprefix}member_online`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_online` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL COMMENT '在线时间',
  PRIMARY KEY (`uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员在线情况表';

DROP TABLE IF EXISTS `{dbprefix}member_group`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '会员组名称',
  `theme` varchar(255) NOT NULL COMMENT '风格目录',
  `template` varchar(50) NOT NULL COMMENT '模板目录',
  `price` decimal(10,2) NOT NULL COMMENT '售价',
  `unit` tinyint(1) unsigned NOT NULL COMMENT '价格单位:1虚拟卡，2金钱',
  `limit` tinyint(1) unsigned NOT NULL COMMENT '售价限制：1月，2半年，3年',
  `overdue` smallint(5) unsigned NOT NULL COMMENT '过期后变成的组',
  `allowregister` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员注册',
  `allowapply` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请',
  `allowapply_orther` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请其他组',
  `allowspace` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员空间',
  `allowfield` text NOT NULL COMMENT '可用字段，序列化数组格式',
  `spacefield` text NOT NULL COMMENT '空间字段，序列化数组格式',
  `spacedomain` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否启用空间域名',
  `spacetemplate` varchar(50) DEFAULT NULL COMMENT '空间默认模板',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员组表';

REPLACE INTO `{dbprefix}member_group` VALUES(1, '待审核会员', 'default', 'default', 0.00, 1, 1, 0, 0, 0, 0, 0, '', '', 1, 'default', 0);
REPLACE INTO `{dbprefix}member_group` VALUES(2, '快捷登录', 'default', 'default', 0.00, 0, 0, 0, 0, 0, 0, 0, '', '', 1, 'default', 0);
REPLACE INTO `{dbprefix}member_group` VALUES(3, '普通会员', 'default', 'default', 0.00, 1, 1, 3, 0, 1, 0, 1, '', '', 1, 'default', 0);
REPLACE INTO `{dbprefix}member_group` VALUES(4, '商业会员', 'default', 'default', 10.00, 2, 1, 3, 1, 0, 0, 1, '', '', 1, 'default', 0);

DROP TABLE IF EXISTS `{dbprefix}member_level`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_level` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '会员级别名称',
  `stars` tinyint(2) NOT NULL COMMENT '星星数量',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值要求',
  `allowupgrade` tinyint(1) NOT NULL COMMENT '允许自动升级',
  PRIMARY KEY (`id`),
  KEY `experience` (`experience`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员级别表';

REPLACE INTO `{dbprefix}member_level` VALUES(1, 3, '初级', 1, 0, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(2, 3, '中级', 5, 200, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(3, 3, '高级', 10, 500, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(4, 3, '元老', 15, 1000, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(5, 4, '普通', 16, 0, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(6, 4, '银牌', 23, 500, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(7, 4, '金牌', 35, 1000, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(8, 4, '钻石', 55, 2000, 0);

DROP TABLE IF EXISTS `{dbprefix}member_oauth`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `expire_at` int(10) unsigned NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员OAuth2授权表';

DROP TABLE IF EXISTS `{dbprefix}member_paylog`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_paylog` (
  `id` bigint(15) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `value` decimal(10,2) NOT NULL COMMENT '价格',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `order` varchar(255) NULL COMMENT '下单详情',
  `module` varchar(30) NOT NULL COMMENT '应用或模块目录',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `order` (`order`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付记录表';

DROP TABLE IF EXISTS `{dbprefix}member_scorelog`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_scorelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL COMMENT '积分0,虚拟币1',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `mark` (`mark`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='得分日志';

DROP TABLE IF EXISTS `{dbprefix}member_setting`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_setting` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员属性参数表';


DROP TABLE IF EXISTS `{dbprefix}module`;
CREATE TABLE IF NOT EXISTS `{dbprefix}module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` text NULL COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(1) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是扩展模块',
  `sitemap` tinyint(1) unsigned DEFAULT NULL COMMENT '是否生成地图',
  `setting` text NULL COMMENT '配置信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模块表';

DROP TABLE IF EXISTS `{dbprefix}site`;
CREATE TABLE IF NOT EXISTS `{dbprefix}site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='站点表';


REPLACE INTO `{dbprefix}linkage` VALUES(1, '中国地区', 0, 'address');
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(1, 1, 0, '0', '地区1', 'diqu1', 0, 0, '1', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(2, 1, 0, '0', '城市', 'chengshi', 0, 0, '2', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(3, 1, 0, '0', '北京', 'beijing', 0, 0, '3', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(4, 1, 0, '0', '洞子口', 'dongzikou', 0, 0, '4', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(5, 1, 0, '0', '细河区', 'xihequ', 0, 0, '5', 0);

REPLACE INTO `{dbprefix}member_setting` VALUES('member', '');
REPLACE INTO `{dbprefix}member_setting` VALUES('permission', 'a:10:{i:1;a:13:{s:16:\\"login_experience\\";s:1:\\"1\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:10:\\"attachsize\\";s:1:\\"0\\";}i:2;a:14:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:1:\\"5\\";}s:3:\\"3_1\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"10\\";}s:3:\\"3_2\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"10\\";}s:3:\\"3_3\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:2:\\"10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"20\\";}s:3:\\"3_4\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"3\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"30\\";}s:3:\\"4_5\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:2:\\"10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"50\\";}s:3:\\"4_6\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"70\\";}s:3:\\"4_7\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:3:\\"100\\";}s:3:\\"4_8\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:1:\\"0\\";}}');
REPLACE INTO `{dbprefix}member_setting` VALUES('pay', 'a:2:{s:6:\\"tenpay\\";a:3:{s:4:\\"name\\";s:9:\\"财付通\\";s:2:\\"id\\";s:0:\\"\\";s:3:\\"key\\";s:0:\\"\\";}s:6:\\"alipay\\";a:4:{s:4:\\"name\\";s:9:\\"支付宝\\";s:8:\\"username\\";s:0:\\"\\";s:2:\\"id\\";s:0:\\"\\";s:3:\\"key\\";s:0:\\"\\";}}');
REPLACE INTO `{dbprefix}member_setting` VALUES('space', 'a:9:{s:6:\\"domain\\";s:0:\\"\\";s:4:\\"edit\\";s:1:\\"1\\";s:6:\\"verify\\";s:1:\\"0\\";s:7:\\"rewrite\\";s:1:\\"0\\";s:7:\\"seojoin\\";s:1:\\"_\\";s:5:\\"title\\";s:41:\\"会员空间_FineCMS自助建站平台！\\";s:8:\\"keywords\\";s:0:\\"\\";s:11:\\"description\\";s:0:\\"\\";s:4:\\"flag\\";a:9:{i:1;a:1:{s:4:\\"name\\";s:12:\\"达人空间\\";}i:2;a:1:{s:4:\\"name\\";s:12:\\"推荐空间\\";}i:3;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:4;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:5;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:6;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:7;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:8;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:9;a:1:{s:4:\\"name\\";s:0:\\"\\";}}}');

INSERT INTO `{dbprefix}urlrule` VALUES(1, 0, '单页测试规则', 'a:52:{s:4:\\"page\\";s:14:\\"page-{id}.html\\";s:9:\\"page_page\\";s:21:\\"page-{id}-{page}.html\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
INSERT INTO `{dbprefix}urlrule` VALUES(2, 0, '单页测试规则（用于模块）', 'a:52:{s:4:\\"page\\";s:21:\\"module-page-{id}.html\\";s:9:\\"page_page\\";s:28:\\"module-page-{id}-{page}.html\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
INSERT INTO `{dbprefix}urlrule` VALUES(3, 1, '独立模块默认规则', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:14:\\"{modname}.html\\";s:4:\\"list\\";s:29:\\"{modname}-list-{dirname}.html\\";s:9:\\"list_page\\";s:36:\\"{modname}-list-{dirname}-{page}.html\\";s:4:\\"show\\";s:24:\\"{modname}-show-{id}.html\\";s:9:\\"show_page\\";s:31:\\"{modname}-show-{id}-{page}.html\\";s:6:\\"extend\\";s:24:\\"{modname}-read-{id}.html\\";s:11:\\"extend_page\\";s:31:\\"{modname}-read-{id}-{page}.html\\";s:3:\\"tag\\";s:24:\\"{modname}-tag-{tag}.html\\";s:8:\\"tag_page\\";s:31:\\"{modname}-tag-{tag}-{page}.html\\";s:6:\\"search\\";s:21:\\"{modname}/search.html\\";s:11:\\"search_page\\";s:29:\\"{modname}/search-{param}.html\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
INSERT INTO `{dbprefix}urlrule` VALUES(4, 2, '共享模块测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:24:\\"{modname}-tag-{tag}.html\\";s:14:\\"share_tag_page\\";s:31:\\"{modname}-tag-{tag}-{page}.html\\";s:12:\\"share_search\\";s:21:\\"{modname}/search.html\\";s:17:\\"share_search_page\\";s:29:\\"{modname}/search/{param}.html\\";s:10:\\"share_list\\";s:10:\\"{dirname}/\\";s:15:\\"share_list_page\\";s:26:\\"{dirname}/page/{page}.html\\";s:10:\\"share_show\\";s:24:\\"{dirname}/show/{id}.html\\";s:15:\\"share_show_page\\";s:36:\\"{dirname}/show/{id}/page/{page}.html\\";s:12:\\"share_extend\\";s:24:\\"{dirname}/read/{id}.html\\";s:17:\\"share_extend_page\\";s:36:\\"{dirname}/read/{id}/page/{page}.html\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
INSERT INTO `{dbprefix}urlrule` VALUES(5, 3, '共享栏目规则测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:24:\\"html/{dirname}-list.html\\";s:15:\\"share_list_page\\";s:31:\\"html/{dirname}-list-{page}.html\\";s:10:\\"share_show\\";s:29:\\"html/{dirname}-show-{id}.html\\";s:15:\\"share_show_page\\";s:36:\\"html/{dirname}-show-{id}-{page}.html\\";s:12:\\"share_extend\\";s:31:\\"html/{dirname}-extend-{id}.html\\";s:17:\\"share_extend_page\\";s:38:\\"html/{dirname}-extend-{id}-{page}.html\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
INSERT INTO `{dbprefix}urlrule` VALUES(6, 4, '站点URL测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:11:\\"search.html\\";s:17:\\"share_search_page\\";s:19:\\"search/{param}.html\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:7:\\"so.html\\";s:14:\\"so_search_page\\";s:15:\\"so-{param}.html\\";s:7:\\"sitemap\\";s:12:\\"sitemap.html\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
INSERT INTO `{dbprefix}urlrule` VALUES(7, 5, '空间黄页测试地址', 'a:50:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:7:\\"hy.html\\";s:12:\\"space_search\\";s:14:\\"hy-search.html\\";s:17:\\"space_search_page\\";s:22:\\"hy-search-{param}.html\\";s:5:\\"uhome\\";s:12:\\"u-{uid}.html\\";s:5:\\"ulist\\";s:22:\\"u-{uid}-list-{id}.html\\";s:10:\\"ulist_page\\";s:29:\\"u-{uid}-list-{id}-{page}.html\\";s:5:\\"ushow\\";s:28:\\"u-{uid}-show-{mid}-{id}.html\\";s:10:\\"ushow_page\\";s:35:\\"u-{uid}-show-{mid}-{id}-{page}.html\\";s:8:\\"sns_show\\";s:26:\\"u-{uid}-sns-show-{id}.html\\";s:9:\\"sns_topic\\";s:27:\\"u-{uid}-sns-topic-{id}.html\\";s:14:\\"sns_topic_page\\";s:34:\\"u-{uid}-sns-topic-{id}-{page}.html\\";s:3:\\"sns\\";s:23:\\"u-{uid}-sns-{name}.html\\";s:8:\\"sns_page\\";s:30:\\"u-{uid}-sns-{name}-{page}.html\\";s:12:\\"ulist_domain\\";s:16:\\"u-list-{id}.html\\";s:17:\\"ulist_domain_page\\";s:23:\\"u-list-{id}-{page}.html\\";s:12:\\"ushow_domain\\";s:22:\\"u-show-{mid}-{id}.html\\";s:17:\\"ushow_domain_page\\";s:29:\\"u-show-{mid}-{id}-{page}.html\\";s:15:\\"sns_show_domain\\";s:20:\\"u-sns-show-{id}.html\\";s:16:\\"sns_topic_domain\\";s:21:\\"u-sns-topic-{id}.html\\";s:21:\\"sns_topic_domain_page\\";s:28:\\"u-sns-topic-{id}-{page}.html\\";s:10:\\"sns_domain\\";s:22:\\"u-sns-{name}-{id}.html\\";s:15:\\"sns_domain_page\\";s:29:\\"u-sns-{name}-{id}-{page}.html\\";s:6:\\"member\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
INSERT INTO `{dbprefix}urlrule` VALUES(8, 6, '会员部分测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:11:\\"member.html\\";s:10:\\"member_reg\\";s:13:\\"register.html\\";s:12:\\"member_login\\";s:10:\\"login.html\\";s:7:\\"catjoin\\";s:0:\\"\\";}');
-- ----------------------------------------------------------------
--
-- 转存表中的数据 `dr_site`
--
-- INSERT INTO `{dbprefix}site` VALUES(1, 'FineCMS体验网站', '', '{"SITE_CLOSE":"0","SITE_CLOSE_MSG":"\\u7f51\\u7ad9\\u5347\\u7ea7\\u4e2d....","SITE_NAME":"FineCMS\\u4f53\\u9a8c\\u7f51\\u7ad9","SITE_TIME_FORMAT":"Y-m-d H:i","SITE_LANGUAGE":"zh-cn","SITE_THEME":"default","SITE_TEMPLATE":"default","SITE_TIMEZONE":"8","SITE_REWRITE":"0","SITE_WWW":"","SITE_MOBILE":"","SITE_SEOJOIN":"_","SITE_TITLE":"FineCMS\\u4f53\\u9a8c\\u7f51\\u7ad9","SITE_KEYWORDS":"","SITE_DESCRIPTION":"","SITE_IMAGE_WATERMARK":"0","SITE_IMAGE_VRTALIGN":"top","SITE_IMAGE_HORALIGN":"left","SITE_IMAGE_VRTOFFSET":"","SITE_IMAGE_HOROFFSET":"","SITE_IMAGE_TYPE":"0","SITE_IMAGE_OVERLAY":"default.png","SITE_IMAGE_OPACITY":"","SITE_IMAGE_FONT":"default.ttf","SITE_IMAGE_COLOR":"","SITE_IMAGE_SIZE":"","SITE_IMAGE_TEXT":"","image":{"1":{"width":"","height":""},"2":{"width":"","height":""},"3":{"width":"","height":""},"4":{"width":"","height":""},"5":{"width":"","height":""},"6":{"width":"","height":""},"7":{"width":"","height":""},"8":{"width":"","height":""},"9":{"width":"","height":""}},"SITE_DOMAIN":null,"SITE_DOMAINS":"","SITE_NAVIGATOR":"\\u4e3b\\u5bfc\\u822a,\\u9996\\u9875\\u5e7b\\u706f,\\u9996\\u9875\\u5934\\u6761,\\u5e95\\u90e8\\u5bfc\\u822a,\\u53cb\\u60c5\\u94fe\\u63a5,,,,,","SITE_IMAGE_CONTENT":0}');

--------------------------------------------------------
--
-- 转存表中的数据 `dr_module`
--
-- INSERT INTO `{dbprefix}module` VALUES(1, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'news', 1, 0, 1, '', 0, 0);
-- INSERT INTO `{dbprefix}module` VALUES(2, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'down', 1, 0, 1, '', 0, 0);
-- INSERT INTO `{dbprefix}module` VALUES(3, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'fang', 1, 0, 1, '', 0, 0);
-- INSERT INTO `{dbprefix}module` VALUES(4, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'photo', 1, 0, 1, '', 0, 0);
-- INSERT INTO `{dbprefix}module` VALUES(5, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'special', 1, 0, 1, '', 0, 0);
-- INSERT INTO `{dbprefix}module` VALUES(6, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'demo', 0, 0, 1, '', 0, 0);


-- ----------------------------------------------------------
-- 转存表中的数据 `dr_member_scorelog`
--
INSERT INTO `{dbprefix}member_scorelog` VALUES(1, 1, 0, 5, 'login', '每日登陆', 1478944853);
INSERT INTO `{dbprefix}member_scorelog` VALUES(2, 1, 0, 5, 'login', '每日登陆', 1479116132);
INSERT INTO `{dbprefix}member_scorelog` VALUES(3, 1, 0, 5, 'login', '每日登陆', 1479735676);
INSERT INTO `{dbprefix}member_scorelog` VALUES(4, 1, 0, 5, 'login', '每日登陆', 1480918740);
INSERT INTO `{dbprefix}member_scorelog` VALUES(5, 1, 1, -5, '', '购买', 1480922018);

--------------------------------------------------------
--
-- 转存表中的数据 `{dbprefix}field`
--
INSERT INTO `{dbprefix}field` VALUES(1, '相关附件', 'attachment', 'Files', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:5:{s:5:"width";s:3:"80%";s:4:"size";s:1:"2";s:5:"count";s:2:"10";s:3:"ext";s:31:"jpg,gif,png,ppt,doc,xls,rar,zip";s:10:"uploadpath";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"0";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"0";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0);
INSERT INTO `{dbprefix}field` VALUES(2, '单页内容', 'content', 'Ueditor', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:7:{s:5:"width";s:3:"90%";s:6:"height";s:3:"400";s:4:"mode";s:1:"1";s:4:"tool";s:0:"";s:5:"mode2";s:1:"1";s:5:"tool2";s:0:"";s:5:"value";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"1";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"1";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0);
INSERT INTO `{dbprefix}field` VALUES(3, '主题', 'title', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(4, '缩略图', 'thumb', 'File', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
INSERT INTO `{dbprefix}field` VALUES(5, '关键字', 'keywords', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(6, '描述', 'description', 'Textarea', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 0);
INSERT INTO `{dbprefix}field` VALUES(7, '内容', 'content', 'Ueditor', 1, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"1","tool":"''bold'', ''italic'', ''underline''","mode2":"1","tool2":"''bold'', ''italic'', ''underline''","mode3":"1","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(8, '软件名称', 'title', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\"","required":1}}', 1);
INSERT INTO `{dbprefix}field` VALUES(9, '缩略图', 'thumb', 'File', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 97);
INSERT INTO `{dbprefix}field` VALUES(10, '关键字', 'keywords', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 4);
INSERT INTO `{dbprefix}field` VALUES(11, '描述', 'description', 'Textarea', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 5);
INSERT INTO `{dbprefix}field` VALUES(12, '软件版本', 'version', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1}}', 2);
INSERT INTO `{dbprefix}field` VALUES(13, '软件语言', 'language', 'Select', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"\\u7b80\\u4f53\\u4e2d\\u6587\\n\\u7e41\\u4f53\\u4e2d\\u6587\\n\\u82f1\\u6587\\n\\u591a\\u56fd\\u8bed\\u8a00"},"validate":{"xss":1}}', 7);
INSERT INTO `{dbprefix}field` VALUES(14, '软件授权', 'license', 'Select', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"\\u5171\\u4eab\\u7248\\n\\u514d\\u8d39\\u7248\\n\\u5546\\u4e1a\\u7248\\n\\u8bd5\\u7528\\u7248\\n\\u5f00\\u6e90\\u8f6f\\u4ef6"},"validate":{"xss":1}}', 8);
INSERT INTO `{dbprefix}field` VALUES(15, '适用环境', 'os', 'Checkbox', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"WinXp\\nWin7\\nWin8\\nLinux\\nMac"},"validate":{"xss":1}}', 9);
INSERT INTO `{dbprefix}field` VALUES(16, '演示地址', 'demo', 'Text', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":300,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"prep_url"}}', 11);
INSERT INTO `{dbprefix}field` VALUES(17, '官方网站', 'siteurl', 'Text', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":300,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"prep_url"}}', 10);
INSERT INTO `{dbprefix}field` VALUES(18, '上传文件', 'file', 'File', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"zip,rar,7z,tar,gz","size":10,"count":1}}', 3);
INSERT INTO `{dbprefix}field` VALUES(19, '更多图片', 'images', 'Files', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"gif,png,jpg","size":10,"count":10}}', 98);
INSERT INTO `{dbprefix}field` VALUES(20, '软件简介', 'content', 'Ueditor', 2, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"2","tool":"''bold'', ''italic'', ''underline''","mode2":"2","tool2":"''bold'', ''italic'', ''underline''","mode3":"2","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 99);
INSERT INTO `{dbprefix}field` VALUES(21, '租金类型', 'zujinleixing', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u62bc\\u4e00\\u4ed8\\u4e09\\n\\u62bc\\u4e00\\u4ed8\\u4e8c\\n\\u62bc\\u4e00\\u4ed8\\u4e00\\n\\u534a\\u5e74\\u4ed8\\n\\u5e74\\u4ed8\\n\\u9762\\u8bae","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(22, '租金', 'zujin', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(23, '所在层', 'suozaiceng', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(24, '总层', 'zongceng', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(25, '朝向', 'chaoxiang', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u5357\\u5317\\u901a\\u900f\\n\\u4e1c\\u897f\\u5411\\n\\u671d\\u5357\\n\\u671d\\u5317\\n\\u671d\\u4e1c\\n\\u671d\\u897f","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(26, '装修', 'zhuangxiu', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u6bdb\\u576f\\n\\u7b80\\u88c5\\u4fee\\n\\u4e2d\\u7b49\\u88c5\\u4fee\\n\\u7cbe\\u88c5\\u4fee\\n\\u8c6a\\u534e\\u88c5\\u4fee","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(27, '面积', 'mianji', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(28, '卫', 'wei', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(29, '厅', 'ting', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(30, '室', 'shi', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":"20"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(31, '户型', 'huxing', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u4e00\\u5c45\\n\\u4e8c\\u5c45\\n\\u4e09\\u5c45\\n\\u56db\\u5c45\\n\\u56db\\u5c45\\u4ee5\\u4e0a","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(32, '位置', 'weizhi', 'Baidumap', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"700","height":"430","level":"15","city":"\\u6210\\u90fd"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 8);
INSERT INTO `{dbprefix}field` VALUES(33, '小区名称', 'xiaoqumingcheng', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 6);
INSERT INTO `{dbprefix}field` VALUES(34, '地址', 'dizhi', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"500","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 7);
INSERT INTO `{dbprefix}field` VALUES(35, '区域', 'area', 'Linkage', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"linkage":"address","value":""},"validate":{"xss":"0","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 5);
INSERT INTO `{dbprefix}field` VALUES(36, '主题', 'title', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":"400","value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":"1","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 1);
INSERT INTO `{dbprefix}field` VALUES(37, '缩略图', 'thumb', 'File', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"size":"10","ext":"jpg,gif,png","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 3);
INSERT INTO `{dbprefix}field` VALUES(38, '关键字', 'keywords', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":"400","value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":"1","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","formattr":" data-role=\\"tagsinput\\""}}', 2);
INSERT INTO `{dbprefix}field` VALUES(39, '描述', 'description', 'Textarea', 3, 'module', 1, 1, 1, 1, 1, 1, '{"option":{"width":"500","height":"60","value":""},"validate":{"xss":"1","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"dr_clearhtml","tips":"","formattr":""}}', 99);
INSERT INTO `{dbprefix}field` VALUES(40, '联系人', 'lianxiren', 'Text', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 13);
INSERT INTO `{dbprefix}field` VALUES(41, '房屋图片', 'images', 'Files', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"80%","size":"5","count":"5","ext":"gif,png,jpg","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
INSERT INTO `{dbprefix}field` VALUES(42, '租金', 'zujin2', 'Group', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"value":"<label>{zujin}<\\/label><label>\\u5143\\/\\u6708\\uff0c<\\/label><label>{zujinleixing}<\\/label>"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 11);
INSERT INTO `{dbprefix}field` VALUES(43, '房屋状况', 'fangwuzhuangkuang', 'Group', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"value":"<label>\\u5ba4<\\/label><label>{shi}<\\/label><label>\\uff0c\\u5385<\\/label><label>{ting}<\\/label><label> \\uff0c\\u536b<\\/label><label>{wei}<\\/label><label>\\uff0c<\\/label><label>{mianji}<\\/label><label>\\u5e73\\u7c73\\uff0c\\u7b2c<\\/label><label>{suozaiceng}<\\/label><label>\\u5c42\\uff0c\\u5171<\\/label><label>{zongceng}<\\/label><label>\\u5c42\\uff0c<\\/label><label>{huxing}<\\/label><label> {zhuangxiu}<\\/label><label> {chaoxiang}<\\/label>"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 9);
INSERT INTO `{dbprefix}field` VALUES(44, '配套', 'peitao', 'Checkbox', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"options":"\\u62ce\\u5305\\u5165\\u4f4f\\n\\u5bb6\\u7535\\u9f50\\u5168\\n\\u53ef\\u4e0a\\u7f51\\n\\u53ef\\u505a\\u996d\\n\\u53ef\\u6d17\\u6fa1\\n\\u7a7a\\u8c03\\u623f\\n\\u53ef\\u770b\\u7535\\u89c6\\n\\u6709\\u6696\\u6c14\\n\\u6709\\u8f66\\u4f4d","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 10);
INSERT INTO `{dbprefix}field` VALUES(45, '联系电话', 'lianxidianhua', 'Text', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"300","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 14);
INSERT INTO `{dbprefix}field` VALUES(46, '内容', 'content', 'Ueditor', 3, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"100%","height":"400","mode":"2","tool":"''bold'', ''italic'', ''underline''","value":""},"validate":{"xss":"1","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 99);
INSERT INTO `{dbprefix}field` VALUES(47, '主题', 'title', 'Text', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(48, '缩略图', 'thumb', 'File', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
INSERT INTO `{dbprefix}field` VALUES(49, '关键字', 'keywords', 'Text', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(50, '描述', 'description', 'Textarea', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 0);
INSERT INTO `{dbprefix}field` VALUES(51, '图片', 'images', 'Files', 4, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"gif,png,jpg","size":10,"count":10}}', 0);
INSERT INTO `{dbprefix}field` VALUES(52, '详情', 'content', 'Ueditor', 4, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"2","tool":"''bold'', ''italic'', ''underline''","mode2":"2","tool2":"''bold'', ''italic'', ''underline''","mode3":"2","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(53, '主题', 'title', 'Text', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 1);
INSERT INTO `{dbprefix}field` VALUES(54, '缩略图', 'thumb', 'File', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 3);
INSERT INTO `{dbprefix}field` VALUES(55, '关键字', 'keywords', 'Text', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 2);
INSERT INTO `{dbprefix}field` VALUES(56, '描述', 'description', 'Textarea', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 98);
INSERT INTO `{dbprefix}field` VALUES(57, '模板文件', 'template', 'Text', 5, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"157","value":"show.html","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"\\u4e5f\\u53ef\\u4ee5\\u5728\\u8fd9\\u91cc\\u6307\\u5b9a\\u6a21\\u677f\\u6587\\u4ef6","formattr":""}}', 100);
INSERT INTO `{dbprefix}field` VALUES(58, '新闻关联', 'guanlian', 'Related', 5, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"module":"news","width":"80%"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
INSERT INTO `{dbprefix}field` VALUES(59, '封面图', 'banner', 'Files', 5, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"80%","size":"2","count":"10","ext":"gif,png,jpg","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
INSERT INTO `{dbprefix}field` VALUES(60, '简介', 'content', 'Ueditor', 5, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"2","tool":"''bold'', ''italic'', ''underline''","mode2":"2","tool2":"''bold'', ''italic'', ''underline''","mode3":"2","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 99);
INSERT INTO `{dbprefix}field` VALUES(61, '主题', 'title', 'Text', 1, 'form-1', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1}}', 0);
INSERT INTO `{dbprefix}field` VALUES(62, '留言内容', 'liuyanneirong', 'Ueditor', 1, 'form-1', 1, 0, 0, 1, 0, 0, '{"option":{"width":"100%","height":"300","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"1","tool":"''bold'', ''italic'', ''underline''","mode2":"1","tool2":"''bold'', ''italic'', ''underline''","mode3":"1","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":"","xss":1},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(64, '复选框', 'fuxuankuang', 'Checkbox', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(65, '颜色选取（放右边）', 'ysxqfyb', 'Color', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"field":"title","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"1"}', 0);
INSERT INTO `{dbprefix}field` VALUES(66, '阅读收费', 'yuedushoufei', 'Fees', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"80%"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(67, '单个文件', 'dangewenjian', 'File', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"size":"12","ext":"zip","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(68, '多个文件或图片', 'dgwjhtp', 'Files', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"90%","size":"10","count":"10","ext":"jpg,gif,png,exe,rar,zip","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(69, '图片专用', 'tpzy', 'Image', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"80%","size":"10","count":"5","autodown":"0","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(70, '联动菜单', 'ldcd', 'Linkage', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"linkage":"address","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(71, '商品属性', 'spsx', 'Property', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"100%"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(72, '内容关联（新闻）', 'nrglxw', 'Related', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"module":"news","width":"90%","limit":"22"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(73, '视频文件', 'spwj', 'Video', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"90%","size":"10","ext":"mp4","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(74, '单选按钮', 'danxuananniu', 'Radio', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":"","fieldtype":"","fieldlength":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(75, '下拉选择', 'xialaxuanze', 'Select', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":"","fieldtype":"","fieldlength":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(76, '百度地图', 'baiduditu', 'Baidumap', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"700","height":"430","level":"15","city":"\\u5317\\u4eac"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `{dbprefix}field` VALUES(77, '主题', 'title', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(78, '缩略图', 'thumb', 'File', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
INSERT INTO `{dbprefix}field` VALUES(79, '关键字', 'keywords', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
INSERT INTO `{dbprefix}field` VALUES(80, '描述', 'description', 'Textarea', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 0);
INSERT INTO `{dbprefix}field` VALUES(81, '内容', 'content', 'Ueditor', 6, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":1,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);

-- --------------------------------------------------------
--
-- 转存表中的数据 `{dbprefix}attachment_unused`
--
INSERT INTO `{dbprefix}attachment_unused` VALUES(12, 1, 'admin', 1, 'blob', 'png', 20045, 'ueditor/image/20161104/1478253106.png', 0, '{"width":153,"height":100}', 1478253106);
INSERT INTO `{dbprefix}attachment_unused` VALUES(11, 1, 'admin', 1, '139854478', 'jpg', 36678, 'ueditor/image/20161104/1478253041.jpg', 0, '{"width":640,"height":429}', 1478253041);
INSERT INTO `{dbprefix}attachment_unused` VALUES(13, 1, 'admin', 1, 'blob', 'png', 20045, 'ueditor/image/20161104/1478253191.png', 0, '{"width":153,"height":100}', 1478253191);
INSERT INTO `{dbprefix}attachment_unused` VALUES(14, 1, 'admin', 1, 'blob', 'png', 11818, 'ueditor/image/20161104/1478254275.png', 0, '{"width":457,"height":85}', 1478254275);
INSERT INTO `{dbprefix}attachment_unused` VALUES(15, 1, 'admin', 1, 'blob', 'png', 21364, 'ueditor/image/20161104/1478254719.png', 0, '{"width":300,"height":259}', 1478254719);
INSERT INTO `{dbprefix}attachment_unused` VALUES(16, 1, 'admin', 1, 'blob', 'png', 21364, 'ueditor/image/20161104/1478254720.png', 0, '{"width":300,"height":259}', 1478254720);
INSERT INTO `{dbprefix}attachment_unused` VALUES(17, 1, 'admin', 1, 'QQ20161104-3@2x', 'png', 451426, 'ueditor/image/20161104/1478255094.png', 0, '{"width":726,"height":468}', 1478255094);
INSERT INTO `{dbprefix}attachment_unused` VALUES(192, 1, 'admin', 1, '20110825_8a045c986f5a386ce066sJs1TdOC6QMu', 'jpg', 110019, '201611/0aaa60b8a8.jpg', 0, '{"width":729,"height":515}', 1478491556);
INSERT INTO `{dbprefix}attachment_unused` VALUES(171, 1, 'admin', 1, '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/f9dfed44e5.jpg', 0, '{"width":550,"height":542}', 1478491138);
INSERT INTO `{dbprefix}attachment_unused` VALUES(115, 1, 'admin', 1, '576689_012358067_2', 'jpg', 125716, '201611/0fba191afb.jpg', 0, '{"width":769,"height":1024}', 1478490250);
INSERT INTO `{dbprefix}attachment_unused` VALUES(193, 1, 'admin', 1, '37499766_1408175522863', 'jpg', 512563, '201611/0b8a88b46a.jpg', 0, '{"width":1504,"height":1150}', 1478491557);
INSERT INTO `{dbprefix}attachment_unused` VALUES(205, 1, 'admin', 1, 'fjtu (22)', 'jpg', 3098952, '201611/8e3cd325e5.jpg', 0, '{"width":1920,"height":1200}', 1478492623);
INSERT INTO `{dbprefix}attachment_unused` VALUES(139, 1, 'admin', 1, '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/8e0995980f.jpg', 0, '{"width":450,"height":343}', 1478490680);
INSERT INTO `{dbprefix}attachment_unused` VALUES(242, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920547);
INSERT INTO `{dbprefix}attachment_unused` VALUES(243, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `{dbprefix}attachment_unused` VALUES(244, 1, 'admin', 1, 'QQ20161201-1@2x', 'png', 585011200, '201612/QQ20161201-1@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `{dbprefix}attachment_unused` VALUES(245, 1, 'admin', 1, 'QQ20161201-0@2x', 'png', 374559744, '201612/QQ20161201-0@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `{dbprefix}attachment_unused` VALUES(246, 1, 'admin', 1, 'QQ20161130-3@2x', 'png', 549230592, '201612/QQ20161130-3@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `{dbprefix}attachment_unused` VALUES(247, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920687);
INSERT INTO `{dbprefix}attachment_unused` VALUES(248, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920776);
INSERT INTO `{dbprefix}attachment_unused` VALUES(249, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480921138);

-- ----------------------------------------------------------
-- 转存表中的数据 `{dbprefix}attachment_1`
--
INSERT INTO `{dbprefix}attachment_1` VALUES(7, 1, 'admin', 'dr_1_block-1', 'QQ20161104-4@2x', 'png', 1153649, '201611/09436dd6c4.png', 0, '{"width":1140,"height":664}', 1478252466);
INSERT INTO `{dbprefix}attachment_1` VALUES(8, 1, 'admin', 'dr_1_block-1', 'QQ20161104-3@2x', 'png', 451430, '201611/b309436dd6.png', 0, '{"width":726,"height":468}', 1478252467);
INSERT INTO `{dbprefix}attachment_1` VALUES(9, 1, 'admin', 'dr_1_block-1', 'QQ20161104-2@2x', 'png', 915333, '201611/6dd6c48f2b.png', 0, '{"width":914,"height":628}', 1478252467);
INSERT INTO `{dbprefix}attachment_1` VALUES(10, 1, 'admin', 'dr_1_news-1', '139854478', 'jpg', 36680, '201611/47ac5e8a71.jpg', 0, '{"width":640,"height":429}', 1478253027);
INSERT INTO `{dbprefix}attachment_1` VALUES(18, 1, 'admin', 'dr_1_down-43', '4bed2e738bd4b31cf7e8017885d6277f9f2ff819', 'jpg', 23470, '201611/e2fcfed12b.jpg', 0, '{"width":250,"height":250}', 1478484927);
INSERT INTO `{dbprefix}attachment_1` VALUES(19, 1, 'admin', 'dr_1_down-42', '4bed2e738bd4b31cf7e8017885d6277f9f2ff819', 'jpg', 23470, '201611/c4bdd8befe.jpg', 0, '{"width":250,"height":250}', 1478484945);
INSERT INTO `{dbprefix}attachment_1` VALUES(20, 1, 'admin', 'dr_1_down-41', '8ad4b31c8701a18b291947f2982f07082938fe99', 'png', 100413, '201611/a76fe8358b.png', 0, '{"width":300,"height":300}', 1478484958);
INSERT INTO `{dbprefix}attachment_1` VALUES(21, 1, 'admin', 'dr_1_down-40', '59c932d3d539b600f5160d2fef50352ac75cb751', 'jpg', 8980, '201611/6d3654bd0a.jpg', 0, '{"width":300,"height":300}', 1478484989);
INSERT INTO `{dbprefix}attachment_1` VALUES(22, 1, 'admin', 'dr_1_down-39', 'rBACFFOLHk2i34HeAAAd0wGPTTw022_200x200_3', 'jpg', 7608, '201611/f476e48a04.jpg', 0, '{"width":200,"height":200}', 1478485004);
INSERT INTO `{dbprefix}attachment_1` VALUES(23, 1, 'admin', 'dr_1_down-38', '20160811074413_VB4SA', 'png', 72673, '201611/ce0f4a9e86.png', 0, '{"width":220,"height":220}', 1478485018);
INSERT INTO `{dbprefix}attachment_1` VALUES(24, 1, 'admin', 'dr_1_down-37', '8644ebf81a4c510f51dd68546659252dd42aa567', 'jpg', 7485, '201611/727fbbb410.jpg', 0, '{"width":200,"height":200}', 1478485031);
INSERT INTO `{dbprefix}attachment_1` VALUES(25, 1, 'admin', 'dr_1_down-36', '20160811074413_VB4SA', 'png', 72673, '201611/515b02a64f.png', 0, '{"width":220,"height":220}', 1478485046);
INSERT INTO `{dbprefix}attachment_1` VALUES(26, 1, 'admin', 'dr_1_fang-44', '06t58PICncZ_1024', 'jpg', 126659, '201611/de07a079d6.jpg', 0, '{"width":1024,"height":790}', 1478485409);
INSERT INTO `{dbprefix}attachment_1` VALUES(27, 1, 'admin', 'dr_1_fang-44', '06t58PICncZ_1024', 'jpg', 126659, '201611/ffc408ca46.jpg', 0, '{"width":1024,"height":790}', 1478485464);
INSERT INTO `{dbprefix}attachment_1` VALUES(28, 1, 'admin', 'dr_1_fang-45', '56e7751ed6533', 'jpg', 798351, '201611/69384faa8b.jpg', 0, '{"width":3888,"height":2592}', 1478485618);
INSERT INTO `{dbprefix}attachment_1` VALUES(29, 1, 'admin', 'dr_1_fang-45', '56e7751ed6533', 'jpg', 798351, '201611/0fdebad5b1.jpg', 0, '{"width":3888,"height":2592}', 1478485635);
INSERT INTO `{dbprefix}attachment_1` VALUES(30, 1, 'admin', 'dr_1_fang-46', '738b4710b912c8fc2ce014bfff039245d68821b5', 'jpg', 225618, '201611/554b860512.jpg', 0, '{"width":1004,"height":699}', 1478485742);
INSERT INTO `{dbprefix}attachment_1` VALUES(31, 1, 'admin', 'dr_1_fang-47', '914109_163208469000_2', 'jpg', 401807, '201611/0389987153.jpg', 0, '{"width":1024,"height":780}', 1478485840);
INSERT INTO `{dbprefix}attachment_1` VALUES(32, 1, 'admin', 'dr_1_fang-47', '914109_163208469000_2', 'jpg', 401807, '201611/d1ba167ba6.jpg', 0, '{"width":1024,"height":780}', 1478485851);
INSERT INTO `{dbprefix}attachment_1` VALUES(33, 1, 'admin', 'dr_1_fang-48', '914109_210757456000_2', 'jpg', 452905, '201611/021a979c88.jpg', 0, '{"width":1024,"height":683}', 1478486000);
INSERT INTO `{dbprefix}attachment_1` VALUES(34, 1, 'admin', 'dr_1_fang-48', '914109_210757456000_2', 'jpg', 452905, '201611/ba7428b862.jpg', 0, '{"width":1024,"height":683}', 1478486011);
INSERT INTO `{dbprefix}attachment_1` VALUES(35, 1, 'admin', 'dr_1_fang-49', '4114512_084432034885_2', 'jpg', 279060, '201611/b68cffdaf8.jpg', 0, '{"width":1024,"height":688}', 1478486399);
INSERT INTO `{dbprefix}attachment_1` VALUES(36, 1, 'admin', 'dr_1_fang-49', '4114512_084432034885_2', 'jpg', 279060, '201611/55f3a9e212.jpg', 0, '{"width":1024,"height":688}', 1478486413);
INSERT INTO `{dbprefix}attachment_1` VALUES(37, 1, 'admin', 'dr_1_fang-50', '4915200_114049531110_2', 'jpg', 260393, '201611/8489e23e91.jpg', 0, '{"width":768,"height":1024}', 1478486650);
INSERT INTO `{dbprefix}attachment_1` VALUES(38, 1, 'admin', 'dr_1_fang-50', '4915200_114049531110_2', 'jpg', 260393, '201611/d026557b41.jpg', 0, '{"width":768,"height":1024}', 1478486658);
INSERT INTO `{dbprefix}attachment_1` VALUES(39, 1, 'admin', 'dr_1_fang-51', '9880981_201646746168_2', 'jpg', 277228, '201611/bcdef6cf97.jpg', 0, '{"width":1024,"height":684}', 1478486768);
INSERT INTO `{dbprefix}attachment_1` VALUES(40, 1, 'admin', 'dr_1_fang-51', '9880981_201646746168_2', 'jpg', 277228, '201611/33a4054f53.jpg', 0, '{"width":1024,"height":684}', 1478486775);
INSERT INTO `{dbprefix}attachment_1` VALUES(41, 1, 'admin', 'dr_1_fang-52', '12993780_125123492000_2', 'jpg', 78131, '201611/fc29f170a6.jpg', 0, '{"width":1024,"height":695}', 1478486976);
INSERT INTO `{dbprefix}attachment_1` VALUES(42, 1, 'admin', 'dr_1_fang-52', '12993780_125123492000_2', 'jpg', 78131, '201611/e1fa3bf454.jpg', 0, '{"width":1024,"height":695}', 1478486983);
INSERT INTO `{dbprefix}attachment_1` VALUES(43, 1, 'admin', 'dr_1_fang-53', '20150318102238_4008', 'jpg', 221522, '201611/1adf6f1c36.jpg', 0, '{"width":1131,"height":707}', 1478487096);
INSERT INTO `{dbprefix}attachment_1` VALUES(44, 1, 'admin', 'dr_1_fang-53', '20150318102238_4008', 'jpg', 221522, '201611/73e868e958.jpg', 0, '{"width":1131,"height":707}', 1478487105);
INSERT INTO `{dbprefix}attachment_1` VALUES(45, 1, 'admin', 'dr_1_fang-54', 'b74e53a67d4511e6aae400163e00254c', 'jpg', 85729, '201611/029695adc4.jpg', 0, '{"width":557,"height":372}', 1478487162);
INSERT INTO `{dbprefix}attachment_1` VALUES(46, 1, 'admin', 'dr_1_fang-54', 'b74e53a67d4511e6aae400163e00254c', 'jpg', 85729, '201611/73ac62d39b.jpg', 0, '{"width":557,"height":372}', 1478487170);
INSERT INTO `{dbprefix}attachment_1` VALUES(47, 1, 'admin', 'dr_1_fang-55', '20150318102238_4008', 'jpg', 221522, '201611/08e1327c34.jpg', 0, '{"width":1131,"height":707}', 1478487232);
INSERT INTO `{dbprefix}attachment_1` VALUES(48, 1, 'admin', 'dr_1_fang-55', '20150318102238_4008', 'jpg', 221522, '201611/f71d086848.jpg', 0, '{"width":1131,"height":707}', 1478487242);
INSERT INTO `{dbprefix}attachment_1` VALUES(50, 1, 'admin', 'dr_1_photo-56', '1-14112Q14R5', 'jpg', 7209, '201611/f55bf01b79.jpg', 0, '{"width":200,"height":200}', 1478487541);
INSERT INTO `{dbprefix}attachment_1` VALUES(49, 1, 'admin', 'dr_1_photo-56', '1-14112Q14R5', 'jpg', 7209, '201611/6d032d3916.jpg', 0, '{"width":200,"height":200}', 1478487533);
INSERT INTO `{dbprefix}attachment_1` VALUES(51, 1, 'admin', 'dr_1_photo-56', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/b17fcabdca.jpg', 0, '{"width":300,"height":300}', 1478487553);
INSERT INTO `{dbprefix}attachment_1` VALUES(54, 1, 'admin', 'dr_1_photo-57', '786e6c061d950a7b4edcdb790ad162d9f3d3c90c', 'png', 117371, '201611/118fc82c86.png', 0, '{"width":300,"height":300}', 1478487615);
INSERT INTO `{dbprefix}attachment_1` VALUES(53, 1, 'admin', 'dr_1_photo-57', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/822c6a0304.jpg', 0, '{"width":200,"height":200}', 1478487603);
INSERT INTO `{dbprefix}attachment_1` VALUES(52, 1, 'admin', 'dr_1_photo-57', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/8964c5924f.jpg', 0, '{"width":200,"height":200}', 1478487597);
INSERT INTO `{dbprefix}attachment_1` VALUES(55, 1, 'admin', 'dr_1_photo-57', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/cf2955ebeb.jpg', 0, '{"width":300,"height":300}', 1478487615);
INSERT INTO `{dbprefix}attachment_1` VALUES(56, 1, 'admin', 'dr_1_photo-57', '55cc613d0212b816_jpg!200x200', 'jpg', 8018, '201611/acf2955ebe.jpg', 0, '{"width":200,"height":200}', 1478487616);
INSERT INTO `{dbprefix}attachment_1` VALUES(61, 1, 'admin', 'dr_1_photo-59', '55824602bc8d3046_jpg!200x200', 'jpg', 9247, '201611/ebd5b75e4c1.jpg', 0, '{"width":200,"height":200}', 1478487792);
INSERT INTO `{dbprefix}attachment_1` VALUES(60, 1, 'admin', 'dr_1_photo-59', '786e6c061d950a7b4edcdb790ad162d9f3d3c90c', 'png', 117371, '201611/6c0cfd9ebd.png', 0, '{"width":300,"height":300}', 1478487792);
INSERT INTO `{dbprefix}attachment_1` VALUES(59, 1, 'admin', 'dr_1_photo-59', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/d9ebd5b75e.jpg', 0, '{"width":200,"height":200}', 1478487792);
INSERT INTO `{dbprefix}attachment_1` VALUES(58, 1, 'admin', 'dr_1_photo-59', '55cc613d0212b816_jpg!200x200', 'jpg', 8018, '201611/ebd5b75e4c.jpg', 0, '{"width":200,"height":200}', 1478487791);
INSERT INTO `{dbprefix}attachment_1` VALUES(57, 1, 'admin', 'dr_1_photo-59', 'e00fc878jw8erzl99mmf3j20u00u0407', 'jpg', 63396, '201611/188dec66d9.jpg', 0, '{"width":1024,"height":1024}', 1478487777);
INSERT INTO `{dbprefix}attachment_1` VALUES(65, 1, 'admin', 'dr_1_photo-60', '20131023221024_dVS2M_thumb_200_0', 'gif', 16660, '201611/15785ab952.gif', 0, '{"width":200,"height":200}', 1478487831);
INSERT INTO `{dbprefix}attachment_1` VALUES(62, 1, 'admin', 'dr_1_photo-60', '20131023220851_Wf3cM_thumb_224_0', 'jpg', 11018, '201611/348f37d0bf.jpg', 0, '{"width":224,"height":224}', 1478487818);
INSERT INTO `{dbprefix}attachment_1` VALUES(63, 1, 'admin', 'dr_1_photo-60', '20160811074413_VB4SA', 'png', 72673, '201611/5785ab9528.png', 0, '{"width":220,"height":220}', 1478487831);
INSERT INTO `{dbprefix}attachment_1` VALUES(64, 1, 'admin', 'dr_1_photo-60', 'e00fc878jw8erzl99mmf3j20u00u0407', 'jpg', 63396, '201611/92fececdd4.jpg', 0, '{"width":1024,"height":1024}', 1478487831);
INSERT INTO `{dbprefix}attachment_1` VALUES(66, 1, 'admin', 'dr_1_photo-61', '20131023221024_dVS2M_thumb_200_0', 'gif', 16660, '201611/ac379cb995.gif', 0, '{"width":200,"height":200}', 1478487872);
INSERT INTO `{dbprefix}attachment_1` VALUES(69, 1, 'admin', 'dr_1_photo-61', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/35582753a6.jpg', 0, '{"width":200,"height":200}', 1478487880);
INSERT INTO `{dbprefix}attachment_1` VALUES(68, 1, 'admin', 'dr_1_photo-61', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/4e52fd4fee.jpg', 0, '{"width":300,"height":300}', 1478487880);
INSERT INTO `{dbprefix}attachment_1` VALUES(67, 1, 'admin', 'dr_1_photo-61', '1-14112Q14R5', 'jpg', 7209, '201611/fee2f6be66.jpg', 0, '{"width":200,"height":200}', 1478487880);
INSERT INTO `{dbprefix}attachment_1` VALUES(73, 1, 'admin', 'dr_1_photo-62', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/81d94ba023.jpg', 0, '{"width":300,"height":300}', 1478487937);
INSERT INTO `{dbprefix}attachment_1` VALUES(74, 1, 'admin', 'dr_1_photo-62', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/4ba0239b30.jpg', 0, '{"width":200,"height":200}', 1478487937);
INSERT INTO `{dbprefix}attachment_1` VALUES(72, 1, 'admin', 'dr_1_photo-62', '4bed2e738bd4b31cf7e8017885d6277f9f2ff819', 'jpg', 23470, '201611/da30981d94.jpg', 0, '{"width":250,"height":250}', 1478487937);
INSERT INTO `{dbprefix}attachment_1` VALUES(70, 1, 'admin', 'dr_1_photo-62', '55824602bc8d3046_jpg!200x200', 'jpg', 9247, '201611/bc8c6b75e4.jpg', 0, '{"width":200,"height":200}', 1478487927);
INSERT INTO `{dbprefix}attachment_1` VALUES(71, 1, 'admin', 'dr_1_photo-62', '1-14112Q14R5', 'jpg', 7209, '201611/0981d94ba0.jpg', 0, '{"width":200,"height":200}', 1478487937);
INSERT INTO `{dbprefix}attachment_1` VALUES(78, 1, 'admin', 'dr_1_photo-63', '59c932d3d539b600f5160d2fef50352ac75cb751', 'jpg', 8980, '201611/b63e6d68f0.jpg', 0, '{"width":300,"height":300}', 1478487967);
INSERT INTO `{dbprefix}attachment_1` VALUES(79, 1, 'admin', 'dr_1_photo-63', '531c66a6754ce602_jpg!200x200', 'jpg', 8612, '201611/a97b67547c.jpg', 0, '{"width":200,"height":200}', 1478487967);
INSERT INTO `{dbprefix}attachment_1` VALUES(75, 1, 'admin', 'dr_1_photo-63', 'e00fc878jw8erzl99mmf3j20u00u0407', 'jpg', 63396, '201611/f554897c50.jpg', 0, '{"width":1024,"height":1024}', 1478487957);
INSERT INTO `{dbprefix}attachment_1` VALUES(77, 1, 'admin', 'dr_1_photo-63', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/174f062b63.jpg', 0, '{"width":200,"height":200}', 1478487967);
INSERT INTO `{dbprefix}attachment_1` VALUES(76, 1, 'admin', 'dr_1_photo-63', '23-075730_845', 'jpg', 18596, '201611/f04fcbea9e.jpg', 0, '{"width":200,"height":200}', 1478487967);
INSERT INTO `{dbprefix}attachment_1` VALUES(82, 1, 'admin', 'dr_1_photo-64', '1252374344215_mthumb', 'jpg', 195738, '201611/0476247769.jpg', 0, '{"width":700,"height":467}', 1478489263);
INSERT INTO `{dbprefix}attachment_1` VALUES(80, 1, 'admin', 'dr_1_photo-64', '16772285_16772285_1356060252515_mthumb', 'jpg', 177132, '201611/41a581a555.jpg', 0, '{"width":600,"height":399}', 1478489245);
INSERT INTO `{dbprefix}attachment_1` VALUES(81, 1, 'admin', 'dr_1_photo-64', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/c7d986262f.jpg', 0, '{"width":600,"height":337}', 1478489262);
INSERT INTO `{dbprefix}attachment_1` VALUES(83, 1, 'admin', 'dr_1_photo-65', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/2b3c6ea12c.jpg', 0, '{"width":600,"height":337}', 1478489288);
INSERT INTO `{dbprefix}attachment_1` VALUES(84, 1, 'admin', 'dr_1_photo-65', '16772285_16772285_1356060252515_mthumb', 'jpg', 177132, '201611/36ecf1d321.jpg', 0, '{"width":600,"height":399}', 1478489300);
INSERT INTO `{dbprefix}attachment_1` VALUES(85, 1, 'admin', 'dr_1_photo-65', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/c80759ade3.jpg', 0, '{"width":600,"height":337}', 1478489300);
INSERT INTO `{dbprefix}attachment_1` VALUES(86, 1, 'admin', 'dr_1_photo-66', '1252374344215_mthumb', 'jpg', 195738, '201611/451928a4bb.jpg', 0, '{"width":700,"height":467}', 1478489342);
INSERT INTO `{dbprefix}attachment_1` VALUES(87, 1, 'admin', 'dr_1_photo-66', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/b8a8ba6103.jpg', 0, '{"width":600,"height":337}', 1478489364);
INSERT INTO `{dbprefix}attachment_1` VALUES(88, 1, 'admin', 'dr_1_photo-66', '1252374344215_mthumb', 'jpg', 195738, '201611/a8ba6103bd.jpg', 0, '{"width":700,"height":467}', 1478489365);
INSERT INTO `{dbprefix}attachment_1` VALUES(89, 1, 'admin', 'dr_1_photo-67', '20131212110511-1194663692', 'png', 478894, '201611/24cec67b86.png', 0, '{"width":703,"height":438}', 1478489571);
INSERT INTO `{dbprefix}attachment_1` VALUES(91, 1, 'admin', 'dr_1_photo-67', '20131212110511-1194663692', 'png', 478894, '201611/b84c8cbf87.png', 0, '{"width":703,"height":438}', 1478489617);
INSERT INTO `{dbprefix}attachment_1` VALUES(90, 1, 'admin', 'dr_1_photo-67', '1252374344215_mthumb', 'jpg', 195738, '201611/584d0485bc.jpg', 0, '{"width":700,"height":467}', 1478489616);
INSERT INTO `{dbprefix}attachment_1` VALUES(95, 1, 'admin', 'dr_1_photo-68', '20150321000120-20333', 'jpg', 187054, '201611/649269fa94.jpg', 0, '{"width":750,"height":398}', 1478489670);
INSERT INTO `{dbprefix}attachment_1` VALUES(94, 1, 'admin', 'dr_1_photo-68', '20131212110511-1194663692', 'png', 478894, '201611/49269fa945.png', 0, '{"width":703,"height":438}', 1478489669);
INSERT INTO `{dbprefix}attachment_1` VALUES(92, 1, 'admin', 'dr_1_photo-68', '20150321000120-20333', 'jpg', 187054, '201611/15547886f7.jpg', 0, '{"width":750,"height":398}', 1478489652);
INSERT INTO `{dbprefix}attachment_1` VALUES(93, 1, 'admin', 'dr_1_photo-68', '1252374344215_mthumb', 'jpg', 195738, '201611/61aa6d25a8.jpg', 0, '{"width":700,"height":467}', 1478489669);
INSERT INTO `{dbprefix}attachment_1` VALUES(96, 1, 'admin', 'dr_1_photo-69', 'u=2669148020,976207079&fm=21&gp=0', 'jpg', 22323, '201611/f8abd276f8.jpg', 0, '{"width":334,"height":220}', 1478489792);
INSERT INTO `{dbprefix}attachment_1` VALUES(98, 1, 'admin', 'dr_1_photo-69', '201204261554489254', 'jpg', 102380, '201611/051919a181.jpg', 0, '{"width":500,"height":334}', 1478489803);
INSERT INTO `{dbprefix}attachment_1` VALUES(97, 1, 'admin', 'dr_1_photo-69', '20080727164228892', 'jpg', 99308, '201611/6b9da2bd8b.jpg', 0, '{"width":500,"height":320}', 1478489803);
INSERT INTO `{dbprefix}attachment_1` VALUES(101, 1, 'admin', 'dr_1_photo-70', 't018d061b5e655053da', 'png', 358052, '201611/2faec7aff2.png', 0, '{"width":548,"height":326}', 1478489832);
INSERT INTO `{dbprefix}attachment_1` VALUES(102, 1, 'admin', 'dr_1_photo-70', 'u=2669148020,976207079&fm=21&gp=0', 'jpg', 22323, '201611/3f2faec7af.jpg', 0, '{"width":334,"height":220}', 1478489833);
INSERT INTO `{dbprefix}attachment_1` VALUES(99, 1, 'admin', 'dr_1_photo-70', 't018d061b5e655053da', 'png', 358052, '201611/acbcc29cf7.png', 0, '{"width":548,"height":326}', 1478489822);
INSERT INTO `{dbprefix}attachment_1` VALUES(100, 1, 'admin', 'dr_1_photo-70', '201204261554489254', 'jpg', 102380, '201611/ce746723f2.jpg', 0, '{"width":500,"height":334}', 1478489832);
INSERT INTO `{dbprefix}attachment_1` VALUES(103, 1, 'admin', 'dr_1_photo-71', 'u=2669148020,976207079&fm=21&gp=0', 'jpg', 22323, '201611/d0e33522df.jpg', 0, '{"width":334,"height":220}', 1478489851);
INSERT INTO `{dbprefix}attachment_1` VALUES(104, 1, 'admin', 'dr_1_photo-71', '20080727164228892', 'jpg', 99308, '201611/0f1ba1e5c4.jpg', 0, '{"width":500,"height":320}', 1478489863);
INSERT INTO `{dbprefix}attachment_1` VALUES(106, 1, 'admin', 'dr_1_photo-71', 'psj', 'jpg', 392950, '201611/d9cb50f1ba.jpg', 0, '{"width":700,"height":522}', 1478489864);
INSERT INTO `{dbprefix}attachment_1` VALUES(105, 1, 'admin', 'dr_1_photo-71', '201204261554489254', 'jpg', 102380, '201611/4700f75d9c.jpg', 0, '{"width":500,"height":334}', 1478489864);
INSERT INTO `{dbprefix}attachment_1` VALUES(107, 1, 'admin', 'dr_1_photo-72', '_34423869907715406921904914816295740474', 'jpg', 53248, '201611/eac333381d.jpg', 0, '{"width":481,"height":550}', 1478490159);
INSERT INTO `{dbprefix}attachment_1` VALUES(108, 1, 'admin', 'dr_1_photo-72', '_34423869907715406921904914816295740474', 'jpg', 53248, '201611/aefc54470c.jpg', 0, '{"width":481,"height":550}', 1478490165);
INSERT INTO `{dbprefix}attachment_1` VALUES(109, 1, 'admin', 'dr_1_photo-73', '28U593Z4L292', 'jpg', 131625, '201611/eae467ed05.jpg', 0, '{"width":500,"height":682}', 1478490198);
INSERT INTO `{dbprefix}attachment_1` VALUES(110, 1, 'admin', 'dr_1_photo-73', '_34423869907715406921904914816295740474', 'jpg', 53248, '201611/fc280e8f53.jpg', 0, '{"width":481,"height":550}', 1478490209);
INSERT INTO `{dbprefix}attachment_1` VALUES(111, 1, 'admin', 'dr_1_photo-73', '28U593Z4L292', 'jpg', 131625, '201611/82c794def4.jpg', 0, '{"width":500,"height":682}', 1478490209);
INSERT INTO `{dbprefix}attachment_1` VALUES(112, 1, 'admin', 'dr_1_photo-74', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/66f68a27d6.jpg', 0, '{"width":954,"height":1024}', 1478490224);
INSERT INTO `{dbprefix}attachment_1` VALUES(113, 1, 'admin', 'dr_1_photo-74', '28U593Z4L292', 'jpg', 131625, '201611/1d5c035afe.jpg', 0, '{"width":500,"height":682}', 1478490232);
INSERT INTO `{dbprefix}attachment_1` VALUES(114, 1, 'admin', 'dr_1_photo-74', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/819d2d341f.jpg', 0, '{"width":954,"height":1024}', 1478490232);
INSERT INTO `{dbprefix}attachment_1` VALUES(119, 1, 'admin', 'dr_1_photo-75', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/d20e22a90d.jpg', 0, '{"width":954,"height":1024}', 1478490311);
INSERT INTO `{dbprefix}attachment_1` VALUES(118, 1, 'admin', 'dr_1_photo-75', '59c932d3d539b600f5160d2fef50352ac75cb751', 'jpg', 8980, '201611/0d20e22a90.jpg', 0, '{"width":300,"height":300}', 1478490311);
INSERT INTO `{dbprefix}attachment_1` VALUES(117, 1, 'admin', 'dr_1_photo-75', '28U593Z4L292', 'jpg', 131625, '201611/c62bc4cca5.jpg', 0, '{"width":500,"height":682}', 1478490310);
INSERT INTO `{dbprefix}attachment_1` VALUES(116, 1, 'admin', 'dr_1_photo-75', '576689_012358067_2', 'jpg', 125716, '201611/351d92e537.jpg', 0, '{"width":769,"height":1024}', 1478490301);
INSERT INTO `{dbprefix}attachment_1` VALUES(123, 1, 'admin', 'dr_1_photo-76', '576689_191655002_2', 'jpg', 128174, '201611/45956956bc.jpg', 0, '{"width":1024,"height":1024}', 1478490341);
INSERT INTO `{dbprefix}attachment_1` VALUES(122, 1, 'admin', 'dr_1_photo-76', '576689_012358067_2', 'jpg', 125716, '201611/bc109ae493.jpg', 0, '{"width":769,"height":1024}', 1478490340);
INSERT INTO `{dbprefix}attachment_1` VALUES(120, 1, 'admin', 'dr_1_photo-76', '576689_191655002_2', 'jpg', 128174, '201611/771f0a3258.jpg', 0, '{"width":1024,"height":1024}', 1478490329);
INSERT INTO `{dbprefix}attachment_1` VALUES(121, 1, 'admin', 'dr_1_photo-76', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/39d3d31046.jpg', 0, '{"width":954,"height":1024}', 1478490340);
INSERT INTO `{dbprefix}attachment_1` VALUES(127, 1, 'admin', 'dr_1_photo-77', '1960886_163150036171_2', 'jpg', 176568, '201611/26ed1b6dc1.jpg', 0, '{"width":762,"height":1024}', 1478490369);
INSERT INTO `{dbprefix}attachment_1` VALUES(124, 1, 'admin', 'dr_1_photo-77', '1960886_162120011328_2', 'jpg', 210975, '201611/b21df26504.jpg', 0, '{"width":822,"height":1024}', 1478490358);
INSERT INTO `{dbprefix}attachment_1` VALUES(126, 1, 'admin', 'dr_1_photo-77', '1960886_162120011328_2', 'jpg', 210975, '201611/1b6dc1082c.jpg', 0, '{"width":822,"height":1024}', 1478490369);
INSERT INTO `{dbprefix}attachment_1` VALUES(125, 1, 'admin', 'dr_1_photo-77', '576689_191655002_2', 'jpg', 128174, '201611/c1082cdce8.jpg', 0, '{"width":1024,"height":1024}', 1478490369);
INSERT INTO `{dbprefix}attachment_1` VALUES(131, 1, 'admin', 'dr_1_photo-78', '4049717_153408072905_2', 'jpg', 119398, '201611/901e3c7323.jpg', 0, '{"width":667,"height":1024}', 1478490401);
INSERT INTO `{dbprefix}attachment_1` VALUES(130, 1, 'admin', 'dr_1_photo-78', '1960886_163150036171_2', 'jpg', 176568, '201611/99c44b20b7.jpg', 0, '{"width":762,"height":1024}', 1478490401);
INSERT INTO `{dbprefix}attachment_1` VALUES(128, 1, 'admin', 'dr_1_photo-78', 'c12835d92dabd5725a828521cd15e712', 'jpg', 422195, '201611/c4c816eeaf.jpg', 0, '{"width":1100,"height":1650}', 1478490386);
INSERT INTO `{dbprefix}attachment_1` VALUES(129, 1, 'admin', 'dr_1_photo-78', '1960886_162120011328_2', 'jpg', 210975, '201611/099c44b20b.jpg', 0, '{"width":822,"height":1024}', 1478490401);
INSERT INTO `{dbprefix}attachment_1` VALUES(132, 1, 'admin', 'dr_1_photo-78', 'c12835d92dabd5725a828521cd15e712', 'jpg', 422195, '201611/901e3c73231.jpg', 0, '{"width":1100,"height":1650}', 1478490402);
INSERT INTO `{dbprefix}attachment_1` VALUES(133, 1, 'admin', 'dr_1_photo-79', '4049717_153408072905_2', 'jpg', 119398, '201611/25715f1f5e.jpg', 0, '{"width":667,"height":1024}', 1478490481);
INSERT INTO `{dbprefix}attachment_1` VALUES(134, 1, 'admin', 'dr_1_photo-79', '28U593Z4L292', 'jpg', 131625, '201611/1ed4da19f1.jpg', 0, '{"width":500,"height":682}', 1478490487);
INSERT INTO `{dbprefix}attachment_1` VALUES(135, 1, 'admin', 'dr_1_photo-80', '1-150QH0260E08', 'jpg', 51661, '201611/58a0cb080e.jpg', 0, '{"width":641,"height":378}', 1478490653);
INSERT INTO `{dbprefix}attachment_1` VALUES(138, 1, 'admin', 'dr_1_photo-80', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/356a680928.jpg', 0, '{"width":548,"height":410}', 1478490663);
INSERT INTO `{dbprefix}attachment_1` VALUES(137, 1, 'admin', 'dr_1_photo-80', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/fd2da32983.jpg', 0, '{"width":450,"height":343}', 1478490663);
INSERT INTO `{dbprefix}attachment_1` VALUES(136, 1, 'admin', 'dr_1_photo-80', '1-150QH0260E08', 'jpg', 51661, '201611/3a685acaab.jpg', 0, '{"width":641,"height":378}', 1478490663);
INSERT INTO `{dbprefix}attachment_1` VALUES(140, 1, 'admin', 'dr_1_photo-81', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/4df0e81b3c.jpg', 0, '{"width":450,"height":343}', 1478490721);
INSERT INTO `{dbprefix}attachment_1` VALUES(141, 1, 'admin', 'dr_1_photo-81', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/3fbce4bb05.jpg', 0, '{"width":450,"height":343}', 1478490731);
INSERT INTO `{dbprefix}attachment_1` VALUES(142, 1, 'admin', 'dr_1_photo-81', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/c861319274.jpg', 0, '{"width":548,"height":410}', 1478490731);
INSERT INTO `{dbprefix}attachment_1` VALUES(143, 1, 'admin', 'dr_1_photo-82', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/d44d674858.jpg', 0, '{"width":548,"height":410}', 1478490746);
INSERT INTO `{dbprefix}attachment_1` VALUES(146, 1, 'admin', 'dr_1_photo-82', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/953949e49e.jpg', 0, '{"width":548,"height":410}', 1478490755);
INSERT INTO `{dbprefix}attachment_1` VALUES(144, 1, 'admin', 'dr_1_photo-82', '1-150QH0260E08', 'jpg', 51661, '201611/49e593ce6d.jpg', 0, '{"width":641,"height":378}', 1478490755);
INSERT INTO `{dbprefix}attachment_1` VALUES(145, 1, 'admin', 'dr_1_photo-82', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/3d1583e953.jpg', 0, '{"width":450,"height":343}', 1478490755);
INSERT INTO `{dbprefix}attachment_1` VALUES(150, 1, 'admin', 'dr_1_photo-83', '02a98e89a082494e965d71f25ddf8224 - 副本', 'jpg', 51937, '201611/bc7d12a6d5.jpg', 0, '{"width":450,"height":343}', 1478490787);
INSERT INTO `{dbprefix}attachment_1` VALUES(147, 1, 'admin', 'dr_1_photo-83', '659-1512011A952', 'jpg', 188099, '201611/068a3a725f.jpg', 0, '{"width":500,"height":386}', 1478490771);
INSERT INTO `{dbprefix}attachment_1` VALUES(149, 1, 'admin', 'dr_1_photo-83', '659-1512011A952 - 副本', 'jpg', 188099, '201611/6d5307a169.jpg', 0, '{"width":500,"height":386}', 1478490787);
INSERT INTO `{dbprefix}attachment_1` VALUES(148, 1, 'admin', 'dr_1_photo-83', '1-150QH0260E08 - 副本', 'jpg', 51661, '201611/151904e138.jpg', 0, '{"width":641,"height":378}', 1478490786);
INSERT INTO `{dbprefix}attachment_1` VALUES(153, 1, 'admin', 'dr_1_photo-84', '659-1512011A952 - 副本', 'jpg', 188099, '201611/be74f23226.jpg', 0, '{"width":500,"height":386}', 1478490815);
INSERT INTO `{dbprefix}attachment_1` VALUES(154, 1, 'admin', 'dr_1_photo-84', '201212281546', 'jpg', 50196, '201611/34c696f6be.jpg', 0, '{"width":389,"height":489}', 1478490815);
INSERT INTO `{dbprefix}attachment_1` VALUES(151, 1, 'admin', 'dr_1_photo-84', '201212281546', 'jpg', 50196, '201611/4003070568.jpg', 0, '{"width":389,"height":489}', 1478490803);
INSERT INTO `{dbprefix}attachment_1` VALUES(152, 1, 'admin', 'dr_1_photo-84', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/e74f232262.jpg', 0, '{"width":548,"height":410}', 1478490815);
INSERT INTO `{dbprefix}attachment_1` VALUES(155, 1, 'admin', 'dr_1_photo-85', '20120702022248177', 'jpg', 26092, '201611/3f0e94a7e6.jpg', 0, '{"width":454,"height":550}', 1478490829);
INSERT INTO `{dbprefix}attachment_1` VALUES(156, 1, 'admin', 'dr_1_photo-85', '17200771510301532192', 'jpg', 35912, '201611/33a6cc201b.jpg', 0, '{"width":500,"height":421}', 1478490836);
INSERT INTO `{dbprefix}attachment_1` VALUES(157, 1, 'admin', 'dr_1_photo-86', 'o0peTHD9', 'jpg', 26880, '201611/14d5d631b5.jpg', 0, '{"width":533,"height":399}', 1478490850);
INSERT INTO `{dbprefix}attachment_1` VALUES(158, 1, 'admin', 'dr_1_photo-86', '201212281546', 'jpg', 50196, '201611/7f62c08634.jpg', 0, '{"width":389,"height":489}', 1478490857);
INSERT INTO `{dbprefix}attachment_1` VALUES(159, 1, 'admin', 'dr_1_photo-86', '20120702022248177', 'jpg', 26092, '201611/aac2a8a7bb.jpg', 0, '{"width":454,"height":550}', 1478490857);
INSERT INTO `{dbprefix}attachment_1` VALUES(162, 1, 'admin', 'dr_1_photo-87', '20120702022248177', 'jpg', 26092, '201611/e7c3cdc827.jpg', 0, '{"width":454,"height":550}', 1478490881);
INSERT INTO `{dbprefix}attachment_1` VALUES(163, 1, 'admin', 'dr_1_photo-87', 'p34814031', 'jpg', 93870, '201611/5f522b93fa.jpg', 0, '{"width":440,"height":536}', 1478490881);
INSERT INTO `{dbprefix}attachment_1` VALUES(160, 1, 'admin', 'dr_1_photo-87', 'p34814031', 'jpg', 93870, '201611/10d442478b.jpg', 0, '{"width":440,"height":536}', 1478490871);
INSERT INTO `{dbprefix}attachment_1` VALUES(161, 1, 'admin', 'dr_1_photo-87', '659-1512011A952', 'jpg', 188099, '201611/f522b93fa5.jpg', 0, '{"width":500,"height":386}', 1478490881);
INSERT INTO `{dbprefix}attachment_1` VALUES(164, 1, 'admin', 'dr_1_photo-88', '965359bd6e504f0d5218d9b2ec804d00', 'jpg', 36465, '201611/c7200bb49a.jpg', 0, '{"width":600,"height":597}', 1478491066);
INSERT INTO `{dbprefix}attachment_1` VALUES(167, 1, 'admin', 'dr_1_photo-88', '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/878ee1f330.jpg', 0, '{"width":550,"height":542}', 1478491095);
INSERT INTO `{dbprefix}attachment_1` VALUES(166, 1, 'admin', 'dr_1_photo-88', '6821646_420524', 'jpg', 102144, '201611/6b7ea2878e.jpg', 0, '{"width":345,"height":260}', 1478491095);
INSERT INTO `{dbprefix}attachment_1` VALUES(165, 1, 'admin', 'dr_1_photo-88', '965359bd6e504f0d5218d9b2ec804d00', 'jpg', 36465, '201611/79d1bdb1c4.jpg', 0, '{"width":600,"height":597}', 1478491095);
INSERT INTO `{dbprefix}attachment_1` VALUES(168, 1, 'admin', 'dr_1_photo-89', '6821646_420524', 'jpg', 102144, '201611/6c6fa142fb.jpg', 0, '{"width":345,"height":260}', 1478491114);
INSERT INTO `{dbprefix}attachment_1` VALUES(169, 1, 'admin', 'dr_1_photo-89', '965359bd6e504f0d5218d9b2ec804d00', 'jpg', 36465, '201611/c2caf62c3c.jpg', 0, '{"width":600,"height":597}', 1478491121);
INSERT INTO `{dbprefix}attachment_1` VALUES(170, 1, 'admin', 'dr_1_photo-89', '6821646_420524', 'jpg', 102144, '201611/c2caf62c3c1.jpg', 0, '{"width":345,"height":260}', 1478491122);
INSERT INTO `{dbprefix}attachment_1` VALUES(172, 1, 'admin', 'dr_1_photo-90', '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/3c54e439cd.jpg', 0, '{"width":550,"height":542}', 1478491170);
INSERT INTO `{dbprefix}attachment_1` VALUES(173, 1, 'admin', 'dr_1_photo-90', '6821646_420524', 'jpg', 102144, '201611/ac4da9facb.jpg', 0, '{"width":345,"height":260}', 1478491177);
INSERT INTO `{dbprefix}attachment_1` VALUES(174, 1, 'admin', 'dr_1_photo-90', '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/6a39a305bb.jpg', 0, '{"width":550,"height":542}', 1478491177);
INSERT INTO `{dbprefix}attachment_1` VALUES(175, 1, 'admin', 'dr_1_photo-91', '163145166', 'jpg', 136847, '201611/13ab4bef93.jpg', 0, '{"width":550,"height":680}', 1478491192);
INSERT INTO `{dbprefix}attachment_1` VALUES(176, 1, 'admin', 'dr_1_photo-91', '163145166', 'jpg', 136847, '201611/81930e6c27.jpg', 0, '{"width":550,"height":680}', 1478491203);
INSERT INTO `{dbprefix}attachment_1` VALUES(177, 1, 'admin', 'dr_1_photo-92', '1112094956_14080837523431n', 'jpg', 22764, '201611/70a6448bb8.jpg', 0, '{"width":500,"height":444}', 1478491218);
INSERT INTO `{dbprefix}attachment_1` VALUES(178, 1, 'admin', 'dr_1_photo-92', '163145166', 'jpg', 136847, '201611/6df422b3f3.jpg', 0, '{"width":550,"height":680}', 1478491226);
INSERT INTO `{dbprefix}attachment_1` VALUES(179, 1, 'admin', 'dr_1_photo-92', '1112094956_14080837523431n', 'jpg', 22764, '201611/f422b3f3cf.jpg', 0, '{"width":500,"height":444}', 1478491226);
INSERT INTO `{dbprefix}attachment_1` VALUES(180, 1, 'admin', 'dr_1_photo-93', '1439783039664_000', 'jpg', 70482, '201611/e013f77292.jpg', 0, '{"width":623,"height":354}', 1478491244);
INSERT INTO `{dbprefix}attachment_1` VALUES(181, 1, 'admin', 'dr_1_photo-93', '004aeuItty6Qptp5f6kcc', 'jpg', 86600, '201611/353eb504a5.jpg', 0, '{"width":640,"height":427}', 1478491262);
INSERT INTO `{dbprefix}attachment_1` VALUES(182, 1, 'admin', 'dr_1_photo-94', '004aeuItty6Qptp5f6kcc', 'jpg', 86600, '201611/b40309c570.jpg', 0, '{"width":640,"height":427}', 1478491275);
INSERT INTO `{dbprefix}attachment_1` VALUES(183, 1, 'admin', 'dr_1_photo-94', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/c20521a021.jpg', 0, '{"width":548,"height":410}', 1478491284);
INSERT INTO `{dbprefix}attachment_1` VALUES(184, 1, 'admin', 'dr_1_photo-95', '201212281546', 'jpg', 50196, '201611/e99031a467.jpg', 0, '{"width":389,"height":489}', 1478491304);
INSERT INTO `{dbprefix}attachment_1` VALUES(185, 1, 'admin', 'dr_1_photo-95', '1439783039664_000', 'jpg', 70482, '201611/4deb35bd11.jpg', 0, '{"width":623,"height":354}', 1478491310);
INSERT INTO `{dbprefix}attachment_1` VALUES(186, 1, 'admin', 'dr_1_photo-96', '9-160F6111A40-L', 'jpg', 66806, '201611/b4d72733ee.jpg', 0, '{"width":640,"height":614}', 1478491469);
INSERT INTO `{dbprefix}attachment_1` VALUES(187, 1, 'admin', 'dr_1_photo-96', '9-160F6111A40-L', 'jpg', 66806, '201611/40103f4865.jpg', 0, '{"width":640,"height":614}', 1478491477);
INSERT INTO `{dbprefix}attachment_1` VALUES(188, 1, 'admin', 'dr_1_photo-96', '659-1512011A952 - 副本', 'jpg', 188099, '201611/40103f48651.jpg', 0, '{"width":500,"height":386}', 1478491478);
INSERT INTO `{dbprefix}attachment_1` VALUES(189, 1, 'admin', 'dr_1_photo-97', '20110825_8a045c986f5a386ce066sJs1TdOC6QMu', 'jpg', 110019, '201611/52eae6638c.jpg', 0, '{"width":729,"height":515}', 1478491510);
INSERT INTO `{dbprefix}attachment_1` VALUES(190, 1, 'admin', 'dr_1_photo-97', '37499766_1408175522863', 'jpg', 512563, '201611/e1381ff96e.jpg', 0, '{"width":1504,"height":1150}', 1478491516);
INSERT INTO `{dbprefix}attachment_1` VALUES(191, 1, 'admin', 'dr_1_photo-99', '37499813_1408175629456', 'jpg', 645366, '201611/d2ae165f0a.jpg', 0, '{"width":1400,"height":1309}', 1478491548);
INSERT INTO `{dbprefix}attachment_1` VALUES(194, 1, 'admin', 'dr_1_photo-99', '37499813_1408175629456', 'jpg', 645366, '201611/2592561cfc.jpg', 0, '{"width":1400,"height":1309}', 1478491602);
INSERT INTO `{dbprefix}attachment_1` VALUES(195, 1, 'admin', 'dr_1_photo-100', '37499813_1408175642286', 'jpg', 360387, '201611/ebc55efb4f.jpg', 0, '{"width":1179,"height":839}', 1478491634);
INSERT INTO `{dbprefix}attachment_1` VALUES(196, 1, 'admin', 'dr_1_photo-100', '37499813_1408175642286', 'jpg', 360387, '201611/58ff7cc427.jpg', 0, '{"width":1179,"height":839}', 1478491640);
INSERT INTO `{dbprefix}attachment_1` VALUES(197, 1, 'admin', 'dr_1_photo-101', '37499938_1408175869631', 'jpg', 619459, '201611/7dcfcb61d2.jpg', 0, '{"width":1500,"height":1500}', 1478492363);
INSERT INTO `{dbprefix}attachment_1` VALUES(198, 1, 'admin', 'dr_1_photo-101', '37499938_1408175869631', 'jpg', 619459, '201611/09442c42ee.jpg', 0, '{"width":1500,"height":1500}', 1478492375);
INSERT INTO `{dbprefix}attachment_1` VALUES(199, 1, 'admin', 'dr_1_photo-102', 'u=673784810,1595223623&fm=21&gp=0', 'jpg', 15626, '201611/5a56e8eaa0.jpg', 0, '{"width":330,"height":220}', 1478492394);
INSERT INTO `{dbprefix}attachment_1` VALUES(200, 1, 'admin', 'dr_1_photo-102', '37499813_1408175642286', 'jpg', 360387, '201611/6752e3de12.jpg', 0, '{"width":1179,"height":839}', 1478492399);
INSERT INTO `{dbprefix}attachment_1` VALUES(201, 1, 'admin', 'dr_1_photo-103', '37499938_1408175869631', 'jpg', 619459, '201611/d970d32ccb.jpg', 0, '{"width":1500,"height":1500}', 1478492414);
INSERT INTO `{dbprefix}attachment_1` VALUES(202, 1, 'admin', 'dr_1_photo-103', '37499813_1408175642286', 'jpg', 360387, '201611/3f7f768742.jpg', 0, '{"width":1179,"height":839}', 1478492419);
INSERT INTO `{dbprefix}attachment_1` VALUES(203, 1, 'admin', 'dr_1_photo-104', '235113-1403260QZ056', 'jpg', 121989, '201611/4889281b6e.jpg', 0, '{"width":1000,"height":625}', 1478492604);
INSERT INTO `{dbprefix}attachment_1` VALUES(204, 1, 'admin', 'dr_1_photo-104', '235113-1403260QZ056', 'jpg', 121989, '201611/0bd329b89d.jpg', 0, '{"width":1000,"height":625}', 1478492609);
INSERT INTO `{dbprefix}attachment_1` VALUES(206, 1, 'admin', 'dr_1_photo-105', '330457-14031320362254', 'jpg', 197356, '201611/e09a149eaa.jpg', 0, '{"width":1000,"height":750}', 1478492653);
INSERT INTO `{dbprefix}attachment_1` VALUES(207, 1, 'admin', 'dr_1_photo-105', '330457-14031320362254', 'jpg', 197356, '201611/8d91473af7.jpg', 0, '{"width":1000,"height":750}', 1478492658);
INSERT INTO `{dbprefix}attachment_1` VALUES(208, 1, 'admin', 'dr_1_photo-105', '330487-14091606235982', 'jpg', 129024, '201611/70898d047c.jpg', 0, '{"width":1000,"height":667}', 1478492668);
INSERT INTO `{dbprefix}attachment_1` VALUES(209, 1, 'admin', 'dr_1_photo-105', '11914137_165343253157_2', 'jpg', 403988, '201611/24690e84d0.jpg', 0, '{"width":1024,"height":768}', 1478492668);
INSERT INTO `{dbprefix}attachment_1` VALUES(210, 1, 'admin', 'dr_1_photo-105', '32491235_1024', 'jpg', 341135, '201611/6c682c4c3f.jpg', 0, '{"width":1024,"height":700}', 1478492669);
INSERT INTO `{dbprefix}attachment_1` VALUES(214, 1, 'admin', 'dr_1_photo-106', '330457-14031320362254', 'jpg', 197356, '201611/0f253f2847.jpg', 0, '{"width":1000,"height":750}', 1478492693);
INSERT INTO `{dbprefix}attachment_1` VALUES(213, 1, 'admin', 'dr_1_photo-106', '235113-1403260QZ056', 'jpg', 121989, '201611/ef43e22a56.jpg', 0, '{"width":1000,"height":625}', 1478492693);
INSERT INTO `{dbprefix}attachment_1` VALUES(212, 1, 'admin', 'dr_1_photo-106', '15', 'jpg', 86313, '201611/5654595aa2.jpg', 0, '{"width":640,"height":426}', 1478492693);
INSERT INTO `{dbprefix}attachment_1` VALUES(211, 1, 'admin', 'dr_1_photo-106', '15', 'jpg', 86313, '201611/5c100d6cf1.jpg', 0, '{"width":640,"height":426}', 1478492685);
INSERT INTO `{dbprefix}attachment_1` VALUES(220, 1, 'admin', 'dr_1_photo-107', '330487-14091606235982', 'jpg', 129024, '201611/0a58a67083.jpg', 0, '{"width":1000,"height":667}', 1478492717);
INSERT INTO `{dbprefix}attachment_1` VALUES(219, 1, 'admin', 'dr_1_photo-107', '330457-14031320362254', 'jpg', 197356, '201611/7ee78a68fe.jpg', 0, '{"width":1000,"height":750}', 1478492716);
INSERT INTO `{dbprefix}attachment_1` VALUES(218, 1, 'admin', 'dr_1_photo-107', '235113-1403260QZ056', 'jpg', 121989, '201611/b5ba8662711.jpg', 0, '{"width":1000,"height":625}', 1478492716);
INSERT INTO `{dbprefix}attachment_1` VALUES(217, 1, 'admin', 'dr_1_photo-107', '39', 'jpg', 1569188, '201611/b5ba866271.jpg', 0, '{"width":1920,"height":1080}', 1478492715);
INSERT INTO `{dbprefix}attachment_1` VALUES(216, 1, 'admin', 'dr_1_photo-107', '15', 'jpg', 86313, '201611/2578421b83.jpg', 0, '{"width":640,"height":426}', 1478492715);
INSERT INTO `{dbprefix}attachment_1` VALUES(215, 1, 'admin', 'dr_1_photo-107', '39', 'jpg', 1569188, '201611/05d7944399.jpg', 0, '{"width":1920,"height":1080}', 1478492706);
INSERT INTO `{dbprefix}attachment_1` VALUES(224, 1, 'admin', 'dr_1_photo-108', '235113-1403260QZ056', 'jpg', 121989, '201611/9fba022472.jpg', 0, '{"width":1000,"height":625}', 1478492740);
INSERT INTO `{dbprefix}attachment_1` VALUES(223, 1, 'admin', 'dr_1_photo-108', '39', 'jpg', 1569188, '201611/33773264c1.jpg', 0, '{"width":1920,"height":1080}', 1478492739);
INSERT INTO `{dbprefix}attachment_1` VALUES(221, 1, 'admin', 'dr_1_photo-108', '97b58PICEn4_1024', 'jpg', 163594, '201611/e878d2ea10.jpg', 0, '{"width":1024,"height":631}', 1478492732);
INSERT INTO `{dbprefix}attachment_1` VALUES(222, 1, 'admin', 'dr_1_photo-108', '15', 'jpg', 86313, '201611/d322ff4281.jpg', 0, '{"width":640,"height":426}', 1478492739);
INSERT INTO `{dbprefix}attachment_1` VALUES(229, 1, 'admin', 'dr_1_photo-109', '715B9962452A', 'jpg', 275005, '201611/23d4516d20.jpg', 0, '{"width":900,"height":729}', 1478492765);
INSERT INTO `{dbprefix}attachment_1` VALUES(228, 1, 'admin', 'dr_1_photo-109', '97b58PICEn4_1024', 'jpg', 163594, '201611/889da30532.jpg', 0, '{"width":1024,"height":631}', 1478492765);
INSERT INTO `{dbprefix}attachment_1` VALUES(225, 1, 'admin', 'dr_1_photo-109', '715B9962452A', 'jpg', 275005, '201611/43a57c168e.jpg', 0, '{"width":900,"height":729}', 1478492754);
INSERT INTO `{dbprefix}attachment_1` VALUES(227, 1, 'admin', 'dr_1_photo-109', '39', 'jpg', 1569188, '201611/59b8889da3.jpg', 0, '{"width":1920,"height":1080}', 1478492764);
INSERT INTO `{dbprefix}attachment_1` VALUES(226, 1, 'admin', 'dr_1_photo-109', '15', 'jpg', 86313, '201611/f433fdbdc0.jpg', 0, '{"width":640,"height":426}', 1478492764);
INSERT INTO `{dbprefix}attachment_1` VALUES(235, 1, 'admin', 'dr_1_photo-110', '32491235_1024', 'jpg', 341135, '201611/37650afb79.jpg', 0, '{"width":1024,"height":700}', 1478492862);
INSERT INTO `{dbprefix}attachment_1` VALUES(234, 1, 'admin', 'dr_1_photo-110', '11914137_165343253157_2', 'jpg', 403988, '201611/032a01cae8.jpg', 0, '{"width":1024,"height":768}', 1478492861);
INSERT INTO `{dbprefix}attachment_1` VALUES(233, 1, 'admin', 'dr_1_photo-110', '330487-14091606235982', 'jpg', 129024, '201611/a5032a01ca.jpg', 0, '{"width":1000,"height":667}', 1478492861);
INSERT INTO `{dbprefix}attachment_1` VALUES(232, 1, 'admin', 'dr_1_photo-110', '330457-14031320362254', 'jpg', 197356, '201611/49e8c58357.jpg', 0, '{"width":1000,"height":750}', 1478492860);
INSERT INTO `{dbprefix}attachment_1` VALUES(230, 1, 'admin', 'dr_1_photo-110', '330487-14091606235982', 'jpg', 129024, '201611/1d5b848272.jpg', 0, '{"width":1000,"height":667}', 1478492852);
INSERT INTO `{dbprefix}attachment_1` VALUES(231, 1, 'admin', 'dr_1_photo-110', '235113-1403260QZ056', 'jpg', 121989, '201611/8357a8a94c.jpg', 0, '{"width":1000,"height":625}', 1478492860);
INSERT INTO `{dbprefix}attachment_1` VALUES(241, 1, 'admin', 'dr_1_photo-111', '32491235_1024', 'jpg', 341135, '201611/a5c39b96fe.jpg', 0, '{"width":1024,"height":700}', 1478492898);
INSERT INTO `{dbprefix}attachment_1` VALUES(240, 1, 'admin', 'dr_1_photo-111', '11914137_165343253157_2', 'jpg', 403988, '201611/b9b84b2ef0.jpg', 0, '{"width":1024,"height":768}', 1478492898);
INSERT INTO `{dbprefix}attachment_1` VALUES(236, 1, 'admin', 'dr_1_photo-111', '32491235_1024', 'jpg', 341135, '201611/8cacae4ea1.jpg', 0, '{"width":1024,"height":700}', 1478492887);
INSERT INTO `{dbprefix}attachment_1` VALUES(237, 1, 'admin', 'dr_1_photo-111', '235113-1403260QZ056', 'jpg', 121989, '201611/f3684e47fd.jpg', 0, '{"width":1000,"height":625}', 1478492897);
INSERT INTO `{dbprefix}attachment_1` VALUES(238, 1, 'admin', 'dr_1_photo-111', '330457-14031320362254', 'jpg', 197356, '201611/28a46b4daf.jpg', 0, '{"width":1000,"height":750}', 1478492897);
INSERT INTO `{dbprefix}attachment_1` VALUES(239, 1, 'admin', 'dr_1_photo-111', '330487-14091606235982', 'jpg', 129024, '201611/f020f6aa12.jpg', 0, '{"width":1000,"height":667}', 1478492897);
INSERT INTO `{dbprefix}attachment_1` VALUES(250, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-2@2x', 'png', 383345, '201612/3c702e9f16.png', 0, '{"width":2316,"height":1258}', 1480921899);
INSERT INTO `{dbprefix}attachment_1` VALUES(251, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-2@2x', 'png', 383345, '201612/23d6d9e87c.png', 0, '{"width":2316,"height":1258}', 1480921940);
INSERT INTO `{dbprefix}attachment_1` VALUES(252, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-1@2x', 'png', 571300, '201612/e623d6d9e8.png', 0, '{"width":2442,"height":1282}', 1480921940);
INSERT INTO `{dbprefix}attachment_1` VALUES(253, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-0@2x', 'png', 365783, '201612/e623d6d9e81.png', 0, '{"width":2238,"height":1240}', 1480921940);
INSERT INTO `{dbprefix}attachment_1` VALUES(254, 1, 'admin', 'dr_1_demo-1', 'QQ20161130-3@2x', 'png', 536361, '201612/2e38e9a4b2.png', 0, '{"width":2318,"height":1432}', 1480921941);
INSERT INTO `{dbprefix}attachment_1` VALUES(255, 1, 'admin', 'dr_1_demo-1', 'QQ20161130-2@2x', 'png', 529715, '201612/9a4b24f26d.png', 0, '{"width":2294,"height":1428}', 1480921941);
INSERT INTO `{dbprefix}attachment_1` VALUES(256, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-2@2x', 'png', 383345, '201612/21d73ece67.png', 0, '{"width":2316,"height":1258}', 1480921949);
INSERT INTO `{dbprefix}attachment_1` VALUES(257, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-1@2x', 'png', 571300, '201612/030489205d.png', 0, '{"width":2442,"height":1282}', 1480921953);
INSERT INTO `{dbprefix}attachment_1` VALUES(258, 1, 'admin', 'dr_1_demo-1', 'QQ20161130-2@2x', 'png', 529715, '201612/d434993133.png', 0, '{"width":2294,"height":1428}', 1480921985);

-- ----------------------------------------------------------
-- 转存表中的数据 `{dbprefix}attachment`
--
INSERT INTO `{dbprefix}attachment` VALUES(1, 1, 'admin', 1, '', 1, 0, 1153649, 'png', 'c5d755d1565f62e1dd181ce7aebb81e5');
INSERT INTO `{dbprefix}attachment` VALUES(2, 1, 'admin', 1, '', 1, 0, 451430, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `{dbprefix}attachment` VALUES(3, 1, 'admin', 1, '', 1, 0, 915333, 'png', '597fc5f436d85839b0f43197a98db212');
INSERT INTO `{dbprefix}attachment` VALUES(4, 1, 'admin', 1, '', 1, 0, 1153649, 'png', 'c5d755d1565f62e1dd181ce7aebb81e5');
INSERT INTO `{dbprefix}attachment` VALUES(5, 1, 'admin', 1, '', 1, 0, 451430, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `{dbprefix}attachment` VALUES(6, 1, 'admin', 1, '', 1, 0, 915333, 'png', '597fc5f436d85839b0f43197a98db212');
INSERT INTO `{dbprefix}attachment` VALUES(7, 1, 'admin', 1, 'dr_1_block-1', 1, 0, 1153649, 'png', 'c5d755d1565f62e1dd181ce7aebb81e5');
INSERT INTO `{dbprefix}attachment` VALUES(8, 1, 'admin', 1, 'dr_1_block-1', 1, 0, 451430, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `{dbprefix}attachment` VALUES(9, 1, 'admin', 1, 'dr_1_block-1', 1, 0, 915333, 'png', '597fc5f436d85839b0f43197a98db212');
INSERT INTO `{dbprefix}attachment` VALUES(10, 1, 'admin', 1, 'dr_1_news-1', 1, 0, 36680, 'jpg', 'b8cc14df47e80917b0e2d8881c644afd');
INSERT INTO `{dbprefix}attachment` VALUES(11, 1, 'admin', 1, '', 1, 0, 36678, 'jpg', 'b8cc14df47e80917b0e2d8881c644afd');
INSERT INTO `{dbprefix}attachment` VALUES(12, 1, 'admin', 1, '', 1, 0, 20045, 'png', '8e88d2266b8e7ba9691e78624d1e7bfe');
INSERT INTO `{dbprefix}attachment` VALUES(13, 1, 'admin', 1, '', 1, 0, 20045, 'png', '8e88d2266b8e7ba9691e78624d1e7bfe');
INSERT INTO `{dbprefix}attachment` VALUES(14, 1, 'admin', 1, '', 1, 0, 11818, 'png', '60e1a05c226332cc64107694f3d309e6');
INSERT INTO `{dbprefix}attachment` VALUES(15, 1, 'admin', 1, '', 1, 0, 21364, 'png', 'db76ef886b26581b0b7f77e707c893e7');
INSERT INTO `{dbprefix}attachment` VALUES(16, 1, 'admin', 1, '', 1, 0, 21364, 'png', 'db76ef886b26581b0b7f77e707c893e7');
INSERT INTO `{dbprefix}attachment` VALUES(17, 1, 'admin', 1, '', 1, 0, 451426, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `{dbprefix}attachment` VALUES(18, 1, 'admin', 1, 'dr_1_down-43', 1, 0, 23470, 'jpg', 'd30cd3768ef2b2cde02eb6b9e1390cd7');
INSERT INTO `{dbprefix}attachment` VALUES(19, 1, 'admin', 1, 'dr_1_down-42', 1, 0, 23470, 'jpg', 'd30cd3768ef2b2cde02eb6b9e1390cd7');
INSERT INTO `{dbprefix}attachment` VALUES(20, 1, 'admin', 1, 'dr_1_down-41', 1, 0, 100413, 'png', '6716ff6f5128fe0abd0c5b0ba6abca22');
INSERT INTO `{dbprefix}attachment` VALUES(21, 1, 'admin', 1, 'dr_1_down-40', 1, 0, 8980, 'jpg', '9bea1e2489849e298b460901c8fe304e');
INSERT INTO `{dbprefix}attachment` VALUES(22, 1, 'admin', 1, 'dr_1_down-39', 1, 0, 7608, 'jpg', 'd1df768a9fe31f4709ab3e5e8842de4f');
INSERT INTO `{dbprefix}attachment` VALUES(23, 1, 'admin', 1, 'dr_1_down-38', 1, 0, 72673, 'png', 'a233071d9431e2b5cb9a7c18510896d2');
INSERT INTO `{dbprefix}attachment` VALUES(24, 1, 'admin', 1, 'dr_1_down-37', 1, 0, 7485, 'jpg', '8ee9662cb419d28a7677e2f253e15ef6');
INSERT INTO `{dbprefix}attachment` VALUES(25, 1, 'admin', 1, 'dr_1_down-36', 1, 0, 72673, 'png', 'a233071d9431e2b5cb9a7c18510896d2');
INSERT INTO `{dbprefix}attachment` VALUES(26, 1, 'admin', 1, 'dr_1_fang-44', 1, 0, 126659, 'jpg', '18475974d020d39e3ec7b649f2679aed');
INSERT INTO `{dbprefix}attachment` VALUES(27, 1, 'admin', 1, 'dr_1_fang-44', 1, 0, 126659, 'jpg', '18475974d020d39e3ec7b649f2679aed');
INSERT INTO `{dbprefix}attachment` VALUES(28, 1, 'admin', 1, 'dr_1_fang-45', 1, 0, 798351, 'jpg', 'bce66614e2033c9c684f39ed9f352dc8');
INSERT INTO `{dbprefix}attachment` VALUES(29, 1, 'admin', 1, 'dr_1_fang-45', 1, 0, 798351, 'jpg', 'bce66614e2033c9c684f39ed9f352dc8');
INSERT INTO `{dbprefix}attachment` VALUES(30, 1, 'admin', 1, 'dr_1_fang-46', 1, 0, 225618, 'jpg', '20a0f26899979ac61af0c57d33d5c01e');
INSERT INTO `{dbprefix}attachment` VALUES(31, 1, 'admin', 1, 'dr_1_fang-47', 1, 0, 401807, 'jpg', '60f25ec6e84308b2cf50ef45ab006390');
INSERT INTO `{dbprefix}attachment` VALUES(32, 1, 'admin', 1, 'dr_1_fang-47', 1, 0, 401807, 'jpg', '60f25ec6e84308b2cf50ef45ab006390');
INSERT INTO `{dbprefix}attachment` VALUES(33, 1, 'admin', 1, 'dr_1_fang-48', 1, 0, 452905, 'jpg', 'effe5143633fe09215697ef023a67475');
INSERT INTO `{dbprefix}attachment` VALUES(34, 1, 'admin', 1, 'dr_1_fang-48', 1, 0, 452905, 'jpg', 'effe5143633fe09215697ef023a67475');
INSERT INTO `{dbprefix}attachment` VALUES(35, 1, 'admin', 1, 'dr_1_fang-49', 1, 0, 279060, 'jpg', 'af294bb48e2d6e9603d86c1ffdfc31b4');
INSERT INTO `{dbprefix}attachment` VALUES(36, 1, 'admin', 1, 'dr_1_fang-49', 1, 0, 279060, 'jpg', 'af294bb48e2d6e9603d86c1ffdfc31b4');
INSERT INTO `{dbprefix}attachment` VALUES(37, 1, 'admin', 1, 'dr_1_fang-50', 1, 0, 260393, 'jpg', '8864e6d476e93ab8291eced5a5273e24');
INSERT INTO `{dbprefix}attachment` VALUES(38, 1, 'admin', 1, 'dr_1_fang-50', 1, 0, 260393, 'jpg', '8864e6d476e93ab8291eced5a5273e24');
INSERT INTO `{dbprefix}attachment` VALUES(39, 1, 'admin', 1, 'dr_1_fang-51', 1, 0, 277228, 'jpg', '494f7c02e027dd3c54b78c001e9a4dd1');
INSERT INTO `{dbprefix}attachment` VALUES(40, 1, 'admin', 1, 'dr_1_fang-51', 1, 0, 277228, 'jpg', '494f7c02e027dd3c54b78c001e9a4dd1');
INSERT INTO `{dbprefix}attachment` VALUES(41, 1, 'admin', 1, 'dr_1_fang-52', 1, 0, 78131, 'jpg', 'f8c1c96a05af9fbbc6b2fac632263527');
INSERT INTO `{dbprefix}attachment` VALUES(42, 1, 'admin', 1, 'dr_1_fang-52', 1, 0, 78131, 'jpg', 'f8c1c96a05af9fbbc6b2fac632263527');
INSERT INTO `{dbprefix}attachment` VALUES(43, 1, 'admin', 1, 'dr_1_fang-53', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `{dbprefix}attachment` VALUES(44, 1, 'admin', 1, 'dr_1_fang-53', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `{dbprefix}attachment` VALUES(45, 1, 'admin', 1, 'dr_1_fang-54', 1, 0, 85729, 'jpg', 'e11456df5faecf5e12928a95f5760250');
INSERT INTO `{dbprefix}attachment` VALUES(46, 1, 'admin', 1, 'dr_1_fang-54', 1, 0, 85729, 'jpg', 'e11456df5faecf5e12928a95f5760250');
INSERT INTO `{dbprefix}attachment` VALUES(47, 1, 'admin', 1, 'dr_1_fang-55', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `{dbprefix}attachment` VALUES(48, 1, 'admin', 1, 'dr_1_fang-55', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `{dbprefix}attachment` VALUES(49, 1, 'admin', 1, 'dr_1_photo-56', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `{dbprefix}attachment` VALUES(50, 1, 'admin', 1, 'dr_1_photo-56', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `{dbprefix}attachment` VALUES(51, 1, 'admin', 1, 'dr_1_photo-56', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `{dbprefix}attachment` VALUES(52, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `{dbprefix}attachment` VALUES(53, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `{dbprefix}attachment` VALUES(54, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 117371, 'png', '8ea4a4a15b4b720f048eeaeb63249582');
INSERT INTO `{dbprefix}attachment` VALUES(55, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `{dbprefix}attachment` VALUES(56, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 8018, 'jpg', '13db464df6bcdb7ef53b705ebcd3674b');
INSERT INTO `{dbprefix}attachment` VALUES(57, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 63396, 'jpg', '70404a87a11b664295174c1bc55cd4a2');
INSERT INTO `{dbprefix}attachment` VALUES(58, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 8018, 'jpg', '13db464df6bcdb7ef53b705ebcd3674b');
INSERT INTO `{dbprefix}attachment` VALUES(59, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `{dbprefix}attachment` VALUES(60, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 117371, 'png', '8ea4a4a15b4b720f048eeaeb63249582');
INSERT INTO `{dbprefix}attachment` VALUES(61, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 9247, 'jpg', '48fada93e110dfc5c9856ff9e53f8bb6');
INSERT INTO `{dbprefix}attachment` VALUES(62, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 11018, 'jpg', '1d539e14a771749416d51fbdb7b775ad');
INSERT INTO `{dbprefix}attachment` VALUES(63, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 72673, 'png', 'a233071d9431e2b5cb9a7c18510896d2');
INSERT INTO `{dbprefix}attachment` VALUES(64, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 63396, 'jpg', '70404a87a11b664295174c1bc55cd4a2');
INSERT INTO `{dbprefix}attachment` VALUES(65, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 16660, 'gif', 'ee8b14d86268c2ab19eb520d8a669ddb');
INSERT INTO `{dbprefix}attachment` VALUES(66, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 16660, 'gif', 'ee8b14d86268c2ab19eb520d8a669ddb');
INSERT INTO `{dbprefix}attachment` VALUES(67, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `{dbprefix}attachment` VALUES(68, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `{dbprefix}attachment` VALUES(69, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `{dbprefix}attachment` VALUES(70, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 9247, 'jpg', '48fada93e110dfc5c9856ff9e53f8bb6');
INSERT INTO `{dbprefix}attachment` VALUES(71, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `{dbprefix}attachment` VALUES(72, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 23470, 'jpg', 'd30cd3768ef2b2cde02eb6b9e1390cd7');
INSERT INTO `{dbprefix}attachment` VALUES(73, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `{dbprefix}attachment` VALUES(74, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `{dbprefix}attachment` VALUES(75, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 63396, 'jpg', '70404a87a11b664295174c1bc55cd4a2');
INSERT INTO `{dbprefix}attachment` VALUES(76, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 18596, 'jpg', '9ce127f51672d64ce7e010a8c61daca7');
INSERT INTO `{dbprefix}attachment` VALUES(77, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `{dbprefix}attachment` VALUES(78, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 8980, 'jpg', '9bea1e2489849e298b460901c8fe304e');
INSERT INTO `{dbprefix}attachment` VALUES(79, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 8612, 'jpg', '802cad7073daac033c1cb0ea24685ad0');
INSERT INTO `{dbprefix}attachment` VALUES(80, 1, 'admin', 1, 'dr_1_photo-64', 1, 0, 177132, 'jpg', 'd127418c7b20705487565e333cad320a');
INSERT INTO `{dbprefix}attachment` VALUES(81, 1, 'admin', 1, 'dr_1_photo-64', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `{dbprefix}attachment` VALUES(82, 1, 'admin', 1, 'dr_1_photo-64', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `{dbprefix}attachment` VALUES(83, 1, 'admin', 1, 'dr_1_photo-65', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `{dbprefix}attachment` VALUES(84, 1, 'admin', 1, 'dr_1_photo-65', 1, 0, 177132, 'jpg', 'd127418c7b20705487565e333cad320a');
INSERT INTO `{dbprefix}attachment` VALUES(85, 1, 'admin', 1, 'dr_1_photo-65', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `{dbprefix}attachment` VALUES(86, 1, 'admin', 1, 'dr_1_photo-66', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `{dbprefix}attachment` VALUES(87, 1, 'admin', 1, 'dr_1_photo-66', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `{dbprefix}attachment` VALUES(88, 1, 'admin', 1, 'dr_1_photo-66', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `{dbprefix}attachment` VALUES(89, 1, 'admin', 1, 'dr_1_photo-67', 1, 0, 478894, 'png', 'fc04f6021b14782cc128f0c1e6c44a6c');
INSERT INTO `{dbprefix}attachment` VALUES(90, 1, 'admin', 1, 'dr_1_photo-67', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `{dbprefix}attachment` VALUES(91, 1, 'admin', 1, 'dr_1_photo-67', 1, 0, 478894, 'png', 'fc04f6021b14782cc128f0c1e6c44a6c');
INSERT INTO `{dbprefix}attachment` VALUES(92, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 187054, 'jpg', '4cd2bf4fea1325f95f71a4e6db78771b');
INSERT INTO `{dbprefix}attachment` VALUES(93, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `{dbprefix}attachment` VALUES(94, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 478894, 'png', 'fc04f6021b14782cc128f0c1e6c44a6c');
INSERT INTO `{dbprefix}attachment` VALUES(95, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 187054, 'jpg', '4cd2bf4fea1325f95f71a4e6db78771b');
INSERT INTO `{dbprefix}attachment` VALUES(96, 1, 'admin', 1, 'dr_1_photo-69', 1, 0, 22323, 'jpg', '02343298b1ef25be261238324827a467');
INSERT INTO `{dbprefix}attachment` VALUES(97, 1, 'admin', 1, 'dr_1_photo-69', 1, 0, 99308, 'jpg', '2d5ac77b9a4d4d18af3f29e0fd889471');
INSERT INTO `{dbprefix}attachment` VALUES(98, 1, 'admin', 1, 'dr_1_photo-69', 1, 0, 102380, 'jpg', '433f0be9ede65eaa162cdd0b9a034c5c');
INSERT INTO `{dbprefix}attachment` VALUES(99, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 358052, 'png', '45aa9aa2c45938aefd9b9fc358543b79');
INSERT INTO `{dbprefix}attachment` VALUES(100, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 102380, 'jpg', '433f0be9ede65eaa162cdd0b9a034c5c');
INSERT INTO `{dbprefix}attachment` VALUES(101, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 358052, 'png', '45aa9aa2c45938aefd9b9fc358543b79');
INSERT INTO `{dbprefix}attachment` VALUES(102, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 22323, 'jpg', '02343298b1ef25be261238324827a467');
INSERT INTO `{dbprefix}attachment` VALUES(103, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 22323, 'jpg', '02343298b1ef25be261238324827a467');
INSERT INTO `{dbprefix}attachment` VALUES(104, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 99308, 'jpg', '2d5ac77b9a4d4d18af3f29e0fd889471');
INSERT INTO `{dbprefix}attachment` VALUES(105, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 102380, 'jpg', '433f0be9ede65eaa162cdd0b9a034c5c');
INSERT INTO `{dbprefix}attachment` VALUES(106, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 392950, 'jpg', '79ad4a9cf6cb611c8908806b5e42e684');
INSERT INTO `{dbprefix}attachment` VALUES(107, 1, 'admin', 1, 'dr_1_photo-72', 1, 0, 53248, 'jpg', 'e61a342d2c9a3bc313655754b3305bc6');
INSERT INTO `{dbprefix}attachment` VALUES(108, 1, 'admin', 1, 'dr_1_photo-72', 1, 0, 53248, 'jpg', 'e61a342d2c9a3bc313655754b3305bc6');
INSERT INTO `{dbprefix}attachment` VALUES(109, 1, 'admin', 1, 'dr_1_photo-73', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `{dbprefix}attachment` VALUES(110, 1, 'admin', 1, 'dr_1_photo-73', 1, 0, 53248, 'jpg', 'e61a342d2c9a3bc313655754b3305bc6');
INSERT INTO `{dbprefix}attachment` VALUES(111, 1, 'admin', 1, 'dr_1_photo-73', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `{dbprefix}attachment` VALUES(112, 1, 'admin', 1, 'dr_1_photo-74', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `{dbprefix}attachment` VALUES(113, 1, 'admin', 1, 'dr_1_photo-74', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `{dbprefix}attachment` VALUES(114, 1, 'admin', 1, 'dr_1_photo-74', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `{dbprefix}attachment` VALUES(115, 1, 'admin', 1, '', 1, 0, 125716, 'jpg', '47e7e5cf32b118a40e745c7de3109cc2');
INSERT INTO `{dbprefix}attachment` VALUES(116, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 125716, 'jpg', '47e7e5cf32b118a40e745c7de3109cc2');
INSERT INTO `{dbprefix}attachment` VALUES(117, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `{dbprefix}attachment` VALUES(118, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 8980, 'jpg', '9bea1e2489849e298b460901c8fe304e');
INSERT INTO `{dbprefix}attachment` VALUES(119, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `{dbprefix}attachment` VALUES(120, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 128174, 'jpg', 'd8fe60006254dd3454c5208b6699ade0');
INSERT INTO `{dbprefix}attachment` VALUES(121, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `{dbprefix}attachment` VALUES(122, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 125716, 'jpg', '47e7e5cf32b118a40e745c7de3109cc2');
INSERT INTO `{dbprefix}attachment` VALUES(123, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 128174, 'jpg', 'd8fe60006254dd3454c5208b6699ade0');
INSERT INTO `{dbprefix}attachment` VALUES(124, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 210975, 'jpg', '1251973e6ec28c1538b2376d87080184');
INSERT INTO `{dbprefix}attachment` VALUES(125, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 128174, 'jpg', 'd8fe60006254dd3454c5208b6699ade0');
INSERT INTO `{dbprefix}attachment` VALUES(126, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 210975, 'jpg', '1251973e6ec28c1538b2376d87080184');
INSERT INTO `{dbprefix}attachment` VALUES(127, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 176568, 'jpg', '3ff581ad3a611e71e7ab02175bdf4ac4');
INSERT INTO `{dbprefix}attachment` VALUES(128, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 422195, 'jpg', '0539d62a19328fa13e83812999df850b');
INSERT INTO `{dbprefix}attachment` VALUES(129, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 210975, 'jpg', '1251973e6ec28c1538b2376d87080184');
INSERT INTO `{dbprefix}attachment` VALUES(130, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 176568, 'jpg', '3ff581ad3a611e71e7ab02175bdf4ac4');
INSERT INTO `{dbprefix}attachment` VALUES(131, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 119398, 'jpg', 'ac23ac15bc7b016e6fcfd6012297b8d9');
INSERT INTO `{dbprefix}attachment` VALUES(132, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 422195, 'jpg', '0539d62a19328fa13e83812999df850b');
INSERT INTO `{dbprefix}attachment` VALUES(133, 1, 'admin', 1, 'dr_1_photo-79', 1, 0, 119398, 'jpg', 'ac23ac15bc7b016e6fcfd6012297b8d9');
INSERT INTO `{dbprefix}attachment` VALUES(134, 1, 'admin', 1, 'dr_1_photo-79', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `{dbprefix}attachment` VALUES(135, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `{dbprefix}attachment` VALUES(136, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `{dbprefix}attachment` VALUES(137, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `{dbprefix}attachment` VALUES(138, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `{dbprefix}attachment` VALUES(139, 1, 'admin', 1, '', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `{dbprefix}attachment` VALUES(140, 1, 'admin', 1, 'dr_1_photo-81', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `{dbprefix}attachment` VALUES(141, 1, 'admin', 1, 'dr_1_photo-81', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `{dbprefix}attachment` VALUES(142, 1, 'admin', 1, 'dr_1_photo-81', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `{dbprefix}attachment` VALUES(143, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `{dbprefix}attachment` VALUES(144, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `{dbprefix}attachment` VALUES(145, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `{dbprefix}attachment` VALUES(146, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `{dbprefix}attachment` VALUES(147, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `{dbprefix}attachment` VALUES(148, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `{dbprefix}attachment` VALUES(149, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `{dbprefix}attachment` VALUES(150, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `{dbprefix}attachment` VALUES(151, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `{dbprefix}attachment` VALUES(152, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `{dbprefix}attachment` VALUES(153, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `{dbprefix}attachment` VALUES(154, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `{dbprefix}attachment` VALUES(155, 1, 'admin', 1, 'dr_1_photo-85', 1, 0, 26092, 'jpg', '3369a37d1f1c579a4284b5ef97e6882b');
INSERT INTO `{dbprefix}attachment` VALUES(156, 1, 'admin', 1, 'dr_1_photo-85', 1, 0, 35912, 'jpg', '1fbdfe2f856a9dfbe8543629e77598a2');
INSERT INTO `{dbprefix}attachment` VALUES(157, 1, 'admin', 1, 'dr_1_photo-86', 1, 0, 26880, 'jpg', '9d89e2b27de9ce105f475944616117e3');
INSERT INTO `{dbprefix}attachment` VALUES(158, 1, 'admin', 1, 'dr_1_photo-86', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `{dbprefix}attachment` VALUES(159, 1, 'admin', 1, 'dr_1_photo-86', 1, 0, 26092, 'jpg', '3369a37d1f1c579a4284b5ef97e6882b');
INSERT INTO `{dbprefix}attachment` VALUES(160, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 93870, 'jpg', '102d4e6614c0f8ae0d13ae7b0f94f416');
INSERT INTO `{dbprefix}attachment` VALUES(161, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `{dbprefix}attachment` VALUES(162, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 26092, 'jpg', '3369a37d1f1c579a4284b5ef97e6882b');
INSERT INTO `{dbprefix}attachment` VALUES(163, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 93870, 'jpg', '102d4e6614c0f8ae0d13ae7b0f94f416');
INSERT INTO `{dbprefix}attachment` VALUES(164, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 36465, 'jpg', '188a0587090bc8790a664b550b0c7521');
INSERT INTO `{dbprefix}attachment` VALUES(165, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 36465, 'jpg', '188a0587090bc8790a664b550b0c7521');
INSERT INTO `{dbprefix}attachment` VALUES(166, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `{dbprefix}attachment` VALUES(167, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `{dbprefix}attachment` VALUES(168, 1, 'admin', 1, 'dr_1_photo-89', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `{dbprefix}attachment` VALUES(169, 1, 'admin', 1, 'dr_1_photo-89', 1, 0, 36465, 'jpg', '188a0587090bc8790a664b550b0c7521');
INSERT INTO `{dbprefix}attachment` VALUES(170, 1, 'admin', 1, 'dr_1_photo-89', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `{dbprefix}attachment` VALUES(171, 1, 'admin', 1, '', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `{dbprefix}attachment` VALUES(172, 1, 'admin', 1, 'dr_1_photo-90', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `{dbprefix}attachment` VALUES(173, 1, 'admin', 1, 'dr_1_photo-90', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `{dbprefix}attachment` VALUES(174, 1, 'admin', 1, 'dr_1_photo-90', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `{dbprefix}attachment` VALUES(175, 1, 'admin', 1, 'dr_1_photo-91', 1, 0, 136847, 'jpg', 'ba92fd3695ab9671f1215689f11dd418');
INSERT INTO `{dbprefix}attachment` VALUES(176, 1, 'admin', 1, 'dr_1_photo-91', 1, 0, 136847, 'jpg', 'ba92fd3695ab9671f1215689f11dd418');
INSERT INTO `{dbprefix}attachment` VALUES(177, 1, 'admin', 1, 'dr_1_photo-92', 1, 0, 22764, 'jpg', 'eab7599c2b7830c48a8ace7b440dca52');
INSERT INTO `{dbprefix}attachment` VALUES(178, 1, 'admin', 1, 'dr_1_photo-92', 1, 0, 136847, 'jpg', 'ba92fd3695ab9671f1215689f11dd418');
INSERT INTO `{dbprefix}attachment` VALUES(179, 1, 'admin', 1, 'dr_1_photo-92', 1, 0, 22764, 'jpg', 'eab7599c2b7830c48a8ace7b440dca52');
INSERT INTO `{dbprefix}attachment` VALUES(180, 1, 'admin', 1, 'dr_1_photo-93', 1, 0, 70482, 'jpg', 'c09798c0093f1ea004858f4258bc1260');
INSERT INTO `{dbprefix}attachment` VALUES(181, 1, 'admin', 1, 'dr_1_photo-93', 1, 0, 86600, 'jpg', '8f764f35b5fbb1455e9fdc4dfb868848');
INSERT INTO `{dbprefix}attachment` VALUES(182, 1, 'admin', 1, 'dr_1_photo-94', 1, 0, 86600, 'jpg', '8f764f35b5fbb1455e9fdc4dfb868848');
INSERT INTO `{dbprefix}attachment` VALUES(183, 1, 'admin', 1, 'dr_1_photo-94', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `{dbprefix}attachment` VALUES(184, 1, 'admin', 1, 'dr_1_photo-95', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `{dbprefix}attachment` VALUES(185, 1, 'admin', 1, 'dr_1_photo-95', 1, 0, 70482, 'jpg', 'c09798c0093f1ea004858f4258bc1260');
INSERT INTO `{dbprefix}attachment` VALUES(186, 1, 'admin', 1, 'dr_1_photo-96', 1, 0, 66806, 'jpg', '59d0d30c418eb8a138c0976420aebc32');
INSERT INTO `{dbprefix}attachment` VALUES(187, 1, 'admin', 1, 'dr_1_photo-96', 1, 0, 66806, 'jpg', '59d0d30c418eb8a138c0976420aebc32');
INSERT INTO `{dbprefix}attachment` VALUES(188, 1, 'admin', 1, 'dr_1_photo-96', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `{dbprefix}attachment` VALUES(189, 1, 'admin', 1, 'dr_1_photo-97', 1, 0, 110019, 'jpg', 'a0f6f3f2b6e838bfe0c31fb83eb96da9');
INSERT INTO `{dbprefix}attachment` VALUES(190, 1, 'admin', 1, 'dr_1_photo-97', 1, 0, 512563, 'jpg', '9e05b03de844e3c6027e0a2f46529c86');
INSERT INTO `{dbprefix}attachment` VALUES(191, 1, 'admin', 1, 'dr_1_photo-99', 1, 0, 645366, 'jpg', '7592c0cd21649ddd894651f3e3e84826');
INSERT INTO `{dbprefix}attachment` VALUES(192, 1, 'admin', 1, '', 1, 0, 110019, 'jpg', 'a0f6f3f2b6e838bfe0c31fb83eb96da9');
INSERT INTO `{dbprefix}attachment` VALUES(193, 1, 'admin', 1, '', 1, 0, 512563, 'jpg', '9e05b03de844e3c6027e0a2f46529c86');
INSERT INTO `{dbprefix}attachment` VALUES(194, 1, 'admin', 1, 'dr_1_photo-99', 1, 0, 645366, 'jpg', '7592c0cd21649ddd894651f3e3e84826');
INSERT INTO `{dbprefix}attachment` VALUES(195, 1, 'admin', 1, 'dr_1_photo-100', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `{dbprefix}attachment` VALUES(196, 1, 'admin', 1, 'dr_1_photo-100', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `{dbprefix}attachment` VALUES(197, 1, 'admin', 1, 'dr_1_photo-101', 1, 0, 619459, 'jpg', 'f911adea0cebef6367d7469d34da4222');
INSERT INTO `{dbprefix}attachment` VALUES(198, 1, 'admin', 1, 'dr_1_photo-101', 1, 0, 619459, 'jpg', 'f911adea0cebef6367d7469d34da4222');
INSERT INTO `{dbprefix}attachment` VALUES(199, 1, 'admin', 1, 'dr_1_photo-102', 1, 0, 15626, 'jpg', 'b6940921426b1a43b55d65ed27d8bddb');
INSERT INTO `{dbprefix}attachment` VALUES(200, 1, 'admin', 1, 'dr_1_photo-102', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `{dbprefix}attachment` VALUES(201, 1, 'admin', 1, 'dr_1_photo-103', 1, 0, 619459, 'jpg', 'f911adea0cebef6367d7469d34da4222');
INSERT INTO `{dbprefix}attachment` VALUES(202, 1, 'admin', 1, 'dr_1_photo-103', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `{dbprefix}attachment` VALUES(203, 1, 'admin', 1, 'dr_1_photo-104', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `{dbprefix}attachment` VALUES(204, 1, 'admin', 1, 'dr_1_photo-104', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `{dbprefix}attachment` VALUES(205, 1, 'admin', 1, '', 1, 0, 3098952, 'jpg', 'e9c63db2311a12fdaacd4c6ca922c5d7');
INSERT INTO `{dbprefix}attachment` VALUES(206, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `{dbprefix}attachment` VALUES(207, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `{dbprefix}attachment` VALUES(208, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `{dbprefix}attachment` VALUES(209, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 403988, 'jpg', 'c14bbb808a06457c3eca13d93f1e7220');
INSERT INTO `{dbprefix}attachment` VALUES(210, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `{dbprefix}attachment` VALUES(211, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `{dbprefix}attachment` VALUES(212, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `{dbprefix}attachment` VALUES(213, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `{dbprefix}attachment` VALUES(214, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `{dbprefix}attachment` VALUES(215, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `{dbprefix}attachment` VALUES(216, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `{dbprefix}attachment` VALUES(217, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `{dbprefix}attachment` VALUES(218, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `{dbprefix}attachment` VALUES(219, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `{dbprefix}attachment` VALUES(220, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `{dbprefix}attachment` VALUES(221, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 163594, 'jpg', '5f3707be82358736e3f708f01c9ae3b8');
INSERT INTO `{dbprefix}attachment` VALUES(222, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `{dbprefix}attachment` VALUES(223, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `{dbprefix}attachment` VALUES(224, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `{dbprefix}attachment` VALUES(225, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 275005, 'jpg', '1d19685dfe5aa9d646cdac89088748c7');
INSERT INTO `{dbprefix}attachment` VALUES(226, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `{dbprefix}attachment` VALUES(227, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `{dbprefix}attachment` VALUES(228, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 163594, 'jpg', '5f3707be82358736e3f708f01c9ae3b8');
INSERT INTO `{dbprefix}attachment` VALUES(229, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 275005, 'jpg', '1d19685dfe5aa9d646cdac89088748c7');
INSERT INTO `{dbprefix}attachment` VALUES(230, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `{dbprefix}attachment` VALUES(231, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `{dbprefix}attachment` VALUES(232, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `{dbprefix}attachment` VALUES(233, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `{dbprefix}attachment` VALUES(234, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 403988, 'jpg', 'c14bbb808a06457c3eca13d93f1e7220');
INSERT INTO `{dbprefix}attachment` VALUES(235, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `{dbprefix}attachment` VALUES(236, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `{dbprefix}attachment` VALUES(237, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `{dbprefix}attachment` VALUES(238, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `{dbprefix}attachment` VALUES(239, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `{dbprefix}attachment` VALUES(240, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 403988, 'jpg', 'c14bbb808a06457c3eca13d93f1e7220');
INSERT INTO `{dbprefix}attachment` VALUES(241, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `{dbprefix}attachment` VALUES(242, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(243, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(244, 1, 'admin', 1, '', 1, 0, 585011200, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(245, 1, 'admin', 1, '', 1, 0, 374559744, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(246, 1, 'admin', 1, '', 1, 0, 549230592, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(247, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(248, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(249, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `{dbprefix}attachment` VALUES(250, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 383345, 'png', '66fbe770f1a89aada704c8c1f91e8589');
INSERT INTO `{dbprefix}attachment` VALUES(251, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 383345, 'png', '66fbe770f1a89aada704c8c1f91e8589');
INSERT INTO `{dbprefix}attachment` VALUES(252, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 571300, 'png', 'a75486308d4caab3ce93b55e46d6cdcf');
INSERT INTO `{dbprefix}attachment` VALUES(253, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 365783, 'png', '33288e44914b8140e3a0a6c9fcbddd5b');
INSERT INTO `{dbprefix}attachment` VALUES(254, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 536361, 'png', '392ee02eb19136fedffbb38728507346');
INSERT INTO `{dbprefix}attachment` VALUES(255, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 529715, 'png', '6d5cccfcf22a3c5ea858e4cd6b571b2c');
INSERT INTO `{dbprefix}attachment` VALUES(256, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 383345, 'png', '66fbe770f1a89aada704c8c1f91e8589');
INSERT INTO `{dbprefix}attachment` VALUES(257, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 571300, 'png', 'a75486308d4caab3ce93b55e46d6cdcf');
INSERT INTO `{dbprefix}attachment` VALUES(258, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 529715, 'png', '6d5cccfcf22a3c5ea858e4cd6b571b2c');

-- -- ----------------------------------------------------------
-- -- 转存表中的数据 `dr_admin_login`
-- --
-- INSERT INTO `{dbprefix}admin_login` VALUES(9, 1, '127.0.0.1', 1480917467, 'Unknown Platform  ');

-- -- --------------------------------------------------------
-- --
-- -- 转存表中的数据 `dr_urlrule`
-- --
-- INSERT INTO `{dbprefix}urlrule` VALUES(1, 0, '', '{"share_tag":"","share_tag_page":"","share_search":"","share_search_page":"","share_list":"","share_list_page":"","share_show":"","share_show_page":""}');

-- -- --------------------------------------------------------
-- --
-- -- 转存表中的数据 `dr_member_notice_1`
-- --
-- INSERT INTO `{dbprefix}member_notice_1` VALUES(1, 2, 1, 1, '您有新的评论，<a href="/index.php?c=show&id=1" target="_blank">查看详情</a>', 1478262274);

-- -- --------------------------------------------------------
-- --
-- -- 转存表中的数据 `dr_member_new_notice`
-- --
-- INSERT INTO `{dbprefix}_member_new_notice` VALUES(1);
-- ------------------------------------------------------------------
-- --
-- -- 转存表中的数据 `dr_application`
-- --
-- INSERT INTO `{dbprefix}application` VALUES(2, '', 'mcaiji', '', 0);

-- -- --------------------------------------------------------
-- --
-- -- 转存表中的数据 `dr_member_menu`
-- --
-- INSERT INTO `{dbprefix}member_menu` VALUES(1, 0, '账号', '', '', '', 0, 0, 0, 'icon-user');
-- INSERT INTO `{dbprefix}member_menu` VALUES(2, 0, '财务', '', '', '', 0, 0, 0, 'fa fa-rmb');
-- INSERT INTO `{dbprefix}member_menu` VALUES(4, 0, '应用', '', '', 'm_app', 0, 0, 0, 'fa fa-cloud');
-- INSERT INTO `{dbprefix}member_menu` VALUES(43, 16, '转账服务', 'pay/transfer', '', '', 0, 0, 0, 'fa fa-rmb');
-- INSERT INTO `{dbprefix}member_menu` VALUES(5, 1, '基本管理', '', '', '', 0, 0, 0, 'fa fa-cogs');
-- INSERT INTO `{dbprefix}member_menu` VALUES(6, 5, '基本资料', 'account/index', '', '', 0, 0, 0, 'fa fa-cog');
-- INSERT INTO `{dbprefix}member_menu` VALUES(10, 1, '会员相关', '', '', '', 0, 0, 0, 'fa fa-user');
-- INSERT INTO `{dbprefix}member_menu` VALUES(11, 5, '修改密码', 'account/password', '', '', 0, 0, 0, 'icon-lock');
-- INSERT INTO `{dbprefix}member_menu` VALUES(12, 10, '快捷登录', 'account/oauth', '', '', 0, 0, 0, 'fa fa-weibo');
-- INSERT INTO `{dbprefix}member_menu` VALUES(13, 10, '登录记录', 'account/login', '', '', 0, 0, 0, 'fa fa-calendar-o');
-- INSERT INTO `{dbprefix}member_menu` VALUES(14, 10, '会员升级', 'account/upgrade', '', '', 0, 0, 0, 'fa fa-user-plus');
-- INSERT INTO `{dbprefix}member_menu` VALUES(15, 10, '会员权限', 'account/permission', '', '', 0, 0, 0, 'fa fa-users');
-- INSERT INTO `{dbprefix}member_menu` VALUES(16, 2, '充值付款', '', '', '', 0, 0, 0, 'fa fa-rmb');
-- INSERT INTO `{dbprefix}member_menu` VALUES(17, 2, '财务记录', '', '', '', 0, 0, 0, 'fa fa-calendar-o');
-- INSERT INTO `{dbprefix}member_menu` VALUES(18, 16, '在线充值', 'pay/add', '', '', 0, 0, 0, 'fa fa-rmb');
-- INSERT INTO `{dbprefix}member_menu` VALUES(20, 16, '兑换服务', 'pay/convert', '', '', 0, 0, 0, 'fa fa-exchange');
-- INSERT INTO `{dbprefix}member_menu` VALUES(21, 17, '收入记录', 'pay/index', '', '', 0, 0, 0, 'fa fa-calendar-plus-o');
-- INSERT INTO `{dbprefix}member_menu` VALUES(22, 17, '消费记录', 'pay/spend', '', '', 0, 0, 0, 'fa fa-calendar-minus-o');
-- INSERT INTO `{dbprefix}member_menu` VALUES(23, 17, '经验值记录', 'pay/experience', '', '', 0, 0, 0, 'fa fa-compass');
-- INSERT INTO `{dbprefix}member_menu` VALUES(24, 17, '虚拟币记录', 'pay/score', '', '', 0, 0, 0, 'fa fa-diamond');
-- INSERT INTO `{dbprefix}member_menu` VALUES(25, 3, '基本设置', '', '', '', 0, 0, 0, 'fa fa-cog');
-- INSERT INTO `{dbprefix}member_menu` VALUES(30, 4, '我的应用', '', '', '', 0, 0, 99, 'fa fa-cloud');
-- INSERT INTO `{dbprefix}member_menu` VALUES(45, 5, '上传头像', 'account/avatar', '', '', 0, 0, 0, 'icon-picture');
-- INSERT INTO `{dbprefix}member_menu` VALUES(46, 5, '收货地址', 'address/index', '', '', 0, 0, 0, 'icon-home');
-- INSERT INTO `{dbprefix}member_menu` VALUES(47, 5, '附件管理', 'account/attachment', '', '', 0, 0, 0, 'fa fa-folder');
-- INSERT INTO `{dbprefix}member_menu` VALUES(48, 1, '通知提醒', '', '', '', 0, 0, 0, 'fa fa-bell-o');
-- INSERT INTO `{dbprefix}member_menu` VALUES(50, 48, '系统提醒', 'notice/index', '', '', 0, 0, 0, 'fa fa-bell');
-- INSERT INTO `{dbprefix}member_menu` VALUES(51, 48, '互动提醒', 'notice/member', '', '', 0, 0, 0, 'fa fa-at');
-- INSERT INTO `{dbprefix}member_menu` VALUES(52, 48, '模块提醒', 'notice/module', '', '', 0, 0, 0, 'fa fa-whatsapp');
-- INSERT INTO `{dbprefix}member_menu` VALUES(53, 48, '应用提醒', 'notice/app', '', '', 0, 0, 0, 'fa fa-volume-up');
-- INSERT INTO `{dbprefix}member_menu` VALUES(54, 0, '内容', '', '', 'm_mod', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(55, 54, '文档管理', '', '', 'left-demo', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(56, 55, '已通过的文档', 'demo/home/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(57, 55, '待审核的文档', 'demo/verify/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(58, 55, '被退回的文档', 'demo/back/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(59, 55, '我推荐的文档', 'demo/home/flag', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(60, 55, '我收藏的文档', 'demo/home/favorite', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(61, 55, '我购买的文档', 'demo/home/buy', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
-- INSERT INTO `{dbprefix}member_menu` VALUES(62, 55, '我评论的文档', 'demo/comment/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');

-- -- --------------------------------------------------------