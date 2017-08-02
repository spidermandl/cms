<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller
{

	public function index()
	{

        $data = array(
            'username' => '',
            'password' => '',
        );

        if (IS_POST) {
            $data = $this->input->post('data', true);
            if (!$data['username']) {
                $error = '账号不能为空';
            } elseif (!$data['password']) {
                $error = '密码不能为空';
            } else {
                $error = $this->_admin_login($data);
            }
            if (!$error) {
                $this->_json(1, '登录成功');
            }
            $this->_json(0, $error);
            exit;
        }

        $this->template->assign(array(
            'data' => $data,
            'meta_title' => '管理员登录',
        ));
        $this->template->display('login.html');
	}
}
