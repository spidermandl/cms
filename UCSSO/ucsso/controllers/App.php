<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->template->assign(array(
            'app_type' => array(
                'poscms' => 'POSCMS',
                'php7cms' => 'Php7CMS',
            ),
        ));
    }

    public function index()
	{

        $list = $cache = array();
        $data = $this->db->order_by('id asc')->get('app')->result_array();
        if ($data) {
            foreach ($data as $t) {
                $t['value'] = dr_string2array($t['value']);
                $list[$t['id']] = $t;
                $cache[$t['id']] = array(
                    'key' => $t['key'],
                    'name' => $t['name'],
                    'root' => $t['url'],
                    'ip' => $t['value']['ip'],
                    'url' => array(
                        dr_ucsso_url($t['url'], $t['value']['file'])
                    ),
                );
                $url = explode(PHP_EOL, $t['value']['url']);
                if ($url) {
                    foreach ($url as $u) {
                        $u && $cache[$t['id']]['url'][] = dr_ucsso_url($u, $t['value']['file']);
                    }
                }
            }
        }

        dr_save_cache('app', $cache);

        $this->template->assign(array(
            'list' => $list,
            'cache' => dr_get_cache('app'),
        ));
        $this->template->display('app_index.html');
	}

	public function add()
	{

        if (IS_POST) {

            $post = $this->input->post('data');
            if (!$post['name']) {
                $this->_json(0, '网站名称不能为空');
            } elseif (!$post['url']) {
                $this->_json(0, '网站地址不能为空');
            } elseif (!$post['key']) {
                $this->_json(0, '通信密钥不能为空');
            }

            $post['value'] = dr_array2string($post['value']);
            $this->db->insert('app', $post);
            $id = $this->db->insert_id();
            !$id && $this->_json(0, '存储失败');

            $this->_json(1, '操作成功', array('url' => dr_url('app/edit', array('id'=> $id))));
        }

        $data = array(
            'value' => array(
                'file' => '/api/ucsso/api.php'
            )
        );

        $this->template->assign(array(
            'name' => '添加网站',
            'data' => $data,
        ));
        $this->template->display('app_add.html');
	}

	public function edit()
	{

        $id = (int)$this->input->get('id');

        if (IS_POST) {

            $post = $this->input->post('data');
            if (!$post['name']) {
                $this->_json(0, '网站名称不能为空');
            } elseif (!$post['url']) {
                $this->_json(0, '网站地址不能为空');
            } elseif (!$post['key']) {
                $this->_json(0, '通信密钥不能为空');
            }

            $post['value'] = dr_array2string($post['value']);
            $this->db->where('id', $id)->update('app', $post);

            $this->_json(1, '操作成功');
        }

        $data = $this->db->where('id', $id)->get('app')->row_array();
        if (!$data) {
            $this->_admin_msg(0, '数据不存在');
        }

        $data['value'] = dr_string2array($data['value']);



        $this->template->assign(array(
            'name' => '修改网站',
            'code' => $this->_get_code($data),
            'data' => $data,
        ));
        $this->template->display('app_add.html');
	}

	function del() {

        $ids = $this->input->post('ids');
        !$ids && $this->_json(0, '未选择数据！');

        $this->db->where_in('id', $ids)->delete('app');

        $this->_json(1, '操作成功');
    }

    /**
     * 生成安全码
     */
    public function syskey() {
        echo 'FC'.strtoupper(substr((md5(SYS_TIME)), rand(0, 10), 20));exit;
    }

    // 获取通信配置代码
    private function _get_code($data) {

        $code = '<?php'.PHP_EOL.PHP_EOL;
        $code.= '!defined("IS_UCSSO") && exit("error");'.PHP_EOL.PHP_EOL;
        $code.= 'define("UCSSO_API", "'.SITE_URL.'");'.PHP_EOL;
        $code.= 'define("UCSSO_APP_ID", "'.$data['id'].'");'.PHP_EOL;
        $code.= 'define("UCSSO_APP_IP", "'.$data['ip'].'");'.PHP_EOL;
        $code.= 'define("UCSSO_APP_KEY", "'.$data['key'].'");'.PHP_EOL;

        return $code;
    }
}
