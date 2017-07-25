<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');



require FCPATH.'branch/fqb/D_File.php';

class Tpl extends D_File {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->path = $this->router->method == 'mobile' || $this->input->get('ismb') ? TPLPATH.'mobile/member/' : TPLPATH.'pc/member/';
        $this->template->assign(array(
			'path' => $this->path,
			'furi' => 'member/tpl/',
			'auth' => 'member/admin/tpl/',
			'menu' => $this->get_menu(array(
				fc_lang('模板管理') => 'member/admin/tpl/index',
				fc_lang('移动端模板') => 'member/admin/tpl/mobile',
				fc_lang('标签向导') => 'member/admin/tpl/tag',
			)),
            'ismb' => $this->router->method == 'mobile' ? 1 : 0,
		));
    }
	
}