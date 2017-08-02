<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller
{

	public function index()
	{

        $app = dr_get_cache('app');
        $this->template->assign(array(
            'app' => $app,
            'apps' => count($app),
            'members' => $this->db->count_all_results('member'),
        ));
        $this->template->display('index.html');
	}
}
