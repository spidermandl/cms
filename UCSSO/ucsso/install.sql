DROP TABLE IF EXISTS `ucsso_admin`;
CREATE TABLE `ucsso_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `salt` varchar(50) NOT NULL COMMENT '随机',
  `content` text NOT NULL COMMENT '存储',
  `regtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

INSERT INTO `ucsso_admin` (`id`, `username`, `password`, `salt`, `content`, `regtime`) VALUES (1,'admin','4135f22cd470028e7a5444feaca79e2a','49948','',0);

DROP TABLE IF EXISTS `ucsso_app`;

CREATE TABLE `ucsso_app` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  `url` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='网站表';

DROP TABLE IF EXISTS `ucsso_member`;

CREATE TABLE `ucsso_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `salt` varchar(50) NOT NULL COMMENT '随机',
  `content` text NOT NULL COMMENT '存储',
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `regtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';


DROP TABLE IF EXISTS `ucsso_uid`;
CREATE TABLE `ucsso_uid` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
