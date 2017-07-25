<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * v3.2
 */

/**
 * 站点配置文件
 */

return array(

	'SITE_NAME'                     => 'POSCMS', //网站的名称
	'SITE_DOMAIN'                   => '127.0.0.1', //网站的域名
	'SITE_DOMAINS'                  => '', //网站的其他域名
	'SITE_MOBILE'                   => '', //移动端域名
	'SITE_CLOSE'                    => 0, //网站是否是关闭状态
	'SITE_CLOSE_MSG'                => '网站升级中....', //网站关闭时的显示信息
	'SITE_LANGUAGE'                 => 'zh-cn', //网站的语言
	'SITE_THEME'                    => 'default', //网站的主题风格
	'SITE_TEMPLATE'                 => 'default', //网站的模板目录
	'SITE_TIMEZONE'                 => 8, //所在的时区常量
	'SITE_TIME_FORMAT'              => 'Y-m-d H:i', //时间显示格式，与date函数一致，默认Y-m-d H:i:s
	'SITE_TITLE'                    => '', //网站首页SEO标题
	'SITE_SEOJOIN'                  => '_', //网站SEO间隔符号
	'SITE_KEYWORDS'                 => '', //网站SEO关键字
	'SITE_DESCRIPTION'              => '', //网站SEO描述信息
	'SITE_NAVIGATOR'                => '顶部导航,首页幻灯,首页头条,底部导航,友情链接,,,,,', //网站导航信息，多个导航逗号分开
	'SITE_MOBILE_OPEN'              => 1, //是否自动识别移动端并强制定向到移动端域名
	'SITE_IMAGE_CONTENT'            => 0, //是否内容编辑器显示水印图片
	'SITE_IMAGE_RATIO'              => 1, //是否宽度自动适应
	'SITE_IMAGE_HTML'               => '', //图片静态化
	'SITE_URL_301'                  => '', //控制URL唯一301跳转的开关

);