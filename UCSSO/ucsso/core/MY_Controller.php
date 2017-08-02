<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller
{
    public $db;
    public $app;
    public $app_id;
    public $app_key;
    public $admin;
    public $param;

    public function __construct()
    {
        parent::__construct();

        define('UCSSO_VERSION', '1.0');

        $this->_init_ucsso();

    }

    private function _init_ucsso() {

        $pageURL = 'http';
        isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' && $pageURL.= 's';
        $pageURL.= '://';
        if (strpos($_SERVER['HTTP_HOST'], ':') !== FALSE) {
            $url = explode(':', $_SERVER['HTTP_HOST']);
            $url[0] ? $pageURL.= $_SERVER['HTTP_HOST'] : $pageURL.= $url[0];
        } else {
            $pageURL.= $_SERVER['HTTP_HOST'];
        }
        $url = trim(str_replace(array('\\', '//'), '/', dirname($_SERVER['SCRIPT_NAME'])), '/');
        define('SITE_URL', $pageURL.'/'.(!$url ? '' : $url.'/'));
        define('IS_AJAX', $this->input->is_ajax_request());
        define('IS_POST', $_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST) ? TRUE : FALSE);
        define('SYS_TIME', $_SERVER['REQUEST_TIME'] ? $_SERVER['REQUEST_TIME'] : time());

        if (UCSSO == 'install') {
            return;
        }

        $this->load->database();

        switch (UCSSO) {

            case 'home':
                $this->_init_admin();
                break;
            case 'api':
                $this->_init_api();
                break;
        }
    }

    private function _init_api($getagent = '') {

        #file_put_contents(FCPATH."wx.txt", var_export($_POST, true));
        $this->app = dr_get_cache('app');
        $this->app_id = (int)$_POST['appid'];
        $this->action = $_POST['action'];
        $this->app_key = $this->app[$this->app_id]['key'];
        if (!$this->app_key) {
            exit('key不存在');
        }

        $input = ucsso_authcode($this->input->post('input'), 'DECODE', $this->app_key);
        if($input) {
            parse_str($input, $this->param);
            $this->action != 'avatar' && $this->param = dr_daddslashes($this->param, 1, TRUE);
            $agent = $getagent ? $getagent : $this->param['agent'];
            if(($getagent && $getagent != $this->param['agent']) || (!$getagent && md5($_SERVER['HTTP_USER_AGENT']) != $agent)) {
                exit('客户端验证失败');
                // 客户端验证失败
            } elseif(SYS_TIME - $this->param['time'] > 3600) {
                exit('授权过期');
                // 超时
            }
        }

        if(empty($this->param)) {
            exit('Invalid input');
        }

    }

    private function _init_admin() {

        $this->load->library('session');
        $uid = $this->session->userdata('admin_id');
        if (!$uid && $this->router->class != 'login') {
            redirect(dr_url('login/index', array('error' => '没有登录系统')));
        }

        $this->admin = $this->db->where('id', $uid)->get('admin')->row_array();
        if (!$this->admin && $this->router->class != 'login') {
            redirect(dr_url('login/index'), array('error' => '登录认证失败'));
        }

        $menu = array(
            'home' => array(
                '总览',
                'fa fa-home'
            ),
            'member' => array(
                '用户管理',
                'fa fa-user'
            ),
            'app' => array(
                '网站管理',
                'fa fa-puzzle-piece'
            ),
            /*
            'notice' => array(
                '通知管理',
                'fa fa-volume-up'
            ),*/
            'password' => array(
                '修改密码',
                'fa fa-edit'
            ),
            'admin' => array(
                '管理员账号',
                'fa fa-users'
            ),
            'logout' => array(
                '退出系统',
                'fa fa-power-off'
            ),
        );

        $this->template->assign(array(
            'myclass' => $this->router->class,
            'admin' => $this->admin,
            'meta_title' => 'UCSSO管理平台',
            'menu' => $menu,
            'my_menu' => $menu[$this->router->class],
        ));

    }

    protected function _admin_login($data) {

        $admin = $this->db->where('username', $data['username'])->get('admin')->row_array();
        if (!$admin) {
            return '账号不存在';
        } elseif (md5(md5($data['password']).$admin['salt'].md5($data['password'])) != $admin['password']) {
            return '密码不正确';
        }

        $this->session->set_userdata('admin_id', $admin['id']);


        return 0;

    }
    /**
     * 后台提示信息
     */
    public function _admin_msg($code, $msg, $url = '', $time = 3) {

       $this->template->assign(array(
            'msg' => $msg,
            'url' => $url,
            'time' => $time,
            'mark' => $code,
       ));
        $this->template->display('msg.html');
        exit;
    }


    /**
     * 统一返回json格式并退出程序
     */
    protected function _json($code, $msg, $data = array()){

        echo json_encode(dr_return_data($code, $msg, $data));exit;
    }

    /**
     * 用于后台的分页
     */
    protected function get_pagination($url, $total, $psize) {

        $this->load->library('pagination');

        include WEBPATH.'config/pagination.php';

        $config['base_url'] = $url;
        $config['per_page'] = $psize;
        $config['total_rows'] = $total;
        $config['use_page_numbers'] = TRUE;
        $config['query_string_segment'] = 'page';

        $this->pagination->initialize($config);

        return $this->pagination->create_links();
    }

    // 更加app的uid查询用户信息
    protected function get_member_by_uid($appid, $uid) {

        $index = $this->db->where('app', $appid)->where('uid', $uid)->get('uid')->row_array();
        if (!$index) {
            return null;
        }

        return $this->db->where('id', $index['mid'])->get('member')->row_array();

    }
}
