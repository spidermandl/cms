<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Install extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();

        is_file(APPPATH.'install.lock') && exit('安装程序已经锁定，如果重新安装请删除ucsso/install.lock文件');
    }


    public function index()
	{

        $this->template->assign(array(
            'meta_title' => 'UCSSO单点登录系统 - 安装程序',
        ));
        $this->template->display('install.html');
	}

	public function todo() {

        $data = $this->input->post('data');

        // 数据库支持判断
        $mysqli = function_exists('mysqli_init') ? mysqli_init() : 0;
        if (!$mysqli) {
            exit($this->_json(0, '您的PHP环境必须启用Mysqli扩展'));
        }

        if (!@mysqli_real_connect($mysqli, $data['dbhost'], $data['dbuser'], $data['dbpw'])) {
            exit($this->_json(0, '无法连接到数据库服务器（'.$data['dbhost'].'），请检查用户名（'.$data['dbuser'].'）和密码（'.$data['dbpw'].'）是否正确'));
        }
        if (!@mysqli_select_db($mysqli, $data['dbname'])) {
            if (!@mysqli_query($mysqli, 'CREATE DATABASE '.$data['dbname'])) {
                exit($this->_json(0, '指定的数据库（'.$data['dbname'].'）不存在，系统尝试创建失败，请通过其他方式建立数据库'));
            }
        }
        // utf8方式打开数据库
        mysqli_query($mysqli, 'SET NAMES utf8');

        // 格式化端口
        list($data['dbhost'], $data['dbport']) = explode(':', $data['dbhost']);
        $data['dbport'] = $data['dbport'] ? (int)$data['dbport'] : 3306;
        $data['dbprefix'] = 'ucsso_';
        // 配置文件
        $config = "<?php".PHP_EOL.PHP_EOL;
        $config.= "if (!defined('BASEPATH')) exit('No direct script access allowed');".PHP_EOL.PHP_EOL;
        $config.= "\$active_group	= 'default';".PHP_EOL;
        $config.= "\$query_builder	= TRUE;".PHP_EOL.PHP_EOL;
        $config.= "\$db['default']	= array(".PHP_EOL;
        $config.= "	'dsn'		=> '',".PHP_EOL;
        $config.= "	'hostname'	=> '{$data['dbhost']}',".PHP_EOL;
        $config.= "	'username'	=> '{$data['dbuser']}',".PHP_EOL;
        $config.= "	'password'	=> '{$data['dbpw']}',".PHP_EOL;
        $config.= "	'port'		=> '{$data['dbport']}',".PHP_EOL;
        $config.= "	'database'	=> '{$data['dbname']}',".PHP_EOL;
        $config.= "	'dbdriver'	=> 'mysqli',".PHP_EOL;
        $config.= "	'dbprefix'	=> '{$data['dbprefix']}',".PHP_EOL;
        $config.= "	'pconnect'	=> FALSE,".PHP_EOL;
        $config.= "	'db_debug'	=> FALSE,".PHP_EOL;
        $config.= "	'cache_on'	=> FALSE,".PHP_EOL;
        $config.= "	'cachedir'	=> 'cache/sql/',".PHP_EOL;
        $config.= "	'char_set'	=> 'utf8',".PHP_EOL;
        $config.= "	'dbcollat'	=> 'utf8_general_ci',".PHP_EOL;
        $config.= "	'swap_pre'	=> '',".PHP_EOL;
        $config.= "	'autoinit'	=> FALSE,".PHP_EOL;
        $config.= "	'encrypt'	=> FALSE,".PHP_EOL;
        $config.= "	'compress'	=> FALSE,".PHP_EOL;
        $config.= "	'stricton'	=> FALSE,".PHP_EOL;
        $config.= "	'failover'	=> array(),".PHP_EOL;
        $config.= ");".PHP_EOL;
        // 保存配置文件
        if (!file_put_contents(APPPATH.'config/database.php', $config)) {
            exit($this->_json(0, '数据库配置文件保存失败，请检查文件config/database.php权限！'));
        }
        // 加载数据库
        $this->load->database();

        // 导入表结构
        $this->_query(file_get_contents(APPPATH.'install.sql'));
        file_put_contents(APPPATH.'install.lock', time());

        $this->_json(1, '安装成功');
    }

    // 执行sql
    private function _query($sql) {

        if (!$sql) {
            return NULL;
        }

        $sql_data = explode(';SQL_FINECMS_EOL', trim(str_replace(array(PHP_EOL, chr(13), chr(10)), 'SQL_FINECMS_EOL', $sql)));

        foreach($sql_data as $query){
            if (!$query) {
                continue;
            }
            $ret = '';
            $queries = explode('SQL_FINECMS_EOL', trim($query));
            foreach($queries as $query) {
                $ret.= $query[0] == '#' || $query[0].$query[1] == '--' ? '' : $query;
            }
            if (!$ret) {
                continue;
            }
            $this->db->query($ret);
        }
    }
}
