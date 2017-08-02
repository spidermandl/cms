<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends MY_Controller
{

	public function index()
	{

        switch ($this->action) {

            case 'delete':
                if (!$this->param['uid']) {
                    $this->_json(0, '参数为空');
                }
                foreach ($this->param['uid'] as $uid) {
                    $index = $this->db->where('app', $this->app_id)->where('uid', $uid)->get('uid')->row_array();
                    if ($index) {
                        $this->db->where('id', $index['id'])->delete('uid');
                        $id = $index['mid'];
                        //@unlink(FCPATH.'avatar/'.$id.'.jpg');
                    }
                }
                $this->_json(1, 'ok');
                break;

            case 'avatar':
                $member =$this->get_member_by_uid($this->app_id, $this->param['uid']);
                if (!$member) {
                    $this->_json(0, '用户不存在');
                } elseif (!$this->param['code']) {
                    $this->_json(0, '头像无内容');
                }
                $file = FCPATH.'avatar/'.$member['id'].'.jpg';
                $size = @file_put_contents($file, $this->param['code']);
                !$size && $this->_json(0, '头像存储失败');
                !is_file($file) && $this->_json(0, '头像存储失败');
                if (!getimagesize($file)) {
                    @unlink($file);
                    $this->_json(0, '文件不是规范的图片');
                }
                $this->_json(1, 'ok');
                break;

            case 'get_password':
                $member =$this->get_member_by_uid($this->app_id, $this->param['uid']);
                if (!$member) {
                    $this->_json(0, '用户不存在');
                }
                $this->_json(1, 'ok', array(
                    'salt' => $member['salt'],
                    'password' => $member['password'],
                ));
                break;

            case 'edit_password':

                $member =$this->get_member_by_uid($this->app_id, $this->param['uid']);
                if (!$member) {
                    $this->_json(0, '用户不存在');
                } elseif (!$this->param['password']) {
                    $this->_json(0, '密码不能为空');
                }
                $salt = rand(100000, 999999);
                $this->db->where('id', $member['id'])->update('member', array(
                    'salt' => $salt,
                    'password' => md5(md5($this->param['password']).$salt.md5($this->param['password']))
                ));
                $this->_json(1, '修改成功');
                break;

            case 'edit_email':

                $member =$this->get_member_by_uid($this->app_id, $this->param['uid']);
                if (!$member) {
                    $this->_json(0, '用户不存在');
                } elseif (!$this->param['email']) {
                    $this->_json(0, '邮箱不能为空');
                } elseif ($this->db->where('email', $this->param['email'])->count_all_results('member')) {
                    $this->_json(0, '邮箱已经注册');
                }
                $this->db->where('id', $member['id'])->update('member', array(
                    'email' => $this->param['email'],
                ));
                $this->_json(1, '修改成功');
                break;

            case 'edit_phone':

                $member =$this->get_member_by_uid($this->app_id, $this->param['uid']);
                if (!$member) {
                    $this->_json(0, '用户不存在');
                } elseif (!$this->param['phone']) {
                    $this->_json(0, '手机号码不能为空');
                } elseif ($this->db->where('phone', $this->param['phone'])->count_all_results('member')) {
                    $this->_json(0, '手机号码已经注册');
                }
                $this->db->where('id', $member['id'])->update('member', array(
                    'phone' => $this->param['phone'],
                ));
                $this->_json(1, '修改成功');
                break;

            case 'syncuid':

                if ($this->db->where('app', $this->app_id)->where('uid', (int)$this->param['uid'])->count_all_results('uid')) {
                    $this->_json(0, 'uid已经同步过');
                } elseif (!$this->param['id']) {
                    $this->_json(0, 'ucss_id不存在');
                }

                $this->db->insert('uid', array(
                    'uid' => (int)$this->param['uid'],
                    'mid' => (int)$this->param['id'],
                    'app' => $this->app_id,
                ));
                $id = $this->db->insert_id();
                if (!$id) {
                    $this->_json(0, '同步失败');
                }

                $this->_json(1, '同步成功');

                break;

            case 'login':

                /*
                     1:表示用户登录成功
                    -1:用户名不合法
                    -2:密码不合法
                    -3:用户名不存在
                    -4:密码不正确
                */
                if (!$this->param['username']) {
                    $this->_json(-1, '用户名不能为空');
                } elseif (!$this->param['password']) {
                    $this->_json(-2, '密码不能为空');
                }
                $member = $this->db->where('username', $this->param['username'])->get('member')->row_array();
                if (!$member) {
                    $this->_json(-3, '用户名不存在');
                } elseif (md5(md5($this->param['password']).$member['salt'].md5($this->param['password'])) != $member['password']) {
                    $this->_json(-4, '密码不正确');
                }
                $uid = 0;
                $index = $this->db->where('app', $this->app_id)->where('mid', $member['id'])->get('uid')->row_array();
                if ($index) {
                    $uid = $index['uid'];
                }
                $this->_json(1, '登录成功', array(
                    'uid' => $uid,
                    'ucsso_id' => $member['id'],
                    'email' => $member['email'],
                    'phone' => $member['phone'],
                ));
                break;

            case 'register':

                /*
                    大于 0:返回用户 ID，表示用户注册成功
                     0:失败
                    -1:用户名不合法
                    -2:用户名已经存在
                    -3:Email 格式有误
                    -4:该 Email 已经被注册
                    -5:该 手机号码 格式有误
                    -6:该 手机号码 已经被注册
                */

                if (!$this->param['username']) {
                    $this->_json(-1, '用户名不合法');
                } elseif ($this->db->where('username', $this->param['username'])->count_all_results('member')) {
                    $this->_json(-2, '此用户名可直接登录');
                } elseif ($this->uconfig['email'] && $this->db->where('email', $this->param['email'])->count_all_results('member')) {
                    $this->_json(-4, '邮箱已经被注册');
                } elseif ($this->uconfig['phone'] && $this->db->where('phone', $this->param['phone'])->count_all_results('member')) {
                    $this->_json(-6, '手机号码已经被注册');
                }

                $salt = rand(100000, 999999);
                $this->db->insert('member', array(
                    'username' => (string)$this->param['username'],
                    'email' => (string)$this->param['email'],
                    'phone' => (string)$this->param['phone'],
                    'password' => md5(md5($this->param['password']).$salt.md5($this->param['password'])),
                    'salt' => $salt,
                    'regtime' => SYS_TIME,
                    'content' => '',
                ));
                $id = $this->db->insert_id();
                if (!$id) {
                    $this->_json(0, '注册失败');
                }

                $this->_json($id, '注册成功');
                break;

            case 'synlogout':
                // 同步退出
                $synstr = '';
                foreach ($this->app as $appid => $app) {
                    foreach($app['url'] as $extraurl) {
                        if($appid != $this->app_id) {
                            $synstr .= '<script type="text/javascript" src="' . $extraurl . '?time=' . SYS_TIME . '&action=synlogout&&code=' . urlencode(ucsso_authcode("&time=" . SYS_TIME, 'ENCODE', $app['key'])) . '" reload="1"></script>';
                        }
                    }
                }
                exit($synstr);
                break;

            case 'synlogin':
                // 同步登录
                $synstr = '';
                if ($member =$this->get_member_by_uid($this->app_id, $this->param['uid'])) {
                    foreach ($this->app as $appid => $app) {
                        if($appid != $this->app_id) {
                            foreach($app['url'] as $extraurl) {
                                $synstr.= '<script type="text/javascript" src="'.$extraurl.'?time='.SYS_TIME.'&action=synlogin&&code='.urlencode(ucsso_authcode('username='.$member['username'].'&uid='.$this->param['uid'].'&password='.$member['password']."&time=".SYS_TIME, 'ENCODE', $app['key'])).'" reload="1"></script>';
                            }
                        }

                    }
                }
                exit($synstr);
                break;


        }

	}
}


