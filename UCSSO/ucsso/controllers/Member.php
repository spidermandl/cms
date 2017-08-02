<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Member extends MY_Controller
{

	public function index()
	{

        $param = array(
            'keyword' => $_GET['keyword'],
        );

        $page = max(1, (int)$this->input->get('page'));
        $total = (int)$this->input->get('total');


        $where = '1=1';

        if ($param['keyword']) {
            $where = '(username LIKE "%'.$param['keyword'].'%" or email LIKE "%'.$param['keyword'].'%" or phone LIKE "%'.$param['keyword'].'%")';
        }


        if (!$total) {
            $data	= $this->db->select('count(*) as total')->where($where)->get('member')->row_array();
            $total = (int)$data['total'];
        }

        $psize = 10;
        $list = $this->db->limit($psize, $psize * ($page - 1))->where($where)->order_by('id desc')->get('member')->result_array();


        $this->template->assign(array(
            'list' => $list,
            'total' => $total,
            'pages'	=> $this->get_pagination(dr_url($this->router->class.'/'.$this->router->method, $param), $total, $psize),
            'param' => $param,
        ));
        $this->template->display('member_index.html');
	}

    public function add()
    {

        $id = 0;

        if (IS_POST) {

            $post = $this->input->post('data');
            if (!$post['email']) {
                $this->_json(0, '邮箱不能为空');
            } elseif (!$post['username']) {
                $this->_json(0, '用户名不能为空');
            } elseif (!$post['phone']) {
                $this->_json(0, '手机号码不能为空');
            } elseif (strlen($post['phone'])!=11) {
                $this->_json(0, '手机号码格式不正确');
            } elseif (!preg_match('/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/', $post['email'])) {
                $this->_json(0, '邮箱格式不正确');
            } elseif ($this->db->where('id<>'.$id)->where('email', $post['email'])->count_all_results('member')) {
                $this->_json(0, '邮箱已被注册');
            } elseif ($this->db->where('id<>'.$id)->where('phone', $post['phone'])->count_all_results('member')) {
                $this->_json(0, '手机号码已被注册');
            } elseif ($this->db->where('id<>'.$id)->where('username', $post['username'])->count_all_results('member')) {
                $this->_json(0, '账号已被注册');
            }

            $password = $this->input->post('password');
            if (!$password) {
                $this->_json(0, '密码不能为空');
            }

            $post['salt'] = rand(1000, 99999);
            $post['password'] = md5(md5($password).$post['salt'].md5($password));
            $post['regtime'] = SYS_TIME;
            $post['content'] = '';

            $this->db->insert('member', $post);
            $id = $this->db->insert_id();
            !$id && $this->_json(0, '存储失败');

            $this->_json(1, '操作成功', array('url' => dr_url('member/index', array('id'=> $id))));
        }

        $data = array(

        );

        $this->template->assign(array(
            'name' => '添加用户',
            'data' => $data,
        ));
        $this->template->display('member_add.html');
    }

    public function edit()
    {

        $id = (int)$this->input->get('id');

        if (IS_POST) {

            $post = $this->input->post('data');
            if (!$post['email']) {
                $this->_json(0, '邮箱不能为空');
            } elseif (!$post['phone']) {
                $this->_json(0, '手机号码不能为空');
            } elseif (strlen($post['phone'])!=11) {
                $this->_json(0, '手机号码格式不正确');
            } elseif (!preg_match('/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/', $post['email'])) {
                $this->_json(0, '邮箱格式不正确');
            } elseif ($this->db->where('id<>'.$id)->where('email', $post['email'])->count_all_results('member')) {
                $this->_json(0, '邮箱已被注册');
            } elseif ($this->db->where('id<>'.$id)->where('phone', $post['phone'])->count_all_results('member')) {
                $this->_json(0, '手机号码已被注册');
            }

            unset($post['username']);
            $password = $this->input->post('password');
            if ($password) {
                $post['salt'] = rand(1000, 99999);
                $post['password'] = md5(md5($password).$post['salt'].md5($password));
            }
            $this->db->where('id', $id)->update('member', $post);

            $this->_json(1, '操作成功');
        }

        $data = $this->db->where('id', $id)->get('member')->row_array();
        if (!$data) {
            $this->_admin_msg(0, '数据不存在');
        }


        $this->template->assign(array(
            'name' => '修改用户',
            'data' => $data,
        ));
        $this->template->display('member_add.html');
    }

    function del() {

        $ids = $this->input->post('ids');
        !$ids && $this->_json(0, '未选择数据！');

        $this->db->where_in('id', $ids)->delete('member');
        $this->db->where_in('mid', $ids)->delete('uid');

        $this->_json(1, '操作成功');
    }
}
