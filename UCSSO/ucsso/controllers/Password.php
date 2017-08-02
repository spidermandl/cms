<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Password extends MY_Controller
{

	public function index()
	{

        if (IS_POST) {

            $password = $this->input->post('password');
            if (!$password) {
                $this->_json(0, '密码不能为空');
            }

            $post['salt'] = rand(1000, 99999);
            $post['password'] = md5(md5($password).$post['salt'].md5($password));

            $this->db->where('id', $this->admin['id'])->update('admin', $post);

            $this->_json(1, '操作成功');
        }

        $data = array(

        );

        $this->template->assign(array(
            'name' => $this->admin['username'],
            'data' => $data,
        ));
        $this->template->display('password_index.html');
	}

}
