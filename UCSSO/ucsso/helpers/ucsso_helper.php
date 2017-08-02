<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');


/**
 * url函数
 *
 * @param	string	$url		URL规则，如home/index
 * @param	array	$query		相关参数
 * @return	string	项目入口文件.php?参数
 */
function dr_url($url, $query = array(), $self = SELF) {

    if (!$url) {
        return SITE_URL.$self;
    }

    $url = trim($url, '/');

    // 判断是否后台首页
    if ($self != 'index.php' && ($url == 'home/index' || $url == 'home/home')) {
        return SELF;
    }

    $url = explode('/', $url);
    $uri = array();

    switch (count($url)) {
        case 1:
            $uri['c'] = 'home';
            $uri['m'] = $url[0];
            break;
        case 2:
            $uri['c'] = $url[0];
            $uri['m'] = $url[1];
            break;
    }

    $query && $uri = @array_merge($uri, $query);

    return SITE_URL.$self.'?'.@http_build_query($uri);
}

/**
 * 数据返回统一格式
 */
function dr_return_data($code, $msg = '', $data = '') {
    return array(
        'code' => $code,
        'msg' => $msg,
        'data' => $data,
    );
}

/**
 * 当前URL
 */
function dr_now_url() {

    $pageURL = 'http';
    isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' && $pageURL.= 's';

    $pageURL.= '://';
    if (strpos($_SERVER['HTTP_HOST'], ':') !== FALSE) {
        $url = explode(':', $_SERVER['HTTP_HOST']);
        $url[0] ? $pageURL.= $_SERVER['HTTP_HOST'] : $pageURL.= $url[0];
    } else {
        $pageURL.= $_SERVER['HTTP_HOST'];
    }

    $pageURL.= $_SERVER['REQUEST_URI'] ? $_SERVER['REQUEST_URI'] : $_SERVER['PHP_SELF'];

    return $pageURL;
}

/**
 * 将字符串转换为数组
 *
 * @param	string	$data	字符串
 * @return	array
 */
function dr_string2array($data) {
    if (is_array($data)) {
        return $data;
    } elseif (!$data) {
        return array();
    } elseif (strpos($data, 'a:') === 0) {
        return unserialize(stripslashes($data));
    } else {
        return @json_decode($data, true);
    }
}

/**
 * 将数组转换为字符串
 *
 * @param	array	$data	数组
 * @return	string
 */
function dr_array2string($data) {
    return $data ? json_encode($data) : '';
}

function dr_ucsso_url($url, $file) {
    return trim($url, '/').'/'.trim($file, '/');
}

function dr_save_cache($name, $value = '') {
    $file = APPPATH.'cache/'.$name.'.php';
    file_put_contents($file, '<?php exit();?>'.dr_array2string($value));
}

function dr_get_cache($name) {
    $file = APPPATH.'cache/'.$name.'.php';
    $value = file_get_contents($file);
    if (!$value) {
        return array();
    }
    return dr_string2array(substr($value, 15));
}

/**
 *  post数据
 *  @param string $url		post的url
 *  @param int $limit		返回的数据的长度
 *  @param string $post		post数据，字符串形式username='dalarge'&password='123456'
 *  @param string $cookie	模拟 cookie，字符串形式username='dalarge'&password='123456'
 *  @param string $ip		ip地址
 *  @param int $timeout		连接超时时间
 *  @param bool $block		是否为阻塞模式
 *  @return string			返回字符串
 */

function dr_ucsso_post($url, $limit = 0, $post = '', $cookie = '', $ip = '', $timeout = 15, $block = true) {
    $return = '';
    $matches = parse_url($url);
    $host = $matches['host'];
    $path = $matches['path'] ? $matches['path'].($matches['query'] ? '?'.$matches['query'] : '') : '/';
    $port = !empty($matches['port']) ? $matches['port'] : 80;
    $siteurl = get_url();
    if($post) {
        $out = "POST $path HTTP/1.1\r\n";
        $out .= "Accept: */*\r\n";
        $out .= "Referer: ".$siteurl."\r\n";
        $out .= "Accept-Language: zh-cn\r\n";
        $out .= "Content-Type: application/x-www-form-urlencoded\r\n";
        $out .= "User-Agent: $_SERVER[HTTP_USER_AGENT]\r\n";
        $out .= "Host: $host\r\n" ;
        $out .= 'Content-Length: '.strlen($post)."\r\n" ;
        $out .= "Connection: Close\r\n" ;
        $out .= "Cache-Control: no-cache\r\n" ;
        $out .= "Cookie: $cookie\r\n\r\n" ;
        $out .= $post ;
    } else {
        $out = "GET $path HTTP/1.1\r\n";
        $out .= "Accept: */*\r\n";
        $out .= "Referer: ".$siteurl."\r\n";
        $out .= "Accept-Language: zh-cn\r\n";
        $out .= "User-Agent: $_SERVER[HTTP_USER_AGENT]\r\n";
        $out .= "Host: $host\r\n";
        $out .= "Connection: Close\r\n";
        $out .= "Cookie: $cookie\r\n\r\n";
    }
    $fp = @fsockopen(($ip ? $ip : $host), $port, $errno, $errstr, $timeout);
    if(!$fp) return '';

    stream_set_blocking($fp, $block);
    stream_set_timeout($fp, $timeout);
    @fwrite($fp, $out);
    $status = stream_get_meta_data($fp);

    if($status['timed_out']) return '';
    while (!feof($fp)) {
        if(($header = @fgets($fp)) && ($header == "\r\n" ||  $header == "\n"))  break;
    }

    $stop = false;
    while(!feof($fp) && !$stop) {
        $data = fread($fp, ($limit == 0 || $limit > 8192 ? 8192 : $limit));
        $return .= $data;
        if($limit) {
            $limit -= strlen($data);
            $stop = $limit <= 0;
        }
    }
    @fclose($fp);

    return $return;
}

function dr_daddslashes($string, $force = 0, $strip = FALSE) {
    if(!MAGIC_QUOTES_GPC || $force) {
        if(is_array($string)) {
            foreach($string as $key => $val) {
                $string[$key] = dr_daddslashes($val, $force, $strip);
            }
        } else {
            $string = addslashes($strip ? stripslashes($string) : $string);
        }
    }
    return $string;
}


function ucsso_authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {

    $ckey_length = 4;

    $key = md5($key ? $key : 'error');
    $keya = md5(substr($key, 0, 16));
    $keyb = md5(substr($key, 16, 16));
    $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

    $cryptkey = $keya.md5($keya.$keyc);
    $key_length = strlen($cryptkey);

    $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
    $string_length = strlen($string);

    $result = '';
    $box = range(0, 255);

    $rndkey = array();
    for($i = 0; $i <= 255; $i++) {
        $rndkey[$i] = ord($cryptkey[$i % $key_length]);
    }

    for($j = $i = 0; $i < 256; $i++) {
        $j = ($j + $box[$i] + $rndkey[$i]) % 256;
        $tmp = $box[$i];
        $box[$i] = $box[$j];
        $box[$j] = $tmp;
    }

    for($a = $j = $i = 0; $i < $string_length; $i++) {
        $a = ($a + 1) % 256;
        $j = ($j + $box[$a]) % 256;
        $tmp = $box[$a];
        $box[$a] = $box[$j];
        $box[$j] = $tmp;
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
    }

    if($operation == 'DECODE') {
        if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
            return substr($result, 26);
        } else {
            return '';
        }
    } else {
        return $keyc.str_replace('=', '', base64_encode($result));
    }
}
